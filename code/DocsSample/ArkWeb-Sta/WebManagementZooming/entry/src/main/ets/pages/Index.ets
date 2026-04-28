'use static';
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
import { Component, Entry, Column, ColumnOptions, Button, ClickEvent, Length, UIContext } from '@ohos.arkui.component';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  build() {
    Column({ space: 20 } as ColumnOptions) {
      Button('ControlWebGestureZoomingButton')
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/ControlWebGestureZooming',
          }, (error: BusinessError<void> | null) => {
            if (error) {
              console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
            }
          })
        })

      Button('ControlMouseAndKeyBoardZoomingButton')
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/ControlMouseAndKeyBoardZooming',
          }, (error: BusinessError<void> | null) => {
            if (error) {
              console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
            }
          })
        })

      Button('MonitorZoomRatioButton')
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/MonitorZoomRatio',
          }, (error: BusinessError<void> | null) => {
            if (error) {
              console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
            }
          })
        })

      Button('ControlZoomByFixedRatioButton')
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/ControlZoomByFixedRatio',
          }, (error: BusinessError<void> | null) => {
            if (error) {
              console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
            }
          })
        })

      Button('ControlZoomByInputButton')
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/ControlZoomByInput',
          }, (error: BusinessError<void> | null) => {
            if (error) {
              console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
            }
          })
        })

      Button('ControlZoomToFixedRatioButton')
        .onClick((e: ClickEvent) => {
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/ControlZoomToFixedRatio',
          }, (error: BusinessError<void> | null) => {
            if (error) {
              console.error(`pushUrl failed, code is ${error.code}, message is ${error.message}`);
            }
          })
        })

    }.height('100%')
    .width('100%')
  }
}
