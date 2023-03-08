/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import UIAbility from '@ohos.app.ability.UIAbility';
import Logger from '../model/Logger';

export default class MainAbility extends UIAbility {
  onCreate(want, launchParam) {
    Logger.log('[ArkTSCard] MainAbility onCreate');
    globalThis.abilityWant = want;
  }

  onDestroy() {
    Logger.log('[ArkTSCard] MainAbility onDestroy');
  }

  onWindowStageCreate(windowStage) {
    // Main window is created, set main page for this ability
    Logger.log('[ArkTSCard] MainAbility onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        console.error('[ArkTSCard] Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      console.info('[ArkTSCard] Succeeded in loading the content. Data: ' + JSON.stringify(data));
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    Logger.log('[ArkTSCard] MainAbility onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    Logger.log('[ArkTSCard] MainAbility onForeground');
  }

  onBackground() {
    // Ability has back to background
    Logger.log('[ArkTSCard] MainAbility onBackground');
  }
};
