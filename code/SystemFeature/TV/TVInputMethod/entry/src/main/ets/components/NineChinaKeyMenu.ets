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
import { keyNineChinaType } from '../model/KeyboardKeyData';
import { DeleteItem } from './DeleteItem';
import { keyItemGray } from './KeyItemGray';
import { KeyNineItem } from './KeyNineItem';
import { ConstantNum, KeyStyle } from '../common/StyleConfiguration';
import { getString } from './KeyMenu';

// 九宫格中文键盘
@Component
export struct NineChinaKeyMenu {
  @Link inputStyle: KeyStyle;
  private keyList: keyNineChinaType[] = [];
  @StorageLink('isUpper') isUpper: boolean = false;
  @StorageLink('isChinese') isChinese: boolean = true;
  @State isNineKey: boolean = AppStorage.get<boolean>('isNineKey') ?? false;
  @State handlePopup: boolean = false;
  @State symbolColor: Resource = $r('app.color.symbolColor');
  @Link switchScreen: boolean;
  @Link menuType: number;

  @Styles
  pressedStyles() {
    .backgroundColor($r('app.color.pressedStyles_BG'))
  }

  @Styles
  normalStyles() {
    .backgroundColor($r('app.color.normalStyles_BG'))
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        keyItemGray({ keyValue: getString($r('app.string.symbol_4')), menuType: $menuType, inputStyle: $inputStyle });
        ForEach(this.keyList.slice(0, ConstantNum.NUM_3), (item: keyNineChinaType) => {
          KeyNineItem({
            keyValue: item, inputStyle: $inputStyle
          })
        }, (item: keyNineChinaType) => item.content)
        DeleteItem({ inputStyle: $inputStyle })
      }
      .width('96%')
      .height(this.inputStyle.nineButtonHeight)

      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        keyItemGray({ keyValue: getString($r('app.string.symbol_3')), menuType: $menuType, inputStyle: $inputStyle });
        ForEach(this.keyList.slice(ConstantNum.NUM_3, ConstantNum.NUM_6), (item: keyNineChinaType) => {
          KeyNineItem({
            keyValue: item, inputStyle: $inputStyle
          })
        }, (item: keyNineChinaType) => item.content)

        Stack() {
          Text($r('app.string.clear_all')).fontSize(ConstantNum.NUM_16)
        }
        .backgroundColor(this.symbolColor)
        .borderRadius(ConstantNum.NUM_4)
        .width(this.inputStyle.nineButtonWidth)
        .height(this.inputStyle.nineButtonHeight)
        .shadow({ radius: 1, color: $r('app.color.shadow'), offsetY: ConstantNum.NUM_3 })
        .onTouch((event: TouchEvent) => {
        })
      }
      .width('96%')
      .height(this.inputStyle.nineButtonHeight)

      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        keyItemGray({ keyValue: getString($r('app.string.symbol_2')), menuType: $menuType, inputStyle: $inputStyle });
        ForEach(this.keyList.slice(ConstantNum.NUM_6, ConstantNum.NUM_9), (item: keyNineChinaType) => {
          KeyNineItem({
            keyValue: item, inputStyle: $inputStyle
          })
        }, (item: keyNineChinaType) => item.content)

        keyItemGray({ keyValue: getString($r('app.string.symbol_1')), menuType: $menuType, inputStyle: $inputStyle });
      }
      .width('96%')
      .height(this.inputStyle.nineButtonHeight)

      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        keyItemGray({ keyValue: getString($r('app.string.symbol')), menuType: $menuType, inputStyle: $inputStyle });

        Stack() {
          Text($r('app.string.CN_en')).fontSize(ConstantNum.NUM_16)
        }
        .stateStyles({
          normal: this.normalStyles, pressed: this.pressedStyles
        })
        .borderRadius(ConstantNum.NUM_6)
        .width('20%')
        .height(this.inputStyle.nineButtonHeight)
        .onTouch((event: TouchEvent) => {

        })

        KeyNineItem({
          keyValue: this.keyList[ConstantNum.NUM_9], inputStyle: $inputStyle
        })

        Stack() {
          Text($r('app.string.symbol_123')).fontSize(ConstantNum.NUM_16)
        }
        .stateStyles({
          normal: this.normalStyles, pressed: this.pressedStyles
        })
        .borderRadius(ConstantNum.NUM_6)
        .width('20%')
        .height(this.inputStyle.nineButtonHeight)
        .onTouch((event: TouchEvent) => {

        })

        Stack() {
          Text($r('app.string.text_complete')).fontSize(ConstantNum.NUM_16)
        }
        .backgroundColor(this.symbolColor)
        .borderRadius(ConstantNum.NUM_4)
        .width(this.inputStyle.nineButtonWidth)
        .height(this.inputStyle.nineButtonHeight)
        .shadow({ radius: 1, color: $r('app.color.shadow'), offsetY: ConstantNum.NUM_3 })
        .onTouch((event: TouchEvent) => {
        })
      }
      .width('96%')
      .height(this.inputStyle.nineButtonHeight)
    }.margin({ top: '4%', bottom: '4%' })
  }
}
