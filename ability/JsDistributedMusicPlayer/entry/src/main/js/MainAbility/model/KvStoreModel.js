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

import distributedData from '@ohos.data.distributedData';

const STORE_ID = 'musicplayer_kvstore';

export default class KvStoreModel {
  kvManager;
  kvStore;

  constructor() {
  }

  createKvStore(callback) {
    if (typeof (this.kvStore) === 'undefined') {
      var config = {
        bundleName: 'ohos.samples.distributedmusicplayer',
        userInfo: {
          userId: '0',
          userType: 0
        }
      };
      let self = this;
      console.info('MusicPlayer[KvStoreModel] createKVManager begin');
      distributedData.createKVManager(config).then((manager) => {
        console.debug('MusicPlayer[KvStoreModel] createKVManager success, kvManager=' + JSON.stringify(manager));
        self.kvManager = manager;
        var options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: 1,
          schema: '',
          securityLevel: 3,
        };
        console.info('MusicPlayer[KvStoreModel] kvManager.getKVStore begin');
        self.kvManager.getKVStore(STORE_ID, options).then((store) => {
          console.debug('MusicPlayer[KvStoreModel] getKVStore success, kvStore=' + store);
          self.kvStore = store;
          callback();
        });
        console.info('MusicPlayer[KvStoreModel] kvManager.getKVStore end');
      });
      console.info('MusicPlayer[KvStoreModel] createKVManager end');
    } else {
      callback();
    }
  }

  broadcastMessage(msg) {
    console.debug('MusicPlayer[KvStoreModel] broadcastMessage ' + msg);
    var num = Math.random();
    let self = this;
    this.createKvStore(() => {
      self.put(msg, num);
    });
  }

  put(key, value) {
    console.debug('MusicPlayer[KvStoreModel] kvStore.put ' + key + '=' + value);
    this.kvStore.put(key, value).then((data) => {
      this.kvStore.get(key).then((data) => {
        console.debug('MusicPlayer[KvStoreModel] kvStore.get ' + key + '=' + JSON.stringify(data));
      });
      console.debug('MusicPlayer[KvStoreModel] kvStore.put ' + key + ' finished, data=' + JSON.stringify(data));
    }).catch((err) => {
      console.error('MusicPlayer[KvStoreModel] kvStore.put ' + key + ' failed, ' + JSON.stringify(err));
    });
  }

  setOnMessageReceivedListener(msg, callback) {
    console.debug('MusicPlayer[KvStoreModel] setOnMessageReceivedListener ' + msg);
    let self = this;
    this.createKvStore(() => {
      console.info('MusicPlayer[KvStoreModel] kvStore.on(dataChange) begin');
      self.kvStore.on('dataChange', 1, (data) => {
        console.debug('MusicPlayer[KvStoreModel] dataChange, ' + JSON.stringify(data));
        console.debug('MusicPlayer[KvStoreModel] dataChange, insert ' + data.insertEntries.length + ' udpate '
        + data.updateEntries.length);
        for (var i = 0; i < data.insertEntries.length; i++) {
          if (data.insertEntries[i].key === msg) {
            console.debug('MusicPlayer[KvStoreModel] insertEntries receive ' + msg + '='
            + JSON.stringify(data.insertEntries[i].value));
            callback();
            return;
          }
        }
        for (i = 0; i < data.updateEntries.length; i++) {
          if (data.updateEntries[i].key === msg) {
            console.debug('MusicPlayer[KvStoreModel] updateEntries receive ' + msg + '='
            + JSON.stringify(data.updateEntries[i].value));
            callback();
            return;
          }
        }
      });
      console.info('MusicPlayer[KvStoreModel] kvStore.on(dataChange) end');
    });
  }
}