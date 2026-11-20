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

import { describe, it, expect, beforeAll, afterEach, afterAll } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import { computeTask, computeNBodyByTaskPool } from '../../../../main/ets/model/CalculateUtil';
import Constants from '../../../../main/ets/utils/Constants';
import {
  assertNoActiveWorkers,
  runProductionWorker,
  initializeStorage,
  clearStorage,
  waitForStorageResult,
  assertDurationText,
  getDriver,
  launchNBodyApp,
  waitForPageStable,
  assertPageResources,
  readMessage,
  waitForMessage,
  clickById,
  waitForDialog,
  dismissDialog,
  waitForCalculationResult,
  ID_TASK_POOL,
  ID_WORKER,
  INITIAL_MESSAGE,
  logSuite,
  withTimeout,
  assertButtonsEnabled,
  waitForDialogDismissed,
  assertCoreComponents,
  assertResultMatchesStorage,
} from '../Shared/NBodyHarness';

export default function platformTest(): void {
  describe('NBodyPlatformTest', (): void => {
    beforeAll((): void => {
      logSuite('NBodyPlatformTest', 'start');
    });
    afterEach((): void => {
      assertNoActiveWorkers();
    });
    afterAll((): void => {
      clearStorage();
      logSuite('NBodyPlatformTest', 'complete');
    });

    // @tc.number SUB_NBODY_PLATFORM_0100
    // @tc.name nbodyPlatform001
    // @tc.desc Verify Constants preserve configured TaskPool and Worker workloads
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nbodyPlatform001', 0, (): void => {
      const taskSteps: number = Constants.TIME_STEPS_TASK_POOL;
      const workerSteps: number = Constants.TIME_STEPS_WORKER;
      expect(taskSteps).assertEqual(5000000);
      expect(workerSteps).assertEqual(50000000);
    });

    // @tc.number SUB_NBODY_PLATFORM_0200
    // @tc.name nbodyPlatform002
    // @tc.desc Verify computeTask executes in a real TaskPool and returns milliseconds
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nbodyPlatform002', 0, async (): Promise<void> => {
      const task: taskpool.Task = new taskpool.Task(computeTask, 10);
      const result: number = (await withTimeout(taskpool.execute(task), 10000)) as number;
      const finite: boolean = isFinite(result);
      const nonnegative: boolean = result >= 0;
      const integer: boolean = Math.floor(result) === result;
      expect(finite).assertTrue();
      expect(nonnegative).assertTrue();
      expect(integer).assertTrue();
    });

    // @tc.number SUB_NBODY_PLATFORM_0300
    // @tc.name nbodyPlatform003
    // @tc.desc Verify CalculateWorker handles the production timeSteps message protocol
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nbodyPlatform003', 0, async (): Promise<void> => {
      const duration: number = await runProductionWorker(10);
      const nonnegative: boolean = duration >= 0;
      expect(nonnegative).assertTrue();
    });

    // @tc.number SUB_NBODY_PLATFORM_0400
    // @tc.name nbodyPlatform004
    // @tc.desc Verify computeNBodyByTaskPool publishes formatted timeCost through AppStorage
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nbodyPlatform004', 0, async (): Promise<void> => {
      initializeStorage();
      computeNBodyByTaskPool(10);
      const text: string = await waitForStorageResult();
      assertDurationText(text);
    });

    // @tc.number SUB_NBODY_PLATFORM_0500
    // @tc.name nbodyPlatform005
    // @tc.desc Verify EntryAbility renders the five NBody components and localized resources
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nbodyPlatform005', 0, async (): Promise<void> => {
      clearStorage();
      await launchNBodyApp();
      const driver = getDriver();
      await waitForPageStable(driver);
      await assertPageResources(driver);
      await assertButtonsEnabled(driver);
      await assertCoreComponents(driver);
      const message: string = await readMessage(driver);
      expect(message).assertEqual(INITIAL_MESSAGE);
    });

    // @tc.number SUB_NBODY_PLATFORM_0600
    // @tc.name nbodyPlatform006
    // @tc.desc Verify timeCost storage changes update the visible NBody message
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nbodyPlatform006', 0, async (): Promise<void> => {
      await launchNBodyApp();
      const driver = getDriver();
      await waitForPageStable(driver);
      const expected: string = 'Total time costed = 123 ms.';
      AppStorage.set<string>('timeCost', expected);
      await waitForMessage(driver, expected);
      const actual: string = await readMessage(driver);
      expect(actual).assertEqual(expected);
    });

    // @tc.number SUB_NBODY_PLATFORM_0700
    // @tc.name nbodyPlatform007
    // @tc.desc Verify busy-state button alerts and a real short TaskPool result displayed on the page
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nbodyPlatform007', 0, async (): Promise<void> => {
      await launchNBodyApp();
      const driver = getDriver();
      await waitForPageStable(driver);
      AppStorage.set<string>('timeCost', INITIAL_MESSAGE);
      await waitForMessage(driver, INITIAL_MESSAGE);
      AppStorage.set<string>('timeCost', 'Calculating...');
      await waitForMessage(driver, 'Calculating...');
      await clickById(driver, ID_TASK_POOL);
      await waitForDialog(driver);
      await dismissDialog(driver);
      await waitForDialogDismissed(driver);
      await clickById(driver, ID_WORKER);
      await waitForDialog(driver);
      await dismissDialog(driver);
      await waitForDialogDismissed(driver);
      computeNBodyByTaskPool(10);
      const result: string = await waitForCalculationResult(driver);
      assertDurationText(result);
      await assertResultMatchesStorage(driver);
    });

    // @tc.number SUB_NBODY_PLATFORM_0800
    // @tc.name nbodyPlatform008
    // @tc.desc Verify production Worker result renders through the timeCost storage binding
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('nbodyPlatform008', 0, async (): Promise<void> => {
      await launchNBodyApp();
      const driver = getDriver();
      await waitForPageStable(driver);
      AppStorage.set<string>('timeCost', INITIAL_MESSAGE);
      await waitForMessage(driver, INITIAL_MESSAGE);
      AppStorage.set<string>('timeCost', 'Calculating...');
      await waitForMessage(driver, 'Calculating...');
      const elapsed: number = await runProductionWorker(10);
      const completed: string = 'Total time costed = ' + elapsed.toString() + ' ms.';
      AppStorage.set<string>('timeCost', completed);
      const result: string = await waitForCalculationResult(driver);
      assertDurationText(result);
      const stored: string | undefined = AppStorage.get<string>('timeCost');
      expect(stored).assertEqual(result);
    });
  });
}
