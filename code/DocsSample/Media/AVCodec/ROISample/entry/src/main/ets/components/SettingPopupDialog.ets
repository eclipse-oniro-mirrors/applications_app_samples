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
// components/MultiSelectDialog.ets
import { SettingPopupOptionItem } from '../model/SettingPopupOptionItem';

@Preview
@CustomDialog
export struct SettingPopupDialog {
  controller: CustomDialogController;
  @State title: string = 'Setting';
  @State options: SettingPopupOptionItem[] = [];

  build() {
    Column() {
      // title
      Text(this.title)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Center)
        .fontColor($r('sys.color.font_primary'))

      // Option list
      ForEach(this.options, (item: SettingPopupOptionItem, index: number) => {
        Row() {
          Text(item.label)
            .fontSize('16fp')
            .fontWeight(500)
            .fontColor($r('sys.color.font_primary'))
            .align(Alignment.Center)

          Toggle({ type: ToggleType.Switch, isOn: !!item.checked })
            .selectedColor($r('sys.color.brand'))
            .switchPointColor($r('sys.color.comp_background_list_card'))
            .onChange((isOn: boolean) => {
              item.checked = isOn;
              item.handler(item.checked);
            })
        }
        .width('100%')
        .height(48)
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .border({
          width: { bottom: 1 },
          color: $r('sys.color.comp_background_tertiary'),
          style: BorderStyle.Solid
        })
      })

      Button($r('app.string.setting_ok'), { buttonStyle: ButtonStyleMode.TEXTUAL })
        .width('100%')
        .height(40)
        .margin({ top: 15 })
        .onClick(() => {
          this.controller.close();
        })
    }
    .width('100%')
    .padding({
      left: 24,
      right: 24,
      top: 15,
      bottom: 15
    })
    .alignItems(HorizontalAlign.Center);
  }
}