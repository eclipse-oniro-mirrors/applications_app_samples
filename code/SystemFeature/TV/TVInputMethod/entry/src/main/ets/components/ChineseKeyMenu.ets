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

import { keySourceListType } from '../model/KeyboardKeyData';
import { keyItemNumber } from './KeyItemNumber';
import { DeleteItem } from './DeleteItem';
import { keyItemGray } from './KeyItemGray';
import { SpaceItem } from './SpaceItem';
import { ChangeItem } from './ChangeItem';
import { ReturnItem } from './ReturnItem';
import { ConstantNum, inputStyleConfig, KeyStyle } from '../common/StyleConfiguration';
import { ShiftItem } from './ShiftItem';
import { lpx } from './KeyMenu';

//chinesekey键盘
@Component
export struct ChineseKeyMenu {
  @Link inputStyle: KeyStyle;
  private keyList: keySourceListType[] = [];
  @Link menuType: number;
  @StorageLink('keyState') upper: number = 0;
  @StorageProp('4kSize') is4k: boolean = false;

  @Styles
  pressedStyles() {
    .backgroundColor('#868b95')
  }

  @Styles
  normalStyles() {
    .backgroundColor('#a8abb7')
  }

  build() {
    Column() {
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
          // Shift键
          ShiftItem({ inputStyle: $inputStyle, keyItem: { panel: 'ChineseMenu', index: 0, col: 1 } })

          //符号切换按键（显示?12）
          keyItemGray({
            keyValue: '?12',
            menuType: $menuType,
            inputStyle: $inputStyle,
            keyItem: { index: 0, col: ConstantNum.NUM_2, panel: 'ChineseMenu' }
          })

          // 输入法切换按键（显示PY）
          ChangeItem({
            keyValue: 'PY',
            menuType: $menuType,
            inputStyle: $inputStyle,
            keyItem: { index: 0, col: ConstantNum.NUM_3, panel: 'ChineseMenu' }
          })
        }
        .margin({
          right: this.is4k ? inputStyleConfig.LEFT_RIGHT_MARGIN :
            lpx(inputStyleConfig.BUTTON_MARGIN_LEFT - ConstantNum.NUM_10)
        })

        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
            ForEach(this.keyList.slice(1, ConstantNum.NUM_11), (item: keySourceListType, index: number) => {
              keyItemNumber({
                keyValue: item,
                upper: $upper,
                inputStyle: $inputStyle,
                keyItem: { index: index + 1, col: 1, panel: 'ChineseMenu' }
              })
            }, (item: keySourceListType) => item.content)
          }
          .width('100%')
          .margin({ bottom: lpx(inputStyleConfig.BUTTON_MARGIN_BUTTON) })

          Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
            ForEach(this.keyList.slice(ConstantNum.NUM_13, ConstantNum.NUM_23),
              (item: keySourceListType, index: number) => {
                keyItemNumber({
                  keyValue: item,
                  upper: $upper,
                  inputStyle: $inputStyle,
                  keyItem: { index: index + 1, col: ConstantNum.NUM_2, panel: 'ChineseMenu' }
                })
              }, (item: keySourceListType) => item.content)

            // 逗号按键（灰色样式）
            // keyItem({
            //   keyValue: { content: ',', title: ',', upperContent: ',' },
            //   inputStyle: $inputStyle,
            //   keyItem: { index: 10, col: 2, panel: 'ChineseMenu' }
            // })
            //   .margin({ left: lpx(BUTTON_MARGIN_LEFT) })
          }
          .width('100%')
          .margin({ bottom: lpx(inputStyleConfig.BUTTON_MARGIN_BUTTON) })

          Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
            ForEach(this.keyList.slice(ConstantNum.NUM_25, ConstantNum.NUM_29),
              (item: keySourceListType, index: number) => {
                keyItemNumber({
                  keyValue: item,
                  upper: $upper,
                  inputStyle: $inputStyle,
                  keyItem: { index: index + 1, col: ConstantNum.NUM_3, panel: 'ChineseMenu' }
                })
              }, (item: keySourceListType) => item.content)

            // 空格键组件
            SpaceItem({
              inputStyle: $inputStyle,
              keyItem: { index: ConstantNum.NUM_5, col: ConstantNum.NUM_3, panel: 'ChineseMenu' }
            })

            ForEach(this.keyList.slice(ConstantNum.NUM_30, ConstantNum.NUM_34),
              (item: keySourceListType, index: number) => {
                keyItemNumber({
                  keyValue: item,
                  upper: $upper,
                  inputStyle: $inputStyle,
                  keyItem: { index: index + ConstantNum.NUM_6, col: ConstantNum.NUM_3, panel: 'ChineseMenu' }
                })
              }, (item: keySourceListType) => item.content)

            // 句号按键（灰色样式）
            // keyItem({
            //   keyValue: { content: '.', title: '.', upperContent: '.' },
            //   inputStyle: $inputStyle,
            //   keyItem: { index: ConstantNum.NUM_9, col: ConstantNum.NUM_3, panel: 'ChineseMenu' }
            // })
            //   .margin({ left: lpx(BUTTON_MARGIN_LEFT) })
          }
          .width('100%')
        }

        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
          /* 删除键 */
          DeleteItem({ inputStyle: $inputStyle, keyItem: { panel: 'ChineseMenu', index: ConstantNum.NUM_11, col: 1 } })

          // 回车键组件
          ReturnItem({
            inputStyle: $inputStyle,
            keyItem: { index: ConstantNum.NUM_11, col: ConstantNum.NUM_2, panel: 'ChineseMenu' }
          })
        }
        .margin({
          left: this.is4k ? inputStyleConfig.LEFT_RIGHT_MARGIN :
            lpx(inputStyleConfig.BUTTON_MARGIN_LEFT - ConstantNum.NUM_10)
        })
      }
      .width(lpx(inputStyleConfig.KEYBOARD_WIDTH))
      .height(lpx(inputStyleConfig.KEYBOARD_HEIGHT))
      .margin({ top: lpx(ConstantNum.NUM_8_5 - ConstantNum.NUM_2), bottom: 0 })
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .margin({ top: inputStyleConfig.KEY_BOARD_TOP - ConstantNum.NUM_6_5 })
  }
}
