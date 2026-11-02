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

function buildFourLevels(): LogItem[] {
  const logs: LogItem[] = [];
  logs.push(new LogItem('设备', '下载', 'alpha 下载完成', LogLevel.DEBUG, FIXED_TIME));
  logs.push(new LogItem('页面', '搜索', 'beta 搜索命中', LogLevel.INFO, FIXED_TIME));
  logs.push(new LogItem('设备', '下载', 'gamma 下载取消', LogLevel.WARN, FIXED_TIME));
  logs.push(new LogItem('页面', '分享', 'delta 分享失败', LogLevel.ERROR, FIXED_TIME));
  return logs;
}

export default function logStoreMatrixTest() {
  describe('logStoreMatrixTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_0100
     * @tc.name appendCapacityOne010
     * @tc.desc Verify a capacity of one keeps only the newest entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('append_capacityOne', 0, () => {
      let logs: LogItem[] = [];
      logs = appendLog(logs, new LogItem('设备', 'A', '第一条', LogLevel.INFO, FIXED_TIME), 1);
      logs = appendLog(logs, new LogItem('设备', 'A', '第二条', LogLevel.INFO, FIXED_TIME), 1);
      expect(logs.length).assertEqual(1);
      expect(logs[0].detail).assertEqual('第二条');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_0200
     * @tc.name appendCapacityTwo020
     * @tc.desc Verify a capacity of two keeps the two newest entries in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('append_capacityTwo', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 3; i++) {
        logs = appendLog(logs, new LogItem('设备', 'A', `条目${i}`, LogLevel.INFO, FIXED_TIME), 2);
      }
      expect(logs.length).assertEqual(2);
      expect(logs[0].detail).assertEqual('条目2');
      expect(logs[1].detail).assertEqual('条目1');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_0300
     * @tc.name appendCapacityThree030
     * @tc.desc Verify a capacity of three keeps the three newest entries in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('append_capacityThree', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 5; i++) {
        logs = appendLog(logs, new LogItem('设备', 'A', `条目${i}`, LogLevel.INFO, FIXED_TIME), 3);
      }
      expect(logs.length).assertEqual(3);
      expect(logs[0].detail).assertEqual('条目4');
      expect(logs[2].detail).assertEqual('条目2');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_0400
     * @tc.name appendCapacityTen040
     * @tc.desc Verify a capacity of ten drops the two oldest entries after twelve appends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('append_capacityTen', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 12; i++) {
        logs = appendLog(logs, new LogItem('设备', 'A', `条目${i}`, LogLevel.INFO, FIXED_TIME), 10);
      }
      expect(logs.length).assertEqual(10);
      expect(logs[0].detail).assertEqual('条目11');
      expect(logs[9].detail).assertEqual('条目2');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_0500
     * @tc.name appendZeroCapacity050
     * @tc.desc Verify a zero capacity falls back to the default store capacity without truncating three entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('append_zeroCapacity', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 3; i++) {
        logs = appendLog(logs, new LogItem('设备', 'A', `条目${i}`, LogLevel.INFO, FIXED_TIME), 0);
      }
      expect(logs.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_0600
     * @tc.name appendNegativeCapacity060
     * @tc.desc Verify a negative capacity also falls back to the default store capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('append_negativeCapacity', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 3; i++) {
        logs = appendLog(logs, new LogItem('设备', 'A', `条目${i}`, LogLevel.INFO, FIXED_TIME), -5);
      }
      expect(logs.length).assertEqual(3);
      expect(logs[0].detail).assertEqual('条目2');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_0700
     * @tc.name appendOrderTen070
     * @tc.desc Verify ten appends keep the newest entry at the head and the oldest at the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('append_orderTen', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 10; i++) {
        logs = appendLog(logs, new LogItem('设备', 'A', `条目${i}`, LogLevel.INFO, FIXED_TIME), 20);
      }
      expect(logs.length).assertEqual(10);
      expect(logs[0].detail).assertEqual('条目9');
      expect(logs[9].detail).assertEqual('条目0');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_0800
     * @tc.name queryMinDebug080
     * @tc.desc Verify the DEBUG threshold keeps all four levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_minDebug', 0, () => {
      expect(queryLogs(buildFourLevels(), '', LogLevel.DEBUG).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_0900
     * @tc.name queryMinInfo090
     * @tc.desc Verify the INFO threshold drops the DEBUG entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_minInfo', 0, () => {
      const result = queryLogs(buildFourLevels(), '', LogLevel.INFO);
      expect(result.length).assertEqual(3);
      expect(result[2].level).assertEqual(LogLevel.ERROR);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_1000
     * @tc.name queryMinWarn100
     * @tc.desc Verify the WARN threshold keeps only WARN and ERROR entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_minWarn', 0, () => {
      const result = queryLogs(buildFourLevels(), '', LogLevel.WARN);
      expect(result.length).assertEqual(2);
      expect(result[0].level).assertEqual(LogLevel.WARN);
      expect(result[1].level).assertEqual(LogLevel.ERROR);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_1100
     * @tc.name queryMinError110
     * @tc.desc Verify the ERROR threshold keeps only the ERROR entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_minError', 0, () => {
      expect(queryLogs(buildFourLevels(), '', LogLevel.ERROR).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_1200
     * @tc.name querySourceDevice120
     * @tc.desc Verify filtering by the device source keeps its two entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_sourceDevice', 0, () => {
      expect(queryLogs(buildFourLevels(), '设备').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_1300
     * @tc.name querySourcePage130
     * @tc.desc Verify filtering by the page source keeps its two entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_sourcePage', 0, () => {
      expect(queryLogs(buildFourLevels(), '页面').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_1400
     * @tc.name querySourceEmpty140
     * @tc.desc Verify an empty source disables source filtering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_sourceEmpty', 0, () => {
      expect(queryLogs(buildFourLevels(), '').length).assertEqual(4);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_1500
     * @tc.name querySourceUnknown150
     * @tc.desc Verify an unknown source yields no entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_sourceUnknown', 0, () => {
      expect(queryLogs(buildFourLevels(), '服务').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_1600
     * @tc.name queryKeywordCaseInsensitive160
     * @tc.desc Verify keyword matching ignores case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_keywordCaseInsensitive', 0, () => {
      expect(queryLogs(buildFourLevels(), '', LogLevel.DEBUG, 'ALPHA').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_1700
     * @tc.name queryKeywordTagMatch170
     * @tc.desc Verify keyword matching also covers the tag column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_keywordTagMatch', 0, () => {
      expect(queryLogs(buildFourLevels(), '', LogLevel.DEBUG, '下载').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_1800
     * @tc.name queryKeywordTrimmed180
     * @tc.desc Verify surrounding whitespace is trimmed before keyword matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_keywordTrimmed', 0, () => {
      expect(queryLogs(buildFourLevels(), '', LogLevel.DEBUG, ' beta ').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_1900
     * @tc.name queryKeywordNoMatch190
     * @tc.desc Verify a keyword that appears nowhere yields no entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_keywordNoMatch', 0, () => {
      expect(queryLogs(buildFourLevels(), '', LogLevel.DEBUG, 'zzz').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_2000
     * @tc.name queryLimitTwo200
     * @tc.desc Verify a positive limit caps the result size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_limitTwo', 0, () => {
      expect(queryLogs(buildFourLevels(), '', LogLevel.DEBUG, '', 2).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_2100
     * @tc.name queryLimitZero210
     * @tc.desc Verify a zero limit disables result truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_limitZero', 0, () => {
      expect(queryLogs(buildFourLevels(), '', LogLevel.DEBUG, '', 0).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_2200
     * @tc.name queryLimitAboveCount220
     * @tc.desc Verify a limit larger than the result set keeps all entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('query_limitAboveCount', 0, () => {
      expect(queryLogs(buildFourLevels(), '', LogLevel.DEBUG, '', 100).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_2300
     * @tc.name countByTagDownload230
     * @tc.desc Verify countByTag counts exact tag matches only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('countByTag_download', 0, () => {
      const logs = buildFourLevels();
      expect(countByTag(logs, '下载')).assertEqual(2);
      expect(countByTag(logs, '搜索')).assertEqual(1);
      expect(countByTag(logs, '下载 ')).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_2400
     * @tc.name logLevelNameAllLevels240
     * @tc.desc Verify every log level maps to its uppercase display name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logLevelName_allLevels', 0, () => {
      expect(logLevelName(LogLevel.DEBUG)).assertEqual('DEBUG');
      expect(logLevelName(LogLevel.INFO)).assertEqual('INFO');
      expect(logLevelName(LogLevel.WARN)).assertEqual('WARN');
      expect(logLevelName(LogLevel.ERROR)).assertEqual('ERROR');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_2500
     * @tc.name logItemIdMonotonic250
     * @tc.desc Verify consecutive log items receive strictly increasing ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logItem_idMonotonic', 0, () => {
      const first = new LogItem('设备', 'A', '第一条', LogLevel.INFO, FIXED_TIME);
      const second = new LogItem('设备', 'A', '第二条', LogLevel.INFO, FIXED_TIME);
      const third = new LogItem('设备', 'A', '第三条', LogLevel.INFO, FIXED_TIME);
      expect(second.id).assertEqual(first.id + 1);
      expect(third.id).assertEqual(second.id + 1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_2600
     * @tc.name logItemDefaultLevel260
     * @tc.desc Verify a log item defaults to the INFO level and a hh:mm:ss timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('logItem_defaultLevel', 0, () => {
      const item = new LogItem('设备', 'A', '默认级别');
      expect(item.level).assertEqual(LogLevel.INFO);
      expect(item.time.length).assertEqual(8);
      expect(item.time.charAt(2)).assertEqual(':');
      expect(item.time.charAt(5)).assertEqual(':');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_LOGSTOREMATRIX_2700
     * @tc.name clearLogsEmpty270
     * @tc.desc Verify clearing the store yields an empty list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clearLogs_empty', 0, () => {
      expect(clearLogs().length).assertEqual(0);
    });
  });
}
