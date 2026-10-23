/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start arkts_import_drm]
import { drm } from '@kit.DrmKit';
// [End arkts_import_drm]
// [Start arkts_import_business_error]
import { BusinessError } from '@kit.BasicServicesKit';
// [End arkts_import_business_error]
import { router } from '@kit.ArkUI';
import { resourceManager } from '@kit.LocalizationKit';
import drmSample from 'libdrmsample.so';

const DRM_SOLUTION_NAME = 'com.clearplay.drm';
const MIME_TYPE = 'video/mp4';

function getString(rm: resourceManager.ResourceManager, resId: number, ...args: Array<string | number>): string {
  try {
    return rm.getStringSync(resId, ...args);
  } catch (err) {
    const e = err as BusinessError;
    console.error(`getStringSync failed, code: ${e.code}, message: ${e.message}`);
    return '';
  }
}

function appendLog(rm: resourceManager.ResourceManager, log: string, step: string, detail: string): string {
  return `${log}${step}${getString(rm, $r('app.string.log_step_separator').id)}${detail}\n`;
}

// TS API：获取设备支持的DRM解决方案名称和唯一标识的列表。
function tsGetMediaKeySystems(rm: resourceManager.ResourceManager): string {
  let log = '';
  try {
    // [Start arkts_getMediaKeySystems]
    const descriptions: drm.MediaKeySystemDescription[] = drm.getMediaKeySystems();
    // [End arkts_getMediaKeySystems]
    log = appendLog(rm, log, 'getMediaKeySystems',
      getString(rm, $r('app.string.log_success_count').id, descriptions.length));
    for (let i = 0; i < descriptions.length; i++) {
      log = appendLog(rm, log, getString(rm, $r('app.string.log_solution').id, i),
        getString(rm, $r('app.string.log_solution_info').id, descriptions[i].name, descriptions[i].uuid));
    }
  } catch (err) {
    const e = err as BusinessError;
    log = appendLog(rm, log, 'getMediaKeySystems',
      getString(rm, $r('app.string.log_failed_with_code').id, e.code));
  }
  return log;
}

