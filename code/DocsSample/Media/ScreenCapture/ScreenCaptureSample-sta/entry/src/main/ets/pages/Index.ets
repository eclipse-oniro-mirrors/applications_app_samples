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
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  NavPathStack,
  VideoController,
  TransitionEffect,
  Video,
  Curve,
  Row,
  Flex,
  Builder,
  FlexDirection,
  ItemAlign,
  FlexAlign
} from '@ohos.arkui.component'
import { Provide, State, StorageLink } from '@ohos.arkui.stateManagement'
import { MyAVScreenCapture } from '../model/MyAVScreenCapture'
import { Context, UIContext } from '@ohos.arkui.UIContext'
import hilog from '@ohos.hilog';

@Entry
@Component
struct Index {
  @State isPlayFlag: boolean = false;
  @StorageLink('fileNameOne') fileName: string | undefined = '';
  @State currentTime: number = 0
  @State durationTime: number = 0
  @State isStart: boolean = false;
  private myAVScreenCapture: MyAVScreenCapture | undefined = MyAVScreenCapture.getInstance();
  // [End get_file_dir]
  @State videoSrc: string = '';
  private controller: VideoController = new VideoController();
  // [Start get_file_dir]
  private filesDir: string | undefined;

  @Builder
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Row() {
        Button("开始录屏")
          .margin({ top: '17vp' })
          .onClick(() => {
            this.isPlayFlag = false;
            this.filesDir = this.getUIContext().getHostContext()?.filesDir;
            this.myAVScreenCapture?.startRecording(this.filesDir);
            this.videoSrc = 'file://' + this.myAVScreenCapture?.getPath();
            this.isStart = false;
          })
        Button("停止录屏")
          .margin({ top: '17vp', left: '17vp' })
          .onClick(() => {
              this.myAVScreenCapture?.stopRecording();
              this.fileName = this.myAVScreenCapture?.getFileName();
              this.isStart = false;

          })
        Button(this.isStart ? "停止播放" : "开始播放")
          .margin({ top: '17vp', left: '17vp' })
          .onClick(() => {
            this.isPlayFlag = true;
            if (this.isStart) {
              this.controller.pause();
              this.isStart = !this.isStart;
            } else {
              this.controller.start();
              this.isStart = !this.isStart;
            }
          })
      }.width('100%')
      .margin({ top: '17vp' })
      .justifyContent(FlexAlign.Center)
      if (this.isPlayFlag) {
        Row() {
          Video({ src: this.videoSrc, controller: this.controller })
            .width('100%')
            .height('100%')
            .autoPlay(true)
            .controls(false)
            .zIndex(0)
            .onPrepared((event) => {
              if (event) {
                this.durationTime = event.duration
                console.info(this.durationTime.toString());
              }
            })
            .onUpdate((event) => {
              if (event) {
                this.currentTime = event.time
              }
            })
            .onFinish(() => {
              this.isStart = !this.isStart;
            })
            .transition(TransitionEffect.OPACITY.animation({ duration: 1000, curve: Curve.Sharp }))
        }.width('100%')
        .margin({ top: '17vp' })
        .justifyContent(FlexAlign.Center)
      }
    }
  }
}
