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

// [Start avplayer_import_kits]
import { drm } from '@kit.DrmKit';
import { media } from '@kit.MediaKit';
// [End avplayer_import_kits]
// [Start avplayer_import_business_error]
import { BusinessError } from '@kit.BasicServicesKit';
// [End avplayer_import_business_error]

@Entry
@Component
struct AVPlayerDrm {
  @State result: string = '';
  @State isPreparing: boolean = false;
  @State url: string = '';
  private surfaceId: string = '';
  private xComponentController: XComponentController = new XComponentController();

  // [Start avplayer_initPlayer]
  private playerHandle?: media.AVPlayer;

  async initPlayer(): Promise<void> {
    this.playerHandle = await media.createAVPlayer();
    this.playerHandle.on('mediaKeySystemInfoUpdate', async (mediaKeySystemInfo: drm.MediaKeySystemInfo[]) => {
      console.info('player has received drmInfo signal: ' + JSON.stringify(mediaKeySystemInfo));
      // 处理DRM信息，根据DRM信息中的uuid创建MediaKeySystem与MediaKeySession实例，并完成媒体密钥请求与处理。
      try {
        await this.processDrmInfo(mediaKeySystemInfo);
      } catch (err) {
        const e = err as BusinessError;
        console.error(`processDrmInfo failed, code: ${e.code}, message: ${e.message}`);
      }
    });
  }
  // [End avplayer_initPlayer]

  // [Start avplayer_processDrmInfo]
  private mediaKeySystem?: drm.MediaKeySystem;
  private mediaKeySession?: drm.MediaKeySession;

  async processDrmInfo(mediaKeySystemInfo: drm.MediaKeySystemInfo[]): Promise<void> {
    const drmInfoArr: drm.MediaKeySystemInfo[] = mediaKeySystemInfo;
    for (let i = 0; i < drmInfoArr.length; i++) {
      console.info('drmInfoArr - uuid: ' + drmInfoArr[i].uuid);
      console.info('drmInfoArr - pssh: ' + drmInfoArr[i].pssh);
      const description: drm.MediaKeySystemDescription[] = drm.getMediaKeySystems();
      let solutionName: string = 'com.clearplay.drm';
      for (let item of description) {
        if (drmInfoArr[i].uuid == item.uuid) {
          solutionName = item.name;
        }
      }
      // 实际开发中应从播放内容的轨道信息（如AVPlayer.getTrackDescription()）或已知媒体源获取mimeType。
      // drm.MediaKeySystemInfo不包含mimeType字段，无法直接从drmInfoArr[i]获取。
      const mimeType: string = 'video/mp4';
      const isSupported: boolean = drm.isMediaKeySystemSupported(solutionName, mimeType);
      if (isSupported) {
        this.mediaKeySystem = drm.createMediaKeySystem(solutionName);
        this.mediaKeySession = this.mediaKeySystem.createMediaKeySession();
        // 媒体密钥请求与处理。
        await this.processMediaKey(drmInfoArr[i].pssh, mimeType);
      }
    }
    // 媒体密钥请求与处理后，设置解密session。
    this.setDecryptionConfig();
  }
  // [End avplayer_processDrmInfo]

  // [Start avplayer_processMediaKey]
  async processMediaKey(pssh: Uint8Array, mimeType: string): Promise<void> {
    if (this.mediaKeySession === undefined) {
      return;
    }
    const initData: Uint8Array = new Uint8Array(pssh);
    const optionsData: drm.OptionsData[] = [{
      name: 'optionalDataName',
      value: 'optionalDataValue'
    }];
    try {
      const licenseRequest = await this.mediaKeySession.generateMediaKeyRequest(
        mimeType, initData, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionsData);
      console.info('generateMediaKeyRequest success, type: ' + licenseRequest.mediaKeyRequestType);
      // 将媒体密钥请求返回的licenseRequest.data通过网络请求发送给DRM服务获取媒体密钥响应，并处理。
      const licenseResponse = new Uint8Array([0x00, 0x00, 0x00, 0x00]); // 媒体密钥响应。
      await this.mediaKeySession.processMediaKeyResponse(licenseResponse);
    } catch (err) {
      const e = err as BusinessError;
      console.error(`generateMediaKeyRequest or processMediaKeyResponse failed, code: ${e.code}`);
    }
  }
  // [End avplayer_processMediaKey]

