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

import { LocalizedText } from '../../common/LocalizedText';
import { RecorderPreprocessPreview } from './RecorderPreprocessPreview';

export enum RecorderSettingsOption {
  OUTPUT_FORMAT,
  VIDEO_CODEC,
  VIDEO_RESOLUTION,
  VIDEO_FRAME_RATE,
  SYNC_MODE,
  VIDEO_BITRATE,
  BITRATE_MODE,
  I_FRAME_INTERVAL,
  AUDIO_SAMPLE_RATE,
  AUDIO_CHANNEL_COUNT,
  AUDIO_BITRATE,
  AUDIO_CAPTURE_LATENCY,
  VIDEO_STABILIZATION,
  VIDEO_PREPROCESSING,
  DROP_FRAME_RATE,
  DUAL_OUTPUT,
  CROP_PERCENT,
  DOWNSAMPLING_TARGET,
  SECONDARY_TARGET
}

interface RecorderSettingRowOptions {
  title: Resource;
  selectedText: string;
  onClick: () => void;
  available: boolean;
}

@Component
export struct RecorderSettingsPanel {
  @Prop capabilityHint: string = '';
  onCheckCapabilities: () => void = (): void => {};
  @Prop videoDumpEnabled: boolean = false;
  @Prop stopOnLowSpace: boolean = false;
  onStorageProtectionChanged: (enabled: boolean) => void = (_enabled: boolean): void => {};
  @Prop advancedOptionsSupported: boolean = false;
  @Prop dropFrameRateEnabled: boolean = false;
  @Prop outputFormatText: string = '';
  @Prop videoCodecText: string = '';
  @Prop videoResolutionText: string = '';
  @Prop videoFrameRateText: string = '';
  @Prop syncModeText: string = '';
  @Prop videoBitrateText: string = '';
  @Prop bitrateModeText: string = '';
  @Prop iFrameIntervalText: string = '';
  @Prop audioSampleRateText: string = '';
  @Prop audioChannelCountText: string = '';
  @Prop audioBitrateText: string = '';
  @Prop audioCaptureLatencyText: string = '';
  @Prop videoStabilizationText: string = '';
  @Prop videoPreprocessingText: string = '';
  @Prop dropFrameRateText: string = '';
  @Prop dualOutputText: string = '';
  @Prop preprocessMode: number = 0;
  @Prop sourceWidth: number = 1920;
  @Prop sourceHeight: number = 1080;
  @Prop sourceFrameRate: number = 30;
  @Prop cropPercent: number = 75;
  @Prop targetHeight: number = 720;
  @Prop secondaryHeight: number = 720;
  @Prop secondaryEnabled: boolean = false;
  @Prop dropToFrameRate: number = 0;
  onVideoDumpChanged: (enabled: boolean) => void = (_enabled: boolean): void => {};
  onChooseOption: (option: RecorderSettingsOption) => void = (_option: RecorderSettingsOption): void => {};
  onCancel: () => void = (): void => {};
  onRestoreDefaults: () => void = (): void => {};
  onApply: () => void = (): void => {};

  @Builder
  OptionRow($$: RecorderSettingRowOptions) {
    Row() {
      Text($$.title)
        .fontSize('16fp')
        .fontColor('#202124')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .layoutWeight(1)
      Text($$.selectedText)
        .fontSize('14fp')
        .fontColor('#5F6368')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      Text('›')
        .fontSize('24fp')
        .fontColor('#8A8A8A')
        .margin({ left: '8vp' })
    }
    .width('100%')
    .height('56vp')
    .padding({ left: '4vp', right: '4vp' })
    .enabled($$.available)
    .opacity($$.available ? 1 : 0.45)
    .onClick($$.onClick)
  }

