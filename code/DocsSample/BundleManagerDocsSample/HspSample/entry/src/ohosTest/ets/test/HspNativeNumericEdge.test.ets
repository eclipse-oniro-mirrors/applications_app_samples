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
import { nativeMulti } from 'library';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

export default function hspNativeNumericEdgeTest(): void {
  describe('HspNativeNumericEdgeTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_NUMERIC_0100
     * @tc.name      testHspNativeNumeric0001
     * @tc.desc      Verify the native method accepts a fractional factor and returns a whole result.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeNumeric0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspNativeNumeric0001');
        try {
          const result: number = nativeMulti(0.5, 4);
          expect(result).assertEqual(2);
          expect(Number.isInteger(result)).assertTrue();
          expect(result > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_NUMERIC_0200
     * @tc.name      testHspNativeNumeric0002
     * @tc.desc      Verify the native method preserves the sign of a negative fractional input.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeNumeric0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspNativeNumeric0002');
        try {
          const result: number = nativeMulti(-1.5, 2);
          expect(result).assertEqual(-3);
          expect(result < 0).assertTrue();
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_NUMERIC_0300
     * @tc.name      testHspNativeNumeric0003
     * @tc.desc      Verify the native method keeps double precision for decimal factors.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeNumeric0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspNativeNumeric0003');
        try {
          const result: number = nativeMulti(0.1, 0.2);
          expect(Math.abs(result - 0.02) < 1e-12).assertTrue();
          expect(Number.isFinite(result)).assertTrue();
          expect(result > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_NUMERIC_0400
     * @tc.name      testHspNativeNumeric0004
     * @tc.desc      Verify the native method handles the largest safe integer exactly.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeNumeric0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspNativeNumeric0004');
        try {
          const result: number = nativeMulti(Number.MAX_SAFE_INTEGER, 1);
          expect(result).assertEqual(9007199254740991);
          expect(result === Number.MAX_SAFE_INTEGER).assertTrue();
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_NUMERIC_0500
     * @tc.name      testHspNativeNumeric0005
     * @tc.desc      Verify a positive infinite input produces positive infinity.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeNumeric0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspNativeNumeric0005');
        try {
          const result: number = nativeMulti(Infinity, 2);
          expect(result).assertEqual(Infinity);
          expect(Number.isFinite(result)).assertFalse();
          expect(result > Number.MAX_VALUE).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_NUMERIC_0600
     * @tc.name      testHspNativeNumeric0006
     * @tc.desc      Verify a negative infinite input produces negative infinity.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeNumeric0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspNativeNumeric0006');
        try {
          const result: number = nativeMulti(-Infinity, 3);
          expect(result).assertEqual(-Infinity);
          expect(Number.isFinite(result)).assertFalse();
          expect(result < -Number.MAX_VALUE).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_NUMERIC_0700
     * @tc.name      testHspNativeNumeric0007
     * @tc.desc      Verify a not-a-number input stays not-a-number after the native call.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeNumeric0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspNativeNumeric0007');
        try {
          const result: number = nativeMulti(NaN, 5);
          expect(Number.isNaN(result)).assertTrue();
          expect(result === result).assertFalse();
          expect(Number.isFinite(result)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_NUMERIC_0800
     * @tc.name      testHspNativeNumeric0008
     * @tc.desc      Verify the native method reports infinity when a finite product overflows.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeNumeric0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspNativeNumeric0008');
        try {
          const result: number = nativeMulti(1e308, 10);
          expect(result).assertEqual(Infinity);
          expect(result).assertEqual(Number.POSITIVE_INFINITY);
          expect(Number.isFinite(result)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
