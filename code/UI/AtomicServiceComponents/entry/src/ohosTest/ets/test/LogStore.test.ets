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
 
import { describe, it, expect } from '@ohos/hypium';
import { LOG_STORE_CAPACITY } from '../../../main/ets/common/AppConstants';
import {
  LogItem,
  LogLevel,
  appendLog,
  clearLogs,
  countByTag,
  logLevelName,
  queryLogs
} from '../../../main/ets/model/LogStore';

const FIXED_TIME: Date = new Date(2026, 9, 27, 1, 2, 3);

export default function logStoreTest() {
  describe('logStoreTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_0100
     * @tc.name logItemDefaultsAndIds001
     * @tc.desc Verify LogItem defaults to INFO, formats the time and assigns increasing ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logItem_defaultsAndIds', 0, () => {
      const first = new LogItem('设备', '用例', '默认级别', LogLevel.INFO, FIXED_TIME);
      const second = new LogItem('设备', '用例', '第二条', LogLevel.WARN, FIXED_TIME);
      expect(first.level).assertEqual(LogLevel.INFO);
      expect(first.time).assertEqual('01:02:03');
      expect(second.time).assertEqual('01:02:03');
      expect(second.id).assertEqual(first.id + 1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_0200
     * @tc.name logItemCustomFields002
     * @tc.desc Verify LogItem keeps the custom source, tag, detail and level values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logItem_customFields', 0, () => {
      const item = new LogItem('页面', '下载', '文件已保存', LogLevel.ERROR, FIXED_TIME);
      expect(item.source).assertEqual('页面');
      expect(item.tag).assertEqual('下载');
      expect(item.detail).assertEqual('文件已保存');
      expect(item.level).assertEqual(LogLevel.ERROR);
      expect(item.time).assertEqual('01:02:03');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_0300
     * @tc.name logLevelNameMapping003
     * @tc.desc Verify every log level maps to its display name and INFO uses the default branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logLevelName_mapping', 0, () => {
      expect(logLevelName(LogLevel.DEBUG)).assertEqual('DEBUG');
      expect(logLevelName(LogLevel.INFO)).assertEqual('INFO');
      expect(logLevelName(LogLevel.WARN)).assertEqual('WARN');
      expect(logLevelName(LogLevel.ERROR)).assertEqual('ERROR');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_0400
     * @tc.name appendLogPrependsNewest004
     * @tc.desc Verify appendLog inserts the newest item at the head while preserving older entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appendLog_prependsNewest', 0, () => {
      let logs: LogItem[] = [];
      logs = appendLog(logs, new LogItem('设备', 'A', '第一条', LogLevel.INFO, FIXED_TIME), 10);
      logs = appendLog(logs, new LogItem('设备', 'A', '第二条', LogLevel.INFO, FIXED_TIME), 10);
      expect(logs.length).assertEqual(2);
      expect(logs[0].detail).assertEqual('第二条');
      expect(logs[1].detail).assertEqual('第一条');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_0500
     * @tc.name appendLogTruncatesToCapacity005
     * @tc.desc Verify appendLog drops the oldest entries once the capacity limit is reached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appendLog_truncatesToCapacity', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 5; i++) {
        logs = appendLog(logs, new LogItem('设备', 'A', `条目${i}`, LogLevel.INFO, FIXED_TIME), 3);
      }
      expect(logs.length).assertEqual(3);
      expect(logs[0].detail).assertEqual('条目4');
      expect(logs[2].detail).assertEqual('条目2');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_0600
     * @tc.name appendLogZeroCapacityFallsBack006
     * @tc.desc Verify a non-positive capacity falls back to the default store capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appendLog_zeroCapacityFallsBack', 0, () => {
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      let logs: LogItem[] = [];
      for (let i = 0; i < 3; i++) {
        logs = appendLog(logs, new LogItem('设备', 'A', `条目${i}`, LogLevel.INFO, FIXED_TIME), 0);
      }
      expect(logs.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_0700
     * @tc.name appendLogDefaultCapacity007
     * @tc.desc Verify the default store keeps only the newest 200 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appendLog_defaultCapacity', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 205; i++) {
        logs = appendLog(logs, new LogItem('设备', 'A', `条目${i}`, LogLevel.INFO, FIXED_TIME));
      }
      expect(logs.length).assertEqual(LOG_STORE_CAPACITY);
      expect(logs[0].detail).assertEqual('条目204');
      expect(logs[199].detail).assertEqual('条目5');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_0800
     * @tc.name queryLogsSourceFilter008
     * @tc.desc Verify queryLogs filters by source and treats an empty source as no filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('queryLogs_sourceFilter', 0, () => {
      const logs: LogItem[] = [
        new LogItem('设备', 'A', 'alpha', LogLevel.INFO, FIXED_TIME),
        new LogItem('页面', 'B', 'beta', LogLevel.WARN, FIXED_TIME),
        new LogItem('设备', 'C', 'gamma', LogLevel.ERROR, FIXED_TIME)
      ];
      expect(queryLogs(logs, '设备').length).assertEqual(2);
      expect(queryLogs(logs, '页面').length).assertEqual(1);
      expect(queryLogs(logs, '').length).assertEqual(3);
      expect(queryLogs(logs, '服务').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_0900
     * @tc.name queryLogsMinLevel009
     * @tc.desc Verify queryLogs keeps only entries at or above the minimum level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('queryLogs_minLevel', 0, () => {
      const logs: LogItem[] = [
        new LogItem('设备', 'A', 'debug', LogLevel.DEBUG, FIXED_TIME),
        new LogItem('设备', 'B', 'info', LogLevel.INFO, FIXED_TIME),
        new LogItem('设备', 'C', 'warn', LogLevel.WARN, FIXED_TIME),
        new LogItem('设备', 'D', 'error', LogLevel.ERROR, FIXED_TIME)
      ];
      expect(queryLogs(logs, '', LogLevel.WARN).length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.DEBUG).length).assertEqual(4);
      expect(queryLogs(logs, '', LogLevel.ERROR).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_1000
     * @tc.name queryLogsKeywordAndLimit010
     * @tc.desc Verify keyword matching covers detail and tag, is case-insensitive and respects the limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('queryLogs_keywordAndLimit', 0, () => {
      const logs: LogItem[] = [
        new LogItem('设备', '下载', '下载完成 alpha', LogLevel.INFO, FIXED_TIME),
        new LogItem('设备', '搜索', '搜索 beta', LogLevel.INFO, FIXED_TIME),
        new LogItem('页面', '下载', '下载取消', LogLevel.INFO, FIXED_TIME)
      ];
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'BETA').length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, ' 下载 ').length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '标签不存在').length).assertEqual(0);
      expect(queryLogs(logs, '设备', LogLevel.DEBUG, '下载').length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 2).length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_1100
     * @tc.name countByTag011
     * @tc.desc Verify countByTag counts exact tag matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('countByTag_exactMatch', 0, () => {
      const logs: LogItem[] = [
        new LogItem('设备', '下载', 'a', LogLevel.INFO, FIXED_TIME),
        new LogItem('页面', '下载', 'b', LogLevel.INFO, FIXED_TIME),
        new LogItem('页面', '搜索', 'c', LogLevel.INFO, FIXED_TIME)
      ];
      expect(countByTag(logs, '下载')).assertEqual(2);
      expect(countByTag(logs, '搜索')).assertEqual(1);
      expect(countByTag(logs, '下载 ')).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_1200
     * @tc.name clearLogsReturnsEmpty012
     * @tc.desc Verify clearLogs yields an empty list independent of prior entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clearLogs_returnsEmpty', 0, () => {
      expect(clearLogs().length).assertEqual(0);
      expect(clearLogs().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTORE_1300
     * @tc.name queryLogsDefaultLimitTruncates013
     * @tc.desc Verify omitting the limit keeps only the newest 20 matching entries in input order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('queryLogs_defaultLimitTruncates', 0, () => {
      const logs: LogItem[] = [];
      for (let i = 0; i < 30; i++) {
        logs.push(new LogItem('设备', 'A', `条目${i}`, LogLevel.INFO, FIXED_TIME));
      }
      const limited = queryLogs(logs, '');
      expect(limited.length).assertEqual(20);
      expect(limited[0].detail).assertEqual('条目0');
      expect(limited[19].detail).assertEqual('条目19');
    });
  });
}
