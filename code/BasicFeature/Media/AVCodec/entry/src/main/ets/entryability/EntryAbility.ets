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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit'
import { BusinessError } from '@kit.BasicServicesKit'
import { window } from '@kit.ArkUI'
import Logger from '../common/utils/Logger'

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    Logger.info('Ability onCreate');
    globalThis.context = this.context;
  }

  onDestroy() {
    Logger.info('Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    Logger.info('Ability onWindowStageCreate');

    windowStage.getMainWindowSync().setWindowKeepScreenOn(true);
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        Logger.error('Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      AppStorage.setOrCreate('context', windowStage.getMainWindowSync().getUIContext());
      Logger.info('Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    })
    let windowClass: window.Window = windowStage.getMainWindowSync(); // 获取应用主窗口
    // Set the window to full screen
    let isLayoutFullScreen = true;
    windowClass.setWindowLayoutFullScreen(isLayoutFullScreen)
      .then(() => {
        Logger.info('Succeeded in setting the window layout to full-screen mode.');
      })
      .catch((err: BusinessError) => {
        Logger.error('Failed to set the window layout to full-screen mode.', JSON.stringify(err) ?? '');
      })
    // Set the font color of the status bar.
    let systemBarProperties: window.SystemBarProperties = {
      statusBarContentColor: '#FFFFFF'
    };
    windowStage.getMainWindowSync().setWindowSystemBarProperties(systemBarProperties);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    Logger.info('Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    Logger.info('Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    Logger.info('Ability onBackground');
  }
}
