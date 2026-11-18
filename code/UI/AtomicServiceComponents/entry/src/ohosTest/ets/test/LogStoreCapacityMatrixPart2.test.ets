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

export default function LogStoreCapacityMatrixPart2Test(): void {
  describe('LogStoreCapacityMatrixPart2', () => {

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_4100
     * @tc.name      testQuery0041
     * @tc.desc      Verify query source='device' min=WARN keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0041 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'device', LogLevel.WARN, 'err', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0041 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_4200
     * @tc.name      testQuery0042
     * @tc.desc      Verify query source='device' min=WARN keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0042 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'device', LogLevel.WARN, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0042 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_4300
     * @tc.name      testQuery0043
     * @tc.desc      Verify query source='device' min=ERROR keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0043 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'device', LogLevel.ERROR, '', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0043 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_4400
     * @tc.name      testQuery0044
     * @tc.desc      Verify query source='device' min=ERROR keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0044 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'device', LogLevel.ERROR, 'err', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('download:export error');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0044 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_4500
     * @tc.name      testQuery0045
     * @tc.desc      Verify query source='device' min=ERROR keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0045 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'device', LogLevel.ERROR, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0045 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_4600
     * @tc.name      testQuery0046
     * @tc.desc      Verify query source='page' min=DEBUG keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0046 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'page', LogLevel.DEBUG, '', 2);
      expect(result.length).assertEqual(2);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('search:lookup info|tabs:switch warn');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0046 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_4700
     * @tc.name      testQuery0047
     * @tc.desc      Verify query source='page' min=DEBUG keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0047 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'page', LogLevel.DEBUG, 'err', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0047 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_4800
     * @tc.name      testQuery0048
     * @tc.desc      Verify query source='page' min=DEBUG keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0048 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'page', LogLevel.DEBUG, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0048 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_4900
     * @tc.name      testQuery0049
     * @tc.desc      Verify query source='page' min=INFO keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0049 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'page', LogLevel.INFO, '', 2);
      expect(result.length).assertEqual(2);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('search:lookup info|tabs:switch warn');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0049 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_5000
     * @tc.name      testQuery0050
     * @tc.desc      Verify query source='page' min=INFO keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0050 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'page', LogLevel.INFO, 'err', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0050 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_5100
     * @tc.name      testQuery0051
     * @tc.desc      Verify query source='page' min=INFO keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0051 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'page', LogLevel.INFO, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0051 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_5200
     * @tc.name      testQuery0052
     * @tc.desc      Verify query source='page' min=WARN keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0052 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'page', LogLevel.WARN, '', 2);
      expect(result.length).assertEqual(1);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('tabs:switch warn');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0052 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_5300
     * @tc.name      testQuery0053
     * @tc.desc      Verify query source='page' min=WARN keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0053 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'page', LogLevel.WARN, 'err', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0053 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_5400
     * @tc.name      testQuery0054
     * @tc.desc      Verify query source='page' min=WARN keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0054 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'page', LogLevel.WARN, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0054 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_5500
     * @tc.name      testQuery0055
     * @tc.desc      Verify query source='page' min=ERROR keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0055 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'page', LogLevel.ERROR, '', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0055 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_5600
     * @tc.name      testQuery0056
     * @tc.desc      Verify query source='page' min=ERROR keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0056 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'page', LogLevel.ERROR, 'err', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0056 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_5700
     * @tc.name      testQuery0057
     * @tc.desc      Verify query source='page' min=ERROR keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0057 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'page', LogLevel.ERROR, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0057 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_5800
     * @tc.name      testQuery0058
     * @tc.desc      Verify query source='unknown' min=DEBUG keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0058 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'unknown', LogLevel.DEBUG, '', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0058 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_5900
     * @tc.name      testQuery0059
     * @tc.desc      Verify query source='unknown' min=DEBUG keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0059 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'unknown', LogLevel.DEBUG, 'err', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0059 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_6000
     * @tc.name      testQuery0060
     * @tc.desc      Verify query source='unknown' min=DEBUG keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0060 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'unknown', LogLevel.DEBUG, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0060 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_6100
     * @tc.name      testQuery0061
     * @tc.desc      Verify query source='unknown' min=INFO keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0061 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'unknown', LogLevel.INFO, '', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0061 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_6200
     * @tc.name      testQuery0062
     * @tc.desc      Verify query source='unknown' min=INFO keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0062 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'unknown', LogLevel.INFO, 'err', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0062 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_6300
     * @tc.name      testQuery0063
     * @tc.desc      Verify query source='unknown' min=INFO keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0063 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'unknown', LogLevel.INFO, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0063 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_6400
     * @tc.name      testQuery0064
     * @tc.desc      Verify query source='unknown' min=WARN keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0064 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'unknown', LogLevel.WARN, '', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0064 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_6500
     * @tc.name      testQuery0065
     * @tc.desc      Verify query source='unknown' min=WARN keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0065 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'unknown', LogLevel.WARN, 'err', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0065 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_6600
     * @tc.name      testQuery0066
     * @tc.desc      Verify query source='unknown' min=WARN keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0066 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'unknown', LogLevel.WARN, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0066 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_6700
     * @tc.name      testQuery0067
     * @tc.desc      Verify query source='unknown' min=ERROR keyword=''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0067 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'unknown', LogLevel.ERROR, '', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0067 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_6800
     * @tc.name      testQuery0068
     * @tc.desc      Verify query source='unknown' min=ERROR keyword='err'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0068 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'unknown', LogLevel.ERROR, 'err', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0068 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_6900
     * @tc.name      testQuery0069
     * @tc.desc      Verify query source='unknown' min=ERROR keyword='page'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQuery0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0069 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'export error', LogLevel.ERROR),
        new LogItem('page', 'search', 'lookup info', LogLevel.INFO),
        new LogItem('page', 'tabs', 'switch warn', LogLevel.WARN),
        new LogItem('device', 'page', 'open debug', LogLevel.DEBUG)
      ];
      const result = queryLogs(logs, 'unknown', LogLevel.ERROR, 'page', 2);
      expect(result.length).assertEqual(0);
      const keys: string = result.map((item) => item.tag + ':' + item.detail).join('|');
      expect(keys).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQuery0069 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_7000
     * @tc.name      testCountByTag0070
     * @tc.desc      Verify countByTag('download') returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountByTag0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountByTag0070 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'a', LogLevel.ERROR),
        new LogItem('page', 'page', 'b', LogLevel.INFO),
        new LogItem('device', 'download', 'c', LogLevel.WARN)
      ];
      expect(countByTag(logs, 'download')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountByTag0070 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_7100
     * @tc.name      testCountByTag0071
     * @tc.desc      Verify countByTag('page') returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountByTag0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountByTag0071 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'a', LogLevel.ERROR),
        new LogItem('page', 'page', 'b', LogLevel.INFO),
        new LogItem('device', 'download', 'c', LogLevel.WARN)
      ];
      expect(countByTag(logs, 'page')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountByTag0071 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_7200
     * @tc.name      testCountByTag0072
     * @tc.desc      Verify countByTag('unknown') returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountByTag0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountByTag0072 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'a', LogLevel.ERROR),
        new LogItem('page', 'page', 'b', LogLevel.INFO),
        new LogItem('device', 'download', 'c', LogLevel.WARN)
      ];
      expect(countByTag(logs, 'unknown')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountByTag0072 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_LSCP2_7300
     * @tc.name      testCountByTag0073
     * @tc.desc      Verify countByTag('') returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountByTag0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountByTag0073 begin');
      await delayTick();
      const logs: LogItem[] = [
        new LogItem('device', 'download', 'a', LogLevel.ERROR),
        new LogItem('page', 'page', 'b', LogLevel.INFO),
        new LogItem('device', 'download', 'c', LogLevel.WARN)
      ];
      expect(countByTag(logs, '')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountByTag0073 end');
    })

  })
}
