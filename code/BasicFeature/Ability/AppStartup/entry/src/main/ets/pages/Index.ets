/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { RdbStoreUtil, SingleKVStoreUtil } from '../util/SingleKVStore';
import distributedKVStore from '@ohos.data.distributedKVStore';
import { BusinessError } from '@ohos.base';
import relationalStore from '@ohos.data.relationalStore';
import startupManager from '@ohos.app.appstartup.startupManager';
import router from '@ohos.router';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';

@Entry
@Component
struct Index {
  @StorageLink('image') image: PixelMap | undefined = undefined;
  @State fileStr: string = 'fileStr';
  @State kvStoreStr: string = 'kvStoreStr';
  @State rdbStoreStr: string = 'rdbStoreStr';

  aboutToAppear(): void {
    this.readFile();
    this.getKvStoreData();
    this.getRdbStoreData();
  }

  readFile() {
    let filesDir = getContext().filesDir;
    let file = fs.openSync(filesDir + '/destFile.txt', fs.OpenMode.READ_WRITE);
    // 从文件读取一段内容
    let arrayBuffer = new ArrayBuffer(1024);

    class Option {
      public offset: number = 0;
      public length: number = 0;
    };

    let option = new Option();
    option.length = arrayBuffer.byteLength;
    let readLen = fs.readSync(file.fd, arrayBuffer, option);
    let buf = buffer.from(arrayBuffer, 0, readLen);
    this.fileStr = buf.toString();
    // 关闭文件
    fs.closeSync(file);
  }

  getKvStoreData() {
    SingleKVStoreUtil.getKVStore()
      .then((kvStore: distributedKVStore.SingleKVStore) => {
        const KEY_TEST_STRING_ELEMENT = 'key_test_string';
        kvStore.get(KEY_TEST_STRING_ELEMENT, (err, data) => {
          if (err != undefined) {
            hilog.error(DOMAIN, TAG, 'Failed to get data, code: %{public}d, message: %{public}s', err.code, err.message);
            return;
          }
          this.kvStoreStr = data as string;
          hilog.info(DOMAIN, TAG, 'Succeeded in getting data, data: %{public}s', JSON.stringify(data));
        });
      }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to create KVManager, message: %{public}s', JSON.stringify(err));
    });
  }

  getRdbStoreData() {
    RdbStoreUtil.getRdbStore(getContext())
      .then((rdbStore: relationalStore.RdbStore) => {

        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.equalTo('NAME', 'Lisa');

        rdbStore.query(predicates, ['ID', 'NAME', 'AGE', 'SALARY'], (err: BusinessError, resultSet) => {
          if (err) {
            hilog.error(DOMAIN, TAG, 'Failed to query data, code: %{public}d, message: %{public}s', err.code, err.message);
            return;
          }
          hilog.info(DOMAIN, TAG, 'ResultSet column names: %{public}s, column count: %{public}d',
            JSON.stringify(resultSet.columnNames), resultSet.columnCount);
          // resultSet是一个数据集合的游标，默认指向第-1个记录，有效的数据从0开始。
          while (resultSet.goToNextRow()) {
            const id = resultSet.getLong(resultSet.getColumnIndex('ID'));
            const name = resultSet.getString(resultSet.getColumnIndex('NAME'));
            const age = resultSet.getLong(resultSet.getColumnIndex('AGE'));
            const salary = resultSet.getDouble(resultSet.getColumnIndex('SALARY'));
            hilog.info(DOMAIN, TAG, 'id=%{public}d, name=%{public}s, age=%{public}d, salary=%{public}f',
              id, name, age, salary);
            this.rdbStoreStr = `id=${id}, name=${name}, age=${age}, salary=${salary}`;
          }
          // 释放数据集的内存
          resultSet.close();
        })
      }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, TAG, 'Failed to create KVManager, message: %{public}s', JSON.stringify(err));
    });
  }

  build() {
    Column() {
      Button($r('app.string.Manual_mode'))
        .size({ width: 100, height: 100 })
        .onClick(() => {
          if (!startupManager.isStartupTaskInitialized('ImageKnifeTask')) {
            let startParams = ['ImageKnifeTask'];
            try {
              startupManager.run(startParams).then(() => {
                router.pushUrl({ url: 'pages/ImageKnife' })
              }).catch((error: BusinessError) => {
                hilog.error(DOMAIN, TAG, 'startup run failed, error: %{public}s, startParams: %{public}s',
                  JSON.stringify(error), JSON.stringify(startParams));
              })
            } catch (error) {
              let errMsg = JSON.stringify(error);
              let errCode: number = error.code;
              hilog.error(DOMAIN, TAG, 'startup run catch error, errCode: %{public}d, error: %{public}s',
                errCode, errMsg);
            }
          }

        })
      Text(this.fileStr)
      Text(this.kvStoreStr)
      Text(this.rdbStoreStr)
        .margin({ top: 30 })

      Image(this.image).margin({ top: 30 }).width(300)
        .height(300)

    }
    .height('100%')
    .width('100%')
  }
}