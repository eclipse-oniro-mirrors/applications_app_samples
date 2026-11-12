/**
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
import { ConstantNum, KeyStyle, StyleConfiguration } from '../common/StyleConfiguration';
import { InputHandler } from '../model/KeyboardController';

@Preview
@Component
export struct TopMenu {
  @Link inputStyle: KeyStyle;

  build() {
    Column() {
      Divider()
        .color($r('app.color.light_gray'))
        .width('100%')
        .margin({ bottom: ConstantNum.NUM_11 })
      Row() {
        Stack() {
          Image($r('app.media.ic_keyboard'))
            .width(this.inputStyle.downMenuPicWidth)
            .height(this.inputStyle.downMenuHeight)
            .objectFit(ImageFit.Contain)
            .id('keyboardMenu')
            .visibility(Visibility.Hidden)
        }
        .margin({ left: ConstantNum.NUM_8 })
        .width(this.inputStyle.downMenuWidth)
        .borderRadius(ConstantNum.NUM_4)
        .height('100%')

        Divider()
          .vertical(true)
          .color($r('app.color.light_gray'))
          .margin({ left: ConstantNum.NUM_8 })
        Blank()
        Divider()
          .vertical(true)
          .color($r('app.color.light_gray'))
          .margin({ right: ConstantNum.NUM_8 })
        Stack() {
          Image($rawfile('down.svg'))
            .width(this.inputStyle.downMenuPicWidth)
            .height(this.inputStyle.downMenuPicHeight)
            .objectFit(ImageFit.Contain)
            .id('kikaInputDown')
        }
        .width(this.inputStyle.downMenuWidth)
        .borderRadius(ConstantNum.NUM_4)
        .height('100%')
      }
      .width('100%')
      .layoutWeight(1)

      Row() {
        Divider()
          .color($r('app.color.light_gray'))
          .width(this.inputStyle.editDriverLeft)
        Divider()
          .color($r('app.color.light_gray'))
          .layoutWeight(1)
      }
      .height(ConstantNum.NUM_12)
      .alignItems(VerticalAlign.Bottom)
    }
    .width('100%')
    .height(this.inputStyle.downMenuHeight)
  }
}
