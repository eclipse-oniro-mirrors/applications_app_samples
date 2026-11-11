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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  LogItem, LogLevel, appendLog, clearLogs, countByTag, logLevelName, queryLogs
} from '../../../main/ets/model/LogStore';
import { LOG_STORE_CAPACITY, StorageKeys } from '../../../main/ets/common/AppConstants';
import { Logger } from '../../../main/ets/utils/Logger';

const SOURCES: string[] = ['LinkRunner', 'ChannelRunner', 'Probe'];
const LEVELS: LogLevel[] = [LogLevel.DEBUG, LogLevel.INFO, LogLevel.WARN, LogLevel.ERROR];

/** 3 个来源 × 4 个级别 × 每格 2 条 = 24 条；tag 只带级别名，detail 同时带来源、序号与级别名 */
function gridLogs(): LogItem[] {
  const logs: LogItem[] = [];
  for (const source of SOURCES) {
    for (const level of LEVELS) {
      for (let k = 0; k < 2; k++) {
        const name = logLevelName(level);
        logs.push(new LogItem(source, `tag-${name}`, `${source} 第 ${k} 条 ${name}`, level));
      }
    }
  }
  return logs;
}

function detailsOf(logs: LogItem[]): string {
  const parts: string[] = [];
  for (const item of logs) {
    parts.push(item.detail);
  }
  return parts.join('|');
}

function storedLogs(): LogItem[] {
  return AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
}

/**
 * 日志查询网格（分）：把 queryLogs 的来源 × 级别 × 关键字 × 条数四个维度做成网格穷举，
 * 再把 appendLog 的容量分支、LogItem 的编号与时间、Logger 写 AppStorage 的整条路径逐一核对。
 */
