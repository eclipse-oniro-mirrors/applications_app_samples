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
import { logWarning } from '../services/Logger';
import { window } from '@kit.ArkUI';
import { businessStore } from '../business/BusinessStore';
import { appNavigation } from '../navigation/AppNavigation';
import { shortcutService } from '../services/ShortcutService';
import { bindStrings } from '../i18n/Strings';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    const context = this.context.getApplicationContext();
    bindStrings(context);
    businessStore.initialize(context);
    appNavigation.initialize();
    shortcutService.initialize(context);
    appNavigation.receiveWant(want, true);
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    appNavigation.receiveWant(want, false);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/Index', (error) => {
      if (error.code) {
        logWarning(`EntryAbility loadContent failed; code=${error.code}`);
      }
    });
  }

  onDestroy(): void {
    appNavigation.dispose();
    shortcutService.dispose();
    businessStore.dispose();
  }
}
