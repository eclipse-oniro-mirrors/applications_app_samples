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
  Alignment,
  Axis,
  BarState,
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Flex,
  ForEach,
  Grid,
  GridItem,
  Image,
  List,
  ListItem,
  Margin,
  Position,
  Row,
  Scroll,
  Stack,
  Text
} from '@ohos.arkui.component';
import { PropRef, State } from '@ohos.arkui.stateManagement';
import { ParallelizeUI } from '@ohos.arkui.Parallelize';
import {
  AppCardInfo,
  AppItemInfo,
  CardInfo,
  ServiceCardInfo,
  ServiceItemInfo,
  cardTypeInfos1,
  cardTypeInfos2
} from './MockData';

class PageInfo {
  name: string = '';
  id: int = 0;

  constructor(name: string, id: int) {
    this.name = name;
    this.id = id;
  }
}

@Component
struct ServiceItem {
  @PropRef info: ServiceItemInfo;

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor(this.info.iconColor)
        .borderRadius(10)

      Column() {
        Text(this.info.describeInfo)
          .height(20)
          .width(100)
          .fontSize(11)

        Row() {
          Stack() {
            Image(this.info.iconSrc)
              .width('100%')
              .height('100%')

            Column()
              .width('100%')
              .height('100%')
              .backgroundColor(this.info.iconColor)
          }
          .width('30%')
          .height('80%')
          .backgroundColor('#EEEEEE')
          .clip(true)
          .borderRadius(5)

          Text(this.info.name)
            .height(20)
            .width(70)
            .fontSize(10)
        }
        .height(20)
        .width(60)
        .position({ x: 20, y: 20 } as Position)
      }
      .width('100%')
      .height('40%')
      .backgroundColor('#EEEEEE')
    }
    .width('30%')
    .height('80%')
    .backgroundColor('#EEEEEE')
    .clip(true)
    .margin({ left: 0, top: 8, right: 8, bottom: 0 } as Margin)
    .borderRadius(10)
  }
}

@Component
struct AppItem {
  @PropRef info: AppItemInfo;

  build() {
    Column() {
      Stack() {
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor(this.info.iconColor)
          .borderRadius(10)
      }
      .width('70%')
      .height('80%')
      .backgroundColor('#EEEEEE')
      .clip(true)
      .borderRadius(10)

      Text(this.info.name)
        .width('80%')
        .height('20%')
        .fontSize(10)
    }
    .width('100%')
    .height('100%')
    .padding(5)
    .backgroundColor('#FFFFFF')
  }
}

@Component
struct AppCard {
  @PropRef info: AppCardInfo;

  build() {
    Column() {
      Text(this.info.name)
        .width('90%')
        .height('10%')
        .fontSize(16)

      Grid() {
        ForEach(this.info.items, (item: AppItemInfo, index: Int) => {
          GridItem() {
            AppItem({ info: item })
          }
          .width('20%')
          .height('24%')
        }, (item: AppItemInfo, index: Int) => index.toString())
      }
      .width('100%')
      .height('90%')
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(3)
      .rowsGap(0)
    }
    .width('95%')
    .height('40%')
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
    .padding(5)
  }
}

@Component
struct ServiceCard {
  @PropRef info: ServiceCardInfo;

  build() {
    Column() {
      Text(this.info.name)
        .width('90%')
        .height('10%')
        .fontSize(16)

      List({ space: 8 }) {
        ForEach(this.info.items, (item: ServiceItemInfo, index: Int) => {
          ListItem() {
            ServiceItem({ info: item })
          }
        }, (item: ServiceItemInfo, index: Int) => index.toString())
      }
      .listDirection(Axis.Horizontal)
    }
    .width('95%')
    .height('20%')
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
    .padding(5)
  }
}

class Param {
  pi: PageInfo;

  constructor(pi: PageInfo) {
    this.pi = pi;
  }
}

@Entry
@Component
struct Page {
  private isEnable: boolean = true;
  @State message: string = 'CreatePageUsingParallelizeUI';
  @State page: PageInfo = new PageInfo('页面', 1);

  aboutToAppear(): void {
    const paramsJson: string = String(JSON.stringify(this.getUIContext().getRouter().getParams()));
    this.isEnable = paramsJson.indexOf('"isEnable":false') === -1;
    this.message = this.isEnable ? 'CreatePageUsingParallelizeUI' : 'CreatePageWithoutUsingParallelizeUI';
  }

  build() {
    Flex() {
      Column() {
        Button(this.message)
          .fontSize(20)
          .width('100%')
          .backgroundColor('#007DFF')
          .align(Alignment.Top)
          .zIndex(10)
          .onClick((e: ClickEvent) => {
            this.page = new PageInfo('页面状态更新', 2);
          })

        Scroll() {
          Column() {
            ForEach(cardTypeInfos1, (cardInfo: CardInfo, index: Int) => {
              Column() {
                if (cardInfo.type === 'App' && cardInfo.appCardInfo) {
                  AppCard({ info: cardInfo.appCardInfo })
                } else if (cardInfo.type === 'Service' && cardInfo.serviceCardInfo) {
                  ServiceCard({ info: cardInfo.serviceCardInfo })
                }
              }
              .margin({ left: 8, top: 0, right: 8, bottom: 0 } as Margin)
            }, (cardInfo: CardInfo, index: Int) => index.toString())

            ParallelizeUI<Param>({ enable: this.isEnable }, () => {
              return new Param(this.page);
            }, (param: Param) => {
              ForEach(cardTypeInfos2, (cardInfo: CardInfo, index: Int) => {
                Column() {
                  Text(param.pi.name)
                    .fontSize(20)
                  if (cardInfo.type === 'App' && cardInfo.appCardInfo) {
                    AppCard({ info: cardInfo.appCardInfo })
                  } else if (cardInfo.type === 'Service' && cardInfo.serviceCardInfo) {
                    ServiceCard({ info: cardInfo.serviceCardInfo })
                  }
                }
                .margin({ left: 8, top: 0, right: 8, bottom: 0 } as Margin)
              }, (cardInfo: CardInfo, index: Int) => index.toString())
            })
          }
        }
        .scrollBar(BarState.Off)
        .width('100%')
        .layoutWeight(1)
      }
      .backgroundColor('#EEEEEE')
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
