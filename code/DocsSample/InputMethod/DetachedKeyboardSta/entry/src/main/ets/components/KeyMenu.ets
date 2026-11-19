'use static'
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

import {
  Component,
  StorageLink,
  Stack,
  ForEach,
  Column,
  Row,
  Image,
  $r,
  $rawfile,
  StateStyles,
  ShadowOptions,
  Provide,
  State,
  VerticalAlign,
  FlexAlign,
  Color,
  ClickEvent
} from '@kit.ArkUI';
import { DeleteItem } from './DeleteItem';
import { KeyState, keySourceListType, keySourceListData } from '../model/KeyboardKeyData';
import { KeyStyle, StyleConfiguration } from '../common/StyleConfiguration';
import { KeyItem } from './KeyItem';
import { KeyItemNumber } from './KeyItemNumber';
import { SpaceItem } from './SpaceItem';
import { ReturnItem } from './ReturnItem';
import { inputMethodEngine } from '@kit.IMEKit';

// key键盘
@Component
export struct KeyMenu {
  @StorageLink('inputStyle') inputStyle: KeyStyle = StyleConfiguration.getSavedInputStyle();
  @Provide keyState: KeyState = KeyState.LOWER_CASE;
  @StorageLink('isSplitKeyboard') isSplitKeyboard: boolean = false;
  private keyList: keySourceListType[] = keySourceListData;
  @State styleMode: int = 1;

  // 如果是沉浸模式，设置新样式
  aboutToAppear(): void {

    inputMethodEngine.getKeyboardDelegate()?.onEditorAttributeChanged(
      (attr: inputMethodEngine.EditorAttribute | undefined): void => {
        if (attr?.immersiveMode === inputMethodEngine.ImmersiveMode.IMMERSIVE) {
          this.styleMode = 0;
        } else {
          this.styleMode = 1;
        }
      });
  }

