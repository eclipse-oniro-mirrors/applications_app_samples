/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { router } from '@kit.ArkUI';

const TAG = 'Tag_NR_Menu';

@Entry
@Component
struct MenuPage {
  @StorageLink('apiMode') apiMode: string = 'C API';
  @StorageLink('defaultSourceType') defaultSourceType: string = 'LIVE';
  @StorageLink('defaultSamplingRate') defaultSamplingRate: string = '44100';
  @StorageLink('defaultChannels') defaultChannels: string = '2ch';
  @StorageLink('defaultContentType') defaultContentType: string = 'MUSIC';
  @StorageLink('defaultPlaybackRate') defaultPlaybackRate: string = '44100';
  @StorageLink('defaultPlaybackChannels') defaultPlaybackChannels: string = '2ch';
  @StorageLink('logLimit') logLimit: number = 50;

  @State showStreamDefault: boolean = true;
  @State showModeDefault: boolean = true;
  @State showSupportedDefault: boolean = true;
  @State showPlaybackDefault: boolean = false;

  @State pickerVisible: string = '';

  aboutToAppear(): void {
    console.info(`${TAG}: aboutToAppear`);
  }

  @Builder
  MenuItem(label: ResourceStr, value: string, action: () => void) {
    Row() {
      Text(label).fontSize(13).fontColor('#2C2C2A')
      Blank()
      Text(value).fontSize(11).fontColor('#007DFF')
      Text(' ›').fontSize(13).fontColor('#B4B2A9')
    }
    .width('100%')
    .height(48)
    .padding({ left: 16, right: 16 })
    .backgroundColor('#FFF')
    .borderRadius(8)
    .margin({ bottom: 1 })
    .onClick(() => action())
  }

  @Builder
  SectionTitle(title: ResourceStr) {
    Text(title).fontSize(11).fontColor('#888780').margin({ top: 12, bottom: 4, left: 16 })
  }

  @Builder
  ToggleItem(label: ResourceStr, isOn: boolean, onChange: (v: boolean) => void) {
    Row() {
      Text(label).fontSize(13).fontColor('#2C2C2A')
      Blank()
      Toggle({ type: ToggleType.Switch, isOn: isOn })
        .width(40).height(24)
        .onChange(onChange)
    }
    .width('100%')
    .height(48)
    .padding({ left: 16, right: 16 })
    .backgroundColor('#FFF')
    .borderRadius(8)
    .margin({ bottom: 1 })
  }

  build() {
    Column() {
      Row() {
        Text($r('app.string.menu_back')).fontSize(14).fontColor('#007DFF').onClick(() => router.back())
        Blank()
        Text($r('app.string.menu_title')).fontSize(16).fontWeight(FontWeight.Bold).fontColor('#2C2C2A')
        Blank()
      }
      .width('100%')
      .height(48)
      .padding({ left: 12, right: 12 })
      .backgroundColor('#FFF')

      Scroll() {
        Column() {
          this.SectionTitle($r('app.string.menu_section_api_config'))
          this.MenuItem($r('app.string.menu_api_mode'), this.apiMode, () => {
            this.apiMode = this.apiMode === 'C API' ? 'JS API' : 'C API';
          })

          this.SectionTitle($r('app.string.menu_section_record_config'))
          this.MenuItem('SourceType', this.defaultSourceType, () => {
            const types = ['LIVE', 'MIC', 'CAMCORDER', 'VOICE_COMMUNICATION'];
            const idx = types.indexOf(this.defaultSourceType);
            this.defaultSourceType = types[(idx + 1) % types.length];
          })
          this.MenuItem($r('app.string.menu_sampling_rate'), this.defaultSamplingRate, () => {
            const rates = ['8000', '16000', '44100', '48000'];
            const idx = rates.indexOf(this.defaultSamplingRate);
            this.defaultSamplingRate = rates[(idx + 1) % rates.length];
          })
          this.MenuItem($r('app.string.menu_channels'), this.defaultChannels, () => {
            this.defaultChannels = this.defaultChannels === '1ch' ? '2ch' : '1ch';
          })

          this.SectionTitle($r('app.string.menu_section_playback_config'))
          this.MenuItem('ContentType', this.defaultContentType, () => {
            const types = ['MUSIC', 'SPEECH', 'MOVIE', 'SONIFICATION'];
            const idx = types.indexOf(this.defaultContentType);
            this.defaultContentType = types[(idx + 1) % types.length];
          })
          this.MenuItem($r('app.string.menu_sampling_rate'), this.defaultPlaybackRate, () => {
            const rates = ['8000', '16000', '44100', '48000'];
            const idx = rates.indexOf(this.defaultPlaybackRate);
            this.defaultPlaybackRate = rates[(idx + 1) % rates.length];
          })
          this.MenuItem($r('app.string.menu_channels'), this.defaultPlaybackChannels, () => {
            this.defaultPlaybackChannels = this.defaultPlaybackChannels === '1ch' ? '2ch' : '1ch';
          })

          this.SectionTitle($r('app.string.menu_section_display_options'))
          this.ToggleItem($r('app.string.menu_show_stream_status'), this.showStreamDefault, (v: boolean) => { this.showStreamDefault = v; })
          this.ToggleItem($r('app.string.menu_show_current_mode'), this.showModeDefault, (v: boolean) => { this.showModeDefault = v; })
          this.ToggleItem($r('app.string.menu_show_supported_modes'), this.showSupportedDefault, (v: boolean) => { this.showSupportedDefault = v; })
          this.ToggleItem($r('app.string.menu_show_playback_status'), this.showPlaybackDefault, (v: boolean) => { this.showPlaybackDefault = v; })

          this.SectionTitle($r('app.string.menu_section_callback_list'))
          this.MenuItem($r('app.string.menu_retain_count'), String(this.logLimit), () => {
            const limits = [20, 50, 100, 200];
            const idx = limits.indexOf(this.logLimit);
            this.logLimit = limits[(idx + 1) % limits.length];
          })

          this.SectionTitle($r('app.string.menu_section_view'))
          this.MenuItem($r('app.string.menu_view_instructions'), '', () => {})
          this.MenuItem($r('app.string.menu_view_simple_example'), '', () => { router.pushUrl({ url: 'pages/NoiseReductionSimpleExample' }); })
        }
        .width('100%')
        .margin({ bottom: 20 })
      }
      .layoutWeight(1)
      .backgroundColor('#F1F3F5')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
