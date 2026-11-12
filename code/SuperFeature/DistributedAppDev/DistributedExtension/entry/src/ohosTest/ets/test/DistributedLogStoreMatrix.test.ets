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
import { LOG_STORE_CAPACITY, PAGE_LOG_LIMIT } from '../../../main/ets/common/AppConstants';

/** 固定的四条日志：两个来源、四个级别，便于按维度切开验证过滤条件 */
function makeLogs(): LogItem[] {
  return [
    new LogItem('LinkRunner', 'createServer', '服务端 sample_link_server 已创建', LogLevel.INFO),
    new LogItem('LinkRunner', 'start', '已开始监听', LogLevel.DEBUG),
    new LogItem('ChannelRunner', 'openProxyChannel', '失败（32390101）：Remote is nullptr', LogLevel.ERROR),
    new LogItem('ChannelRunner', 'sendData', '超过演示上限 256 字节（当前 300）', LogLevel.WARN)
  ];
}

/** 只取 detail，用来验证顺序与截断后留下的是哪几条 */
function detailsOf(logs: LogItem[]): string {
  const parts: string[] = [];
  for (let i = 0; i < logs.length; i++) {
    parts.push(logs[i].detail);
  }
  return parts.join('|');
}

/** 生成 count 条同构日志，用于验证默认容量与默认条数上限 */
function bulkLogs(count: number): LogItem[] {
  const logs: LogItem[] = [];
  for (let i = 0; i < count; i++) {
    logs.push(new LogItem('Bulk', 'bulk', `第 ${i} 条`, LogLevel.INFO));
  }
  return logs;
}

/**
 * 日志存储：日志面板的过滤、上限与清空都走这四个纯函数。
 * 写错会让用户看不到刚发生的失败，或者面板里堆满历史记录，所以逐条验证。
 */
