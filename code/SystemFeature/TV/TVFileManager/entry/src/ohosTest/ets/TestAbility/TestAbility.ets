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

import { UIAbility, Want, AbilityConstant } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import { window } from '@kit.ArkUI';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { testsuiteGroups } from '../test/List.test';
import { runSuitesInBatches } from '../test/TestSuiteRunner';
import { grantAppPermissions } from '../test/Shared/TestDriver';

export default class TestAbility extends UIAbility {
  private startTimestamp: number = 0;

  private safeStringify(value: ESObject): string {
    try {
      const text: string | undefined = JSON.stringify(value);
      return text ?? '';
    } catch (error) {
      return 'serialization failed';
    }
  }

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    this.startTimestamp = Date.now();
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + this.safeStringify(want));
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + this.safeStringify(launchParam));
    // The delegator is used by every Hypium suite to query the test arguments
    // and to start the file manager EntryAbility when a UI suite needs a clean
    // navigation stack. It must be resolved before the suites are registered.
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    hilog.info(0x0000, 'testTag', '%{public}s',
      'test bundle: ' + abilityDelegatorArguments.bundleName);
    hilog.info(0x0000, 'testTag', '%{public}s',
      'test parameters: ' + this.safeStringify(abilityDelegatorArguments.parameters));
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    // UiTest can only see windows of an awake, unlocked screen. A TV drops to
    // screen off quickly, and in that state every component lookup returns an
    // empty tree, which silently turns UI suites into no-ops.
    this.keepScreenAwake(abilityDelegator);
    // UI automation suites need the file manager UI in the foreground, so bring the
    // application ability up first and give it a moment to render before running.
    const appWant: Want = {
      bundleName: abilityDelegatorArguments.bundleName,
      abilityName: 'EntryAbility',
      moduleName: 'entry'
    };
    try {
      abilityDelegator.startAbility(appWant, (err: BusinessError) => {
        hilog.info(0x0000, 'testTag', 'start EntryAbility: %{public}s', JSON.stringify(err) ?? 'ok');
      });
    } catch (error) {
      hilog.warn(0x0000, 'testTag', 'start EntryAbility failed: %{public}s', JSON.stringify(error) ?? '');
    }
    // Do not wait for the ability callback: the framework/DevEco waits for the first
    // test result and must not be blocked by the application cold start.
    //
    setTimeout(() => {
      // The permission panel is accepted in parallel with the suite execution:
      // the framework must receive the first test result quickly, and the UI
      // operations are serialized inside TestDriver, so nothing races.
      grantAppPermissions(6000).then((granted: number) => {
        hilog.info(0x0000, 'testTag', 'permission pages accepted before run: %{public}d', granted);
      }).catch((error: Error) => {
        hilog.warn(0x0000, 'testTag', 'accept permissions failed: %{public}s',
          JSON.stringify(error) ?? '');
      });
      // A freshly installed bundle may show the panel again after the first
      // grant (the application restarts), so a second inspection is scheduled.
      setTimeout(() => {
        grantAppPermissions(2500).then((second: number) => {
          hilog.info(0x0000, 'testTag', 'permission pages accepted second round: %{public}d', second);
        }).catch((error: Error) => {
          hilog.warn(0x0000, 'testTag', 'second accept round failed: %{public}s',
            JSON.stringify(error) ?? '');
        });
      }, 4000);
      runSuitesInBatches(testsuiteGroups);
    }, 800);
  }

  /**
   * Wakes the device and keeps the screen on for the whole run. Every command is
   * best effort: an unsupported command must not stop the test execution, the
   * failure is only logged.
   */
  private keepScreenAwake(delegator: AbilityDelegatorRegistry.AbilityDelegator): void {
    const commands: string[] = ['power-shell wakeup', 'power-shell setmode 602',
      'power-shell timeout -o 3600000'];
    for (const command of commands) {
      try {
        delegator.executeShellCommand(command, (err: BusinessError,
          data: AbilityDelegatorRegistry.ShellCmdResult) => {
          hilog.info(0x0000, 'testTag', 'shell %{public}s result: %{public}s exit=%{public}d',
            command, err ? (JSON.stringify(err) ?? '') : 'ok', data ? data.exitCode : -1);
        });
      } catch (error) {
        hilog.warn(0x0000, 'testTag', 'shell %{public}s failed: %{public}s',
          command, JSON.stringify(error) ?? '');
      }
    }
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onNewWant');
    hilog.info(0x0000, 'testTag', '%{public}s', 'new want: ' + this.safeStringify(want));
    hilog.info(0x0000, 'testTag', '%{public}s', 'new launch: ' + this.safeStringify(launchParam));
  }

  onDestroy() {
    const elapsed: number = Date.now() - this.startTimestamp;
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onDestroy, elapsed ms: ' + elapsed);
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onBackground');
  }
}