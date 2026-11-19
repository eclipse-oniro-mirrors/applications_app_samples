/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { abilityDelegatorRegistry } from '@kit.TestKit'
import { AbilityConstant, Want, UIAbility } from '@kit.AbilityKit'
import testsuite from '../test/List.test'
import { window } from '@kit.ArkUI'
import { Hypium } from '@ohos/hypium'
import { logger } from '../util/Logger'

const TAG: string = 'TestAbility'
/** Hypium 启动延时（毫秒）：等 ability 完全进入前台后再装配用例，避免大测试包的 LIFECYCLE_TIMEOUT */
const HYPONIUM_START_DELAY_MS: number = 300

export default class TestAbility extends UIAbility {
  private testStarted: boolean = false

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    logger.info(TAG, `onCreate, want param: ${JSON.stringify(want)},launchParam: ${JSON.stringify(launchParam)}`)
  }

  onDestroy(): void {
    logger.info(TAG, 'onDestroy')
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    logger.info(TAG, 'onWindowStageCreate')
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        logger.error(TAG, `Failed to load the content. Cause: ${JSON.stringify(err)}`)
        return
      }
      logger.info(TAG, `Succeeded in loading the content. Data: ${JSON.stringify(data) ?? ''}`)
    })
  }

  onWindowStageDestroy(): void {
    logger.info(TAG, 'onWindowStageDestroy')
  }

  onForeground(): void {
    logger.info(TAG, 'onForeground')
    // Registered cases exceed 800: defer Hypium bootstrapping until the ability is
    // fully in foreground to avoid LIFECYCLE_TIMEOUT on large test HAPs.
    if (!this.testStarted) {
      this.testStarted = true
      setTimeout(() => {
        const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        const abilityDelegatorArguments = abilityDelegatorRegistry.getArguments()
        logger.info(TAG, 'start run testcase!!!')
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
      }, HYPONIUM_START_DELAY_MS)
    }
  }

  onBackground(): void {
    logger.info(TAG, 'onBackground')
  }
}
