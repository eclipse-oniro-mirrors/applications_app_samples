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
struct DragExample {
  @State numbers: string[] = ['one', 'two', 'three', 'four', 'five', 'six'];
  @State text: string = '';
  @State bool: boolean = false;
  @State dragBool: boolean = false;
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
      Text('This is a List element')
        .fontSize(22)
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
          }
          .onDragStart((event: DragEvent, extraParams?: string): CustomBuilder | DragItemInfo => {
            console.log('ljl List onDragEnter');
            this.dragBool = true;
            this.text = item;
            return this.pixelMapBuilder;
          })
        }, (item: string) => item)
      }
      .height('50%')
      .width('90%')
      .border({ width: 1 })
      .divider({ strokeWidth: 2, startMargin: 20, endMargin: 20 })
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
        console.log('List onDrop this.bool' + this.bool);
        console.log('List onDrop this.dragBool' + this.dragBool);
        if (this.bool) {
          this.numbers.splice(0, 0, this.text);
          this.bool = false;
        } else if (this.dragBool) {
          let idx: int = this.numbers.indexOf(this.text);
          console.log('List onDrop idx' + idx);
          if (idx >= 0) {
            this.numbers.splice(idx, 1);
          }
          this.numbers.splice(0, 0, this.text);
          this.bool = false;
          this.dragBool = false;
          console.log('List onDrop this.numbers' + JSON.stringify(this.numbers));
        }
      })
    }.width('100%').height('100%').padding({ top: 20 }).margin({ top: 20 })
  }
}
