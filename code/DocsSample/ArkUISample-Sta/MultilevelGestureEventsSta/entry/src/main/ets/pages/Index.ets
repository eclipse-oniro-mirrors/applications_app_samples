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
import { Column, List, ListItem, Text, ForEach, Axis, BarState, EdgeEffect, Entry, Component, State } from '@kit.ArkUI'
import type { ResourceColor, ListOptions, ColumnOptions, Margin, Padding } from '@kit.ArkUI'

interface ListItemType {
  router?: string;
  name: string;
  description?: string;
}
let demandList: Array<ListItemType> = [
  {
    name: 'TouchEvent',
    description: 'Touch events (onTouch events) form the basis of all gestures and consist of four types: Down, Move, Up, and Cancel.',
    router: 'pages/TouchEvent',
  } as ListItemType,
  {
    name: 'GesturesEvents',
    description: 'All gestures and events except for touch events (onTouch events) are implemented through basic gestures or combined gestures. For instance, the drag event is a sequential gesture composed of a long press gesture and a sliding gesture.',
    router: 'pages/GesturesEvents',
  } as ListItemType,
  {
    name: 'CustomEvent',
    description: 'By setting the properties, the default multi-level gesture event competition process can be controlled, thereby achieving better gesture event handling.',
    router: 'pages/CustomEvent',
  } as ListItemType,
  {
    name: 'OverlayManager',
    description: 'The OverlayManager event mechanism is by default handled first by the components within the WrappedBuilder, and it will not be passed down further.',
    router: 'pages/OverlayManager',
  } as ListItemType,
];
@Entry
@Component
struct Home {
  @State bgColor: ResourceColor = '#39b5fa';
  build() {
    Column(undefined) {
      Column(undefined) {
        List({ space: 20, initialIndex: 0 } as ListOptions) {
          ForEach(demandList, (item: ListItemType, index: int) => {
            ListItem(undefined) {
              Column({ space: 10 } as ColumnOptions) {
                Text(item.name)
                  .fontSize(20)
                  .fontColor(this.bgColor)
                  .maxLines(1)
                Text(item.description)
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
                if (!!item.router) {
                  let routerUrl: string = item.router as string;
                  this.getUIContext().getRouter().pushUrl({ url: routerUrl })
                };
              })
            }
          }, (item: ListItemType, index: int) => `${item.name}_${index}`)
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
