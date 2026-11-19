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
import {
  EXPORT_MESSAGE_LIMIT, HISTORY_LIMIT, HISTORY_MAX_AGE_MS, HISTORY_MESSAGE_LIMIT, HISTORY_SCHEMA,
  HistoryComparison, HistorySummary, boundedMessage, compareLatestRecords, exportRedacted,
  filterHistory, filterHistoryAdvanced, normalizeRecord, outcomeLabel, parseHistory, serializeHistory,
  summarizeHistory
} from '../../../main/ets/autostart/AutoStartupHistory';
import { QueryOutcome, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';

const DAY: number = 24 * 60 * 60 * 1000;

function recordOf(id: number, timestamp: number, source: RefreshSource, result: string,
  outcome: QueryOutcome = QueryOutcome.SUCCESS): QueryRecord {
  const record: QueryRecord = new QueryRecord();
  record.id = id;
  record.timestamp = timestamp;
  record.source = source;
  record.result = result;
  record.supportResult = '支持';
  record.statusResult = '已开启';
  record.errorCode = '';
  record.errorMessage = '';
  record.durationMillis = 12;
  record.outcome = outcome;
  return record;
}

export default function historyArchiveMatrixTest(): void {
  configureTestText();
  describe('AutoStartupHistoryArchiveCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_0100
     * @tc.name      testAutoStartupHistoryArchive0001
     * @tc.desc      Verify 已开启 result is persisted as success outcome
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0001', 0, (): void => {
      configureTestText();
      const record: QueryRecord = recordOf(1, 1700000000000, RefreshSource.INITIAL, '已开启',
        'pending' as QueryOutcome);
      const normalized: QueryRecord | undefined = normalizeRecord(record);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0001|HistoryArchiveMatrix.test.ets|assert0001|assertTrue|actual|expected=true', normalized !== undefined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0001|HistoryArchiveMatrix.test.ets|assert0002|assertEqual|actual', normalized?.outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0001|HistoryArchiveMatrix.test.ets|assert0002|assertEqual|expected', QueryOutcome.SUCCESS));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0001|HistoryArchiveMatrix.test.ets|assert0003|assertEqual|actual', normalized?.id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0001|HistoryArchiveMatrix.test.ets|assert0003|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0001|HistoryArchiveMatrix.test.ets|assert0004|assertEqual|actual', normalized?.durationMillis)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0001|HistoryArchiveMatrix.test.ets|assert0004|assertEqual|expected', 12));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_0200
     * @tc.name      testAutoStartupHistoryArchive0002
     * @tc.desc      Verify 设备不支持 maps to unsupported and 等待超时 maps to timeout
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0002', 0, (): void => {
      configureTestText();
      const unsupported: QueryRecord | undefined = normalizeRecord(
        recordOf(2, 1700000000000, RefreshSource.MANUAL, '设备不支持', 'pending' as QueryOutcome));
      const timeout: QueryRecord | undefined = normalizeRecord(
        recordOf(3, 1700000000000, RefreshSource.FOREGROUND, '等待超时', 'pending' as QueryOutcome));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0002|HistoryArchiveMatrix.test.ets|assert0005|assertEqual|actual', unsupported?.outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0002|HistoryArchiveMatrix.test.ets|assert0005|assertEqual|expected', QueryOutcome.UNSUPPORTED));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0002|HistoryArchiveMatrix.test.ets|assert0006|assertEqual|actual', timeout?.outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0002|HistoryArchiveMatrix.test.ets|assert0006|assertEqual|expected', QueryOutcome.TIMEOUT));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0002|HistoryArchiveMatrix.test.ets|assert0007|assertEqual|actual', unsupported?.source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0002|HistoryArchiveMatrix.test.ets|assert0007|assertEqual|expected', RefreshSource.MANUAL));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_0300
     * @tc.name      testAutoStartupHistoryArchive0003
     * @tc.desc      Verify empty and unknown results fall back to unknown outcome
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0003', 0, (): void => {
      configureTestText();
      const empty: QueryRecord | undefined = normalizeRecord(
        recordOf(4, 1700000000000, RefreshSource.INITIAL, ' ', 'pending' as QueryOutcome));
      const custom: QueryRecord | undefined = normalizeRecord(
        recordOf(5, 1700000000000, RefreshSource.INITIAL, '未知结果', 'pending' as QueryOutcome));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0003|HistoryArchiveMatrix.test.ets|assert0008|assertEqual|actual', empty?.outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0003|HistoryArchiveMatrix.test.ets|assert0008|assertEqual|expected', QueryOutcome.FAILURE));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0003|HistoryArchiveMatrix.test.ets|assert0009|assertEqual|actual', custom?.outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0003|HistoryArchiveMatrix.test.ets|assert0009|assertEqual|expected', QueryOutcome.FAILURE));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0003|HistoryArchiveMatrix.test.ets|assert0010|assertEqual|actual', custom?.result)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0003|HistoryArchiveMatrix.test.ets|assert0010|assertEqual|expected', '未知结果'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0003|HistoryArchiveMatrix.test.ets|assert0011|assertTrue|actual|expected=true', normalizeRecord(recordOf(14, 1700000000000, RefreshSource.INITIAL, '')) === undefined)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_0400
     * @tc.name      testAutoStartupHistoryArchive0004
     * @tc.desc      Verify invalid identifiers are rejected by normalizeRecord
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0004', 0, (): void => {
      configureTestText();
      const zero: QueryRecord = recordOf(0, 1700000000000, RefreshSource.INITIAL, '已开启');
      const negative: QueryRecord = recordOf(-3, 1700000000000, RefreshSource.INITIAL, '已开启');
      const fractional: QueryRecord = recordOf(1.5, 1700000000000, RefreshSource.INITIAL, '已开启');
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0004|HistoryArchiveMatrix.test.ets|assert0012|assertTrue|actual|expected=true', normalizeRecord(zero) === undefined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0004|HistoryArchiveMatrix.test.ets|assert0013|assertTrue|actual|expected=true', normalizeRecord(negative) === undefined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0004|HistoryArchiveMatrix.test.ets|assert0014|assertTrue|actual|expected=true', normalizeRecord(fractional) === undefined)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_0500
     * @tc.name      testAutoStartupHistoryArchive0005
     * @tc.desc      Verify unknown source, empty result and negative duration are rejected
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0005', 0, (): void => {
      configureTestText();
      const badSource: QueryRecord = recordOf(6, 1700000000000, RefreshSource.INITIAL, '已开启');
      badSource.source = 'not-a-source' as RefreshSource;
      const emptyResult: QueryRecord = recordOf(7, 1700000000000, RefreshSource.INITIAL, '');
      const badDuration: QueryRecord = recordOf(8, 1700000000000, RefreshSource.INITIAL, '已开启');
      badDuration.durationMillis = -1;
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0005|HistoryArchiveMatrix.test.ets|assert0015|assertTrue|actual|expected=true', normalizeRecord(badSource) === undefined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0005|HistoryArchiveMatrix.test.ets|assert0016|assertTrue|actual|expected=true', normalizeRecord(emptyResult) === undefined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0005|HistoryArchiveMatrix.test.ets|assert0017|assertTrue|actual|expected=true', normalizeRecord(badDuration) === undefined)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_0600
     * @tc.name      testAutoStartupHistoryArchive0006
     * @tc.desc      Verify overlong fields are rejected at the documented limits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0006', 0, (): void => {
      configureTestText();
      const longResult: QueryRecord = recordOf(9, 1700000000000, RefreshSource.INITIAL, 'x'.repeat(201));
      const longMessage: QueryRecord = recordOf(10, 1700000000000, RefreshSource.INITIAL, '已开启');
      longMessage.errorMessage = 'm'.repeat(HISTORY_MESSAGE_LIMIT + 1);
      const longCode: QueryRecord = recordOf(11, 1700000000000, RefreshSource.INITIAL, '已开启');
      longCode.errorCode = 'c'.repeat(65);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0006|HistoryArchiveMatrix.test.ets|assert0018|assertTrue|actual|expected=true', normalizeRecord(longResult) === undefined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0006|HistoryArchiveMatrix.test.ets|assert0019|assertTrue|actual|expected=true', normalizeRecord(longMessage) === undefined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0006|HistoryArchiveMatrix.test.ets|assert0020|assertTrue|actual|expected=true', normalizeRecord(longCode) === undefined)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_0700
     * @tc.name      testAutoStartupHistoryArchive0007
     * @tc.desc      Verify recognized outcome survives normalization while unknown is derived
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0007', 0, (): void => {
      configureTestText();
      const explicit: QueryRecord | undefined = normalizeRecord(
        recordOf(12, 1700000000000, RefreshSource.SETTINGS, '已开启', QueryOutcome.FAILURE));
      const derived: QueryRecord | undefined = normalizeRecord(
        recordOf(13, 1700000000000, RefreshSource.SETTINGS, '已开启', 'pending' as QueryOutcome));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0007|HistoryArchiveMatrix.test.ets|assert0021|assertEqual|actual', explicit?.outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0007|HistoryArchiveMatrix.test.ets|assert0021|assertEqual|expected', QueryOutcome.FAILURE));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0007|HistoryArchiveMatrix.test.ets|assert0022|assertEqual|actual', derived?.outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0007|HistoryArchiveMatrix.test.ets|assert0022|assertEqual|expected', QueryOutcome.SUCCESS));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0007|HistoryArchiveMatrix.test.ets|assert0023|assertEqual|actual', explicit?.source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0007|HistoryArchiveMatrix.test.ets|assert0023|assertEqual|expected', RefreshSource.SETTINGS));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_0800
     * @tc.name      testAutoStartupHistoryArchive0008
     * @tc.desc      Verify serialization caps the list at the history limit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0008', 0, (): void => {
      configureTestText();
      const records: QueryRecord[] = [];
      for (let index: number = 1; index <= HISTORY_LIMIT + 5; index++) {
        records.push(recordOf(index, 1700000000000 + index, RefreshSource.MANUAL, '已开启'));
      }
      const raw: string = serializeHistory(records, 1700000000000);
      const loaded = parseHistory(raw, 1700000000000);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0008|HistoryArchiveMatrix.test.ets|assert0024|assertEqual|actual', loaded.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0008|HistoryArchiveMatrix.test.ets|assert0024|assertEqual|expected', HISTORY_LIMIT));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0008|HistoryArchiveMatrix.test.ets|assert0025|assertEqual|actual', loaded.records[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0008|HistoryArchiveMatrix.test.ets|assert0025|assertEqual|expected', HISTORY_LIMIT));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0008|HistoryArchiveMatrix.test.ets|assert0026|assertFalse|actual|expected=false', loaded.recovered)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_0900
     * @tc.name      testAutoStartupHistoryArchive0009
     * @tc.desc      Verify serialization truncates an overlong error message instead of failing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0009', 0, (): void => {
      configureTestText();
      const record: QueryRecord = recordOf(21, 1700000000000, RefreshSource.MANUAL, '已开启');
      record.errorMessage = 'e'.repeat(HISTORY_MESSAGE_LIMIT + 50);
      const raw: string = serializeHistory([record], 1700000000000);
      const loaded = parseHistory(raw, 1700000000000);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0009|HistoryArchiveMatrix.test.ets|assert0027|assertEqual|actual', loaded.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0009|HistoryArchiveMatrix.test.ets|assert0027|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0009|HistoryArchiveMatrix.test.ets|assert0028|assertTrue|actual|expected=true', loaded.records[0].errorMessage.length <= HISTORY_MESSAGE_LIMIT)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0009|HistoryArchiveMatrix.test.ets|assert0029|assertTrue|actual|expected=true', raw.indexOf(`"schema":${HISTORY_SCHEMA}`) >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_1000
     * @tc.name      testAutoStartupHistoryArchive0010
     * @tc.desc      Verify empty document yields an empty result without a notice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0010', 0, (): void => {
      configureTestText();
      const loaded = parseHistory('', 1700000000000);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0010|HistoryArchiveMatrix.test.ets|assert0030|assertEqual|actual', loaded.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0010|HistoryArchiveMatrix.test.ets|assert0030|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0010|HistoryArchiveMatrix.test.ets|assert0031|assertEqual|actual', loaded.notice)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0010|HistoryArchiveMatrix.test.ets|assert0031|assertEqual|expected', ''));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0010|HistoryArchiveMatrix.test.ets|assert0032|assertFalse|actual|expected=false', loaded.recovered)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_1100
     * @tc.name      testAutoStartupHistoryArchive0011
     * @tc.desc      Verify corrupt JSON is reported as recovered with empty records
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0011', 0, (): void => {
      configureTestText();
      const loaded = parseHistory('{"schema":1,"records":', 1700000000000);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0011|HistoryArchiveMatrix.test.ets|assert0033|assertEqual|actual', loaded.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0011|HistoryArchiveMatrix.test.ets|assert0033|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0011|HistoryArchiveMatrix.test.ets|assert0034|assertTrue|actual|expected=true', loaded.recovered)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0011|HistoryArchiveMatrix.test.ets|assert0035|assertTrue|actual|expected=true', loaded.notice.indexOf('损坏') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_1200
     * @tc.name      testAutoStartupHistoryArchive0012
     * @tc.desc      Verify a legacy bare array is migrated into the current schema
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0012', 0, (): void => {
      configureTestText();
      const legacy: QueryRecord[] = [recordOf(1, 1700000000000, RefreshSource.MANUAL, '已开启')];
      const loaded = parseHistory(JSON.stringify(legacy), 1700000000000);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0012|HistoryArchiveMatrix.test.ets|assert0036|assertEqual|actual', loaded.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0012|HistoryArchiveMatrix.test.ets|assert0036|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0012|HistoryArchiveMatrix.test.ets|assert0037|assertTrue|actual|expected=true', loaded.recovered)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0012|HistoryArchiveMatrix.test.ets|assert0038|assertTrue|actual|expected=true', loaded.notice.indexOf('迁移旧版') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0012|HistoryArchiveMatrix.test.ets|assert0039|assertEqual|actual', loaded.records[0].outcome)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0012|HistoryArchiveMatrix.test.ets|assert0039|assertEqual|expected', QueryOutcome.SUCCESS));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_1300
     * @tc.name      testAutoStartupHistoryArchive0013
     * @tc.desc      Verify unsupported schema version is ignored rather than half-loaded
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0013', 0, (): void => {
      configureTestText();
      const payload: string = JSON.stringify({
        schema: HISTORY_SCHEMA + 1,
        savedAt: 1700000000000,
        records: [recordOf(1, 1700000000000, RefreshSource.MANUAL, '已开启')]
      });
      const loaded = parseHistory(payload, 1700000000000);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0013|HistoryArchiveMatrix.test.ets|assert0040|assertEqual|actual', loaded.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0013|HistoryArchiveMatrix.test.ets|assert0040|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0013|HistoryArchiveMatrix.test.ets|assert0041|assertTrue|actual|expected=true', loaded.recovered)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0013|HistoryArchiveMatrix.test.ets|assert0042|assertTrue|actual|expected=true', loaded.notice.indexOf('版本') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_1400
     * @tc.name      testAutoStartupHistoryArchive0014
     * @tc.desc      Verify a document without a records array is rejected
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0014', 0, (): void => {
      configureTestText();
      const loaded = parseHistory(JSON.stringify({ schema: HISTORY_SCHEMA, savedAt: 1 }), 1700000000000);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0014|HistoryArchiveMatrix.test.ets|assert0043|assertEqual|actual', loaded.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0014|HistoryArchiveMatrix.test.ets|assert0043|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0014|HistoryArchiveMatrix.test.ets|assert0044|assertTrue|actual|expected=true', loaded.recovered)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0014|HistoryArchiveMatrix.test.ets|assert0045|assertTrue|actual|expected=true', loaded.notice.indexOf('列表') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_1500
     * @tc.name      testAutoStartupHistoryArchive0015
     * @tc.desc      Verify records older than thirty days are dropped with a notice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0015', 0, (): void => {
      configureTestText();
      const now: number = 1700000000000;
      const fresh: QueryRecord = recordOf(1, now - DAY, RefreshSource.MANUAL, '已开启');
      const stale: QueryRecord = recordOf(2, now - HISTORY_MAX_AGE_MS - DAY, RefreshSource.MANUAL, '已开启');
      const loaded = parseHistory(serializeHistory([fresh, stale], now), now);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0015|HistoryArchiveMatrix.test.ets|assert0046|assertEqual|actual', loaded.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0015|HistoryArchiveMatrix.test.ets|assert0046|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0015|HistoryArchiveMatrix.test.ets|assert0047|assertEqual|actual', loaded.expired)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0015|HistoryArchiveMatrix.test.ets|assert0047|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0015|HistoryArchiveMatrix.test.ets|assert0048|assertTrue|actual|expected=true', loaded.notice.indexOf('超过 30 天') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_1600
     * @tc.name      testAutoStartupHistoryArchive0016
     * @tc.desc      Verify duplicate identifiers keep the first occurrence only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0016', 0, (): void => {
      configureTestText();
      const now: number = 1700000000000;
      const first: QueryRecord = recordOf(7, now - DAY, RefreshSource.MANUAL, '已开启');
      const duplicate: QueryRecord = recordOf(7, now - 2 * DAY, RefreshSource.FOREGROUND, '未开启');
      const loaded = parseHistory(serializeHistory([first, duplicate], now), now);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0016|HistoryArchiveMatrix.test.ets|assert0049|assertEqual|actual', loaded.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0016|HistoryArchiveMatrix.test.ets|assert0049|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0016|HistoryArchiveMatrix.test.ets|assert0050|assertEqual|actual', loaded.records[0].source)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0016|HistoryArchiveMatrix.test.ets|assert0050|assertEqual|expected', RefreshSource.MANUAL));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0016|HistoryArchiveMatrix.test.ets|assert0051|assertEqual|actual', loaded.records[0].timestamp)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0016|HistoryArchiveMatrix.test.ets|assert0051|assertEqual|expected', now - DAY));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_1700
     * @tc.name      testAutoStartupHistoryArchive0017
     * @tc.desc      Verify restored records are ordered newest first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0017', 0, (): void => {
      configureTestText();
      const now: number = 1700000000000;
      const older: QueryRecord = recordOf(1, now - 3 * DAY, RefreshSource.MANUAL, '已开启');
      const newer: QueryRecord = recordOf(2, now - DAY, RefreshSource.MANUAL, '已开启');
      const loaded = parseHistory(serializeHistory([older, newer], now), now);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0017|HistoryArchiveMatrix.test.ets|assert0052|assertEqual|actual', loaded.records.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0017|HistoryArchiveMatrix.test.ets|assert0052|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0017|HistoryArchiveMatrix.test.ets|assert0053|assertEqual|actual', loaded.records[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0017|HistoryArchiveMatrix.test.ets|assert0053|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0017|HistoryArchiveMatrix.test.ets|assert0054|assertEqual|actual', loaded.records[1].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0017|HistoryArchiveMatrix.test.ets|assert0054|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0017|HistoryArchiveMatrix.test.ets|assert0055|assertTrue|actual|expected=true', loaded.records[0].timestamp > loaded.records[1].timestamp)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_1800
     * @tc.name      testAutoStartupHistoryArchive0018
     * @tc.desc      Verify filtering by 全部 or empty returns an independent copy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0018', 0, (): void => {
      configureTestText();
      const records: QueryRecord[] = [recordOf(1, 1700000000000, RefreshSource.MANUAL, '已开启')];
      const all: QueryRecord[] = filterHistory(records, '全部');
      const none: QueryRecord[] = filterHistory(records, '');
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0018|HistoryArchiveMatrix.test.ets|assert0056|assertEqual|actual', all.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0018|HistoryArchiveMatrix.test.ets|assert0056|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0018|HistoryArchiveMatrix.test.ets|assert0057|assertEqual|actual', none.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0018|HistoryArchiveMatrix.test.ets|assert0057|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0018|HistoryArchiveMatrix.test.ets|assert0058|assertFalse|actual|expected=false', all === records)).assertFalse();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_1900
     * @tc.name      testAutoStartupHistoryArchive0020
     * @tc.desc      Verify localized filter labels select by persisted outcome
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0020', 0, (): void => {
      configureTestText();
      const records: QueryRecord[] = [
        recordOf(1, 1700000000000, RefreshSource.MANUAL, '已开启', QueryOutcome.SUCCESS),
        recordOf(2, 1700000000000, RefreshSource.MANUAL, '失败', QueryOutcome.FAILURE),
        recordOf(3, 1700000000000, RefreshSource.MANUAL, '不支持', QueryOutcome.UNSUPPORTED),
        recordOf(4, 1700000000000, RefreshSource.MANUAL, '超时', QueryOutcome.TIMEOUT)
      ];
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0020|HistoryArchiveMatrix.test.ets|assert0059|assertEqual|actual', filterHistory(records, '成功').length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0020|HistoryArchiveMatrix.test.ets|assert0059|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0020|HistoryArchiveMatrix.test.ets|assert0060|assertEqual|actual', filterHistory(records, '失败')[0].id)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0020|HistoryArchiveMatrix.test.ets|assert0060|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0020|HistoryArchiveMatrix.test.ets|assert0061|assertEqual|actual', filterHistory(records, '不支持').length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0020|HistoryArchiveMatrix.test.ets|assert0061|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0020|HistoryArchiveMatrix.test.ets|assert0062|assertEqual|actual', filterHistory(records, '超时').length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0020|HistoryArchiveMatrix.test.ets|assert0062|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0020|HistoryArchiveMatrix.test.ets|assert0063|assertEqual|actual', filterHistory(records, 'none').length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0020|HistoryArchiveMatrix.test.ets|assert0063|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_2000
     * @tc.name      testAutoStartupHistoryArchive0021
     * @tc.desc      Verify outcome labels cover every persisted outcome plus unknown
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0021', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0021|HistoryArchiveMatrix.test.ets|assert0064|assertEqual|actual', outcomeLabel(QueryOutcome.SUCCESS))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0021|HistoryArchiveMatrix.test.ets|assert0064|assertEqual|expected', '成功'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0021|HistoryArchiveMatrix.test.ets|assert0065|assertEqual|actual', outcomeLabel(QueryOutcome.FAILURE))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0021|HistoryArchiveMatrix.test.ets|assert0065|assertEqual|expected', '失败'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0021|HistoryArchiveMatrix.test.ets|assert0066|assertEqual|actual', outcomeLabel(QueryOutcome.UNSUPPORTED))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0021|HistoryArchiveMatrix.test.ets|assert0066|assertEqual|expected', '不支持'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0021|HistoryArchiveMatrix.test.ets|assert0067|assertEqual|actual', outcomeLabel(QueryOutcome.TIMEOUT))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0021|HistoryArchiveMatrix.test.ets|assert0067|assertEqual|expected', '超时'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0021|HistoryArchiveMatrix.test.ets|assert0068|assertEqual|actual', outcomeLabel(QueryOutcome.UNKNOWN))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0021|HistoryArchiveMatrix.test.ets|assert0068|assertEqual|expected', '未知'));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_2100
     * @tc.name      testAutoStartupHistoryArchive0022
     * @tc.desc      Verify export redacts email, phone and long numeric identifiers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0022', 0, (): void => {
      configureTestText();
      const record: QueryRecord = recordOf(31, 1700000000000, RefreshSource.MANUAL, '已开启');
      record.errorMessage = '联系 user@example.com 或 13800138000 账号 123456789012';
      const text: string = exportRedacted([record], 1700000000000);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0022|HistoryArchiveMatrix.test.ets|assert0069|assertEqual|actual', text.indexOf('user@example.com'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0022|HistoryArchiveMatrix.test.ets|assert0069|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0022|HistoryArchiveMatrix.test.ets|assert0070|assertEqual|actual', text.indexOf('13800138000'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0022|HistoryArchiveMatrix.test.ets|assert0070|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0022|HistoryArchiveMatrix.test.ets|assert0071|assertEqual|actual', text.indexOf('123456789012'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0022|HistoryArchiveMatrix.test.ets|assert0071|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0022|HistoryArchiveMatrix.test.ets|assert0072|assertTrue|actual|expected=true', text.indexOf('[邮箱]') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0022|HistoryArchiveMatrix.test.ets|assert0073|assertTrue|actual|expected=true', text.indexOf('记录数：1') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_2200
     * @tc.name      testAutoStartupHistoryArchive0023
     * @tc.desc      Verify export omits the explanation line when no error message exists
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0023', 0, (): void => {
      configureTestText();
      const plain: QueryRecord = recordOf(32, 1700000000000, RefreshSource.MANUAL, '已开启');
      const detailed: QueryRecord = recordOf(33, 1700000000000, RefreshSource.MANUAL, '已开启');
      detailed.errorMessage = '等待超时后返回';
      const plainText: string = exportRedacted([plain], 1700000000000);
      const detailedText: string = exportRedacted([detailed], 1700000000000);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0023|HistoryArchiveMatrix.test.ets|assert0074|assertEqual|actual', plainText.indexOf('说明：'))).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0023|HistoryArchiveMatrix.test.ets|assert0074|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0023|HistoryArchiveMatrix.test.ets|assert0075|assertTrue|actual|expected=true', detailedText.indexOf('说明：等待超时后返回') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0023|HistoryArchiveMatrix.test.ets|assert0076|assertTrue|actual|expected=true', detailedText.indexOf('#33') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_2300
     * @tc.name      testAutoStartupHistoryArchive0024
     * @tc.desc      Verify summary counts outcomes and picks the newest valid identifier
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0024', 0, (): void => {
      configureTestText();
      const now: number = 1700000000000;
      const records: QueryRecord[] = [
        recordOf(5, now - DAY, RefreshSource.MANUAL, '已开启', QueryOutcome.SUCCESS),
        recordOf(6, now - 2 * DAY, RefreshSource.MANUAL, '已开启', QueryOutcome.SUCCESS),
        recordOf(7, now - 3 * DAY, RefreshSource.MANUAL, '失败', QueryOutcome.FAILURE),
        recordOf(8, now - 4 * DAY, RefreshSource.MANUAL, '不支持', QueryOutcome.UNSUPPORTED),
        recordOf(9, now - 5 * DAY, RefreshSource.MANUAL, '超时', QueryOutcome.TIMEOUT),
        recordOf(10, now - 6 * DAY, RefreshSource.MANUAL, '未知', QueryOutcome.UNKNOWN)
      ];
      const summary: HistorySummary = summarizeHistory(records, now);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0077|assertEqual|actual', summary.total)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0077|assertEqual|expected', 6));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0078|assertEqual|actual', summary.success)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0078|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0079|assertEqual|actual', summary.failure)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0079|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0080|assertEqual|actual', summary.unsupported)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0080|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0081|assertEqual|actual', summary.timeout)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0081|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0082|assertEqual|actual', summary.unknown)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0082|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0083|assertEqual|actual', summary.latestValidId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0024|HistoryArchiveMatrix.test.ets|assert0083|assertEqual|expected', 5));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_2400
     * @tc.name      testAutoStartupHistoryArchive0025
     * @tc.desc      Verify summary tracks newest/oldest timestamps and near-expiry count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0025', 0, (): void => {
      configureTestText();
      const now: number = 1700000000000;
      const nearExpiry: QueryRecord = recordOf(1, now - HISTORY_MAX_AGE_MS + 2 * 60 * 60 * 1000,
        RefreshSource.MANUAL, '已开启');
      const fresh: QueryRecord = recordOf(2, now - DAY, RefreshSource.MANUAL, '已开启');
      const summary: HistorySummary = summarizeHistory([nearExpiry, fresh], now);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0025|HistoryArchiveMatrix.test.ets|assert0084|assertEqual|actual', summary.newestAt)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0025|HistoryArchiveMatrix.test.ets|assert0084|assertEqual|expected', now - DAY));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0025|HistoryArchiveMatrix.test.ets|assert0085|assertEqual|actual', summary.oldestAt)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0025|HistoryArchiveMatrix.test.ets|assert0085|assertEqual|expected', nearExpiry.timestamp));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0025|HistoryArchiveMatrix.test.ets|assert0086|assertEqual|actual', summary.expiringSoon)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0025|HistoryArchiveMatrix.test.ets|assert0086|assertEqual|expected', 1));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_2500
     * @tc.name      testAutoStartupHistoryArchive0026
     * @tc.desc      Verify latest comparison reports delta and change state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0026', 0, (): void => {
      configureTestText();
      const now: number = 1700000000000;
      const latest: QueryRecord = recordOf(2, now, RefreshSource.MANUAL, '已开启');
      const previous: QueryRecord = recordOf(1, now - DAY, RefreshSource.MANUAL, '未开启');
      const comparison: HistoryComparison = compareLatestRecords([latest, previous]);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0026|HistoryArchiveMatrix.test.ets|assert0087|assertEqual|actual', comparison.afterId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0026|HistoryArchiveMatrix.test.ets|assert0087|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0026|HistoryArchiveMatrix.test.ets|assert0088|assertEqual|actual', comparison.beforeId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0026|HistoryArchiveMatrix.test.ets|assert0088|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0026|HistoryArchiveMatrix.test.ets|assert0089|assertEqual|actual', comparison.deltaMillis)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0026|HistoryArchiveMatrix.test.ets|assert0089|assertEqual|expected', DAY));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0026|HistoryArchiveMatrix.test.ets|assert0090|assertTrue|actual|expected=true', comparison.changed)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_2600
     * @tc.name      testAutoStartupHistoryArchive0027
     * @tc.desc      Verify single and empty history comparisons stay neutral
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0027', 0, (): void => {
      configureTestText();
      const empty: HistoryComparison = compareLatestRecords([]);
      const single: HistoryComparison = compareLatestRecords(
        [recordOf(1, 1700000000000, RefreshSource.MANUAL, '已开启')]);
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0027|HistoryArchiveMatrix.test.ets|assert0091|assertEqual|actual', empty.afterId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0027|HistoryArchiveMatrix.test.ets|assert0091|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0027|HistoryArchiveMatrix.test.ets|assert0092|assertFalse|actual|expected=false', empty.changed)).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0027|HistoryArchiveMatrix.test.ets|assert0093|assertEqual|actual', single.afterId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0027|HistoryArchiveMatrix.test.ets|assert0093|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0027|HistoryArchiveMatrix.test.ets|assert0094|assertEqual|actual', single.beforeId)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0027|HistoryArchiveMatrix.test.ets|assert0094|assertEqual|expected', -1));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0027|HistoryArchiveMatrix.test.ets|assert0095|assertEqual|actual', single.deltaMillis)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0027|HistoryArchiveMatrix.test.ets|assert0095|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_2700
     * @tc.name      testAutoStartupHistoryArchive0028
     * @tc.desc      Verify advanced filter combines source, outcome and time window
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0028', 0, (): void => {
      configureTestText();
      const now: number = 1700000000000;
      const records: QueryRecord[] = [
        recordOf(1, now - 2 * DAY, RefreshSource.MANUAL, '已开启', QueryOutcome.SUCCESS),
        recordOf(2, now - DAY, RefreshSource.SETTINGS, '已开启', QueryOutcome.SUCCESS),
        recordOf(3, now, RefreshSource.MANUAL, '失败', QueryOutcome.FAILURE)
      ];
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0028|HistoryArchiveMatrix.test.ets|assert0096|assertEqual|actual', filterHistoryAdvanced(records, RefreshSource.MANUAL as string, '', 0, 0).length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0028|HistoryArchiveMatrix.test.ets|assert0096|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0028|HistoryArchiveMatrix.test.ets|assert0097|assertEqual|actual', filterHistoryAdvanced(records, '', QueryOutcome.SUCCESS as string, 0, 0).length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0028|HistoryArchiveMatrix.test.ets|assert0097|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0028|HistoryArchiveMatrix.test.ets|assert0098|assertEqual|actual', filterHistoryAdvanced(records, '', '', now - DAY, now).length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0028|HistoryArchiveMatrix.test.ets|assert0098|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0028|HistoryArchiveMatrix.test.ets|assert0099|assertEqual|actual', filterHistoryAdvanced(records, RefreshSource.MANUAL as string, QueryOutcome.SUCCESS as string,
        now - 3 * DAY, now).length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0028|HistoryArchiveMatrix.test.ets|assert0099|assertEqual|expected', 1));
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_2800
     * @tc.name      testAutoStartupHistoryArchive0029
     * @tc.desc      Verify bounded message keeps short text and truncates long text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0029', 0, (): void => {
      configureTestText();
      const short: string = boundedMessage('查询失败');
      const long: string = boundedMessage('x'.repeat(HISTORY_MESSAGE_LIMIT + 10));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0029|HistoryArchiveMatrix.test.ets|assert0100|assertEqual|actual', short)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0029|HistoryArchiveMatrix.test.ets|assert0100|assertEqual|expected', '查询失败'));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0029|HistoryArchiveMatrix.test.ets|assert0101|assertEqual|actual', long.length)).assertEqual(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0029|HistoryArchiveMatrix.test.ets|assert0101|assertEqual|expected', HISTORY_MESSAGE_LIMIT));
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0029|HistoryArchiveMatrix.test.ets|assert0102|assertTrue|actual|expected=true', long.endsWith('…'))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_AUTOSTARTUPHISTORYARCHIVE_2900
     * @tc.name      testAutoStartupHistoryArchive0030
     * @tc.desc      Verify export truncates a long redacted message at the export limit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAutoStartupHistoryArchive0030', 0, (): void => {
      configureTestText();
      const record: QueryRecord = recordOf(41, 1700000000000, RefreshSource.MANUAL, '已开启');
      record.errorMessage = 'y'.repeat(EXPORT_MESSAGE_LIMIT * 3);
      const text: string = exportRedacted([record], 1700000000000);
      const explanation: string = text.split('\n').filter((line: string): boolean =>
        line.indexOf('说明：') >= 0)[0];
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0030|HistoryArchiveMatrix.test.ets|assert0103|assertTrue|actual|expected=true', explanation !== undefined)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0030|HistoryArchiveMatrix.test.ets|assert0104|assertTrue|actual|expected=true', explanation.endsWith('…'))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_AutoStartupHistoryArchive_0030|HistoryArchiveMatrix.test.ets|assert0105|assertTrue|actual|expected=true', text.indexOf('yyyyyyyyyy') >= 0)).assertTrue();
    });
  });
}
