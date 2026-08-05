'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * ... (license text unchanged)
 */

import {
  Entry,
  Component,
  Text,
  Column,
  ColumnOptions,
  List,
  ListOptions,
  ResourceColor,
  TextAlign,
  FontWeight,
  Color,
  Axis,
  BarState,
  EdgeEffect,
  ForEach,
  $r,
  State
} from '@kit.ArkUI';

interface listItem {
  router?: string;
  name: string;
  description?: string;
};

let demandList: Array<listItem> = [
  {
    name: "Shadow",
    description: "The shadow interface can add shadow effects to the current component.",
    router: "pages/Shadow",
  }
];

@Entry
@Component
struct Index {
  @State bgColor: ResourceColor = '#39b5fa';
  build(): void {
    Column() {
      Text($r('app.string.ImageShow'))
        .height('8.00%')
        .width('100%')
        .textAlign(TextAlign.Center)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .backgroundColor(this.bgColor)
        .fontColor(Color.White)
      Column() {
        List({ space: 20, initialIndex: 0 } as ListOptions) {
          ForEach(demandList, (listitem: listItem) => {
            Column({ space: 10 } as ColumnOptions) {
              Text(listitem.name)
                .fontSize(20)
                .fontColor(this.bgColor)
                .maxLines(1)
              Text(listitem.description)
                .width('100%')
            }
            .margin({ bottom: 100 })
            .padding({ top: '3%', right: '10.00%', bottom: '5%', left: '10.00%' })
            .width('100%')
            .constraintSize({ minHeight: 100 })
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
            .onClick(() => {
              if (!!listitem.router) {
                this.getUIContext().getRouter().pushUrl({ url: listitem.router as string })
              }
            })
          })
        }
        .listDirection(Axis.Vertical)
        .scrollBar(BarState.Off)
        .friction(0.6)
        .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
        .edgeEffect(EdgeEffect.Spring)
        .width('90%')
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#fff4f3f3')
      .padding({ top: 5 })
    }
  }
}