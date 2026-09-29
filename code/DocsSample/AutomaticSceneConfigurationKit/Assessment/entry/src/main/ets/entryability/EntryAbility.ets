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
import Logger from '../common/utils/Logger';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`onCreate, failed to set color mode, code: ${err.code}, message: ${err.message}`);
    }
    Logger.info('Ability onCreate');
  }

  onDestroy(): void {
    Logger.info('Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info('Ability onWindowStageCreate');
    windowStage.loadContent('pages/Index', (error: BusinessError) => {
      if (error !== undefined && error.code !== 0) {
        Logger.error(`onWindowStageCreate, failed to load content, code: ${error.code}`);
        return;
      }
      Logger.info('onWindowStageCreate, content loaded');
    });
  }

  onWindowStageDestroy(): void {
    Logger.info('Ability onWindowStageDestroy');
  }

  onForeground(): void {
    Logger.info('Ability onForeground');
  }

  onBackground(): void {
    Logger.info('Ability onBackground');
  }
}
