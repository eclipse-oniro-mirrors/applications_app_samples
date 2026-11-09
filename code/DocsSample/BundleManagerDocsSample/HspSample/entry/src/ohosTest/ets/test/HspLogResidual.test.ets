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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Log, add, minus, nativeMulti } from 'library';

export default function hspLogResidualTest(): void {
  describe('HspLogResidualTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LOG_RESIDUAL_0100
     * @tc.name      testHspLogResidual0001
     * @tc.desc      Verify Log.info accepts an empty message.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLogResidual0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          Log.info('');
          expect(true).assertTrue();
          expect(typeof Log.info).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LOG_RESIDUAL_0200
     * @tc.name      testHspLogResidual0002
     * @tc.desc      Verify Log.info accepts Unicode and newline characters.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLogResidual0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          Log.info('中文日志\n第二行');
          expect(true).assertTrue();
          expect('中文日志'.length).assertEqual(4);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LOG_RESIDUAL_0300
     * @tc.name      testHspLogResidual0003
     * @tc.desc      Verify Log.info accepts a long message.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLogResidual0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          Log.info('a'.repeat(1024));
          expect('a'.repeat(1024).length).assertEqual(1024);
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LOG_RESIDUAL_0400
     * @tc.name      testHspLogResidual0004
     * @tc.desc      Verify Log.info accepts quotes and backslashes.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLogResidual0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          Log.info('\"quoted\" \\ path');
          expect(true).assertTrue();
          expect(typeof Log.info).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LOG_RESIDUAL_0500
     * @tc.name      testHspLogResidual0005
     * @tc.desc      Verify repeated Log.info calls stay stable.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLogResidual0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          for (let i = 0; i < 10; i++) {
            Log.info('repeat ' + i);
          }
          expect(true).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LOG_RESIDUAL_0600
     * @tc.name      testHspLogResidual0006
     * @tc.desc      Verify the exported HSP functions are callable values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLogResidual0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(typeof add).assertEqual('function');
          expect(typeof minus).assertEqual('function');
          expect(typeof nativeMulti).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
