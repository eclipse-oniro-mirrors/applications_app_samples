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
// LogStore 单测：LogItem 字段/默认值与自增 id、appendLog 前插/容量截断/不可变语义、queryLogs 多条件过滤、计数与清空。
// 中央日志（AppStorage 'appLogs'）的读写约定都建立在这些纯函数之上：数组必须整体替换、新日志插在最前。

import { describe, it, expect } from '@ohos/hypium';
import { LOG_STORE_CAPACITY } from '../main/ets/common/AppConstants';
import {
  LogItem,
  LogLevel,
  appendLog,
  clearLogs,
  countByTag,
  logLevelName,
  queryLogs
} from '../main/ets/model/LogStore';

// 统一用固定时间构造日志，保证 time 字段断言不受运行时刻影响
function makeLog(source: string, tag: string, detail: string, level: LogLevel): LogItem {
  return new LogItem(source, tag, detail, level, new Date(2026, 9, 27, 12, 0, 0));
}

export default function logStoreTest() {
  describe('LogStoreTest', () => {
    // LogItem：显式入参逐字段核对（含补零后的 time）；不传 level 时默认 INFO
    it('logItem_fields', 0, () => {
      const item = makeLog('Search', '提交', '搜索 Web', LogLevel.WARN);
      expect(item.time).assertEqual('12:00:00');
      expect(item.source).assertEqual('Search');
      expect(item.tag).assertEqual('提交');
      expect(item.detail).assertEqual('搜索 Web');
      expect(item.level).assertEqual(LogLevel.WARN);
      expect(item.id > 0).assertTrue();
      const fallback = new LogItem('A', 'T', '默认级别');
      expect(fallback.level).assertEqual(LogLevel.INFO);
    });

    // appendLog：新日志插在最前，且 id 顺序与展示顺序一致（最新的 id 最大在前）
    it('append_prepends', 0, () => {
      const first = makeLog('A', 'T1', 'first', LogLevel.INFO);
      const second = makeLog('A', 'T2', 'second', LogLevel.INFO);
      const logs = appendLog(appendLog([], first, 10), second, 10);
      expect(logs.length).assertEqual(2);
      expect(logs[0].detail).assertEqual('second');
      expect(logs[1].detail).assertEqual('first');
      expect(logs[0].id).assertEqual(second.id);
      expect(logs[1].id).assertEqual(first.id);
    });

    // appendLog：超出容量时从尾部裁掉最旧日志，保留最新 capacity 条且顺序不乱
    it('append_capsCapacity', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 5; i++) {
        logs = appendLog(logs, makeLog('A', 'T', `item-${i}`, LogLevel.INFO), 3);
      }
      expect(logs.length).assertEqual(3);
      expect(logs[0].detail).assertEqual('item-4');
      expect(logs[1].detail).assertEqual('item-3');
      expect(logs[2].detail).assertEqual('item-2');
    });

    // appendLog：不可变语义——返回新数组、原数组及其元素完全不受影响（@StorageProp 视图依赖此约定）
    it('append_returnsNewArray', 0, () => {
      const logs: LogItem[] = [makeLog('A', 'T', 'old', LogLevel.INFO)];
      const next = appendLog(logs, makeLog('A', 'T', 'new', LogLevel.INFO), 10);
      expect(logs.length).assertEqual(1);
      expect(logs[0].detail).assertEqual('old');
      expect(next.length).assertEqual(2);
      expect(logs === next).assertFalse();
    });

    // queryLogs：按 source 过滤（LogPanel 的 filterSource 机制）；空串不过滤；过滤结果携带原 tag
    it('query_filtersSource', 0, () => {
      const logs: LogItem[] = [
        makeLog('Search', '提交', '命中 2 项', LogLevel.INFO),
        makeLog('Tabs', '切换', '切换到页签 2', LogLevel.INFO),
        makeLog('Web', '页面', '开始加载', LogLevel.INFO)
      ];
      expect(queryLogs(logs, 'Search').length).assertEqual(1);
      expect(queryLogs(logs, 'Search')[0].source).assertEqual('Search');
      expect(queryLogs(logs, 'Search')[0].tag).assertEqual('提交');
      expect(queryLogs(logs, 'Web').length).assertEqual(1);
      expect(queryLogs(logs, '').length).assertEqual(3);
    });

    // queryLogs：按最低级别过滤——WARN 及以上留 2 条、ERROR 恰好 1 条、DEBUG 全量 4 条
    it('query_filtersLevel', 0, () => {
      const logs: LogItem[] = [
        makeLog('A', 'T', 'debug', LogLevel.DEBUG),
        makeLog('A', 'T', 'info', LogLevel.INFO),
        makeLog('A', 'T', 'warn', LogLevel.WARN),
        makeLog('A', 'T', 'error', LogLevel.ERROR)
      ];
      expect(queryLogs(logs, '', LogLevel.DEBUG).length).assertEqual(4);
      const warnings = queryLogs(logs, '', LogLevel.WARN);
      expect(warnings.length).assertEqual(2);
      expect(warnings[0].level).assertEqual(LogLevel.WARN);
      const errors = queryLogs(logs, '', LogLevel.ERROR);
      expect(errors.length).assertEqual(1);
      expect(errors[0].detail).assertEqual('error');
    });

    // queryLogs：关键字大小写不敏感匹配 detail、中文生效、首尾空白被去除、无命中返回空
    it('query_filtersKeyword', 0, () => {
      const logs: LogItem[] = [
        makeLog('Web', '页面', '加载完成 index.html', LogLevel.INFO),
        makeLog('Download', '下载', '沙箱写入成功', LogLevel.INFO)
      ];
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'INDEX').length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '沙箱').length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, ' 沙箱 ').length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, 'not-exist').length).assertEqual(0);
    });

    // queryLogs 的 limit 与 countByTag：limit 只取前 N 条；同 tag 跨 source 计数（Tabs 页统计点击/切换依赖）
    it('query_respectsLimitAndCountsTags', 0, () => {
      const logs: LogItem[] = [
        makeLog('A', '点击', '1', LogLevel.INFO),
        makeLog('A', '点击', '2', LogLevel.INFO),
        makeLog('B', '切换', '3', LogLevel.INFO),
        makeLog('B', '点击', '4', LogLevel.INFO)
      ];
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 2).length).assertEqual(2);
      expect(queryLogs(logs, 'B', LogLevel.DEBUG, '', 0).length).assertEqual(2);
      expect(countByTag(logs, '点击')).assertEqual(3);
      expect(countByTag(logs, '切换')).assertEqual(1);
      expect(countByTag(logs, '不存在')).assertEqual(0);
    });

    // logLevelName：四个级别都映射到稳定的英文名（hilog 前缀与设备侧过滤依赖它）
    it('logLevelName_allLevels', 0, () => {
      expect(logLevelName(LogLevel.DEBUG)).assertEqual('DEBUG');
      expect(logLevelName(LogLevel.INFO)).assertEqual('INFO');
      expect(logLevelName(LogLevel.WARN)).assertEqual('WARN');
      expect(logLevelName(LogLevel.ERROR)).assertEqual('ERROR');
    });

    // clearLogs：清空即返回空数组，且每次都是新实例（避免共享可变单例）
    it('clearLogs_returnsEmptyArray', 0, () => {
      expect(clearLogs().length).assertEqual(0);
      expect(clearLogs() !== clearLogs()).assertTrue();
    });

    // appendLog：缺省容量等于 LOG_STORE_CAPACITY(200)，写满后最新的在最前、最旧的紧随其后被裁掉
    it('append_defaultCapacityIsConstant', 0, () => {
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      let logs: LogItem[] = [];
      for (let i = 0; i < LOG_STORE_CAPACITY + 1; i++) {
        logs = appendLog(logs, makeLog('A', 'T', `item-${i}`, LogLevel.INFO));
      }
      expect(logs.length).assertEqual(LOG_STORE_CAPACITY);
      expect(logs[0].detail).assertEqual('item-200');
      expect(logs[logs.length - 1].detail).assertEqual('item-1');
    });

    // appendLog：非法容量（0/负数）回落到 200，不会出现 0 长度上限吞掉全部日志
    it('append_invalidCapacityFallsBack', 0, () => {
      let logs: LogItem[] = [];
      for (let i = 0; i < 201; i++) {
        logs = appendLog(logs, makeLog('A', 'T', `item-${i}`, LogLevel.INFO), 0);
      }
      expect(logs.length).assertEqual(LOG_STORE_CAPACITY);
      const negative: LogItem[] = appendLog([], makeLog('A', 'T', 'x', LogLevel.INFO), -5);
      expect(negative.length).assertEqual(1);
    });

    // queryLogs：最低级别“含等于”——从 DEBUG 起全量保留，从 INFO 起恰好排除 DEBUG，从 ERROR 起为空
    it('query_minLevelInclusive', 0, () => {
      const logs: LogItem[] = [
        makeLog('A', 'T', 'debug-entry', LogLevel.DEBUG),
        makeLog('A', 'T', 'info-entry', LogLevel.INFO)
      ];
      const fromDebug = queryLogs(logs, '', LogLevel.DEBUG);
      expect(fromDebug.length).assertEqual(2);
      const fromInfo = queryLogs(logs, '', LogLevel.INFO);
      expect(fromInfo.length).assertEqual(1);
      expect(fromInfo[0].detail).assertEqual('info-entry');
      expect(queryLogs(logs, '', LogLevel.ERROR).length).assertEqual(0);
    });

    // queryLogs：关键字同时匹配 tag 字段；source 过滤与关键字过滤叠加收紧
    it('query_keywordMatchesTag', 0, () => {
      const logs: LogItem[] = [
        makeLog('Web', '控制器', '前进成功', LogLevel.INFO),
        makeLog('Web', '页面', '开始加载', LogLevel.INFO)
      ];
      expect(queryLogs(logs, '', LogLevel.DEBUG, '控制').length).assertEqual(1);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '控制器').length).assertEqual(1);
      expect(queryLogs(logs, 'Web', LogLevel.DEBUG, '控制').length).assertEqual(1);
      expect(queryLogs(logs, 'Tabs', LogLevel.DEBUG, '控制').length).assertEqual(0);
    });

    // queryLogs：limit=0 与负数都表示不限条数，返回过滤后的全部结果
    it('query_limitZeroReturnsAll', 0, () => {
      const logs: LogItem[] = [
        makeLog('A', 'T1', '1', LogLevel.INFO),
        makeLog('A', 'T2', '2', LogLevel.INFO),
        makeLog('B', 'T3', '3', LogLevel.INFO)
      ];
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length).assertEqual(3);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', -1).length).assertEqual(3);
      expect(queryLogs(logs, 'A', LogLevel.DEBUG, '', 0).length).assertEqual(2);
    });

    // countByTag：空日志数组计数为 0，不抛异常
    it('countByTag_emptyLogsReturnsZero', 0, () => {
      expect(countByTag([], '点击')).assertEqual(0);
    });

    // LogItem：静态 id 连续单调递增，保证列表渲染 key 唯一
    it('logItem_idsIncrement', 0, () => {
      const first = makeLog('A', 'T', 'first', LogLevel.INFO);
      const second = makeLog('A', 'T', 'second', LogLevel.INFO);
      const third = makeLog('A', 'T', 'third', LogLevel.INFO);
      expect(second.id).assertEqual(first.id + 1);
      expect(third.id).assertEqual(first.id + 2);
    });
  });
}
