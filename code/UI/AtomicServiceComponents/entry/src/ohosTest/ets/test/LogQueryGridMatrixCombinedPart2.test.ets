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
import { LogItem, LogLevel, queryLogs, countByTag, logLevelName } from '../../../main/ets/model/LogStore';
import { buildQueryLogs } from './shared/LogFixture';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function LogQueryGridMatrixCombinedPart2Test(): void {
  describe('LogQry2', () => {
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_11100
     * @tc.name      testQueryGrid0111
     * @tc.desc      Verify queryLogs source 'net' level 1 keyword '' limit 3. Plus Verify queryLogs source 'net' level 1 keyword 'err' limit 0. Plus Verify queryLogs source 'net' level 1 keyword 'err' limit 1. Plus Verify queryLogs source 'net' level 1 keyword 'err' limit 3. Plus Verify queryLogs source 'net' level 1 keyword 'TAG' limit 0. Plus Verify queryLogs source 'net' level 1 keyword 'TAG' limit 1. Plus Verify queryLogs source 'net' level 1 keyword 'TAG' limit 3. Plus Verify queryLogs source 'net' level 1 keyword 'zzz' limit 0. Plus Verify queryLogs source 'net' level 1 keyword 'zzz' limit 1. Plus Verify queryLogs source 'net' level 1 keyword 'zzz' limit 3. Plus Verify queryLogs source 'net' level 2 keyword '' limit 0. Plus Verify queryLogs source 'net' level 2 keyword '' limit 1. Plus Verify queryLogs source 'net' level 2 keyword '' limit 3. Plus Verify queryLogs source 'net' level 2 keyword 'err' limit 0. Plus Verify queryLogs source 'net' level 2 keyword 'err' limit 1. Plus Verify queryLogs source 'net' level 2 keyword 'err' limit 3. Plus Verify queryLogs source 'net' level 2 keyword 'TAG' limit 0. Plus Verify queryLogs source 'net' level 2 keyword 'TAG' limit 1. Plus Verify queryLogs source 'net' level 2 keyword 'TAG' limit 3. Plus Verify queryLogs source 'net' level 2 keyword 'zzz' limit 0. Plus Verify queryLogs source 'net' level 2 keyword 'zzz' limit 1. Plus Verify queryLogs source 'net' level 2 keyword 'zzz' limit 3. Plus Verify queryLogs source 'net' level 3 keyword '' limit 0. Plus Verify queryLogs source 'net' level 3 keyword '' limit 1. Plus Verify queryLogs source 'net' level 3 keyword '' limit 3. Plus Verify queryLogs source 'net' level 3 keyword 'err' limit 0. Plus Verify queryLogs source 'net' level 3 keyword 'err' limit 1. Plus Verify queryLogs source 'net' level 3 keyword 'err' limit 3. Plus Verify queryLogs source 'net' level 3 keyword 'TAG' limit 0. Plus Verify queryLogs source 'net' level 3 keyword 'TAG' limit 1. Plus Verify queryLogs source 'net' level 3 keyword 'TAG' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0111 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.INFO, '', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma|info delta');
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.INFO, 'err', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.INFO, 'err', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.INFO, 'err', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.INFO, 'TAG', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma|info delta');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.INFO, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.INFO, 'TAG', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma|info delta');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.INFO, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.INFO, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.INFO, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.WARN, '', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.WARN, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.WARN, '', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.WARN, 'err', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.WARN, 'err', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.WARN, 'err', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.WARN, 'TAG', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.WARN, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.WARN, 'TAG', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.WARN, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.WARN, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.WARN, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.ERROR, '', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.ERROR, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.ERROR, '', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.ERROR, 'err', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.ERROR, 'err', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.ERROR, 'err', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.ERROR, 'TAG', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.ERROR, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.ERROR, 'TAG', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0111 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_14200
     * @tc.name      testQueryGrid0142
     * @tc.desc      Verify queryLogs source 'net' level 3 keyword 'zzz' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0142 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.ERROR, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0142 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_14300
     * @tc.name      testQueryGrid0143
     * @tc.desc      Verify queryLogs source 'net' level 3 keyword 'zzz' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0143 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.ERROR, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0143 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_14400
     * @tc.name      testQueryGrid0144
     * @tc.desc      Verify queryLogs source 'net' level 3 keyword 'zzz' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0144 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.ERROR, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0144 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_14500
     * @tc.name      testQueryGrid0145
     * @tc.desc      Verify queryLogs source 'db' level 0 keyword '' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0145 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('debug epsilon|warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0145 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_14600
     * @tc.name      testQueryGrid0146
     * @tc.desc      Verify queryLogs source 'db' level 0 keyword '' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0146 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.DEBUG, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('debug epsilon');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0146 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_14700
     * @tc.name      testQueryGrid0147
     * @tc.desc      Verify queryLogs source 'db' level 0 keyword '' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0147 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.DEBUG, '', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('debug epsilon|warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0147 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_14800
     * @tc.name      testQueryGrid0148
     * @tc.desc      Verify queryLogs source 'db' level 0 keyword 'err' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0148 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.DEBUG, 'err', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0148 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_14900
     * @tc.name      testQueryGrid0149
     * @tc.desc      Verify queryLogs source 'db' level 0 keyword 'err' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0149 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.DEBUG, 'err', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0149 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_15000
     * @tc.name      testQueryGrid0150
     * @tc.desc      Verify queryLogs source 'db' level 0 keyword 'err' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0150 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.DEBUG, 'err', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0150 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_15100
     * @tc.name      testQueryGrid0151
     * @tc.desc      Verify queryLogs source 'db' level 0 keyword 'TAG' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0151 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.DEBUG, 'TAG', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('debug epsilon|warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0151 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_15200
     * @tc.name      testQueryGrid0152
     * @tc.desc      Verify queryLogs source 'db' level 0 keyword 'TAG' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0152 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.DEBUG, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('debug epsilon');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0152 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_15300
     * @tc.name      testQueryGrid0153
     * @tc.desc      Verify queryLogs source 'db' level 0 keyword 'TAG' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0153 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.DEBUG, 'TAG', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('debug epsilon|warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0153 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_15400
     * @tc.name      testQueryGrid0154
     * @tc.desc      Verify queryLogs source 'db' level 0 keyword 'zzz' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0154 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.DEBUG, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0154 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_15500
     * @tc.name      testQueryGrid0155
     * @tc.desc      Verify queryLogs source 'db' level 0 keyword 'zzz' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0155 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.DEBUG, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0155 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_15600
     * @tc.name      testQueryGrid0156
     * @tc.desc      Verify queryLogs source 'db' level 0 keyword 'zzz' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0156 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.DEBUG, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0156 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_15700
     * @tc.name      testQueryGrid0157
     * @tc.desc      Verify queryLogs source 'db' level 1 keyword '' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0157 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.INFO, '', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0157 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_15800
     * @tc.name      testQueryGrid0158
     * @tc.desc      Verify queryLogs source 'db' level 1 keyword '' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0158 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.INFO, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0158 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_15900
     * @tc.name      testQueryGrid0159
     * @tc.desc      Verify queryLogs source 'db' level 1 keyword '' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0159 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.INFO, '', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0159 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP4_16000
     * @tc.name      testQueryGrid0160
     * @tc.desc      Verify queryLogs source 'db' level 1 keyword 'err' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0160 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.INFO, 'err', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0160 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_16100
     * @tc.name      testQueryGrid0161
     * @tc.desc      Verify queryLogs source 'db' level 1 keyword 'err' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0161 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.INFO, 'err', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0161 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_16200
     * @tc.name      testQueryGrid0162
     * @tc.desc      Verify queryLogs source 'db' level 1 keyword 'err' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0162 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.INFO, 'err', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0162 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_16300
     * @tc.name      testQueryGrid0163
     * @tc.desc      Verify queryLogs source 'db' level 1 keyword 'TAG' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0163 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.INFO, 'TAG', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0163 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_16400
     * @tc.name      testQueryGrid0164
     * @tc.desc      Verify queryLogs source 'db' level 1 keyword 'TAG' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0164 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.INFO, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0164 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_16500
     * @tc.name      testQueryGrid0165
     * @tc.desc      Verify queryLogs source 'db' level 1 keyword 'TAG' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0165 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.INFO, 'TAG', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0165 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_16600
     * @tc.name      testQueryGrid0166
     * @tc.desc      Verify queryLogs source 'db' level 1 keyword 'zzz' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0166 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.INFO, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0166 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_16700
     * @tc.name      testQueryGrid0167
     * @tc.desc      Verify queryLogs source 'db' level 1 keyword 'zzz' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0167 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.INFO, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0167 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_16800
     * @tc.name      testQueryGrid0168
     * @tc.desc      Verify queryLogs source 'db' level 1 keyword 'zzz' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0168 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.INFO, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0168 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_16900
     * @tc.name      testQueryGrid0169
     * @tc.desc      Verify queryLogs source 'db' level 2 keyword '' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0169 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.WARN, '', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0169 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_17000
     * @tc.name      testQueryGrid0170
     * @tc.desc      Verify queryLogs source 'db' level 2 keyword '' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0170 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.WARN, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0170 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_17100
     * @tc.name      testQueryGrid0171
     * @tc.desc      Verify queryLogs source 'db' level 2 keyword '' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0171 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.WARN, '', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0171 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_17200
     * @tc.name      testQueryGrid0172
     * @tc.desc      Verify queryLogs source 'db' level 2 keyword 'err' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0172 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.WARN, 'err', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0172 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_17300
     * @tc.name      testQueryGrid0173
     * @tc.desc      Verify queryLogs source 'db' level 2 keyword 'err' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0173 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.WARN, 'err', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0173 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_17400
     * @tc.name      testQueryGrid0174
     * @tc.desc      Verify queryLogs source 'db' level 2 keyword 'err' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0174 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.WARN, 'err', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0174 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_17500
     * @tc.name      testQueryGrid0175
     * @tc.desc      Verify queryLogs source 'db' level 2 keyword 'TAG' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0175 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.WARN, 'TAG', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0175 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_17600
     * @tc.name      testQueryGrid0176
     * @tc.desc      Verify queryLogs source 'db' level 2 keyword 'TAG' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0176 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.WARN, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0176 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_17700
     * @tc.name      testQueryGrid0177
     * @tc.desc      Verify queryLogs source 'db' level 2 keyword 'TAG' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0177 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.WARN, 'TAG', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('warning zeta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0177 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_17800
     * @tc.name      testQueryGrid0178
     * @tc.desc      Verify queryLogs source 'db' level 2 keyword 'zzz' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0178 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.WARN, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0178 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_17900
     * @tc.name      testQueryGrid0179
     * @tc.desc      Verify queryLogs source 'db' level 2 keyword 'zzz' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0179 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.WARN, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0179 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_18000
     * @tc.name      testQueryGrid0180
     * @tc.desc      Verify queryLogs source 'db' level 2 keyword 'zzz' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0180 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.WARN, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0180 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_18100
     * @tc.name      testQueryGrid0181
     * @tc.desc      Verify queryLogs source 'db' level 3 keyword '' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0181 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.ERROR, '', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0181 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_18200
     * @tc.name      testQueryGrid0182
     * @tc.desc      Verify queryLogs source 'db' level 3 keyword '' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0182 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.ERROR, '', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0182 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_18300
     * @tc.name      testQueryGrid0183
     * @tc.desc      Verify queryLogs source 'db' level 3 keyword '' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0183 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.ERROR, '', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0183 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_18400
     * @tc.name      testQueryGrid0184
     * @tc.desc      Verify queryLogs source 'db' level 3 keyword 'err' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0184 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.ERROR, 'err', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0184 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_18500
     * @tc.name      testQueryGrid0185
     * @tc.desc      Verify queryLogs source 'db' level 3 keyword 'err' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0185 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.ERROR, 'err', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0185 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_18600
     * @tc.name      testQueryGrid0186
     * @tc.desc      Verify queryLogs source 'db' level 3 keyword 'err' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0186 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.ERROR, 'err', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0186 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_18700
     * @tc.name      testQueryGrid0187
     * @tc.desc      Verify queryLogs source 'db' level 3 keyword 'TAG' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0187 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.ERROR, 'TAG', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0187 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_18800
     * @tc.name      testQueryGrid0188
     * @tc.desc      Verify queryLogs source 'db' level 3 keyword 'TAG' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0188 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.ERROR, 'TAG', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0188 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_18900
     * @tc.name      testQueryGrid0189
     * @tc.desc      Verify queryLogs source 'db' level 3 keyword 'TAG' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0189 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.ERROR, 'TAG', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0189 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_19000
     * @tc.name      testQueryGrid0190
     * @tc.desc      Verify queryLogs source 'db' level 3 keyword 'zzz' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0190 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.ERROR, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0190 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_19100
     * @tc.name      testQueryGrid0191
     * @tc.desc      Verify queryLogs source 'db' level 3 keyword 'zzz' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0191 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.ERROR, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0191 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_19200
     * @tc.name      testQueryGrid0192
     * @tc.desc      Verify queryLogs source 'db' level 3 keyword 'zzz' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0192 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'db', LogLevel.ERROR, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0192 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_19300
     * @tc.name      testTagCountGrid0193
     * @tc.desc      Verify countByTag('uiTag') returns 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCountGrid0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCountGrid0193 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      expect(countByTag(logs, 'uiTag')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCountGrid0193 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_19400
     * @tc.name      testTagCountGrid0194
     * @tc.desc      Verify countByTag('netTag') returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCountGrid0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCountGrid0194 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      expect(countByTag(logs, 'netTag')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCountGrid0194 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_19500
     * @tc.name      testTagCountGrid0195
     * @tc.desc      Verify countByTag('dbTag') returns 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCountGrid0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCountGrid0195 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      expect(countByTag(logs, 'dbTag')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCountGrid0195 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_19600
     * @tc.name      testTagCountGrid0196
     * @tc.desc      Verify countByTag('missing') returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTagCountGrid0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCountGrid0196 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      expect(countByTag(logs, 'missing')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTagCountGrid0196 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_19700
     * @tc.name      testLevelNameGrid0197
     * @tc.desc      Verify logLevelName(0) returns DEBUG.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLevelNameGrid0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelNameGrid0197 begin');
      await delayTick();
      expect(logLevelName(LogLevel.DEBUG)).assertEqual('DEBUG');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelNameGrid0197 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_19800
     * @tc.name      testLevelNameGrid0198
     * @tc.desc      Verify logLevelName(1) returns INFO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLevelNameGrid0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelNameGrid0198 begin');
      await delayTick();
      expect(logLevelName(LogLevel.INFO)).assertEqual('INFO');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelNameGrid0198 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_19900
     * @tc.name      testLevelNameGrid0199
     * @tc.desc      Verify logLevelName(2) returns WARN.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLevelNameGrid0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelNameGrid0199 begin');
      await delayTick();
      expect(logLevelName(LogLevel.WARN)).assertEqual('WARN');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelNameGrid0199 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP5_20000
     * @tc.name      testLevelNameGrid0200
     * @tc.desc      Verify logLevelName(3) returns ERROR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLevelNameGrid0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelNameGrid0200 begin');
      await delayTick();
      expect(logLevelName(LogLevel.ERROR)).assertEqual('ERROR');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelNameGrid0200 end');
    })

  })
}
