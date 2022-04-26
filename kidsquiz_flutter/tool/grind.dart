import 'dart:io';

import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';
import 'package:io/io.dart' as io;
import 'package:path/path.dart' as path;

void main(List<String> args) => grind(args);

@Task('Get packages')
Future<void> pubGet({String? directory}) async {
  run(
    'flutter',
    arguments: ['pub', 'get', if (directory != null) directory],
  );
}

@Task('Deploy Web')
Future<void> deployWeb() async {
  await _deployWeb(_WebAppType.app);
}

@Task('Deploy Web Tesla')
Future<void> deployWebTesla() async {
  await _deployWeb(_WebAppType.tesla);
}

Future<void> _deployWeb(_WebAppType type) async {
  await _build(
    buildTarget: _BuildTarget.web,
    webAppType: type,
  );
  final typeString = type.name;
  const firebasePath = '../kidsquiz_firebase/';
  final targetDir = Directory(
    path.join(
      firebasePath,
      'public/$typeString',
    ),
  );
  log('targetDir: $targetDir');

  if (targetDir.existsSync()) {
    targetDir.deleteSync(recursive: true);
  }
  io.copyPathSync(
    'build/web',
    targetDir.path,
  );

  Directory.current = firebasePath;

  run(
    'firebase',
    arguments: [
      'deploy',
      '--only',
      'hosting:$typeString',
    ],
  );
}

Future<void> _build({
  required _BuildTarget buildTarget,
  required _WebAppType webAppType,
}) async {
  run(
    'flutter',
    arguments: [
      'build',
      buildTarget.name,
      if (buildTarget == _BuildTarget.web) ...[
        '--web-renderer',
        // https://twitter.com/_mono/status/1510937246773702658
        'canvaskit',
      ],
      if (webAppType == _WebAppType.tesla) '--dart-define=TESLA=true',
    ],
  );
}

@Task('Bump Build Number')
Future<void> bumpBuildNumber() async {
  run(
    'cider',
    arguments: ['bump', 'build'],
  );
  run(
    'git',
    arguments: ['add', '--all'],
  );
  run(
    'git',
    arguments: [
      'commit',
      '-m',
      'Bump up build number',
    ],
  );
}

@Task()
Future<void> pushTag() async {
  final version = run(
    'cider',
    arguments: ['version'],
  );
  log('version: $version');
  final tag = 'builds/$version'.trim();
  log('tag: $tag');
  run('git', arguments: ['tag', tag]);
  run('git', arguments: ['push', 'origin', tag]);
}

@DefaultTask()
//@Depends(test)
void build() {
  log('build');
}

@Task()
void clean() => defaultClean();

@Task('Open Upgraded Package Changelog')
void openUpgradedPackageChangelog() {
  _openUpgradedPackageChangelog(
    [
      '.',
    ],
  );
}

void _openUpgradedPackageChangelog(List<String> directories) {
  final nameRegex = RegExp('       name: (.+)\n');
  final versionRegex = RegExp(r'\+    version: "(.+)"');
  final preReleaseRegex = RegExp(r'\d+\.\d+.\d+-.+');
  final urls = Set.of(
    directories.map((directory) {
      final diff = run(
        'git',
        arguments: [
          'diff',
          './$directory/pubspec.lock',
        ],
      );
      final packages = diff.split('@@');

      return packages.map((package) {
        final nameMatch = nameRegex.firstMatch(package);
        final versionMatch = versionRegex.firstMatch(package);
        if (nameMatch == null || versionMatch == null) {
          return null;
        }
        final name = nameMatch.group(1)!;
        final version = versionMatch.group(1)!;
        final versionAdjusted = version.replaceAll(RegExp(r'\.|\+'), '');
        final isPreRelease = preReleaseRegex.firstMatch(version) != null;
        final preReleasePath = isPreRelease ? '/versions/$version' : '';
        return 'https://pub.dev/packages/$name$preReleasePath/changelog#$versionAdjusted';
      }).whereNotNull();
    }).expand((e) => e),
  );

  for (final url in urls) {
    run('open', arguments: [url]);
  }
}

enum _BuildTarget {
  // ipa,
  // appbundle,
  // apk,
  web,
}

enum _WebAppType {
  app,
  tesla,
}
