import { storageBucket, projectId } from '../config'
import * as admin from 'firebase-admin'

admin.initializeApp({
  projectId,
  storageBucket
})

import * as testing from '@firebase/testing'
import groupsJson from './seed/groups.json'
import { Choice } from '../model/choice'

export async function initialize(isTesting: boolean) {
  // // Clear all
  // await testing.clearFirestoreData({ projectId })

  const firestore = getFirestore({ isTesting: isTesting ?? true })

  const groups = Object.entries(groupsJson).entries()
  for (const [, [groupKey, group]] of groups) {
    const groupRef = firestore.collection('groups').doc(groupKey)
    await groupRef.set({
      name: group.name
    })

    const choicesRef = groupRef.collection('choices')
    const choices = Object.entries(group.choices).entries()
    for (const [, [choiceKey, choiceSeed]] of choices) {
      const choice: Choice = { ...choiceSeed, imageUrl: '' }
      await choicesRef.doc(choiceKey).set(choice)
    }
  }
}

function getFirestore(args: {
  isTesting: boolean
}): testing.firestore.Firestore {
  if (args.isTesting) {
    const app = testing.initializeAdminApp({ projectId })
    return app.firestore()
  } else {
    return (admin.firestore() as unknown) as testing.firestore.Firestore
  }
}
