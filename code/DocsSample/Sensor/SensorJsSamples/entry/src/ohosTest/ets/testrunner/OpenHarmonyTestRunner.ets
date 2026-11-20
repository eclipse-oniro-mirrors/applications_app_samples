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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import TestRunner from '@ohos.application.testRunner';
import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want';

const DOMAIN: number = 0x0000;
const TAG: string = 'SensorTestRunner';

/**
 * Stage-model test entry point.
 * Keep the runner free of test-suite and UiTest imports: the native UiTest
 * exporter needs AbilityDelegator to be registered before those modules load.
 * The test-host ability owns the single Hypium execution.
 */
export default class OpenHarmonyTestRunner implements TestRunner {
  private started: boolean = false;

  constructor() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Sensor test runner constructed');
  }

  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Preparing SensorJsSamples tests');
  }

  /** Start the test host after the platform has registered this runner. */
  async onRun(): Promise<void> {
    if (this.started) {
      hilog.error(DOMAIN, TAG, '%{public}s', 'Duplicate test runner invocation');
      throw new Error('Sensor test runner was invoked more than once');
    }
    this.started = true;
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const argumentsValue = AbilityDelegatorRegistry.getArguments();
    try {
      if (argumentsValue.bundleName.length === 0) {
        throw new Error('Test bundle name is missing');
      }
      const testHost: Want = {
        bundleName: argumentsValue.bundleName,
        moduleName: 'entry_test',
        abilityName: 'TestAbility'
      };
      hilog.info(DOMAIN, TAG, '%{public}s', 'Starting sensor test host');
      await delegator.startAbility(testHost);
      hilog.info(DOMAIN, TAG, '%{public}s', 'Sensor test host started');
    } catch (error) {
      const failure: Error = error as Error;
      hilog.error(DOMAIN, TAG, 'Test startup failed: %{public}s', failure.message);
      await delegator.finishTest('Sensor test startup failed: ' + failure.message, -1);
    }
  }
}
