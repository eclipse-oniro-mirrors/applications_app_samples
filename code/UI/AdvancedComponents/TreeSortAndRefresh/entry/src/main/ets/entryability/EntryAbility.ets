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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import Logger from '../util/Logger';

/** Provides Entry Ability helpers for the sample. */
export default class EntryAbility extends UIAbility {
  // Handle the ability lifecycle event and write a log.
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('EntryAbility onCreate');
  }

  // Handle the ability lifecycle event and write a log.
  onDestroy(): void {
    Logger.info('EntryAbility onDestroy');
  }

  // Handle the ability lifecycle event and write a log.
  onWindowStageCreate(windowStage: window.WindowStage): void {
    try {
      const rect = windowStage.getMainWindowSync().getWindowProperties().windowRect;
      Logger.info(`Window stage ready, width=${rect.width}, height=${rect.height}`);
    } catch (error) {
      Logger.error(`get window properties failed: ${JSON.stringify(error)}`);
    }
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        Logger.error(`Failed to load content, code=${err.code}, message=${err.message}`);
        return;
      }
      Logger.info('Succeeded in loading content');
    });
  }

  // Handle the ability lifecycle event and write a log.
  onWindowStageDestroy(): void {
    Logger.info('EntryAbility onWindowStageDestroy');
  }

  // Handle the ability lifecycle event and write a log.
  onForeground(): void {
    Logger.info('EntryAbility onForeground');
  }

  // Handle the ability lifecycle event and write a log.
  onBackground(): void {
    Logger.info('EntryAbility onBackground');
  }
}
