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

export enum PlayerSettingsOption {
  DECODER_TYPE,
  RUN_MODE,
  SYNC_MODE
}

@Component
export struct PlayerSettingsPanel {
  @Prop decoderTypeText: string = '';
  @Prop runModeText: string = '';
  @Prop syncModeText: string = '';
  @Prop dumpEnabled: boolean = false;
  @Prop volumePercent: number = 100;
  @Prop advancedExpanded: boolean = false;
  @Prop audioLowLatencyEnabled: boolean = false;
  @Prop autoHideControlsEnabled: boolean = true;
  @Prop retainLastFrameEnabled: boolean = true;
  @Prop retainLastFrameAvailable: boolean = true;
  @Prop lowLatencyEnabled: boolean = false;
  @Prop decodingOrderOutputEnabled: boolean = false;
  @Prop hdrVividConversionEnabled: boolean = false;
  @Prop hdrVividConversionAvailable: boolean = false;
  onChooseOption: (option: PlayerSettingsOption) => void = (_option: PlayerSettingsOption): void => {};
  onDumpChanged: (enabled: boolean) => void = (_enabled: boolean): void => {};
  onVolumeChanged: (volume: number) => void = (_volume: number): void => {};
  onAdvancedExpandedChanged: (expanded: boolean) => void = (_expanded: boolean): void => {};
  onAudioLowLatencyChanged: (enabled: boolean) => void = (_enabled: boolean): void => {};
  onAutoHideControlsChanged: (enabled: boolean) => void = (_enabled: boolean): void => {};
  onRetainLastFrameChanged: (enabled: boolean) => void = (_enabled: boolean): void => {};
  onLowLatencyChanged: (enabled: boolean) => void = (_enabled: boolean): void => {};
  onDecodingOrderOutputChanged: (enabled: boolean) => void = (_enabled: boolean): void => {};
  onHdrVividConversionChanged: (enabled: boolean) => void = (_enabled: boolean): void => {};
  onCancel: () => void = (): void => {};
  onRestoreDefaults: () => void = (): void => {};
  onApply: () => void = (): void => {};

  @Builder
  OptionRow(title: Resource, selectedText: string, onClick: () => void) {
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
    .onClick(onClick)
  }

  @Builder
  Footer() {
    Row({ space: '6vp' }) {
      Button($r('app.string.setting_restore_defaults'))
        .layoutWeight(1)
        .height('30vp')
        .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
        .fontSize('10fp')
        .backgroundColor('#E9EEF6')
        .fontColor('#1A5FB4')
        .onClick(this.onRestoreDefaults)
      Button($r('app.string.setting_cancel'))
        .layoutWeight(1)
        .height('30vp')
        .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
        .fontSize('10fp')
        .backgroundColor('#E9EEF6')
        .fontColor('#1A5FB4')
        .onClick(this.onCancel)
      Button($r('app.string.setting_apply'))
        .layoutWeight(1)
        .height('30vp')
        .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
        .fontSize('10fp')
        .backgroundColor('#0A59F7')
        .fontColor(Color.White)
        .onClick(this.onApply)
    }
    .width('100%')
    .height('44vp')
    .padding({ top: '8vp', bottom: '6vp' })
  }

  @Builder
  DumpOption() {
    Row() {
      Text($r('app.string.setting_dump'))
        .fontSize('16fp')
        .fontColor('#202124')
        .layoutWeight(1)
      Toggle({ type: ToggleType.Switch, isOn: this.dumpEnabled })
        .onChange((isOn: boolean): void => this.onDumpChanged(isOn))
    }
    .width('100%')
    .height('56vp')
    .padding({ left: '4vp', right: '4vp' })
  }

