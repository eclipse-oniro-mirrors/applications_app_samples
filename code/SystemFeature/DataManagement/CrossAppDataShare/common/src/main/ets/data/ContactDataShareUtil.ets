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

import dataShare from '@ohos.data.dataShare'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import { BASE_URI, COLUMNS } from '../utils/Consts'
import { Contact, getListFromResultSet } from '../model/Contact'
import { logger } from '../utils/Logger'
import { ValuesBucket } from '@ohos.data.ValuesBucket'

const TAG: string = 'ContactDataOperations'

class ContactDataShareUtil {
  private dataShareHelper: dataShare.DataShareHelper | undefined = undefined

  async createDataShareHelper(context: Context): Promise<void> {
    if (this.dataShareHelper === null || this.dataShareHelper === undefined) {
      this.dataShareHelper = await dataShare.createDataShareHelper(context, BASE_URI)
    }
  }

  async queryAllContacts(context: Context): Promise<Contact[]> {
    logger.info(TAG, `queryAll start`)
    await this.createDataShareHelper(context)
    if (this.dataShareHelper === undefined) {
      return []
    }
    let predicates = new dataSharePredicates.DataSharePredicates()
    let resultSet = await this.dataShareHelper.query(BASE_URI, predicates, COLUMNS)
    logger.info(TAG, `queryAll resultSet= ${resultSet.rowCount}`)
    return getListFromResultSet(resultSet)
  }

  async searchContactsFromName(context: Context, searchText: string): Promise<Contact[]> {
    logger.info(TAG, `searchContactsFromName start`)
    await this.createDataShareHelper(context)
    if (this.dataShareHelper === undefined) {
      return []
    }
    let predicates = new dataSharePredicates.DataSharePredicates()
    predicates.contains('name', searchText)
    let resultSet = await this.dataShareHelper.query(BASE_URI, predicates, COLUMNS)
    logger.info(TAG, `searchContactsFromName resultSet= ${resultSet.rowCount}`)
    return getListFromResultSet(resultSet)
  }

  async insert(context: Context, valueBucket: ValuesBucket): Promise<void> {
    logger.info(TAG, `insert onClick`)
    await this.createDataShareHelper(context)
    if (this.dataShareHelper === undefined) {
      return
    }
    let insertId = await this.dataShareHelper.insert(BASE_URI, valueBucket)
    logger.info(TAG, `insert succeed, data : ${insertId}`)
    await this.dataShareHelper.notifyChange(BASE_URI)
  }

  async delete(context: Context, contactId: number): Promise<void> {
    logger.info(TAG, `delete onClick`)
    await this.createDataShareHelper(context)
    if (this.dataShareHelper === undefined) {
      return
    }
    let predicates = new dataSharePredicates.DataSharePredicates()
    predicates.equalTo('id', contactId)
    await this.dataShareHelper.delete(BASE_URI, predicates)
    await this.dataShareHelper.notifyChange(BASE_URI)
  }

  async update(context: Context, contactId: number, valueBucket: ValuesBucket): Promise<void> {
    logger.info(TAG, `update onClick`)
    await this.createDataShareHelper(context)
    if (this.dataShareHelper === undefined) {
      return
    }
    let predicates = new dataSharePredicates.DataSharePredicates()
    predicates.equalTo('id', contactId)
    await this.dataShareHelper.update(BASE_URI, predicates, valueBucket)
    await this.dataShareHelper.notifyChange(BASE_URI)
  }

  async onDataChange(context: Context, callback: () => void): Promise<void> {
    await this.createDataShareHelper(context)
    if (this.dataShareHelper === undefined) {
      return
    }
    this.dataShareHelper.on('dataChange', BASE_URI, callback)
  }

  async offDataChange(context: Context): Promise<void> {
    await this.createDataShareHelper(context)
    if (this.dataShareHelper === undefined) {
      return
    }
    this.dataShareHelper.off('dataChange', BASE_URI)
  }

  async clearData(context: Context): Promise<void> {
    await this.createDataShareHelper(context)
    if (this.dataShareHelper === undefined) {
      return
    }
    let predicates = new dataSharePredicates.DataSharePredicates()
    predicates.isNotNull('name')
    try {
      await this.dataShareHelper.delete(BASE_URI, predicates)
      await this.dataShareHelper.notifyChange(BASE_URI)
    } catch (err) {
      logger.error(TAG, `clear error: ${JSON.stringify(err)}`)
    }
  }

  async batchInsert(context: Context, contacts: Contact[]): Promise<void> {
    await this.createDataShareHelper(context)
    if (this.dataShareHelper === undefined) {
      return
    }
    let valuesBuckets: ValuesBucket[] = []
    contacts.forEach((item: Contact) => {
      let valuesBucket: ValuesBucket = {
        name: item.name,
        phone: item.phone,
        email: item.email,
        address: item.address,
        remark: item.remark
      }
      valuesBuckets.push(valuesBucket)
    })
    try {
      await this.dataShareHelper.batchInsert(BASE_URI, valuesBuckets)
      await this.dataShareHelper.notifyChange(BASE_URI)
      logger.info(TAG, 'batchInsert finish')
    } catch (err) {
      logger.error(TAG, `batchInsert error: ${JSON.stringify(err)}`)
    }
  }
}

export const contactDataShareUtil = new ContactDataShareUtil()