  @Builder
  GroupHeader(title: Resource) {
    Row() {
      Text(title)
        .fontSize('13fp')
        .fontColor('#5F6368')
        .fontWeight(FontWeight.Medium)
    }
    .width('100%')
    .height('36vp')
    .padding({ left: '4vp', right: '4vp', top: '10vp', bottom: '4vp' })
  }

  @Builder
  Footer() {
    Row({ space: '8vp' }) {
      Button($r('app.string.setting_restore_defaults'))
        .layoutWeight(1)
        .height('44vp')
        .backgroundColor('#E9EEF6')
        .fontColor('#1A5FB4')
        .onClick(this.onRestoreDefaults)
      Button($r('app.string.setting_cancel'))
        .layoutWeight(1)
        .height('44vp')
        .backgroundColor('#E9EEF6')
        .fontColor('#1A5FB4')
        .onClick(this.onCancel)
      Button($r('app.string.setting_apply'))
        .layoutWeight(1)
        .height('44vp')
        .backgroundColor('#0A59F7')
        .fontColor(Color.White)
        .onClick(this.onApply)
    }
    .width('100%')
    .padding({ top: '12vp', bottom: '8vp' })
  }

  build() {
    Column() {
      Text(this.capabilityHint).fontSize(12).fontColor('#667085').width('100%').padding(8)
      Button(LocalizedText.get($r('app.string.configuration_check_combination'))).fontSize(12).onClick(this.onCheckCapabilities)
      Scroll() {
        Column() {
          this.GroupHeader($r('app.string.setting_group_output'))
          Row() {
            Text($r('app.string.setting_recorder_dump'))
              .fontSize('16fp')
              .fontColor('#202124')
              .layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: this.videoDumpEnabled })
              .onChange((isOn: boolean): void => this.onVideoDumpChanged(isOn))
          }
          .width('100%')
          .height('52vp')
          Divider().color('#E5E7EB')
          this.OptionRow({ title: $r('app.string.setting_output_format'), selectedText: this.outputFormatText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.OUTPUT_FORMAT),
            available: true })
          Divider().color('#E5E7EB')
          this.GroupHeader($r('app.string.setting_group_video'))
          this.OptionRow({ title: $r('app.string.setting_codec'), selectedText: this.videoCodecText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.VIDEO_CODEC),
            available: true })
          Divider().color('#E5E7EB')
          this.OptionRow({ title: $r('app.string.setting_resolution'), selectedText: this.videoResolutionText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.VIDEO_RESOLUTION),
            available: true })
          Divider().color('#E5E7EB')
          this.OptionRow({ title: $r('app.string.setting_frame_rate'), selectedText: this.videoFrameRateText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.VIDEO_FRAME_RATE),
            available: true })
          Divider().color('#E5E7EB')
          this.OptionRow({ title: $r('app.string.setting_video_bitrate'), selectedText: this.videoBitrateText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.VIDEO_BITRATE),
            available: true })
          Divider().color('#E5E7EB')
          this.OptionRow({ title: $r('app.string.setting_bitrate_mode'), selectedText: this.bitrateModeText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.BITRATE_MODE),
            available: true })
          Divider().color('#E5E7EB')
          this.OptionRow({ title: $r('app.string.setting_i_frame_interval'), selectedText: this.iFrameIntervalText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.I_FRAME_INTERVAL),
            available: true })
          Divider().color('#E5E7EB')
          this.GroupHeader($r('app.string.setting_group_audio'))
          this.OptionRow({ title: $r('app.string.setting_audio_sample_rate'), selectedText: this.audioSampleRateText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.AUDIO_SAMPLE_RATE),
            available: true })
          Divider().color('#E5E7EB')
          this.OptionRow({ title: $r('app.string.setting_audio_channel_count'), selectedText: this.audioChannelCountText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.AUDIO_CHANNEL_COUNT),
            available: true })
          Divider().color('#E5E7EB')
          this.OptionRow({ title: $r('app.string.setting_audio_bitrate'), selectedText: this.audioBitrateText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.AUDIO_BITRATE),
            available: true })
          Divider().color('#E5E7EB')
          this.OptionRow({ title: $r('app.string.setting_audio_capture_latency'), selectedText: this.audioCaptureLatencyText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.AUDIO_CAPTURE_LATENCY),
            available: true })
          Divider().color('#E5E7EB')
          this.GroupHeader($r('app.string.setting_group_control'))
          Row() {
            Text($r('app.string.rec_storage_protect')).fontSize(15).layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: this.stopOnLowSpace })
              .onChange((enabled: boolean): void => this.onStorageProtectionChanged(enabled))
          }.width('100%').padding({ top: 8, bottom: 8 })
          Text($r('app.string.rec_storage_note')).fontSize(12).fontColor('#667085').width('100%')
          this.OptionRow({ title: $r('app.string.setting_sync_mode'), selectedText: this.syncModeText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.SYNC_MODE),
            available: true })
          Divider().color('#E5E7EB')
          this.OptionRow({ title: $r('app.string.setting_video_stabilization'), selectedText: this.videoStabilizationText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.VIDEO_STABILIZATION),
            available: true })
          Divider().color('#E5E7EB')
          this.GroupHeader($r('app.string.setting_group_preproc'))
          RecorderPreprocessPreview({
            sourceWidth: this.sourceWidth, sourceHeight: this.sourceHeight, sourceFrameRate: this.sourceFrameRate,
            preprocessMode: this.preprocessMode, cropPercent: this.cropPercent, targetHeight: this.targetHeight,
            secondaryHeight: this.secondaryHeight, secondaryEnabled: this.secondaryEnabled,
            dropToFrameRate: this.dropToFrameRate
          })
          this.OptionRow({ title: $r('app.string.setting_video_preproc'), selectedText: this.videoPreprocessingText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.VIDEO_PREPROCESSING),
            available: this.advancedOptionsSupported })
          Divider().color('#E5E7EB')
          this.OptionRow({ title: $r('app.string.setting_drop_frame_rate'), selectedText: this.dropFrameRateText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.DROP_FRAME_RATE),
            available: this.dropFrameRateEnabled })
          if (this.preprocessMode === 2) {
            Button(LocalizedText.get($r('app.string.preprocess_crop_percent_prefix')) + this.cropPercent + LocalizedText.get($r('app.string.preprocess_adjust_suffix'))).fontSize(13)
              .enabled(this.advancedOptionsSupported)
              .onClick((): void => this.onChooseOption(RecorderSettingsOption.CROP_PERCENT))
          }
          if (this.preprocessMode === 1) {
            Button(LocalizedText.get($r('app.string.preprocess_downsample_prefix')) + this.targetHeight + LocalizedText.get($r('app.string.preprocess_height_adjust_suffix'))).fontSize(13)
              .enabled(this.advancedOptionsSupported)
              .onClick((): void => this.onChooseOption(RecorderSettingsOption.DOWNSAMPLING_TARGET))
          }
          Divider().color('#E5E7EB')
          this.OptionRow({ title: $r('app.string.setting_dual_output'), selectedText: this.dualOutputText,
            onClick: (): void => this.onChooseOption(RecorderSettingsOption.DUAL_OUTPUT),
            available: this.advancedOptionsSupported })
          if (this.secondaryEnabled) {
            Button(LocalizedText.get($r('app.string.preprocess_secondary_prefix')) + this.secondaryHeight + LocalizedText.get($r('app.string.preprocess_height_adjust_suffix'))).fontSize(13)
              .enabled(this.advancedOptionsSupported)
              .onClick((): void => this.onChooseOption(RecorderSettingsOption.SECONDARY_TARGET))
          }
        }
        .width('100%')
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
      this.Footer()
    }
    .width('100%')
    .height('100%')
    .padding({ left: '20vp', right: '20vp' })
    .backgroundColor('#F8F9FA')
  }
}
