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
  createDefaultConfig,
  DaySummary,
  DEFAULT_RADIUS,
  FenceConfig,
  FenceTransitionAction,
  getDayStart,
  INVALID_FENCE_ID,
  MAX_RADIUS,
  MIN_RADIUS,
  OPEN_END,
  RecordStore
} from 'library';
import { FixtureFactory } from './support/FixtureFactory';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_StoreMatrix]';

// Maximum number of records kept for the history list, mirrored locally.
const MAX_RECORDS_LOCAL: number = 20;
// One minute expressed in milliseconds, reused by the state machine cases.
const MINUTE_MS: number = 60 * 1000;
// One hour expressed in milliseconds, reused by the day boundary cases.
const HOUR_MS: number = 60 * MINUTE_MS;
// One day expressed in milliseconds, reused by the day window cases.
const DAY_MS: number = 24 * HOUR_MS;

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

/**
 * Return the length of a record list, or the fallback when the list is missing.
 * @param records record list to measure
 * @returns the number of records in the list
 */
function recordCount(records: Array<CheckInRecord>): number {
  return records.length;
}

export default function recordStoreMatrixTest() {
  describe('RecordStoreMatrixTest', () => {
    beforeAll(async () => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'RecordStoreMatrixTest suite start');
      const topAbility: UIAbility =
        await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
      const context: common.Context = topAbility.context;
      testContext = context;
      // Snapshot the persisted configuration so the suite can restore it later.
      const stored: FenceConfig = await RecordStore.getConfig(context);
      originalConfig = FixtureFactory.cloneConfig(stored);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'setup, config snapshotted');
      // Start from an empty record table for the whole suite.
      await RecordStore.clearRecords(context);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'setup, records cleared');
    });

    afterAll(async () => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'RecordStoreMatrixTest suite end, begin');
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
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_0100
     * @tc.name      testConfigFieldMatrix0001
     * @tc.desc      Verify every configuration field survives a save and load round trip
     *               across the nominal, boundary and extreme value matrix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConfigFieldMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testConfigFieldMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);

      const drafts: Array<FenceConfig> = [
        FixtureFactory.nominalConfig('field'),
        FixtureFactory.configByPreset(2),
        FixtureFactory.configByPreset(3),
        FixtureFactory.config('', 0, 0, 25, 0, false, 0),
        FixtureFactory.config('edge_far', 89.9999, 179.9999, 1, 2147483647, true, 1)
      ];
      for (let index: number = 0; index < drafts.length; index++) {
        const draft: FenceConfig = drafts[index];
        await RecordStore.saveConfig(context, draft);
        const loaded: FenceConfig = await RecordStore.getConfig(context);
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' step=' + index + ', name=' + loaded.name);
        expect(loaded.name === draft.name).assertTrue();
        expect(loaded.latitude === draft.latitude).assertTrue();
        expect(loaded.longitude === draft.longitude).assertTrue();
        expect(loaded.radius === draft.radius).assertTrue();
        expect(loaded.fenceId === draft.fenceId).assertTrue();
        expect(loaded.enabled === draft.enabled).assertTrue();
        expect(loaded.updatedAt === draft.updatedAt).assertTrue();
        expect(FixtureFactory.configEquals(loaded, draft)).assertTrue();
        expect(FixtureFactory.configDiffFields(loaded, draft).length === 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_0200
     * @tc.name      testConfigOverwriteMatrix0001
     * @tc.desc      Verify saving a second configuration overwrites the single stored row
     *               instead of appending a new one, keeping only the newest values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConfigOverwriteMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testConfigOverwriteMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();

      const first: FenceConfig = FixtureFactory.config('overwrite_first', 11.1, 22.2, 100, 1, false, 1000);
      await RecordStore.saveConfig(context, first);
      const afterFirst: FenceConfig = await RecordStore.getConfig(context);
      expect(afterFirst.name === 'overwrite_first').assertTrue();
      expect(afterFirst.enabled === false).assertTrue();

      const second: FenceConfig = FixtureFactory.config('overwrite_second', 33.3, 44.4, 900, 2, true, 2000);
      await RecordStore.saveConfig(context, second);
      const afterSecond: FenceConfig = await RecordStore.getConfig(context);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' second name=' + afterSecond.name);

      expect(afterSecond.name === 'overwrite_second').assertTrue();
      expect(afterSecond.latitude === 33.3).assertTrue();
      expect(afterSecond.longitude === 44.4).assertTrue();
      expect(afterSecond.radius === 900).assertTrue();
      expect(afterSecond.fenceId === 2).assertTrue();
      expect(afterSecond.enabled === true).assertTrue();
      expect(afterSecond.updatedAt === 2000).assertTrue();
      expect(FixtureFactory.configEquals(afterSecond, second)).assertTrue();
      expect(FixtureFactory.configEquals(afterSecond, first)).assertFalse();
      expect(FixtureFactory.configDiffFields(afterSecond, first).length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_0300
     * @tc.name      testConfigEnabledFlagMatrix0001
     * @tc.desc      Verify the enabled flag toggles between true and false over repeated
     *               saves and the remaining fields stay untouched by the toggle.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConfigEnabledFlagMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testConfigEnabledFlagMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();

      let expected: boolean = true;
      for (let step: number = 0; step < 4; step++) {
        const draft: FenceConfig = FixtureFactory.config('toggle_' + step, 10, 20,
          DEFAULT_RADIUS, step, expected, 5000 + step);
        await RecordStore.saveConfig(context, draft);
        const loaded: FenceConfig = await RecordStore.getConfig(context);
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' step=' + step + ', enabled=' + loaded.enabled);
        expect(loaded.enabled === expected).assertTrue();
        expect(loaded.name === 'toggle_' + step).assertTrue();
        expect(loaded.fenceId === step).assertTrue();
        expect(loaded.updatedAt === 5000 + step).assertTrue();
        expect(loaded.radius === DEFAULT_RADIUS).assertTrue();
        expected = !expected;
      }
      const finalConfig: FenceConfig = await RecordStore.getConfig(context);
      expect(finalConfig.enabled).assertFalse();
      expect(finalConfig.name === 'toggle_3').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_0400
     * @tc.name      testEnterCreatesOpenRecord0001
     * @tc.desc      Verify one enter creates an open record with the enter timestamp, the open
     *               marker, a zero duration and a positive database id.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEnterCreatesOpenRecord0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testEnterCreatesOpenRecord0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const enterTime: number = Date.now();

      const openBefore: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      expect(openBefore === undefined).assertTrue();

      const created: CheckInRecord | undefined = await RecordStore.handleEnter(context, enterTime);
      expect(created !== undefined).assertTrue();
      if (created !== undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' created id=' + created.id);
        expect(created.enterTime === enterTime).assertTrue();
        expect(created.exitTime === OPEN_END).assertTrue();
        expect(created.durationMs === 0).assertTrue();
        expect(created.id > 0).assertTrue();
        expect(FixtureFactory.isOpen(created)).assertTrue();
      } else {
        expect(true).assertFalse();
      }

      const reopened: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      expect(reopened !== undefined).assertTrue();
      if (reopened !== undefined) {
        expect(reopened.enterTime === enterTime).assertTrue();
        expect(reopened.exitTime === OPEN_END).assertTrue();
        expect(reopened.durationMs === 0).assertTrue();
      } else {
        expect(true).assertFalse();
      }

      const records: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(records) === 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_0500
     * @tc.name      testRepeatedEnterIgnored0001
     * @tc.desc      Verify a second and a third enter while one check-in is still open are
     *               ignored and leave the open record untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRepeatedEnterIgnored0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testRepeatedEnterIgnored0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const enterTime: number = Date.now();

      const first: CheckInRecord | undefined = await RecordStore.handleEnter(context, enterTime);
      expect(first !== undefined).assertTrue();
      let firstId: number = -1;
      if (first !== undefined) {
        firstId = first.id;
      } else {
        expect(true).assertFalse();
      }

      const second: CheckInRecord | undefined =
        await RecordStore.handleEnter(context, enterTime + MINUTE_MS);
      expect(second === undefined).assertTrue();
      const third: CheckInRecord | undefined =
        await RecordStore.handleEnter(context, enterTime + 2 * MINUTE_MS);
      expect(third === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' ignored two repeated enters');

      const stillOpen: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      expect(stillOpen !== undefined).assertTrue();
      if (stillOpen !== undefined) {
        expect(stillOpen.id === firstId).assertTrue();
        expect(stillOpen.enterTime === enterTime).assertTrue();
        expect(stillOpen.exitTime === OPEN_END).assertTrue();
      } else {
        expect(true).assertFalse();
      }

      const records: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(records) === 1).assertTrue();
      expect(records[0].enterTime === enterTime).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_0600
     * @tc.name      testExitClosesOpenRecord0001
     * @tc.desc      Verify an exit closes the open record, derives the stay duration from the
     *               timestamps and clears the open marker.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExitClosesOpenRecord0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExitClosesOpenRecord0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const enterTime: number = Date.now();
      const stayMs: number = 7 * MINUTE_MS;
      const exitTime: number = enterTime + stayMs;

      const entered: CheckInRecord | undefined = await RecordStore.handleEnter(context, enterTime);
      expect(entered !== undefined).assertTrue();
      let enteredId: number = -1;
      if (entered !== undefined) {
        enteredId = entered.id;
      } else {
        expect(true).assertFalse();
      }

      const closed: CheckInRecord | undefined = await RecordStore.handleExit(context, exitTime);
      expect(closed !== undefined).assertTrue();
      if (closed !== undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' duration=' + closed.durationMs);
        expect(closed.id === enteredId).assertTrue();
        expect(closed.enterTime === enterTime).assertTrue();
        expect(closed.exitTime === exitTime).assertTrue();
        expect(closed.durationMs === stayMs).assertTrue();
        expect(FixtureFactory.isOpen(closed)).assertFalse();
      } else {
        expect(true).assertFalse();
      }

      const openAfter: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      expect(openAfter === undefined).assertTrue();
      const records: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(records) === 1).assertTrue();
      expect(records[0].exitTime === exitTime).assertTrue();
      expect(records[0].durationMs === stayMs).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_0700
     * @tc.name      testExitWithoutEnterIgnored0001
     * @tc.desc      Verify an exit without any open record is ignored, changes nothing and a
     *               second exit after the record was closed is ignored as well.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExitWithoutEnterIgnored0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExitWithoutEnterIgnored0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);

      const emptyExit: CheckInRecord | undefined = await RecordStore.handleExit(context, Date.now());
      expect(emptyExit === undefined).assertTrue();
      const recordsAfterEmpty: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(recordsAfterEmpty) === 0).assertTrue();

      const enterTime: number = Date.now();
      const entered: CheckInRecord | undefined = await RecordStore.handleEnter(context, enterTime);
      expect(entered !== undefined).assertTrue();
      const firstExit: CheckInRecord | undefined =
        await RecordStore.handleExit(context, enterTime + MINUTE_MS);
      expect(firstExit !== undefined).assertTrue();

      const secondExit: CheckInRecord | undefined =
        await RecordStore.handleExit(context, enterTime + 2 * MINUTE_MS);
      expect(secondExit === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' second exit ignored');

      const records: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(records) === 1).assertTrue();
      expect(records[0].durationMs === MINUTE_MS).assertTrue();
      expect(records[0].exitTime === enterTime + MINUTE_MS).assertTrue();
      const openAfter: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      expect(openAfter === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_0800
     * @tc.name      testTransitionStateMachineCycles0001
     * @tc.desc      Verify repeated enter and exit cycles keep exactly one open record at a
     *               time and produce one closed record per completed cycle.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTransitionStateMachineCycles0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testTransitionStateMachineCycles0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const base: number = Date.now();
      const cycles: number = 3;

      for (let cycle: number = 0; cycle < cycles; cycle++) {
        const enterTime: number = base + cycle * HOUR_MS;
        const entered: CheckInRecord | undefined = await RecordStore.handleEnter(context, enterTime);
        expect(entered !== undefined).assertTrue();
        const openDuring: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
        expect(openDuring !== undefined).assertTrue();
        if (openDuring !== undefined) {
          expect(openDuring.enterTime === enterTime).assertTrue();
          expect(openDuring.exitTime === OPEN_END).assertTrue();
        } else {
          expect(true).assertFalse();
        }
        const exited: CheckInRecord | undefined =
          await RecordStore.handleExit(context, enterTime + MINUTE_MS);
        expect(exited !== undefined).assertTrue();
        if (exited !== undefined) {
          expect(exited.durationMs === MINUTE_MS).assertTrue();
        } else {
          expect(true).assertFalse();
        }
        const openAfterCycle: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
        expect(openAfterCycle === undefined).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' cycle=' + cycle + ' closed');
      }

      const records: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(records) === cycles).assertTrue();
      for (let index: number = 0; index < records.length; index++) {
        expect(records[index].durationMs === MINUTE_MS).assertTrue();
        expect(FixtureFactory.isOpen(records[index])).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_0900
     * @tc.name      testOpenRecordSelectsNewest0001
     * @tc.desc      Verify the open record query returns undefined for an empty table and the
     *               only open record once the surrounding records are closed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOpenRecordSelectsNewest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testOpenRecordSelectsNewest0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);

      const emptyOpen: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      expect(emptyOpen === undefined).assertTrue();

      const base: number = Date.now();
      const oldEnter: CheckInRecord | undefined = await RecordStore.handleEnter(context, base);
      expect(oldEnter !== undefined).assertTrue();
      await RecordStore.handleExit(context, base + MINUTE_MS);

      const openEnterTime: number = base + HOUR_MS;
      const openEnter: CheckInRecord | undefined = await RecordStore.handleEnter(context, openEnterTime);
      expect(openEnter !== undefined).assertTrue();
      let openId: number = -1;
      if (openEnter !== undefined) {
        openId = openEnter.id;
      } else {
        expect(true).assertFalse();
      }

      const selected: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      expect(selected !== undefined).assertTrue();
      if (selected !== undefined) {
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' selected id=' + selected.id);
        expect(selected.id === openId).assertTrue();
        expect(selected.enterTime === openEnterTime).assertTrue();
        expect(selected.exitTime === OPEN_END).assertTrue();
        expect(selected.durationMs === 0).assertTrue();
      } else {
        expect(true).assertFalse();
      }

      await RecordStore.handleExit(context, openEnterTime + MINUTE_MS);
      const afterClose: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      expect(afterClose === undefined).assertTrue();
      const records: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(records) === 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_1000
     * @tc.name      testRecordsOrderNewestFirst0001
     * @tc.desc      Verify the record list is ordered from the newest enter time to the oldest
     *               one across four completed check-in cycles.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRecordsOrderNewestFirst0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testRecordsOrderNewestFirst0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const base: number = Date.now();
      const count: number = 4;

      for (let index: number = 0; index < count; index++) {
        const enterTime: number = base + index * HOUR_MS;
        await RecordStore.handleEnter(context, enterTime);
        await RecordStore.handleExit(context, enterTime + MINUTE_MS);
      }

      const records: Array<CheckInRecord> = await RecordStore.getRecords(context);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' loaded ' + records.length + ' records');
      expect(recordCount(records) === count).assertTrue();
      for (let index: number = 0; index < records.length; index++) {
        const expectedEnter: number = base + (count - 1 - index) * HOUR_MS;
        expect(records[index].enterTime === expectedEnter).assertTrue();
        expect(records[index].durationMs === MINUTE_MS).assertTrue();
      }
      expect(records[0].enterTime > records[records.length - 1].enterTime).assertTrue();
      for (let index: number = 1; index < records.length; index++) {
        expect(records[index - 1].enterTime > records[index].enterTime).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_1100
     * @tc.name      testRecordsLimitMatrix0001
     * @tc.desc      Verify the record list limit trims the newest records for every limit value
     *               from one up to the record count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRecordsLimitMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testRecordsLimitMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const base: number = Date.now();
      const count: number = 5;

      for (let index: number = 0; index < count; index++) {
        const enterTime: number = base + index * HOUR_MS;
        await RecordStore.handleEnter(context, enterTime);
        await RecordStore.handleExit(context, enterTime + MINUTE_MS);
      }

      const full: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(full) === count).assertTrue();
      const newestEnter: number = full[0].enterTime;

      for (let limit: number = 1; limit <= count; limit++) {
        const limited: Array<CheckInRecord> = await RecordStore.getRecords(context, limit);
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' limit=' + limit + ', size=' + limited.length);
        expect(recordCount(limited) === limit).assertTrue();
        expect(limited[0].enterTime === newestEnter).assertTrue();
        expect(limited[0].enterTime === full[0].enterTime).assertTrue();
        expect(limited[limited.length - 1].enterTime === full[limit - 1].enterTime).assertTrue();
      }
      const larger: Array<CheckInRecord> = await RecordStore.getRecords(context, count + 10);
      expect(recordCount(larger) === count).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_1200
     * @tc.name      testRecordsDefaultLimitBound0001
     * @tc.desc      Verify the default record limit keeps at most the documented maximum while
     *               still listing the newest record first when more rows exist.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRecordsDefaultLimitBound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testRecordsDefaultLimitBound0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const base: number = Date.now();
      const count: number = MAX_RECORDS_LOCAL + 3;

      for (let index: number = 0; index < count; index++) {
        const enterTime: number = base + index * MINUTE_MS;
        await RecordStore.handleEnter(context, enterTime);
        await RecordStore.handleExit(context, enterTime + 1000);
      }

      const records: Array<CheckInRecord> = await RecordStore.getRecords(context);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' default size=' + records.length);
      expect(recordCount(records) === MAX_RECORDS_LOCAL).assertTrue();
      expect(recordCount(records) < count).assertTrue();
      expect(records[0].enterTime === base + (count - 1) * MINUTE_MS).assertTrue();
      expect(records[0].durationMs === 1000).assertTrue();
      for (let index: number = 1; index < records.length; index++) {
        expect(records[index - 1].enterTime > records[index].enterTime).assertTrue();
      }
      const explicit: Array<CheckInRecord> =
        await RecordStore.getRecords(context, MAX_RECORDS_LOCAL);
      expect(recordCount(explicit) === MAX_RECORDS_LOCAL).assertTrue();
      expect(explicit[0].enterTime === records[0].enterTime).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_1300
     * @tc.name      testDaySummaryCountMatrix0001
     * @tc.desc      Verify the day summary counts the check-ins of the current day together
     *               with their summed durations.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDaySummaryCountMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDaySummaryCountMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const dayStart: number = getDayStart(Date.now());

      const emptySummary: DaySummary = await RecordStore.getDaySummary(context, dayStart);
      expect(emptySummary.count === 0).assertTrue();
      expect(emptySummary.durationMs === 0).assertTrue();

      const scenarios: Array<number> = [MINUTE_MS, 2 * MINUTE_MS, 3 * MINUTE_MS];
      let expectedTotal: number = 0;
      for (let index: number = 0; index < scenarios.length; index++) {
        const stayMs: number = scenarios[index];
        const enterTime: number = dayStart + (index + 1) * HOUR_MS;
        await RecordStore.handleEnter(context, enterTime);
        await RecordStore.handleExit(context, enterTime + stayMs);
        expectedTotal = expectedTotal + stayMs;
        const summary: DaySummary = await RecordStore.getDaySummary(context, dayStart);
        hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' step=' + index + ', count=' + summary.count);
        expect(summary.count === index + 1).assertTrue();
        expect(summary.durationMs === expectedTotal).assertTrue();
      }
      const finalSummary: DaySummary = await RecordStore.getDaySummary(context, dayStart);
      expect(finalSummary.count === scenarios.length).assertTrue();
      expect(finalSummary.durationMs === 6 * MINUTE_MS).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_1400
     * @tc.name      testDaySummaryWindowMatrix0001
     * @tc.desc       Verify the day summary window includes the records entering on or after the
     *               day start and excludes the records entering before it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDaySummaryWindowMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDaySummaryWindowMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const dayStart: number = getDayStart(Date.now());

      const beforeEnter: number = dayStart - HOUR_MS;
      await RecordStore.handleEnter(context, beforeEnter);
      await RecordStore.handleExit(context, beforeEnter + MINUTE_MS);

      const atStartEnter: number = dayStart;
      await RecordStore.handleEnter(context, atStartEnter);
      await RecordStore.handleExit(context, atStartEnter + 2 * MINUTE_MS);

      const insideEnter: number = dayStart + 5 * HOUR_MS;
      await RecordStore.handleEnter(context, insideEnter);
      await RecordStore.handleExit(context, insideEnter + 3 * MINUTE_MS);

      const windowSummary: DaySummary = await RecordStore.getDaySummary(context, dayStart);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' count=' + windowSummary.count);
      expect(windowSummary.count === 2).assertTrue();
      expect(windowSummary.durationMs === 5 * MINUTE_MS).assertTrue();

      const wideSummary: DaySummary = await RecordStore.getDaySummary(context, dayStart - DAY_MS);
      expect(wideSummary.count === 3).assertTrue();
      expect(wideSummary.durationMs === 6 * MINUTE_MS).assertTrue();

      const futureSummary: DaySummary = await RecordStore.getDaySummary(context, dayStart + DAY_MS);
      expect(futureSummary.count === 0).assertTrue();
      expect(futureSummary.durationMs === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_1500
     * @tc.name      testClearRecordsResetsStore0001
     * @tc.desc       Verify clearing the records empties the list, the open record query and the
     *               day summary while keeping the stored configuration untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClearRecordsResetsStore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testClearRecordsResetsStore0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const dayStart: number = getDayStart(Date.now());

      const keptConfig: FenceConfig =
        FixtureFactory.config('clear_kept', 12.5, 34.5, 600, 5, true, 9000);
      await RecordStore.saveConfig(context, keptConfig);

      const enterTime: number = dayStart + HOUR_MS;
      await RecordStore.handleEnter(context, enterTime);
      await RecordStore.handleExit(context, enterTime + MINUTE_MS);
      const beforeSummary: DaySummary = await RecordStore.getDaySummary(context, dayStart);
      expect(beforeSummary.count === 1).assertTrue();

      await RecordStore.clearRecords(context);
      const recordsAfter: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(recordsAfter) === 0).assertTrue();
      const openAfter: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      expect(openAfter === undefined).assertTrue();
      const summaryAfter: DaySummary = await RecordStore.getDaySummary(context, dayStart);
      expect(summaryAfter.count === 0).assertTrue();
      expect(summaryAfter.durationMs === 0).assertTrue();

      const configAfter: FenceConfig = await RecordStore.getConfig(context);
      expect(configAfter.name === 'clear_kept').assertTrue();
      expect(configAfter.radius === 600).assertTrue();
      expect(FixtureFactory.configEquals(configAfter, keptConfig)).assertTrue();

      const newEnter: CheckInRecord | undefined = await RecordStore.handleEnter(context, enterTime + HOUR_MS);
      expect(newEnter !== undefined).assertTrue();
      const recordsRebuilt: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(recordsRebuilt) === 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_1600
     * @tc.name      testSimulateTransitionStateMatrix0001
     * @tc.desc       Verify the simulated enter and exit transitions mirror the record store state
     *               machine including the ignored repetitions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSimulateTransitionStateMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSimulateTransitionStateMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);

      const enterResult: CheckInResult =
        await CheckInService.simulate(context, FenceTransitionAction.ENTER, 3);
      expect(enterResult.changed === true).assertTrue();
      expect(enterResult.action === FenceTransitionAction.ENTER).assertTrue();
      expect(enterResult.record !== undefined).assertTrue();
      if (enterResult.record !== undefined) {
        expect(enterResult.record.exitTime === OPEN_END).assertTrue();
        expect(enterResult.record.durationMs === 0).assertTrue();
      } else {
        expect(true).assertFalse();
      }

      const repeatedEnter: CheckInResult =
        await CheckInService.simulate(context, FenceTransitionAction.ENTER, 3);
      expect(repeatedEnter.changed === false).assertTrue();
      expect(repeatedEnter.record === undefined).assertTrue();

      const exitResult: CheckInResult =
        await CheckInService.simulate(context, FenceTransitionAction.EXIT, 3);
      expect(exitResult.changed === true).assertTrue();
      expect(exitResult.action === FenceTransitionAction.EXIT).assertTrue();
      if (exitResult.record !== undefined) {
        expect(exitResult.record.durationMs >= 0).assertTrue();
        expect(FixtureFactory.isOpen(exitResult.record)).assertFalse();
      } else {
        expect(true).assertFalse();
      }

      const repeatedExit: CheckInResult =
        await CheckInService.simulate(context, FenceTransitionAction.EXIT, 3);
      expect(repeatedExit.changed === false).assertTrue();
      expect(repeatedExit.record === undefined).assertTrue();

      const records: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(records) === 1).assertTrue();
      expect(records[0].exitTime !== OPEN_END).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_1700
     * @tc.name      testCombinedStoreOperationSequence0001
     * @tc.desc       Verify a combined sequence of configuration writes, check-in cycles, limited
     *               reads and the clearing step leaves the store in the expected state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCombinedStoreOperationSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCombinedStoreOperationSequence0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const dayStart: number = getDayStart(Date.now());

      const configA: FenceConfig = FixtureFactory.nominalConfig('combined');
      await RecordStore.saveConfig(context, configA);
      const configB: FenceConfig =
        FixtureFactory.config('combined_b', 30, 120, MAX_RADIUS, 9, false, 8800);
      await RecordStore.saveConfig(context, configB);
      const loaded: FenceConfig = await RecordStore.getConfig(context);
      expect(loaded.name === 'combined_b').assertTrue();
      expect(loaded.radius === MAX_RADIUS).assertTrue();

      for (let index: number = 0; index < 3; index++) {
        const enterTime: number = dayStart + (index + 1) * HOUR_MS;
        const entered: CheckInRecord | undefined = await RecordStore.handleEnter(context, enterTime);
        expect(entered !== undefined).assertTrue();
        const exited: CheckInRecord | undefined =
          await RecordStore.handleExit(context, enterTime + (index + 1) * MINUTE_MS);
        expect(exited !== undefined).assertTrue();
      }

      const all: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(all) === 3).assertTrue();
      const limited: Array<CheckInRecord> = await RecordStore.getRecords(context, 2);
      expect(recordCount(limited) === 2).assertTrue();
      expect(limited[0].enterTime === all[0].enterTime).assertTrue();

      const summary: DaySummary = await RecordStore.getDaySummary(context, dayStart);
      expect(summary.count === 3).assertTrue();
      expect(summary.durationMs === 6 * MINUTE_MS).assertTrue();
      const openBefore: CheckInRecord | undefined = await RecordStore.getOpenRecord(context);
      expect(openBefore === undefined).assertTrue();

      await RecordStore.clearRecords(context);
      const cleared: Array<CheckInRecord> = await RecordStore.getRecords(context);
      expect(recordCount(cleared) === 0).assertTrue();
      const configFinal: FenceConfig = await RecordStore.getConfig(context);
      expect(configFinal.name === 'combined_b').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_STOREMAT_1800
     * @tc.name      testFixtureDrivenRecordRoundTrip0001
     * @tc.desc       Verify records produced by the store satisfy the fixture predicates for both
     *               the open and the closed state across a full state machine run.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFixtureDrivenRecordRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFixtureDrivenRecordRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const context: common.Context = requireContext();
      await RecordStore.clearRecords(context);
      const enterTime: number = Date.now();

      const expectedOpen: CheckInRecord = FixtureFactory.openRecord(-1, enterTime);
      const entered: CheckInRecord | undefined = await RecordStore.handleEnter(context, enterTime);
      expect(entered !== undefined).assertTrue();
      if (entered !== undefined) {
        expect(FixtureFactory.isOpen(entered)).assertTrue();
        expect(entered.enterTime === expectedOpen.enterTime).assertTrue();
        expect(entered.exitTime === expectedOpen.exitTime).assertTrue();
        expect(entered.durationMs === expectedOpen.durationMs).assertTrue();
        expect(entered.id > 0).assertTrue();
        const cloned: CheckInRecord = FixtureFactory.cloneRecord(entered);
        expect(FixtureFactory.recordEquals(cloned, entered)).assertTrue();
        expect(cloned === entered).assertFalse();
      } else {
        expect(true).assertFalse();
      }

      const closed: CheckInRecord | undefined =
        await RecordStore.handleExit(context, enterTime + 2 * MINUTE_MS);
      expect(closed !== undefined).assertTrue();
      if (closed !== undefined) {
        expect(FixtureFactory.isOpen(closed)).assertFalse();
        expect(closed.durationMs === 2 * MINUTE_MS).assertTrue();
        expect(closed.exitTime === enterTime + 2 * MINUTE_MS).assertTrue();
        const expectedClosed: CheckInRecord =
          FixtureFactory.closedRecord(closed.id, enterTime, 2 * MINUTE_MS);
        expect(FixtureFactory.recordEquals(closed, expectedClosed)).assertTrue();
      } else {
        expect(true).assertFalse();
      }

      const summaryOfAll: DaySummary =
        FixtureFactory.summaryOf(await RecordStore.getRecords(context));
      const storedSummary: DaySummary =
        await RecordStore.getDaySummary(context, getDayStart(Date.now()));
      expect(FixtureFactory.summaryEquals(summaryOfAll, storedSummary)).assertTrue();
      expect(storedSummary.count === 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
