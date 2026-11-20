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

/**
 * 页面日志存储矩阵。
 *
 * queryLogs 的三个过滤维度（来源、级别、关键字）与 limit 交叉组合，
 * appendLog 覆盖容量边界与非法容量回退，二者都断言「不修改入参」，
 * 因为日志面板依赖原始数组不变来避免渲染抖动。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  LogItem,
  LogLevel,
  appendLog,
  clearLogs,
  countByTag,
  logLevelName,
  queryLogs
} from '../../../main/ets/model/LogStore';
import { LOG_STORE_CAPACITY } from '../../../main/ets/common/AppConstants';

/** 构造八个固定日志项，顺序与 queryLogs 的「新的在前」约定一致 */
function buildLogs(): LogItem[] {
  const logs: LogItem[] = [];
  logs.push(new LogItem('PageA', 'create', 'ag profile created', LogLevel.INFO));
  logs.push(new LogItem('PageA', 'devices', 'connected 1 device', LogLevel.INFO));
  logs.push(new LogItem('PageA', 'devices', 'connected 2 devices', LogLevel.DEBUG));
  logs.push(new LogItem('PageB', 'state', 'connection state 2', LogLevel.WARN));
  logs.push(new LogItem('PageB', 'state', 'connection state 0', LogLevel.ERROR));
  logs.push(new LogItem('ProfileSession', 'on', 'subscribed change', LogLevel.INFO));
  logs.push(new LogItem('ProfileSession', 'off', 'unsubscribed change', LogLevel.WARN));
  logs.push(new LogItem('ProfileSession', 'release', 'instance released', LogLevel.DEBUG));
  return logs;
}

/** 构造指定数量的日志项，用于容量裁剪用例 */
function buildLogsOf(count: number): LogItem[] {
  const logs: LogItem[] = [];
  for (let index = 0; index < count; index++) {
    logs.push(new LogItem('Bulk', `tag${index}`, `detail ${index}`, LogLevel.INFO));
  }
  return logs;
}

