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

import { describe, expect } from '@ohos/hypium';
import { loggedIt as it } from '../support/TestLog';
import { QueryOutcome, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import {
  ARCHIVE_OUTCOMES, ARCHIVE_SOURCES, ArchiveDay, ArchiveEntry, ArchiveIndex, ArchiveTrend,
  CountEntry, DAY_MS, ENTRY_CODE_LIMIT, ENTRY_MESSAGE_LIMIT, ENTRY_NOTE_LIMIT, ENTRY_TEXT_LIMIT,
  IndexBounds, INDEX_MAX_DAYS, INDEX_RECENT_VALID, INDEX_SAMPLES_PER_DAY, INDEX_TREND_POINTS,
  TrendDirection, TrendPoint, archiveEntriesOf, archiveEntryOf, archiveOutcomeLabel,
  archiveSourceLabel, buildArchiveIndex, buildTrend, dayEndMillis, dayKeyOf, dayStartMillis,
  distributionOf, isDayKey, isKnownOutcome, isKnownSource, localOffsetMinutes, pad2,
  sortedDistribution, trendDirectionLabel
} from '../../../main/ets/autostart/archive/ArchiveIndex';

/** 2024-01-15 00:00 UTC。 */
const D1: number = 1705276800000;
/** 2024-01-16 00:00 UTC。 */
const D2: number = D1 + DAY_MS;
/** 2024-01-17 00:00 UTC。 */
const D3: number = D2 + DAY_MS;

/** 造一条合法归档记录。 */
function entryOf(id: number, timestamp: number, outcome: QueryOutcome, source: RefreshSource,
  duration: number): ArchiveEntry {
  const entry: ArchiveEntry = new ArchiveEntry(id, timestamp);
  entry.outcome = outcome;
  entry.source = source;
  entry.durationMillis = duration;
  entry.result = outcome === QueryOutcome.SUCCESS ? '已开启' : '';
  return entry;
}

/** 造一条成功记录。 */
function okAt(id: number, timestamp: number): ArchiveEntry {
  return entryOf(id, timestamp, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 120);
}

/** 造一条失败记录。 */
function failAt(id: number, timestamp: number): ArchiveEntry {
  return entryOf(id, timestamp, QueryOutcome.FAILURE, RefreshSource.MANUAL, 200);
}

/** 造一条只提交日志、不产生有效样本的超时记录。 */
function timeoutAt(id: number, timestamp: number): ArchiveEntry {
  return entryOf(id, timestamp, QueryOutcome.TIMEOUT, RefreshSource.FOREGROUND, 0);
}

/** 按天逐条追加成功/失败记录。 */
function fillDay(dayStart: number, successes: number, failures: number, idBase: number): ArchiveEntry[] {
  const list: ArchiveEntry[] = [];
  for (let index = 0; index < successes; index++) {
    list.push(okAt(idBase + index, dayStart + index * 1000));
  }
  for (let index = 0; index < failures; index++) {
    list.push(failAt(idBase + successes + index, dayStart + (successes + index) * 1000));
  }
  return list;
}

export default function archiveIndexCasesTest(): void {
  describe('ArchiveEntryCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_0100
     * @tc.name      testArchiveEntryCases0001
     * @tc.desc      Verify default entry is invalid
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0001', 0, (): void => {
      const entry: ArchiveEntry = new ArchiveEntry();
      expect(entry.id).assertEqual(0);
      expect(entry.timestamp).assertEqual(0);
      expect(entry.isValid()).assertFalse();
      expect(entry.note).assertEqual('');
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_0200
     * @tc.name      testArchiveEntryCases0002
     * @tc.desc      Verify complete entry is valid
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0002', 0, (): void => {
      const entry: ArchiveEntry = okAt(1, D1);
      expect(entry.isValid()).assertTrue();
      expect(entry.source).assertEqual(RefreshSource.MANUAL);
      expect(entry.durationMillis).assertEqual(120);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_0300
     * @tc.name      testArchiveEntryCases0003
     * @tc.desc      Verify id must be positive integer
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0003', 0, (): void => {
      expect(entryOf(0, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid()).assertFalse();
      expect(entryOf(-1, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid()).assertFalse();
      expect(entryOf(1.5, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid()).assertFalse();
      expect(entryOf(1, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid()).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_0400
     * @tc.name      testArchiveEntryCases0004
     * @tc.desc      Verify timestamp must be positive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0004', 0, (): void => {
      expect(entryOf(1, 0, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid()).assertFalse();
      expect(entryOf(1, -5, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid()).assertFalse();
      expect(entryOf(1, 1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid()).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_0500
     * @tc.name      testArchiveEntryCases0005
     * @tc.desc      Verify duration allows zero but not negative
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0005', 0, (): void => {
      expect(entryOf(1, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 0).isValid()).assertTrue();
      expect(entryOf(1, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, -1).isValid()).assertFalse();
      expect(entryOf(1, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, Number.NaN).isValid())
        .assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_0600
     * @tc.name      testArchiveEntryCases0006
     * @tc.desc      Verify source must be whitelisted
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0006', 0, (): void => {
      expect(isKnownSource(RefreshSource.SETTINGS)).assertTrue();
      expect(isKnownSource('未知来源')).assertFalse();
      expect(isKnownSource('')).assertFalse();
      expect(ARCHIVE_SOURCES.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_0700
     * @tc.name      testArchiveEntryCases0007
     * @tc.desc      Verify outcome must be whitelisted
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0007', 0, (): void => {
      expect(isKnownOutcome(QueryOutcome.TIMEOUT)).assertTrue();
      expect(isKnownOutcome('blocked')).assertFalse();
      expect(ARCHIVE_OUTCOMES.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_0800
     * @tc.name      testArchiveEntryCases0008
     * @tc.desc      Verify text limits are enforced
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0008', 0, (): void => {
      const ok: ArchiveEntry = okAt(1, D1);
      ok.result = 'a'.repeat(ENTRY_TEXT_LIMIT);
      expect(ok.isValid()).assertTrue();
      ok.result = 'a'.repeat(ENTRY_TEXT_LIMIT + 1);
      expect(ok.isValid()).assertFalse();
      expect(ENTRY_CODE_LIMIT).assertEqual(64);
      expect(ENTRY_MESSAGE_LIMIT).assertEqual(512);
      expect(ENTRY_NOTE_LIMIT).assertEqual(192);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_0900
     * @tc.name      testArchiveEntryCases0009
     * @tc.desc      Verify note and error fields are bounded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0009', 0, (): void => {
      const entry: ArchiveEntry = okAt(1, D1);
      entry.note = 'n'.repeat(ENTRY_NOTE_LIMIT);
      expect(entry.isValid()).assertTrue();
      entry.note = 'n'.repeat(ENTRY_NOTE_LIMIT + 1);
      expect(entry.isValid()).assertFalse();
      entry.note = '';
      entry.errorCode = 'c'.repeat(ENTRY_CODE_LIMIT + 1);
      expect(entry.isValid()).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_1000
     * @tc.name      testArchiveEntryCases0010
     * @tc.desc      Verify valid sample needs success or failure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0010', 0, (): void => {
      expect(okAt(1, D1).isValidSample()).assertTrue();
      expect(failAt(1, D1).isValidSample()).assertTrue();
      expect(timeoutAt(1, D1).isValidSample()).assertFalse();
      expect(entryOf(1, D1, QueryOutcome.UNSUPPORTED, RefreshSource.MANUAL, 1).isValidSample())
        .assertFalse();
      expect(entryOf(1, D1, QueryOutcome.UNKNOWN, RefreshSource.MANUAL, 1).isValidSample())
        .assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_1100
     * @tc.name      testArchiveEntryCases0011
     * @tc.desc      Verify has error covers both fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0011', 0, (): void => {
      const entry: ArchiveEntry = okAt(1, D1);
      expect(entry.hasError()).assertFalse();
      entry.errorCode = 'E1';
      expect(entry.hasError()).assertTrue();
      entry.errorCode = '';
      entry.errorMessage = '失败原因';
      expect(entry.hasError()).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_1200
     * @tc.name      testArchiveEntryCases0012
     * @tc.desc      Verify age days floors
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0012', 0, (): void => {
      const entry: ArchiveEntry = okAt(1, D1);
      expect(entry.ageDaysAt(D1 + DAY_MS - 1)).assertEqual(0);
      expect(entry.ageDaysAt(D1 + DAY_MS)).assertEqual(1);
      expect(entry.ageDaysAt(D1 + 3 * DAY_MS + 5)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_1300
     * @tc.name      testArchiveEntryCases0013
     * @tc.desc      Verify age days guards invalid now
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0013', 0, (): void => {
      const entry: ArchiveEntry = okAt(1, D1);
      expect(entry.ageDaysAt(0)).assertEqual(0);
      expect(entry.ageDaysAt(-1)).assertEqual(0);
      expect(entry.ageDaysAt(D1 - DAY_MS)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_1400
     * @tc.name      testArchiveEntryCases0014
     * @tc.desc      Verify clone is detached
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0014', 0, (): void => {
      const entry: ArchiveEntry = okAt(7, D1);
      entry.note = '原始备注';
      const copy: ArchiveEntry = entry.clone();
      copy.id = 99;
      copy.note = '改过';
      expect(entry.id).assertEqual(7);
      expect(entry.note).assertEqual('原始备注');
      expect(copy.timestamp).assertEqual(entry.timestamp);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_1500
     * @tc.name      testArchiveEntryCases0015
     * @tc.desc      Verify day key matches timestamp
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0015', 0, (): void => {
      expect(okAt(1, D1).dayKey(0)).assertEqual('2024-01-15');
      expect(okAt(1, D2).dayKey(0)).assertEqual('2024-01-16');
      expect(okAt(1, D1).dayKey(0) === okAt(1, D2).dayKey(0)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_1600
     * @tc.name      testArchiveEntryCases0016
     * @tc.desc      Verify projection from record copies fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0016', 0, (): void => {
      const record: QueryRecord = new QueryRecord();
      record.id = 5;
      record.timestamp = D1;
      record.source = RefreshSource.SETTINGS;
      record.outcome = QueryOutcome.SUCCESS;
      record.result = '已开启';
      record.durationMillis = 88;
      const entry: ArchiveEntry = archiveEntryOf(record);
      expect(entry.id).assertEqual(5);
      expect(entry.source).assertEqual(RefreshSource.SETTINGS);
      expect(entry.durationMillis).assertEqual(88);
      expect(entry.note).assertEqual('');
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEENTRYCASES_1700
     * @tc.name      testArchiveEntryCases0017
     * @tc.desc      Verify batch projection drops invalid
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveEntryCases0017', 0, (): void => {
      const bad: QueryRecord = new QueryRecord();
      bad.id = 0;
      const good: QueryRecord = new QueryRecord();
      good.id = 2;
      good.timestamp = D1;
      const entries: ArchiveEntry[] = archiveEntriesOf([bad, good]);
      expect(entries.length).assertEqual(1);
      expect(entries[0].id).assertEqual(2);
      expect(entries[0].timestamp).assertEqual(D1);
    });
  });

  describe('DayKeyCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_DAYKEYCASES_0100
     * @tc.name      testDayKeyCases0001
     * @tc.desc      Verify day key formatting
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDayKeyCases0001', 0, (): void => {
      expect(dayKeyOf(D1, 0)).assertEqual('2024-01-15');
      expect(dayKeyOf(D2, 0)).assertEqual('2024-01-16');
      expect(dayKeyOf(D1, 0).length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_STARTUP_DAYKEYCASES_0200
     * @tc.name      testDayKeyCases0002
     * @tc.desc      Verify offset shifts day boundary
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDayKeyCases0002', 0, (): void => {
      const lateUtc: number = D1 - 8 * 60 * 60 * 1000;
      expect(dayKeyOf(lateUtc, 0)).assertEqual('2024-01-14');
      expect(dayKeyOf(lateUtc, 480)).assertEqual('2024-01-15');
      expect(dayKeyOf(lateUtc, 0) === dayKeyOf(lateUtc, 480)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_DAYKEYCASES_0300
     * @tc.name      testDayKeyCases0003
     * @tc.desc      Verify non finite offset falls back to zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDayKeyCases0003', 0, (): void => {
      expect(dayKeyOf(D1, Number.NaN)).assertEqual(dayKeyOf(D1, 0));
      expect(dayKeyOf(D1, Number.POSITIVE_INFINITY)).assertEqual(dayKeyOf(D1, 0));
      expect(dayKeyOf(D1, 5)).assertEqual(dayKeyOf(D1, 0));
    });

    /**
     * @tc.number    SUB_STARTUP_DAYKEYCASES_0400
     * @tc.name      testDayKeyCases0004
     * @tc.desc      Verify invalid timestamp yields empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDayKeyCases0004', 0, (): void => {
      expect(dayKeyOf(0, 0)).assertEqual('');
      expect(dayKeyOf(-1, 0)).assertEqual('');
      expect(dayKeyOf(Number.NaN, 0)).assertEqual('');
    });

    /**
     * @tc.number    SUB_STARTUP_DAYKEYCASES_0500
     * @tc.name      testDayKeyCases0005
     * @tc.desc      Verify pad2 pads single digit
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDayKeyCases0005', 0, (): void => {
      expect(pad2(0)).assertEqual('00');
      expect(pad2(9)).assertEqual('09');
      expect(pad2(10)).assertEqual('10');
      expect(pad2(59)).assertEqual('59');
    });

    /**
     * @tc.number    SUB_STARTUP_DAYKEYCASES_0600
     * @tc.name      testDayKeyCases0006
     * @tc.desc      Verify day start accepts real dates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDayKeyCases0006', 0, (): void => {
      expect(dayStartMillis('2024-01-15', 0)).assertEqual(D1);
      expect(dayStartMillis('2024-01-16', 0)).assertEqual(D2);
      expect(isDayKey('2024-01-15')).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_DAYKEYCASES_0700
     * @tc.name      testDayKeyCases0007
     * @tc.desc      Verify day start rejects auto rollover
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDayKeyCases0007', 0, (): void => {
      expect(dayStartMillis('2026-02-31', 0)).assertEqual(0);
      expect(isDayKey('2026-02-31')).assertFalse();
      expect(isDayKey('2023-02-29')).assertFalse();
      expect(isDayKey('2024-02-29')).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_DAYKEYCASES_0800
     * @tc.name      testDayKeyCases0008
     * @tc.desc      Verify day start rejects malformed text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testDayKeyCases0008', 0, (): void => {
      expect(dayStartMillis('2024-1-15', 0)).assertEqual(D1);
      expect(isDayKey('2024-1-15')).assertTrue();
      expect(dayStartMillis('2024/01/15', 0)).assertEqual(0);
      expect(dayStartMillis('', 0)).assertEqual(0);
      expect(isDayKey('')).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_DAYKEYCASES_0900
     * @tc.name      testDayKeyCases0009
     * @tc.desc      Verify day end is inclusive last millis
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDayKeyCases0009', 0, (): void => {
      expect(dayEndMillis('2024-01-15', 0)).assertEqual(D1 + DAY_MS - 1);
      expect(dayEndMillis('2024-01-15', 0) - dayStartMillis('2024-01-15', 0))
        .assertEqual(DAY_MS - 1);
      expect(dayEndMillis('2026-02-31', 0)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_DAYKEYCASES_1000
     * @tc.name      testDayKeyCases0010
     * @tc.desc      Verify local offset is bounded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDayKeyCases0010', 0, (): void => {
      const offset: number = localOffsetMinutes(D1);
      expect(Number.isFinite(offset)).assertTrue();
      expect(offset >= -840 && offset <= 840).assertTrue();
      expect(offset).assertEqual(localOffsetMinutes(0));
    });
  });

  describe('DistributionCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_DISTRIBUTIONCASES_0100
     * @tc.name      testDistributionCases0001
     * @tc.desc      Verify distribution keeps zero by default
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDistributionCases0001', 0, (): void => {
      const list = distributionOf(['a', 'b'], [3, 0]);
      expect(list.length).assertEqual(2);
      expect(list[0].count).assertEqual(3);
      expect(list[1].count).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_DISTRIBUTIONCASES_0200
     * @tc.name      testDistributionCases0002
     * @tc.desc      Verify distribution can drop zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDistributionCases0002', 0, (): void => {
      const list = distributionOf(['a', 'b', 'c'], [0, 2, 0], false);
      expect(list.length).assertEqual(1);
      expect(list[0].label).assertEqual('b');
      expect(list[0].label === 'a').assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_DISTRIBUTIONCASES_0300
     * @tc.name      testDistributionCases0003
     * @tc.desc      Verify short counts pad with zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDistributionCases0003', 0, (): void => {
      const list = distributionOf(['a', 'b', 'c'], [1]);
      expect(list.length).assertEqual(3);
      expect(list[1].count).assertEqual(0);
      expect(list[2].count).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_DISTRIBUTIONCASES_0400
     * @tc.name      testDistributionCases0004
     * @tc.desc      Verify illegal counts become zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDistributionCases0004', 0, (): void => {
      const list = distributionOf(['a', 'b', 'c'], [-5, Number.NaN, 4]);
      expect(list[0].count).assertEqual(0);
      expect(list[1].count).assertEqual(0);
      expect(list[2].count).assertEqual(4);
    });

    /**
     * @tc.number    SUB_STARTUP_DISTRIBUTIONCASES_0500
     * @tc.name      testDistributionCases0005
     * @tc.desc      Verify sorted distribution ranks by count
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testDistributionCases0005', 0, (): void => {
      const list = sortedDistribution(['a', 'b', 'c'], [1, 5, 3]);
      expect(list.length).assertEqual(3);
      expect(list[0].label).assertEqual('b');
      expect(list[1].label).assertEqual('c');
      expect(list[2].label).assertEqual('a');
    });

    /**
     * @tc.number    SUB_STARTUP_DISTRIBUTIONCASES_0600
     * @tc.name      testDistributionCases0006
     * @tc.desc      Verify sorted distribution tie breaks by label
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testDistributionCases0006', 0, (): void => {
      const list = sortedDistribution(['z', 'a'], [2, 2]);
      expect(list[0].label).assertEqual('a');
      expect(list[1].label).assertEqual('z');
      expect(list.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STARTUP_DISTRIBUTIONCASES_0700
     * @tc.name      testDistributionCases0007
     * @tc.desc      Verify outcome and source labels
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testDistributionCases0007', 0, (): void => {
      expect(archiveOutcomeLabel(QueryOutcome.SUCCESS)).assertEqual('成功');
      expect(archiveOutcomeLabel(QueryOutcome.TIMEOUT)).assertEqual('超时');
      expect(archiveOutcomeLabel('blocked')).assertEqual('未知');
      expect(archiveSourceLabel(RefreshSource.INITIAL)).assertEqual('首次进入');
      expect(archiveSourceLabel('other')).assertEqual('未标注');
    });
  });

  describe('ArchiveDayCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_0100
     * @tc.name      testArchiveDayCases0001
     * @tc.desc      Verify day defaults are empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testArchiveDayCases0001', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 3);
      expect(day.total).assertEqual(0);
      expect(day.valid()).assertEqual(0);
      expect(day.samples.length).assertEqual(0);
      expect(day.sourceCounts.length).assertEqual(ARCHIVE_SOURCES.length);
      expect(day.latestValidId).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_0200
     * @tc.name      testArchiveDayCases0002
     * @tc.desc      Verify negative sample limit clamps to zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveDayCases0002', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', -4);
      day.add(okAt(1, D1));
      expect(day.sampleLimit).assertEqual(0);
      expect(day.samples.length).assertEqual(0);
      expect(day.sampleTruncated()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_0300
     * @tc.name      testArchiveDayCases0003
     * @tc.desc      Verify add counts outcomes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveDayCases0003', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1));
      day.add(okAt(2, D1 + 1000));
      day.add(failAt(3, D1 + 2000));
      day.add(timeoutAt(4, D1 + 3000));
      expect(day.total).assertEqual(4);
      expect(day.success).assertEqual(2);
      expect(day.failure).assertEqual(1);
      expect(day.timeout).assertEqual(1);
      expect(day.valid()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_0400
     * @tc.name      testArchiveDayCases0004
     * @tc.desc      Verify success rate rounds to one decimal
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveDayCases0004', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1));
      day.add(failAt(2, D1 + 1000));
      day.add(failAt(3, D1 + 2000));
      expect(day.successRate()).assertEqual(33.3);
      expect(day.successRate() < 33.4).assertTrue();
      expect(day.valid()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_0500
     * @tc.name      testArchiveDayCases0005
     * @tc.desc      Verify success rate without valid is zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveDayCases0005', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(timeoutAt(1, D1));
      expect(day.valid()).assertEqual(0);
      expect(day.successRate()).assertEqual(0);
      expect(day.latestValidId).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_0600
     * @tc.name      testArchiveDayCases0006
     * @tc.desc      Verify perfect rate is hundred
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveDayCases0006', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1));
      expect(day.successRate()).assertEqual(100);
      expect(day.successRate() === 99.9).assertFalse();
      expect(day.valid()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_0700
     * @tc.name      testArchiveDayCases0007
     * @tc.desc      Verify source and outcome counters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveDayCases0007', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1));
      day.add(entryOf(2, D1 + 1, QueryOutcome.SUCCESS, RefreshSource.SETTINGS, 5));
      expect(day.sourceCount(RefreshSource.MANUAL)).assertEqual(1);
      expect(day.sourceCount(RefreshSource.SETTINGS)).assertEqual(1);
      expect(day.sourceCount('other')).assertEqual(0);
      expect(day.outcomeCount(QueryOutcome.SUCCESS)).assertEqual(2);
      expect(day.outcomeCount('blocked')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_0800
     * @tc.name      testArchiveDayCases0008
     * @tc.desc      Verify samples are capped
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveDayCases0008', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 2);
      day.add(okAt(1, D1));
      day.add(okAt(2, D1 + 1000));
      day.add(okAt(3, D1 + 2000));
      expect(day.samples.length).assertEqual(2);
      expect(day.sampleTruncated()).assertEqual(1);
      expect(day.total).assertEqual(3);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_0900
     * @tc.name      testArchiveDayCases0009
     * @tc.desc      Verify samples are cloned
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveDayCases0009', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 5);
      const source: ArchiveEntry = okAt(1, D1);
      day.add(source);
      source.note = '外部改写';
      expect(day.samples[0].note).assertEqual('');
      expect(day.samples[0].id).assertEqual(1);
      expect(day.samples.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_1000
     * @tc.name      testArchiveDayCases0010
     * @tc.desc      Verify latest valid ignores non samples
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveDayCases0010', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(timeoutAt(1, D1));
      expect(day.latestValidId).assertEqual(-1);
      day.add(okAt(2, D1 + 1000));
      expect(day.latestValidId).assertEqual(2);
      expect(day.valid()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_1100
     * @tc.name      testArchiveDayCases0011
     * @tc.desc      Verify latest valid tie breaks by larger id
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveDayCases0011', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(5, D1));
      day.add(okAt(9, D1));
      expect(day.latestValidAt).assertEqual(D1);
      expect(day.latestValidId).assertEqual(9);
      day.add(okAt(7, D1));
      expect(day.latestValidId).assertEqual(9);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_1200
     * @tc.name      testArchiveDayCases0012
     * @tc.desc      Verify first and last timestamps
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveDayCases0012', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1 + 5000));
      day.add(okAt(2, D1 + 1000));
      day.add(okAt(3, D1 + 9000));
      expect(day.firstAt).assertEqual(D1 + 1000);
      expect(day.lastAt).assertEqual(D1 + 9000);
      expect(day.firstAt < day.lastAt).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_1300
     * @tc.name      testArchiveDayCases0013
     * @tc.desc      Verify summary text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testArchiveDayCases0013', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1));
      day.add(failAt(2, D1 + 1000));
      expect(day.summaryText()).assertEqual('2024-01-15：共 2 条（有效 2），成功率 50%');
      expect(day.valid()).assertEqual(2);
      expect(day.summaryText().indexOf('50%') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_1400
     * @tc.name      testArchiveDayCases0014
     * @tc.desc      Verify summary marks truncation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveDayCases0014', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 1);
      day.add(okAt(1, D1));
      day.add(okAt(2, D1 + 1000));
      expect(day.summaryText()).assertEqual(
        '2024-01-15：共 2 条（有效 2），成功率 100%；另有 1 条仅计入统计');
      expect(day.summaryText().indexOf('仅计入统计') > 0).assertTrue();
      expect(day.summaryText().indexOf('100%') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEDAYCASES_1500
     * @tc.name      testArchiveDayCases0015
     * @tc.desc      Verify day distributions align with catalog
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testArchiveDayCases0015', 0, (): void => {
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1));
      expect(day.sourceDistribution().length).assertEqual(ARCHIVE_SOURCES.length);
      expect(day.outcomeDistribution().length).assertEqual(ARCHIVE_OUTCOMES.length);
      expect(day.sourceDistribution(false).length).assertEqual(1);
      expect(day.outcomeDistribution(false).length).assertEqual(1);
    });
  });

  describe('IndexBoundsCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_INDEXBOUNDSCASES_0100
     * @tc.name      testIndexBoundsCases0001
     * @tc.desc      Verify bounds defaults
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testIndexBoundsCases0001', 0, (): void => {
      const bounds: IndexBounds = new IndexBounds();
      expect(bounds.maxDays).assertEqual(INDEX_MAX_DAYS);
      expect(bounds.samplesPerDay).assertEqual(INDEX_SAMPLES_PER_DAY);
      expect(bounds.recentValid).assertEqual(INDEX_RECENT_VALID);
      expect(bounds.trendPoints).assertEqual(INDEX_TREND_POINTS);
      expect(INDEX_MAX_DAYS).assertEqual(180);
      expect(INDEX_TREND_POINTS).assertEqual(60);
    });

    /**
     * @tc.number    SUB_STARTUP_INDEXBOUNDSCASES_0200
     * @tc.name      testIndexBoundsCases0002
     * @tc.desc      Verify bounds describe
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIndexBoundsCases0002', 0, (): void => {
      expect(new IndexBounds().describe())
        .assertEqual('最多 180 天｜每日 20 条样本｜最近 10 条有效样本｜趋势 60 天');
      expect(new IndexBounds().describe().split('｜').length).assertEqual(4);
      expect(new IndexBounds().describe().indexOf('180 天') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_INDEXBOUNDSCASES_0300
     * @tc.name      testIndexBoundsCases0003
     * @tc.desc      Verify bounds clamp to lower bound
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIndexBoundsCases0003', 0, (): void => {
      const safe: IndexBounds = new IndexBounds(0, 0, 0, 0).normalized();
      expect(safe.maxDays).assertEqual(1);
      expect(safe.samplesPerDay).assertEqual(1);
      expect(safe.recentValid).assertEqual(1);
      expect(safe.trendPoints).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STARTUP_INDEXBOUNDSCASES_0400
     * @tc.name      testIndexBoundsCases0004
     * @tc.desc      Verify bounds clamp to upper bound
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIndexBoundsCases0004', 0, (): void => {
      const safe: IndexBounds = new IndexBounds(5000, 900, 300, 400).normalized();
      expect(safe.maxDays).assertEqual(3660);
      expect(safe.samplesPerDay).assertEqual(500);
      expect(safe.recentValid).assertEqual(100);
      expect(safe.trendPoints).assertEqual(365);
    });

    /**
     * @tc.number    SUB_STARTUP_INDEXBOUNDSCASES_0500
     * @tc.name      testIndexBoundsCases0005
     * @tc.desc      Verify bounds non finite falls back to minimum
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIndexBoundsCases0005', 0, (): void => {
      const safe: IndexBounds = new IndexBounds(Number.NaN, Number.POSITIVE_INFINITY, 5, 5)
        .normalized();
      expect(safe.maxDays).assertEqual(1);
      expect(safe.samplesPerDay).assertEqual(1);
      expect(safe.recentValid).assertEqual(5);
    });

    /**
     * @tc.number    SUB_STARTUP_INDEXBOUNDSCASES_0600
     * @tc.name      testIndexBoundsCases0006
     * @tc.desc      Verify normalized leaves original untouched
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testIndexBoundsCases0006', 0, (): void => {
      const source: IndexBounds = new IndexBounds(0, 0, 0, 0);
      const safe: IndexBounds = source.normalized();
      expect(source.maxDays).assertEqual(0);
      expect(safe.maxDays).assertEqual(1);
      expect(safe === source).assertFalse();
    });
  });

  describe('ArchiveIndexBuildCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_0100
     * @tc.name      testArchiveIndexBuildCases0001
     * @tc.desc      Verify empty index state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0001', 0, (): void => {
      const index: ArchiveIndex = buildArchiveIndex([], new IndexBounds(), 0, D1);
      expect(index.isEmpty()).assertTrue();
      expect(index.total).assertEqual(0);
      expect(index.days.length).assertEqual(0);
      expect(index.emptyState()).assertEqual('归档为空：还没有任何归档记录');
      expect(index.caption()).assertEqual('归档为空：还没有任何归档记录');
      expect(index.notices.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_0200
     * @tc.name      testArchiveIndexBuildCases0002
     * @tc.desc      Verify empty state explains rejects
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0002', 0, (): void => {
      const invalid: ArchiveEntry = new ArchiveEntry(0, D1);
      const index: ArchiveIndex = buildArchiveIndex([invalid, new ArchiveEntry(-1, D2)]);
      expect(index.rejectedEntries).assertEqual(2);
      expect(index.emptyState()).assertEqual('归档为空：2 条记录均未通过字段校验');
      expect(index.notices[0]).assertEqual('已忽略 2 条未通过字段校验的记录');
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_0300
     * @tc.name      testArchiveIndexBuildCases0003
     * @tc.desc      Verify empty state is blank when index has data
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0003', 0, (): void => {
      const index: ArchiveIndex = buildArchiveIndex(fillDay(D1, 2, 0, 1));
      expect(index.emptyState()).assertEqual('');
      expect(index.isEmpty()).assertFalse();
      expect(index.droppedEntries).assertEqual(0);
      expect(index.caption()).assertEqual('归档索引｜1 天｜2 条｜有效 2 条');
      expect(index.caption().indexOf('窗口外')).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_0400
     * @tc.name      testArchiveIndexBuildCases0004
     * @tc.desc      Verify groups by local day newest first
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0004', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 1, 0, 1).concat(fillDay(D2, 1, 0, 10));
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(), 0);
      expect(index.days.length).assertEqual(2);
      expect(index.days[0].dayKey).assertEqual('2024-01-16');
      expect(index.days[1].dayKey).assertEqual('2024-01-15');
      expect(index.dayKeys().join(',')).assertEqual('2024-01-16,2024-01-15');
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_0500
     * @tc.name      testArchiveIndexBuildCases0005
     * @tc.desc      Verify offset regroups same timestamps
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0005', 0, (): void => {
      const lateUtc: number = D2 - 8 * 60 * 60 * 1000;
      const entry: ArchiveEntry = okAt(1, lateUtc);
      const utc: ArchiveIndex = buildArchiveIndex([entry], new IndexBounds(), 0);
      const east: ArchiveIndex = buildArchiveIndex([entry], new IndexBounds(), 480);
      expect(utc.days[0].dayKey).assertEqual('2024-01-15');
      expect(east.days[0].dayKey).assertEqual('2024-01-16');
      expect(utc.total).assertEqual(east.total);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_0600
     * @tc.name      testArchiveIndexBuildCases0006
     * @tc.desc      Verify rejected entries counted not indexed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0006', 0, (): void => {
      const bad: ArchiveEntry = okAt(1, D1);
      bad.outcome = 'blocked';
      const good: ArchiveEntry = okAt(2, D1 + 1000);
      const index: ArchiveIndex = buildArchiveIndex([bad, good]);
      expect(index.rejectedEntries).assertEqual(1);
      expect(index.total).assertEqual(1);
      expect(index.days[0].total).assertEqual(1);
      expect(index.notices[0].indexOf('已忽略 1 条') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_0700
     * @tc.name      testArchiveIndexBuildCases0007
     * @tc.desc      Verify totals and valid count
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0007', 0, (): void => {
      const entries: ArchiveEntry[] = [okAt(1, D1), failAt(2, D1 + 1000),
        timeoutAt(3, D1 + 2000)];
      const index: ArchiveIndex = buildArchiveIndex(entries);
      expect(index.total).assertEqual(3);
      expect(index.success).assertEqual(1);
      expect(index.failure).assertEqual(1);
      expect(index.timeout).assertEqual(1);
      expect(index.validCount()).assertEqual(2);
      expect(index.newestAt).assertEqual(D1 + 2000);
      expect(index.oldestAt).assertEqual(D1);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_0800
     * @tc.name      testArchiveIndexBuildCases0008
     * @tc.desc      Verify recent valid is capped
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0008', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 5, 0, 1);
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(180, 20, 2, 60));
      expect(index.recentValid.length).assertEqual(2);
      expect(index.latestValidId()).assertEqual(5);
      expect(index.recentValid[0].id).assertEqual(5);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_0900
     * @tc.name      testArchiveIndexBuildCases0009
     * @tc.desc      Verify recent valid skips unsupported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0009', 0, (): void => {
      const entries: ArchiveEntry[] = [timeoutAt(1, D1),
        entryOf(2, D1 + 1000, QueryOutcome.UNSUPPORTED, RefreshSource.MANUAL, 0),
        okAt(3, D1 + 2000)];
      const index: ArchiveIndex = buildArchiveIndex(entries);
      expect(index.recentValid.length).assertEqual(1);
      expect(index.recentValid[0].id).assertEqual(3);
      expect(index.total).assertEqual(3);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_1000
     * @tc.name      testArchiveIndexBuildCases0010
     * @tc.desc      Verify max days drops whole days
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0010', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 2, 0, 1).concat(fillDay(D2, 3, 0, 10));
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(1, 20, 10, 60));
      expect(index.days.length).assertEqual(1);
      expect(index.days[0].dayKey).assertEqual('2024-01-16');
      expect(index.total).assertEqual(3);
      expect(index.droppedEntries).assertEqual(2);
      expect(index.droppedDays).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_1100
     * @tc.name      testArchiveIndexBuildCases0011
     * @tc.desc      Verify drop notice names day count
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0011', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 1, 0, 1).concat(fillDay(D2, 1, 0, 10));
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(1, 20, 10, 60));
      expect(index.notices.some((notice: string): boolean =>
        notice.indexOf('（涉及 1 个日期）') > 0)).assertTrue();
      expect(index.notices.some((notice: string): boolean =>
        notice.indexOf('超出 1 天索引窗口') > 0)).assertTrue();
      expect(index.notices.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_1200
     * @tc.name      testArchiveIndexBuildCases0012
     * @tc.desc      Verify caption counts window outsiders
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0012', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 1, 0, 1).concat(fillDay(D2, 2, 0, 10));
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(1, 20, 10, 60));
      expect(index.caption()).assertEqual('归档索引｜1 天｜2 条｜有效 2 条｜窗口外 1 条');
      expect(index.caption().indexOf('窗口外') > 0).assertTrue();
      expect(index.caption().indexOf('2 条') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_1300
     * @tc.name      testArchiveIndexBuildCases0013
     * @tc.desc      Verify daily sample cap keeps statistics
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0013', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 25, 0, 1);
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(180, 20, 10, 60));
      expect(index.days[0].total).assertEqual(25);
      expect(index.days[0].samples.length).assertEqual(20);
      expect(index.days[0].sampleTruncated()).assertEqual(5);
      expect(index.total).assertEqual(25);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_1400
     * @tc.name      testArchiveIndexBuildCases0014
     * @tc.desc      Verify global distributions aggregate days
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0014', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 1, 1, 1).concat(fillDay(D2, 2, 0, 10));
      const index: ArchiveIndex = buildArchiveIndex(entries);
      const sources: CountEntry[] = index.sourceDistribution(false);
      expect(sources.length).assertEqual(1);
      expect(sources[0].count).assertEqual(4);
      const outcomes: CountEntry[] = index.outcomeDistribution(false);
      expect(outcomes.length).assertEqual(2);
      expect(index.outcomeCounts[0]).assertEqual(3);
      expect(index.outcomeCounts[1]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_1500
     * @tc.name      testArchiveIndexBuildCases0015
     * @tc.desc      Verify day of and missing day detail
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0015', 0, (): void => {
      const index: ArchiveIndex = buildArchiveIndex(fillDay(D1, 1, 0, 1));
      expect(index.dayOf('2024-01-15') !== undefined).assertTrue();
      expect(index.dayOf('2024-01-20') === undefined).assertTrue();
      expect(index.dayDetail('2024-01-20').found).assertFalse();
      expect(index.dayDetail('2024-01-20').text())
        .assertEqual('2024-01-20：没有该日期的记录（索引窗口 2024-01-15 至 2024-01-15）');
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_1600
     * @tc.name      testArchiveIndexBuildCases0016
     * @tc.desc      Verify day detail explains bad format
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0016', 0, (): void => {
      const index: ArchiveIndex = buildArchiveIndex(fillDay(D1, 1, 0, 1));
      const detail = index.dayDetail('2024/01/15');
      expect(detail.found).assertFalse();
      expect(detail.notice).assertEqual('日期格式应为 yyyy-MM-dd');
      expect(detail.samples.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_1700
     * @tc.name      testArchiveIndexBuildCases0017
     * @tc.desc      Verify day detail explains empty archive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0017', 0, (): void => {
      const index: ArchiveIndex = buildArchiveIndex([]);
      const detail = index.dayDetail('2024-01-15');
      expect(detail.found).assertFalse();
      expect(detail.notice).assertEqual('归档为空，尚无任何日期索引');
      expect(detail.total).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_1800
     * @tc.name      testArchiveIndexBuildCases0018
     * @tc.desc      Verify day detail returns samples and truncation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0018', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 25, 0, 1);
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(180, 20, 10, 60));
      const detail = index.dayDetail('2024-01-15');
      expect(detail.found).assertTrue();
      expect(detail.total).assertEqual(25);
      expect(detail.samples.length).assertEqual(20);
      expect(detail.truncated).assertEqual(5);
      expect(detail.notice).assertEqual('当天只保留最近 20 条样本');
      expect(detail.text().indexOf('另有 5 条仅计入统计') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_1900
     * @tc.name      testArchiveIndexBuildCases0019
     * @tc.desc      Verify match days filters by source and outcome
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0019', 0, (): void => {
      const settings: ArchiveEntry = entryOf(1, D1, QueryOutcome.SUCCESS, RefreshSource.SETTINGS, 9);
      const entries: ArchiveEntry[] = [settings].concat(fillDay(D2, 1, 0, 10));
      const index: ArchiveIndex = buildArchiveIndex(entries);
      expect(index.matchDays('', '').length).assertEqual(2);
      expect(index.matchDays(RefreshSource.SETTINGS, '').length).assertEqual(1);
      expect(index.matchDays(RefreshSource.SETTINGS, '').length === 2).assertFalse();
      expect(index.matchDays('', QueryOutcome.FAILURE).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEINDEXBUILDCASES_2000
     * @tc.name      testArchiveIndexBuildCases0020
     * @tc.desc      Verify match days accepts any source when empty
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveIndexBuildCases0020', 0, (): void => {
      const index: ArchiveIndex = buildArchiveIndex(fillDay(D1, 2, 1, 1));
      expect(index.matchDays('', '').length).assertEqual(1);
      expect(index.matchDays(RefreshSource.MANUAL, '').length).assertEqual(1);
      expect(index.matchDays(RefreshSource.INITIAL, '').length).assertEqual(0);
    });
  });

  describe('ArchiveTrendCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_ARCHIVETRENDCASES_0100
     * @tc.name      testArchiveTrendCases0001
     * @tc.desc      Verify trend of empty index
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveTrendCases0001', 0, (): void => {
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex([]));
      expect(trend.points.length).assertEqual(0);
      expect(trend.direction).assertEqual(TrendDirection.UNKNOWN);
      expect(trend.text()).assertEqual('趋势数据不足：归档为空');
      expect(trend.sampleDays).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVETRENDCASES_0200
     * @tc.name      testArchiveTrendCases0002
     * @tc.desc      Verify single valid day is unknown
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveTrendCases0002', 0, (): void => {
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(fillDay(D1, 3, 0, 1)));
      expect(trend.points.length).assertEqual(1);
      expect(trend.sampleDays).assertEqual(1);
      expect(trend.direction).assertEqual(TrendDirection.UNKNOWN);
      expect(trend.deltaRate).assertEqual(0);
      expect(trend.text()).assertEqual('趋势数据不足：只有 1 个有效样本日（至少需要 2 个）');
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVETRENDCASES_0300
     * @tc.name      testArchiveTrendCases0003
     * @tc.desc      Verify rising trend
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveTrendCases0003', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 0, 1, 1).concat(fillDay(D2, 1, 0, 10))
        .concat(fillDay(D3, 1, 0, 20));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(trend.direction).assertEqual(TrendDirection.RISING);
      expect(trend.deltaRate).assertEqual(100);
      expect(trend.sampleDays).assertEqual(3);
      expect(trend.text()).assertEqual(
        '2024-01-15 → 2024-01-17｜成功率 0% → 100%｜上升（+100 个百分点）');
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVETRENDCASES_0400
     * @tc.name      testArchiveTrendCases0004
     * @tc.desc      Verify falling trend
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveTrendCases0004', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 1, 0, 1).concat(fillDay(D2, 0, 1, 10))
        .concat(fillDay(D3, 0, 1, 20));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(trend.direction).assertEqual(TrendDirection.FALLING);
      expect(trend.deltaRate).assertEqual(-100);
      expect(trend.text().indexOf('下降（-100 个百分点）') > 0).assertTrue();
      expect(trend.text().indexOf('+') === -1).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVETRENDCASES_0500
     * @tc.name      testArchiveTrendCases0005
     * @tc.desc      Verify ten point gap counts as stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveTrendCases0005', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 9, 1, 1).concat(fillDay(D2, 1, 0, 10));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(trend.deltaRate).assertEqual(10);
      expect(trend.direction).assertEqual(TrendDirection.STABLE);
      expect(trend.text()).assertEqual(
        '2024-01-15 → 2024-01-16｜成功率 90% → 100%｜基本持平（+10 个百分点）');
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVETRENDCASES_0600
     * @tc.name      testArchiveTrendCases0006
     * @tc.desc      Verify delta uses two halves
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveTrendCases0006', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 1, 1, 1).concat(fillDay(D2, 3, 1, 10));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(trend.points[0].successRate).assertEqual(50);
      expect(trend.points[1].successRate).assertEqual(75);
      expect(trend.deltaRate).assertEqual(25);
      expect(trend.direction).assertEqual(TrendDirection.RISING);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVETRENDCASES_0700
     * @tc.name      testArchiveTrendCases0007
     * @tc.desc      Verify days without valid samples ignored
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveTrendCases0007', 0, (): void => {
      const entries: ArchiveEntry[] = [timeoutAt(1, D1)].concat(fillDay(D2, 1, 0, 10))
        .concat(fillDay(D3, 1, 0, 20));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(trend.points.length).assertEqual(3);
      expect(trend.sampleDays).assertEqual(2);
      expect(trend.direction).assertEqual(TrendDirection.STABLE);
      expect(trend.deltaRate).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVETRENDCASES_0800
     * @tc.name      testArchiveTrendCases0008
     * @tc.desc      Verify only invalid sample days stays unknown
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveTrendCases0008', 0, (): void => {
      const entries: ArchiveEntry[] = [timeoutAt(1, D1), timeoutAt(2, D2)];
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(trend.points.length).assertEqual(2);
      expect(trend.sampleDays).assertEqual(0);
      expect(trend.direction).assertEqual(TrendDirection.UNKNOWN);
      expect(trend.text().indexOf('只有 0 个有效样本日') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVETRENDCASES_0900
     * @tc.name      testArchiveTrendCases0009
     * @tc.desc      Verify trend points are limited
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveTrendCases0009', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 1, 0, 1).concat(fillDay(D2, 1, 0, 10))
        .concat(fillDay(D3, 1, 0, 20));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries, new IndexBounds(180, 20, 10,
        2)));
      expect(trend.points.length).assertEqual(2);
      expect(trend.points[0].dayKey).assertEqual('2024-01-16');
      expect(trend.points[1].dayKey).assertEqual('2024-01-17');
      expect(trend.sampleDays).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVETRENDCASES_1000
     * @tc.name      testArchiveTrendCases0010
     * @tc.desc      Verify points ascend by day
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveTrendCases0010', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 1, 0, 1).concat(fillDay(D3, 1, 0, 20));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(trend.points[0].dayKey).assertEqual('2024-01-15');
      expect(trend.points[1].dayKey).assertEqual('2024-01-17');
      expect(trend.points.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVETRENDCASES_1100
     * @tc.name      testArchiveTrendCases0011
     * @tc.desc      Verify trend point carries counts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchiveTrendCases0011', 0, (): void => {
      const entries: ArchiveEntry[] = fillDay(D1, 2, 1, 1);
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      const point: TrendPoint = trend.points[0];
      expect(point.total).assertEqual(3);
      expect(point.valid).assertEqual(3);
      expect(point.failure).assertEqual(1);
      expect(point.successRate).assertEqual(66.7);
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVETRENDCASES_1200
     * @tc.name      testArchiveTrendCases0012
     * @tc.desc      Verify trend direction labels
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testArchiveTrendCases0012', 0, (): void => {
      expect(trendDirectionLabel(TrendDirection.RISING)).assertEqual('上升');
      expect(trendDirectionLabel(TrendDirection.FALLING)).assertEqual('下降');
      expect(trendDirectionLabel(TrendDirection.STABLE)).assertEqual('基本持平');
      expect(trendDirectionLabel(TrendDirection.UNKNOWN)).assertEqual('数据不足');
    });
  });
}