  // 分体键盘左半部分
  @Builder
  splitLeft(): void {
    Column({ space: this.inputStyle.keyGap }) {
      Row({ space: this.inputStyle.keyGap }) {
        ForEach(this.keyList.slice(0, 5), (item: keySourceListType) => {
          KeyItemNumber({ keyValue: item })
        }, (item: keySourceListType) => item.content)
      }
      .width('100%')
      .layoutWeight(1)

      Row({ space: this.inputStyle.keyGap }) {
        ForEach(this.keyList.slice(10, 15), (item: keySourceListType) => {
          KeyItemNumber({ keyValue: item })
        }, (item: keySourceListType) => item.content)
      }
      .width('100%')
      .layoutWeight(1)

      Row({ space: this.inputStyle.keyGap }) {
        Stack() {
          Image($rawfile(this.keyState === KeyState.ONCE_UPPER_CASE ? 'shift light.svg' : this.keyState === KeyState.UPPER_CASE ? 'shift light long.svg' : 'shift.svg'))
            .width(this.inputStyle.featurePicSize)
            .height(this.inputStyle.featurePicSize)
        }
        .backgroundColor($r('app.color.key_item_gray'))
        .borderRadius(4)
        .onClick((e: ClickEvent): void => {
          if (this.keyState === KeyState.LOWER_CASE) {
            this.keyState = KeyState.ONCE_UPPER_CASE;
          } else if (this.keyState === KeyState.ONCE_UPPER_CASE) {
            this.keyState = KeyState.UPPER_CASE;
          } else if (this.keyState === KeyState.UPPER_CASE) {
            this.keyState = KeyState.LOWER_CASE;
          }
        })
        .height('100%')
        .layoutWeight(1.5)
        .shadow({ radius: 1, color: $r('app.color.shadow'), offsetY: 3 } as ShadowOptions)
        .stateStyles({
          normal: () => {
            this.backgroundColor($r('app.color.key_item_gray'))
          },
          pressed: () => {
            this.backgroundColor($r('app.color.key_item_gray_pressed'))
          }
        } as StateStyles)

        ForEach(this.keyList.slice(19, 23), (item: keySourceListType) => {
          KeyItemNumber({ keyValue: item })
        }, (item: keySourceListType) => item.content)
      }
      .width('100%')
      .layoutWeight(1)

      Row({ space: this.inputStyle.keyGap }) {
        KeyItem({ keyValue: { content: ',', title: ',', upperContent: ',' } })
        SpaceItem({ spaceWeight: 2.5 })
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('40%')
    .height('100%')
    .backgroundColor(this.styleMode === 1 ? '#D5D8DD' : '#ffffff')
    .borderRadius(16)
    .padding(this.inputStyle.keyGap)
  }

  // 分体键盘右半部分
  @Builder
  splitRight(): void {
    Column({ space: this.inputStyle.keyGap }) {
      Row({ space: this.inputStyle.keyGap }) {
        ForEach(this.keyList.slice(5, 10), (item: keySourceListType) => {
          KeyItemNumber({ keyValue: item })
        }, (item: keySourceListType) => item.content)
      }
      .width('100%')
      .layoutWeight(1)

      Row({ space: this.inputStyle.keyGap }) {
        ForEach(this.keyList.slice(15, 19), (item: keySourceListType) => {
          KeyItemNumber({ keyValue: item })
        }, (item: keySourceListType) => item.content)
      }
      .width('100%')
      .layoutWeight(1)

      Row({ space: this.inputStyle.keyGap }) {
        ForEach(this.keyList.slice(23), (item: keySourceListType) => {
          KeyItemNumber({ keyValue: item })
        }, (item: keySourceListType) => item.content)
        DeleteItem()
      }
      .width('100%')
      .layoutWeight(1)

      Row({ space: this.inputStyle.keyGap }) {
        KeyItem({ keyValue: { content: '.', title: '.', upperContent: '.' } })
        ReturnItem({ returnWeight: 2 })
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('40%')
    .height('100%')
    .backgroundColor(this.styleMode === 1 ? '#D5D8DD' : '#ffffff')
    .borderRadius(16)
    .padding(this.inputStyle.keyGap)
  }

  build(): void {
    if (this.isSplitKeyboard) {
      Column() {
        Row() {
          this.splitLeft()
          Column()
            .layoutWeight(1)
            .height('100%')
          this.splitRight()
        }
        .width('100%')
        .layoutWeight(1)
        .padding({
          left: this.inputStyle.paddingLeftRight,
          right: this.inputStyle.paddingLeftRight
        })
      }
      .width('100%')
      .height('100%')
    } else {
      Column() {
        Column({ space: this.inputStyle.keyGap }) {
          Row({ space: this.inputStyle.keyGap }) {
            ForEach(this.keyList.slice(0, 10), (item: keySourceListType) => {
              KeyItemNumber({ keyValue: item })
            }, (item: keySourceListType) => item.content)
          }
          .width('100%')
          .layoutWeight(1)

          Row({ space: this.inputStyle.keyGap }) {
            Stack() {
            }.layoutWeight(0.5)

            ForEach(this.keyList.slice(10, 19), (item: keySourceListType) => {
              KeyItemNumber({ keyValue: item })
            }, (item: keySourceListType) => item.content)
            Stack() {
            }.layoutWeight(0.5)
          }
          .width('100%')
          .layoutWeight(1)

          Row({ space: this.inputStyle.keyGap }) {
            Stack() {
              Image($rawfile(this.keyState === KeyState.ONCE_UPPER_CASE ? 'shift light.svg' : this.keyState === KeyState.UPPER_CASE ? 'shift light long.svg' : 'shift.svg'))
                .width(this.inputStyle.featurePicSize)
                .height(this.inputStyle.featurePicSize)
            }
            .backgroundColor($r('app.color.key_item_gray'))
            .borderRadius(4)
            .onClick((e: ClickEvent): void => {
              if (this.keyState === KeyState.LOWER_CASE) {
                this.keyState = KeyState.ONCE_UPPER_CASE;
              } else if (this.keyState === KeyState.ONCE_UPPER_CASE) {
                this.keyState = KeyState.UPPER_CASE;
              } else if (this.keyState === KeyState.UPPER_CASE) {
                this.keyState = KeyState.LOWER_CASE;
              }
            })
            .height('100%')
            .layoutWeight(1.5)
            .shadow({ radius: 1, color: $r('app.color.shadow'), offsetY: 3 } as ShadowOptions)
            .stateStyles({
              normal: () => {
                this.backgroundColor($r('app.color.key_item_gray'))
              },
              pressed: () => {
                this.backgroundColor($r('app.color.key_item_gray_pressed'))
              }
            } as StateStyles)

            ForEach(this.keyList.slice(19), (item: keySourceListType) => {
              KeyItemNumber({ keyValue: item })
            }, (item: keySourceListType) => item.content)
            DeleteItem()
          }
          .width('100%')
          .layoutWeight(1)

          Row({ space: this.inputStyle.keyGap }) {
            KeyItem({ keyValue: { content: ',', title: ',', upperContent: ',' } })
            SpaceItem({ spaceWeight: 5 })
            KeyItem({ keyValue: { content: '.', title: '.', upperContent: '.' } })
            ReturnItem({ returnWeight: 2.5 })
          }
          .width('100%')
          .layoutWeight(1)

        }
        .width('100%')
        .layoutWeight(1)
        .padding({
          left: this.inputStyle.paddingLeftRight,
          right: this.inputStyle.paddingLeftRight,
          top: this.inputStyle.keyGap,
          bottom: this.inputStyle.keyGap
        })
        .backgroundColor(this.styleMode === 1 ? '' : '#ffffff')
      }
      .width('100%')
      .height('100%')
    }
  }
}
