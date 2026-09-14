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

import { BusinessError } from '@kit.BasicServicesKit';
import { NavigationPage } from './NavigationPage';
import { abilityAccessCtrl, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { Logger } from '../utils/Logger';
import { MediaControlCenter } from '../controller/MediaControlCenter';

@Entry
@Component
struct Index {
  @State text: string = '';
  @State isEnglish: boolean = false;
  @Provide('NavPathStack') pageStack: NavPathStack = new NavPathStack();

  async aboutToAppear() {
    // Obtain microphone permission.
    let context = this.getUIContext().getHostContext();
    let permission: Permissions[] = ['ohos.permission.MICROPHONE'];
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(context, permission).then((data: PermissionRequestResult) => {
      let grantStatus: number[] = data.authResults;
      AppStorage.setOrCreate('grantStatus', grantStatus);
      let length: number = grantStatus.length;
      for (let i = 0; i < length; i++) {
        if (grantStatus[i] !== 0) {
          return;
        }
      }
    }).catch((err: BusinessError) => {
      Logger.error(`Failed to requestPermissionsFromUser, ${JSON.stringify(err)}`);
    });
  }

  showTips() {
    try {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.ui_displayed'),
        duration: 2000
      })
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(`Failed to showToast, ${JSON.stringify(err)}`);
    }
  }

  @Builder
  PagesMap(name: string) {
    if (name === 'navigationPage') {
      NavigationPage();
    }
  }

  @Builder
  mySearch() {
    Column() {
      TextInput({ placeholder: $r('app.string.placeholder'), text: this.text })
        .padding({ left: 36 })
        .fontSize(18)
        .height(46)
        .onSubmit(() => {
          this.showTips();
          this.text = '';
        })
        .onChange((value: string) => {
          this.text = value;
        })
      Image($r('app.media.Public_ic_public_input_search'))
        .width(18)
        .height(18)
        .position({
          x: 12,
          y: 15
        })
        .draggable(false)
      Image($r('app.media.mic'))
        .width(18)
        .height(18)
        .position({
          x: 326,
          y: 15
        })
        .draggable(false)
    }
  }

  @Builder
  myBuilder() {
    Column() {
      this.mySearch() // Search box
      Row() {
        Column({ space: 4 }) {
          Image($r('app.media.near'))
            .height(24)
            .draggable(false)
          Text($r('app.string.near'))
            .fontSize(10)
            .fontColor(Color.Black)
            .opacity(0.6)
        }
        .width(28)
        .height(54)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.showTips();
        })

        Column({ space: 4 }) {
          Image($r('app.media.star'))
            .height(24)
            .draggable(false)
          Text($r('app.string.star_number'))
            .fontSize(10)
            .fontColor(Color.Black)
            .opacity(0.6)
        }
        .width(28)
        .height(54)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.showTips();
        })

        Column({ space: 4 }) {
          Image($r('app.media.share'))
            .height(24)
            .draggable(false)
          Text($r('app.string.share'))
            .fontSize(10)
            .fontColor(Color.Black)
            .opacity(0.6)
        }
        .width(28)
        .height(54)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.showTips();
        })

        Column({ space: 4 }) {
          Image($r('app.media.taxi'))
            .height(24)
            .draggable(false)
          Text($r('app.string.take_a_taxi'))
            .fontSize(10)
            .fontColor(Color.Black)
            .opacity(0.6)
        }
        .width(28)
        .height(54)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.showTips();
        })

        Button() {
          Text($r('app.string.navigation'))
            .fontSize(12)
            .fontColor(Color.Black)
            .fontWeight(FontWeight.Medium)
        }
        .width(72)
        .height(28)
        .backgroundColor($r('app.color.button_background'))
        .onClick(() => {
          this.showTips();
        })

        Button() {
          Text($r('app.string.route'))
            .fontSize(12)
            .fontColor($r('app.color.linearGradient_color1'))
            .fontWeight(FontWeight.Medium)
        }
        .width(72)
        .height(28)
        .backgroundColor($r('app.color.button_background'))
        .onClick(() => {
          this.pageStack.pushPathByName('navigationPage', null);
        })
      }
      .width('100%')
      .height(54)
      .margin({ top: 16 })
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .padding({
      left: 16,
      right: 16,
      top: 24
    })
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .borderRadius({ topLeft: 32, topRight: 32 })
  }

  build() {
    Navigation(this.pageStack) {
      Column() {
        Image($r('app.media.positioning'))
          .width(32)
          .position({
            x: 200,
            y: 200
          })
          .draggable(false)
        Image($r('app.media.detection'))
          .width(90)
          .height(90)
          .position({
            x: 306,
            y: 324
          })
          .draggable(false)
          .onClick(() => {
            this.showTips();
          })
        Image($r('app.media.routes3'))
          .width(90)
          .height(90)
          .position({
            x: 306,
            y: 384
          })
          .draggable(false)
          .onClick(() => {
            this.showTips();
          })
          .visibility(this.isEnglish ? Visibility.None : Visibility.Visible)

        this.myBuilder(); // The bottom action bar
      }
      .justifyContent(FlexAlign.End)
      .width('100%')
      .height('100%')
    }
    .backgroundImage(this.isEnglish ? $r('app.media.backgroundMap_en') : $r('app.media.backgroundMap'))
    .backgroundImageSize({ width: '100%', height: '100%' })
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
    .mode(NavigationMode.Stack)
    .height('100%')
    .width('100%')
    .hideToolBar(true)
    .navDestination(this.PagesMap)
  }
}