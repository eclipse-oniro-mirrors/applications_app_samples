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

import { Column, Text, List, ListItem, Axis, BarState, EdgeEffect, ForEach, Entry, Component, State } from '@kit.ArkUI'
import type { ResourceColor, ListOptions, ColumnOptions, Margin, Padding } from '@kit.ArkUI'

interface ListItemData {
  router?: string;
  name: string;
  description?: string;
}

let demandList: Array<ListItemData> = [
  {
    name: 'gesture',
    description: 'The gesture is a general method for binding gestures, which enables the binding of gestures to specific components.',
    router: 'pages/Gesture'
  } as ListItemData,
  {
    name: 'priorityGesture',
    description: 'priorityGesture is a method for binding gestures with priority. It enables the binding of gestures that are given priority for recognition on a component.',
    router: 'pages/PriorityGesture'
  } as ListItemData,
  {
    name: 'parallelGesture',
    description: 'parallelGesture refers to a method for binding parallel gestures, allowing the same gestures to be simultaneously responded to on parent and child components.',
    router: 'pages/ParallelGesture'
  } as ListItemData
];

@Entry
@Component
struct Index {
  @State bgColor: ResourceColor = '#39b5fa';

  build() {
    Column(undefined) {
      Column(undefined) {
        List({ space: 20, initialIndex: 0 } as ListOptions) {
          ForEach(demandList, (listitem: ListItemData, index: int) => {
            ListItem(undefined) {
              Column({ space: 10 } as ColumnOptions) {
                Text(listitem.name)
                  .fontSize(20)
                  .fontColor(this.bgColor)
                  .maxLines(1)

                Text(listitem.description)
                  .width('100%')
              }
              .margin({ bottom: index >= demandList.length - 1 ? 100 : 0 } as Margin)
              .padding({
                top: '3%',
                right: '10.00%',
                bottom: '5%',
                left: '10.00%'
              } as Padding)
              .width('100%')
              .constraintSize({ minHeight: 100 })
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .onClick(() => {
                if (!!listitem.router) {
                  let routerUrl: string = listitem.router as string;
                  this.getUIContext().getRouter().pushUrl({ url: routerUrl });
                };
              })
            }
          }, (listitem: ListItemData, index: int) => `${listitem.name}_${index}`)
        }
        .listDirection(Axis.Vertical)
        .scrollBar(BarState.Off)
        .friction(0.6)
        .divider({
          strokeWidth: 2,
          color: 0xFFFFFF,
          startMargin: 20,
          endMargin: 20
        })
        .edgeEffect(EdgeEffect.Spring)
        .width('90%')
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#fff4f3f3')
      .padding({ top: 5 } as Padding)
    }
  }
}
