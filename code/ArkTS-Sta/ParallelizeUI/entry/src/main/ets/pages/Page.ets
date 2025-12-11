'use static'

import {
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  Row,
  TextAlign,
  Entry,
  Stack,
  Grid,
  GridItem,
  Toggle,
  Image,
  ToggleType,
  $r,
  ImageFit,
  Alignment,
  Margin,
  Position,
  Scroller,
  Scroll,
  Flex,
  ForEach,
  ScrollDirection,
  BarState,
  FontWeight,
  List,
  ListItem,
  Axis
} from '@ohos.arkui.component';
import {
  State,
  PropRef,
  Link
} from '@ohos.arkui.stateManagement';
import { ParallelOption, ParallelizeUI } from '@ohos.arkui.Parallelize';
import hilog from '@ohos.hilog';
import { paramsObj } from './Index';
import { cardTypeInfos1, cardTypeInfos2, CardInfo, AppCardInfo, ServiceCardInfo, ServiceItemInfo, AppItemInfo } from './MockData';

class PageInfo {
  private name: string = ''
  private id: int = 0
  constructor(name:string, id:int) {
    this.name = name
    this.id = id
  }
}

// ServiceItem.ets - 服务项组件
@Component
export struct ServiceItem {
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
          .backgroundColor(0xffeeeeee)
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
      .backgroundColor(0xffeeeeee)
    }
    .width('30%')
    .height('80%')
    .backgroundColor(0xffeeeeee)
    .clip(true)
    .margin({ left: 0, top: 8, right: 8, bottom: 0 } as Margin)
    .borderRadius(10)
  }
}

// AppItem.ets - 应用项组件
@Component
export struct AppItem {
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
      .backgroundColor(0xffeeeeee)
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
    .backgroundColor(0xffffffff)
  }
}

// AppCard.ets - 应用卡片组件
@Component
export struct AppCard {
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
    .backgroundColor(0xffffffff)
    .borderRadius(10)
    .padding(5)
  }
}

// ServiceCard.ets - 服务卡片组件
@Component
export struct ServiceCard {
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
      .listDirection(Axis.Horizontal) // 横向滚动
    }
    .width('95%')
    .height('20%')
    .backgroundColor(0xffffffff)
    .borderRadius(10)
    .padding(5)
  }
}

class Param {
  private pi:PageInfo
  constructor(pi: PageInfo) {
    this.pi = pi
  }
}

@Entry
@Component
struct Page {
  isEnable: boolean = false;
  @State message: string = 'CreatePageUsingParallelizeUI';
  @State page: PageInfo = new PageInfo('页面', 1);

  aboutToAppear(): void {
    const params = this.getUIContext().getRouter().getParams();
    if (!this.isEnable) {
      this.message = 'CreatePageWithoutUsingParallelizeUI';
    } else {
      this.message = 'CreatePageUsingParallelizeUI'
    }
  }

  build() {
    Flex() {
      Column() {
        Button(`${this.message}`).fontSize('20')
          .width('100%')
          .backgroundColor('#007DFF')
          .align(Alignment.Top)
          .zIndex(10)
          .onClick((e: ClickEvent) => {
            this.page = new PageInfo('页面状态更新', 2);
          })
        Scroll() {
          Column() {
            // 串行创建
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

            // 并行创建
            ParallelizeUI<Param>({enable: this.isEnable}, () => { return new Param(this.page); }, (param: Param)=>{
              ForEach(cardTypeInfos2, (cardInfo: CardInfo, index: Int) => {
                Column() {
                  Column() {
                    Text(param.pi.name).fontSize('20')
                  }
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
        .height('100%')
      }
      .backgroundColor('#EEEEEE')
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}