// TS API：查询设备是否支持指定的DRM解决方案。
function tsIsSupported(rm: resourceManager.ResourceManager): string {
  let log = '';
  try {
    // [Start arkts_isMediaKeySystemSupported]
    const byName = drm.isMediaKeySystemSupported(DRM_SOLUTION_NAME);
    // [StartExclude arkts_isMediaKeySystemSupported]
    log = appendLog(rm, log, 'isMediaKeySystemSupported(name)', `${byName}`);
    // [EndExclude arkts_isMediaKeySystemSupported]
    const byMimeType = drm.isMediaKeySystemSupported(DRM_SOLUTION_NAME, MIME_TYPE);
    // [StartExclude arkts_isMediaKeySystemSupported]
    log = appendLog(rm, log, 'isMediaKeySystemSupported(name, mimeType)', `${byMimeType}`);
    // [EndExclude arkts_isMediaKeySystemSupported]
    const byLevel = drm.isMediaKeySystemSupported(
      DRM_SOLUTION_NAME, MIME_TYPE, drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
    // [StartExclude arkts_isMediaKeySystemSupported]
    log = appendLog(rm, log, 'isMediaKeySystemSupported(name, mimeType, level)', `${byLevel}`);
    // [EndExclude arkts_isMediaKeySystemSupported]
    // [End arkts_isMediaKeySystemSupported]
  } catch (err) {
    const e = err as BusinessError;
    log = appendLog(rm, log, 'isMediaKeySystemSupported',
      getString(rm, $r('app.string.log_failed_with_code').id, e.code));
  }
  return log;
}

// TS API：MediaKeySystem与MediaKeySession完整使用流程。
async function tsMediaKeySessionFlow(rm: resourceManager.ResourceManager): Promise<string> {
  let log = '';
  let mediaKeySystem: drm.MediaKeySystem | null = null;
  let mediaKeySession: drm.MediaKeySession | null = null;
  try {
    // 1. 创建MediaKeySystem实例。
    // [Start arkts_createMediaKeySystem]
    mediaKeySystem = drm.createMediaKeySystem(DRM_SOLUTION_NAME);
    // [End arkts_createMediaKeySystem]
    log = appendLog(rm, log, 'createMediaKeySystem', getString(rm, $r('app.string.log_success').id));

    // 2. 设置MediaKeySystem状态监听事件，监听设备DRM证书请求。
    // [Start arkts_onKeySystemRequired]
    mediaKeySystem.on('keySystemRequired', (eventInfo: drm.EventInfo) => {
      console.info(`keySystemRequired extra:${eventInfo.extraInfo} data:${eventInfo.info}`);
      // 设备DRM证书请求与处理。
    });
    // [End arkts_onKeySystemRequired]
    log = appendLog(rm, log, "on('keySystemRequired')", getString(rm, $r('app.string.log_success').id));

    // 3. 获取设备DRM证书状态。
    // [Start arkts_getCertificateStatus]
    const certificateStatus = mediaKeySystem.getCertificateStatus();
    // [End arkts_getCertificateStatus]
    log = appendLog(rm, log, 'getCertificateStatus', `${certificateStatus}`);

    // 4. 设备DRM证书状态不是已 provision 时，生成设备DRM证书请求与处理设备DRM证书响应。
    if (certificateStatus !== drm.CertificateStatus.CERT_STATUS_PROVISIONED) {
      try {
        // [Start arkts_generateKeySystemRequest]
        const provisionRequest = await mediaKeySystem.generateKeySystemRequest();
        // [End arkts_generateKeySystemRequest]
        log = appendLog(rm, log, 'generateKeySystemRequest', getString(rm, $r('app.string.log_success').id));
        // [Start arkts_processKeySystemResponse]
        // 将设备DRM证书请求返回的provisionRequest.data通过网络请求发送给DRM证书服务获取设备DRM证书响应，并处理。
        const provisionResponse = new Uint8Array([0x00, 0x00, 0x00, 0x00]); // 设备DRM证书响应。
        await mediaKeySystem.processKeySystemResponse(provisionResponse);
        // [End arkts_processKeySystemResponse]
        log = appendLog(rm, log, 'processKeySystemResponse', getString(rm, $r('app.string.log_success').id));
      } catch (err) {
        const e = err as BusinessError;
        log = appendLog(rm, log, getString(rm, $r('app.string.log_provision_flow').id),
          getString(rm, $r('app.string.log_failed_with_code').id, e.code));
      }
    }

    // 5. 创建MediaKeySession实例。
    // [Start arkts_createMediaKeySession]
    mediaKeySession = mediaKeySystem.createMediaKeySession();
    // [End arkts_createMediaKeySession]
    log = appendLog(rm, log, 'createMediaKeySession', getString(rm, $r('app.string.log_success').id));

    // 6. 设置MediaKeySession状态监听事件，包括媒体密钥请求、过期、有效期更新、变换事件。
    // [Start arkts_onKeyRequired]
    mediaKeySession.on('keyRequired', (eventInfo: drm.EventInfo) => {
      console.info(`keyRequired info:${eventInfo.info} extraInfo:${eventInfo.extraInfo}`);
      // 媒体密钥请求与处理。
    });
    // [End arkts_onKeyRequired]
    // [Start arkts_onKeyExpired]
    mediaKeySession.on('keyExpired', (eventInfo: drm.EventInfo) => {
      console.info(`keyExpired info:${eventInfo.info} extraInfo:${eventInfo.extraInfo}`);
    });
    // [End arkts_onKeyExpired]
    // [Start arkts_onExpirationUpdate]
    mediaKeySession.on('expirationUpdate', (eventInfo: drm.EventInfo) => {
      console.info(`expirationUpdate info:${eventInfo.info} extraInfo:${eventInfo.extraInfo}`);
    });
    // [End arkts_onExpirationUpdate]
    // [Start arkts_onKeysChange]
    mediaKeySession.on('keysChange', (keyInfo: drm.KeysInfo[], newKeyAvailable: boolean) => {
      for (let i = 0; i < keyInfo.length; i++) {
        console.info(`keysChange keyId:${keyInfo[i].keyId} value:${keyInfo[i].value}`);
      }
    });
    // [End arkts_onKeysChange]
    log = appendLog(rm, log, getString(rm, $r('app.string.log_on_session_events').id),
      getString(rm, $r('app.string.log_success').id));

    // 7. 查询是否需要安全解码。
    // [Start arkts_requireSecureDecoderModule]
    const needSecureDecoder = mediaKeySession.requireSecureDecoderModule(MIME_TYPE);
    // [End arkts_requireSecureDecoderModule]
    log = appendLog(rm, log, 'requireSecureDecoderModule', `${needSecureDecoder}`);

    // 8. 生成媒体密钥请求、处理媒体密钥响应并恢复离线媒体密钥。
    try {
      // [Start arkts_generateMediaKeyRequest]
      // 实际应用中initData应从媒体内容的PSSH box中提取。
      const initData = new Uint8Array([0x00, 0x01, 0x02, 0x03]);
      // 根据DRM解决方案要求设置可选数据的值。
      const optionalData: drm.OptionsData[] = [{
        name: 'optionalDataName',
        value: 'optionalDataValue'
      }];
      const mediaKeyRequest = await mediaKeySession.generateMediaKeyRequest(
        MIME_TYPE, initData, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
      // [End arkts_generateMediaKeyRequest]
      log = appendLog(rm, log, 'generateMediaKeyRequest',
        getString(rm, $r('app.string.log_success_request_type').id, mediaKeyRequest.mediaKeyRequestType));

      // [Start arkts_processMediaKeyResponse]
      // 将媒体密钥请求返回的mediaKeyRequest.data通过网络请求发送给DRM服务获取媒体密钥响应，并处理。
      const mediaKeyResponse = new Uint8Array([0x00, 0x00, 0x00, 0x00]); // 媒体密钥响应。
      const offlineMediaKeyId = await mediaKeySession.processMediaKeyResponse(mediaKeyResponse);
      // [End arkts_processMediaKeyResponse]
      log = appendLog(rm, log, 'processMediaKeyResponse', getString(rm, $r('app.string.log_success').id));

      // [Start arkts_restoreOfflineMediaKeys]
      await mediaKeySession.restoreOfflineMediaKeys(offlineMediaKeyId);
      // [End arkts_restoreOfflineMediaKeys]
      log = appendLog(rm, log, 'restoreOfflineMediaKeys', getString(rm, $r('app.string.log_success').id));
    } catch (err) {
      const e = err as BusinessError;
      log = appendLog(rm, log, getString(rm, $r('app.string.log_media_key_flow').id),
        getString(rm, $r('app.string.log_failed_with_code').id, e.code));
    }

    // 9. 检查当前会话的媒体密钥状态。
    // [Start arkts_checkMediaKeyStatus]
    const keyStatus = mediaKeySession.checkMediaKeyStatus();
    // [End arkts_checkMediaKeyStatus]
    log = appendLog(rm, log, 'checkMediaKeyStatus',
      getString(rm, $r('app.string.log_success_status_count').id, keyStatus.length));

    // 10. 离线媒体密钥管理：获取离线媒体密钥标识列表、获取状态与清除离线媒体密钥。
    // [Start arkts_offlineMediaKeyManagement]
    const offlineMediaKeyIds = mediaKeySystem.getOfflineMediaKeyIds();
    if (offlineMediaKeyIds.length > 0) {
      const offlineStatus = mediaKeySystem.getOfflineMediaKeyStatus(offlineMediaKeyIds[0]);
      mediaKeySystem.clearOfflineMediaKeys(offlineMediaKeyIds[0]);
    }
    // [End arkts_offlineMediaKeyManagement]
    log = appendLog(rm, log, 'offlineMediaKeyManagement',
      getString(rm, $r('app.string.log_success_offline_count').id, offlineMediaKeyIds.length));

    // 11. 清除当前会话的媒体密钥。
    mediaKeySession.clearMediaKeys();
    log = appendLog(rm, log, 'clearMediaKeys', getString(rm, $r('app.string.log_success').id));
  } catch (err) {
    const e = err as BusinessError;
    log = appendLog(rm, log, getString(rm, $r('app.string.log_flow_exception').id),
      getString(rm, $r('app.string.log_error_code_message').id, e.code, e.message));
  } finally {
    // 12. 销毁实例。
    if (mediaKeySession !== null) {
      // [Start arkts_destroyMediaKeySession]
      mediaKeySession.destroy();
      // [End arkts_destroyMediaKeySession]
      log = appendLog(rm, log, 'mediaKeySession.destroy', getString(rm, $r('app.string.log_success').id));
    }
    if (mediaKeySystem !== null) {
      // [Start arkts_destroyMediaKeySystem]
      mediaKeySystem.destroy();
      // [End arkts_destroyMediaKeySystem]
      log = appendLog(rm, log, 'mediaKeySystem.destroy', getString(rm, $r('app.string.log_success').id));
    }
  }
  return log;
}

@Entry
@Component
struct Index {
  @State result: string | Resource = $r('app.string.result_hint', DRM_SOLUTION_NAME);

  getResourceManager(): resourceManager.ResourceManager {
    return this.getUIContext().getHostContext()!.resourceManager;
  }

  build() {
    Column() {
      Text($r('app.string.page_title'))
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 16, bottom: 8 })

      Scroll() {
        Column() {
          Text($r('app.string.arkts_api_section_title'))
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .width('90%')
            .margin({ top: 8, bottom: 4 })

          Button($r('app.string.ts_query_supported_list'))
            .id('TsGetMediaKeySystemsBtn')
            .width('80%')
            .margin(4)
            .onClick(() => {
              this.result = tsGetMediaKeySystems(this.getResourceManager());
            })

          Button($r('app.string.ts_query_if_supported'))
            .id('TsIsSupportedBtn')
            .width('80%')
            .margin(4)
            .onClick(() => {
              this.result = tsIsSupported(this.getResourceManager());
            })

          Button($r('app.string.ts_session_full_flow'))
            .id('TsSessionFlowBtn')
            .width('80%')
            .margin(4)
            .onClick(async () => {
              this.result = await tsMediaKeySessionFlow(this.getResourceManager());
            })

          Text($r('app.string.c_api_section_title'))
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .width('90%')
            .margin({ top: 16, bottom: 4 })

          Button($r('app.string.c_query_if_supported'))
            .id('CIsSupportedBtn')
            .width('80%')
            .margin(4)
            .onClick(() => {
              const supported = drmSample.isSupported(DRM_SOLUTION_NAME);
              this.result = getString(this.getResourceManager(),
                $r('app.string.oh_is_supported_result').id, `${supported}`);
            })

          Button($r('app.string.c_query_supported_list'))
            .id('CGetMediaKeySystemsBtn')
            .width('80%')
            .margin(4)
            .onClick(() => {
              this.result = drmSample.getMediaKeySystems();
            })

          Button($r('app.string.c_query_support_level'))
            .id('CIsSupported3Btn')
            .width('80%')
            .margin(4)
            .onClick(() => {
              this.result = drmSample.isSupported3(DRM_SOLUTION_NAME, MIME_TYPE);
            })

          Button($r('app.string.c_media_key_system_flow'))
            .id('CMediaKeySystemFlowBtn')
            .width('80%')
            .margin(4)
            .onClick(() => {
              this.result = drmSample.mediaKeySystemFlow(DRM_SOLUTION_NAME);
            })

          Button($r('app.string.c_media_key_session_flow'))
            .id('CMediaKeySessionFlowBtn')
            .width('80%')
            .margin(4)
            .onClick(() => {
              this.result = drmSample.mediaKeySessionFlow(DRM_SOLUTION_NAME, MIME_TYPE);
            })

          Button($r('app.string.goto_avplayer_drm'))
            .id('GotoAVPlayerDrmBtn')
            .width('80%')
            .margin({ top: 16, bottom: 4 })
            .onClick(() => {
              router.pushUrl({ url: 'pages/AVPlayerDrm' });
            })

          Text($r('app.string.result_section_title'))
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .width('90%')
            .margin({ top: 12, bottom: 4 })

          Text(this.result)
            .id('ResultText')
            .fontSize(13)
            .width('90%')
            .padding(12)
            .backgroundColor($r('app.color.result_background'))
            .borderRadius(8)
            .margin({ bottom: 16 })
        }
        .width('100%')
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}
