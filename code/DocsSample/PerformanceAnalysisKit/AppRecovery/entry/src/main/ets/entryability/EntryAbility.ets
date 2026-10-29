/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// [Start import_h]
// [Start import_appRecovery_h]
// [Start import_save_h]
import {
  appRecovery,
// [StartExclude import_appRecovery_h]
  AbilityConstant,
  errorManager,
// [StartExclude import_save_h]
  UIAbility,
  Want,
  wantConstant,
// [EndExclude import_save_h]
// [EndExclude import_appRecovery_h]
} from '@kit.AbilityKit';
// [End import_save_h]
// [End import_appRecovery_h]
// [End import_h]

// [Start import_hilog_h]
import { hilog } from '@kit.PerformanceAnalysisKit';
// [End import_hilog_h]

import { window } from '@kit.ArkUI';

// [Start domain_h]
const DOMAIN = 0x0000;
// [End domain_h]

// [Start error_observer_callback]
let registerId = -1;
let callback: errorManager.ErrorObserver = {
  onUnhandledException(errMsg) {
    hilog.error(DOMAIN, 'testRecoveryTag', `errMsg: ${errMsg}`);
    appRecovery.saveAppState();
    appRecovery.restartApp();
  }
}
// [End error_observer_callback]

export default class EntryAbility extends UIAbility {
  storage: LocalStorage | undefined = undefined;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testRecoveryTag', '%{public}s', 'Ability onCreate');
    // [Start enable_app_recovery]
    appRecovery.enableAppRecovery(appRecovery.RestartFlag.ALWAYS_RESTART,
      appRecovery.SaveOccasionFlag.SAVE_WHEN_ERROR | appRecovery.SaveOccasionFlag.SAVE_WHEN_BACKGROUND,
      appRecovery.SaveModeFlag.SAVE_WITH_FILE);
    // [End enable_app_recovery]

    // [Start on_create_recovery]
    if (launchParam.launchReason == AbilityConstant.LaunchReason.APP_RECOVERY) {
      this.storage = new LocalStorage();
      if (want.parameters) {
        let recoveryData = want.parameters['myData'];
        this.storage.setOrCreate('myData', recoveryData);
        this.context.restoreWindowStage(this.storage);
      }
    }
    // [End on_create_recovery]
    // [Start recovery_restart_flag]
    if (want.parameters === undefined) {
      return;
    }
    if (want.parameters[wantConstant.Params.ABILITY_RECOVERY_RESTART] != undefined &&
      want.parameters[wantConstant.Params.ABILITY_RECOVERY_RESTART] == true) {
      hilog.info(DOMAIN, 'testRecoveryTag', 'This ability need to recovery');
    }
    // [End recovery_restart_flag]
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testRecoveryTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testRecoveryTag', '%{public}s', 'Ability onWindowStageCreate');
    // [Start errormanager_on_callback]
    registerId = errorManager.on('error', callback);
    // [End errormanager_on_callback]

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testRecoveryTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(DOMAIN, 'testRecoveryTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testRecoveryTag', '%{public}s', 'Ability onWindowStageDestroy');

    // [Start errormanager_off_callback]
    errorManager.off('error', registerId, (err) => {
      hilog.error(DOMAIN, 'testRecoveryTag', '[Demo] err:', err);
    });
    // [End errormanager_off_callback]
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testRecoveryTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testRecoveryTag', '%{public}s', 'Ability onBackground');
  }

  // [Start on_save_state]
  onSaveState(state: AbilityConstant.StateType, wantParams: Record<string, Object>) {
    // Ability has called to save app data
    hilog.info(DOMAIN, 'testRecoveryTag', '[Demo] EntryAbility onSaveState');
    wantParams['myData'] = 'my1234567';
    return AbilityConstant.OnSaveResult.ALL_AGREE;
  }
  // [End on_save_state]
}
