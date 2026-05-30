'use static'
/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import {
  Entry, Component, Builder, Column, Flex, FlexDirection, ItemAlign, FlexAlign, HorizontalAlign, Text, TextAlign, Button,
  ClickEvent
} from '@kit.ArkUI';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center}) {
        this.textComponent('Index');
        this.buttonComponent('Audio Capture', 'pages/AudioCapture');
        this.buttonComponent('跳转到管理麦克风页面', 'pages/MacManager');
        this.buttonComponent('跳转到音频录制流管理页面', 'pages/AudioStreamManager');
        this.buttonComponent('跳转到实现低时延耳返页面', 'pages/AudioLoopback');
        this.buttonComponent('Audio Loopback Debug Info', 'pages/AudioLoopbackDebugInfo');
      }.size({ width: '100%', height: '100%' })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  textComponent(name: string) {
    Text(name)
      .textAlign(TextAlign.Center)
      .margin(10)
      .fontSize(24)
      .size({ width: '100%', height: 48 })
  }

  @Builder
  buttonComponent(name: string, dstUri: string) {
    Button(name)
      .width('80%')
      .margin(10)
      .onClick((event: ClickEvent): void => {
        this.getUIContext().getRouter().pushUrl({ url: dstUri });
      })
  }
}
