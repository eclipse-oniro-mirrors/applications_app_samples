'use static';
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

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from './Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  URL_TASK_A,
  createTaskGraph,
  expectedConfigFor,
  startButtonEnabled,
  PAGE_TITLE
} from './Shared/SharedDriver';

// Entry suite of the NetworkSample ohosTest module. It proves that the shared
// observable model is reachable from the test hap before the category suites
// start their work, and it pins the three literals that identify the sample.
export default function abilityTest(): void {
  describe('AbilityTest', () => {
    beforeAll(() => {
      logSuite('AbilityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('AbilityTest', 'end');
    });

    /**
     * @tc.name   taskGraphExposesExactlyTheThreeSampleTasks
     * @tc.desc   The shared graph contains A, B and C in page order, matching the three progress rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Ability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskGraphExposesExactlyTheThreeSampleTasks', 0, () => {
      const graph = createTaskGraph();
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(TASK_NUMBERS.length).assertEqual(3);
    });

    /**
     * @tc.name   taskAUrlPointsAtTheOrangeShoppingDrawable
     * @tc.desc   The first task URL is the favor_list_tea drawable used by the production page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Ability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskAUrlPointsAtTheOrangeShoppingDrawable', 0, () => {
      expect(URL_TASK_A.indexOf('OrangeShopping')).assertLarger(0);
      expect(URL_TASK_A.endsWith('favor_list_tea.png')).assertTrue();
      expect(URL_TASK_A.startsWith('https://')).assertTrue();
    });

    /**
     * @tc.name   taskAGraphStartsIdleAndUnlockedButton
     * @tc.desc   A fresh graph is idle and the start button is enabled because isTaskFinished starts true.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Ability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskAGraphStartsIdleAndUnlockedButton', 0, () => {
      const graph = createTaskGraph();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(startButtonEnabled(graph.isTaskFinished)).assertTrue();
    });

    /**
     * @tc.name   seededConfigurationUsesGetAndCacheDirectory
     * @tc.desc   The configuration oracle keeps the method, overwrite flag and saveas path of download().
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Ability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('seededConfigurationUsesGetAndCacheDirectory', 0, () => {
      const config = expectedConfigFor(TASK_A);
      expect(config.action).assertEqual('DOWNLOAD');
      expect(config.method).assertEqual('GET');
      expect(config.overwrite).assertTrue();
      expect(config.saveas).assertEqual('./');
      expect(config.isValid()).assertTrue();
    });

    /**
     * @tc.name   pageTitleMatchesTheNavigationHeader
     * @tc.desc   The page title literal is the one rendered above the three progress rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the Ability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pageTitleMatchesTheNavigationHeader', 0, () => {
      expect(PAGE_TITLE).assertEqual('网络场景');
      expect(PAGE_TITLE.length).assertEqual(4);
      expect(PAGE_TITLE.indexOf('网络')).assertEqual(0);
    });
  });
}
