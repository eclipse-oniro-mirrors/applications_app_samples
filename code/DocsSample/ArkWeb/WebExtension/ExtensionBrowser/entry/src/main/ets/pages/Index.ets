import { UIAbility, Want, common } from '@kit.AbilityKit';
// [Start web_native_messaging_disconnect_native]
import { webNativeMessagingExtensionManager } from '@kit.ArkWeb'
// [StartExclude web_native_messaging_disconnect_native]
import testNapi from 'libentry.so';
import dataShare from '@ohos.data.dataShare';
import { bundleManager } from '@kit.AbilityKit';
class ConnectionCallback implements webNativeMessagingExtensionManager.WebExtensionConnectionCallback {
  onConnect(connection:webNativeMessagingExtensionManager.ConnectionNativeInfo) {
    // connected
    console.error(`onConnect id ${connection.connectionId} is connected`);
  }
  onDisconnect(connection:webNativeMessagingExtensionManager.ConnectionNativeInfo) {
    // disconnect
    console.error(`onDisconnect id ${connection.connectionId} is connected`);
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
    console.info(`inner callback error Message: ${JSON.stringify(error)}`);
  }
}
// [StartExclude web_native_messaging_disconnect_native]
function disconnencNative(connectId: number) : void {
  console.info(`NativeMessageDisconnect start connectionId is ${connectId}`);
  webNativeMessagingExtensionManager.disconnectNative(connectId);
}
// [End web_native_messaging_disconnect_native]

interface ExtensionConfig {
  abilityName:string;
  allowed_origins:string[];
}

async function getManifestData(bundleName:string, connectExtensionOrigin:string) {
  try {
    // 调用dataShare接口获取extension配置
    const dsProxyHelper = await dataShare.createDataProxyHandle();
    const urisToGet = [`datashareproxy://${bundleName}/browserNativeMessagingHosts`];
    const config : dataShare.DataProxyConfig = {
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
        let jsonStr:string = json as string;
        let info:ExtensionConfig = JSON.parse(jsonStr);
        if (info.abilityName) {
          console.info('Native message json info is ok');
          if (!Array.isArray(info.allowed_origins)) {
            info.allowed_origins = [info.allowed_origins];
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

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  bundleFlags =
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;

  build() {
    Column() {
      Button("getManifestData")
        .onClick(() => {
          getManifestData("com.example.myapplication","chrome-extension://knldjmfmopnpolahpmmgbagdohdnhkik/")
        })
      Button("connect")
        .onClick(() => {
          let pipRead = testNapi.createPipe() as PipeResult;
          let pipWrite = testNapi.createPipe() as PipeResult;

          let pipeReadFd:number = pipRead.readFd;
          let pipeWriteFd :number = pipWrite.writeFd;
          let remotePipeReadFd:number = pipWrite.readFd;
          let remotePipeWriteFd :number= pipRead.writeFd;

          console.info('midApp pipeReadFd %{public}d pipeWriteFd %{public}d remotePipeReadFd %{public}d remotePipeWriteFd %{public}d',
            pipeReadFd,pipeWriteFd,remotePipeReadFd,remotePipeWriteFd);
          connectNative(getContext(this)as common.UIAbilityContext,"com.example.myapplication","MyWebNativeMessageExtAbility","chrome-extension:\/\/knldjmfmopnpolahpmmgbagdohdnhkik\/",remotePipeReadFd, remotePipeWriteFd)
        })
      Button("disconnect")
        .onClick(() => {
          disconnencNative(1)
        })
    }
    .height('100%')
    .width('100%')
  }
}
interface PipeResult {
  readFd: number;
  writeFd: number;
}


