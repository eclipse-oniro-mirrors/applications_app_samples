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

import { sourceListType, SymbolKey } from '../model/KeyboardKeyData';
import { DeleteItem } from './DeleteItem';
import { keyItemGray } from './KeyItemGray';
import { keyItem } from './KeyItem';
import { ReturnItem } from './ReturnItem';
import { ConstantNum, inputStyleConfig, KeyStyle } from '../common/StyleConfiguration';
import { lpx } from './KeyMenu';

//数字键盘
@Component
export struct NumberMenu {
  @Link inputStyle: KeyStyle;
  private numberList: sourceListType[] = [];
  private numberViceList: sourceListType[] = [];
  @State numberNormalList: sourceListType[] = [];
  @State specialSymbol: string = '~';
  @Link menuType: number;
  @StorageProp('SymbolID') @Watch('updateSymbolType') symbolType: number = SymbolKey.ZERO;
  @StorageProp('4kSize') is4k: boolean = false;

  updateSymbolType() {
    this.numberNormalList = this.symbolType == SymbolKey.ZERO ? this.numberList : this.numberViceList;
    switch (this.symbolType) {
      case SymbolKey.ZERO:
        this.specialSymbol = '~';
        break;
      case SymbolKey.ONE:
        this.specialSymbol = '€';
        break;
      default:
        this.specialSymbol = '~';
    }
  }

  aboutToAppear(): void {
    this.updateSymbolType();
  }

  @Styles
  pressedStyles() {
    .backgroundColor($r('app.color.pressed_BG'))
  }

  @Styles
  normalStyles() {
    .backgroundColor($r('app.color.normal_BG'))
  }

  build() {
    Column() {
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
          keyItemGray({
            keyValue: 'BACK',
            menuType: $menuType,
            inputStyle: $inputStyle,
            keyItem: { index: 0, col: 1, panel: 'NumMenu' }
          })

          keyItemGray({
            keyValue: this.specialSymbol,
            menuType: $menuType,
            inputStyle: $inputStyle,
            keyItem: { index: 0, col: ConstantNum.NUM_2, panel: 'NumMenu' }
          })

          keyItemGray({
            keyButton: true,
            keyValue: 'NEXT',
            menuType: $menuType,
            inputStyle: $inputStyle,
            keyItem: { index: 0, col: ConstantNum.NUM_3, panel: 'NumMenu' }
          })
        }
        .height('100%')
        .margin({
          right: this.is4k ? inputStyleConfig.LEFT_RIGHT_MARGIN + ConstantNum.NUM_10 :
            (lpx(ConstantNum.NUM_16) + lpx(inputStyleConfig.BUTTON_MARGIN_LEFT))
        })

        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
            ForEach(this.numberNormalList.slice(1, ConstantNum.NUM_11), (item: sourceListType, index: number) => {
              keyItem({
                keyValue: { content: item.content, title: item.content, upperContent: item.content },
                inputStyle: $inputStyle,
                keyItem: { index: index + 1, col: 1, panel: 'NumMenu' }
              })
            }, (item: sourceListType) => item.content)
          }
          .width('100%')
          .margin({ bottom: lpx(inputStyleConfig.BUTTON_MARGIN_BUTTON) })

          Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
            ForEach(this.numberNormalList.slice(ConstantNum.NUM_13, ConstantNum.NUM_23),
              (item: sourceListType, index: number) => {
                keyItem({
                  keyValue: { content: item.content, title: item.content, upperContent: item.content },
                  inputStyle: $inputStyle,
                  keyItem: { index: index + 1, col: ConstantNum.NUM_2, panel: 'NumMenu' }
                })
              }, (item: sourceListType) => item.content)
          }
          .width('100%')
          .margin({ bottom: lpx(inputStyleConfig.BUTTON_MARGIN_BUTTON) })

          Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
            ForEach(this.numberNormalList.slice(ConstantNum.NUM_25, ConstantNum.NUM_35),
              (item: sourceListType, index: number) => {
                keyItem({
                  keyValue: { content: item.content, title: item.content, upperContent: item.content },
                  inputStyle: $inputStyle,
                  keyItem: { index: index + 1, col: ConstantNum.NUM_3, panel: 'NumMenu' }
                })
              }, (item: sourceListType) => item.content)
          }
          .width('100%')

        }
        .height('100%')

        Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
          /* 删除键 */
          DeleteItem({ inputStyle: $inputStyle, keyItem: { panel: 'NumMenu', index: ConstantNum.NUM_11, col: 1 } })

          // 回车键组件
          ReturnItem({
            inputStyle: $inputStyle,
            keyItem: { index: ConstantNum.NUM_11, col: ConstantNum.NUM_2, panel: 'NumMenu' }
          })
        }
        .height('100%')
        .margin({ left: this.is4k ? inputStyleConfig.LEFT_RIGHT_MARGIN : lpx(inputStyleConfig.BUTTON_MARGIN_LEFT) })
      }
      .height(lpx(inputStyleConfig.KEYBOARD_HEIGHT))
      .width(lpx(inputStyleConfig.KEYBOARD_WIDTH))
      .margin({ top: lpx(ConstantNum.NUM_8_5), bottom: 0 })
    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .margin({ top: lpx(inputStyleConfig.KEY_BOARD_TOP) })
  }
}
