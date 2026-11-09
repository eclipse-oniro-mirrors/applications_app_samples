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
import { BusinessError } from '@kit.BasicServicesKit';
import { logger } from '@ohos/annotation';

export default class EntryAbility extends UIAbility {
  public onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      logger.info(`EntryAbility onCreate: ${JSON.stringify(want)}, ${JSON.stringify(launchParam)}`);
    } catch (error) {
      logger.info('EntryAbility onCreate');
    }
  }

  public onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/Index', (err: BusinessError) => {
      if (err.code) {
        logger.error(`Failed to load the content: ${JSON.stringify(err)}`);
        return;
      }
      logger.info('Succeeded in loading the content');
    });
  }

  public onDestroy(): void {
    logger.info('EntryAbility onDestroy');
  }

  public onWindowStageDestroy(): void {
    logger.info('EntryAbility onWindowStageDestroy');
  }
}
