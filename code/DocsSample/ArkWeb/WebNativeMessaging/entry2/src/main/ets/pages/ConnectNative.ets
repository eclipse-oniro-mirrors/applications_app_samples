/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// [Start ConnectNative]
import { UIAbility, Want, common } from '@kit.AbilityKit';
import { webNativeMessagingExtensionManager } from '@kit.ArkWeb'

class ConnectionCallback implements webNativeMessagingExtensionManager.WebExtensionConnectionCallback {
  onConnect(connection:webNativeMessagingExtensionManager.ConnectionNativeInfo) {
    // connected
    console.info(`onConnect id ${connection.connectionId} is connected`);
  }
  onDisconnect(connection:webNativeMessagingExtensionManager.ConnectionNativeInfo) {
    // disconnect
    console.error(`onDisconnect id ${connection.connectionId} is disconnected`);
  }
  onFailed(code:webNativeMessagingExtensionManager.NmErrorCode, errMsg:string) {
    console.error(`onFailed error code is ${code}, errMsg is ${errMsg}`);
  }
}

function connectNative(abilityContext: common.UIAbilityContext, bundleName: string, abilityName: string,
  connectExtensionOrigin: string, readPipe: number, writePipe: number) : void {
  try {
    let wantInfo:Want = {
      bundleName: bundleName,
      abilityName: abilityName,
      parameters: {
        'ohos.arkweb.messageReadPipe': { 'type': 'FD', 'value': readPipe },
        'ohos.arkweb.messageWritePipe': { 'type': 'FD', 'value': writePipe },
        'ohos.arkweb.extensionOrigin': connectExtensionOrigin
      },
    };

    let options : ConnectionCallback = new ConnectionCallback;
    let connectId = webNativeMessagingExtensionManager.connectNative(abilityContext, wantInfo, options);
    console.info(`innerWebNativeMessageManager  connectionId : ${connectId}` );
  } catch (error) {
    console.error(`inner callback error Message: ${JSON.stringify(error)}`);
  }
}
// [End ConnectNative]
