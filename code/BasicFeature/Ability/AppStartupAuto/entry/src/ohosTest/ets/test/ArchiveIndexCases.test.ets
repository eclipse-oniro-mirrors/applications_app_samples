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
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
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
  configureTestText();
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
      configureTestText();
      const entry: ArchiveEntry = new ArchiveEntry();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0001|ArchiveIndexCases.test.ets|assert0001|assertEqual|actual', entry.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0001|ArchiveIndexCases.test.ets|assert0001|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0001|ArchiveIndexCases.test.ets|assert0002|assertEqual|actual', entry.timestamp)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0001|ArchiveIndexCases.test.ets|assert0002|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0001|ArchiveIndexCases.test.ets|assert0003|assertFalse|actual|expected=false', entry.isValid())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0001|ArchiveIndexCases.test.ets|assert0004|assertEqual|actual', entry.note)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0001|ArchiveIndexCases.test.ets|assert0004|assertEqual|expected', ''));
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
      configureTestText();
      const entry: ArchiveEntry = okAt(1, D1);
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0002|ArchiveIndexCases.test.ets|assert0005|assertTrue|actual|expected=true', entry.isValid())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0002|ArchiveIndexCases.test.ets|assert0006|assertEqual|actual', entry.source)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0002|ArchiveIndexCases.test.ets|assert0006|assertEqual|expected', RefreshSource.MANUAL));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0002|ArchiveIndexCases.test.ets|assert0007|assertEqual|actual', entry.durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0002|ArchiveIndexCases.test.ets|assert0007|assertEqual|expected', 120));
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0003|ArchiveIndexCases.test.ets|assert0008|assertFalse|actual|expected=false', entryOf(0, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0003|ArchiveIndexCases.test.ets|assert0009|assertFalse|actual|expected=false', entryOf(-1, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0003|ArchiveIndexCases.test.ets|assert0010|assertFalse|actual|expected=false', entryOf(1.5, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0003|ArchiveIndexCases.test.ets|assert0011|assertTrue|actual|expected=true', entryOf(1, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid())).assertTrue();
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0004|ArchiveIndexCases.test.ets|assert0012|assertFalse|actual|expected=false', entryOf(1, 0, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0004|ArchiveIndexCases.test.ets|assert0013|assertFalse|actual|expected=false', entryOf(1, -5, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0004|ArchiveIndexCases.test.ets|assert0014|assertTrue|actual|expected=true', entryOf(1, 1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 1).isValid())).assertTrue();
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0005|ArchiveIndexCases.test.ets|assert0015|assertTrue|actual|expected=true', entryOf(1, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, 0).isValid())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0005|ArchiveIndexCases.test.ets|assert0016|assertFalse|actual|expected=false', entryOf(1, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, -1).isValid())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0005|ArchiveIndexCases.test.ets|assert0017|assertFalse|actual|expected=false', entryOf(1, D1, QueryOutcome.SUCCESS, RefreshSource.MANUAL, Number.NaN).isValid()))
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0006|ArchiveIndexCases.test.ets|assert0018|assertTrue|actual|expected=true', isKnownSource(RefreshSource.SETTINGS))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0006|ArchiveIndexCases.test.ets|assert0019|assertFalse|actual|expected=false', isKnownSource('未知来源'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0006|ArchiveIndexCases.test.ets|assert0020|assertFalse|actual|expected=false', isKnownSource(''))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0006|ArchiveIndexCases.test.ets|assert0021|assertEqual|actual', ARCHIVE_SOURCES.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0006|ArchiveIndexCases.test.ets|assert0021|assertEqual|expected', 4));
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0007|ArchiveIndexCases.test.ets|assert0022|assertTrue|actual|expected=true', isKnownOutcome(QueryOutcome.TIMEOUT))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0007|ArchiveIndexCases.test.ets|assert0023|assertFalse|actual|expected=false', isKnownOutcome('blocked'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0007|ArchiveIndexCases.test.ets|assert0024|assertEqual|actual', ARCHIVE_OUTCOMES.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0007|ArchiveIndexCases.test.ets|assert0024|assertEqual|expected', 5));
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
      configureTestText();
      const ok: ArchiveEntry = okAt(1, D1);
      ok.result = 'a'.repeat(ENTRY_TEXT_LIMIT);
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0008|ArchiveIndexCases.test.ets|assert0025|assertTrue|actual|expected=true', ok.isValid())).assertTrue();
      ok.result = 'a'.repeat(ENTRY_TEXT_LIMIT + 1);
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0008|ArchiveIndexCases.test.ets|assert0026|assertFalse|actual|expected=false', ok.isValid())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0008|ArchiveIndexCases.test.ets|assert0027|assertEqual|actual', ENTRY_CODE_LIMIT)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0008|ArchiveIndexCases.test.ets|assert0027|assertEqual|expected', 64));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0008|ArchiveIndexCases.test.ets|assert0028|assertEqual|actual', ENTRY_MESSAGE_LIMIT)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0008|ArchiveIndexCases.test.ets|assert0028|assertEqual|expected', 512));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0008|ArchiveIndexCases.test.ets|assert0029|assertEqual|actual', ENTRY_NOTE_LIMIT)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0008|ArchiveIndexCases.test.ets|assert0029|assertEqual|expected', 192));
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
      configureTestText();
      const entry: ArchiveEntry = okAt(1, D1);
      entry.note = 'n'.repeat(ENTRY_NOTE_LIMIT);
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0009|ArchiveIndexCases.test.ets|assert0030|assertTrue|actual|expected=true', entry.isValid())).assertTrue();
      entry.note = 'n'.repeat(ENTRY_NOTE_LIMIT + 1);
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0009|ArchiveIndexCases.test.ets|assert0031|assertFalse|actual|expected=false', entry.isValid())).assertFalse();
      entry.note = '';
      entry.errorCode = 'c'.repeat(ENTRY_CODE_LIMIT + 1);
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0009|ArchiveIndexCases.test.ets|assert0032|assertFalse|actual|expected=false', entry.isValid())).assertFalse();
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0010|ArchiveIndexCases.test.ets|assert0033|assertTrue|actual|expected=true', okAt(1, D1).isValidSample())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0010|ArchiveIndexCases.test.ets|assert0034|assertTrue|actual|expected=true', failAt(1, D1).isValidSample())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0010|ArchiveIndexCases.test.ets|assert0035|assertFalse|actual|expected=false', timeoutAt(1, D1).isValidSample())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0010|ArchiveIndexCases.test.ets|assert0036|assertFalse|actual|expected=false', entryOf(1, D1, QueryOutcome.UNSUPPORTED, RefreshSource.MANUAL, 1).isValidSample()))
        .assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0010|ArchiveIndexCases.test.ets|assert0037|assertFalse|actual|expected=false', entryOf(1, D1, QueryOutcome.UNKNOWN, RefreshSource.MANUAL, 1).isValidSample()))
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
      configureTestText();
      const entry: ArchiveEntry = okAt(1, D1);
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0011|ArchiveIndexCases.test.ets|assert0038|assertFalse|actual|expected=false', entry.hasError())).assertFalse();
      entry.errorCode = 'E1';
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0011|ArchiveIndexCases.test.ets|assert0039|assertTrue|actual|expected=true', entry.hasError())).assertTrue();
      entry.errorCode = '';
      entry.errorMessage = '失败原因';
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0011|ArchiveIndexCases.test.ets|assert0040|assertTrue|actual|expected=true', entry.hasError())).assertTrue();
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
      configureTestText();
      const entry: ArchiveEntry = okAt(1, D1);
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0012|ArchiveIndexCases.test.ets|assert0041|assertEqual|actual', entry.ageDaysAt(D1 + DAY_MS - 1))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0012|ArchiveIndexCases.test.ets|assert0041|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0012|ArchiveIndexCases.test.ets|assert0042|assertEqual|actual', entry.ageDaysAt(D1 + DAY_MS))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0012|ArchiveIndexCases.test.ets|assert0042|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0012|ArchiveIndexCases.test.ets|assert0043|assertEqual|actual', entry.ageDaysAt(D1 + 3 * DAY_MS + 5))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0012|ArchiveIndexCases.test.ets|assert0043|assertEqual|expected', 3));
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
      configureTestText();
      const entry: ArchiveEntry = okAt(1, D1);
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0013|ArchiveIndexCases.test.ets|assert0044|assertEqual|actual', entry.ageDaysAt(0))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0013|ArchiveIndexCases.test.ets|assert0044|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0013|ArchiveIndexCases.test.ets|assert0045|assertEqual|actual', entry.ageDaysAt(-1))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0013|ArchiveIndexCases.test.ets|assert0045|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0013|ArchiveIndexCases.test.ets|assert0046|assertEqual|actual', entry.ageDaysAt(D1 - DAY_MS))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0013|ArchiveIndexCases.test.ets|assert0046|assertEqual|expected', 0));
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
      configureTestText();
      const entry: ArchiveEntry = okAt(7, D1);
      entry.note = '原始备注';
      const copy: ArchiveEntry = entry.clone();
      copy.id = 99;
      copy.note = '改过';
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0014|ArchiveIndexCases.test.ets|assert0047|assertEqual|actual', entry.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0014|ArchiveIndexCases.test.ets|assert0047|assertEqual|expected', 7));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0014|ArchiveIndexCases.test.ets|assert0048|assertEqual|actual', entry.note)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0014|ArchiveIndexCases.test.ets|assert0048|assertEqual|expected', '原始备注'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0014|ArchiveIndexCases.test.ets|assert0049|assertEqual|actual', copy.timestamp)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0014|ArchiveIndexCases.test.ets|assert0049|assertEqual|expected', entry.timestamp));
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0015|ArchiveIndexCases.test.ets|assert0050|assertEqual|actual', okAt(1, D1).dayKey(0))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0015|ArchiveIndexCases.test.ets|assert0050|assertEqual|expected', '2024-01-15'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0015|ArchiveIndexCases.test.ets|assert0051|assertEqual|actual', okAt(1, D2).dayKey(0))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0015|ArchiveIndexCases.test.ets|assert0051|assertEqual|expected', '2024-01-16'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0015|ArchiveIndexCases.test.ets|assert0052|assertFalse|actual|expected=false', okAt(1, D1).dayKey(0) === okAt(1, D2).dayKey(0))).assertFalse();
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
      configureTestText();
      const record: QueryRecord = new QueryRecord();
      record.id = 5;
      record.timestamp = D1;
      record.source = RefreshSource.SETTINGS;
      record.outcome = QueryOutcome.SUCCESS;
      record.result = '已开启';
      record.durationMillis = 88;
      const entry: ArchiveEntry = archiveEntryOf(record);
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0016|ArchiveIndexCases.test.ets|assert0053|assertEqual|actual', entry.id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0016|ArchiveIndexCases.test.ets|assert0053|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0016|ArchiveIndexCases.test.ets|assert0054|assertEqual|actual', entry.source)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0016|ArchiveIndexCases.test.ets|assert0054|assertEqual|expected', RefreshSource.SETTINGS));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0016|ArchiveIndexCases.test.ets|assert0055|assertEqual|actual', entry.durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0016|ArchiveIndexCases.test.ets|assert0055|assertEqual|expected', 88));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0016|ArchiveIndexCases.test.ets|assert0056|assertEqual|actual', entry.note)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0016|ArchiveIndexCases.test.ets|assert0056|assertEqual|expected', ''));
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
      configureTestText();
      const bad: QueryRecord = new QueryRecord();
      bad.id = 0;
      const good: QueryRecord = new QueryRecord();
      good.id = 2;
      good.timestamp = D1;
      const entries: ArchiveEntry[] = archiveEntriesOf([bad, good]);
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0017|ArchiveIndexCases.test.ets|assert0057|assertEqual|actual', entries.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0017|ArchiveIndexCases.test.ets|assert0057|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0017|ArchiveIndexCases.test.ets|assert0058|assertEqual|actual', entries[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0017|ArchiveIndexCases.test.ets|assert0058|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0017|ArchiveIndexCases.test.ets|assert0059|assertEqual|actual', entries[0].timestamp)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveEntryCases_0017|ArchiveIndexCases.test.ets|assert0059|assertEqual|expected', D1));
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0001|ArchiveIndexCases.test.ets|assert0060|assertEqual|actual', dayKeyOf(D1, 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0001|ArchiveIndexCases.test.ets|assert0060|assertEqual|expected', '2024-01-15'));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0001|ArchiveIndexCases.test.ets|assert0061|assertEqual|actual', dayKeyOf(D2, 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0001|ArchiveIndexCases.test.ets|assert0061|assertEqual|expected', '2024-01-16'));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0001|ArchiveIndexCases.test.ets|assert0062|assertEqual|actual', dayKeyOf(D1, 0).length)).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0001|ArchiveIndexCases.test.ets|assert0062|assertEqual|expected', 10));
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
      configureTestText();
      const lateUtc: number = D1 - 8 * 60 * 60 * 1000;
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0002|ArchiveIndexCases.test.ets|assert0063|assertEqual|actual', dayKeyOf(lateUtc, 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0002|ArchiveIndexCases.test.ets|assert0063|assertEqual|expected', '2024-01-14'));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0002|ArchiveIndexCases.test.ets|assert0064|assertEqual|actual', dayKeyOf(lateUtc, 480))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0002|ArchiveIndexCases.test.ets|assert0064|assertEqual|expected', '2024-01-15'));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0002|ArchiveIndexCases.test.ets|assert0065|assertFalse|actual|expected=false', dayKeyOf(lateUtc, 0) === dayKeyOf(lateUtc, 480))).assertFalse();
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0003|ArchiveIndexCases.test.ets|assert0066|assertEqual|actual', dayKeyOf(D1, Number.NaN))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0003|ArchiveIndexCases.test.ets|assert0066|assertEqual|expected', dayKeyOf(D1, 0)));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0003|ArchiveIndexCases.test.ets|assert0067|assertEqual|actual', dayKeyOf(D1, Number.POSITIVE_INFINITY))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0003|ArchiveIndexCases.test.ets|assert0067|assertEqual|expected', dayKeyOf(D1, 0)));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0003|ArchiveIndexCases.test.ets|assert0068|assertEqual|actual', dayKeyOf(D1, 5))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0003|ArchiveIndexCases.test.ets|assert0068|assertEqual|expected', dayKeyOf(D1, 0)));
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0004|ArchiveIndexCases.test.ets|assert0069|assertEqual|actual', dayKeyOf(0, 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0004|ArchiveIndexCases.test.ets|assert0069|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0004|ArchiveIndexCases.test.ets|assert0070|assertEqual|actual', dayKeyOf(-1, 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0004|ArchiveIndexCases.test.ets|assert0070|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0004|ArchiveIndexCases.test.ets|assert0071|assertEqual|actual', dayKeyOf(Number.NaN, 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0004|ArchiveIndexCases.test.ets|assert0071|assertEqual|expected', ''));
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0005|ArchiveIndexCases.test.ets|assert0072|assertEqual|actual', pad2(0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0005|ArchiveIndexCases.test.ets|assert0072|assertEqual|expected', '00'));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0005|ArchiveIndexCases.test.ets|assert0073|assertEqual|actual', pad2(9))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0005|ArchiveIndexCases.test.ets|assert0073|assertEqual|expected', '09'));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0005|ArchiveIndexCases.test.ets|assert0074|assertEqual|actual', pad2(10))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0005|ArchiveIndexCases.test.ets|assert0074|assertEqual|expected', '10'));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0005|ArchiveIndexCases.test.ets|assert0075|assertEqual|actual', pad2(59))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0005|ArchiveIndexCases.test.ets|assert0075|assertEqual|expected', '59'));
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0006|ArchiveIndexCases.test.ets|assert0076|assertEqual|actual', dayStartMillis('2024-01-15', 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0006|ArchiveIndexCases.test.ets|assert0076|assertEqual|expected', D1));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0006|ArchiveIndexCases.test.ets|assert0077|assertEqual|actual', dayStartMillis('2024-01-16', 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0006|ArchiveIndexCases.test.ets|assert0077|assertEqual|expected', D2));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0006|ArchiveIndexCases.test.ets|assert0078|assertTrue|actual|expected=true', isDayKey('2024-01-15'))).assertTrue();
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0007|ArchiveIndexCases.test.ets|assert0079|assertEqual|actual', dayStartMillis('2026-02-31', 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0007|ArchiveIndexCases.test.ets|assert0079|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0007|ArchiveIndexCases.test.ets|assert0080|assertFalse|actual|expected=false', isDayKey('2026-02-31'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0007|ArchiveIndexCases.test.ets|assert0081|assertFalse|actual|expected=false', isDayKey('2023-02-29'))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0007|ArchiveIndexCases.test.ets|assert0082|assertTrue|actual|expected=true', isDayKey('2024-02-29'))).assertTrue();
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0008|ArchiveIndexCases.test.ets|assert0083|assertEqual|actual', dayStartMillis('2024-1-15', 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0008|ArchiveIndexCases.test.ets|assert0083|assertEqual|expected', D1));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0008|ArchiveIndexCases.test.ets|assert0084|assertTrue|actual|expected=true', isDayKey('2024-1-15'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0008|ArchiveIndexCases.test.ets|assert0085|assertEqual|actual', dayStartMillis('2024/01/15', 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0008|ArchiveIndexCases.test.ets|assert0085|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0008|ArchiveIndexCases.test.ets|assert0086|assertEqual|actual', dayStartMillis('', 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0008|ArchiveIndexCases.test.ets|assert0086|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0008|ArchiveIndexCases.test.ets|assert0087|assertFalse|actual|expected=false', isDayKey(''))).assertFalse();
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0009|ArchiveIndexCases.test.ets|assert0088|assertEqual|actual', dayEndMillis('2024-01-15', 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0009|ArchiveIndexCases.test.ets|assert0088|assertEqual|expected', D1 + DAY_MS - 1));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0009|ArchiveIndexCases.test.ets|assert0089|assertEqual|actual', dayEndMillis('2024-01-15', 0) - dayStartMillis('2024-01-15', 0)))
        .assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0009|ArchiveIndexCases.test.ets|assert0089|assertEqual|expected', DAY_MS - 1));
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0009|ArchiveIndexCases.test.ets|assert0090|assertEqual|actual', dayEndMillis('2026-02-31', 0))).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0009|ArchiveIndexCases.test.ets|assert0090|assertEqual|expected', 0));
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
      configureTestText();
      const offset: number = localOffsetMinutes(D1);
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0010|ArchiveIndexCases.test.ets|assert0091|assertTrue|actual|expected=true', Number.isFinite(offset))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0010|ArchiveIndexCases.test.ets|assert0092|assertTrue|actual|expected=true', offset >= -840 && offset <= 840)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_DayKeyCases_0010|ArchiveIndexCases.test.ets|assert0093|assertEqual|actual', offset)).assertEqual(traceParameter('com.samples.appstartupauto_DayKeyCases_0010|ArchiveIndexCases.test.ets|assert0093|assertEqual|expected', localOffsetMinutes(0)));
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
      configureTestText();
      const list = distributionOf(['a', 'b'], [3, 0]);
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0001|ArchiveIndexCases.test.ets|assert0094|assertEqual|actual', list.length)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0001|ArchiveIndexCases.test.ets|assert0094|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0001|ArchiveIndexCases.test.ets|assert0095|assertEqual|actual', list[0].count)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0001|ArchiveIndexCases.test.ets|assert0095|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0001|ArchiveIndexCases.test.ets|assert0096|assertEqual|actual', list[1].count)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0001|ArchiveIndexCases.test.ets|assert0096|assertEqual|expected', 0));
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
      configureTestText();
      const list = distributionOf(['a', 'b', 'c'], [0, 2, 0], false);
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0002|ArchiveIndexCases.test.ets|assert0097|assertEqual|actual', list.length)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0002|ArchiveIndexCases.test.ets|assert0097|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0002|ArchiveIndexCases.test.ets|assert0098|assertEqual|actual', list[0].label)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0002|ArchiveIndexCases.test.ets|assert0098|assertEqual|expected', 'b'));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0002|ArchiveIndexCases.test.ets|assert0099|assertFalse|actual|expected=false', list[0].label === 'a')).assertFalse();
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
      configureTestText();
      const list = distributionOf(['a', 'b', 'c'], [1]);
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0003|ArchiveIndexCases.test.ets|assert0100|assertEqual|actual', list.length)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0003|ArchiveIndexCases.test.ets|assert0100|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0003|ArchiveIndexCases.test.ets|assert0101|assertEqual|actual', list[1].count)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0003|ArchiveIndexCases.test.ets|assert0101|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0003|ArchiveIndexCases.test.ets|assert0102|assertEqual|actual', list[2].count)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0003|ArchiveIndexCases.test.ets|assert0102|assertEqual|expected', 0));
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
      configureTestText();
      const list = distributionOf(['a', 'b', 'c'], [-5, Number.NaN, 4]);
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0004|ArchiveIndexCases.test.ets|assert0103|assertEqual|actual', list[0].count)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0004|ArchiveIndexCases.test.ets|assert0103|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0004|ArchiveIndexCases.test.ets|assert0104|assertEqual|actual', list[1].count)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0004|ArchiveIndexCases.test.ets|assert0104|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0004|ArchiveIndexCases.test.ets|assert0105|assertEqual|actual', list[2].count)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0004|ArchiveIndexCases.test.ets|assert0105|assertEqual|expected', 4));
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
      configureTestText();
      const list = sortedDistribution(['a', 'b', 'c'], [1, 5, 3]);
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0005|ArchiveIndexCases.test.ets|assert0106|assertEqual|actual', list.length)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0005|ArchiveIndexCases.test.ets|assert0106|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0005|ArchiveIndexCases.test.ets|assert0107|assertEqual|actual', list[0].label)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0005|ArchiveIndexCases.test.ets|assert0107|assertEqual|expected', 'b'));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0005|ArchiveIndexCases.test.ets|assert0108|assertEqual|actual', list[1].label)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0005|ArchiveIndexCases.test.ets|assert0108|assertEqual|expected', 'c'));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0005|ArchiveIndexCases.test.ets|assert0109|assertEqual|actual', list[2].label)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0005|ArchiveIndexCases.test.ets|assert0109|assertEqual|expected', 'a'));
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
      configureTestText();
      const list = sortedDistribution(['z', 'a'], [2, 2]);
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0006|ArchiveIndexCases.test.ets|assert0110|assertEqual|actual', list[0].label)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0006|ArchiveIndexCases.test.ets|assert0110|assertEqual|expected', 'a'));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0006|ArchiveIndexCases.test.ets|assert0111|assertEqual|actual', list[1].label)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0006|ArchiveIndexCases.test.ets|assert0111|assertEqual|expected', 'z'));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0006|ArchiveIndexCases.test.ets|assert0112|assertEqual|actual', list.length)).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0006|ArchiveIndexCases.test.ets|assert0112|assertEqual|expected', 2));
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0007|ArchiveIndexCases.test.ets|assert0113|assertEqual|actual', archiveOutcomeLabel(QueryOutcome.SUCCESS))).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0007|ArchiveIndexCases.test.ets|assert0113|assertEqual|expected', '成功'));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0007|ArchiveIndexCases.test.ets|assert0114|assertEqual|actual', archiveOutcomeLabel(QueryOutcome.TIMEOUT))).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0007|ArchiveIndexCases.test.ets|assert0114|assertEqual|expected', '超时'));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0007|ArchiveIndexCases.test.ets|assert0115|assertEqual|actual', archiveOutcomeLabel('blocked'))).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0007|ArchiveIndexCases.test.ets|assert0115|assertEqual|expected', '未知'));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0007|ArchiveIndexCases.test.ets|assert0116|assertEqual|actual', archiveSourceLabel(RefreshSource.INITIAL))).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0007|ArchiveIndexCases.test.ets|assert0116|assertEqual|expected', '首次进入'));
      expect(traceParameter('com.samples.appstartupauto_DistributionCases_0007|ArchiveIndexCases.test.ets|assert0117|assertEqual|actual', archiveSourceLabel('other'))).assertEqual(traceParameter('com.samples.appstartupauto_DistributionCases_0007|ArchiveIndexCases.test.ets|assert0117|assertEqual|expected', '未标注'));
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 3);
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0001|ArchiveIndexCases.test.ets|assert0118|assertEqual|actual', day.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0001|ArchiveIndexCases.test.ets|assert0118|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0001|ArchiveIndexCases.test.ets|assert0119|assertEqual|actual', day.valid())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0001|ArchiveIndexCases.test.ets|assert0119|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0001|ArchiveIndexCases.test.ets|assert0120|assertEqual|actual', day.samples.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0001|ArchiveIndexCases.test.ets|assert0120|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0001|ArchiveIndexCases.test.ets|assert0121|assertEqual|actual', day.sourceCounts.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0001|ArchiveIndexCases.test.ets|assert0121|assertEqual|expected', ARCHIVE_SOURCES.length));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0001|ArchiveIndexCases.test.ets|assert0122|assertEqual|actual', day.latestValidId)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0001|ArchiveIndexCases.test.ets|assert0122|assertEqual|expected', -1));
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', -4);
      day.add(okAt(1, D1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0002|ArchiveIndexCases.test.ets|assert0123|assertEqual|actual', day.sampleLimit)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0002|ArchiveIndexCases.test.ets|assert0123|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0002|ArchiveIndexCases.test.ets|assert0124|assertEqual|actual', day.samples.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0002|ArchiveIndexCases.test.ets|assert0124|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0002|ArchiveIndexCases.test.ets|assert0125|assertEqual|actual', day.sampleTruncated())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0002|ArchiveIndexCases.test.ets|assert0125|assertEqual|expected', 1));
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1));
      day.add(okAt(2, D1 + 1000));
      day.add(failAt(3, D1 + 2000));
      day.add(timeoutAt(4, D1 + 3000));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0003|ArchiveIndexCases.test.ets|assert0126|assertEqual|actual', day.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0003|ArchiveIndexCases.test.ets|assert0126|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0003|ArchiveIndexCases.test.ets|assert0127|assertEqual|actual', day.success)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0003|ArchiveIndexCases.test.ets|assert0127|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0003|ArchiveIndexCases.test.ets|assert0128|assertEqual|actual', day.failure)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0003|ArchiveIndexCases.test.ets|assert0128|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0003|ArchiveIndexCases.test.ets|assert0129|assertEqual|actual', day.timeout)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0003|ArchiveIndexCases.test.ets|assert0129|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0003|ArchiveIndexCases.test.ets|assert0130|assertEqual|actual', day.valid())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0003|ArchiveIndexCases.test.ets|assert0130|assertEqual|expected', 3));
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1));
      day.add(failAt(2, D1 + 1000));
      day.add(failAt(3, D1 + 2000));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0004|ArchiveIndexCases.test.ets|assert0131|assertEqual|actual', day.successRate())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0004|ArchiveIndexCases.test.ets|assert0131|assertEqual|expected', 33.3));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0004|ArchiveIndexCases.test.ets|assert0132|assertTrue|actual|expected=true', day.successRate() < 33.4)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0004|ArchiveIndexCases.test.ets|assert0133|assertEqual|actual', day.valid())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0004|ArchiveIndexCases.test.ets|assert0133|assertEqual|expected', 3));
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(timeoutAt(1, D1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0005|ArchiveIndexCases.test.ets|assert0134|assertEqual|actual', day.valid())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0005|ArchiveIndexCases.test.ets|assert0134|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0005|ArchiveIndexCases.test.ets|assert0135|assertEqual|actual', day.successRate())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0005|ArchiveIndexCases.test.ets|assert0135|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0005|ArchiveIndexCases.test.ets|assert0136|assertEqual|actual', day.latestValidId)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0005|ArchiveIndexCases.test.ets|assert0136|assertEqual|expected', -1));
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0006|ArchiveIndexCases.test.ets|assert0137|assertEqual|actual', day.successRate())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0006|ArchiveIndexCases.test.ets|assert0137|assertEqual|expected', 100));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0006|ArchiveIndexCases.test.ets|assert0138|assertFalse|actual|expected=false', day.successRate() === 99.9)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0006|ArchiveIndexCases.test.ets|assert0139|assertEqual|actual', day.valid())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0006|ArchiveIndexCases.test.ets|assert0139|assertEqual|expected', 1));
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1));
      day.add(entryOf(2, D1 + 1, QueryOutcome.SUCCESS, RefreshSource.SETTINGS, 5));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0007|ArchiveIndexCases.test.ets|assert0140|assertEqual|actual', day.sourceCount(RefreshSource.MANUAL))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0007|ArchiveIndexCases.test.ets|assert0140|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0007|ArchiveIndexCases.test.ets|assert0141|assertEqual|actual', day.sourceCount(RefreshSource.SETTINGS))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0007|ArchiveIndexCases.test.ets|assert0141|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0007|ArchiveIndexCases.test.ets|assert0142|assertEqual|actual', day.sourceCount('other'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0007|ArchiveIndexCases.test.ets|assert0142|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0007|ArchiveIndexCases.test.ets|assert0143|assertEqual|actual', day.outcomeCount(QueryOutcome.SUCCESS))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0007|ArchiveIndexCases.test.ets|assert0143|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0007|ArchiveIndexCases.test.ets|assert0144|assertEqual|actual', day.outcomeCount('blocked'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0007|ArchiveIndexCases.test.ets|assert0144|assertEqual|expected', 0));
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 2);
      day.add(okAt(1, D1));
      day.add(okAt(2, D1 + 1000));
      day.add(okAt(3, D1 + 2000));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0008|ArchiveIndexCases.test.ets|assert0145|assertEqual|actual', day.samples.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0008|ArchiveIndexCases.test.ets|assert0145|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0008|ArchiveIndexCases.test.ets|assert0146|assertEqual|actual', day.sampleTruncated())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0008|ArchiveIndexCases.test.ets|assert0146|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0008|ArchiveIndexCases.test.ets|assert0147|assertEqual|actual', day.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0008|ArchiveIndexCases.test.ets|assert0147|assertEqual|expected', 3));
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 5);
      const source: ArchiveEntry = okAt(1, D1);
      day.add(source);
      source.note = '外部改写';
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0009|ArchiveIndexCases.test.ets|assert0148|assertEqual|actual', day.samples[0].note)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0009|ArchiveIndexCases.test.ets|assert0148|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0009|ArchiveIndexCases.test.ets|assert0149|assertEqual|actual', day.samples[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0009|ArchiveIndexCases.test.ets|assert0149|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0009|ArchiveIndexCases.test.ets|assert0150|assertEqual|actual', day.samples.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0009|ArchiveIndexCases.test.ets|assert0150|assertEqual|expected', 1));
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(timeoutAt(1, D1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0010|ArchiveIndexCases.test.ets|assert0151|assertEqual|actual', day.latestValidId)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0010|ArchiveIndexCases.test.ets|assert0151|assertEqual|expected', -1));
      day.add(okAt(2, D1 + 1000));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0010|ArchiveIndexCases.test.ets|assert0152|assertEqual|actual', day.latestValidId)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0010|ArchiveIndexCases.test.ets|assert0152|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0010|ArchiveIndexCases.test.ets|assert0153|assertEqual|actual', day.valid())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0010|ArchiveIndexCases.test.ets|assert0153|assertEqual|expected', 1));
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(5, D1));
      day.add(okAt(9, D1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0011|ArchiveIndexCases.test.ets|assert0154|assertEqual|actual', day.latestValidAt)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0011|ArchiveIndexCases.test.ets|assert0154|assertEqual|expected', D1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0011|ArchiveIndexCases.test.ets|assert0155|assertEqual|actual', day.latestValidId)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0011|ArchiveIndexCases.test.ets|assert0155|assertEqual|expected', 9));
      day.add(okAt(7, D1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0011|ArchiveIndexCases.test.ets|assert0156|assertEqual|actual', day.latestValidId)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0011|ArchiveIndexCases.test.ets|assert0156|assertEqual|expected', 9));
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1 + 5000));
      day.add(okAt(2, D1 + 1000));
      day.add(okAt(3, D1 + 9000));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0012|ArchiveIndexCases.test.ets|assert0157|assertEqual|actual', day.firstAt)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0012|ArchiveIndexCases.test.ets|assert0157|assertEqual|expected', D1 + 1000));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0012|ArchiveIndexCases.test.ets|assert0158|assertEqual|actual', day.lastAt)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0012|ArchiveIndexCases.test.ets|assert0158|assertEqual|expected', D1 + 9000));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0012|ArchiveIndexCases.test.ets|assert0159|assertTrue|actual|expected=true', day.firstAt < day.lastAt)).assertTrue();
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1));
      day.add(failAt(2, D1 + 1000));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0013|ArchiveIndexCases.test.ets|assert0160|assertEqual|actual', day.summaryText())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0013|ArchiveIndexCases.test.ets|assert0160|assertEqual|expected', '2024-01-15：共 2 条（有效 2），成功率 50%'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0013|ArchiveIndexCases.test.ets|assert0161|assertEqual|actual', day.valid())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0013|ArchiveIndexCases.test.ets|assert0161|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0013|ArchiveIndexCases.test.ets|assert0162|assertTrue|actual|expected=true', day.summaryText().indexOf('50%') > 0)).assertTrue();
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 1);
      day.add(okAt(1, D1));
      day.add(okAt(2, D1 + 1000));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0014|ArchiveIndexCases.test.ets|assert0163|assertEqual|actual', day.summaryText())).assertEqual(
        traceParameter('com.samples.appstartupauto_ArchiveDayCases_0014|ArchiveIndexCases.test.ets|assert0163|assertEqual|expected', '2024-01-15：共 2 条（有效 2），成功率 100%；另有 1 条仅计入统计'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0014|ArchiveIndexCases.test.ets|assert0164|assertTrue|actual|expected=true', day.summaryText().indexOf('仅计入统计') > 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0014|ArchiveIndexCases.test.ets|assert0165|assertTrue|actual|expected=true', day.summaryText().indexOf('100%') > 0)).assertTrue();
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
      configureTestText();
      const day: ArchiveDay = new ArchiveDay('2024-01-15', 10);
      day.add(okAt(1, D1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0015|ArchiveIndexCases.test.ets|assert0166|assertEqual|actual', day.sourceDistribution().length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0015|ArchiveIndexCases.test.ets|assert0166|assertEqual|expected', ARCHIVE_SOURCES.length));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0015|ArchiveIndexCases.test.ets|assert0167|assertEqual|actual', day.outcomeDistribution().length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0015|ArchiveIndexCases.test.ets|assert0167|assertEqual|expected', ARCHIVE_OUTCOMES.length));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0015|ArchiveIndexCases.test.ets|assert0168|assertEqual|actual', day.sourceDistribution(false).length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0015|ArchiveIndexCases.test.ets|assert0168|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0015|ArchiveIndexCases.test.ets|assert0169|assertEqual|actual', day.outcomeDistribution(false).length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveDayCases_0015|ArchiveIndexCases.test.ets|assert0169|assertEqual|expected', 1));
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
      configureTestText();
      const bounds: IndexBounds = new IndexBounds();
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0001|ArchiveIndexCases.test.ets|assert0170|assertEqual|actual', bounds.maxDays)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0001|ArchiveIndexCases.test.ets|assert0170|assertEqual|expected', INDEX_MAX_DAYS));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0001|ArchiveIndexCases.test.ets|assert0171|assertEqual|actual', bounds.samplesPerDay)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0001|ArchiveIndexCases.test.ets|assert0171|assertEqual|expected', INDEX_SAMPLES_PER_DAY));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0001|ArchiveIndexCases.test.ets|assert0172|assertEqual|actual', bounds.recentValid)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0001|ArchiveIndexCases.test.ets|assert0172|assertEqual|expected', INDEX_RECENT_VALID));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0001|ArchiveIndexCases.test.ets|assert0173|assertEqual|actual', bounds.trendPoints)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0001|ArchiveIndexCases.test.ets|assert0173|assertEqual|expected', INDEX_TREND_POINTS));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0001|ArchiveIndexCases.test.ets|assert0174|assertEqual|actual', INDEX_MAX_DAYS)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0001|ArchiveIndexCases.test.ets|assert0174|assertEqual|expected', 180));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0001|ArchiveIndexCases.test.ets|assert0175|assertEqual|actual', INDEX_TREND_POINTS)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0001|ArchiveIndexCases.test.ets|assert0175|assertEqual|expected', 60));
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0002|ArchiveIndexCases.test.ets|assert0176|assertEqual|actual', new IndexBounds().describe()))
        .assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0002|ArchiveIndexCases.test.ets|assert0176|assertEqual|expected', '最多 180 天｜每日 20 条样本｜最近 10 条有效样本｜趋势 60 天'));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0002|ArchiveIndexCases.test.ets|assert0177|assertEqual|actual', new IndexBounds().describe().split('｜').length)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0002|ArchiveIndexCases.test.ets|assert0177|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0002|ArchiveIndexCases.test.ets|assert0178|assertTrue|actual|expected=true', new IndexBounds().describe().indexOf('180 天') > 0)).assertTrue();
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
      configureTestText();
      const safe: IndexBounds = new IndexBounds(0, 0, 0, 0).normalized();
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0003|ArchiveIndexCases.test.ets|assert0179|assertEqual|actual', safe.maxDays)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0003|ArchiveIndexCases.test.ets|assert0179|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0003|ArchiveIndexCases.test.ets|assert0180|assertEqual|actual', safe.samplesPerDay)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0003|ArchiveIndexCases.test.ets|assert0180|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0003|ArchiveIndexCases.test.ets|assert0181|assertEqual|actual', safe.recentValid)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0003|ArchiveIndexCases.test.ets|assert0181|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0003|ArchiveIndexCases.test.ets|assert0182|assertEqual|actual', safe.trendPoints)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0003|ArchiveIndexCases.test.ets|assert0182|assertEqual|expected', 1));
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
      configureTestText();
      const safe: IndexBounds = new IndexBounds(5000, 900, 300, 400).normalized();
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0004|ArchiveIndexCases.test.ets|assert0183|assertEqual|actual', safe.maxDays)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0004|ArchiveIndexCases.test.ets|assert0183|assertEqual|expected', 3660));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0004|ArchiveIndexCases.test.ets|assert0184|assertEqual|actual', safe.samplesPerDay)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0004|ArchiveIndexCases.test.ets|assert0184|assertEqual|expected', 500));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0004|ArchiveIndexCases.test.ets|assert0185|assertEqual|actual', safe.recentValid)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0004|ArchiveIndexCases.test.ets|assert0185|assertEqual|expected', 100));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0004|ArchiveIndexCases.test.ets|assert0186|assertEqual|actual', safe.trendPoints)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0004|ArchiveIndexCases.test.ets|assert0186|assertEqual|expected', 365));
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
      configureTestText();
      const safe: IndexBounds = new IndexBounds(Number.NaN, Number.POSITIVE_INFINITY, 5, 5)
        .normalized();
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0005|ArchiveIndexCases.test.ets|assert0187|assertEqual|actual', safe.maxDays)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0005|ArchiveIndexCases.test.ets|assert0187|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0005|ArchiveIndexCases.test.ets|assert0188|assertEqual|actual', safe.samplesPerDay)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0005|ArchiveIndexCases.test.ets|assert0188|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0005|ArchiveIndexCases.test.ets|assert0189|assertEqual|actual', safe.recentValid)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0005|ArchiveIndexCases.test.ets|assert0189|assertEqual|expected', 5));
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
      configureTestText();
      const source: IndexBounds = new IndexBounds(0, 0, 0, 0);
      const safe: IndexBounds = source.normalized();
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0006|ArchiveIndexCases.test.ets|assert0190|assertEqual|actual', source.maxDays)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0006|ArchiveIndexCases.test.ets|assert0190|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0006|ArchiveIndexCases.test.ets|assert0191|assertEqual|actual', safe.maxDays)).assertEqual(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0006|ArchiveIndexCases.test.ets|assert0191|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_IndexBoundsCases_0006|ArchiveIndexCases.test.ets|assert0192|assertFalse|actual|expected=false', safe === source)).assertFalse();
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
      configureTestText();
      const index: ArchiveIndex = buildArchiveIndex([], new IndexBounds(), 0, D1);
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0001|ArchiveIndexCases.test.ets|assert0193|assertTrue|actual|expected=true', index.isEmpty())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0001|ArchiveIndexCases.test.ets|assert0194|assertEqual|actual', index.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0001|ArchiveIndexCases.test.ets|assert0194|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0001|ArchiveIndexCases.test.ets|assert0195|assertEqual|actual', index.days.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0001|ArchiveIndexCases.test.ets|assert0195|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0001|ArchiveIndexCases.test.ets|assert0196|assertEqual|actual', index.emptyState())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0001|ArchiveIndexCases.test.ets|assert0196|assertEqual|expected', '归档为空：还没有任何归档记录'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0001|ArchiveIndexCases.test.ets|assert0197|assertEqual|actual', index.caption())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0001|ArchiveIndexCases.test.ets|assert0197|assertEqual|expected', '归档为空：还没有任何归档记录'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0001|ArchiveIndexCases.test.ets|assert0198|assertEqual|actual', index.notices.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0001|ArchiveIndexCases.test.ets|assert0198|assertEqual|expected', 1));
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
      configureTestText();
      const invalid: ArchiveEntry = new ArchiveEntry(0, D1);
      const index: ArchiveIndex = buildArchiveIndex([invalid, new ArchiveEntry(-1, D2)]);
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0002|ArchiveIndexCases.test.ets|assert0199|assertEqual|actual', index.rejectedEntries)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0002|ArchiveIndexCases.test.ets|assert0199|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0002|ArchiveIndexCases.test.ets|assert0200|assertEqual|actual', index.emptyState())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0002|ArchiveIndexCases.test.ets|assert0200|assertEqual|expected', '归档为空：2 条记录均未通过字段校验'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0002|ArchiveIndexCases.test.ets|assert0201|assertEqual|actual', index.notices[0])).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0002|ArchiveIndexCases.test.ets|assert0201|assertEqual|expected', '已忽略 2 条未通过字段校验的记录'));
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
      configureTestText();
      const index: ArchiveIndex = buildArchiveIndex(fillDay(D1, 2, 0, 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0003|ArchiveIndexCases.test.ets|assert0202|assertEqual|actual', index.emptyState())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0003|ArchiveIndexCases.test.ets|assert0202|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0003|ArchiveIndexCases.test.ets|assert0203|assertFalse|actual|expected=false', index.isEmpty())).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0003|ArchiveIndexCases.test.ets|assert0204|assertEqual|actual', index.droppedEntries)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0003|ArchiveIndexCases.test.ets|assert0204|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0003|ArchiveIndexCases.test.ets|assert0205|assertEqual|actual', index.caption())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0003|ArchiveIndexCases.test.ets|assert0205|assertEqual|expected', '归档索引｜1 天｜2 条｜有效 2 条'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0003|ArchiveIndexCases.test.ets|assert0206|assertEqual|actual', index.caption().indexOf('窗口外'))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0003|ArchiveIndexCases.test.ets|assert0206|assertEqual|expected', -1));
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 1, 0, 1).concat(fillDay(D2, 1, 0, 10));
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(), 0);
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0004|ArchiveIndexCases.test.ets|assert0207|assertEqual|actual', index.days.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0004|ArchiveIndexCases.test.ets|assert0207|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0004|ArchiveIndexCases.test.ets|assert0208|assertEqual|actual', index.days[0].dayKey)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0004|ArchiveIndexCases.test.ets|assert0208|assertEqual|expected', '2024-01-16'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0004|ArchiveIndexCases.test.ets|assert0209|assertEqual|actual', index.days[1].dayKey)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0004|ArchiveIndexCases.test.ets|assert0209|assertEqual|expected', '2024-01-15'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0004|ArchiveIndexCases.test.ets|assert0210|assertEqual|actual', index.dayKeys().join(','))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0004|ArchiveIndexCases.test.ets|assert0210|assertEqual|expected', '2024-01-16,2024-01-15'));
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
      configureTestText();
      const lateUtc: number = D2 - 8 * 60 * 60 * 1000;
      const entry: ArchiveEntry = okAt(1, lateUtc);
      const utc: ArchiveIndex = buildArchiveIndex([entry], new IndexBounds(), 0);
      const east: ArchiveIndex = buildArchiveIndex([entry], new IndexBounds(), 480);
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0005|ArchiveIndexCases.test.ets|assert0211|assertEqual|actual', utc.days[0].dayKey)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0005|ArchiveIndexCases.test.ets|assert0211|assertEqual|expected', '2024-01-15'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0005|ArchiveIndexCases.test.ets|assert0212|assertEqual|actual', east.days[0].dayKey)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0005|ArchiveIndexCases.test.ets|assert0212|assertEqual|expected', '2024-01-16'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0005|ArchiveIndexCases.test.ets|assert0213|assertEqual|actual', utc.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0005|ArchiveIndexCases.test.ets|assert0213|assertEqual|expected', east.total));
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
      configureTestText();
      const bad: ArchiveEntry = okAt(1, D1);
      bad.outcome = 'blocked';
      const good: ArchiveEntry = okAt(2, D1 + 1000);
      const index: ArchiveIndex = buildArchiveIndex([bad, good]);
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0006|ArchiveIndexCases.test.ets|assert0214|assertEqual|actual', index.rejectedEntries)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0006|ArchiveIndexCases.test.ets|assert0214|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0006|ArchiveIndexCases.test.ets|assert0215|assertEqual|actual', index.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0006|ArchiveIndexCases.test.ets|assert0215|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0006|ArchiveIndexCases.test.ets|assert0216|assertEqual|actual', index.days[0].total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0006|ArchiveIndexCases.test.ets|assert0216|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0006|ArchiveIndexCases.test.ets|assert0217|assertTrue|actual|expected=true', index.notices[0].indexOf('已忽略 1 条') === 0)).assertTrue();
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
      configureTestText();
      const entries: ArchiveEntry[] = [okAt(1, D1), failAt(2, D1 + 1000),
        timeoutAt(3, D1 + 2000)];
      const index: ArchiveIndex = buildArchiveIndex(entries);
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0218|assertEqual|actual', index.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0218|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0219|assertEqual|actual', index.success)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0219|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0220|assertEqual|actual', index.failure)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0220|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0221|assertEqual|actual', index.timeout)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0221|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0222|assertEqual|actual', index.validCount())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0222|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0223|assertEqual|actual', index.newestAt)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0223|assertEqual|expected', D1 + 2000));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0224|assertEqual|actual', index.oldestAt)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0007|ArchiveIndexCases.test.ets|assert0224|assertEqual|expected', D1));
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 5, 0, 1);
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(180, 20, 2, 60));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0008|ArchiveIndexCases.test.ets|assert0225|assertEqual|actual', index.recentValid.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0008|ArchiveIndexCases.test.ets|assert0225|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0008|ArchiveIndexCases.test.ets|assert0226|assertEqual|actual', index.latestValidId())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0008|ArchiveIndexCases.test.ets|assert0226|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0008|ArchiveIndexCases.test.ets|assert0227|assertEqual|actual', index.recentValid[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0008|ArchiveIndexCases.test.ets|assert0227|assertEqual|expected', 5));
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
      configureTestText();
      const entries: ArchiveEntry[] = [timeoutAt(1, D1),
        entryOf(2, D1 + 1000, QueryOutcome.UNSUPPORTED, RefreshSource.MANUAL, 0),
        okAt(3, D1 + 2000)];
      const index: ArchiveIndex = buildArchiveIndex(entries);
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0009|ArchiveIndexCases.test.ets|assert0228|assertEqual|actual', index.recentValid.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0009|ArchiveIndexCases.test.ets|assert0228|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0009|ArchiveIndexCases.test.ets|assert0229|assertEqual|actual', index.recentValid[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0009|ArchiveIndexCases.test.ets|assert0229|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0009|ArchiveIndexCases.test.ets|assert0230|assertEqual|actual', index.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0009|ArchiveIndexCases.test.ets|assert0230|assertEqual|expected', 3));
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 2, 0, 1).concat(fillDay(D2, 3, 0, 10));
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(1, 20, 10, 60));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0010|ArchiveIndexCases.test.ets|assert0231|assertEqual|actual', index.days.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0010|ArchiveIndexCases.test.ets|assert0231|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0010|ArchiveIndexCases.test.ets|assert0232|assertEqual|actual', index.days[0].dayKey)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0010|ArchiveIndexCases.test.ets|assert0232|assertEqual|expected', '2024-01-16'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0010|ArchiveIndexCases.test.ets|assert0233|assertEqual|actual', index.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0010|ArchiveIndexCases.test.ets|assert0233|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0010|ArchiveIndexCases.test.ets|assert0234|assertEqual|actual', index.droppedEntries)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0010|ArchiveIndexCases.test.ets|assert0234|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0010|ArchiveIndexCases.test.ets|assert0235|assertEqual|actual', index.droppedDays)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0010|ArchiveIndexCases.test.ets|assert0235|assertEqual|expected', 1));
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 1, 0, 1).concat(fillDay(D2, 1, 0, 10));
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(1, 20, 10, 60));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0011|ArchiveIndexCases.test.ets|assert0236|assertTrue|actual|expected=true', index.notices.some((notice: string): boolean =>
        notice.indexOf('（涉及 1 个日期）') > 0))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0011|ArchiveIndexCases.test.ets|assert0237|assertTrue|actual|expected=true', index.notices.some((notice: string): boolean =>
        notice.indexOf('超出 1 天索引窗口') > 0))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0011|ArchiveIndexCases.test.ets|assert0238|assertTrue|actual|expected=true', index.notices.length > 0)).assertTrue();
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 1, 0, 1).concat(fillDay(D2, 2, 0, 10));
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(1, 20, 10, 60));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0012|ArchiveIndexCases.test.ets|assert0239|assertEqual|actual', index.caption())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0012|ArchiveIndexCases.test.ets|assert0239|assertEqual|expected', '归档索引｜1 天｜2 条｜有效 2 条｜窗口外 1 条'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0012|ArchiveIndexCases.test.ets|assert0240|assertTrue|actual|expected=true', index.caption().indexOf('窗口外') > 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0012|ArchiveIndexCases.test.ets|assert0241|assertTrue|actual|expected=true', index.caption().indexOf('2 条') > 0)).assertTrue();
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 25, 0, 1);
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(180, 20, 10, 60));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0013|ArchiveIndexCases.test.ets|assert0242|assertEqual|actual', index.days[0].total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0013|ArchiveIndexCases.test.ets|assert0242|assertEqual|expected', 25));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0013|ArchiveIndexCases.test.ets|assert0243|assertEqual|actual', index.days[0].samples.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0013|ArchiveIndexCases.test.ets|assert0243|assertEqual|expected', 20));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0013|ArchiveIndexCases.test.ets|assert0244|assertEqual|actual', index.days[0].sampleTruncated())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0013|ArchiveIndexCases.test.ets|assert0244|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0013|ArchiveIndexCases.test.ets|assert0245|assertEqual|actual', index.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0013|ArchiveIndexCases.test.ets|assert0245|assertEqual|expected', 25));
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 1, 1, 1).concat(fillDay(D2, 2, 0, 10));
      const index: ArchiveIndex = buildArchiveIndex(entries);
      const sources: CountEntry[] = index.sourceDistribution(false);
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0014|ArchiveIndexCases.test.ets|assert0246|assertEqual|actual', sources.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0014|ArchiveIndexCases.test.ets|assert0246|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0014|ArchiveIndexCases.test.ets|assert0247|assertEqual|actual', sources[0].count)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0014|ArchiveIndexCases.test.ets|assert0247|assertEqual|expected', 4));
      const outcomes: CountEntry[] = index.outcomeDistribution(false);
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0014|ArchiveIndexCases.test.ets|assert0248|assertEqual|actual', outcomes.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0014|ArchiveIndexCases.test.ets|assert0248|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0014|ArchiveIndexCases.test.ets|assert0249|assertEqual|actual', index.outcomeCounts[0])).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0014|ArchiveIndexCases.test.ets|assert0249|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0014|ArchiveIndexCases.test.ets|assert0250|assertEqual|actual', index.outcomeCounts[1])).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0014|ArchiveIndexCases.test.ets|assert0250|assertEqual|expected', 1));
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
      configureTestText();
      const index: ArchiveIndex = buildArchiveIndex(fillDay(D1, 1, 0, 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0015|ArchiveIndexCases.test.ets|assert0251|assertTrue|actual|expected=true', index.dayOf('2024-01-15') !== undefined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0015|ArchiveIndexCases.test.ets|assert0252|assertTrue|actual|expected=true', index.dayOf('2024-01-20') === undefined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0015|ArchiveIndexCases.test.ets|assert0253|assertFalse|actual|expected=false', index.dayDetail('2024-01-20').found)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0015|ArchiveIndexCases.test.ets|assert0254|assertEqual|actual', index.dayDetail('2024-01-20').text()))
        .assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0015|ArchiveIndexCases.test.ets|assert0254|assertEqual|expected', '2024-01-20：没有该日期的记录（索引窗口 2024-01-15 至 2024-01-15）'));
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
      configureTestText();
      const index: ArchiveIndex = buildArchiveIndex(fillDay(D1, 1, 0, 1));
      const detail = index.dayDetail('2024/01/15');
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0016|ArchiveIndexCases.test.ets|assert0255|assertFalse|actual|expected=false', detail.found)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0016|ArchiveIndexCases.test.ets|assert0256|assertEqual|actual', detail.notice)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0016|ArchiveIndexCases.test.ets|assert0256|assertEqual|expected', '日期格式应为 yyyy-MM-dd'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0016|ArchiveIndexCases.test.ets|assert0257|assertEqual|actual', detail.samples.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0016|ArchiveIndexCases.test.ets|assert0257|assertEqual|expected', 0));
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
      configureTestText();
      const index: ArchiveIndex = buildArchiveIndex([]);
      const detail = index.dayDetail('2024-01-15');
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0017|ArchiveIndexCases.test.ets|assert0258|assertFalse|actual|expected=false', detail.found)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0017|ArchiveIndexCases.test.ets|assert0259|assertEqual|actual', detail.notice)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0017|ArchiveIndexCases.test.ets|assert0259|assertEqual|expected', '归档为空，尚无任何日期索引'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0017|ArchiveIndexCases.test.ets|assert0260|assertEqual|actual', detail.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0017|ArchiveIndexCases.test.ets|assert0260|assertEqual|expected', 0));
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 25, 0, 1);
      const index: ArchiveIndex = buildArchiveIndex(entries, new IndexBounds(180, 20, 10, 60));
      const detail = index.dayDetail('2024-01-15');
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0018|ArchiveIndexCases.test.ets|assert0261|assertTrue|actual|expected=true', detail.found)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0018|ArchiveIndexCases.test.ets|assert0262|assertEqual|actual', detail.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0018|ArchiveIndexCases.test.ets|assert0262|assertEqual|expected', 25));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0018|ArchiveIndexCases.test.ets|assert0263|assertEqual|actual', detail.samples.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0018|ArchiveIndexCases.test.ets|assert0263|assertEqual|expected', 20));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0018|ArchiveIndexCases.test.ets|assert0264|assertEqual|actual', detail.truncated)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0018|ArchiveIndexCases.test.ets|assert0264|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0018|ArchiveIndexCases.test.ets|assert0265|assertEqual|actual', detail.notice)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0018|ArchiveIndexCases.test.ets|assert0265|assertEqual|expected', '当天只保留最近 20 条样本'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0018|ArchiveIndexCases.test.ets|assert0266|assertTrue|actual|expected=true', detail.text().indexOf('另有 5 条仅计入统计') > 0)).assertTrue();
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
      configureTestText();
      const settings: ArchiveEntry = entryOf(1, D1, QueryOutcome.SUCCESS, RefreshSource.SETTINGS, 9);
      const entries: ArchiveEntry[] = [settings].concat(fillDay(D2, 1, 0, 10));
      const index: ArchiveIndex = buildArchiveIndex(entries);
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0019|ArchiveIndexCases.test.ets|assert0267|assertEqual|actual', index.matchDays('', '').length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0019|ArchiveIndexCases.test.ets|assert0267|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0019|ArchiveIndexCases.test.ets|assert0268|assertEqual|actual', index.matchDays(RefreshSource.SETTINGS, '').length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0019|ArchiveIndexCases.test.ets|assert0268|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0019|ArchiveIndexCases.test.ets|assert0269|assertFalse|actual|expected=false', index.matchDays(RefreshSource.SETTINGS, '').length === 2)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0019|ArchiveIndexCases.test.ets|assert0270|assertEqual|actual', index.matchDays('', QueryOutcome.FAILURE).length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0019|ArchiveIndexCases.test.ets|assert0270|assertEqual|expected', 0));
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
      configureTestText();
      const index: ArchiveIndex = buildArchiveIndex(fillDay(D1, 2, 1, 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0020|ArchiveIndexCases.test.ets|assert0271|assertEqual|actual', index.matchDays('', '').length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0020|ArchiveIndexCases.test.ets|assert0271|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0020|ArchiveIndexCases.test.ets|assert0272|assertEqual|actual', index.matchDays(RefreshSource.MANUAL, '').length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0020|ArchiveIndexCases.test.ets|assert0272|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0020|ArchiveIndexCases.test.ets|assert0273|assertEqual|actual', index.matchDays(RefreshSource.INITIAL, '').length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveIndexBuildCases_0020|ArchiveIndexCases.test.ets|assert0273|assertEqual|expected', 0));
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
      configureTestText();
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex([]));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0001|ArchiveIndexCases.test.ets|assert0274|assertEqual|actual', trend.points.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0001|ArchiveIndexCases.test.ets|assert0274|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0001|ArchiveIndexCases.test.ets|assert0275|assertEqual|actual', trend.direction)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0001|ArchiveIndexCases.test.ets|assert0275|assertEqual|expected', TrendDirection.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0001|ArchiveIndexCases.test.ets|assert0276|assertEqual|actual', trend.text())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0001|ArchiveIndexCases.test.ets|assert0276|assertEqual|expected', '趋势数据不足：归档为空'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0001|ArchiveIndexCases.test.ets|assert0277|assertEqual|actual', trend.sampleDays)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0001|ArchiveIndexCases.test.ets|assert0277|assertEqual|expected', 0));
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
      configureTestText();
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(fillDay(D1, 3, 0, 1)));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0002|ArchiveIndexCases.test.ets|assert0278|assertEqual|actual', trend.points.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0002|ArchiveIndexCases.test.ets|assert0278|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0002|ArchiveIndexCases.test.ets|assert0279|assertEqual|actual', trend.sampleDays)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0002|ArchiveIndexCases.test.ets|assert0279|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0002|ArchiveIndexCases.test.ets|assert0280|assertEqual|actual', trend.direction)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0002|ArchiveIndexCases.test.ets|assert0280|assertEqual|expected', TrendDirection.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0002|ArchiveIndexCases.test.ets|assert0281|assertEqual|actual', trend.deltaRate)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0002|ArchiveIndexCases.test.ets|assert0281|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0002|ArchiveIndexCases.test.ets|assert0282|assertEqual|actual', trend.text())).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0002|ArchiveIndexCases.test.ets|assert0282|assertEqual|expected', '趋势数据不足：只有 1 个有效样本日（至少需要 2 个）'));
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 0, 1, 1).concat(fillDay(D2, 1, 0, 10))
        .concat(fillDay(D3, 1, 0, 20));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0003|ArchiveIndexCases.test.ets|assert0283|assertEqual|actual', trend.direction)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0003|ArchiveIndexCases.test.ets|assert0283|assertEqual|expected', TrendDirection.RISING));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0003|ArchiveIndexCases.test.ets|assert0284|assertEqual|actual', trend.deltaRate)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0003|ArchiveIndexCases.test.ets|assert0284|assertEqual|expected', 100));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0003|ArchiveIndexCases.test.ets|assert0285|assertEqual|actual', trend.sampleDays)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0003|ArchiveIndexCases.test.ets|assert0285|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0003|ArchiveIndexCases.test.ets|assert0286|assertEqual|actual', trend.text())).assertEqual(
        traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0003|ArchiveIndexCases.test.ets|assert0286|assertEqual|expected', '2024-01-15 → 2024-01-17｜成功率 0% → 100%｜上升（+100 个百分点）'));
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 1, 0, 1).concat(fillDay(D2, 0, 1, 10))
        .concat(fillDay(D3, 0, 1, 20));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0004|ArchiveIndexCases.test.ets|assert0287|assertEqual|actual', trend.direction)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0004|ArchiveIndexCases.test.ets|assert0287|assertEqual|expected', TrendDirection.FALLING));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0004|ArchiveIndexCases.test.ets|assert0288|assertEqual|actual', trend.deltaRate)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0004|ArchiveIndexCases.test.ets|assert0288|assertEqual|expected', -100));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0004|ArchiveIndexCases.test.ets|assert0289|assertTrue|actual|expected=true', trend.text().indexOf('下降（-100 个百分点）') > 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0004|ArchiveIndexCases.test.ets|assert0290|assertTrue|actual|expected=true', trend.text().indexOf('+') === -1)).assertTrue();
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 9, 1, 1).concat(fillDay(D2, 1, 0, 10));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0005|ArchiveIndexCases.test.ets|assert0291|assertEqual|actual', trend.deltaRate)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0005|ArchiveIndexCases.test.ets|assert0291|assertEqual|expected', 10));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0005|ArchiveIndexCases.test.ets|assert0292|assertEqual|actual', trend.direction)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0005|ArchiveIndexCases.test.ets|assert0292|assertEqual|expected', TrendDirection.STABLE));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0005|ArchiveIndexCases.test.ets|assert0293|assertEqual|actual', trend.text())).assertEqual(
        traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0005|ArchiveIndexCases.test.ets|assert0293|assertEqual|expected', '2024-01-15 → 2024-01-16｜成功率 90% → 100%｜基本持平（+10 个百分点）'));
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 1, 1, 1).concat(fillDay(D2, 3, 1, 10));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0006|ArchiveIndexCases.test.ets|assert0294|assertEqual|actual', trend.points[0].successRate)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0006|ArchiveIndexCases.test.ets|assert0294|assertEqual|expected', 50));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0006|ArchiveIndexCases.test.ets|assert0295|assertEqual|actual', trend.points[1].successRate)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0006|ArchiveIndexCases.test.ets|assert0295|assertEqual|expected', 75));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0006|ArchiveIndexCases.test.ets|assert0296|assertEqual|actual', trend.deltaRate)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0006|ArchiveIndexCases.test.ets|assert0296|assertEqual|expected', 25));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0006|ArchiveIndexCases.test.ets|assert0297|assertEqual|actual', trend.direction)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0006|ArchiveIndexCases.test.ets|assert0297|assertEqual|expected', TrendDirection.RISING));
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
      configureTestText();
      const entries: ArchiveEntry[] = [timeoutAt(1, D1)].concat(fillDay(D2, 1, 0, 10))
        .concat(fillDay(D3, 1, 0, 20));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0007|ArchiveIndexCases.test.ets|assert0298|assertEqual|actual', trend.points.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0007|ArchiveIndexCases.test.ets|assert0298|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0007|ArchiveIndexCases.test.ets|assert0299|assertEqual|actual', trend.sampleDays)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0007|ArchiveIndexCases.test.ets|assert0299|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0007|ArchiveIndexCases.test.ets|assert0300|assertEqual|actual', trend.direction)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0007|ArchiveIndexCases.test.ets|assert0300|assertEqual|expected', TrendDirection.STABLE));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0007|ArchiveIndexCases.test.ets|assert0301|assertEqual|actual', trend.deltaRate)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0007|ArchiveIndexCases.test.ets|assert0301|assertEqual|expected', 0));
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
      configureTestText();
      const entries: ArchiveEntry[] = [timeoutAt(1, D1), timeoutAt(2, D2)];
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0008|ArchiveIndexCases.test.ets|assert0302|assertEqual|actual', trend.points.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0008|ArchiveIndexCases.test.ets|assert0302|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0008|ArchiveIndexCases.test.ets|assert0303|assertEqual|actual', trend.sampleDays)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0008|ArchiveIndexCases.test.ets|assert0303|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0008|ArchiveIndexCases.test.ets|assert0304|assertEqual|actual', trend.direction)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0008|ArchiveIndexCases.test.ets|assert0304|assertEqual|expected', TrendDirection.UNKNOWN));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0008|ArchiveIndexCases.test.ets|assert0305|assertTrue|actual|expected=true', trend.text().indexOf('只有 0 个有效样本日') > 0)).assertTrue();
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 1, 0, 1).concat(fillDay(D2, 1, 0, 10))
        .concat(fillDay(D3, 1, 0, 20));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries, new IndexBounds(180, 20, 10,
        2)));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0009|ArchiveIndexCases.test.ets|assert0306|assertEqual|actual', trend.points.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0009|ArchiveIndexCases.test.ets|assert0306|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0009|ArchiveIndexCases.test.ets|assert0307|assertEqual|actual', trend.points[0].dayKey)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0009|ArchiveIndexCases.test.ets|assert0307|assertEqual|expected', '2024-01-16'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0009|ArchiveIndexCases.test.ets|assert0308|assertEqual|actual', trend.points[1].dayKey)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0009|ArchiveIndexCases.test.ets|assert0308|assertEqual|expected', '2024-01-17'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0009|ArchiveIndexCases.test.ets|assert0309|assertEqual|actual', trend.sampleDays)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0009|ArchiveIndexCases.test.ets|assert0309|assertEqual|expected', 2));
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 1, 0, 1).concat(fillDay(D3, 1, 0, 20));
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0010|ArchiveIndexCases.test.ets|assert0310|assertEqual|actual', trend.points[0].dayKey)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0010|ArchiveIndexCases.test.ets|assert0310|assertEqual|expected', '2024-01-15'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0010|ArchiveIndexCases.test.ets|assert0311|assertEqual|actual', trend.points[1].dayKey)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0010|ArchiveIndexCases.test.ets|assert0311|assertEqual|expected', '2024-01-17'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0010|ArchiveIndexCases.test.ets|assert0312|assertEqual|actual', trend.points.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0010|ArchiveIndexCases.test.ets|assert0312|assertEqual|expected', 2));
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
      configureTestText();
      const entries: ArchiveEntry[] = fillDay(D1, 2, 1, 1);
      const trend: ArchiveTrend = buildTrend(buildArchiveIndex(entries));
      const point: TrendPoint = trend.points[0];
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0011|ArchiveIndexCases.test.ets|assert0313|assertEqual|actual', point.total)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0011|ArchiveIndexCases.test.ets|assert0313|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0011|ArchiveIndexCases.test.ets|assert0314|assertEqual|actual', point.valid)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0011|ArchiveIndexCases.test.ets|assert0314|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0011|ArchiveIndexCases.test.ets|assert0315|assertEqual|actual', point.failure)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0011|ArchiveIndexCases.test.ets|assert0315|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0011|ArchiveIndexCases.test.ets|assert0316|assertEqual|actual', point.successRate)).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0011|ArchiveIndexCases.test.ets|assert0316|assertEqual|expected', 66.7));
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
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0012|ArchiveIndexCases.test.ets|assert0317|assertEqual|actual', trendDirectionLabel(TrendDirection.RISING))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0012|ArchiveIndexCases.test.ets|assert0317|assertEqual|expected', '上升'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0012|ArchiveIndexCases.test.ets|assert0318|assertEqual|actual', trendDirectionLabel(TrendDirection.FALLING))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0012|ArchiveIndexCases.test.ets|assert0318|assertEqual|expected', '下降'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0012|ArchiveIndexCases.test.ets|assert0319|assertEqual|actual', trendDirectionLabel(TrendDirection.STABLE))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0012|ArchiveIndexCases.test.ets|assert0319|assertEqual|expected', '基本持平'));
      expect(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0012|ArchiveIndexCases.test.ets|assert0320|assertEqual|actual', trendDirectionLabel(TrendDirection.UNKNOWN))).assertEqual(traceParameter('com.samples.appstartupauto_ArchiveTrendCases_0012|ArchiveIndexCases.test.ets|assert0320|assertEqual|expected', '数据不足'));
    });
  });
}
