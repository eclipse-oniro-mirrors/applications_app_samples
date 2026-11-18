'use static'


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
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { BusinessError } from '@ohos.base';

async function startHandleTabsApp(): Promise<void> {
  let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let args = AbilityDelegatorRegistry.getArguments();
  let want: Want = {
    bundleName: args.bundleName,
    abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
}

function delay(ms: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void> | undefined) => void,
    reject: (reason: Error) => void): void => {
    setTimeout((): void => {
      resolve(undefined);
    }, ms);
  });
}

async function waitForEntryForeground(timeoutMs: int): Promise<boolean> {
  const delegator: AbilityDelegatorRegistry.AbilityDelegator =
    AbilityDelegatorRegistry.getAbilityDelegator();
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    try {
      const top = await delegator.getCurrentTopAbility();
      if (top.context.abilityInfo.name === 'EntryAbility') {
        return true;
      }
    } catch (err) {
      hilog.warn(0x0000, 'testTag', '%{public}s', 'query top ability failed, retrying');
    }
    await delay(200);
  }
  return false;
}

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    setTimeout((): void => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
      startHandleTabsApp().then(async (): Promise<void> => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'HandleTabs app launched');
        const foreground: boolean = await waitForEntryForeground(10000);
        hilog.info(0x0000, 'testTag', 'EntryAbility foreground: %{public}s', foreground.toString());
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
      }).catch((err: Error) => {
        hilog.error(0x0000, 'testTag', 'Failed to launch HandleTabs app: %{public}s', JSON.stringify(err) ?? '');
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
      });
    }, 1000);
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err: BusinessError<void> | null, data: void) => {
      if (err && err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onForeground');
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onBackground');
  }
}
