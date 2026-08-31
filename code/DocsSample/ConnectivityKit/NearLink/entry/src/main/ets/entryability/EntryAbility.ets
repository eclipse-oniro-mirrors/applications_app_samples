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

import { AbilityConstant, UIAbility, Want, abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

export default class EntryAbility extends UIAbility {

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', 'Ability onCreate');
    // Request user_grant permission once at ability startup
    this.requestNearLinkPermission();
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', 'Ability onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', `Failed to load content: ${JSON.stringify(err)}`);
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', 'Ability onForeground');
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', 'Ability onBackground');
  }

  // Request NearLink permission (normal level, user_grant) and handle the result
  private requestNearLinkPermission(): void {
    try {
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      let permissions: Array<Permissions> = ['ohos.permission.ACCESS_NEARLINK'];
      atManager.requestPermissionsFromUser(this.context, permissions, (err: BusinessError, data) => {
        if (err) {
          hilog.error(0x0000, 'testTag', `Permission request failed: code=${err.code}, message=${err.message}`);
          return;
        }
        let granted: boolean = data.authResults.length > 0 && data.authResults[0] === 0;
        hilog.info(0x0000, 'testTag', `ACCESS_NEARLINK granted: ${granted}`);
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }
}
