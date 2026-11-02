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
    hilog.info(0x0000, '[Sample_LocationKit]', 'Ability onCreate');
    // Request user_grant location permissions once at ability startup.
    // The declaration in module.json5 only makes the app a candidate for the
    // permissions; the actual grant must be requested from the user at runtime.
    this.requestLocationPermission();
  }

  onDestroy(): void {
    hilog.info(0x0000, '[Sample_LocationKit]', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, '[Sample_LocationKit]', 'Ability onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, '[Sample_LocationKit]', `Failed to load content: ${JSON.stringify(err)}`);
        return;
      }
      hilog.info(0x0000, '[Sample_LocationKit]', 'Succeeded in loading content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, '[Sample_LocationKit]', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, '[Sample_LocationKit]', 'Ability onForeground');
  }

  onBackground(): void {
    hilog.info(0x0000, '[Sample_LocationKit]', 'Ability onBackground');
  }

  // Request location permissions (user_grant) and handle the result.
  // APPROXIMATELY_LOCATION provides coarse coordinates, LOCATION provides
  // precise coordinates; requesting them together shows a combined dialog.
  private requestLocationPermission(): void {
    try {
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const permissions: Permissions[] =
        ['ohos.permission.APPROXIMATELY_LOCATION', 'ohos.permission.LOCATION'];
      atManager.requestPermissionsFromUser(this.context, permissions, (err: BusinessError, data) => {
        if (err) {
          hilog.error(0x0000, '[Sample_LocationKit]', `Permission request failed: code=${err.code}, message=${err.message}`);
          return;
        }
        hilog.info(0x0000, '[Sample_LocationKit]', `Permission results: ${JSON.stringify(data.authResults)}`);
      });
    } catch (err) {
      hilog.error(0x0000, '[Sample_LocationKit]',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }
}