  // [Start avplayer_setDecryptionConfig]
  setDecryptionConfig(): void {
    if (this.playerHandle === undefined || this.mediaKeySession === undefined) {
      return;
    }
    // 实际开发中应从轨道信息获取codec mime type（如video/avc），再传入requireSecureDecoderModule。
    const svp: boolean = this.mediaKeySession.requireSecureDecoderModule('video/avc');
    this.playerHandle.setDecryptionConfig(this.mediaKeySession, svp);
  }
  // [End avplayer_setDecryptionConfig]

  // [Start avplayer_releasePlayer]
  async releasePlayer(): Promise<void> {
    if (this.playerHandle === undefined) {
      return;
    }
    // 销毁AVPlayer实例，并根据released事件监听销毁MediaKeySession和MediaKeySystem实例。
    this.playerHandle.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
      if (state == 'released') {
        this.mediaKeySession?.destroy();
        this.mediaKeySystem?.destroy();
        this.mediaKeySession = undefined;
        this.mediaKeySystem = undefined;
        this.playerHandle = undefined;
        // [StartExclude avplayer_releasePlayer]
        this.isPreparing = false;
        // [EndExclude avplayer_releasePlayer]
      }
    });
    await this.playerHandle.release();
  }
  // [End avplayer_releasePlayer]

  async play(): Promise<void> {
    if (this.url === '') {
      this.result += 'please input the url first\n';
      return;
    }
    if (this.playerHandle !== undefined) {
      this.result += 'player is running, release it first\n';
      return;
    }
    this.isPreparing = true;
    this.result = 'createAVPlayer\n';
    try {
      await this.initPlayer();
      const player = this.playerHandle!;
      player.on('error', (err: BusinessError) => {
        this.result += `error, code: ${err.code}\n`;
        this.isPreparing = false;
      });
      player.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
        this.result += `state: ${state}\n`;
        if (state === 'initialized') {
          player.surfaceId = this.surfaceId;
          await player.prepare();
        } else if (state === 'prepared') {
          await player.play();
          this.isPreparing = false;
        }
      });
      player.url = this.url;
    } catch (err) {
      const e = err as BusinessError;
      this.result += `play failed, code: ${e.code}\n`;
      this.isPreparing = false;
    }
  }

  build() {
    Column() {
      Text($r('app.string.avplayer_page_title'))
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 16, bottom: 8 })

      XComponent({
        // 装载视频容器
        id: 'xComponent',
        type: XComponentType.SURFACE,
        controller: this.xComponentController
      })
        .onLoad(() => {
          this.surfaceId = this.xComponentController.getXComponentSurfaceId();
        })
        .width('90%')
        .height(220)
        .margin({ top: 8 })

      TextInput({ text: this.url, placeholder: $r('app.string.avplayer_url_hint') })
        .id('DrmUrlInput')
        .width('90%')
        .margin({ top: 12 })
        .onChange((value: string) => {
          this.url = value;
        })

      Row() {
        Button($r('app.string.avplayer_play'))
          .id('PlayBtn')
          .margin(4)
          .enabled(!this.isPreparing)
          .onClick(() => {
            this.play();
          })

        Button($r('app.string.avplayer_release'))
          .id('ReleaseBtn')
          .margin(4)
          .onClick(() => {
            this.releasePlayer();
          })
      }
      .margin({ top: 8 })

      Text($r('app.string.result_section_title'))
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .width('90%')
        .margin({ top: 12, bottom: 4 })

      Scroll() {
        Text(this.result)
          .id('AVPlayerDrmResultText')
          .fontSize(13)
          .width('100%')
          .padding(12)
          .backgroundColor($r('app.color.result_background'))
          .borderRadius(8)
      }
      .align(Alignment.TopStart)
      .width('90%')
      .layoutWeight(1)
      .margin({ bottom: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}
