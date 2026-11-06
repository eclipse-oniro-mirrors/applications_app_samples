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

import { afterEach, beforeEach, describe, expect, it } from '@ohos/hypium';
import { LOG_STORE_CAPACITY, StorageKeys } from '../../../main/ets/common/AppConstants';
import {
  LogItem,
  LogLevel,
  appendLog,
  clearLogs,
  countByTag,
  logLevelName,
  queryLogs
} from '../../../main/ets/model/LogStore';
import { Logger } from '../../../main/ets/utils/Logger';

/** 构造一条日志：只写关心字段，其余走默认值，避免每条用例重复五行赋值 */
function makeLog(detail: string, source: string = 'page', tag: string = 'tag',
                 level: LogLevel = LogLevel.INFO): LogItem {
  return new LogItem(source, tag, detail, level);
}

/** 造 n 条日志：容量与长稳用例都从这里取数据 */
function makeLogs(count: number): LogItem[] {
  const logs: LogItem[] = [];
  for (let i = 0; i < count; i++) {
    logs.push(makeLog(`d${i}`, 'page', 'tag'));
  }
  return logs;
}

/** 读回 AppStorage 里 Logger 写下的日志：页面 LogPanel 走的是同一条路径 */
function storedLogs(): LogItem[] {
  return AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
}

/**
 * 日志矩阵：条目自增、容量裁剪、三重过滤，以及 Logger → AppStorage 的真实写入。
 * 前一组只用纯函数；后一组带四个 hook，保证每条用例开始时日志区是干净的，
 * 不会把上一条的写入当成自己的结果。
 */
