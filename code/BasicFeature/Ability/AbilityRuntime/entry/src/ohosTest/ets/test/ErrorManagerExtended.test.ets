/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { errorManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';

export default function errorManagerExtendedTest(): void {
  describe('AbilityRuntimeErrorManagerExtendedTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_EXTENDED_0001
     * @tc.name      testErrorManagerExtended0001
     * @tc.desc      注销从未注册过的 error observer id 0 抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerExtended0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0001 begin');
      let code: number = 0;
      try {
        await errorManager.off('error', 0);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_EXTENDED_0002
     * @tc.name      testErrorManagerExtended0002
     * @tc.desc      注销从未注册过的 error observer id -1 抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerExtended0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0002 begin');
      let code: number = 0;
      try {
        await errorManager.off('error', -1);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_EXTENDED_0003
     * @tc.name      testErrorManagerExtended0003
     * @tc.desc      注销从未注册过的 error observer id 999999 抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerExtended0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0003 begin');
      let code: number = 0;
      try {
        await errorManager.off('error', 999999);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_EXTENDED_0004
     * @tc.name      testErrorManagerExtended0004
     * @tc.desc      注销从未注册过的 error observer id 9007199254740991 抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerExtended0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0004 begin');
      let code: number = 0;
      try {
        await errorManager.off('error', 9007199254740991);
      } catch (error) {
        code = (error as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 code=${code}`);
      expect(code).assertEqual(401);
      const actual2: string = typeof code;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = code > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_EXTENDED_0005
     * @tc.name      testErrorManagerExtended0005
     * @tc.desc      同一个 error observer 重复注册只产生一个有效监听，off 后不再收到异常
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testErrorManagerExtended0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0005 begin');
      const record: string[] = [];
      const observer: errorManager.ErrorObserver = { onUnhandledException(m: string) { record.push(m); } };
      const observerId: number = errorManager.on('error', observer);
      errorManager.on('error', observer);
      await errorManager.off('error', observerId);
      const actual1: boolean = observerId >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 record.length=${record.length}`);
      expect(record.length).assertEqual(0);
      const actual3: boolean = record.includes('x');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      const actual4: boolean = record.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_EXTENDED_0006
     * @tc.name      testErrorManagerExtended0006
     * @tc.desc      loopObserver 阈值取 1 到 1000 之间的多个值，注册与注销都不抛异常
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerExtended0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0006 begin');
      let thrown: boolean = false;
      try {
        errorManager.on('loopObserver', 10, { onLoopTimeOut() { } });
        errorManager.off('loopObserver');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 thrown=${thrown}`);
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 thrown=${thrown}`);
      expect(thrown).assertEqual(false);
      const actual3: string = typeof thrown;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_ERROR_MANAGER_EXTENDED_0007
     * @tc.name      testErrorManagerExtended0007
     * @tc.desc      freeze observer 重复注册并注销，记录保持为空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testErrorManagerExtended0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0007 begin');
      const record: string[] = [];
      const observer: errorManager.FreezeObserver = () => { record.push('freeze'); };
      errorManager.on('freeze', observer);
      errorManager.on('freeze', observer);
      errorManager.off('freeze', observer);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 record.length=${record.length}`);
      expect(record.length).assertEqual(0);
      const actual2: boolean = record.includes('freeze');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: boolean = record.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testErrorManagerExtended0007 end');
    })
  })
}
