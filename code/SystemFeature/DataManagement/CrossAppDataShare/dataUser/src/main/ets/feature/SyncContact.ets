/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import PreferencesStore from '../utils/Preferences'
import ContactStore from './ContactStore'
import { Contact, contactDataShareUtil, logger, SYNC_STATE } from '@ohos/common'

const TAG: string = 'syncContact'

export async function syncContact(context: Context): Promise<Contact[]> {
  let syncState = await PreferencesStore.get('syncState', SYNC_STATE.OVERWRITE_CONTACT_ASSISTANT)
  let contacts: Contact[] = []
  await ContactStore.getRdbStore(context)
  if (syncState === SYNC_STATE.OVERWRITE_CONTACT_ASSISTANT) {
    contacts = await contactDataShareUtil.queryAllContacts(context)
    if (contacts.length > 0) {
      await ContactStore.clearData()
      await ContactStore.batchInsert(contacts)
      contacts = await ContactStore.queryAll()
    }
    return contacts
  } else if (syncState === SYNC_STATE.OVERWRITE_CONTACT) {
    contacts = await ContactStore.queryAll()
    if (contacts.length > 0) {
      await contactDataShareUtil.clearData(context)
      await contactDataShareUtil.batchInsert(context, contacts)
    }
    return contacts
  } else {
    let localContacts = await ContactStore.queryAll()
    let distalContacts = await contactDataShareUtil.queryAllContacts(context)
    logger.info(TAG, `localContacts.length = ${localContacts.length}, distalContacts.length = ${distalContacts.length}`)
    if (localContacts.length === 0 && distalContacts.length === 0) {
      logger.info(TAG, `two is null`)
      return []
    } else if (localContacts.length === 0 && distalContacts.length > 0) {
      logger.info(TAG, `localContacts is null`)
      await ContactStore.batchInsert(distalContacts)
      contacts = await ContactStore.queryAll()
      return contacts
    } else if (localContacts.length > 0 && distalContacts.length === 0) {
      logger.info(TAG, `distalContacts is null`)
      contacts = localContacts
      await contactDataShareUtil.batchInsert(context, contacts)
      return contacts
    } else {
      logger.info(TAG, `removeDuplicates`)
      contacts = removeDuplicates(localContacts, distalContacts)
      logger.info(TAG, `removeDuplicates result ${JSON.stringify(contacts)}`)
      await contactDataShareUtil.clearData(context)
      await contactDataShareUtil.batchInsert(context, contacts)
      await ContactStore.clearData()
      await ContactStore.batchInsert(contacts)
      contacts = await ContactStore.queryAll()
      return contacts
    }
  }
}

function removeDuplicates(localContacts: Contact[], distalContacts: Contact[]): Contact[] {
  let resultContacts: Contact[] = []
  let tempList: number[] = []
  localContacts.forEach((item: Contact) => {
    resultContacts.push(item)
  })
  distalContacts.forEach((item: Contact, index: number) => {
    let contact: Contact = {
      id: item.id,
      name: item.name,
      phone: item.phone,
      email: item.email,
      address: item.address,
      remark: item.remark
    }
    resultContacts.forEach((item1: Contact, index1: number) => {
      if (item1.name === contact.name) {
        let localPhones = item1.phone.split(',')
        let distalPhones = contact.phone.split(',')
        distalPhones.forEach((phone: string) => {
          if (localPhones.indexOf(phone) == -1) {
            localPhones.push(phone)
          }
        })
        contact.phone = ''
        for (let k = 0; k < localPhones.length; k++) {
          contact.phone += localPhones[k]
          if (k < localPhones.length - 1) {
            contact.phone += ','
          }
        }
        resultContacts[index1] = contact
        tempList.push(index)
      }
    })
  })
  distalContacts.forEach((item: Contact, index: number) => {
    if (tempList.indexOf(index) == -1) {
      resultContacts.push(item)
    }
  })
  logger.info(TAG, `removeDuplicates resultContacts = ${resultContacts.length}`)
  return resultContacts
}
