'use static';
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

import { Entry, Component, Builder, CustomBuilder } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import {
  Column, Text, List, ListItem, Button, Flex, ForEach, Visibility,
  FontWeight, FlexDirection, ItemAlign, FlexAlign, DragEvent, DragItemInfo, Color, TextAlign
} from '@ohos.arkui.component'

@Entry
@Component
struct five {
  @State numbers: string[] = ['one', 'two', 'three', 'four', 'five', 'six'];
  @State text: string = '';
  @State bool: boolean = false;
  @State dragBool: boolean = false;
  @State appleVisible: Visibility = Visibility.Visible;
  @State orangeVisible: Visibility = Visibility.Visible;
  @State bananaVisible: Visibility = Visibility.Visible;
  @State select: int = 0;

  @Builder
  pixelMapBuilder() {
    Column() {
      Text(this.text)
        .width('50%')
        .height(60)
        .fontSize(16)
        .borderRadius(10)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Yellow)
    }
  }

  build() {
    Column() {
      Text('There are three Text elements here')
        .fontSize(12)
        .fontColor(0xCCCCCC)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin(5)
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
        Text('apple')
          .width('25%')
          .height(35)
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .backgroundColor(0xAFEEEE)
          .visibility(this.appleVisible)
          .draggable(true)
          .id('apple')
          .onDragStart((event: DragEvent, extraParams?: string): CustomBuilder | DragItemInfo => {
            this.bool = true;
            this.text = 'apple';
            this.appleVisible = Visibility.Hidden;
            return this.pixelMapBuilder;
          })
        Text('orange')
          .width('25%')
          .height(35)
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .backgroundColor(0xAFEEEE)
          .visibility(this.orangeVisible)
          .draggable(true)
          .onDragStart((event: DragEvent, extraParams?: string): CustomBuilder | DragItemInfo => {
            this.bool = true;
            this.text = 'orange';
            this.orangeVisible = Visibility.Hidden;
            return this.pixelMapBuilder;
          })
        Text('banana')
          .width('25%')
          .height(35)
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .backgroundColor(0xAFEEEE)
          .visibility(this.bananaVisible)
          .draggable(true)
          .onDragStart((event: DragEvent, extraParams?: string): CustomBuilder | DragItemInfo => {
            this.bool = true;
            this.text = 'banana';
            this.bananaVisible = Visibility.Hidden;
            return this.pixelMapBuilder;
          })
      }.border({ width: 1 }).width('90%').padding({ top: 10, bottom: 10 }).margin(10)

      Text('This is a List element')
        .fontSize(12)
        .fontColor(0xCCCCCC)
        .width('90%')
        .textAlign(TextAlign.Start)
        .margin(15)
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.numbers, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(80)
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xAFEEEE)
          }
          .onDragStart((event: DragEvent, extraParams?: string): CustomBuilder | DragItemInfo => {
            this.dragBool = true;
            this.text = item;
            return this.pixelMapBuilder;
          })
        }, (item: string) => item)
      }
      .editModeOptions()
      .height('50%')
      .width('90%')
      .border({ width: 1 })
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
      .onDragEnter((event: DragEvent, extraParams?: string) => {
        console.log('List onDragEnter');
      })
      .onDragMove((event: DragEvent, extraParams?: string) => {
        console.log('List onDragMove');
      })
      .onDragLeave((event: DragEvent, extraParams?: string) => {
        console.log('List onDragLeave');
      })
      .onDrop((event: DragEvent, extraParams?: string) => {
        if (this.bool) {
          this.numbers.splice(0, 0, this.text);
          this.bool = false;
        } else if (this.dragBool) {
          let idx: int = this.numbers.indexOf(this.text);
          if (idx >= 0) {
            this.numbers.splice(idx, 1);
          }
          this.numbers.splice(0, 0, this.text);
          this.bool = false;
          this.dragBool = false;
        }
      })
    }.width('100%').height('100%').padding({ top: 20 }).margin({ top: 20 })
  }
}