export default function inputMethodLogMatrixTest() {
  describe('InputMethodLogStoreMatrixTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_LOG_0100
     * @tc.name testLogMatrix0001
     * @tc.desc Verify consecutive entries get steadily increasing ids so the panel can tell duplicates apart.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0001', 0, () => {
      const first = makeLog('a');
      const second = makeLog('b');
      const third = makeLog('c');
      expect(second.id - first.id).assertEqual(1);
      expect(third.id - second.id).assertEqual(1);
      expect(third.id > first.id).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_0200
     * @tc.name testLogMatrix0002
     * @tc.desc Verify a constructed entry keeps its fields and defaults to the info level.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0002', 0, () => {
      const item = new LogItem('panel', 'createPanel', '面板已创建');
      expect(item.source).assertEqual('panel');
      expect(item.tag).assertEqual('createPanel');
      expect(item.detail).assertEqual('面板已创建');
      expect(item.level).assertEqual(LogLevel.INFO);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_0300
     * @tc.name testLogMatrix0003
     * @tc.desc Verify the time field comes from the injected date, which is what makes the entry testable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0003', 0, () => {
      const item = new LogItem('p', 't', 'd', LogLevel.WARN, new Date(2026, 0, 1, 7, 8, 9));
      expect(item.time).assertEqual('07:08:09');
      expect(item.level).assertEqual(LogLevel.WARN);
      expect(item.time.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_0400
     * @tc.name testLogMatrix0004
     * @tc.desc Verify each of the four levels has its own upper case name and no two names collide.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0004', 0, () => {
      const names: string[] = [LogLevel.DEBUG, LogLevel.INFO, LogLevel.WARN, LogLevel.ERROR]
        .map((level: LogLevel) => logLevelName(level));
      expect(names[0]).assertEqual('DEBUG');
      expect(names[1]).assertEqual('INFO');
      expect(names[2]).assertEqual('WARN');
      expect(names[3]).assertEqual('ERROR');
      expect(new Set<string>(names).size).assertEqual(4);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_0500
     * @tc.name testLogMatrix0005
     * @tc.desc Verify the default capacity accepts a first entry and leaves a single element list.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0005', 0, () => {
      const logs = appendLog([], makeLog('first'));
      expect(logs.length).assertEqual(1);
      expect(logs[0].detail).assertEqual('first');
      expect(appendLog([], makeLog('a'))[0].source).assertEqual('page');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_0600
     * @tc.name testLogMatrix0006
     * @tc.desc Verify a negative capacity falls back to the page constant instead of emptying the store.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0006', 0, () => {
      const full = makeLogs(LOG_STORE_CAPACITY);
      const next = appendLog(full, makeLog('newest'), -5);
      expect(next.length).assertEqual(LOG_STORE_CAPACITY);
      expect(next[0].detail).assertEqual('newest');
      expect(next[LOG_STORE_CAPACITY - 1].detail).assertEqual('d198');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_0700
     * @tc.name testLogMatrix0007
     * @tc.desc Verify a capacity larger than the list keeps every entry and only prepends the new one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0007', 0, () => {
      const three = makeLogs(3);
      const next = appendLog(three, makeLog('head'), 99);
      expect(next.length).assertEqual(4);
      expect(next[0].detail).assertEqual('head');
      expect(next[3].detail).assertEqual('d2');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_0800
     * @tc.name testLogMatrix0008
     * @tc.desc Verify three consecutive appends leave the newest entry at index zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0008', 0, () => {
      let logs: LogItem[] = [];
      logs = appendLog(logs, makeLog('one'));
      logs = appendLog(logs, makeLog('two'));
      logs = appendLog(logs, makeLog('three'));
      expect(logs.length).assertEqual(3);
      expect(logs[0].detail).assertEqual('three');
      expect(logs[1].detail).assertEqual('two');
      expect(logs[2].detail).assertEqual('one');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_0900
     * @tc.name testLogMatrix0009
     * @tc.desc Verify trimming happens on a copy so the caller's array keeps its old length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0009', 0, () => {
      const original = makeLogs(3);
      const next = appendLog(original, makeLog('head'), 2);
      expect(original.length).assertEqual(3);
      expect(next.length).assertEqual(2);
      expect(original[0].detail).assertEqual('d0');
      expect(next[0].detail).assertEqual('head');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_1000
     * @tc.name testLogMatrix0010
     * @tc.desc Verify appending without trimming still returns a new array
     * that keeps the previous entries by reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0010', 0, () => {
      const first = makeLog('d0');
      const original: LogItem[] = [first];
      const next = appendLog(original, makeLog('d1'), 10);
      expect(next.length).assertEqual(2);
      expect(next[1] === first).assertTrue();
      expect(original.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_1100
     * @tc.name testLogMatrix0011
     * @tc.desc Verify querying an empty store returns an empty result rather than undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0011', 0, () => {
      const logs: LogItem[] = [];
      expect(queryLogs(logs, '').length).assertEqual(0);
      expect(queryLogs(logs, 'page', LogLevel.ERROR, 'x', 5).length).assertEqual(0);
      expect(countByTag(logs, 'tag')).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_1200
     * @tc.name testLogMatrix0012
     * @tc.desc Verify a limit larger than the list returns everything instead of padding or throwing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0012', 0, () => {
      const logs = makeLogs(3);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 99).length).assertEqual(3);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 3).length).assertEqual(3);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 2)[1].detail).assertEqual('d1');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_1300
     * @tc.name testLogMatrix0013
     * @tc.desc Verify a negative limit means no truncation, matching the zero limit behaviour.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0013', 0, () => {
      const logs = makeLogs(4);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', -1).length).assertEqual(4);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length).assertEqual(4);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 1).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_1400
     * @tc.name testLogMatrix0014
     * @tc.desc Verify source, level and keyword apply together rather than as three separate passes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0014', 0, () => {
      const logs: LogItem[] = [
        makeLog('panel created', 'panel', 'ui', LogLevel.INFO),
        makeLog('panel destroyed', 'panel', 'ui', LogLevel.ERROR),
        makeLog('panel skipped', 'list', 'ui', LogLevel.ERROR),
        makeLog('other', 'panel', 'ui', LogLevel.DEBUG)
      ];
      expect(queryLogs(logs, 'panel', LogLevel.ERROR, 'panel').length).assertEqual(1);
      expect(queryLogs(logs, 'panel', LogLevel.DEBUG, 'panel').length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.ERROR, 'panel').length).assertEqual(2);
      expect(queryLogs(logs, 'list', LogLevel.INFO).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_1500
     * @tc.name testLogMatrix0015
     * @tc.desc Verify the keyword also matches the tag field, so a reader can filter by event name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0015', 0, () => {
      const logs: LogItem[] = [
        makeLog('no keyword here', 'page', 'inputStart'),
        makeLog('panel created', 'page', 'ui')
      ];
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'inputstart').length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'INPUTSTART').length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'input').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_1600
     * @tc.name testLogMatrix0016
     * @tc.desc Verify raising the bar to error keeps only errors, so warnings are not silently promoted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0016', 0, () => {
      const logs: LogItem[] = [
        makeLog('debug', 'p', 't', LogLevel.DEBUG),
        makeLog('info', 'p', 't', LogLevel.INFO),
        makeLog('warn', 'p', 't', LogLevel.WARN),
        makeLog('error', 'p', 't', LogLevel.ERROR)
      ];
      expect(queryLogs(logs, '', LogLevel.ERROR).length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.ERROR)[0].detail).assertEqual('error');
      expect(queryLogs(logs, '', LogLevel.DEBUG).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_1700
     * @tc.name testLogMatrix0017
     * @tc.desc Verify a Chinese keyword matches Chinese details, which is what the demo pages write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0017', 0, () => {
      const logs: LogItem[] = [
        makeLog('面板已创建', 'panel', 'ui'),
        makeLog('列表已弹出', 'list', 'ui')
      ];
      expect(queryLogs(logs, '', LogLevel.DEBUG, '面板').length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '已').length).assertEqual(2);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '不存在').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_1800
     * @tc.name testLogMatrix0018
     * @tc.desc Verify a whitespace only keyword is treated as empty, so the page's input box can be cleared.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0018', 0, () => {
      const logs = makeLogs(3);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '   ').length).assertEqual(3);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '\t').length).assertEqual(3);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_1900
     * @tc.name testLogMatrix0019
     * @tc.desc Verify tag counting matches exactly, so two tags differing only in case stay separate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0019', 0, () => {
      const logs: LogItem[] = [
        makeLog('a', 'p', 'UI'),
        makeLog('b', 'p', 'UI'),
        makeLog('c', 'p', 'ui')
      ];
      expect(countByTag(logs, 'UI')).assertEqual(2);
      expect(countByTag(logs, 'ui')).assertEqual(1);
      expect(countByTag(logs, 'Ui')).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_2000
     * @tc.name testLogMatrix0020
     * @tc.desc Verify clearing twice yields two empty arrays and does not touch the array passed in earlier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0020', 0, () => {
      const logs = makeLogs(2);
      const first = clearLogs();
      const second = clearLogs();
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(0);
      expect(logs.length).assertEqual(2);
    });
  });

  describe('InputMethodLoggerStorageTest', () => {
    beforeEach(() => {
      Logger.clear();
    });

    afterEach(() => {
      Logger.clear();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_2100
     * @tc.name testLogMatrix0021
     * @tc.desc Verify one record lands in AppStorage with the same source, tag, detail and level the panel reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0021', 0, () => {
      Logger.info('page', 'buildExtraConfig', '4 个键，125 字节');
      const logs = storedLogs();
      expect(logs.length).assertEqual(1);
      expect(logs[0].source).assertEqual('page');
      expect(logs[0].tag).assertEqual('buildExtraConfig');
      expect(logs[0].detail).assertEqual('4 个键，125 字节');
      expect(logs[0].level).assertEqual(LogLevel.INFO);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_2200
     * @tc.name testLogMatrix0022
     * @tc.desc Verify the count helper only counts the requested tag and reports zero for an unused one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0022', 0, () => {
      Logger.info('page', 'alpha', 'one');
      Logger.warn('page', 'alpha', 'two');
      Logger.error('panel', 'beta', 'three');
      expect(Logger.count('page', 'alpha')).assertEqual(2);
      expect(Logger.count('panel', 'beta')).assertEqual(1);
      expect(Logger.count('page', 'gamma')).assertEqual(0);
      expect(storedLogs().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_2300
     * @tc.name testLogMatrix0023
     * @tc.desc Verify all four level helpers write, so a debug line is not dropped on the way to the panel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0023', 0, () => {
      Logger.debug('page', 'lv', 'debug');
      Logger.info('page', 'lv', 'info');
      Logger.warn('page', 'lv', 'warn');
      Logger.error('page', 'lv', 'error');
      const levels = storedLogs().map((item: LogItem) => item.level);
      expect(levels.length).assertEqual(4);
      expect(levels.includes(LogLevel.DEBUG)).assertTrue();
      expect(levels.includes(LogLevel.WARN)).assertTrue();
      expect(levels.includes(LogLevel.ERROR)).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_2400
     * @tc.name testLogMatrix0024
     * @tc.desc Verify clear removes every entry so the next page load does not show the previous run.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0024', 0, () => {
      Logger.info('page', 'alpha', 'one');
      expect(storedLogs().length).assertEqual(1);
      Logger.clear();
      expect(storedLogs().length).assertEqual(0);
      expect(Logger.count('page', 'alpha')).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_LOG_2500
     * @tc.name testLogMatrix0025
     * @tc.desc Verify writing past the capacity keeps the newest entries and drops the oldest,
     * so the panel stays bounded.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogMatrix0025', 0, () => {
      const total = LOG_STORE_CAPACITY + 5;
      for (let i = 0; i < total; i++) {
        Logger.info('page', 'loop', `line${i}`);
      }
      const logs = storedLogs();
      expect(logs.length).assertEqual(LOG_STORE_CAPACITY);
      expect(logs[0].detail).assertEqual(`line${total - 1}`);
      expect(logs[LOG_STORE_CAPACITY - 1].detail).assertEqual(`line${total - LOG_STORE_CAPACITY}`);
    });
  });
}
