'use static'

import { $r, Entry, Text, Column, Component, Button, ClickEvent, HorizontalAlign, Alignment, FlexAlign } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  build() {
    Column() {
      Text($r('app.string.page_title'))
        .fontFamily('HarmonyHeiTi-Bold')
        .fontSize(24)
        .fontColor($r('app.color.title_color'))
        .height(33)
        .width(312)
        .margin({left: 24, right:24, top:12, bottom: 12})

      Column() {
        Text($r('app.string.page_title_video'))
          .fontFamily('HarmonyHeiTi-Medium')
          .width(64)
          .height(20)
          .fontColor($r('app.color.title_color'))
          .fontSize(16)
      }
      .id('videoRecorderPage')
      .width('96%')
      .height(48)
      .backgroundColor($r('app.color.button_background'))
      .borderRadius(24)
      .align(Alignment.Start)
      .onClick(async (e: ClickEvent) => {
        this.getUIContext().getRouter().pushUrl({
          url: 'pages/VideoRecorder',
        })
      })
      .padding({ left: 12})
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Start)

      Column() {
        Text($r('app.string.page_title_audio'))
          .fontFamily('HarmonyHeiTi-Medium')
          .height(20)
          .fontColor($r('app.color.title_color'))
          .fontSize(16)
          .width('100%')
      }
      .id('audioRecorderPage')
      .width('96%')
      .height(48)
      .backgroundColor($r('app.color.button_background'))
      .borderRadius(24)
      .align(Alignment.Start)
      .onClick(() => {
        this.getUIContext().getRouter().pushUrl({
          url: 'pages/AudioRecorder',
        })
      })
      .padding({ left: 12})
      .margin({ top: 12})
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Start)

    }
    .backgroundColor($r('app.color.homepage_background'))
    .width('100%')
    .height('100%')
  }
}
