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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  Formatter,
  HistoryAction,
  HistoryEntry,
  HistoryStats,
  VCardConstants,
  VCardManager
} from 'library';

const DOMAIN: number = 0xF811;

function makeHistEntry(action: number, success: boolean, target: string, cards: number): HistoryEntry {
  const entry: HistoryEntry = new HistoryEntry();
  entry.action = action;
  entry.success = success;
  entry.target = target;
  entry.cardCount = cards;
  return entry;
}

function buildImportList(count: number): HistoryEntry[] {
  const entries: HistoryEntry[] = [];
  for (let i = 0; i < count; i++) {
    entries.push(makeHistEntry(HistoryAction.IMPORT, true, 'import_' + i + '.vcf', 1));
  }
  return entries;
}

export default function historyLogicTest() {
  describe('HistoryLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_0100
     * @tc.name      testHistoryEntryDefaults0001
     * @tc.desc      Verify a fresh history entry starts with empty identity,
     *               the import action and zero numeric bookkeeping fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryEntryDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryEntryDefaults0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entry: HistoryEntry = new HistoryEntry();
      expect(entry.id).assertEqual('');
      expect(entry.action).assertEqual(HistoryAction.IMPORT);
      expect(entry.target).assertEqual('');
      expect(entry.cardCount).assertEqual(0);
      expect(entry.success).assertFalse();
      expect(entry.code).assertEqual(0);
      expect(entry.timestamp).assertEqual(0);
      expect(entry.id.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_0200
     * @tc.name      testHistoryEntryAssign0001
     * @tc.desc      Verify every history entry field stores the assigned value
     *               so the record page can render exactly what was logged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryEntryAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryEntryAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entry: HistoryEntry = new HistoryEntry();
      entry.id = '1760000000001';
      entry.action = HistoryAction.EXPORT;
      entry.target = 'contacts_2026.vcf';
      entry.cardCount = 3;
      entry.success = true;
      entry.code = 0;
      entry.timestamp = 1760000000001;
      expect(entry.id).assertEqual('1760000000001');
      expect(entry.action).assertEqual(HistoryAction.EXPORT);
      expect(entry.target).assertEqual('contacts_2026.vcf');
      expect(entry.cardCount).assertEqual(3);
      expect(entry.success).assertTrue();
      expect(entry.timestamp).assertEqual(1760000000001);
      const other: HistoryEntry = new HistoryEntry();
      other.id = '1760000000002';
      other.action = HistoryAction.DELETE;
      other.target = 'Bob';
      other.success = false;
      other.code = 201;
      expect(other.id).assertEqual('1760000000002');
      expect(other.action).assertEqual(HistoryAction.DELETE);
      expect(other.success).assertFalse();
      expect(other.code).assertEqual(201);
      expect(other.timestamp).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_0300
     * @tc.name      testHistoryActionEnum0001
     * @tc.desc      Verify the history action enum keeps its stable numeric
     *               contract used by persisted preference payloads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryActionEnum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryActionEnum0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(HistoryAction.IMPORT).assertEqual(0);
      expect(HistoryAction.EXPORT).assertEqual(1);
      expect(HistoryAction.CREATE).assertEqual(2);
      expect(HistoryAction.UPDATE).assertEqual(3);
      expect(HistoryAction.DELETE).assertEqual(4);
      const entry: HistoryEntry = new HistoryEntry();
      expect(entry.action).assertEqual(HistoryAction.IMPORT);
      expect(entry.action).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_0400
     * @tc.name      testHistoryStatsDefaults0001
     * @tc.desc      Verify a directly constructed stats object reports zero on
     *               every counter before any entry is aggregated.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsDefaults0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stats: HistoryStats = new HistoryStats();
      expect(stats.total).assertEqual(0);
      expect(stats.importCount).assertEqual(0);
      expect(stats.exportCount).assertEqual(0);
      expect(stats.contactCount).assertEqual(0);
      expect(stats.successCount).assertEqual(0);
      expect(stats.total >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_0500
     * @tc.name      testHistoryStatsImport0001
     * @tc.desc      Verify one successful import entry increments only total,
     *               importCount and successCount.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryStatsImport0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryStatsImport0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] =
        [makeHistEntry(HistoryAction.IMPORT, true, 'first.vcf', 4)];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(1);
      expect(stats.importCount).assertEqual(1);
      expect(stats.exportCount).assertEqual(0);
      expect(stats.contactCount).assertEqual(0);
      expect(stats.successCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_0600
     * @tc.name      testHistoryStatsExport0001
     * @tc.desc      Verify one failed export entry counts towards exportCount
     *               but never towards successCount.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryStatsExport0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryStatsExport0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] =
        [makeHistEntry(HistoryAction.EXPORT, false, 'blocked.vcf', 0)];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(1);
      expect(stats.exportCount).assertEqual(1);
      expect(stats.importCount).assertEqual(0);
      expect(stats.contactCount).assertEqual(0);
      expect(stats.successCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_0700
     * @tc.name      testHistoryStatsCreate0001
     * @tc.desc      Verify a successful create entry lands in the contact
     *               counter and the success counter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryStatsCreate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryStatsCreate0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = [makeHistEntry(HistoryAction.CREATE, true, 'Alice', 1)];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(1);
      expect(stats.contactCount).assertEqual(1);
      expect(stats.importCount).assertEqual(0);
      expect(stats.exportCount).assertEqual(0);
      expect(stats.successCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_0800
     * @tc.name      testHistoryStatsUpdate0001
     * @tc.desc      Verify a failed update entry still counts as a contact
     *               action while the success counter stays flat.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryStatsUpdate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryStatsUpdate0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = [makeHistEntry(HistoryAction.UPDATE, false, 'Bob', 1)];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(1);
      expect(stats.contactCount).assertEqual(1);
      expect(stats.successCount).assertEqual(0);
      expect(stats.importCount).assertEqual(0);
      expect(stats.exportCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_0900
     * @tc.name      testHistoryStatsDelete0001
     * @tc.desc      Verify a successful delete entry is aggregated as a contact
     *               action with a matching success count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryStatsDelete0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryStatsDelete0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = [makeHistEntry(HistoryAction.DELETE, true, 'Carol', 1)];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(1);
      expect(stats.contactCount).assertEqual(1);
      expect(stats.successCount).assertEqual(1);
      expect(stats.importCount).assertEqual(0);
      expect(stats.exportCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_1000
     * @tc.name      testHistoryStatsUnknown0001
     * @tc.desc      Verify unknown action codes only contribute to total and
     *               successCount so future actions cannot distort old pages.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsUnknown0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsUnknown0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] =
        [makeHistEntry(99, true, 'future', 1), makeHistEntry(-1, false, 'past', 0)];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(2);
      expect(stats.successCount).assertEqual(1);
      expect(stats.importCount).assertEqual(0);
      expect(stats.exportCount).assertEqual(0);
      expect(stats.contactCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_1100
     * @tc.name      testHistoryStatsAllSuccess0001
     * @tc.desc      Verify five successful entries across every action type
     *               make successCount equal to total.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsAllSuccess0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsAllSuccess0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = [
        makeHistEntry(HistoryAction.IMPORT, true, 'in.vcf', 4),
        makeHistEntry(HistoryAction.EXPORT, true, 'out.vcf', 0),
        makeHistEntry(HistoryAction.CREATE, true, 'Alice', 1),
        makeHistEntry(HistoryAction.UPDATE, true, 'Bob', 1),
        makeHistEntry(HistoryAction.DELETE, true, 'Carol', 1)
      ];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(5);
      expect(stats.successCount).assertEqual(5);
      expect(stats.importCount).assertEqual(1);
      expect(stats.exportCount).assertEqual(1);
      expect(stats.contactCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_1200
     * @tc.name      testHistoryStatsAllFail0001
     * @tc.desc      Verify four failed entries keep every action counter while
     *               successCount drops to zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsAllFail0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsAllFail0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = [
        makeHistEntry(HistoryAction.IMPORT, false, 'bad.vcf', 0),
        makeHistEntry(HistoryAction.EXPORT, false, 'no.vcf', 0),
        makeHistEntry(HistoryAction.CREATE, false, 'Dan', 1),
        makeHistEntry(HistoryAction.UPDATE, false, 'Eve', 1)
      ];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(4);
      expect(stats.successCount).assertEqual(0);
      expect(stats.importCount).assertEqual(1);
      expect(stats.exportCount).assertEqual(1);
      expect(stats.contactCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_1300
     * @tc.name      testHistoryStatsNoMutate0001
     * @tc.desc      Verify computing stats never mutates the input list so the
     *               record page list stays stable after aggregation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsNoMutate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsNoMutate0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = [
        makeHistEntry(HistoryAction.IMPORT, true, 'i1.vcf', 2),
        makeHistEntry(HistoryAction.EXPORT, true, 'e1.vcf', 0),
        makeHistEntry(HistoryAction.CREATE, true, 'Fay', 1)
      ];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(entries.length).assertEqual(3);
      expect(entries[0].target).assertEqual('i1.vcf');
      expect(entries[1].target).assertEqual('e1.vcf');
      expect(entries[2].target).assertEqual('Fay');
      expect(stats.total).assertEqual(3);
      expect(stats.importCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_1400
     * @tc.name      testHistoryStatsRepeat0001
     * @tc.desc      Verify repeated aggregation of the same list produces
     *               identical counters with no hidden shared state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsRepeat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsRepeat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = buildImportList(3);
      const first: HistoryStats = VCardManager.makeStats(entries);
      const second: HistoryStats = VCardManager.makeStats(entries);
      expect(first.total).assertEqual(second.total);
      expect(first.importCount).assertEqual(second.importCount);
      expect(first.successCount).assertEqual(second.successCount);
      expect(first.total).assertEqual(3);
      expect(first.successCount).assertEqual(3);
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_1500
     * @tc.name      testHistoryStatsBig0001
     * @tc.desc      Verify a history list at the size of the largest retention
     *               option aggregates every entry without truncation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsBig0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsBig0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = buildImportList(50);
      expect(entries.length).assertEqual(50);
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(50);
      expect(stats.importCount).assertEqual(50);
      expect(stats.successCount).assertEqual(50);
      expect(stats.exportCount).assertEqual(0);
      expect(stats.contactCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_1600
     * @tc.name      testHistoryStatsRelation0001
     * @tc.desc      Verify contactCount equals the entries that are neither
     *               import nor export for a fully classified list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsRelation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsRelation0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = [
        makeHistEntry(HistoryAction.IMPORT, true, 'a.vcf', 2),
        makeHistEntry(HistoryAction.EXPORT, true, 'b.vcf', 0),
        makeHistEntry(HistoryAction.CREATE, false, 'Gil', 1),
        makeHistEntry(HistoryAction.UPDATE, false, 'Hal', 1),
        makeHistEntry(HistoryAction.DELETE, true, 'Ida', 1)
      ];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(5);
      expect(stats.importCount).assertEqual(1);
      expect(stats.exportCount).assertEqual(1);
      expect(stats.contactCount).assertEqual(stats.total - stats.importCount - stats.exportCount);
      expect(stats.contactCount).assertEqual(3);
      expect(stats.successCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_1700
     * @tc.name      testHistoryManagerStats0001
     * @tc.desc      Verify the manager facade aggregates a mixed list into
     *               action counters exactly like the store implementation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryManagerStats0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryManagerStats0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = [
        makeHistEntry(HistoryAction.EXPORT, true, 'out1.vcf', 3),
        makeHistEntry(HistoryAction.EXPORT, true, 'out2.vcf', 1),
        makeHistEntry(HistoryAction.IMPORT, false, 'in.vcf', 0),
        makeHistEntry(HistoryAction.DELETE, true, 'Jill', 1)
      ];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(4);
      expect(stats.exportCount).assertEqual(2);
      expect(stats.importCount).assertEqual(1);
      expect(stats.contactCount).assertEqual(1);
      expect(stats.successCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_1800
     * @tc.name      testHistoryTimeFormat0001
     * @tc.desc      Verify history timestamps render as zero padded
     *               yyyy-MM-dd HH:mm:ss text for record rows.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryTimeFormat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryTimeFormat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const summer: number = new Date(2025, 7, 9, 14, 3, 2).getTime();
      expect(Formatter.time(summer)).assertEqual('2025-08-09 14:03:02');
      const leap: number = new Date(2024, 1, 29, 23, 0, 1).getTime();
      expect(Formatter.time(leap)).assertEqual('2024-02-29 23:00:01');
      const december: number = new Date(2026, 11, 1, 9, 30, 0).getTime();
      expect(Formatter.time(december)).assertEqual('2026-12-01 09:30:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_1900
     * @tc.name      testHistoryPreferenceKey0001
     * @tc.desc      Verify the history preference key constant keeps its exact
     *               documented value so persisted records stay readable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryPreferenceKey0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryPreferenceKey0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.PREFERENCE_HISTORY).assertEqual('vcard_history');
      expect(VCardConstants.PREFERENCE_HISTORY).assertContain('history');
      expect(VCardConstants.PREFERENCE_HISTORY.length).assertEqual(13);
      expect(VCardConstants.PREFERENCE_HISTORY === VCardConstants.PREFERENCE_SETTINGS).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_2000
     * @tc.name      testHistoryStatsTimestampFree0001
     * @tc.desc      Verify stats ignore entry timestamps so aggregation is
     *               stable regardless of when each record was written.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsTimestampFree0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsTimestampFree0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const plain: HistoryEntry[] = [
        makeHistEntry(HistoryAction.IMPORT, true, 'a.vcf', 2),
        makeHistEntry(HistoryAction.EXPORT, false, 'b.vcf', 0)
      ];
      const stamped: HistoryEntry[] = [
        makeHistEntry(HistoryAction.IMPORT, true, 'a.vcf', 2),
        makeHistEntry(HistoryAction.EXPORT, false, 'b.vcf', 0)
      ];
      stamped[0].timestamp = 1760000000001;
      stamped[1].timestamp = 1760000000002;
      const left: HistoryStats = VCardManager.makeStats(plain);
      const right: HistoryStats = VCardManager.makeStats(stamped);
      expect(left.total).assertEqual(right.total);
      expect(left.importCount).assertEqual(right.importCount);
      expect(left.exportCount).assertEqual(right.exportCount);
      expect(left.successCount).assertEqual(right.successCount);
      expect(left.total).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_2100
     * @tc.name      testHistoryCardCount0001
     * @tc.desc      Verify cardCount is stored per entry but never aggregated
     *               into the stats object fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryCardCount0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryCardCount0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = [
        makeHistEntry(HistoryAction.IMPORT, true, 'multi.vcf', 5),
        makeHistEntry(HistoryAction.CREATE, true, 'Ken', 1)
      ];
      expect(entries[0].cardCount).assertEqual(5);
      expect(entries[1].cardCount).assertEqual(1);
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(2);
      expect(stats.importCount).assertEqual(1);
      expect(stats.contactCount).assertEqual(1);
      expect(stats.successCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_2200
     * @tc.name      testHistoryCodeValues0001
     * @tc.desc      Verify failure entries keep their raw system codes and the
     *               codes never change the aggregation counters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryCodeValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryCodeValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const failedParam: HistoryEntry = makeHistEntry(HistoryAction.IMPORT, false, 'bad.vcf', 0);
      failedParam.code = 401;
      const failedDenied: HistoryEntry = makeHistEntry(HistoryAction.EXPORT, false, 'denied', 0);
      failedDenied.code = 201;
      const failedSystem: HistoryEntry = makeHistEntry(HistoryAction.UPDATE, false, 'Lee', 1);
      failedSystem.code = 8300999;
      expect(failedParam.code).assertEqual(401);
      expect(failedDenied.code).assertEqual(201);
      expect(failedSystem.code).assertEqual(8300999);
      const stats: HistoryStats = VCardManager.makeStats([failedParam, failedDenied, failedSystem]);
      expect(stats.total).assertEqual(3);
      expect(stats.successCount).assertEqual(0);
      expect(stats.importCount).assertEqual(1);
      expect(stats.exportCount).assertEqual(1);
      expect(stats.contactCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_2300
     * @tc.name      testHistoryStatsDuplicates0001
     * @tc.desc      Verify identical repeated entries each contribute to the
     *               counters instead of being deduplicated.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsDuplicates0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsDuplicates0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = [
        makeHistEntry(HistoryAction.IMPORT, true, 'same.vcf', 2),
        makeHistEntry(HistoryAction.IMPORT, true, 'same.vcf', 2)
      ];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(2);
      expect(stats.importCount).assertEqual(2);
      expect(stats.successCount).assertEqual(2);
      expect(stats.exportCount).assertEqual(0);
      expect(entries[0] === entries[1]).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_2400
     * @tc.name      testHistoryEntryTargets0001
     * @tc.desc      Verify target values keep both file names and contact
     *               names so the record page can label every action.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryEntryTargets0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryEntryTargets0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const importEntry: HistoryEntry = makeHistEntry(HistoryAction.IMPORT, true, 'batch.vcf', 2);
      const contactEntry: HistoryEntry = makeHistEntry(HistoryAction.CREATE, true, 'Mia Noa', 1);
      expect(importEntry.target).assertEqual('batch.vcf');
      expect(importEntry.target).assertContain('.vcf');
      expect(contactEntry.target).assertEqual('Mia Noa');
      expect(contactEntry.target).assertContain('Noa');
      expect(importEntry.target === contactEntry.target).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_2500
     * @tc.name      testHistoryCodeIgnored0001
     * @tc.desc      Verify a success flag drives the success counter even when
     *               a non-zero code is left on the entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryCodeIgnored0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryCodeIgnored0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entry: HistoryEntry = makeHistEntry(HistoryAction.EXPORT, true, 'warn.vcf', 1);
      entry.code = 8300001;
      expect(entry.success).assertTrue();
      expect(entry.code).assertEqual(8300001);
      const stats: HistoryStats = VCardManager.makeStats([entry]);
      expect(stats.total).assertEqual(1);
      expect(stats.successCount).assertEqual(1);
      expect(stats.exportCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_2600
     * @tc.name      testHistoryActionOrder0001
     * @tc.desc      Verify the action enum values are strictly ascending so
     *               persisted numeric actions sort deterministically.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryActionOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryActionOrder0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(HistoryAction.IMPORT).assertLess(HistoryAction.EXPORT);
      expect(HistoryAction.EXPORT).assertLess(HistoryAction.CREATE);
      expect(HistoryAction.CREATE).assertLess(HistoryAction.UPDATE);
      expect(HistoryAction.UPDATE).assertLess(HistoryAction.DELETE);
      expect(HistoryAction.DELETE).assertLess(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_2700
     * @tc.name      testHistorySuccessBound0001
     * @tc.desc      Verify successCount never exceeds total for mixed history
     *               lists of different shapes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistorySuccessBound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistorySuccessBound0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const wide: HistoryEntry[] = [
        makeHistEntry(HistoryAction.IMPORT, true, 'w1.vcf', 1),
        makeHistEntry(HistoryAction.EXPORT, false, 'w2.vcf', 0),
        makeHistEntry(HistoryAction.DELETE, true, 'Oli', 1),
        makeHistEntry(77, true, 'ghost', 0)
      ];
      const wideStats: HistoryStats = VCardManager.makeStats(wide);
      expect(wideStats.successCount <= wideStats.total).assertTrue();
      expect(wideStats.total).assertEqual(4);
      expect(wideStats.successCount).assertEqual(3);
      const narrow: HistoryEntry[] = [makeHistEntry(HistoryAction.UPDATE, false, 'Pat', 1)];
      const narrowStats: HistoryStats = VCardManager.makeStats(narrow);
      expect(narrowStats.successCount <= narrowStats.total).assertTrue();
      expect(narrowStats.successCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_2800
     * @tc.name      testHistoryEntryLongId0001
     * @tc.desc      Verify the entry id keeps very long digit strings intact
     *               so timestamp based identifiers survive round trips.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryEntryLongId0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryEntryLongId0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entry: HistoryEntry = new HistoryEntry();
      entry.id = '176000000000123456789';
      expect(entry.id).assertEqual('176000000000123456789');
      expect(entry.id).assertContain('123456789');
      expect(entry.id.length).assertEqual(21);
      const twin: HistoryEntry = new HistoryEntry();
      twin.id = entry.id;
      expect(twin.id === entry.id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_2900
     * @tc.name      testHistoryLimitCompare0001
     * @tc.desc      Verify the default retention value sits inside the offered
     *               option range without touching the maximum constant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryLimitCompare0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryLimitCompare0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      expect(VCardConstants.DEFAULT_HISTORY_LIMIT).assertLarger(options[0]);
      expect(VCardConstants.DEFAULT_HISTORY_LIMIT).assertLess(options[3]);
      expect(options[0]).assertLess(options[3]);
      expect(VCardConstants.DEFAULT_HISTORY_LIMIT >= 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_3000
     * @tc.name      testHistoryStatsZeroFail0001
     * @tc.desc      Verify an unknown failed action contributes only to total
     *               and leaves every named counter at zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsZeroFail0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsZeroFail0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stats: HistoryStats = VCardManager.makeStats([makeHistEntry(12345, false, 'odd', 0)]);
      expect(stats.total).assertEqual(1);
      expect(stats.importCount).assertEqual(0);
      expect(stats.exportCount).assertEqual(0);
      expect(stats.contactCount).assertEqual(0);
      expect(stats.successCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_3100
     * @tc.name      testHistoryTimeFormat0002
     * @tc.desc      Verify an entry timestamp assigned from a fixed instant
     *               renders through the shared formatter unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryTimeFormat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryTimeFormat0002';
      const stamp: number = new Date(2027, 4, 20, 6, 30, 15).getTime();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entry: HistoryEntry = makeHistEntry(HistoryAction.EXPORT, true, 'stamp.vcf', 0);
      entry.timestamp = stamp;
      expect(entry.timestamp).assertEqual(stamp);
      expect(Formatter.time(entry.timestamp)).assertEqual('2027-05-20 06:30:15');
      expect(Formatter.time(entry.timestamp).length).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_3200
     * @tc.name      testHistoryManagerMixed0002
     * @tc.desc      Verify a six entry mixed list with repeated imports and
     *               failed exports aggregates every counter correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryManagerMixed0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryManagerMixed0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = [
        makeHistEntry(HistoryAction.IMPORT, true, 'in1.vcf', 3),
        makeHistEntry(HistoryAction.IMPORT, true, 'in2.vcf', 1),
        makeHistEntry(HistoryAction.IMPORT, false, 'in3.vcf', 0),
        makeHistEntry(HistoryAction.EXPORT, false, 'out1.vcf', 0),
        makeHistEntry(HistoryAction.EXPORT, false, 'out2.vcf', 0),
        makeHistEntry(HistoryAction.DELETE, true, 'Quin', 1)
      ];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(6);
      expect(stats.importCount).assertEqual(3);
      expect(stats.exportCount).assertEqual(2);
      expect(stats.contactCount).assertEqual(1);
      expect(stats.successCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_HIST_3300
     * @tc.name      testHistoryStatsIndependent0001
     * @tc.desc      Verify each makeStats call returns a fresh stats object
     *               whose counters can be written without cross effects.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsIndependent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsIndependent0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = buildImportList(2);
      const left: HistoryStats = VCardManager.makeStats(entries);
      const right: HistoryStats = VCardManager.makeStats(entries);
      expect(left === right).assertFalse();
      expect(left.total).assertEqual(right.total);
      left.total = 99;
      expect(right.total).assertEqual(2);
      expect(left.total).assertEqual(99);
      left.total = right.total;
      expect(left.total).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
