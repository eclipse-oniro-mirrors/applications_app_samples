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

import UIAbility from '@ohos.app.ability.UIAbility'
import Window from '@ohos.window'
import Logger from '../utils/Logger'
import { testsuiteGroups } from '../test/List.test'
import { runSuitesInBatches } from './TestSuiteRunner'
import Want from '@ohos.app.ability.Want'
import AbilityConstant from '@ohos.app.ability.AbilityConstant'
import { abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit'

export default class TestAbility extends UIAbility {
  /**
   * Wakes the screen and disables the idle timeout for the whole run. When the
   * screen sleeps, UiTest sees an empty component tree and every UI case turns
   * into a false failure, and the system may stop the test process entirely.
   */
  private keepScreenAwake(delegator: AbilityDelegatorRegistry.AbilityDelegator): void {
    let commands: string[] = ['power-shell wakeup', 'power-shell setmode 602',
      'power-shell timeout -o 3600000'];
    for (let index: number = 0; index < commands.length; index++) {
      let command: string = commands[index];
      try {
        delegator.executeShellCommand(command, () => {
          Logger.info('shell command finished: ' + command);
        });
      } catch (error) {
        Logger.warn('shell command failed: ' + command);
      }
    }
  }

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    Logger.info('TestAbility onCreate')
    Logger.info('want param:' + JSON.stringify(want) ?? '')
    Logger.info('launchParam:' + JSON.stringify(launchParam) ?? '')
    let delegator: AbilityDelegatorRegistry.AbilityDelegator =
      AbilityDelegatorRegistry.getAbilityDelegator();
    this.keepScreenAwake(delegator);
    Logger.info('start run testcase in batches!!!')
    // Let the TestAbility page and the power commands settle before the first
    // suite registers; the framework only waits for the first result.
    setTimeout(() => {
      runSuitesInBatches(testsuiteGroups);
    }, 800);
  }

  onDestroy() {
    Logger.info('TestAbility onDestroy')
  }

  onWindowStageCreate(windowStage: Window.WindowStage) {
    Logger.info('TestAbility onWindowStageCreate')
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        Logger.error('Failed to load the content. Cause: ', JSON.stringify(err) ?? '')
        return
      }
      Logger.info('Succeeded in loading the content. Data: ', JSON.stringify(data) ?? '')
    })
  }

  onWindowStageDestroy() {
    Logger.info('TestAbility onWindowStageDestroy')
  }

  onForeground() {
    Logger.info('TestAbility onForeground')
  }

  onBackground() {
    Logger.info('TestAbility onBackground')
  }
}