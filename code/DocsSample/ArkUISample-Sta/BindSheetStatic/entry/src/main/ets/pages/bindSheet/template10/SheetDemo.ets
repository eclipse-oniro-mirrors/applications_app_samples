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

// [Start Nested_scrolling_Sheet]
import {
  Entry,
  Component,
  Builder,
  Text,
  List,
  ListItem,
  FontWeight,
  Margin,
  NestedScrollMode,
  ClickEvent,
  SheetSize,
  SheetType,
  Button,
  FlexAlign,
  Column,
  Color,
  TextAlign,
  Alignment,
  ForEach,
  ListItemAlign,
  SheetOptions,
  TripleLengthDetents,
  $$
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SheetDemo {
  @State isShowSheet: boolean = false;
  @State items: Array<string> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

  @Builder
  SheetBuilder() {
    Column() {
      // 第一步：自定义滚动容器
      List({ space: '10vp' }) {
        ForEach(this.items, (item: string) => {
          ListItem() {
            Text(String(item)).fontSize(16).fontWeight(FontWeight.Bold)
          }.width('90%').height('80vp').backgroundColor('#ff53ecd9').borderRadius(10)
        }, (item: string):string => item)
      }
      .alignListItem(ListItemAlign.Center)
      .margin({ top: '10vp' } as Margin)
      .width('100%')
      .height('900px')
      // 第二步：设置滚动组件的嵌套滚动属性
      .nestedScroll({
        scrollForward: NestedScrollMode.PARENT_FIRST,
        scrollBackward: NestedScrollMode.SELF_FIRST,
      })

      Text("非滚动区域")
        .width('100%')
        .backgroundColor(Color.Gray)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .align(Alignment.Top)
    }.width('100%').height('100%')
  }

  build() {
    Column() {
      Button('Open Sheet').width('90%').height('80vp')
        .onClick((e: ClickEvent) => {
          this.isShowSheet = !this.isShowSheet;
        })
        .bindSheet($$(this.isShowSheet), this.SheetBuilder, {
          detents: [SheetSize.MEDIUM, SheetSize.LARGE, "600"] as TripleLengthDetents,
          preferType: SheetType.BOTTOM,
          title: { title: '嵌套滚动场景' },
        } as SheetOptions)
    }.width('100%').height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

// [End Nested_scrolling_Sheet]
