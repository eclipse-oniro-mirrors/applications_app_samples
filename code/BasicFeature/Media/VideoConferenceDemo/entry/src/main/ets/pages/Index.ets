/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { abilityAccessCtrl, common } from '@kit.AbilityKit';
import { CustomToolBar } from '../components/CustomToolBar';
import { SubWindowManager } from '../common/SubWindowManager';
import { AudioDevice } from '../components/AudioDevice';
import { ConferenceVideo } from '../components/ConferenceVideo';
import { checkPermission, requestPermissions } from '../common/utils/PermissionUtil';
import { Logger } from '../common/utils/Logger';

const TAG = 'Index'

@Entry
@Component
struct Index {
  private uiContext = this.getUIContext();
  private context = this.uiContext.getHostContext() as common.UIAbilityContext;

  aboutToAppear(): void {
    this.checkPermission();
  }

  aboutToDisappear(): void {
    SubWindowManager.destroy();
  }

  checkPermission() {
    checkPermission('ohos.permission.MICROPHONE')
      .then((status: abilityAccessCtrl.GrantStatus) => {
        if (status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED) {
          requestPermissions(this.context as common.UIAbilityContext, ['ohos.permission.MICROPHONE']);
        }
      })
      .catch((err: BusinessError) => {
        Logger.error(TAG, `Check permission failed, error code: ${err.code}, message: ${err.message}`);
      });
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Row() {
          ConferenceVideo()
        }
        .width('100%')
        .aspectRatio(16 / 9)
        .backgroundColor(Color.White)

      }
      .backgroundColor($r('sys.color.black'))
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)

      CustomToolBar()

      Row() {
        AudioDevice()

        Button('离开', { buttonStyle: ButtonStyleMode.EMPHASIZED, role: ButtonRole.ERROR })
          .width(88)
          .height(28)
          .onClick(() => {
            this.context.terminateSelf();
          })
      }
      .width('100%')
      .height(28)
      .padding({ left: 16, right: 16 })
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .position({ top: 12 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}