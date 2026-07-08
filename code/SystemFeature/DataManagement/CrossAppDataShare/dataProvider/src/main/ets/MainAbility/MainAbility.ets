/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import UIAbility from '@ohos.app.ability.UIAbility'
import Window from '@ohos.window'
import { contactDataShareUtil, logger } from '@ohos/common'
import type Want from '@ohos.app.ability.Want'
import type AbilityConstant from '@ohos.app.ability.AbilityConstant'
import { BusinessError } from '@ohos.base'

const TAG: string = 'MainAbility'

export default class MainAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    logger.info(TAG, 'onCreate')
    globalThis.context = this.context
  }

  onDestroy(): void {
    logger.info(TAG, 'onDestroy')
  }

  onWindowStageCreate(windowStage: Window.WindowStage): void {
    logger.info(TAG, 'onWindowStageCreate')
    this.loadContent(windowStage)
  }

  async loadContent(windowStage: Window.WindowStage): Promise<void> {
    await contactDataShareUtil.createDataShareHelper(this.context)
    windowStage.loadContent('pages/Home', (err: BusinessError) => {
      if (err.code) {
        logger.info(TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '')
        return;
      }
      logger.info(TAG, 'Succeeded in loading the content.')
    });
  }

  onWindowStageDestroy(): void {
    logger.info(TAG, 'onWindowStageDestroy')
  }

  onForeground(): void {
    logger.info(TAG, 'onForeground')
  }

  onBackground(): void {
    logger.info(TAG, 'onBackground')
  }
}
