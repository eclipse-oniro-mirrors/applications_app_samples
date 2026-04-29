'use static'
import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { UIAbility, Want, common } from '@kit.AbilityKit';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';
import dataShare from '@ohos.data.dataShare';

// [Start web_native_messaging_get_manifest_data_sta]
class ExtensionConfig {
  abilityName: string = '';
  allowed_origins: string[] = new Array<string>();
}

async function getManifestData(bundleName: string, connectExtensionOrigin: string) {
  try {
    // 调用dataShare接口获取extension配置
    const dsProxyHelper = await dataShare.createDataProxyHandle();
    const urisToGet = [`datashareproxy://${bundleName}/browserNativeMessagingHosts`];
    const config: dataShare.DataProxyConfig = {
      type: dataShare.DataProxyType.SHARED_CONFIG,
    };
    const results = await dsProxyHelper.get(urisToGet, config);
    let foundValid = false;
    for (let i = 0; i < results.length; i++) {
      try {
        const result = results[i];
        const json = result.value;
        if (typeof json !== "string") {
          continue;
        }
        let jsonStr: string = json as string;
        let parameters: Record<string, Any> = {
          "abilityName": "",
          'allowed_origins': new Array<string>(),
        }
        let info: ExtensionConfig = new ExtensionConfig();
        info.abilityName = parameters['abilityName'] as string;
        info.allowed_origins = parameters['allowed_origins'] as string[];
        Object.assign(parameters, jsonStr);
        // let info:ExtensionConfig = JSON.parse(jsonStr,  new ExtensionConfig());
        if (info.abilityName) {
          console.info('Native message json info is ok');
          if (!Array.isArray(info.allowed_origins)) {
            info.allowed_origins = [info.allowed_origins[0]];
          }
          if (!info.allowed_origins.includes(connectExtensionOrigin)) {
            console.error('Origin not allowed, continue searching');
            continue;
          }
          foundValid = true;
          break;
        }
      } catch (error) {
        console.error('NativeMessage JSON parse error:', error);
      }
    }
    if (!foundValid) {
      console.error('NativeMessage JSON no valid manifest found');
    } else {
      console.info('NativeMessage allowed_origins match ok');
    }
  } catch (error) {
    console.error('Error getting config:', error);
  }
}
// [End web_native_messaging_get_manifest_data_sta]

// [Start web_native_messaging_connect_native_sta]
class ConnectionCallback implements webNativeMessagingExtensionManager.WebExtensionConnectionCallback {
  onConnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
    // connected
    console.error(`onConnect id ${connection.connectionId} is connected`);
  }

  onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
    // disconnect
    console.error(`onDisconnect id ${connection.connectionId} is connected`);
  }

  onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
    console.error(`onFailed error code is ${code}, errMsg is ${errMsg}`);
  }
}

function connectNative(abilityContext: common.UIAbilityContext, bundleName: string, abilityName: string,
  connectExtensionOrigin: string, readPipe: int, writePipe: int): void {
  try {
    let wantInfo: Want = {
      bundleName: bundleName,
      abilityName: abilityName,
      parameters: {
        'ohos.arkweb.messageReadPipe': { 'type': 'FD', 'value': readPipe },
        'ohos.arkweb.messageWritePipe': { 'type': 'FD', 'value': writePipe },
        'ohos.arkweb.extensionOrigin': connectExtensionOrigin
      },
    };

    let options: ConnectionCallback = new ConnectionCallback;
    let connectId = webNativeMessagingExtensionManager.connectNative(abilityContext, wantInfo, options);
    console.info(`innerWebNativeMessageManager  connectionId : ${connectId}`);
  } catch (error) {
    console.info(`inner callback error Message: ${JSON.stringify(error)}`);
  }
}
// [End web_native_messaging_connect_native_sta]

// [Start web_native_messaging_disconnect_native_sta]
function disconnencNative(connectId: int): void {
  console.info(`NativeMessageDisconnect start connectionId is ${connectId}`);
  webNativeMessagingExtensionManager.disconnectNative(connectId);
}
// [End web_native_messaging_disconnect_native_sta]

@Entry
@Component
struct Index {
  @State stateVar: string = 'state var';
  message: string = 'var';
  i: int = 0;

  changeValue() {
    this.stateVar += '~'
  }

  build() {
    Column(undefined) {
      Button("getManifestData")
        .onClick((e: ClickEvent) => {
          getManifestData("com.example.myapplication", "chrome-extension://knldjmfmopnpolahpmmgbagdohdnhkik/");
        })
      Button("connect")
        .onClick((e: ClickEvent) => {
          connectNative(this.getUIContext().getHostContext() as common.UIAbilityContext, "com.example.myapplication",
            "MyWebNativeMessageExtAbility", "chrome-extension:\/\/knldjmfmopnpolahpmmgbagdohdnhkik\/", 11, 15);
        })
      Button("disconnect")
        .onClick((e: ClickEvent) => {
          disconnencNative(this.i++);
        })
      Text(this.stateVar).fontSize(20)
      Child({ stateVar: this.stateVar })
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';

  build() {
    Text(this.stateVar).fontSize(50)
  }
}
