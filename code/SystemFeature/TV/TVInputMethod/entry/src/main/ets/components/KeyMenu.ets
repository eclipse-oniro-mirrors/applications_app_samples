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
import { keyItem } from './KeyItem';
import { ChangeItem } from './ChangeItem';
import { ReturnItem } from './ReturnItem';
import { ConstantNum, inputStyleConfig, KeyStyle } from '../common/StyleConfiguration';
import { ShiftItem } from './ShiftItem';
import { SpaceItem } from './SpaceItem';
import { getKey, keyInfo } from '../model/FocusInfo';

export function lpx(value: number): string {
  return `${value}px`;
}

export function getString(res: Resource): string {
  return getContext().resourceManager.getStringSync(res.id);
}

//key键盘
@Component
export struct keyMenu {
  @Link inputStyle: KeyStyle;
  private keyList: keySourceListType[] = [];
  @StorageLink('keyState') upper: number = 0;
  @Link menuType: number;
  keyItem: keyInfo = {} as keyInfo;
  @State isFocus: boolean = false;

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
          ShiftItem({ inputStyle: $inputStyle, keyItem: { panel: 'KeyMenu', index: 0, col: 1 } })

          //符号切换按键（显示?12）
          keyItemGray({
            keyValue: '?12',
            menuType: $menuType,
            inputStyle: $inputStyle,
            keyItem: { index: 0, col: ConstantNum.NUM_2, panel: 'KeyMenu' }
          })

          // 输入法切换按键（显示PY）
          ChangeItem({
            keyValue: 'PY',
            menuType: $menuType,
            inputStyle: $inputStyle,
            keyItem: { index: 0, col: ConstantNum.NUM_3, panel: 'KeyMenu' }
          })
        }
        .margin({ right: lpx(inputStyleConfig.LEFT_RIGHT_MARGIN) })

        Flex({
          direction: FlexDirection.Column,
          alignItems: ItemAlign.Center
        }) {
          Flex({
            justifyContent: FlexAlign.SpaceEvenly,
            alignItems: ItemAlign.Center
          }) {
            ForEach(this.keyList.slice(1, ConstantNum.NUM_11), (item: keySourceListType, index: number) => {
              /* 第一行：数字键0-9 */
              keyItemNumber({
                keyValue: item,
                upper: $upper,
                inputStyle: $inputStyle,
                keyItem: { panel: 'KeyMenu', index: index + 1, col: 1 }
              })
            }, (item: keySourceListType) => item.content)
          }
          .width('100%')
          .margin({ bottom: lpx(inputStyleConfig.BUTTON_MARGIN_BUTTON) })

          Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
            ForEach(this.keyList.slice(ConstantNum.NUM_13, ConstantNum.NUM_22),
              (item: keySourceListType, index: number) => {
                /* 第二行：中间字母键（左右添加占位保持平衡） */
                keyItemNumber({
                  keyValue: item,
                  upper: $upper,
                  inputStyle: $inputStyle,
                  keyItem: { panel: 'KeyMenu', index: index + 1, col: ConstantNum.NUM_2 }
                })
              }, (item: keySourceListType) => item.content)

            // 逗号按键（灰色样式）
            keyItem({
              keyValue: { content: ',', title: ',', upperContent: ',' },
              inputStyle: $inputStyle,
              keyItem: { index: ConstantNum.NUM_10, col: ConstantNum.NUM_2, panel: 'KeyMenu' }
            })
              .margin({ left: lpx(inputStyleConfig.BUTTON_MARGIN_LEFT) })
          }
          .width('100%')
          .margin({ bottom: lpx(inputStyleConfig.BUTTON_MARGIN_BUTTON) })

          /* 第三行：切换大小写键、数字符号区域、删除键 */
          Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
            ForEach(this.keyList.slice(ConstantNum.NUM_25, ConstantNum.NUM_29),
              (item: keySourceListType, index: number) => {
                /* 数字符号区域。渲染数字符号区按键（从第20个元素开始遍历） */
                keyItemNumber({
                  keyValue: item,
                  upper: $upper,
                  inputStyle: $inputStyle,
                  keyItem: { panel: 'KeyMenu', index: index + 1, col: ConstantNum.NUM_3 }
                })
                  .visibility(index === ConstantNum.NUM_4 ? Visibility.None : Visibility.Visible)
              }, (item: keySourceListType) => item.content)

            // 空格键组件
            SpaceItem({
              inputStyle: $inputStyle,
              keyItem: { index: ConstantNum.NUM_5, col: ConstantNum.NUM_3, panel: 'KeyMenu' }
            })

            ForEach(this.keyList.slice(ConstantNum.NUM_30, ConstantNum.NUM_33),
              (item: keySourceListType, index: number) => {
                /* 数字符号区域。渲染数字符号区按键（从第20个元素开始遍历） */
                keyItemNumber({
                  keyValue: item,
                  upper: $upper,
                  inputStyle: $inputStyle,
                  keyItem: { panel: 'KeyMenu', index: index + ConstantNum.NUM_6, col: ConstantNum.NUM_3 }
                })
                  .visibility(index === ConstantNum.NUM_4 ? Visibility.None : Visibility.Visible)
              }, (item: keySourceListType) => item.content)

            // 句号按键（灰色样式）
            keyItem({
              keyValue: { content: '.', title: '.', upperContent: '.' },
              inputStyle: $inputStyle,
              keyItem: { index: ConstantNum.NUM_9, col: ConstantNum.NUM_3, panel: 'KeyMenu' }
            })
              .margin({ left: lpx(inputStyleConfig.BUTTON_MARGIN_LEFT) })
          }
          .width('100%') ///mxg
        }
        .width('100%')

        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
          /* 删除键 */
          DeleteItem({ inputStyle: $inputStyle, keyItem: { panel: 'KeyMenu', index: ConstantNum.NUM_11, col: 1 } })

          // 回车键组件
          ReturnItem({
            inputStyle: $inputStyle,
            keyItem: { index: ConstantNum.NUM_11, col: ConstantNum.NUM_2, panel: 'KeyMenu' }
          })
        }
        .margin({ left: lpx(inputStyleConfig.LEFT_RIGHT_MARGIN) })
      }
      .width(lpx(inputStyleConfig.KEYBOARD_WIDTH))
      .height(lpx(inputStyleConfig.KEYBOARD_HEIGHT))
      .margin({ top: lpx(ConstantNum.NUM_8_5), bottom: 0 })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .margin({ top: lpx(inputStyleConfig.KEY_BOARD_TOP) })
  }
}
