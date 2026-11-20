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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { logger } from '../util/Logger';

const TAG: string = 'NewAbility';

export default class NewAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    AppStorage.setOrCreate('want', want);
    AppStorage.setOrCreate('launchParam', launchParam);
    logger.info(`${TAG} onCreate ${want.bundleName},${launchParam.launchReason}`);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/New', (err: BusinessError) => {
      if (err.code) {
        logger.error(`${TAG} loadContent failed: ${JSON.stringify(err)}`);
        return;
      }
      logger.info(`${TAG} loadContent succeeded`);
    });
    this.setImmersiveLayout(windowStage);
  }

  onDestroy(): void {
    logger.info(`${TAG} onDestroy`);
  }

  onWindowStageDestroy(): void {
    logger.info(`${TAG} onWindowStageDestroy`);
  }

  onForeground(): void {
    logger.info(`${TAG} onForeground`);
  }

  onBackground(): void {
    logger.info(`${TAG} onBackground`);
  }

  private setImmersiveLayout(windowStage: window.WindowStage): void {
    try {
      const mainWindow: window.Window = windowStage.getMainWindowSync();
      mainWindow.setWindowLayoutFullScreen(true).then(() => {
        logger.info(`${TAG} setWindowLayoutFullScreen succeeded`);
      }).catch((error: BusinessError) => {
        logger.error(`${TAG} setWindowLayoutFullScreen failed: ${JSON.stringify(error)}`);
      });
    } catch (error) {
      logger.error(`${TAG} getMainWindowSync failed: ${JSON.stringify(error)}`);
    }
  }
}
