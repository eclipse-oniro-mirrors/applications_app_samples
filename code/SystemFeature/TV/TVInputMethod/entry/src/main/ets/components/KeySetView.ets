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
import { KeyStyle } from '../common/StyleConfiguration';
import { lpx } from './KeyMenu';

@Component
export struct KeySetView {
  @Link inputStyle: KeyStyle;
  @StorageLink('isNineKey') isNineKey: string = '';

  build() {
    Row() {
      Column() {
        Stack() {
          Image($r('app.media.ic_keyboard'))
            .width(this.inputStyle.downMenuWidth)
            .height(this.inputStyle.downMenuHeight)
            .fillColor(this.isNineKey ? $r('app.color.fill_color_1') : $r('app.color.fill_color_0'))
            .onClick(() => {
              AppStorage.setOrCreate('isNineKey', false);
              AppStorage.setOrCreate('isKeySet', false);
            })
        }
        .width(this.inputStyle.downMenuWidth)
        .visibility(Visibility.Hidden)

        Text('拼音26键')
          .fontColor(this.isNineKey ? $r('app.color.fill_color_1') : $r('app.color.fill_color_0'))
          .fontSize('14fp')
          .margin({ top: '8vp' })
      }

      Column() {
        Stack() {
          Image($r('app.media.ic_keyboard'))
            .width(this.inputStyle.downMenuWidth)
            .height(this.inputStyle.downMenuHeight)
            .fillColor(this.isNineKey ? $r('app.color.fill_color_0') : $r('app.color.fill_color_1'))
            .onClick(() => {
              AppStorage.setOrCreate('isNineKey', true);
              AppStorage.setOrCreate('isKeySet', false);
            })
            .visibility(Visibility.Hidden)
        }
        .width(this.inputStyle.downMenuWidth)

        Text($r('app.string.pinyin_nine'))
          .fontColor(this.isNineKey ? $r('app.color.fill_color_0') : $r('app.color.fill_color_1'))
          .fontSize($r('app.float.constant_14'))
          .margin({ top: $r('app.float.constant_8') })
      }

    }
    .backgroundColor($r('app.color.setView_BG'))
    .width('100%')
    .height(lpx(303))
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceEvenly)

  }
}
