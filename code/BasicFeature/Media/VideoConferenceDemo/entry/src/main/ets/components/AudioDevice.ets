/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { audio } from '@kit.AudioKit';
import { AVCastPicker, AVCastPickerState, avSession } from '@kit.AVSessionKit';
import { Logger } from '../common/utils/Logger';
import Constants from '../common/Constants';

const TAG: string = '[AudioDevice]';

@Component
export struct AudioDevice {
  @State audioOutputIcon: Resource = $r('sys.symbol.speaker_wave_3');
  private context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private avSession: avSession.AVSession | undefined = undefined;
  private audioManager: audio.AudioManager = audio.getAudioManager();
  private audioRoutingManager: audio.AudioRoutingManager = this.audioManager.getRoutingManager();
  private outDeviceType: audio.DeviceType = audio.DeviceType.EARPIECE;

  @Builder
  customPickerBuilder() {
    SymbolGlyph(this.audioOutputIcon)
      .fontSize(24)
      .fontColor([Color.White])
  }

  aboutToAppear(): void {
    this.initOutputDevice();
    this.initAVSession();
    this.watchPreferredOutputDeviceChange();
  }

  aboutToDisappear(): void {
    this.audioRoutingManager.off('preferOutputDeviceChangeForRendererInfo');
  }

  private initOutputDevice() {
    const outDeviceType =
      this.audioRoutingManager.getPreferredOutputDeviceForRendererInfoSync(Constants.RENDERER_INFO)[0].deviceType;
    this.handleOutputDeviceChange(outDeviceType);
  }

  private async initAVSession() {
    try {
      this.avSession = await avSession.createAVSession(this.context, 'voip', 'audio');
      Logger.info(TAG, `session create successed : sessionId : ${this.avSession.sessionId}`);
    } catch (error) {
      Logger.error(TAG, `avSession.createAVSession failed, code: ${error.code}, message: ${error.message}`);
    }
  }

  watchPreferredOutputDeviceChange() {
    try {
      this.audioRoutingManager.on('preferOutputDeviceChangeForRendererInfo', Constants.RENDERER_INFO,
        (audioDeviceDescriptors: audio.AudioDeviceDescriptors) => {
          Logger.info(TAG,
            `watchPreferredOutputDeviceChange AudioDeviceDescriptors: ${JSON.stringify(audioDeviceDescriptors)}.`);
          this.handleOutputDeviceChange(audioDeviceDescriptors[0].deviceType);
        });
    } catch (err) {
      let error = err as BusinessError;
      Logger.error(TAG,
        `preferOutputDeviceChangeForRendererInfo failed, code: ${error.code}, message: ${error.message}`);
    }
  }

  handleOutputDeviceChange(deviceType: audio.DeviceType) {
    if (this.outDeviceType === deviceType) {
      return;
    }
    this.outDeviceType = deviceType;

    switch (this.outDeviceType) {
      case audio.DeviceType.EARPIECE:
        this.audioOutputIcon = $r('sys.symbol.ear')
        Logger.info(TAG, `声音将通过听筒播放`);
        break;
      case audio.DeviceType.SPEAKER:
        this.audioOutputIcon = $r('sys.symbol.speaker_wave_3')
        Logger.info(TAG, `声音将通过扬声器播放`);
        break;
      case audio.DeviceType.BLUETOOTH_SCO:
        this.audioOutputIcon = $r('sys.symbol.earphone_bluetooth_fill')
        Logger.info(TAG, `声音将通过耳机播放`);
        break;
      case audio.DeviceType.BLUETOOTH_A2DP:
        this.audioOutputIcon = $r('sys.symbol.earphone_bluetooth_fill')
        Logger.info(TAG, `声音将通过蓝牙A2DP播放`);
        break;
      case audio.DeviceType.WIRED_HEADSET:
      case audio.DeviceType.WIRED_HEADPHONES:
        this.audioOutputIcon = $r('sys.symbol.headphones')
        Logger.info(TAG, `声音将通过有线耳机播放`);
        break;
      case audio.DeviceType.USB_HEADSET:
        this.audioOutputIcon = $r('sys.symbol.headphones')
        Logger.info(TAG, `声音将通过USB耳机播放`);
        break;
      case audio.DeviceType.NEARLINK:
        this.audioOutputIcon = $r('sys.symbol.earphone_bluetooth_fill')
        Logger.info(TAG, `声音将通过星闪设备播放`);
        break;
      default:
        break;
    }
  }

  showDeviceInfo(message: string | Resource, duration ?: number) {
    try {
      this.getUIContext().getPromptAction().showToast({
        message: message,
        duration: duration
      });
    } catch (error) {
      Logger.error(TAG,
        `showToast failed, code: ${error.code}, message: ${error.message}`);
    }
  }

  build() {
    AVCastPicker({
      onStateChange: (state: AVCastPickerState) => {
        Logger.info(TAG, `change avcastpicker: ${state}`);
      },
      customPicker: this.customPickerBuilder()
    })
      .width(24)
      .height(24)
  }
}