"use static"
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
// [Start app_ext_service_five_start]
import { Entry, Text, TextAttribute, Column, Row, Component, Button, ButtonAttribute, ClickEvent, List, ListItem, Color } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { common, Want } from '@kit.AbilityKit';
import rpc from '@ohos.rpc';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { ElementName } from 'bundleManager.ElementName'

const TAG: string = '[ClientServerExt]';
const DOMAIN_NUMBER: int = 0xFF00;
const REQUEST_CODE = 1;
let connectionId: Long|undefined;
let want: Want = {
  deviceId: '',
  bundleName: 'com.samples.appserviceextensionability',
  abilityName: 'MyAppServiceExtAbility'
};
let options: common.ConnectOptions = {
  onConnect: (elementName: ElementName |  null,
    remote: rpc.IRemoteObject) => {
    hilog.info(DOMAIN_NUMBER, TAG, 'onConnect callback');
    if (remote === null) {
      hilog.info(DOMAIN_NUMBER, TAG, `onConnect remote is null`);
      return;
    }
    let option = new rpc.MessageOption();
    let data = rpc.MessageSequence.create();
    let reply = rpc.MessageSequence.create();

    try {
 	    // 写入请求数据
 	    data.writeInt(1);
 	    data.writeInt(2);
 	  } catch (error) {
 	    let e: BusinessError = error as BusinessError;
 	    hilog.error(DOMAIN_NUMBER, TAG, 'errorCode ' + e.code);
 	    hilog.error(DOMAIN_NUMBER, TAG, 'errorMessage ' + e.message);
 	  }

    remote.sendMessageRequest(REQUEST_CODE, data, reply, option).then((ret: rpc.RequestResult) => {
      if (ret.errCode === 0) {
        hilog.info(DOMAIN_NUMBER, TAG, `sendRequest got result`);
        let sum = ret.reply.readInt();
        hilog.info(DOMAIN_NUMBER, TAG, `sendRequest success, sum:${sum}`);
      } else {
        hilog.error(DOMAIN_NUMBER, TAG, `sendRequest failed`);
      }
    }).catch((error) => {
      hilog.error(DOMAIN_NUMBER, TAG, `sendRequest failed, ${JSON.stringify(error)}`);
    });
  },
  onDisconnect: (elementName: ElementName | null ) => {
    hilog.info(DOMAIN_NUMBER, TAG, 'onDisconnect callback');
  },
  onFailed: (code: int) => {
    hilog.info(DOMAIN_NUMBER, TAG, 'onFailed callback');
  }
};

// 调用connectAppServiceExtensionAbility相关代码

@Entry
@Component
struct ClientServerExt {
  build() {
    Column() {
      // [StartExclude app_ext_service_five_start]
      Text('top')
        .fontSize(20)
      // [EndExclude app_ext_service_five_start]
      List({ initialIndex: 0 }) {
        ListItem() {
          Row() {
            // [StartExclude app_ext_service_five_start]
            Text('list')
              .fontSize(20)
            // [EndExclude app_ext_service_five_start]
          }
          // [StartExclude app_ext_service_five_start]
          .id('clientService')
          .width('100%')
          .height('100%')
          // [EndExclude app_ext_service_five_start]
          .onClick(() => {
            let context = this.getUIContext().getHostContext() as common.UIAbilityContext; // UIAbilityContext
            connectionId = context.connectAppServiceExtensionAbility(want, options);
            hilog.info(DOMAIN_NUMBER, TAG, `connectionId is : ${connectionId}`);
          })
        }
      }
      // [StartExclude app_ext_service_five_start]
      .width('100%')
      // [EndExclude app_ext_service_five_start]
    }
  }
}
// [End app_ext_service_five_start]