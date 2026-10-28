// [Start web_native_messaging_extension_ability]
import { ConnectionInfo } from '@ohos.web.WebNativeMessagingExtensionAbility'
import WebNativeMessagingExtensionAbility from "@ohos.web.WebNativeMessagingExtensionAbility"
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@ohos.base'
import {buffer, util} from '@kit.ArkTS';
import fileIo from '@ohos.file.fs';

const TAG: string = '[MyWebNativeMessageExtAbility]';
const DOMAIN_NUMBER = 0xFF00;

export default class MyWebNativeMessageExtAbility extends WebNativeMessagingExtensionAbility {
  // 读取扩展发来的消息，并回复
  async ReadAsync(fdRead:int, fdWrite:int) : Promise<void> {
    try {
      // 读
      let arrayBuffer = new ArrayBuffer(1024);
      let readLen = await fileIo.read(fdRead, arrayBuffer);
      if (readLen <= 4) {
        hilog.error(DOMAIN_NUMBER, TAG, 'read pipe length failed');
        return;
      }
      hilog.info(DOMAIN_NUMBER, TAG, 'read pipe %{public}s', buffer.from(arrayBuffer, 4, (readLen - 4) as int).toString());

      // 写
      let strResponse : string = "pong";
      const encoder = new util.TextEncoder("utf-8");
      const strBytes = encoder.encodeInto(strResponse);
      let bufferLen = strBytes.length;
      const lenBytes = new Uint8Array(4);
      lenBytes[0] = (bufferLen >> 0) & 0xFF;
      lenBytes[1] = (bufferLen >> 8) & 0xFF;
      lenBytes[2] = (bufferLen >> 16) & 0xFF;
      lenBytes[3] = (bufferLen >> 24) & 0xFF;
      const writeBuffer = new Uint8Array(4 + bufferLen);
      writeBuffer.set(lenBytes, 4);
      writeBuffer.set(strBytes, 4);
      let writeLen = await fileIo.write(fdWrite, writeBuffer.buffer);
      hilog.info(DOMAIN_NUMBER, TAG, 'write pipe length %{public}d', writeLen);
    } catch (err: BusinessError) {
      hilog.error(DOMAIN_NUMBER, TAG, 'fileIo io failed, error code: ' + err.code + " message: " + err.code);
    }
  }

  onConnectNative(info: ConnectionInfo): void {
    hilog.info(DOMAIN_NUMBER, TAG,
      `onConnectNative, connectionId ${info.connectionId} caller bundle: ${info.bundleName}, extension origin: ${info.extensionOrigin}, pipe Read: ${info.fdRead}, pipe write ${info.fdWrite}  `);
    this.ReadAsync(info.fdRead, info.fdWrite)
  }

  onDisconnectNative(info: ConnectionInfo): void {
    hilog.info(DOMAIN_NUMBER, TAG, `onDisconnectNative, connectionId: ${info.connectionId}`);
  }

  onDestroy(): void {
    hilog.info(DOMAIN_NUMBER, TAG, 'onDestroy');
  }
};
// [End web_native_messaging_extension_ability]