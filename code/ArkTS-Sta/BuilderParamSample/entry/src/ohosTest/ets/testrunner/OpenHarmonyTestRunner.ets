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

import TestRunner from '@ohos.application.testRunner';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';

export default class OpenHarmonyTestRunner implements TestRunner {
  private started: boolean = false;
  private failed: boolean = false;

  onPrepare(): void {
    hilog.info(0, 'BuilderParamTests', 'Preparing original and adapted sample suites');
  }

  async onRun(): Promise<void> {
    if (this.started) {
      hilog.info(0, 'BuilderParamTests', 'Test host launch already requested');
      return;
    }
    this.started = true;
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    const bundleName: string = args.bundleName;
    if (bundleName.length === 0) {
      await this.reportFailure('Test bundle name is empty');
      return;
    }
    try {
      hilog.info(0, 'BuilderParamTests', 'Launching TestAbility');
      await delegator.startAbility({
        bundleName: bundleName,
        abilityName: 'TestAbility'
      });
      hilog.info(0, 'BuilderParamTests', 'TestAbility launch accepted');
    } catch (error) {
      await this.reportFailure('Unable to launch TestAbility: ' + String(error));
    }
  }

  private async reportFailure(message: string): Promise<void> {
    if (this.failed) {
      return;
    }
    this.failed = true;
    hilog.error(0, 'BuilderParamTests', 'Runner failed: %{public}s', message);
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    await delegator.finishTest(message, -1);
  }
}
