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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { LogItem, LogLevel, appendLog, queryLogs, countByTag } from '../../../main/ets/model/LogStore';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function LogStoreCapacityMatrixPart1Test(): void {
  describe('LogStoreCapacityMatrixPart1', () => {

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_0100
     * @tc.name      testCapacity0001
     * @tc.desc      Verify appendLog capacity 1 with 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0001 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 1; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 1);
      }
      expect(logs.length).assertEqual(1);
      expect(logs[0].detail).assertEqual('d0');
      expect(logs[logs.length - 1].detail).assertEqual('d0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0001 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_0200
     * @tc.name      testCapacity0002
     * @tc.desc      Verify appendLog capacity 1 with 2 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0002 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 2; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 1);
      }
      expect(logs.length).assertEqual(1);
      expect(logs[0].detail).assertEqual('d1');
      expect(logs[logs.length - 1].detail).assertEqual('d1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0002 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_0300
     * @tc.name      testCapacity0003
     * @tc.desc      Verify appendLog capacity 1 with 3 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0003 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 3; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 1);
      }
      expect(logs.length).assertEqual(1);
      expect(logs[0].detail).assertEqual('d2');
      expect(logs[logs.length - 1].detail).assertEqual('d2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0003 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_0400
     * @tc.name      testCapacity0004
     * @tc.desc      Verify appendLog capacity 1 with 6 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0004 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 6; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 1);
      }
      expect(logs.length).assertEqual(1);
      expect(logs[0].detail).assertEqual('d5');
      expect(logs[logs.length - 1].detail).assertEqual('d5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0004 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_0500
     * @tc.name      testCapacity0005
     * @tc.desc      Verify appendLog capacity 1 with 10 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0005 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 10; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 1);
      }
      expect(logs.length).assertEqual(1);
      expect(logs[0].detail).assertEqual('d9');
      expect(logs[logs.length - 1].detail).assertEqual('d9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0005 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_0600
     * @tc.name      testCapacity0006
     * @tc.desc      Verify appendLog capacity 2 with 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0006 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 1; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 2);
      }
      expect(logs.length).assertEqual(1);
      expect(logs[0].detail).assertEqual('d0');
      expect(logs[logs.length - 1].detail).assertEqual('d0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0006 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_0700
     * @tc.name      testCapacity0007
     * @tc.desc      Verify appendLog capacity 2 with 2 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0007 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 2; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 2);
      }
      expect(logs.length).assertEqual(2);
      expect(logs[0].detail).assertEqual('d1');
      expect(logs[logs.length - 1].detail).assertEqual('d0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0007 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_0800
     * @tc.name      testCapacity0008
     * @tc.desc      Verify appendLog capacity 2 with 3 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0008 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 3; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 2);
      }
      expect(logs.length).assertEqual(2);
      expect(logs[0].detail).assertEqual('d2');
      expect(logs[logs.length - 1].detail).assertEqual('d1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0008 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_0900
     * @tc.name      testCapacity0009
     * @tc.desc      Verify appendLog capacity 2 with 6 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0009 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 6; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 2);
      }
      expect(logs.length).assertEqual(2);
      expect(logs[0].detail).assertEqual('d5');
      expect(logs[logs.length - 1].detail).assertEqual('d4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0009 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_1000
     * @tc.name      testCapacity0010
     * @tc.desc      Verify appendLog capacity 2 with 10 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0010 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 10; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 2);
      }
      expect(logs.length).assertEqual(2);
      expect(logs[0].detail).assertEqual('d9');
      expect(logs[logs.length - 1].detail).assertEqual('d8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0010 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_1100
     * @tc.name      testCapacity0011
     * @tc.desc      Verify appendLog capacity 3 with 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0011 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 1; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 3);
      }
      expect(logs.length).assertEqual(1);
      expect(logs[0].detail).assertEqual('d0');
      expect(logs[logs.length - 1].detail).assertEqual('d0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0011 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_1200
     * @tc.name      testCapacity0012
     * @tc.desc      Verify appendLog capacity 3 with 2 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0012 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 2; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 3);
      }
      expect(logs.length).assertEqual(2);
      expect(logs[0].detail).assertEqual('d1');
      expect(logs[logs.length - 1].detail).assertEqual('d0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0012 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_1300
     * @tc.name      testCapacity0013
     * @tc.desc      Verify appendLog capacity 3 with 3 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0013 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 3; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 3);
      }
      expect(logs.length).assertEqual(3);
      expect(logs[0].detail).assertEqual('d2');
      expect(logs[logs.length - 1].detail).assertEqual('d0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0013 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_1400
     * @tc.name      testCapacity0014
     * @tc.desc      Verify appendLog capacity 3 with 6 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0014 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 6; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 3);
      }
      expect(logs.length).assertEqual(3);
      expect(logs[0].detail).assertEqual('d5');
      expect(logs[logs.length - 1].detail).assertEqual('d3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0014 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_1500
     * @tc.name      testCapacity0015
     * @tc.desc      Verify appendLog capacity 3 with 10 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0015 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 10; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 3);
      }
      expect(logs.length).assertEqual(3);
      expect(logs[0].detail).assertEqual('d9');
      expect(logs[logs.length - 1].detail).assertEqual('d7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0015 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_1600
     * @tc.name      testCapacity0016
     * @tc.desc      Verify appendLog capacity 5 with 1 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0016 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 1; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 5);
      }
      expect(logs.length).assertEqual(1);
      expect(logs[0].detail).assertEqual('d0');
      expect(logs[logs.length - 1].detail).assertEqual('d0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0016 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_1700
     * @tc.name      testCapacity0017
     * @tc.desc      Verify appendLog capacity 5 with 2 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0017 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 2; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 5);
      }
      expect(logs.length).assertEqual(2);
      expect(logs[0].detail).assertEqual('d1');
      expect(logs[logs.length - 1].detail).assertEqual('d0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0017 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_1800
     * @tc.name      testCapacity0018
     * @tc.desc      Verify appendLog capacity 5 with 3 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0018 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 3; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 5);
      }
      expect(logs.length).assertEqual(3);
      expect(logs[0].detail).assertEqual('d2');
      expect(logs[logs.length - 1].detail).assertEqual('d0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0018 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_1900
     * @tc.name      testCapacity0019
     * @tc.desc      Verify appendLog capacity 5 with 6 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0019 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 6; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 5);
      }
      expect(logs.length).assertEqual(5);
      expect(logs[0].detail).assertEqual('d5');
      expect(logs[logs.length - 1].detail).assertEqual('d1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0019 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_2000
     * @tc.name      testCapacity0020
     * @tc.desc      Verify appendLog capacity 5 with 10 items.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCapacity0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0020 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 10; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 5);
      }
      expect(logs.length).assertEqual(5);
      expect(logs[0].detail).assertEqual('d9');
      expect(logs[logs.length - 1].detail).assertEqual('d5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCapacity0020 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_2100
     * @tc.name      testDefaultCapacity0021
     * @tc.desc      Verify capacity zero falls back to the default capacity.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testDefaultCapacity0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDefaultCapacity0021 begin');
      await delayTick();
      let logs: LogItem[] = [];
      for (let i: number = 0; i < 5; i++) {
        logs = appendLog(logs, new LogItem('device', 'download', 'd' + i, LogLevel.INFO), 0);
      }
      expect(logs.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDefaultCapacity0021 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_2200
     * @tc.name      testQuery0022
     * @tc.desc      Verify query source='' min=DEBUG keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0022 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, '', LogLevel.DEBUG, '', 2);
      expect(result.length).assertEqual(2);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error|search:lookup info');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0022 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_2300
     * @tc.name      testQuery0023
     * @tc.desc      Verify query source='' min=DEBUG keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0023 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, '', LogLevel.DEBUG, 'err', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0023 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_2400
     * @tc.name      testQuery0024
     * @tc.desc      Verify query source='' min=DEBUG keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0024 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, '', LogLevel.DEBUG, 'page', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('page:open debug');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0024 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_2500
     * @tc.name      testQuery0025
     * @tc.desc      Verify query source='' min=INFO keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0025 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, '', LogLevel.INFO, '', 2);
      expect(result.length).assertEqual(2);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error|search:lookup info');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0025 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_2600
     * @tc.name      testQuery0026
     * @tc.desc      Verify query source='' min=INFO keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0026 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, '', LogLevel.INFO, 'err', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0026 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_2700
     * @tc.name      testQuery0027
     * @tc.desc      Verify query source='' min=INFO keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0027 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, '', LogLevel.INFO, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0027 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_2800
     * @tc.name      testQuery0028
     * @tc.desc      Verify query source='' min=WARN keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0028 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, '', LogLevel.WARN, '', 2);
      expect(result.length).assertEqual(2);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error|tabs:switch warn');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0028 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_2900
     * @tc.name      testQuery0029
     * @tc.desc      Verify query source='' min=WARN keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0029 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, '', LogLevel.WARN, 'err', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0029 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_3000
     * @tc.name      testQuery0030
     * @tc.desc      Verify query source='' min=WARN keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0030 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, '', LogLevel.WARN, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0030 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_3100
     * @tc.name      testQuery0031
     * @tc.desc      Verify query source='' min=ERROR keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0031 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, '', LogLevel.ERROR, '', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0031 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_3200
     * @tc.name      testQuery0032
     * @tc.desc      Verify query source='' min=ERROR keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0032 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, '', LogLevel.ERROR, 'err', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0032 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_3300
     * @tc.name      testQuery0033
     * @tc.desc      Verify query source='' min=ERROR keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0033 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, '', LogLevel.ERROR, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0033 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_3400
     * @tc.name      testQuery0034
     * @tc.desc      Verify query source='device' min=DEBUG keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0034 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'device', LogLevel.DEBUG, '', 2);
      expect(result.length).assertEqual(2);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error|page:open debug');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0034 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_3500
     * @tc.name      testQuery0035
     * @tc.desc      Verify query source='device' min=DEBUG keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0035 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'device', LogLevel.DEBUG, 'err', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0035 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_3600
     * @tc.name      testQuery0036
     * @tc.desc      Verify query source='device' min=DEBUG keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0036 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'device', LogLevel.DEBUG, 'page', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('page:open debug');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0036 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_3700
     * @tc.name      testQuery0037
     * @tc.desc      Verify query source='device' min=INFO keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0037 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'device', LogLevel.INFO, '', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0037 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_3800
     * @tc.name      testQuery0038
     * @tc.desc      Verify query source='device' min=INFO keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0038 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'device', LogLevel.INFO, 'err', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0038 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_3900
     * @tc.name      testQuery0039
     * @tc.desc      Verify query source='device' min=INFO keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0039 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'device', LogLevel.INFO, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0039 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP1_4000
     * @tc.name      testQuery0040
     * @tc.desc      Verify query source='device' min=WARN keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0040 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'device', LogLevel.WARN, '', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0040 end');
    })

  })
}
