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

import { ConstantNum, KeyStyle } from '../common/StyleConfiguration';

//九宫格切换组件
@Component
export struct SelNineKeyItem {
  @Link inputStyle: KeyStyle;
  @State isNineKey: boolean | undefined = AppStorage.get<boolean>('isNineKey');

  @Styles
  pressedStyles() {
    .backgroundColor($r('app.color.key_item_gray_pressed'))
  }

  @Styles
  normalStyles() {
    .backgroundColor($r('app.color.symbolColor'))
  }

  build() {
    Stack() {
      Image($rawfile('shift.svg'))
        .width(this.inputStyle.featurePicSize)
        .height(this.inputStyle.featurePicSize)
    }
    .backgroundColor('#a8abb7')
    .borderRadius(ConstantNum.NUM_4)
    .onClick(() => {
      if (this.isNineKey === false) {
        AppStorage.setOrCreate('isNineKey', true);
      } else {
        AppStorage.setOrCreate('isNineKey', false);
      }
    })
    .width(this.inputStyle.switchButtonWidth)
    .height(this.inputStyle.basicButtonHeight)
    .shadow({ radius: 1, color: $r('app.color.shadow'), offsetY: ConstantNum.NUM_3 })
    .stateStyles({
      normal: this.normalStyles, pressed: this.pressedStyles
    })
  }
}