  @Builder
  SwitchOption(title: Resource, enabled: boolean, onChanged: (checked: boolean) => void,
    isAvailable: boolean = true, showUnavailableHint: boolean = false) {
    Row() {
      Column() {
        Text(title)
          .fontSize('16fp')
          .fontColor(isAvailable ? '#202124' : '#8A8A8A')
        if (!isAvailable && showUnavailableHint) {
          Text($r('app.string.setting_hdr_vivid_to_bt709_gpu_unavailable'))
            .fontSize('12fp')
            .fontColor('#8A8A8A')
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      Toggle({ type: ToggleType.Switch, isOn: enabled })
        .enabled(isAvailable)
        .onChange((isOn: boolean): void => onChanged(isOn))
    }
    .width('100%')
    .height(isAvailable || !showUnavailableHint ? '56vp' : '68vp')
    .padding({ left: '4vp', right: '4vp' })
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          this.OptionRow($r('app.string.setting_decoder_type'), this.decoderTypeText,
            (): void => this.onChooseOption(PlayerSettingsOption.DECODER_TYPE))
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_run_mode'), this.runModeText,
            (): void => this.onChooseOption(PlayerSettingsOption.RUN_MODE))
          Divider().color('#E5E7EB')
          this.OptionRow($r('app.string.setting_sync_mode'), this.syncModeText,
            (): void => this.onChooseOption(PlayerSettingsOption.SYNC_MODE))
          Divider().color('#E5E7EB')
          this.DumpOption()
          Divider().color('#E5E7EB')
          Column() {
            Row() {
              Text($r('app.string.setting_audio_volume'))
                .fontSize('16fp')
                .fontColor('#202124')
                .layoutWeight(1)
              Text(this.volumePercent.toFixed(0) + '%')
                .fontSize('14fp')
                .fontColor('#5F6368')
            }
            .width('100%')
            Slider({ value: this.volumePercent, min: 0, max: 100, step: 1 })
              .width('100%')
              .blockColor('#0A59F7')
              .selectedColor('#5DA9FF')
              .onChange((volume: number): void => this.onVolumeChanged(volume))
          }
          .width('100%')
          .padding({ top: '8vp', bottom: '8vp' })
          Divider().color('#E5E7EB')
          Row() {
            Text($r('app.string.setting_advanced'))
              .fontSize('14fp')
              .fontWeight(FontWeight.Medium)
              .fontColor('#5F6368')
              .layoutWeight(1)
            Text(this.advancedExpanded ? '−' : '+')
              .fontSize('20fp')
              .fontColor('#5F6368')
          }
          .width('100%')
          .height('48vp')
          .padding({ left: '4vp', right: '4vp' })
          .onClick((): void => this.onAdvancedExpandedChanged(!this.advancedExpanded))
          if (this.advancedExpanded) {
            this.DumpOption()
            Divider().color('#E5E7EB')
            this.SwitchOption($r('app.string.setting_audio_latency'), this.audioLowLatencyEnabled,
              this.onAudioLowLatencyChanged)
            Divider().color('#E5E7EB')
            this.SwitchOption($r('app.string.setting_auto_hide_controls'), this.autoHideControlsEnabled,
              this.onAutoHideControlsChanged)
            Divider().color('#E5E7EB')
            this.SwitchOption($r('app.string.setting_retain_last_frame'), this.retainLastFrameEnabled,
              this.onRetainLastFrameChanged, this.retainLastFrameAvailable)
            Divider().color('#E5E7EB')
            this.SwitchOption($r('app.string.setting_low_latency'), this.lowLatencyEnabled,
              this.onLowLatencyChanged)
            Divider().color('#E5E7EB')
            this.SwitchOption($r('app.string.setting_decoding_order_output'), this.decodingOrderOutputEnabled,
              this.onDecodingOrderOutputChanged)
            Divider().color('#E5E7EB')
            this.SwitchOption($r('app.string.setting_hdr_vivid_to_bt709'), this.hdrVividConversionEnabled,
              this.onHdrVividConversionChanged, this.hdrVividConversionAvailable, true)
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
