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
  DUAL_OUTPUT
}

@Component
export struct RecorderSettingsPanel {
  @Prop videoDumpEnabled: boolean = false;
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
  onVideoDumpChanged: (enabled: boolean) => void = (_enabled: boolean): void => {};
  onChooseOption: (option: RecorderSettingsOption) => void = (_option: RecorderSettingsOption): void => {};
  onCancel: () => void = (): void => {};
  onRestoreDefaults: () => void = (): void => {};
  onApply: () => void = (): void => {};

  @Builder
  OptionRow(title: Resource, selectedText: string, onClick: () => void,
    isOptionEnabled: boolean = true) {
    Row() {
      Text(title)
        .fontSize('16fp')
        .fontColor('#202124')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .layoutWeight(1)
      Text(selectedText)
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
    .enabled(isOptionEnabled)
    .opacity(isOptionEnabled ? 1 : 0.45)
    .onClick(onClick)
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
          this.OptionRow($r('app.string.setting_output_format'), this.outputFormatText,
            (): void => this.onChooseOption(RecorderSettingsOption.OUTPUT_FORMAT))
          Divider().color('#E5E7EB')
          this.GroupHeader($r('app.string.setting_group_video'))
          this.OptionRow($r('app.string.setting_codec'), this.videoCodecText,
            (): void => this.onChooseOption(RecorderSettingsOption.VIDEO_CODEC))
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_resolution'), this.videoResolutionText,
            (): void => this.onChooseOption(RecorderSettingsOption.VIDEO_RESOLUTION))
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_frame_rate'), this.videoFrameRateText,
            (): void => this.onChooseOption(RecorderSettingsOption.VIDEO_FRAME_RATE))
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_video_bitrate'), this.videoBitrateText,
            (): void => this.onChooseOption(RecorderSettingsOption.VIDEO_BITRATE))
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_bitrate_mode'), this.bitrateModeText,
            (): void => this.onChooseOption(RecorderSettingsOption.BITRATE_MODE))
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_i_frame_interval'), this.iFrameIntervalText,
            (): void => this.onChooseOption(RecorderSettingsOption.I_FRAME_INTERVAL))
          Divider().color('#E5E7EB')
          this.GroupHeader($r('app.string.setting_group_audio'))
          this.OptionRow($r('app.string.setting_audio_sample_rate'), this.audioSampleRateText,
            (): void => this.onChooseOption(RecorderSettingsOption.AUDIO_SAMPLE_RATE))
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_audio_channel_count'), this.audioChannelCountText,
            (): void => this.onChooseOption(RecorderSettingsOption.AUDIO_CHANNEL_COUNT))
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_audio_bitrate'), this.audioBitrateText,
            (): void => this.onChooseOption(RecorderSettingsOption.AUDIO_BITRATE))
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_audio_capture_latency'), this.audioCaptureLatencyText,
            (): void => this.onChooseOption(RecorderSettingsOption.AUDIO_CAPTURE_LATENCY))
          Divider().color('#E5E7EB')
          this.GroupHeader($r('app.string.setting_group_control'))
          this.OptionRow($r('app.string.setting_sync_mode'), this.syncModeText,
            (): void => this.onChooseOption(RecorderSettingsOption.SYNC_MODE))
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_video_stabilization'), this.videoStabilizationText,
            (): void => this.onChooseOption(RecorderSettingsOption.VIDEO_STABILIZATION))
          Divider().color('#E5E7EB')
          this.GroupHeader($r('app.string.setting_group_preproc'))
          this.OptionRow($r('app.string.setting_video_preproc'), this.videoPreprocessingText,
            (): void => this.onChooseOption(RecorderSettingsOption.VIDEO_PREPROCESSING),
            this.advancedOptionsSupported)
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_drop_frame_rate'), this.dropFrameRateText,
            (): void => this.onChooseOption(RecorderSettingsOption.DROP_FRAME_RATE),
            this.dropFrameRateEnabled)
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_dual_output'), this.dualOutputText,
            (): void => this.onChooseOption(RecorderSettingsOption.DUAL_OUTPUT),
            this.advancedOptionsSupported)
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
