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

import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { Hypium } from '@ohos/hypium';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void { console.info('[AppStartupTests] prepare'); }

  async onRun(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    // UiTest's native exporter must see the registered delegator, not run while loading this Runner.
    // Leave the caller's timeout and class filters untouched.
    try {
      const suite = await import('../test/List.test');
      Hypium.hypiumTest(delegator, args, suite.default);
    } catch (error) {
      const message = `Test initialization failed: ${(error as Error).message}`;
      console.error(message);
      await delegator.finishTest(message, 1);
    }
  }
}
