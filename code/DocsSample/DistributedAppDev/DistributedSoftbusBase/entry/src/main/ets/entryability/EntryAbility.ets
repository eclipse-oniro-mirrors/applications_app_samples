/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { abilityAccessCtrl, AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../util/Logger';
import { window } from '@kit.ArkUI';

// Permission requested at runtime. It is a user_grant permission required by
// every softbusBase API, so the app pops up the authorization dialog on launch.
const PERMISSION_DISTRIBUTED_DATASYNC = 'ohos.permission.DISTRIBUTED_DATASYNC';
// Authorization result code: 0 means the user authorized the permission.
const AUTH_RESULT_GRANTED = 0;

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    Logger.info('%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability.
    Logger.info('%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err: BusinessError) => {
      if (err.code) {
        Logger.error('Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      Logger.info('%{public}s', 'Succeeded in loading the content.');
      // After the page is loaded, request the user-grant permission so the
      // authorization dialog is shown over the loaded page.
      this.requestDistributedDataSyncPermission();
    });

    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      Logger.error('Failed to set colorMode. Cause: %{public}s', JSON.stringify(err));
    }
  }

  /**
   * Request ohos.permission.DISTRIBUTED_DATASYNC from the user. The permission
   * is a user_grant permission, so it must be requested at runtime; declaring
   * it in module.json5 alone is not enough.
   */
  private requestDistributedDataSyncPermission(): void {
    const atManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(this.context, [PERMISSION_DISTRIBUTED_DATASYNC])
      .then((result) => {
        const granted: boolean = result.authResults.length > 0 &&
          result.authResults.every((code: number) => code === AUTH_RESULT_GRANTED);
        Logger.info('DISTRIBUTED_DATASYNC granted=%{public}s', String(granted));
      })
      .catch((err: BusinessError) => {
        Logger.error('DISTRIBUTED_DATASYNC request failed: %{public}s', JSON.stringify(err));
      });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources.
    Logger.info('%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground.
    Logger.info('%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background.
    Logger.info('%{public}s', 'Ability onBackground');
  }
}
