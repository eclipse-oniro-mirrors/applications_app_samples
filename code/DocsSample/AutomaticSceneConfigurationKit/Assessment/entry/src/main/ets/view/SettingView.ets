/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import SettingModel from '../model/SettingModel';

@ComponentV2
export default struct SettingView {
  @Param setting: SettingModel = new SettingModel();

  build() {
    Column({ space: 12 }) {
      Text($r('app.string.hardening_title'))
        .fontSize($r('app.float.font_size_section'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))

      Row() {
        Text($r('app.string.setting_clear_clipboard'))
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.setting.clearClipboard })
          .onChange((isOn: boolean) => {
            this.setting.clearClipboard = isOn;
          })
      }
      .width('100%')

      Row() {
        Text($r('app.string.setting_privacy_mode'))
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.setting.privacyMode })
          .onChange((isOn: boolean) => {
            this.setting.privacyMode = isOn;
          })
      }
      .width('100%')

      Row() {
        Text($r('app.string.setting_simple_keyboard'))
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.setting.simpleKeyboard })
          .onChange((isOn: boolean) => {
            this.setting.simpleKeyboard = isOn;
          })
      }
      .width('100%')

      Divider()
        .color($r('app.color.divider'))

      Row() {
        Text($r('app.string.setting_allow_developer_mode'))
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.setting.allowDeveloperMode })
          .onChange((isOn: boolean) => {
            this.setting.allowDeveloperMode = isOn;
          })
      }
      .width('100%')

      Row() {
        Text($r('app.string.setting_allow_emulator'))
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.setting.allowEmulator })
          .onChange((isOn: boolean) => {
            this.setting.allowEmulator = isOn;
          })
      }
      .width('100%')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding($r('app.float.card_padding'))
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
  }
}
