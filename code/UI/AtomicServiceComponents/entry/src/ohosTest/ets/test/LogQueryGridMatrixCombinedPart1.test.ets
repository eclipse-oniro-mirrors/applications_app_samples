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

export default function LogQueryGridMatrixCombinedPart1Test(): void {
  describe('LogQry1', () => {
    /**
     * @tc.number    SUB_ATOMIC_LQGP1_0100
     * @tc.name      testQueryGrid0001
     * @tc.desc      Verify queryLogs source '' level 0 keyword '' limit 0. Plus Verify queryLogs source '' level 0 keyword '' limit 1. Plus Verify queryLogs source '' level 0 keyword '' limit 3. Plus Verify queryLogs source '' level 0 keyword 'err' limit 0. Plus Verify queryLogs source '' level 0 keyword 'err' limit 1. Plus Verify queryLogs source '' level 0 keyword 'err' limit 3. Plus Verify queryLogs source '' level 0 keyword 'TAG' limit 0. Plus Verify queryLogs source '' level 0 keyword 'TAG' limit 1. Plus Verify queryLogs source '' level 0 keyword 'TAG' limit 3. Plus Verify queryLogs source '' level 0 keyword 'zzz' limit 0. Plus Verify queryLogs source '' level 0 keyword 'zzz' limit 1. Plus Verify queryLogs source '' level 0 keyword 'zzz' limit 3. Plus Verify queryLogs source '' level 1 keyword '' limit 0. Plus Verify queryLogs source '' level 1 keyword '' limit 1. Plus Verify queryLogs source '' level 1 keyword '' limit 3. Plus Verify queryLogs source '' level 1 keyword 'err' limit 0. Plus Verify queryLogs source '' level 1 keyword 'err' limit 1. Plus Verify queryLogs source '' level 1 keyword 'err' limit 3. Plus Verify queryLogs source '' level 1 keyword 'TAG' limit 0. Plus Verify queryLogs source '' level 1 keyword 'TAG' limit 1. Plus Verify queryLogs source '' level 1 keyword 'TAG' limit 3. Plus Verify queryLogs source '' level 1 keyword 'zzz' limit 0. Plus Verify queryLogs source '' level 1 keyword 'zzz' limit 1. Plus Verify queryLogs source '' level 1 keyword 'zzz' limit 3. Plus Verify queryLogs source '' level 2 keyword '' limit 0. Plus Verify queryLogs source '' level 2 keyword '' limit 1. Plus Verify queryLogs source '' level 2 keyword '' limit 3. Plus Verify queryLogs source '' level 2 keyword 'err' limit 0. Plus Verify queryLogs source '' level 2 keyword 'err' limit 1. Plus Verify queryLogs source '' level 2 keyword 'err' limit 3. Plus Verify queryLogs source '' level 2 keyword 'TAG' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0001 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(6);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta|error gamma|info delta|debug epsilon|warning zeta');
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, '', 3);
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta|error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'err', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'err', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'err', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'TAG', 0);
      expect(hits.length).assertEqual(6);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta|error gamma|info delta|debug epsilon|warning zeta');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'TAG', 3);
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta|error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.DEBUG, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.INFO, '', 0);
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta|error gamma|info delta|warning zeta');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.INFO, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.INFO, '', 3);
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta|error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.INFO, 'err', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.INFO, 'err', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.INFO, 'err', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.INFO, 'TAG', 0);
      expect(hits.length).assertEqual(5);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta|error gamma|info delta|warning zeta');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.INFO, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.INFO, 'TAG', 3);
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta|error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.INFO, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.INFO, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.INFO, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.WARN, '', 0);
      expect(hits.length).assertEqual(4);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta|error gamma|warning zeta');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.WARN, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.WARN, '', 3);
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta|error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.WARN, 'err', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.WARN, 'err', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.WARN, 'err', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|error gamma');
      }
      {
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.WARN, 'TAG', 0);
      expect(hits.length).assertEqual(4);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta|error gamma|warning zeta');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0001 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP1_3200
     * @tc.name      testQueryGrid0032
     * @tc.desc      Verify queryLogs source '' level 2 keyword 'TAG' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0032 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.WARN, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0032 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP1_3300
     * @tc.name      testQueryGrid0033
     * @tc.desc      Verify queryLogs source '' level 2 keyword 'TAG' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0033 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.WARN, 'TAG', 3);
      expect(hits.length).assertEqual(3);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta|error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0033 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP1_3400
     * @tc.name      testQueryGrid0034
     * @tc.desc      Verify queryLogs source '' level 2 keyword 'zzz' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0034 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.WARN, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0034 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP1_3500
     * @tc.name      testQueryGrid0035
     * @tc.desc      Verify queryLogs source '' level 2 keyword 'zzz' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0035 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.WARN, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0035 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP1_3600
     * @tc.name      testQueryGrid0036
     * @tc.desc      Verify queryLogs source '' level 2 keyword 'zzz' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0036 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.WARN, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0036 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP1_3700
     * @tc.name      testQueryGrid0037
     * @tc.desc      Verify queryLogs source '' level 3 keyword '' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0037 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, '', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0037 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP1_3800
     * @tc.name      testQueryGrid0038
     * @tc.desc      Verify queryLogs source '' level 3 keyword '' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0038 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0038 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP1_3900
     * @tc.name      testQueryGrid0039
     * @tc.desc      Verify queryLogs source '' level 3 keyword '' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0039 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, '', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0039 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP1_4000
     * @tc.name      testQueryGrid0040
     * @tc.desc      Verify queryLogs source '' level 3 keyword 'err' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0040 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, 'err', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0040 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_4100
     * @tc.name      testQueryGrid0041
     * @tc.desc      Verify queryLogs source '' level 3 keyword 'err' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0041 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, 'err', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0041 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_4200
     * @tc.name      testQueryGrid0042
     * @tc.desc      Verify queryLogs source '' level 3 keyword 'err' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0042 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, 'err', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0042 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_4300
     * @tc.name      testQueryGrid0043
     * @tc.desc      Verify queryLogs source '' level 3 keyword 'TAG' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0043 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, 'TAG', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0043 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_4400
     * @tc.name      testQueryGrid0044
     * @tc.desc      Verify queryLogs source '' level 3 keyword 'TAG' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0044 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0044 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_4500
     * @tc.name      testQueryGrid0045
     * @tc.desc      Verify queryLogs source '' level 3 keyword 'TAG' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0045 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, 'TAG', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0045 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_4600
     * @tc.name      testQueryGrid0046
     * @tc.desc      Verify queryLogs source '' level 3 keyword 'zzz' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0046 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0046 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_4700
     * @tc.name      testQueryGrid0047
     * @tc.desc      Verify queryLogs source '' level 3 keyword 'zzz' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0047 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0047 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_4800
     * @tc.name      testQueryGrid0048
     * @tc.desc      Verify queryLogs source '' level 3 keyword 'zzz' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0048 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, '', LogLevel.ERROR, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0048 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_4900
     * @tc.name      testQueryGrid0049
     * @tc.desc      Verify queryLogs source 'ui' level 0 keyword '' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0049 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0049 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_5000
     * @tc.name      testQueryGrid0050
     * @tc.desc      Verify queryLogs source 'ui' level 0 keyword '' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0050 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.DEBUG, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0050 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_5100
     * @tc.name      testQueryGrid0051
     * @tc.desc      Verify queryLogs source 'ui' level 0 keyword '' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0051 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.DEBUG, '', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0051 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_5200
     * @tc.name      testQueryGrid0052
     * @tc.desc      Verify queryLogs source 'ui' level 0 keyword 'err' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0052 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.DEBUG, 'err', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0052 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_5300
     * @tc.name      testQueryGrid0053
     * @tc.desc      Verify queryLogs source 'ui' level 0 keyword 'err' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0053 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.DEBUG, 'err', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0053 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_5400
     * @tc.name      testQueryGrid0054
     * @tc.desc      Verify queryLogs source 'ui' level 0 keyword 'err' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0054 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.DEBUG, 'err', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0054 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_5500
     * @tc.name      testQueryGrid0055
     * @tc.desc      Verify queryLogs source 'ui' level 0 keyword 'TAG' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0055 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.DEBUG, 'TAG', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0055 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_5600
     * @tc.name      testQueryGrid0056
     * @tc.desc      Verify queryLogs source 'ui' level 0 keyword 'TAG' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0056 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.DEBUG, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0056 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_5700
     * @tc.name      testQueryGrid0057
     * @tc.desc      Verify queryLogs source 'ui' level 0 keyword 'TAG' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0057 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.DEBUG, 'TAG', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0057 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_5800
     * @tc.name      testQueryGrid0058
     * @tc.desc      Verify queryLogs source 'ui' level 0 keyword 'zzz' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0058 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.DEBUG, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0058 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_5900
     * @tc.name      testQueryGrid0059
     * @tc.desc      Verify queryLogs source 'ui' level 0 keyword 'zzz' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0059 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.DEBUG, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0059 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_6000
     * @tc.name      testQueryGrid0060
     * @tc.desc      Verify queryLogs source 'ui' level 0 keyword 'zzz' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0060 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.DEBUG, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0060 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_6100
     * @tc.name      testQueryGrid0061
     * @tc.desc      Verify queryLogs source 'ui' level 1 keyword '' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0061 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.INFO, '', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0061 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_6200
     * @tc.name      testQueryGrid0062
     * @tc.desc      Verify queryLogs source 'ui' level 1 keyword '' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0062 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.INFO, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0062 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_6300
     * @tc.name      testQueryGrid0063
     * @tc.desc      Verify queryLogs source 'ui' level 1 keyword '' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0063 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.INFO, '', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0063 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_6400
     * @tc.name      testQueryGrid0064
     * @tc.desc      Verify queryLogs source 'ui' level 1 keyword 'err' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0064 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.INFO, 'err', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0064 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_6500
     * @tc.name      testQueryGrid0065
     * @tc.desc      Verify queryLogs source 'ui' level 1 keyword 'err' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0065 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.INFO, 'err', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0065 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_6600
     * @tc.name      testQueryGrid0066
     * @tc.desc      Verify queryLogs source 'ui' level 1 keyword 'err' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0066 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.INFO, 'err', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0066 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_6700
     * @tc.name      testQueryGrid0067
     * @tc.desc      Verify queryLogs source 'ui' level 1 keyword 'TAG' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0067 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.INFO, 'TAG', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0067 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_6800
     * @tc.name      testQueryGrid0068
     * @tc.desc      Verify queryLogs source 'ui' level 1 keyword 'TAG' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0068 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.INFO, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0068 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_6900
     * @tc.name      testQueryGrid0069
     * @tc.desc      Verify queryLogs source 'ui' level 1 keyword 'TAG' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0069 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.INFO, 'TAG', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0069 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_7000
     * @tc.name      testQueryGrid0070
     * @tc.desc      Verify queryLogs source 'ui' level 1 keyword 'zzz' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0070 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.INFO, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0070 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_7100
     * @tc.name      testQueryGrid0071
     * @tc.desc      Verify queryLogs source 'ui' level 1 keyword 'zzz' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0071 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.INFO, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0071 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_7200
     * @tc.name      testQueryGrid0072
     * @tc.desc      Verify queryLogs source 'ui' level 1 keyword 'zzz' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0072 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.INFO, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0072 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_7300
     * @tc.name      testQueryGrid0073
     * @tc.desc      Verify queryLogs source 'ui' level 2 keyword '' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0073 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.WARN, '', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0073 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_7400
     * @tc.name      testQueryGrid0074
     * @tc.desc      Verify queryLogs source 'ui' level 2 keyword '' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0074 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.WARN, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0074 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_7500
     * @tc.name      testQueryGrid0075
     * @tc.desc      Verify queryLogs source 'ui' level 2 keyword '' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0075 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.WARN, '', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0075 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_7600
     * @tc.name      testQueryGrid0076
     * @tc.desc      Verify queryLogs source 'ui' level 2 keyword 'err' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0076 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.WARN, 'err', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0076 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_7700
     * @tc.name      testQueryGrid0077
     * @tc.desc      Verify queryLogs source 'ui' level 2 keyword 'err' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0077 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.WARN, 'err', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0077 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_7800
     * @tc.name      testQueryGrid0078
     * @tc.desc      Verify queryLogs source 'ui' level 2 keyword 'err' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0078 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.WARN, 'err', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0078 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_7900
     * @tc.name      testQueryGrid0079
     * @tc.desc      Verify queryLogs source 'ui' level 2 keyword 'TAG' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0079 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.WARN, 'TAG', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0079 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP2_8000
     * @tc.name      testQueryGrid0080
     * @tc.desc      Verify queryLogs source 'ui' level 2 keyword 'TAG' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0080 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.WARN, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0080 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_8100
     * @tc.name      testQueryGrid0081
     * @tc.desc      Verify queryLogs source 'ui' level 2 keyword 'TAG' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0081 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.WARN, 'TAG', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha|warning beta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0081 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_8200
     * @tc.name      testQueryGrid0082
     * @tc.desc      Verify queryLogs source 'ui' level 2 keyword 'zzz' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0082 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.WARN, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0082 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_8300
     * @tc.name      testQueryGrid0083
     * @tc.desc      Verify queryLogs source 'ui' level 2 keyword 'zzz' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0083 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.WARN, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0083 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_8400
     * @tc.name      testQueryGrid0084
     * @tc.desc      Verify queryLogs source 'ui' level 2 keyword 'zzz' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0084 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.WARN, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0084 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_8500
     * @tc.name      testQueryGrid0085
     * @tc.desc      Verify queryLogs source 'ui' level 3 keyword '' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0085 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.ERROR, '', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0085 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_8600
     * @tc.name      testQueryGrid0086
     * @tc.desc      Verify queryLogs source 'ui' level 3 keyword '' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0086 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.ERROR, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0086 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_8700
     * @tc.name      testQueryGrid0087
     * @tc.desc      Verify queryLogs source 'ui' level 3 keyword '' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0087 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.ERROR, '', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0087 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_8800
     * @tc.name      testQueryGrid0088
     * @tc.desc      Verify queryLogs source 'ui' level 3 keyword 'err' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0088 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.ERROR, 'err', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0088 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_8900
     * @tc.name      testQueryGrid0089
     * @tc.desc      Verify queryLogs source 'ui' level 3 keyword 'err' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0089 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.ERROR, 'err', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0089 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_9000
     * @tc.name      testQueryGrid0090
     * @tc.desc      Verify queryLogs source 'ui' level 3 keyword 'err' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0090 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.ERROR, 'err', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0090 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_9100
     * @tc.name      testQueryGrid0091
     * @tc.desc      Verify queryLogs source 'ui' level 3 keyword 'TAG' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0091 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.ERROR, 'TAG', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0091 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_9200
     * @tc.name      testQueryGrid0092
     * @tc.desc      Verify queryLogs source 'ui' level 3 keyword 'TAG' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0092 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.ERROR, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0092 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_9300
     * @tc.name      testQueryGrid0093
     * @tc.desc      Verify queryLogs source 'ui' level 3 keyword 'TAG' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0093 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.ERROR, 'TAG', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0093 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_9400
     * @tc.name      testQueryGrid0094
     * @tc.desc      Verify queryLogs source 'ui' level 3 keyword 'zzz' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0094 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.ERROR, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0094 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_9500
     * @tc.name      testQueryGrid0095
     * @tc.desc      Verify queryLogs source 'ui' level 3 keyword 'zzz' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0095 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.ERROR, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0095 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_9600
     * @tc.name      testQueryGrid0096
     * @tc.desc      Verify queryLogs source 'ui' level 3 keyword 'zzz' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0096 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'ui', LogLevel.ERROR, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0096 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_9700
     * @tc.name      testQueryGrid0097
     * @tc.desc      Verify queryLogs source 'net' level 0 keyword '' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0097 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.DEBUG, '', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma|info delta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0097 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_9800
     * @tc.name      testQueryGrid0098
     * @tc.desc      Verify queryLogs source 'net' level 0 keyword '' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0098 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.DEBUG, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0098 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_9900
     * @tc.name      testQueryGrid0099
     * @tc.desc      Verify queryLogs source 'net' level 0 keyword '' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0099 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.DEBUG, '', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma|info delta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0099 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_10000
     * @tc.name      testQueryGrid0100
     * @tc.desc      Verify queryLogs source 'net' level 0 keyword 'err' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0100 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.DEBUG, 'err', 0);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0100 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_10100
     * @tc.name      testQueryGrid0101
     * @tc.desc      Verify queryLogs source 'net' level 0 keyword 'err' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0101 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.DEBUG, 'err', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0101 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_10200
     * @tc.name      testQueryGrid0102
     * @tc.desc      Verify queryLogs source 'net' level 0 keyword 'err' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0102 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.DEBUG, 'err', 3);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0102 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_10300
     * @tc.name      testQueryGrid0103
     * @tc.desc      Verify queryLogs source 'net' level 0 keyword 'TAG' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0103 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.DEBUG, 'TAG', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma|info delta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0103 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_10400
     * @tc.name      testQueryGrid0104
     * @tc.desc      Verify queryLogs source 'net' level 0 keyword 'TAG' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0104 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.DEBUG, 'TAG', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0104 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_10500
     * @tc.name      testQueryGrid0105
     * @tc.desc      Verify queryLogs source 'net' level 0 keyword 'TAG' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0105 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.DEBUG, 'TAG', 3);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma|info delta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0105 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_10600
     * @tc.name      testQueryGrid0106
     * @tc.desc      Verify queryLogs source 'net' level 0 keyword 'zzz' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0106 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.DEBUG, 'zzz', 0);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0106 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_10700
     * @tc.name      testQueryGrid0107
     * @tc.desc      Verify queryLogs source 'net' level 0 keyword 'zzz' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0107 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.DEBUG, 'zzz', 1);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0107 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_10800
     * @tc.name      testQueryGrid0108
     * @tc.desc      Verify queryLogs source 'net' level 0 keyword 'zzz' limit 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0108 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.DEBUG, 'zzz', 3);
      expect(hits.length).assertEqual(0);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0108 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_10900
     * @tc.name      testQueryGrid0109
     * @tc.desc      Verify queryLogs source 'net' level 1 keyword '' limit 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0109 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.INFO, '', 0);
      expect(hits.length).assertEqual(2);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma|info delta');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0109 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_LQGP3_11000
     * @tc.name      testQueryGrid0110
     * @tc.desc      Verify queryLogs source 'net' level 1 keyword '' limit 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testQueryGrid0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0110 begin');
      await delayTick();
      const logs: LogItem[] = buildQueryLogs();
      const hits: LogItem[] = queryLogs(logs, 'net', LogLevel.INFO, '', 1);
      expect(hits.length).assertEqual(1);
      expect(hits.map((item: LogItem) => item.detail).join("|")).assertEqual('error gamma');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testQueryGrid0110 end');
    })

  })
}
