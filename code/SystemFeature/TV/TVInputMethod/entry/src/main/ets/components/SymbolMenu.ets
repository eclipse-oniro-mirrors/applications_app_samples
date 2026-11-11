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

import { sourceListType } from '../model/KeyboardKeyData';
import { DeleteItem } from './DeleteItem';
import { keyItemGray } from './KeyItemGray';
import { keyItem } from './KeyItem';
import { SpaceItem } from './SpaceItem';
import { ReturnItem } from './ReturnItem';
import { ConstantNum, KeyStyle } from '../common/StyleConfiguration';
import { getString } from './KeyMenu';

//符号键盘
@Component
export struct SymbolMenu {
  @Link inputStyle: KeyStyle;
  private symbolList: sourceListType[] = [];
  @Link menuType: number;

  @Styles
  pressedStyles() {
    .backgroundColor($r('app.color.key_item_normal_pressed'))
  }

  @Styles
  normalStyles() {
    .backgroundColor($r('app.color.normal_BG'))
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        ForEach(this.symbolList.slice(0, ConstantNum.NUM_10), (item: sourceListType, index: number) => {
          keyItem({
            keyValue: { content: item.content, title: item.content, upperContent: item.content },
            inputStyle: $inputStyle,
            keyItem: { index: index, col: 1, panel: 'SymMenu' }
          })
        }, (item: sourceListType) => item.content)
      }
      .width('100%')
      .height(this.inputStyle.basicButtonHeight)
      .margin({ top: this.inputStyle.paddingTop })

      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        ForEach(this.symbolList.slice(ConstantNum.NUM_10, ConstantNum.NUM_20),
          (item: sourceListType, index: number) => {
            keyItem({
              keyValue: { content: item.content, title: item.content, upperContent: item.content },
              inputStyle: $inputStyle,
              keyItem: { index: index, col: ConstantNum.NUM_2, panel: 'SymMenu' }
            })
          }, (item: sourceListType) => item.content)
      }
      .width('100%')
      .height(this.inputStyle.basicButtonHeight)
      .margin({ top: this.inputStyle.paddingTop })

      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        keyItemGray({
          keyValue: getString($r('app.string.string_text_123')),
          menuType: $menuType,
          inputStyle: $inputStyle,
          keyItem: { index: 0, col: ConstantNum.NUM_3, panel: 'SymMenu' }
        })
        ForEach(this.symbolList.slice(ConstantNum.NUM_21, ConstantNum.NUM_28),
          (item: sourceListType, index: number) => {
            keyItem({
              keyValue: { content: item.content, title: item.content, upperContent: item.content },
              inputStyle: $inputStyle,
              keyItem: { index: index + 1, col: ConstantNum.NUM_3, panel: 'SymMenu' }
            })
          }, (item: sourceListType) => item.content)
        DeleteItem({
          inputStyle: $inputStyle,
          keyItem: { index: ConstantNum.NUM_8, col: ConstantNum.NUM_3, panel: 'SymMenu' }
        })
      }
      .width('100%')
      .height(this.inputStyle.basicButtonHeight)
      .margin({ top: this.inputStyle.paddingTop })


      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        keyItemGray({
          keyValue: getString($r('app.string.string_text_ABC')),
          menuType: $menuType,
          inputStyle: $inputStyle,
          keyItem: { index: 0, col: ConstantNum.NUM_4, panel: 'SymMenu' }
        })
        keyItem({
          keyValue: { content: '<', title: '<', upperContent: '<' },
          inputStyle: $inputStyle,
          keyItem: { index: 1, col: ConstantNum.NUM_4, panel: 'SymMenu' }
        })
        keyItem({
          keyValue: { content: '>', title: '>', upperContent: '>' },
          inputStyle: $inputStyle,
          keyItem: { index: ConstantNum.NUM_2, col: ConstantNum.NUM_4, panel: 'SymMenu' }
        })
        Flex({
          direction: FlexDirection.Column, alignItems: ItemAlign.Center,
          justifyContent: FlexAlign.Center
        }) {
          Text(`${ConstantNum.NUM_12}`).fontSize(this.inputStyle.number1234ontFSize).fontColor(Color.White)
          Text(`${ConstantNum.NUM_34}`).fontSize(this.inputStyle.number1234ontFSize).fontColor(Color.White)
        }
        .backgroundColor(Color.Black)
        .borderRadius(ConstantNum.NUM_4)
        .width(this.inputStyle.basicButtonWidth)
        .height(this.inputStyle.basicButtonHeight)
        .shadow({ radius: 1, color: $r('app.color.shadow'), offsetY: ConstantNum.NUM_3 })
        .borderColor(Color.White)
        .borderWidth(1)

        SpaceItem({
          inputStyle: $inputStyle,
          keyItem: { index: ConstantNum.NUM_3, col: ConstantNum.NUM_4, panel: 'SymMenu' }
        })
        keyItem({
          keyValue: { content: '.', title: '.', upperContent: '.' },
          inputStyle: $inputStyle,
          keyItem: { index: ConstantNum.NUM_4, col: ConstantNum.NUM_4, panel: 'SymMenu' }
        })
        ReturnItem({
          inputStyle: $inputStyle,
          keyItem: { index: ConstantNum.NUM_5, col: ConstantNum.NUM_4, panel: 'SymMenu' }
        })
      }
      .width('100%')
      .height(this.inputStyle.basicButtonHeight)
      .margin({ top: this.inputStyle.paddingTop })
    }
    .padding({
      left: this.inputStyle.paddingLeftRight,
      right: this.inputStyle.paddingLeftRight
    })
  }
}
