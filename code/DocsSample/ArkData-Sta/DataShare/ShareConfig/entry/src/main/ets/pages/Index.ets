'use static';
/**
 *
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import {
  Entry,
  Row,
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  TextArea,
  Scroll
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Context, UIContext } from '@ohos.arkui.UIContext';
import dataShare from '@ohos.data.dataShare';

// [Start publish_shared_config]
function publishSharedConfig(): void {
  console.info('publishSharedConfig start');
  dataShare.createDataProxyHandle().then((dataProxyHandle: dataShare.DataProxyHandle) => {
    const newConfigData: dataShare.ProxyData[] = [
      {
        uri: 'datashareproxy://com.samples.shareconfig.static/config1',
        value: 'Value1',
        allowList: [
          'appIdentifier1',
          'appIdentifier2'
        ]
      },
      {
        uri: 'datashareproxy://com.samples.shareconfig.static/config2',
        value: 'Value2',
        allowList: [
          'appIdentifier3',
          'appIdentifier4'
        ]
      }
    ];
    const config: dataShare.DataProxyConfig = {
      type: dataShare.DataProxyType.SHARED_CONFIG,
    };
    dataProxyHandle.publish(newConfigData, config).then((results: dataShare.DataProxyResult[]) => {
      results.forEach((result) => {
        console.info(`URI: ${result.uri}, Result: ${result.result}`);
      });
    }).catch((error: Error) => {
      console.info('Error publishing config:', error);
    });
  }).catch((error: Error) => {
    console.info('Error creating DataProxyHandle:', error);
  });
}
// [End publish_shared_config]

// [Start delete_shared_config]
function deleteSharedConfig() {
  dataShare.createDataProxyHandle().then((dataProxyHandle: dataShare.DataProxyHandle) => {
    const urisToDelete: string[] = [
      'datashareproxy://com.samples.shareconfig.static/config1',
      'datashareproxy://com.samples.shareconfig.static/config2'
    ];
    const config: dataShare.DataProxyConfig = {
      type: dataShare.DataProxyType.SHARED_CONFIG,
    };
    dataProxyHandle.delete(urisToDelete, config).then((results: dataShare.DataProxyResult[]) => {
      results.forEach((result) => {
        console.info(`URI: ${result.uri}, Result: ${result.result}`);
      });
    }).catch((error: Error) => {
      console.info('Error deleting config:', error);
    });
  }).catch((error: Error) => {
    console.info('Error creating DataProxyHandle:', error);
  });
}
// [End delete_shared_config]

// [Start get_shared_config]
function getSharedConfig() {
  dataShare.createDataProxyHandle().then((dataProxyHandle: dataShare.DataProxyHandle) => {
    const urisToGet: string[] = [
      'datashareproxy://com.samples.shareconfig.static/config1',
      'datashareproxy://com.samples.shareconfig.static/config2'
    ];
    const config: dataShare.DataProxyConfig = {
      type: dataShare.DataProxyType.SHARED_CONFIG,
    };
    dataProxyHandle.get(urisToGet, config).then((results: dataShare.DataProxyGetResult[]) => {
      results.forEach((result) => {
        console.info(`URI: ${result.uri}, Result: ${result.result}, AllowList: ${result.allowList}`);
      });
    }).catch((error: Error) => {
      console.info('Error getting config:', error);
    });
  }).catch((error: Error) => {
    console.info('Error creating DataProxyHandle:', error);
  });
}
// [End get_shared_config]

// [Start watch_shared_config]
function watchConfigChanges() {
  dataShare.createDataProxyHandle().then((dsProxyHelper: dataShare.DataProxyHandle) => {
    const uris: string[] = [
      'datashareproxy://com.samples.shareconfig.static/config1',
      'datashareproxy://com.samples.shareconfig.static/config2'
    ];
    const config: dataShare.DataProxyConfig = {
      type: dataShare.DataProxyType.SHARED_CONFIG,
    };
    const callback = (changes: dataShare.DataProxyChangeInfo[]): void => {
      changes.forEach((change) => {
        console.info(`Change Type: ${change.type}, URI: ${change.uri}, Value: ${change.value}`);
      });
    };
    // 监听配置变化
    const listenResults: dataShare.DataProxyResult[] = dsProxyHelper.onDataChange(uris, config, callback);
    listenResults.forEach((result) => {
      console.info(`URI: ${result.uri}, Result: ${result.result}`);
    });
    // 取消监听配置变化
    const unListenResults: dataShare.DataProxyResult[] = dsProxyHelper.offDataChange(uris, config, callback);
    unListenResults.forEach((result) => {
      console.info(`URI: ${result.uri}, Result: ${result.result}`);
    });
  }).catch((error: Error) => {
    console.info('Error creating DataProxyHandle:', error);
  });
}
// [End watch_shared_config]

@Entry
@Component
struct Index {
  @State message: string = '';

  build() {
    Column() {
      TextArea({
        text: this.message,
        placeholder: '',
      })
        .width('100%')
        .height('50%');
      Row() {
        Button('app.string.publishSharedConfig')
          .onClick(() => {
            publishSharedConfig();
            console.info('publishSharedConfig SUCCESS');
            this.message += 'publishSharedConfig SUCCESS' + '\n';
          })
          .margin({ top: 20 })
          .width('60%');
      };

      Row() {
        Button('app.string.deleteSharedConfig')
          .onClick(() => {
            deleteSharedConfig();
            console.info('deleteSharedConfig SUCCESS');
            this.message += 'deleteSharedConfig SUCCESS' + '\n';
          })
          .margin({ top: 20 })
          .width('60%');
      };

      Row() {
        Button('app.string.getSharedConfig')
          .onClick(() => {
            getSharedConfig();
            console.info('getSharedConfig SUCCESS');
            this.message += 'getSharedConfig SUCCESS' + '\n';
          })
          .margin({ top: 20 })
          .width('60%');
      };

      Row() {
        Button('app.string.watchConfigChanges')
          .onClick(() => {
            watchConfigChanges();
            console.info('watchConfigChanges SUCCESS');
            this.message += 'watchConfigChanges SUCCESS' + '\n';
          })
          .margin({ top: 20 })
          .width('60%');
      };
    };
  }
}
