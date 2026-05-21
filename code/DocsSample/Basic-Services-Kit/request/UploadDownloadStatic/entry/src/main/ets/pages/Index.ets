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

import { notificationManager } from '@kit.NotificationKit';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import { urlUtils, logger } from '../utils/Exports';
import {
  Entry, Component, Column, Row, Text, Image, TextInput, Button,
  Blank, Color, Resource, $r, ClickEvent, Visibility, ButtonType
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

const TAG: string = 'Index';

@Entry
@Component
struct Index {
  aboutToAppear(): void {
    try {
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      notificationManager.requestEnableNotification(context);
    } catch (error) {
      logger.error(TAG, 'Failed to request notification permission: ' + JSON.stringify(error));
    }
  }

  build() {
    Column() {
      TextInput({ text: $r('app.string.downloadServer') })
        .visibility(Visibility.Hidden)
        .height(0)
        .onChange((downloadServer: string) => {
          AppStorage.setOrCreate('downloadServer', downloadServer);
        })

      // Server row
      Row() {
        Text($r('app.string.HFS_tips'))
          .fontColor($r('app.color.text_normal'))
          .fontWeight(400)
          .fontFamily('HarmonyHeiTi')
          .fontSize(16)
        Blank()
        TextInput()
          .width(250)
          .height(40)
          .margin({ left: 20 })
          .onChange((val: string) => {
            urlUtils.saveUrl(this.getUIContext().getHostContext() as common.UIAbilityContext, val);
          })
      }
      .width('100%')
      .height(56)
      .padding({ top: 17, bottom: 17, left: 12, right: 12 })
      .backgroundColor(Color.White)
      .borderRadius(24)
      .margin({ top: 15 })

      // Upload capability - use Button as clickable container
      Button({ type: ButtonType.Normal }) {
        Row() {
          Image($r('app.media.ic_upload'))
            .size({ width: 24, height: 24 })
          Text($r('app.string.upload'))
            .fontColor($r('app.color.text_normal'))
            .fontWeight(400)
            .fontFamily('HarmonyHeiTi')
            .fontSize(16)
            .margin({ left: 12 })
        }
      }
      .width('100%')
      .height(56)
      .backgroundColor(Color.White)
      .borderRadius(24)
      .margin({ top: 20 })
      .id('btn_upload')
      .onClick((e: ClickEvent) => {
        this.getUIContext().getRouter().pushUrl({
          url: 'pages/Upload'
        }, (error: BusinessError<void> | null) => {
          if (error) {
            logger.error(TAG, `pushUrl failed, code is ${error.code}, message is ${error.message}`);
          }
        });
      })

      // Download capability
      Button({ type: ButtonType.Normal }) {
        Row() {
          Image($r('app.media.ic_download'))
            .size({ width: 24, height: 24 })
          Text($r('app.string.download'))
            .fontColor($r('app.color.text_normal'))
            .fontWeight(400)
            .fontFamily('HarmonyHeiTi')
            .fontSize(16)
            .margin({ left: 12 })
        }
      }
      .width('100%')
      .height(56)
      .backgroundColor(Color.White)
      .borderRadius(24)
      .margin({ top: 20 })
      .id('btn_download')
      .onClick((e: ClickEvent) => {
        AppStorage.setOrCreate('downloadAction', 'Normal');
        this.getUIContext().getRouter().pushUrl({
          url: 'pages/Download'
        }, (error: BusinessError<void> | null) => {
          if (error) {
            logger.error(TAG, `pushUrl failed, code is ${error.code}, message is ${error.message}`);
          }
        });
      })

      // Download to User capability
      Button({ type: ButtonType.Normal }) {
        Row() {
          Image($r('app.media.ic_download'))
            .size({ width: 24, height: 24 })
          Text($r('app.string.downloadToUser'))
            .fontColor($r('app.color.text_normal'))
            .fontWeight(400)
            .fontFamily('HarmonyHeiTi')
            .fontSize(16)
            .margin({ left: 12 })
        }
      }
      .width('100%')
      .height(56)
      .backgroundColor(Color.White)
      .borderRadius(24)
      .margin({ top: 20 })
      .id('btn_downloadToUser')
      .onClick((e: ClickEvent) => {
        AppStorage.setOrCreate('downloadAction', 'ToUser');
        this.getUIContext().getRouter().pushUrl({
          url: 'pages/Download'
        }, (error: BusinessError<void> | null) => {
          if (error) {
            logger.error(TAG, `pushUrl failed, code is ${error.code}, message is ${error.message}`);
          }
        });
      })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 6, top: 5 })
  }

  getResourceString(resource: Resource): string {
    try {
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      return context.resourceManager.getStringSync(resource.id);
    } catch (error) {
      logger.error(TAG, 'Failed to get resource string: ' + JSON.stringify(error));
      return '';
    }
  }
}