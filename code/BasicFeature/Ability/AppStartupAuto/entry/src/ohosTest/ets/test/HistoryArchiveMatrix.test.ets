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
      const record: QueryRecord = recordOf(1, 1700000000000, RefreshSource.INITIAL, '已开启',
        'pending' as QueryOutcome);
      const normalized: QueryRecord | undefined = normalizeRecord(record);
      expect(normalized !== undefined).assertTrue();
      expect(normalized?.outcome).assertEqual(QueryOutcome.SUCCESS);
      expect(normalized?.id).assertEqual(1);
      expect(normalized?.durationMillis).assertEqual(12);
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
      const unsupported: QueryRecord | undefined = normalizeRecord(
        recordOf(2, 1700000000000, RefreshSource.MANUAL, '设备不支持', 'pending' as QueryOutcome));
      const timeout: QueryRecord | undefined = normalizeRecord(
        recordOf(3, 1700000000000, RefreshSource.FOREGROUND, '等待超时', 'pending' as QueryOutcome));
      expect(unsupported?.outcome).assertEqual(QueryOutcome.UNSUPPORTED);
      expect(timeout?.outcome).assertEqual(QueryOutcome.TIMEOUT);
      expect(unsupported?.source).assertEqual(RefreshSource.MANUAL);
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
      const empty: QueryRecord | undefined = normalizeRecord(
        recordOf(4, 1700000000000, RefreshSource.INITIAL, ' ', 'pending' as QueryOutcome));
      const custom: QueryRecord | undefined = normalizeRecord(
        recordOf(5, 1700000000000, RefreshSource.INITIAL, '未知结果', 'pending' as QueryOutcome));
      expect(empty?.outcome).assertEqual(QueryOutcome.FAILURE);
      expect(custom?.outcome).assertEqual(QueryOutcome.FAILURE);
      expect(custom?.result).assertEqual('未知结果');
      expect(normalizeRecord(recordOf(14, 1700000000000, RefreshSource.INITIAL, '')) === undefined).assertTrue();
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
      const zero: QueryRecord = recordOf(0, 1700000000000, RefreshSource.INITIAL, '已开启');
      const negative: QueryRecord = recordOf(-3, 1700000000000, RefreshSource.INITIAL, '已开启');
      const fractional: QueryRecord = recordOf(1.5, 1700000000000, RefreshSource.INITIAL, '已开启');
      expect(normalizeRecord(zero) === undefined).assertTrue();
      expect(normalizeRecord(negative) === undefined).assertTrue();
      expect(normalizeRecord(fractional) === undefined).assertTrue();
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
      const badSource: QueryRecord = recordOf(6, 1700000000000, RefreshSource.INITIAL, '已开启');
      badSource.source = 'not-a-source' as RefreshSource;
      const emptyResult: QueryRecord = recordOf(7, 1700000000000, RefreshSource.INITIAL, '');
      const badDuration: QueryRecord = recordOf(8, 1700000000000, RefreshSource.INITIAL, '已开启');
      badDuration.durationMillis = -1;
      expect(normalizeRecord(badSource) === undefined).assertTrue();
      expect(normalizeRecord(emptyResult) === undefined).assertTrue();
      expect(normalizeRecord(badDuration) === undefined).assertTrue();
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
      const longResult: QueryRecord = recordOf(9, 1700000000000, RefreshSource.INITIAL, 'x'.repeat(201));
      const longMessage: QueryRecord = recordOf(10, 1700000000000, RefreshSource.INITIAL, '已开启');
      longMessage.errorMessage = 'm'.repeat(HISTORY_MESSAGE_LIMIT + 1);
      const longCode: QueryRecord = recordOf(11, 1700000000000, RefreshSource.INITIAL, '已开启');
      longCode.errorCode = 'c'.repeat(65);
      expect(normalizeRecord(longResult) === undefined).assertTrue();
      expect(normalizeRecord(longMessage) === undefined).assertTrue();
      expect(normalizeRecord(longCode) === undefined).assertTrue();
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
      const explicit: QueryRecord | undefined = normalizeRecord(
        recordOf(12, 1700000000000, RefreshSource.SETTINGS, '已开启', QueryOutcome.FAILURE));
      const derived: QueryRecord | undefined = normalizeRecord(
        recordOf(13, 1700000000000, RefreshSource.SETTINGS, '已开启', 'pending' as QueryOutcome));
      expect(explicit?.outcome).assertEqual(QueryOutcome.FAILURE);
      expect(derived?.outcome).assertEqual(QueryOutcome.SUCCESS);
      expect(explicit?.source).assertEqual(RefreshSource.SETTINGS);
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
      const records: QueryRecord[] = [];
      for (let index: number = 1; index <= HISTORY_LIMIT + 5; index++) {
        records.push(recordOf(index, 1700000000000 + index, RefreshSource.MANUAL, '已开启'));
      }
      const raw: string = serializeHistory(records, 1700000000000);
      const loaded = parseHistory(raw, 1700000000000);
      expect(loaded.records.length).assertEqual(HISTORY_LIMIT);
      expect(loaded.records[0].id).assertEqual(HISTORY_LIMIT);
      expect(loaded.recovered).assertFalse();
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
      const record: QueryRecord = recordOf(21, 1700000000000, RefreshSource.MANUAL, '已开启');
      record.errorMessage = 'e'.repeat(HISTORY_MESSAGE_LIMIT + 50);
      const raw: string = serializeHistory([record], 1700000000000);
      const loaded = parseHistory(raw, 1700000000000);
      expect(loaded.records.length).assertEqual(1);
      expect(loaded.records[0].errorMessage.length <= HISTORY_MESSAGE_LIMIT).assertTrue();
      expect(raw.indexOf(`"schema":${HISTORY_SCHEMA}`) >= 0).assertTrue();
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
      const loaded = parseHistory('', 1700000000000);
      expect(loaded.records.length).assertEqual(0);
      expect(loaded.notice).assertEqual('');
      expect(loaded.recovered).assertFalse();
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
      const loaded = parseHistory('{"schema":1,"records":', 1700000000000);
      expect(loaded.records.length).assertEqual(0);
      expect(loaded.recovered).assertTrue();
      expect(loaded.notice.indexOf('损坏') >= 0).assertTrue();
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
      const legacy: QueryRecord[] = [recordOf(1, 1700000000000, RefreshSource.MANUAL, '已开启')];
      const loaded = parseHistory(JSON.stringify(legacy), 1700000000000);
      expect(loaded.records.length).assertEqual(1);
      expect(loaded.recovered).assertTrue();
      expect(loaded.notice.indexOf('迁移旧版') >= 0).assertTrue();
      expect(loaded.records[0].outcome).assertEqual(QueryOutcome.SUCCESS);
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
      const payload: string = JSON.stringify({
        schema: HISTORY_SCHEMA + 1,
        savedAt: 1700000000000,
        records: [recordOf(1, 1700000000000, RefreshSource.MANUAL, '已开启')]
      });
      const loaded = parseHistory(payload, 1700000000000);
      expect(loaded.records.length).assertEqual(0);
      expect(loaded.recovered).assertTrue();
      expect(loaded.notice.indexOf('版本') >= 0).assertTrue();
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
      const loaded = parseHistory(JSON.stringify({ schema: HISTORY_SCHEMA, savedAt: 1 }), 1700000000000);
      expect(loaded.records.length).assertEqual(0);
      expect(loaded.recovered).assertTrue();
      expect(loaded.notice.indexOf('列表') >= 0).assertTrue();
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
      const now: number = 1700000000000;
      const fresh: QueryRecord = recordOf(1, now - DAY, RefreshSource.MANUAL, '已开启');
      const stale: QueryRecord = recordOf(2, now - HISTORY_MAX_AGE_MS - DAY, RefreshSource.MANUAL, '已开启');
      const loaded = parseHistory(serializeHistory([fresh, stale], now), now);
      expect(loaded.records.length).assertEqual(1);
      expect(loaded.expired).assertEqual(1);
      expect(loaded.notice.indexOf('超过 30 天') >= 0).assertTrue();
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
      const now: number = 1700000000000;
      const first: QueryRecord = recordOf(7, now - DAY, RefreshSource.MANUAL, '已开启');
      const duplicate: QueryRecord = recordOf(7, now - 2 * DAY, RefreshSource.FOREGROUND, '未开启');
      const loaded = parseHistory(serializeHistory([first, duplicate], now), now);
      expect(loaded.records.length).assertEqual(1);
      expect(loaded.records[0].source).assertEqual(RefreshSource.MANUAL);
      expect(loaded.records[0].timestamp).assertEqual(now - DAY);
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
      const now: number = 1700000000000;
      const older: QueryRecord = recordOf(1, now - 3 * DAY, RefreshSource.MANUAL, '已开启');
      const newer: QueryRecord = recordOf(2, now - DAY, RefreshSource.MANUAL, '已开启');
      const loaded = parseHistory(serializeHistory([older, newer], now), now);
      expect(loaded.records.length).assertEqual(2);
      expect(loaded.records[0].id).assertEqual(2);
      expect(loaded.records[1].id).assertEqual(1);
      expect(loaded.records[0].timestamp > loaded.records[1].timestamp).assertTrue();
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
      const records: QueryRecord[] = [recordOf(1, 1700000000000, RefreshSource.MANUAL, '已开启')];
      const all: QueryRecord[] = filterHistory(records, '全部');
      const none: QueryRecord[] = filterHistory(records, '');
      expect(all.length).assertEqual(1);
      expect(none.length).assertEqual(1);
      expect(all === records).assertFalse();
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
      const records: QueryRecord[] = [
        recordOf(1, 1700000000000, RefreshSource.MANUAL, '已开启', QueryOutcome.SUCCESS),
        recordOf(2, 1700000000000, RefreshSource.MANUAL, '失败', QueryOutcome.FAILURE),
        recordOf(3, 1700000000000, RefreshSource.MANUAL, '不支持', QueryOutcome.UNSUPPORTED),
        recordOf(4, 1700000000000, RefreshSource.MANUAL, '超时', QueryOutcome.TIMEOUT)
      ];
      expect(filterHistory(records, '成功').length).assertEqual(1);
      expect(filterHistory(records, '失败')[0].id).assertEqual(2);
      expect(filterHistory(records, '不支持').length).assertEqual(1);
      expect(filterHistory(records, '超时').length).assertEqual(1);
      expect(filterHistory(records, 'none').length).assertEqual(0);
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
      expect(outcomeLabel(QueryOutcome.SUCCESS)).assertEqual('成功');
      expect(outcomeLabel(QueryOutcome.FAILURE)).assertEqual('失败');
      expect(outcomeLabel(QueryOutcome.UNSUPPORTED)).assertEqual('不支持');
      expect(outcomeLabel(QueryOutcome.TIMEOUT)).assertEqual('超时');
      expect(outcomeLabel(QueryOutcome.UNKNOWN)).assertEqual('未知');
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
      const record: QueryRecord = recordOf(31, 1700000000000, RefreshSource.MANUAL, '已开启');
      record.errorMessage = '联系 user@example.com 或 13800138000 账号 123456789012';
      const text: string = exportRedacted([record], 1700000000000);
      expect(text.indexOf('user@example.com')).assertEqual(-1);
      expect(text.indexOf('13800138000')).assertEqual(-1);
      expect(text.indexOf('123456789012')).assertEqual(-1);
      expect(text.indexOf('[邮箱]') >= 0).assertTrue();
      expect(text.indexOf('记录数：1') >= 0).assertTrue();
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
      const plain: QueryRecord = recordOf(32, 1700000000000, RefreshSource.MANUAL, '已开启');
      const detailed: QueryRecord = recordOf(33, 1700000000000, RefreshSource.MANUAL, '已开启');
      detailed.errorMessage = '等待超时后返回';
      const plainText: string = exportRedacted([plain], 1700000000000);
      const detailedText: string = exportRedacted([detailed], 1700000000000);
      expect(plainText.indexOf('说明：')).assertEqual(-1);
      expect(detailedText.indexOf('说明：等待超时后返回') >= 0).assertTrue();
      expect(detailedText.indexOf('#33') >= 0).assertTrue();
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
      expect(summary.total).assertEqual(6);
      expect(summary.success).assertEqual(2);
      expect(summary.failure).assertEqual(1);
      expect(summary.unsupported).assertEqual(1);
      expect(summary.timeout).assertEqual(1);
      expect(summary.unknown).assertEqual(1);
      expect(summary.latestValidId).assertEqual(5);
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
      const now: number = 1700000000000;
      const nearExpiry: QueryRecord = recordOf(1, now - HISTORY_MAX_AGE_MS + 2 * 60 * 60 * 1000,
        RefreshSource.MANUAL, '已开启');
      const fresh: QueryRecord = recordOf(2, now - DAY, RefreshSource.MANUAL, '已开启');
      const summary: HistorySummary = summarizeHistory([nearExpiry, fresh], now);
      expect(summary.newestAt).assertEqual(now - DAY);
      expect(summary.oldestAt).assertEqual(nearExpiry.timestamp);
      expect(summary.expiringSoon).assertEqual(1);
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
      const now: number = 1700000000000;
      const latest: QueryRecord = recordOf(2, now, RefreshSource.MANUAL, '已开启');
      const previous: QueryRecord = recordOf(1, now - DAY, RefreshSource.MANUAL, '未开启');
      const comparison: HistoryComparison = compareLatestRecords([latest, previous]);
      expect(comparison.afterId).assertEqual(2);
      expect(comparison.beforeId).assertEqual(1);
      expect(comparison.deltaMillis).assertEqual(DAY);
      expect(comparison.changed).assertTrue();
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
      const empty: HistoryComparison = compareLatestRecords([]);
      const single: HistoryComparison = compareLatestRecords(
        [recordOf(1, 1700000000000, RefreshSource.MANUAL, '已开启')]);
      expect(empty.afterId).assertEqual(-1);
      expect(empty.changed).assertFalse();
      expect(single.afterId).assertEqual(1);
      expect(single.beforeId).assertEqual(-1);
      expect(single.deltaMillis).assertEqual(0);
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
      const now: number = 1700000000000;
      const records: QueryRecord[] = [
        recordOf(1, now - 2 * DAY, RefreshSource.MANUAL, '已开启', QueryOutcome.SUCCESS),
        recordOf(2, now - DAY, RefreshSource.SETTINGS, '已开启', QueryOutcome.SUCCESS),
        recordOf(3, now, RefreshSource.MANUAL, '失败', QueryOutcome.FAILURE)
      ];
      expect(filterHistoryAdvanced(records, RefreshSource.MANUAL as string, '', 0, 0).length).assertEqual(2);
      expect(filterHistoryAdvanced(records, '', QueryOutcome.SUCCESS as string, 0, 0).length).assertEqual(2);
      expect(filterHistoryAdvanced(records, '', '', now - DAY, now).length).assertEqual(2);
      expect(filterHistoryAdvanced(records, RefreshSource.MANUAL as string, QueryOutcome.SUCCESS as string,
        now - 3 * DAY, now).length).assertEqual(1);
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
      const short: string = boundedMessage('查询失败');
      const long: string = boundedMessage('x'.repeat(HISTORY_MESSAGE_LIMIT + 10));
      expect(short).assertEqual('查询失败');
      expect(long.length).assertEqual(HISTORY_MESSAGE_LIMIT);
      expect(long.endsWith('…')).assertTrue();
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
      const record: QueryRecord = recordOf(41, 1700000000000, RefreshSource.MANUAL, '已开启');
      record.errorMessage = 'y'.repeat(EXPORT_MESSAGE_LIMIT * 3);
      const text: string = exportRedacted([record], 1700000000000);
      const explanation: string = text.split('\n').filter((line: string): boolean =>
        line.indexOf('说明：') >= 0)[0];
      expect(explanation !== undefined).assertTrue();
      expect(explanation.endsWith('…')).assertTrue();
      expect(text.indexOf('yyyyyyyyyy') >= 0).assertTrue();
    });
  });
}