export default function distributedLogStoreMatrixTest() {
  describe('DistributedLogStoreMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_0100
     * @tc.name testLog0001
     * @tc.desc Verify the four level names and the fallback used by the panel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0001', 0, () => {
      expect(logLevelName(LogLevel.DEBUG)).assertEqual('DEBUG');
      expect(logLevelName(LogLevel.INFO)).assertEqual('INFO');
      expect(logLevelName(LogLevel.WARN)).assertEqual('WARN');
      expect(logLevelName(LogLevel.ERROR)).assertEqual('ERROR');
      expect(LogLevel.DEBUG).assertEqual(0);
      expect(LogLevel.ERROR).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_0200
     * @tc.name testLog0002
     * @tc.desc Verify a log item keeps every field and defaults to the info level.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0002', 0, () => {
      const entry = new LogItem('LinkRunner', 'start', '已开始监听');
      expect(entry.source).assertEqual('LinkRunner');
      expect(entry.tag).assertEqual('start');
      expect(entry.detail).assertEqual('已开始监听');
      expect(entry.level).assertEqual(LogLevel.INFO);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_0300
     * @tc.name testLog0003
     * @tc.desc Verify the identifier grows monotonically so list keys never collide.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0003', 0, () => {
      const first = new LogItem('A', 'a', '1');
      const second = new LogItem('A', 'a', '2');
      expect(second.id > first.id).assertTrue();
      expect(second.id - first.id).assertEqual(1);
      expect(first.id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_0400
     * @tc.name testLog0004
     * @tc.desc Verify the timestamp is formatted from the injected date.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0004', 0, () => {
      const entry = new LogItem('A', 'a', '1', LogLevel.WARN, new Date(2026, 0, 2, 3, 4, 5));
      expect(entry.time).assertEqual('03:04:05');
      expect(entry.time.length).assertEqual(8);
      expect(entry.level).assertEqual(LogLevel.WARN);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_0500
     * @tc.name testLog0005
     * @tc.desc Verify a new entry is prepended so the newest event stays on top.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0005', 0, () => {
      const one = appendLog([], new LogItem('A', 'a', 'first'));
      const two = appendLog(one, new LogItem('A', 'a', 'second'));
      expect(two.length).assertEqual(2);
      expect(two[0].detail).assertEqual('second');
      expect(two[1].detail).assertEqual('first');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_0600
     * @tc.name testLog0006
     * @tc.desc Verify appendLog returns a new array and leaves the input untouched.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLog0006', 0, () => {
      const original = makeLogs();
      const next = appendLog(original, new LogItem('X', 'x', '新事件'));
      expect(original.length).assertEqual(4);
      expect(next.length).assertEqual(5);
      expect(next === original).assertFalse();
      expect(original[0].detail.startsWith('服务端')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_0700
     * @tc.name testLog0007
     * @tc.desc Verify the capacity keeps the newest entries when the store overflows.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0007', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 5; i++) {
        logs = appendLog(logs, new LogItem('A', 'a', `第 ${i} 条`), 3);
      }
      expect(logs.length).assertEqual(3);
      expect(detailsOf(logs)).assertEqual('第 4 条|第 3 条|第 2 条');
      expect(detailsOf(logs).includes('第 0 条')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_0800
     * @tc.name testLog0008
     * @tc.desc Verify a non positive capacity falls back to the configured store capacity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLog0008', 0, () => {
      const items = bulkLogs(LOG_STORE_CAPACITY + 10);
      let logs: LogItem[] = [];
      for (let i = 0; i < items.length; i++) {
        logs = appendLog(logs, items[i], 0);
      }
      expect(logs.length).assertEqual(LOG_STORE_CAPACITY);
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(logs[0].detail).assertEqual('第 209 条');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_0900
     * @tc.name testLog0009
     * @tc.desc Verify the default capacity also caps the store at two hundred entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0009', 0, () => {
      const items = bulkLogs(LOG_STORE_CAPACITY + 1);
      let logs: LogItem[] = [];
      for (let i = 0; i < items.length; i++) {
        logs = appendLog(logs, items[i]);
      }
      expect(logs.length).assertEqual(LOG_STORE_CAPACITY);
      expect(logs[logs.length - 1].detail).assertEqual('第 1 条');
      // 新写入的排在首位，最先写入的「第 0 条」恰好是被容量裁掉的那条
      expect(logs[0].detail).assertEqual('第 200 条');
      expect(logs[0].detail).assertEqual(items[items.length - 1].detail);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_1000
     * @tc.name testLog0010
     * @tc.desc Verify an unfiltered query returns every entry once the limit is disabled.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0010', 0, () => {
      const logs = makeLogs();
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length).assertEqual(4);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '').length).assertEqual(4);
      expect(detailsOf(queryLogs(logs, '', LogLevel.DEBUG, '', 0)) === detailsOf(logs)).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_1100
     * @tc.name testLog0011
     * @tc.desc Verify the source filter selects one runner and rejects unknown sources.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0011', 0, () => {
      const logs = makeLogs();
      expect(queryLogs(logs, 'LinkRunner', LogLevel.DEBUG, '', 0).length).assertEqual(2);
      expect(queryLogs(logs, 'ChannelRunner', LogLevel.DEBUG, '', 0).length).assertEqual(2);
      expect(queryLogs(logs, 'PermissionUtil', LogLevel.DEBUG, '', 0).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_1200
     * @tc.name testLog0012
     * @tc.desc Verify the level filter keeps entries at or above the threshold.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0012', 0, () => {
      const logs = makeLogs();
      expect(queryLogs(logs, '', LogLevel.INFO, '', 0).length).assertEqual(3);
      expect(queryLogs(logs, '', LogLevel.WARN, '', 0).length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.ERROR, '', 0).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.ERROR, '', 0)[0].level).assertEqual(LogLevel.ERROR);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_1300
     * @tc.name testLog0013
     * @tc.desc Verify the keyword matches the tag case insensitively.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0013', 0, () => {
      const logs = makeLogs();
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'SERVER', 0).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'server', 0)[0].tag).assertEqual('createServer');
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'senddata', 0).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_1400
     * @tc.name testLog0014
     * @tc.desc Verify the keyword also matches the detail text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0014', 0, () => {
      const logs = makeLogs();
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'nullptr', 0).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '32390101', 0)[0].source).assertEqual('ChannelRunner');
      expect(queryLogs(logs, '', LogLevel.DEBUG, '不存在', 0).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_1500
     * @tc.name testLog0015
     * @tc.desc Verify the keyword is trimmed before matching so pasted spaces still work.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLog0015', 0, () => {
      const logs = makeLogs();
      expect(queryLogs(logs, '', LogLevel.DEBUG, '  256  ', 0).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '   ', 0).length).assertEqual(4);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '  256  ', 0)[0].level).assertEqual(LogLevel.WARN);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_1600
     * @tc.name testLog0016
     * @tc.desc Verify the limit keeps the newest entries that pass the filter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0016', 0, () => {
      const logs = makeLogs();
      const limited = queryLogs(logs, '', LogLevel.DEBUG, '', 2);
      expect(limited.length).assertEqual(2);
      expect(limited[0].detail.startsWith('服务端')).assertTrue();
      expect(limited[1].detail).assertEqual('已开始监听');
      expect(limited.length < logs.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_1700
     * @tc.name testLog0017
     * @tc.desc Verify the default limit equals the page log limit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLog0017', 0, () => {
      const logs = bulkLogs(25);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '').length).assertEqual(PAGE_LOG_LIMIT);
      expect(PAGE_LOG_LIMIT).assertEqual(20);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 25).length).assertEqual(25);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_1800
     * @tc.name testLog0018
     * @tc.desc Verify counting by tag is exact and source independent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0018', 0, () => {
      const logs = makeLogs();
      expect(countByTag(logs, 'sendData')).assertEqual(1);
      expect(countByTag(logs, 'LinkRunner')).assertEqual(0);
      expect(countByTag(logs, '')).assertEqual(0);
      expect(countByTag(makeLogs().concat(makeLogs()), 'start')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_1900
     * @tc.name testLog0019
     * @tc.desc Verify clearing returns an empty store rather than the previous entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLog0019', 0, () => {
      const cleared = clearLogs();
      expect(cleared.length).assertEqual(0);
      expect(queryLogs(cleared, '', LogLevel.DEBUG, '', 0).length).assertEqual(0);
      expect(cleared === clearLogs()).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LOG_2000
     * @tc.name testLog0020
     * @tc.desc Verify source, level and keyword are applied together as an intersection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testLog0020', 0, () => {
      const logs = makeLogs();
      expect(queryLogs(logs, 'ChannelRunner', LogLevel.WARN, '上限', 0).length).assertEqual(1);
      expect(queryLogs(logs, 'ChannelRunner', LogLevel.ERROR, 'nullptr', 0).length).assertEqual(1);
      expect(queryLogs(logs, 'LinkRunner', LogLevel.ERROR, '', 0).length).assertEqual(0);
      expect(queryLogs(logs, 'ChannelRunner', LogLevel.DEBUG, '上限', 0)[0].tag).assertEqual('sendData');
    });
  });
}
