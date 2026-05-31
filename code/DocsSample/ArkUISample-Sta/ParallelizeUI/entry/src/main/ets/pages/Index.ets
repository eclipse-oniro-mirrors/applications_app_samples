'use static'
import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'

interface ParamsObj {
  isEnable: boolean
}

@Entry
@Component
struct MyStateSample {
  build() {
    Column() {
      Button("CreatePageUsingParallelizeUI")
        .onClick((e: ClickEvent)=>{
          this.getUIContext().getRouter().pushUrl({ url:"pages/Page", params: { isEnable: true } as ParamsObj })
        }).fontSize(18).margin(15).width('100%')
      Button("CreatePageWithoutUsingParallelizeUI")
        .onClick((e: ClickEvent)=>{
          this.getUIContext().getRouter().pushUrl({ url:"pages/Page", params: { isEnable: false } as ParamsObj })
        }).fontSize(18).margin(15).width('100%')
    }
    .padding(15)
    .width('100%')
  }
}
