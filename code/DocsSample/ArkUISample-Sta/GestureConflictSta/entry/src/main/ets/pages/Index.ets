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

import { Column, List, ListItem, Text, ForEach, Axis, BarState, EdgeEffect, ResourceColor, Margin, Padding, ConstraintSizeOptions, ColumnOptions, ListOptions, Entry, Component, State } from '@kit.ArkUI'
interface ListItemInfo {
  router?: string;
  name: string;
  description?: string;
}

@Entry
@Component
struct Index {
  @State bgColor: ResourceColor = '#39b5fa' as ResourceColor;
  private demandList: Array<ListItemInfo> = [
    {
      name: 'Custom gesture recognition' as string,
      description: 'The application can independently decide whether to intercept this gesture, causing the gesture recognition to fail, thereby leaving the chance of successful recognition to other gestures.' as string,
      router: 'Component/CustomGestures/CustomGestureDetermination' as string
    } as ListItemInfo,
    {
      name: 'Gesture and motion control' as string,
      description: 'Gesture and motion control refers to the situation where the gesture has been successfully recognized, but the developer can still control whether the gesture callback can respond by calling the API interface.' as string,
      router: 'Component/GestureAndMotionControl/GestureAndMotionControl' as string
    } as ListItemInfo,
    {
      name: 'Preventing gesture participation in recognition' as string,
      description: 'When the user presses, by controlling the participation status of the gesture recognizer in the response chain, efficient dynamic intervention of gesture processing is achieved.' as string,
      router: 'Component/PreventGestureRecognition/PreventGestureRecognition' as string
    } as ListItemInfo
  ];

  build() {
    Column(undefined) {
      Column() {
        List({ space: 20, initialIndex: 0 } as ListOptions) {
          ForEach<ListItemInfo>(this.demandList, (listitem: ListItemInfo, index: Int) => {
            ListItem() {
              Column({ space: 10 } as ColumnOptions) {
                Text(listitem.name)
                  .fontSize(20)
                  .fontColor(this.bgColor)
                  .maxLines(1)

                Text(listitem.description ?? '')
                  .width('100%')
              }
              .margin({ bottom: index >= (this.demandList.length) - 1 ? 100 : 0 } as Margin)
              .padding({
                top: '3%',
                right: '10.00%',
                bottom: '5%',
                left: '10.00%'
              } as Padding)
              .width('100%')
              .constraintSize({ minHeight: 100 } as ConstraintSizeOptions)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .onClick(() => {
                if (listitem.router !== undefined) {
                  this.getUIContext().getRouter().pushUrl({ url: listitem.router! });
                }
              })
            }
          }, (listitem: ListItemInfo, index: Int) => listitem.name + index.toString())
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
