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

import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from 'library';

/**
 * Application entry ability that loads the Index page and follows the system color mode.
 */
export default class EntryAbility extends UIAbility {
  /**
   * Called when the ability is created; marks the start of the app lifecycle.
   * @param want launch parameter that started this ability.
   * @param launchParam launch reason and other launch constants.
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.enter('[EntryAbility#onCreate]');
    // Open the trace section for this lifecycle hook.
    Logger.beginTrace('NetworkSecurity.entry.onCreate', 1);
    Logger.info('EntryAbility onCreate');
    // Close the trace section with the same name and task id.
    Logger.endTrace('NetworkSecurity.entry.onCreate', 1);
    Logger.exit('[EntryAbility#onCreate]');
  }

  /**
   * Called when the ability is destroyed; marks the end of the app lifecycle.
   */
  onDestroy(): void {
    Logger.enter('[EntryAbility#onDestroy]');
    // Open the trace section for this lifecycle hook.
    Logger.beginTrace('NetworkSecurity.entry.onDestroy', 1);
    Logger.info('EntryAbility onDestroy');
    // Close the trace section with the same name and task id.
    Logger.endTrace('NetworkSecurity.entry.onDestroy', 1);
    Logger.exit('[EntryAbility#onDestroy]');
  }

  /**
   * Called when the window stage is created; loads the entry page into the window.
   * @param windowStage window stage that manages the app windows.
   */
  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.enter('[EntryAbility#onWindowStageCreate]');
    // Open the trace section for this lifecycle hook.
    Logger.beginTrace('NetworkSecurity.entry.onWindowStageCreate', 1);
    Logger.info('EntryAbility onWindowStageCreate');
    // Load the entry page; the async callback reports success or failure.
    windowStage.loadContent('pages/Index', (err) => {
      // A non-zero error code means the page failed to load.
      if (err.code) {
        Logger.error('Failed to load the content, code: ' + err.code + ', message: ' + err.message);
        return;
      }
      Logger.info('Succeeded in loading the content');
    });

    try {
      // Let the app follow the dark or light mode configured by the user.
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (error) {
      // Convert the caught value to BusinessError so code and message fields are available.
      const err: BusinessError = error as BusinessError;
      Logger.error('Failed to set color mode, code: ' + err.code + ', message: ' + err.message);
    }
    // Close the trace section with the same name and task id.
    Logger.endTrace('NetworkSecurity.entry.onWindowStageCreate', 1);
    Logger.exit('[EntryAbility#onWindowStageCreate]');
  }

  /**
   * Called when the window stage is about to be destroyed.
   */
  onWindowStageDestroy(): void {
    Logger.enter('[EntryAbility#onWindowStageDestroy]');
    // Open the trace section for this lifecycle hook.
    Logger.beginTrace('NetworkSecurity.entry.onWindowStageDestroy', 1);
    Logger.info('EntryAbility onWindowStageDestroy');
    // Close the trace section with the same name and task id.
    Logger.endTrace('NetworkSecurity.entry.onWindowStageDestroy', 1);
    Logger.exit('[EntryAbility#onWindowStageDestroy]');
  }

  /**
   * Called when the ability moves to the foreground.
   */
  onForeground(): void {
    Logger.enter('[EntryAbility#onForeground]');
    // Open the trace section for this lifecycle hook.
    Logger.beginTrace('NetworkSecurity.entry.onForeground', 1);
    Logger.info('EntryAbility onForeground');
    // Close the trace section with the same name and task id.
    Logger.endTrace('NetworkSecurity.entry.onForeground', 1);
    Logger.exit('[EntryAbility#onForeground]');
  }

  /**
   * Called when the ability moves to the background.
   */
  onBackground(): void {
    Logger.enter('[EntryAbility#onBackground]');
    // Open the trace section for this lifecycle hook.
    Logger.beginTrace('NetworkSecurity.entry.onBackground', 1);
    Logger.info('EntryAbility onBackground');
    // Close the trace section with the same name and task id.
    Logger.endTrace('NetworkSecurity.entry.onBackground', 1);
    Logger.exit('[EntryAbility#onBackground]');
  }
}
