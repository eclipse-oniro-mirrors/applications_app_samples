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
// 大写九宫格的按键组件

import { keyNineChinaType } from '../model/KeyboardKeyData';
import { ConstantNum, KeyStyle } from '../common/StyleConfiguration';
import { InputHandler } from '../model/KeyboardController';

@Component
export struct KeyNineItem {
  @Link inputStyle: KeyStyle;
  private keyValue: keyNineChinaType = {
    title: '',
    content: ''
  }

  build() {
    Stack() {
      Flex({
        direction: FlexDirection.Column,
        alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start
      }) {
        Text(this.keyValue.content)
          .fontSize(ConstantNum.NUM_10)
          .fontColor($r('app.color.normal1_BG'))
          .margin({ top: $r('app.float.t_top'), bottom: $r('app.float.t_bottom') })
        Text(this.keyValue.title).fontSize(ConstantNum.NUM_16)
      }
    }
    .borderRadius(ConstantNum.NUM_6)
    .width('20%')
    .height(this.inputStyle.nineButtonHeight)
  }
}