export default function bluetoothProfileLogStoreMatrixTest() {
  describe('BluetoothProfileLogStoreMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0001
     * @tc.name logStore0001
     * @tc.desc Verify log level DEBUG renders "DEBUG" and differs from INFO.
     */
    it('logStore0001', 0, () => {
      expect(logLevelName(LogLevel.DEBUG)).assertEqual('DEBUG');
      expect(logLevelName(LogLevel.DEBUG).length).assertEqual(5);
      expect(logLevelName(LogLevel.DEBUG) === logLevelName(LogLevel.INFO)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0002
     * @tc.name logStore0002
     * @tc.desc Verify log level INFO renders "INFO" and differs from WARN.
     */
    it('logStore0002', 0, () => {
      expect(logLevelName(LogLevel.INFO)).assertEqual('INFO');
      expect(logLevelName(LogLevel.INFO).length).assertEqual(4);
      expect(logLevelName(LogLevel.INFO) === logLevelName(LogLevel.WARN)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0003
     * @tc.name logStore0003
     * @tc.desc Verify log level WARN renders "WARN" and differs from ERROR.
     */
    it('logStore0003', 0, () => {
      expect(logLevelName(LogLevel.WARN)).assertEqual('WARN');
      expect(logLevelName(LogLevel.WARN).length).assertEqual(4);
      expect(logLevelName(LogLevel.WARN) === logLevelName(LogLevel.ERROR)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0004
     * @tc.name logStore0004
     * @tc.desc Verify log level ERROR renders "ERROR" and differs from DEBUG.
     */
    it('logStore0004', 0, () => {
      expect(logLevelName(LogLevel.ERROR)).assertEqual('ERROR');
      expect(logLevelName(LogLevel.ERROR).length).assertEqual(5);
      expect(logLevelName(LogLevel.ERROR) === logLevelName(LogLevel.DEBUG)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0005
     * @tc.name logStore0005
     * @tc.desc Verify queryLogs case 1 for source any, level 0 and limit 20 gives 8.
     */
    it('logStore0005', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, '', 20);
      expect(filtered.length).assertEqual(8);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('create');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0006
     * @tc.name logStore0006
     * @tc.desc Verify queryLogs case 2 for source any, level 1 and limit 20 gives 6.
     */
    it('logStore0006', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.INFO, '', 20);
      expect(filtered.length).assertEqual(6);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('create');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0007
     * @tc.name logStore0007
     * @tc.desc Verify queryLogs case 3 for source any, level 2 and limit 20 gives 3.
     */
    it('logStore0007', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.WARN, '', 20);
      expect(filtered.length).assertEqual(3);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('state');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0008
     * @tc.name logStore0008
     * @tc.desc Verify queryLogs case 4 for source any, level 3 and limit 20 gives 1.
     */
    it('logStore0008', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, '', 20);
      expect(filtered.length).assertEqual(1);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('state');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0009
     * @tc.name logStore0009
     * @tc.desc Verify queryLogs case 5 for source PageA, level 0 and limit 20 gives 3.
     */
    it('logStore0009', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageA', LogLevel.DEBUG, '', 20);
      expect(filtered.length).assertEqual(3);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('create');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0010
     * @tc.name logStore0010
     * @tc.desc Verify queryLogs case 6 for source PageA, level 1 and limit 20 gives 2.
     */
    it('logStore0010', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageA', LogLevel.INFO, '', 20);
      expect(filtered.length).assertEqual(2);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('create');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0011
     * @tc.name logStore0011
     * @tc.desc Verify queryLogs case 7 for source PageA, level 2 and limit 20 gives 0.
     */
    it('logStore0011', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageA', LogLevel.WARN, '', 20);
      expect(filtered.length).assertEqual(0);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0012
     * @tc.name logStore0012
     * @tc.desc Verify queryLogs case 8 for source PageA, level 3 and limit 20 gives 0.
     */
    it('logStore0012', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageA', LogLevel.ERROR, '', 20);
      expect(filtered.length).assertEqual(0);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0013
     * @tc.name logStore0013
     * @tc.desc Verify queryLogs case 9 for source PageB, level 0 and limit 20 gives 2.
     */
    it('logStore0013', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageB', LogLevel.DEBUG, '', 20);
      expect(filtered.length).assertEqual(2);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('state');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0014
     * @tc.name logStore0014
     * @tc.desc Verify queryLogs case 10 for source PageB, level 1 and limit 20 gives 2.
     */
    it('logStore0014', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageB', LogLevel.INFO, '', 20);
      expect(filtered.length).assertEqual(2);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('state');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0015
     * @tc.name logStore0015
     * @tc.desc Verify queryLogs case 11 for source PageB, level 2 and limit 20 gives 2.
     */
    it('logStore0015', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageB', LogLevel.WARN, '', 20);
      expect(filtered.length).assertEqual(2);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('state');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0016
     * @tc.name logStore0016
     * @tc.desc Verify queryLogs case 12 for source PageB, level 3 and limit 20 gives 1.
     */
    it('logStore0016', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageB', LogLevel.ERROR, '', 20);
      expect(filtered.length).assertEqual(1);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('state');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0017
     * @tc.name logStore0017
     * @tc.desc Verify queryLogs case 13 for source ProfileSession, level 0 and limit 20 gives 3.
     */
    it('logStore0017', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'ProfileSession', LogLevel.DEBUG, '', 20);
      expect(filtered.length).assertEqual(3);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('on');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0018
     * @tc.name logStore0018
     * @tc.desc Verify queryLogs case 14 for source ProfileSession, level 1 and limit 20 gives 2.
     */
    it('logStore0018', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'ProfileSession', LogLevel.INFO, '', 20);
      expect(filtered.length).assertEqual(2);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('on');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0019
     * @tc.name logStore0019
     * @tc.desc Verify queryLogs case 15 for source ProfileSession, level 2 and limit 20 gives 1.
     */
    it('logStore0019', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'ProfileSession', LogLevel.WARN, '', 20);
      expect(filtered.length).assertEqual(1);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('off');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0020
     * @tc.name logStore0020
     * @tc.desc Verify queryLogs case 16 for source ProfileSession, level 3 and limit 20 gives 0.
     */
    it('logStore0020', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'ProfileSession', LogLevel.ERROR, '', 20);
      expect(filtered.length).assertEqual(0);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0021
     * @tc.name logStore0021
     * @tc.desc Verify queryLogs case 17 for source PageC, level 0 and limit 20 gives 0.
     */
    it('logStore0021', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageC', LogLevel.DEBUG, '', 20);
      expect(filtered.length).assertEqual(0);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0022
     * @tc.name logStore0022
     * @tc.desc Verify queryLogs case 18 for source PageC, level 1 and limit 20 gives 0.
     */
    it('logStore0022', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageC', LogLevel.INFO, '', 20);
      expect(filtered.length).assertEqual(0);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0023
     * @tc.name logStore0023
     * @tc.desc Verify queryLogs case 19 for source PageC, level 2 and limit 20 gives 0.
     */
    it('logStore0023', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageC', LogLevel.WARN, '', 20);
      expect(filtered.length).assertEqual(0);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0024
     * @tc.name logStore0024
     * @tc.desc Verify queryLogs case 20 for source PageC, level 3 and limit 20 gives 0.
     */
    it('logStore0024', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageC', LogLevel.ERROR, '', 20);
      expect(filtered.length).assertEqual(0);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0025
     * @tc.name logStore0025
     * @tc.desc Verify queryLogs case 21 for source any, level 0 and limit 20 gives 8.
     */
    it('logStore0025', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, '', 20);
      expect(filtered.length).assertEqual(8);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('create');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0026
     * @tc.name logStore0026
     * @tc.desc Verify queryLogs case 22 for source any, level 0 and limit 20 gives 2.
     */
    it('logStore0026', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'connected', 20);
      expect(filtered.length).assertEqual(2);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('devices');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0027
     * @tc.name logStore0027
     * @tc.desc Verify queryLogs case 23 for source any, level 0 and limit 20 gives 2.
     */
    it('logStore0027', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'state', 20);
      expect(filtered.length).assertEqual(2);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('state');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0028
     * @tc.name logStore0028
     * @tc.desc Verify queryLogs case 24 for source any, level 0 and limit 20 gives 2.
     */
    it('logStore0028', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'change', 20);
      expect(filtered.length).assertEqual(2);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('on');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0029
     * @tc.name logStore0029
     * @tc.desc Verify queryLogs case 25 for source any, level 0 and limit 20 gives 0.
     */
    it('logStore0029', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'zzz', 20);
      expect(filtered.length).assertEqual(0);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0030
     * @tc.name logStore0030
     * @tc.desc Verify queryLogs case 26 for source any, level 0 and limit 20 gives 1.
     */
    it('logStore0030', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'AG', 20);
      expect(filtered.length).assertEqual(1);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('create');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0031
     * @tc.name logStore0031
     * @tc.desc Verify queryLogs case 27 for source any, level 0 and limit 0 gives 8.
     */
    it('logStore0031', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, '', 0);
      expect(filtered.length).assertEqual(8);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('create');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0032
     * @tc.name logStore0032
     * @tc.desc Verify queryLogs case 28 for source any, level 0 and limit 1 gives 1.
     */
    it('logStore0032', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, '', 1);
      expect(filtered.length).assertEqual(1);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('create');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0033
     * @tc.name logStore0033
     * @tc.desc Verify queryLogs case 29 for source any, level 0 and limit 3 gives 3.
     */
    it('logStore0033', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, '', 3);
      expect(filtered.length).assertEqual(3);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('create');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0034
     * @tc.name logStore0034
     * @tc.desc Verify queryLogs case 30 for source any, level 0 and limit 8 gives 8.
     */
    it('logStore0034', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, '', 8);
      expect(filtered.length).assertEqual(8);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('create');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0035
     * @tc.name logStore0035
     * @tc.desc Verify queryLogs case 31 for source PageA, level 0 and limit 1 gives 1.
     */
    it('logStore0035', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageA', LogLevel.DEBUG, 'devices', 1);
      expect(filtered.length).assertEqual(1);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('devices');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0036
     * @tc.name logStore0036
     * @tc.desc Verify queryLogs case 32 for source PageB, level 3 and limit 2 gives 1.
     */
    it('logStore0036', 0, () => {
      const logs: LogItem[] = buildLogs();
      const filtered: LogItem[] = queryLogs(logs, 'PageB', LogLevel.ERROR, 'state', 2);
      expect(filtered.length).assertEqual(1);
      expect(filtered.length > 0 ? filtered[0].tag : '').assertEqual('state');
      expect(logs.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0037
     * @tc.name logStore0037
     * @tc.desc Verify appendLog with 0 rows and capacity 200 (empty store keeps one) keeps 1.
     */
    it('logStore0037', 0, () => {
      const logs: LogItem[] = buildLogsOf(0);
      expect(logs.length).assertEqual(0);
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'case', 'appended row', LogLevel.INFO), 200);
      expect(next.length).assertEqual(1);
      expect(next[0].tag).assertEqual('case');
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0038
     * @tc.name logStore0038
     * @tc.desc Verify appendLog with 1 rows and capacity 200 (one becomes two) keeps 2.
     */
    it('logStore0038', 0, () => {
      const logs: LogItem[] = buildLogsOf(1);
      expect(logs.length).assertEqual(1);
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'case', 'appended row', LogLevel.INFO), 200);
      expect(next.length).assertEqual(2);
      expect(next[0].tag).assertEqual('case');
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0039
     * @tc.name logStore0039
     * @tc.desc Verify appendLog with 4 rows and capacity 200 (four becomes five) keeps 5.
     */
    it('logStore0039', 0, () => {
      const logs: LogItem[] = buildLogsOf(4);
      expect(logs.length).assertEqual(4);
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'case', 'appended row', LogLevel.INFO), 200);
      expect(next.length).assertEqual(5);
      expect(next[0].tag).assertEqual('case');
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0040
     * @tc.name logStore0040
     * @tc.desc Verify appendLog with 199 rows and capacity 200 (full store trims tail) keeps 200.
     */
    it('logStore0040', 0, () => {
      const logs: LogItem[] = buildLogsOf(199);
      expect(logs.length).assertEqual(199);
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'case', 'appended row', LogLevel.INFO), 200);
      expect(next.length).assertEqual(200);
      expect(next[0].tag).assertEqual('case');
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0041
     * @tc.name logStore0041
     * @tc.desc Verify appendLog with 200 rows and capacity 200 (overflow store trims tail) keeps 200.
     */
    it('logStore0041', 0, () => {
      const logs: LogItem[] = buildLogsOf(200);
      expect(logs.length).assertEqual(200);
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'case', 'appended row', LogLevel.INFO), 200);
      expect(next.length).assertEqual(200);
      expect(next[0].tag).assertEqual('case');
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0042
     * @tc.name logStore0042
     * @tc.desc Verify appendLog with 250 rows and capacity 200 (oversized store trims tail) keeps 200.
     */
    it('logStore0042', 0, () => {
      const logs: LogItem[] = buildLogsOf(250);
      expect(logs.length).assertEqual(250);
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'case', 'appended row', LogLevel.INFO), 200);
      expect(next.length).assertEqual(200);
      expect(next[0].tag).assertEqual('case');
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0043
     * @tc.name logStore0043
     * @tc.desc Verify appendLog with 0 rows and capacity 0 (zero capacity falls back to default) keeps 1.
     */
    it('logStore0043', 0, () => {
      const logs: LogItem[] = buildLogsOf(0);
      expect(logs.length).assertEqual(0);
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'case', 'appended row', LogLevel.INFO), 0);
      expect(next.length).assertEqual(1);
      expect(next[0].tag).assertEqual('case');
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0044
     * @tc.name logStore0044
     * @tc.desc Verify appendLog with 199 rows and capacity 0 (zero capacity still trims at default) keeps 200.
     */
    it('logStore0044', 0, () => {
      const logs: LogItem[] = buildLogsOf(199);
      expect(logs.length).assertEqual(199);
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'case', 'appended row', LogLevel.INFO), 0);
      expect(next.length).assertEqual(200);
      expect(next[0].tag).assertEqual('case');
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0045
     * @tc.name logStore0045
     * @tc.desc Verify appendLog with 0 rows and capacity -3 (negative capacity falls back) keeps 1.
     */
    it('logStore0045', 0, () => {
      const logs: LogItem[] = buildLogsOf(0);
      expect(logs.length).assertEqual(0);
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'case', 'appended row', LogLevel.INFO), -3);
      expect(next.length).assertEqual(1);
      expect(next[0].tag).assertEqual('case');
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0046
     * @tc.name logStore0046
     * @tc.desc Verify appendLog with 3 rows and capacity 3 (small capacity trims to three) keeps 3.
     */
    it('logStore0046', 0, () => {
      const logs: LogItem[] = buildLogsOf(3);
      expect(logs.length).assertEqual(3);
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'case', 'appended row', LogLevel.INFO), 3);
      expect(next.length).assertEqual(3);
      expect(next[0].tag).assertEqual('case');
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0047
     * @tc.name logStore0047
     * @tc.desc Verify appendLog with 3 rows and capacity 1 (capacity one keeps newest) keeps 1.
     */
    it('logStore0047', 0, () => {
      const logs: LogItem[] = buildLogsOf(3);
      expect(logs.length).assertEqual(3);
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'case', 'appended row', LogLevel.INFO), 1);
      expect(next.length).assertEqual(1);
      expect(next[0].tag).assertEqual('case');
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0048
     * @tc.name logStore0048
     * @tc.desc Verify appendLog with 5 rows and capacity 2 (capacity two keeps newest) keeps 2.
     */
    it('logStore0048', 0, () => {
      const logs: LogItem[] = buildLogsOf(5);
      expect(logs.length).assertEqual(5);
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'case', 'appended row', LogLevel.INFO), 2);
      expect(next.length).assertEqual(2);
      expect(next[0].tag).assertEqual('case');
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0049
     * @tc.name logStore0049
     * @tc.desc Verify countByTag returns 1 for tag "create".
     */
    it('logStore0049', 0, () => {
      const logs: LogItem[] = buildLogs();
      expect(countByTag(logs, 'create')).assertEqual(1);
      expect(countByTag(logs, 'create')).assertEqual(logs.filter((item: LogItem) => item.tag === 'create').length);
      expect(countByTag(clearLogs(), 'create')).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0050
     * @tc.name logStore0050
     * @tc.desc Verify countByTag returns 2 for tag "devices".
     */
    it('logStore0050', 0, () => {
      const logs: LogItem[] = buildLogs();
      expect(countByTag(logs, 'devices')).assertEqual(2);
      expect(countByTag(logs, 'devices')).assertEqual(logs.filter((item: LogItem) => item.tag === 'devices').length);
      expect(countByTag(clearLogs(), 'devices')).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0051
     * @tc.name logStore0051
     * @tc.desc Verify countByTag returns 2 for tag "state".
     */
    it('logStore0051', 0, () => {
      const logs: LogItem[] = buildLogs();
      expect(countByTag(logs, 'state')).assertEqual(2);
      expect(countByTag(logs, 'state')).assertEqual(logs.filter((item: LogItem) => item.tag === 'state').length);
      expect(countByTag(clearLogs(), 'state')).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0052
     * @tc.name logStore0052
     * @tc.desc Verify countByTag returns 1 for tag "on".
     */
    it('logStore0052', 0, () => {
      const logs: LogItem[] = buildLogs();
      expect(countByTag(logs, 'on')).assertEqual(1);
      expect(countByTag(logs, 'on')).assertEqual(logs.filter((item: LogItem) => item.tag === 'on').length);
      expect(countByTag(clearLogs(), 'on')).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0053
     * @tc.name logStore0053
     * @tc.desc Verify countByTag returns 1 for tag "off".
     */
    it('logStore0053', 0, () => {
      const logs: LogItem[] = buildLogs();
      expect(countByTag(logs, 'off')).assertEqual(1);
      expect(countByTag(logs, 'off')).assertEqual(logs.filter((item: LogItem) => item.tag === 'off').length);
      expect(countByTag(clearLogs(), 'off')).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0054
     * @tc.name logStore0054
     * @tc.desc Verify countByTag returns 1 for tag "release".
     */
    it('logStore0054', 0, () => {
      const logs: LogItem[] = buildLogs();
      expect(countByTag(logs, 'release')).assertEqual(1);
      expect(countByTag(logs, 'release')).assertEqual(logs.filter((item: LogItem) => item.tag === 'release').length);
      expect(countByTag(clearLogs(), 'release')).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0055
     * @tc.name logStore0055
     * @tc.desc Verify countByTag returns 0 for tag "missing".
     */
    it('logStore0055', 0, () => {
      const logs: LogItem[] = buildLogs();
      expect(countByTag(logs, 'missing')).assertEqual(0);
      expect(countByTag(logs, 'missing')).assertEqual(logs.filter((item: LogItem) => item.tag === 'missing').length);
      expect(countByTag(clearLogs(), 'missing')).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0056
     * @tc.name logStore0056
     * @tc.desc Verify a new LogItem carries the given source, tag, detail and level.
     */
    it('logStore0056', 0, () => {
      const item: LogItem = new LogItem('PageA', 'create', 'ag profile created', LogLevel.WARN);
      expect(item.source).assertEqual('PageA');
      expect(item.tag).assertEqual('create');
      expect(item.detail).assertEqual('ag profile created');
      expect(item.level).assertEqual(LogLevel.WARN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0057
     * @tc.name logStore0057
     * @tc.desc Verify LogItem ids are strictly increasing so the log panel can sort stably.
     */
    it('logStore0057', 0, () => {
      const first: LogItem = new LogItem('PageA', 'a', 'first', LogLevel.INFO);
      const second: LogItem = new LogItem('PageA', 'b', 'second', LogLevel.INFO);
      expect(second.id > first.id).assertTrue();
      expect(second.id - first.id).assertEqual(1);
      expect(first.id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0058
     * @tc.name logStore0058
     * @tc.desc Verify the default log level is INFO when the caller omits it.
     */
    it('logStore0058', 0, () => {
      const item: LogItem = new LogItem('PageA', 'tag', 'detail');
      expect(item.level).assertEqual(LogLevel.INFO);
      expect(logLevelName(item.level)).assertEqual('INFO');
      expect(item.time.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0059
     * @tc.name logStore0059
     * @tc.desc Verify clearLogs always returns a brand new empty array.
     */
    it('logStore0059', 0, () => {
      const first: LogItem[] = clearLogs();
      const second: LogItem[] = clearLogs();
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(0);
      expect(first === second).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0060
     * @tc.name logStore0060
     * @tc.desc Verify appendLog does not mutate the incoming array.
     */
    it('logStore0060', 0, () => {
      const logs: LogItem[] = buildLogs();
      appendLog(logs, new LogItem('Test', 'extra', 'extra row', LogLevel.INFO));
      expect(logs.length).assertEqual(8);
      expect(logs[0].tag).assertEqual('create');
      expect(logs[7].level).assertEqual(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0061
     * @tc.name logStore0061
     * @tc.desc Verify appendLog puts the newest row at the head of the list.
     */
    it('logStore0061', 0, () => {
      const logs: LogItem[] = buildLogs();
      const next: LogItem[] = appendLog(logs, new LogItem('Test', 'newest', 'newest row', LogLevel.ERROR));
      expect(next[0].tag).assertEqual('newest');
      expect(next[1].tag).assertEqual('create');
      expect(next.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOGSTORE_0062
     * @tc.name logStore0062
     * @tc.desc Verify the store capacity constant stays aligned with the append default.
     */
    it('logStore0062', 0, () => {
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(buildLogsOf(300).length).assertEqual(300);
      const full: LogItem[] = buildLogsOf(199);
      const extra: LogItem = new LogItem('Test', 'x', 'x', LogLevel.INFO);
      expect(appendLog(full, extra).length).assertEqual(LOG_STORE_CAPACITY);
      const overflow: LogItem[] = buildLogsOf(200);
      expect(appendLog(overflow, extra).length).assertEqual(LOG_STORE_CAPACITY);
    });
  });
}
