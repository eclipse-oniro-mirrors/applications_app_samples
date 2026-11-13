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
import { useModelBaselineStrings } from '../support/TestStrings';
import { logInfo, logWarning } from '../../../main/ets/services/Logger';
import { BUNDLE } from '../support/CaseScope';
import { normalizeLegacyFilters } from '../support/LegacyCaseFilter';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {}

  async onRun(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    // Register the delegator before importing suites that load the native UiTest exporter.
    // Preserve timeout/flags; map only exact known legacy leaves in class/testCaseNames.
    const initializationName: string = `${BUNDLE}_SuiteInitialization_0000`;
    logInfo(`${initializationName} begin`);
    try {
      normalizeLegacyFilters(args);
      useModelBaselineStrings();
      const suite = await import('../test/List.test');
      Hypium.hypiumTest(delegator, args, suite.default);
    } catch (_) {
      // Thrown values may be null/undefined; do not dereference or disclose their message/path.
      logWarning(`${initializationName} failure stage=initialize`);
      await delegator.finishTest('Shortcut test initialization failed; see named initialization stage logs.', 1);
    } finally {
      logInfo(`${initializationName} end`);
    }
  }
}
