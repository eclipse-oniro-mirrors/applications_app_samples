/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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

import { SaveRequestCallback } from 'application/AutoFillRequest';
import { hilog } from '@kit.PerformanceAnalysisKit';

const storage = LocalStorage.getShared();
const saveRequestCallback: SaveRequestCallback | undefined = storage.get<SaveRequestCallback>('saveCallback');

function SuccessFunc(success: boolean) {
  if (saveRequestCallback) {
    if (success) {
      saveRequestCallback.onSuccess();
    }
    saveRequestCallback.onFailure();
  }
  hilog.error(0x0000, 'testTag', '%{public}s', 'saveRequestCallback is nullptr!');
}

@Entry
@Component
struct SavePage {
  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        Image($r('app.media.ic_public_back'))
          .height(24)
          .width(24)
          .onClick(() => {
            hilog.info(0x0000, 'testTag', '%{public}s', 'save cancel');
            SuccessFunc(false);
          })
        Text($r('app.string.saveInfo'))
          .fontWeight(500)
          .fontFamily('HarmonyHeiTi-Medium')
          .fontSize(20)
          .fontColor($r('app.color.userPassWord_title'))
          .margin({ left: '4.4%' })
          .id('Save')
      }.margin({ top: '8.8%', left: '4.9%' }).height('7.2%')

      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Start }) {
        Text($r('app.string.passWord'))
          .fontFamily('HarmonyHeiTi-Medium')
          .fontSize(16)
          .fontColor($r('app.color.userPassWord_title'))
          .fontWeight(500)
        Text($r('app.string.new_Password'))
          .fontSize(14)
          .fontFamily('HarmonyHeiTi')
          .fontWeight(400)
          .fontColor($r('app.color.userPassWord_title'))
      }
      .borderRadius(24)
      .backgroundColor($r('app.color.controlBackColor'))
      .width('95%')
      .height('9.2%')
      .padding({ top: '3.8%', left: '3.3%' })

      Row() {
        Text($r('app.string.cancel'))
          .backgroundColor($r('app.color.cancelBackColor'))
          .borderRadius(20)
          .fontFamily('HarmonyHeiTi-Medium')
          .fontSize(16)
          .fontWeight(500)
          .lineHeight(22)
          .width('41.7%')
          .height('16.5%')
          .fontColor($r('app.color.cancelBtnColor'))
          .textAlign(TextAlign.Center)
          .onClick(() => {
            SuccessFunc(false);
          })
        Text($r('app.string.confirm'))
          .backgroundColor($r('app.color.cancelBtnColor'))
          .borderRadius(20)
          .fontFamily('HarmonyHeiTi-Medium')
          .fontSize(16)
          .fontWeight(500)
          .lineHeight(22)
          .fontColor($r('app.color.controlBackColor'))
          .width('41.7%')
          .height('16.5%')
          .textAlign(TextAlign.Center)
          .margin({ left: '3.3%' })
          .id('saveConfirm')
          .onClick(() => {
            SuccessFunc(true);
          })
      }.margin({ top: 550 })
    }
    .height('100%').backgroundColor($r('app.color.pageBackColor'))
  }
}