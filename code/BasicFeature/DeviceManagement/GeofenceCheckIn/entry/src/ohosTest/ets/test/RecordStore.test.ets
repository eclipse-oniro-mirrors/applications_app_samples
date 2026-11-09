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

import { common, UIAbility } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  CheckInRecord,
  CheckInResult,
  CheckInService,
  DaySummary,
  FenceConfig,
  FenceTransitionAction,
  OPEN_END,
  RecordStore,
  getDayStart
} from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_Store]';

// UI ability context captured once during the suite setup.
let testContext: common.Context | undefined = undefined;
// Configuration snapshot taken before the suite touches the store.
let originalConfig: FenceConfig | undefined = undefined;

/**
 * Return the application context captured during the suite setup.
 * @returns the captured application context
 */
function requireContext(): common.Context {
  if (testContext === undefined) {
    throw new Error('application context is not ready');
  }
  return testContext;
}

export default function recordStoreLogicTest() {
  describe('RecordStoreLogicTest', () => {
    beforeAll(async () => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'setup, begin');
      // ApplicationContext is rejected by relationalStore on some boards, so
      // capture the top UIAbility context whose area getRdbStore accepts.
      const topAbility: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
      const context: common.Context = topAbility.context;
      testContext = context;
      // Snapshot the persisted configuration so the suite can restore it later.
      const stored: FenceConfig = await RecordStore.getConfig(context);
      originalConfig = stored;
      // Start from an empty record table for the whole suite.
      await RecordStore.clearRecords(context);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'setup, config snapshotted, records cleared');
    });

    afterAll(async () => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'teardown, begin');
      if (testContext !== undefined) {
        // Drop every record produced by the suite.
        await RecordStore.clearRecords(testContext);
        // Restore the original configuration untouched, including its updatedAt.
        if (originalConfig !== undefined) {
          await RecordStore.saveConfig(testContext, originalConfig);
        }
        hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'teardown, records cleared, config restored');
      }
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STORE_0100
     * @tc.name      testStoreConfigRoundTrip0001
     * @tc.desc      Verify a saved fence configuration is read back field by field
     *               through the record store.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStoreConfigRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testStoreConfigRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const draft: FenceConfig = {
        name: 'test_store_config',
        latitude: 30.5,
        longitude: 120.5,
        radius: 300,
        fenceId: 42,
        enabled: false,
        updatedAt: 12345
      };
      await RecordStore.saveConfig(context, draft);
      const loaded: FenceConfig = await RecordStore.getConfig(context);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' loaded name=' + loaded.name);
      expect(loaded.name === 'test_store_config').assertTrue();
      expect(loaded.latitude === 30.5).assertTrue();
      expect(loaded.longitude === 120.5).assertTrue();
      expect(loaded.radius === 300).assertTrue();
      expect(loaded.fenceId === 42).assertTrue();
      expect(loaded.enabled === false).assertTrue();
      expect(loaded.updatedAt === 12345).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STORE_0200
     * @tc.name      testStoreEnterExit0001
     * @tc.desc      Verify one enter creates an open check-in record, a repeated enter
     *               is ignored and the exit closes the record with the stay duration.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStoreEnterExit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testStoreEnterExit0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const enterTime: number = Date.now();

      const entered: CheckInRecord | undefined = await RecordStore.handleEnter(context, enterTime);
      expect(entered === undefined).assertFalse();
      let enteredId: number = -1;
      if (entered !== undefined) {
        enteredId = entered.id;
        expect(entered.enterTime === enterTime).assertTrue();
        expect(entered.exitTime === OPEN_END).assertTrue();
        expect(entered.durationMs === 0).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' opened record id=' + enteredId);
      } else {
        expect(true).assertFalse();
      }

      const repeated: CheckInRecord | undefined = await RecordStore.handleEnter(context, enterTime + 1);
      expect(repeated === undefined).assertTrue();

      const exited: CheckInRecord | undefined = await RecordStore.handleExit(context, enterTime + 60000);
      expect(exited === undefined).assertFalse();
      if (exited !== undefined) {
        expect(exited.exitTime === enterTime + 60000).assertTrue();
        expect(exited.durationMs === 60000).assertTrue();
        expect(exited.id === enteredId).assertTrue();
      } else {
        expect(true).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STORE_0300
     * @tc.name      testStoreExitWithoutEnter0001
     * @tc.desc      Verify an exit without an open check-in record is ignored and a
     *               second exit after the record was closed is ignored as well.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStoreExitWithoutEnter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testStoreExitWithoutEnter0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);

      const openBefore: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      expect(openBefore === undefined).assertTrue();

      const exitedWithoutEnter: CheckInRecord | undefined = await RecordStore.handleExit(context, Date.now());
      expect(exitedWithoutEnter === undefined).assertTrue();

      const entered: CheckInRecord | undefined = await RecordStore.handleEnter(context, Date.now());
      expect(entered === undefined).assertFalse();
      let enteredId: number = -1;
      if (entered !== undefined) {
        enteredId = entered.id;
        expect(entered.exitTime === OPEN_END).assertTrue();
      } else {
        expect(true).assertFalse();
      }

      const exited: CheckInRecord | undefined = await RecordStore.handleExit(context, Date.now());
      expect(exited === undefined).assertFalse();
      if (exited !== undefined) {
        expect(exited.id === enteredId).assertTrue();
      } else {
        expect(true).assertFalse();
      }

      const exitedAgain: CheckInRecord | undefined = await RecordStore.handleExit(context, Date.now());
      expect(exitedAgain === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STORE_0400
     * @tc.name      testStoreRecordsOrder0001
     * @tc.desc      Verify stored records are returned from newest to oldest, every
     *               closed record lost the open marker and the limit trims the list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStoreRecordsOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testStoreRecordsOrder0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const firstEnterTime: number = Date.now();
      const secondEnterTime: number = firstEnterTime + 1000;
      const thirdEnterTime: number = firstEnterTime + 2000;

      const firstEntered: CheckInRecord | undefined = await RecordStore.handleEnter(context, firstEnterTime);
      expect(firstEntered === undefined).assertFalse();
      await RecordStore.handleExit(context, firstEnterTime + 500);
      const secondEntered: CheckInRecord | undefined = await RecordStore.handleEnter(context, secondEnterTime);
      expect(secondEntered === undefined).assertFalse();
      await RecordStore.handleExit(context, secondEnterTime + 500);
      const thirdEntered: CheckInRecord | undefined = await RecordStore.handleEnter(context, thirdEnterTime);
      expect(thirdEntered === undefined).assertFalse();
      await RecordStore.handleExit(context, thirdEnterTime + 500);

      const records: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(records.length === 3).assertTrue();
      expect(records[0].enterTime === thirdEnterTime).assertTrue();
      expect(records[1].enterTime === secondEnterTime).assertTrue();
      expect(records[2].enterTime === firstEnterTime).assertTrue();
      for (let i: number = 0; i < records.length; i++) {
        expect(records[i].exitTime !== OPEN_END).assertTrue();
      }

      const limited: Array<CheckInRecord> = await RecordStore.getRecords(context, 2);
      expect(limited.length === 2).assertTrue();
      expect(limited[0].enterTime === thirdEnterTime).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STORE_0500
     * @tc.name      testStoreDaySummary0001
     * @tc.desc      Verify the day summary counts two same day check-ins with their
     *               total duration and reports zeros after the records are cleared.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStoreDaySummary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testStoreDaySummary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const firstEnterTime: number = Date.now();

      const firstEntered: CheckInRecord | undefined = await RecordStore.handleEnter(context, firstEnterTime);
      expect(firstEntered === undefined).assertFalse();
      await RecordStore.handleExit(context, firstEnterTime + 1000);
      const secondEntered: CheckInRecord | undefined =
        await RecordStore.handleEnter(context, firstEnterTime + 5000);
      expect(secondEntered === undefined).assertFalse();
      await RecordStore.handleExit(context, firstEnterTime + 7000);

      const dayStart: number = getDayStart(Date.now());
      const summary: DaySummary = await RecordStore.getDaySummary(context, dayStart);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' count=' + summary.count +
        ', durationMs=' + summary.durationMs);
      expect(summary.count === 2).assertTrue();
      expect(summary.durationMs === 3000).assertTrue();

      await RecordStore.clearRecords(context);
      const summaryAfter: DaySummary = await RecordStore.getDaySummary(context, dayStart);
      expect(summaryAfter.count === 0).assertTrue();
      expect(summaryAfter.durationMs === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STORE_0600
     * @tc.name      testStoreSimulateTransition0001
     * @tc.desc      Verify the simulated enter creates a record, the repeated enter
     *               changes nothing, the exit closes the stay and a repeated exit
     *               changes nothing as well.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStoreSimulateTransition0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testStoreSimulateTransition0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);

      const first: CheckInResult = await CheckInService.simulate(context, FenceTransitionAction.ENTER, 1);
      expect(first.changed === true).assertTrue();
      expect(first.record === undefined).assertFalse();
      if (first.record !== undefined) {
        expect(first.record.exitTime === OPEN_END).assertTrue();
        expect(first.record.durationMs === 0).assertTrue();
      } else {
        expect(true).assertFalse();
      }

      const repeatedEnter: CheckInResult =
        await CheckInService.simulate(context, FenceTransitionAction.ENTER, 1);
      expect(repeatedEnter.changed === false).assertTrue();

      const exitResult: CheckInResult = await CheckInService.simulate(context, FenceTransitionAction.EXIT, 1);
      expect(exitResult.changed === true).assertTrue();
      expect(exitResult.record === undefined).assertFalse();
      if (exitResult.record !== undefined) {
        expect(exitResult.record.durationMs >= 0).assertTrue();
      } else {
        expect(true).assertFalse();
      }

      const repeatedExit: CheckInResult =
        await CheckInService.simulate(context, FenceTransitionAction.EXIT, 1);
      expect(repeatedExit.changed === false).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
