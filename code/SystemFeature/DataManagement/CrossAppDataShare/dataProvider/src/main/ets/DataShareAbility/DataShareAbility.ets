/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import rdb from '@ohos.data.relationalStore'
import DataShareExtensionAbility from '@ohos.application.DataShareExtensionAbility'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import { logger, SQL_CREATE_TABLE, STORE_CONFIG, TABLE_NAME } from '@ohos/common'
import type Want from '@ohos.app.ability.Want'
import { AsyncCallback, BusinessError } from '@ohos.base'

const TAG: string = 'DataShareAbility'
let rdbStore: rdb.RdbStore | undefined = undefined

export default class DataShareAbility extends DataShareExtensionAbility {
  onCreate(want: Want, callback: AsyncCallback<void>): void {
    logger.info(TAG, 'onCreate')
    try {
      rdb.getRdbStore(globalThis.context, STORE_CONFIG, (error: BusinessError, data: rdb.RdbStore) => {
        logger.info(TAG, 'DataShareExtAbility getRdbStore done')
        rdbStore = data
        rdbStore.executeSql(SQL_CREATE_TABLE, [], () => {
          logger.info(TAG, 'DataShareExtAbility executeSql done')
          if (callback) {
            (callback as () => void)()
          }
        })
      })
    } catch (error) {
      logger.error(TAG, `getRdbStore error: ${JSON.stringify(error)}`)
    }
  }

  insert(uri: string, valueBucket: rdb.ValuesBucket, callback: AsyncCallback<number>): void {
    logger.info(TAG, `[insert] enter`)
    if (valueBucket === null || valueBucket === undefined) {
      logger.info('[insert] invalid valueBuckets')
      return
    }
    logger.info(TAG, `[insert]  value = ${JSON.stringify(valueBucket)}`)
    if (rdbStore) {
      try {
        rdbStore.insert(TABLE_NAME, valueBucket, callback)
      } catch (error) {
        logger.error(TAG, `insert error: ${JSON.stringify(error)}`)
      }
    }
  }

  delete(uri: string, predicates: dataSharePredicates.DataSharePredicates, callback: AsyncCallback<number>): void {
    logger.info(TAG, `delete`)
    if (rdbStore) {
      try {
        rdbStore.delete(TABLE_NAME, predicates, callback)
      } catch (error) {
        logger.error(TAG, `delete error: ${JSON.stringify(error)}`)
      }
    }
  }

  query(uri: string, predicates: dataSharePredicates.DataSharePredicates, columns: string[],
    callback: AsyncCallback<Object>): void {
    logger.info(TAG, `query enter`)
    if (rdbStore) {
      try {
        rdbStore.query(TABLE_NAME, predicates, columns, (error: BusinessError, resultSet: rdb.ResultSet) => {
          logger.info(TAG, `query ret: ${resultSet}`)
          if (resultSet !== undefined) {
            logger.info(TAG, `query resultSet.rowCount: ${JSON.stringify(resultSet.rowCount)}`)
          }
          if (callback !== undefined) {
            callback(error, resultSet as Object)
          }
        })
      } catch (error) {
        logger.error(TAG, `query error: ${JSON.stringify(error)}`)
      }
    }
  }

  update(uri: string, predicates: dataSharePredicates.DataSharePredicates,
    valueBucket: rdb.ValuesBucket, callback: AsyncCallback<number>): void {
    logger.info(TAG, `update enter`)
    if (predicates === null || predicates === undefined) {
      return
    }
    if (rdbStore) {
      try {
        rdbStore.update(TABLE_NAME, valueBucket, predicates, callback)
      } catch (error) {
        logger.error(TAG, `update error: ${JSON.stringify(error)}`)
      }
    }
  }

  batchInsert(uri: string, valueBuckets: rdb.ValuesBucket[], callback: AsyncCallback<number>): void {
    logger.info(TAG, `batchInsert enter`)
    if (rdbStore) {
      try {
        rdbStore.batchInsert(TABLE_NAME, valueBuckets, callback)
      } catch (error) {
        logger.error(TAG, `batchInsert error: ${JSON.stringify(error)}`)
      }
    }
  }
}
