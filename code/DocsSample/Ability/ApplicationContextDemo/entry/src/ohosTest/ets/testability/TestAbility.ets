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
import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { waitForEntryForeground } from '../test/Shared/EntryReadiness';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

const TAG: string = '[Sample_ApplicationContext]';
const DOMAIN: number = 0xF811;
const MAIN_ABILITY_NAME: string = 'EntryAbility';

/**
 * 启动被测应用主Ability：ApplicationContextDemo 的主页面为 EntryAbility
 * 应用启动后 ApplicationContext 相关能力（cacheDir/filesDir/on-off/area）才可用
 */
async function startApplicationContextApp(): Promise<void> {
  let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let args: AbilityDelegatorRegistry.AbilityDelegatorArgs = AbilityDelegatorRegistry.getArguments();
  if (args.bundleName !== 'com.samples.applicationcontext') {
    throw new Error('Unexpected target bundle: ' + args.bundleName);
  }
  let want: Want = {
    bundleName: args.bundleName,
    abilityName: MAIN_ABILITY_NAME
  };
  hilog.info(DOMAIN, TAG, '%{public}s', `startApplicationContextApp: ${args.bundleName}/${MAIN_ABILITY_NAME}`);
  await delegator.startAbility(want);
}

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onCreate');
    hilog.info(DOMAIN, TAG, '%{public}s', 'want param: ' + JSON.stringify(want) ?? '');
    hilog.info(DOMAIN, TAG, '%{public}s', 'launchParam: ' + JSON.stringify(launchParam) ?? '');
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase!');
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility initialized; waiting for test window');
  }

  onDestroy() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        this.failStartup('Test window load failed: ' + err.code.toString());
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
      this.startTests().catch((failure: Error): void => {
        this.failStartup('Test initialization rejected: ' + failure.message);
      });
    });
  }

  onWindowStageDestroy() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  private testsStarted: boolean = false;

  private failStartup(reason: string): void {
    hilog.error(DOMAIN, TAG, '%{public}s', reason);
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    delegator.finishTest(reason, -1).catch((error: Error): void => {
      hilog.error(DOMAIN, TAG, 'Failed to report initialization failure: %{public}s', error.message);
    });
  }

  private async startTests(): Promise<void> {
    if (this.testsStarted) {
      return;
    }
    this.testsStarted = true;
    try {
      await startApplicationContextApp();
      await waitForEntryForeground();
      const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      const args = AbilityDelegatorRegistry.getArguments();
      Hypium.hypiumTest(delegator, args, testsuite);
    } catch (error) {
      const failure: Error = error as Error;
      this.failStartup('EntryAbility initialization failed: ' + failure.message);
    }
  }

  onForeground() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onBackground');
  }
}