export default function distributedLogQueryMatrixTest() {
  describe('DistributedLogQueryMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_0100
     * @tc.name testLogQuery0001
     * @tc.desc Verify the 24 item grid is returned whole without a limit and cut to 20 by default.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0001', 0, () => {
      const logs = gridLogs();
      expect(logs.length).assertEqual(24);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length).assertEqual(24);
      expect(queryLogs(logs, '').length).assertEqual(20);
      expect(queryLogs(logs, '')[0].detail).assertEqual('LinkRunner 第 0 条 DEBUG');
      expect(queryLogs(logs, '')[19].detail).assertEqual('Probe 第 1 条 INFO');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_0200
     * @tc.name testLogQuery0002
     * @tc.desc Verify every source and minimum level pair keeps two items per level at or above it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0002', 0, () => {
      const logs = gridLogs();
      let combos = 0;
      let mismatched = 0;
      let total = 0;
      for (const source of SOURCES) {
        for (let i = 0; i < LEVELS.length; i++) {
          const size = queryLogs(logs, source, LEVELS[i], '', 0).length;
          mismatched += size === 2 * (LEVELS.length - i) ? 0 : 1;
          total += size;
          combos++;
        }
      }
      expect(combos).assertEqual(12);
      expect(mismatched).assertEqual(0);
      expect(total).assertEqual(60);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_0300
     * @tc.name testLogQuery0003
     * @tc.desc Verify the all sources filter scales each minimum level by the three sources.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0003', 0, () => {
      const logs = gridLogs();
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length).assertEqual(24);
      expect(queryLogs(logs, '', LogLevel.INFO, '', 0).length).assertEqual(18);
      expect(queryLogs(logs, '', LogLevel.WARN, '', 0).length).assertEqual(12);
      expect(queryLogs(logs, '', LogLevel.ERROR, '', 0).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_0400
     * @tc.name testLogQuery0004
     * @tc.desc Verify an unknown source or one differing only in case returns nothing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0004', 0, () => {
      const logs = gridLogs();
      expect(queryLogs(logs, 'Nobody', LogLevel.DEBUG, '', 0).length).assertEqual(0);
      expect(queryLogs(logs, 'linkrunner', LogLevel.DEBUG, '', 0).length).assertEqual(0);
      expect(queryLogs(logs, ' LinkRunner', LogLevel.DEBUG, '', 0).length).assertEqual(0);
      expect(queryLogs(logs, 'LinkRunner', LogLevel.DEBUG, '', 0).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_0500
     * @tc.name testLogQuery0005
     * @tc.desc Verify a level keyword matches case insensitively and ignores surrounding blanks.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0005', 0, () => {
      const logs = gridLogs();
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'error', 0).length).assertEqual(6);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'ERROR', 0).length).assertEqual(6);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '  Error  ', 0).length).assertEqual(6);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'tag-', 0).length).assertEqual(24);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'TAG-WARN', 0).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_0600
     * @tc.name testLogQuery0006
     * @tc.desc Verify keywords hit detail and tag text but never the source field itself.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0006', 0, () => {
      const logs = gridLogs();
      logs.push(new LogItem('Hidden', 'plain', 'nothing here', LogLevel.ERROR));
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'hidden', 0).length).assertEqual(0);
      expect(queryLogs(logs, 'Hidden', LogLevel.DEBUG, '', 0).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'plain', 0).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'channelrunner', 0).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_0700
     * @tc.name testLogQuery0007
     * @tc.desc Verify CJK keywords split the grid by sequence number and blank keywords keep everything.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0007', 0, () => {
      const logs = gridLogs();
      expect(queryLogs(logs, '', LogLevel.DEBUG, '第 0 条', 0).length).assertEqual(12);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '第 1 条', 0).length).assertEqual(12);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '第 2 条', 0).length).assertEqual(0);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '   ', 0).length).assertEqual(24);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '条', 0).length).assertEqual(24);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_0800
     * @tc.name testLogQuery0008
     * @tc.desc Verify the limit grid treats zero and negatives as unlimited and caps at the match count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0008', 0, () => {
      const logs = gridLogs();
      const limits: number[] = [-5, 0, 1, 7, 23, 24, 25, 100];
      const sizes: number[] = [];
      for (const limit of limits) {
        sizes.push(queryLogs(logs, '', LogLevel.DEBUG, '', limit).length);
      }
      expect(sizes.join(',')).assertEqual('24,24,1,7,23,24,24,24');
      expect(queryLogs(logs, 'Probe', LogLevel.ERROR, '', 1)[0].detail).assertEqual('Probe 第 0 条 ERROR');
      expect(queryLogs(logs, 'Probe', LogLevel.ERROR, '', -1).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_0900
     * @tc.name testLogQuery0009
     * @tc.desc Verify source, level and keyword combine with AND semantics.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0009', 0, () => {
      const logs = gridLogs();
      expect(queryLogs(logs, 'ChannelRunner', LogLevel.WARN, 'warn', 0).length).assertEqual(2);
      expect(queryLogs(logs, 'ChannelRunner', LogLevel.WARN, 'error', 0).length).assertEqual(2);
      expect(queryLogs(logs, 'ChannelRunner', LogLevel.WARN, 'debug', 0).length).assertEqual(0);
      expect(queryLogs(logs, 'ChannelRunner', LogLevel.WARN, '第 1 条', 0).length).assertEqual(2);
      expect(queryLogs(logs, 'Probe', LogLevel.INFO, 'probe 第 0', 0).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_1000
     * @tc.name testLogQuery0010
     * @tc.desc Verify a 4 source by 4 level by 4 keyword grid matches an independent counter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0010', 0, () => {
      const logs = gridLogs();
      const sources: string[] = ['', 'LinkRunner', 'ChannelRunner', 'Probe'];
      const keywords: string[] = ['', 'info', '第 0 条', 'probe'];
      let combos = 0;
      let mismatched = 0;
      for (const source of sources) {
        for (const level of LEVELS) {
          for (const keyword of keywords) {
            let expected = 0;
            for (const item of logs) {
              const text = `${item.detail}${item.tag}`.toLowerCase();
              const hit = (source === '' || item.source === source) && item.level >= level && text.includes(keyword);
              expected += hit ? 1 : 0;
            }
            mismatched += queryLogs(logs, source, level, keyword, 0).length === expected ? 0 : 1;
            combos++;
          }
        }
      }
      expect(combos).assertEqual(64);
      expect(mismatched).assertEqual(0);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'probe', 0).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_1100
     * @tc.name testLogQuery0011
     * @tc.desc Verify the query keeps input order and returns the same item references.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0011', 0, () => {
      const logs = gridLogs();
      const errors = queryLogs(logs, '', LogLevel.ERROR, '', 0);
      expect(detailsOf(errors)).assertEqual('LinkRunner 第 0 条 ERROR|LinkRunner 第 1 条 ERROR|' +
        'ChannelRunner 第 0 条 ERROR|ChannelRunner 第 1 条 ERROR|Probe 第 0 条 ERROR|Probe 第 1 条 ERROR');
      expect(errors[0] === logs[6]).assertTrue();
      expect(errors[5] === logs[23]).assertTrue();
      expect(logs.length).assertEqual(24);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_1200
     * @tc.name testLogQuery0012
     * @tc.desc Verify countByTag gives six per level tag and is exact and case sensitive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0012', 0, () => {
      const logs = gridLogs();
      let sum = 0;
      for (const level of LEVELS) {
        const count = countByTag(logs, `tag-${logLevelName(level)}`);
        expect(count).assertEqual(6);
        sum += count;
      }
      expect(sum).assertEqual(24);
      expect(countByTag(logs, 'TAG-ERROR')).assertEqual(0);
      expect(countByTag(logs, 'tag-')).assertEqual(0);
      expect(countByTag(logs, '')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_1300
     * @tc.name testLogQuery0013
     * @tc.desc Verify appendLog honours small capacities and falls back to 200 for zero or negatives.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0013', 0, () => {
      const capacities: number[] = [1, 2, 5, 0, -1];
      const sizes: number[] = [];
      const heads: string[] = [];
      for (const capacity of capacities) {
        let logs: LogItem[] = [];
        for (let i = 0; i < 5; i++) {
          logs = appendLog(logs, new LogItem('Cap', 'cap', `#${i}`), capacity);
        }
        sizes.push(logs.length);
        heads.push(logs[0].detail);
      }
      expect(sizes.join(',')).assertEqual('1,2,5,5,5');
      expect(heads.join(',')).assertEqual('#4,#4,#4,#4,#4');
      expect(LOG_STORE_CAPACITY).assertEqual(200);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_1400
     * @tc.name testLogQuery0014
     * @tc.desc Verify ten appends into capacity three keep the newest three newest first.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0014', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 10; i++) {
        logs = appendLog(logs, new LogItem('Cap', 'cap', `#${i}`), 3);
      }
      expect(logs.length).assertEqual(3);
      expect(detailsOf(logs)).assertEqual('#9|#8|#7');
      expect(logs[0].id - logs[2].id).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_1500
     * @tc.name testLogQuery0015
     * @tc.desc Verify 250 appends at the default capacity keep items 249 down to 50.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0015', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 250; i++) {
        logs = appendLog(logs, new LogItem('Bulk', 'bulk', `#${i}`));
      }
      expect(logs.length).assertEqual(LOG_STORE_CAPACITY);
      expect(logs[0].detail).assertEqual('#249');
      expect(logs[LOG_STORE_CAPACITY - 1].detail).assertEqual('#50');
      expect(queryLogs(logs, 'Bulk', LogLevel.INFO, '#5', 0).length).assertEqual(10);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_1600
     * @tc.name testLogQuery0016
     * @tc.desc Verify appendLog leaves the input untouched and clearLogs returns a fresh empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0016', 0, () => {
      const base = gridLogs();
      const next = appendLog(base, new LogItem('X', 'x', 'x'), 10);
      const first = clearLogs();
      const second = clearLogs();
      expect(base.length).assertEqual(24);
      expect(next.length).assertEqual(10);
      expect(next[1] === base[0]).assertTrue();
      expect(first.length + second.length).assertEqual(0);
      expect(first === second).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_1700
     * @tc.name testLogQuery0017
     * @tc.desc Verify ten new log items get strictly consecutive ids.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0017', 0, () => {
      const items: LogItem[] = [];
      for (let i = 0; i < 10; i++) {
        items.push(new LogItem('Id', 'id', `${i}`));
      }
      let gaps = 0;
      for (let i = 1; i < items.length; i++) {
        gaps += items[i].id - items[i - 1].id === 1 ? 0 : 1;
      }
      expect(gaps).assertEqual(0);
      expect(items[9].id - items[0].id).assertEqual(9);
      expect(items[0].id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_1800
     * @tc.name testLogQuery0018
     * @tc.desc Verify the item time is the zero padded clock of the supplied date.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0018', 0, () => {
      expect(new LogItem('T', 't', 'd', LogLevel.INFO, new Date(2026, 10, 6, 9, 8, 7)).time).assertEqual('09:08:07');
      expect(new LogItem('T', 't', 'd', LogLevel.INFO, new Date(2026, 0, 1, 0, 0, 0)).time).assertEqual('00:00:00');
      expect(new LogItem('T', 't', 'd', LogLevel.WARN, new Date(2026, 11, 31, 23, 59, 59)).time).assertEqual('23:59:59');
      expect(new LogItem('T', 't', 'd', LogLevel.ERROR, new Date(2026, 5, 15, 12, 30, 5)).level).assertEqual(LogLevel.ERROR);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_1900
     * @tc.name testLogQuery0019
     * @tc.desc Verify the four Logger levels land in AppStorage newest first with their own level.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0019', 0, () => {
      Logger.clear();
      Logger.debug('LogQ', 'q-debug', 'd');
      Logger.info('LogQ', 'q-info', 'i');
      Logger.warn('LogQ', 'q-warn', 'w');
      Logger.error('LogQ', 'q-error', 'e');
      const logs = storedLogs();
      const levels: number[] = [];
      for (const item of logs) {
        levels.push(item.level);
      }
      expect(logs.length).assertEqual(4);
      expect(levels.join(',')).assertEqual('3,2,1,0');
      expect(detailsOf(logs)).assertEqual('e|w|i|d');
      expect(queryLogs(logs, 'LogQ', LogLevel.WARN, '', 0).length).assertEqual(2);
      Logger.clear();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_2000
     * @tc.name testLogQuery0020
     * @tc.desc Verify Logger.count matches on source and tag together.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0020', 0, () => {
      Logger.clear();
      Logger.info('SrcA', 'shared', 'x');
      Logger.warn('SrcB', 'shared', 'y');
      Logger.error('SrcC', 'other', 'z');
      expect(Logger.count('SrcA', 'shared')).assertEqual(1);
      expect(Logger.count('SrcB', 'shared')).assertEqual(1);
      expect(Logger.count('Nobody', 'shared')).assertEqual(0);
      expect(Logger.count('SrcC', 'other')).assertEqual(1);
      expect(Logger.count('SrcA', 'Shared')).assertEqual(0);
      Logger.clear();
      expect(Logger.count('SrcA', 'shared')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_2100
     * @tc.name testLogQuery0021
     * @tc.desc Verify 205 Logger writes keep the newest 200 in AppStorage and clear empties it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0021', 0, () => {
      Logger.clear();
      for (let i = 0; i < 205; i++) {
        Logger.debug('LogQ', 'bulk', `#${i}`);
      }
      const logs = storedLogs();
      expect(logs.length).assertEqual(LOG_STORE_CAPACITY);
      expect(logs[0].detail).assertEqual('#204');
      expect(logs[LOG_STORE_CAPACITY - 1].detail).assertEqual('#5');
      expect(Logger.count('LogQ', 'bulk')).assertEqual(200);
      Logger.clear();
      expect(storedLogs().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_2200
     * @tc.name testLogQuery0022
     * @tc.desc Verify Logger.record with an explicit level matches the dedicated level helpers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0022', 0, () => {
      Logger.clear();
      for (const level of LEVELS) {
        Logger.record(level, 'Rec', `rec-${logLevelName(level)}`, logLevelName(level));
      }
      const logs = storedLogs();
      expect(logs.length).assertEqual(4);
      expect(queryLogs(logs, 'Rec', LogLevel.WARN, '', 0).length).assertEqual(2);
      expect(queryLogs(logs, 'Rec', LogLevel.DEBUG, 'rec-info', 0)[0].level).assertEqual(LogLevel.INFO);
      expect(Logger.count('Rec', 'rec-ERROR')).assertEqual(1);
      Logger.clear();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOGQ_2300
     * @tc.name testLogQuery0023
     * @tc.desc Verify Logger output is searchable through the same query used by the log panel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogQuery0023', 0, () => {
      Logger.clear();
      for (const source of SOURCES) {
        for (const level of LEVELS) {
          Logger.record(level, source, `tag-${logLevelName(level)}`, `${source} ${logLevelName(level)}`);
        }
      }
      const logs = storedLogs();
      expect(logs.length).assertEqual(12);
      expect(queryLogs(logs, 'Probe', LogLevel.DEBUG, '', 0).length).assertEqual(4);
      expect(queryLogs(logs, '', LogLevel.ERROR, '', 0).length).assertEqual(3);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'channelrunner warn', 0).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 5).length).assertEqual(5);
      expect(logs[0].detail).assertEqual('Probe ERROR');
      Logger.clear();
    });
  });
}
