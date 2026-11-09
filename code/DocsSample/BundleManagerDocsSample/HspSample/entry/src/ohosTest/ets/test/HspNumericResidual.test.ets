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
import { add, minus, nativeMulti } from 'library';

export default function hspNumericResidualTest(): void {
  describe('HspNumericResidualTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NUMERIC_RESIDUAL_0100
     * @tc.name      testHspNumericResidual0001
     * @tc.desc      Verify add propagates NaN from the first operand.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNumericResidual0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(NaN, 1);
          expect(Number.isNaN(result)).assertTrue();
          expect(Number.isFinite(result)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NUMERIC_RESIDUAL_0200
     * @tc.name      testHspNumericResidual0002
     * @tc.desc      Verify subtract of equal infinities produces NaN.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNumericResidual0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(Infinity, Infinity);
          expect(Number.isNaN(result)).assertTrue();
          expect(Number.isFinite(result)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NUMERIC_RESIDUAL_0300
     * @tc.name      testHspNumericResidual0003
     * @tc.desc      Verify native multiplication preserves the negative zero sign.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNumericResidual0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-0, 5);
          expect(1 / result).assertEqual(-Infinity);
          expect(result === 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NUMERIC_RESIDUAL_0400
     * @tc.name      testHspNumericResidual0004
     * @tc.desc      Verify native multiplication underflows the smallest positive value.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNumericResidual0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(Number.MIN_VALUE, 0.5);
          expect(result).assertEqual(0);
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NUMERIC_RESIDUAL_0500
     * @tc.name      testHspNumericResidual0005
     * @tc.desc      Verify native multiplication overflows to positive infinity.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNumericResidual0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(Number.MAX_VALUE, 2);
          expect(result).assertEqual(Infinity);
          expect(Number.isFinite(result)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NUMERIC_RESIDUAL_0600
     * @tc.name      testHspNumericResidual0006
     * @tc.desc      Verify add below the minimum safe integer loses exactness.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNumericResidual0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(Number.MIN_SAFE_INTEGER, -1);
          expect(result < Number.MIN_SAFE_INTEGER).assertTrue();
          expect(Number.isSafeInteger(result)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NUMERIC_RESIDUAL_0700
     * @tc.name      testHspNumericResidual0007
     * @tc.desc      Verify subtract below the minimum safe integer loses exactness.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNumericResidual0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(Number.MIN_SAFE_INTEGER, 1);
          expect(result < Number.MIN_SAFE_INTEGER).assertTrue();
          expect(Number.isSafeInteger(result)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NUMERIC_RESIDUAL_0800
     * @tc.name      testHspNumericResidual0008
     * @tc.desc      Verify adding negative zero to positive zero keeps positive zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNumericResidual0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-0, 0);
          expect(1 / result).assertEqual(Infinity);
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NUMERIC_RESIDUAL_0900
     * @tc.name      testHspNumericResidual0009
     * @tc.desc      Verify subtracting positive zero from negative zero keeps negative zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNumericResidual0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-0, 0);
          expect(1 / result).assertEqual(-Infinity);
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NUMERIC_RESIDUAL_1000
     * @tc.name      testHspNumericResidual0010
     * @tc.desc      Verify native multiplication by zero keeps NaN input as NaN.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNumericResidual0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(NaN, 0);
          expect(Number.isNaN(result)).assertTrue();
          expect(Number.isFinite(result)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
