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

import { ConfigurationConstant, UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { logWarn, logError } from '../core/Logger';
import { AppService, createAppService } from '../core/AppService';
import { logLaunchPhase } from '../core/LaunchEvidence';

export default class EntryAbility extends UIAbility {
  private service: AppService | undefined = undefined;

  onCreate(): void {
    logLaunchPhase('UIAbility.onCreate');
    this.service = createAppService(this.context);
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
    } catch (error) {
      logWarn(`setColorMode failed: ${(error as Error).message}`);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    logLaunchPhase('UIAbility.onWindowStageCreate');
    windowStage.loadContent('pages/Index', (error) => {
      if (error.code) {
        logError(`loadContent failed: ${error.code} ${error.message}`);
        return;
      }
      logLaunchPhase('windowStage.loadContent.completed');
      this.service?.markContentLoaded();
    });
  }

  onForeground(): void {
    this.service?.setForeground(true);
  }

  onBackground(): void {
    this.service?.setForeground(false);
  }
}
