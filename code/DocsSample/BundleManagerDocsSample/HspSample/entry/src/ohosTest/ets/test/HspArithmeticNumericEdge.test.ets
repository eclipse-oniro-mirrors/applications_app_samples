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
import { add, minus } from 'library';

export default function hspArithmeticNumericEdgeTest(): void {
  describe('HspArithmeticNumericEdgeTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_NUMERIC_0100
     * @tc.name      testHspArithmeticNumeric0001
     * @tc.desc      Verify addition keeps the binary floating-point result of decimal inputs.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticNumeric0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(0.1, 0.2);
          expect(Math.abs(result - 0.3) < 1e-12).assertTrue();
          expect(result > 0.3).assertTrue();
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_NUMERIC_0200
     * @tc.name      testHspArithmeticNumeric0002
     * @tc.desc      Verify subtraction of decimal inputs stays within floating-point tolerance.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticNumeric0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(0.3, 0.1);
          expect(Math.abs(result - 0.2) < 1e-12).assertTrue();
          expect(result < 0.2).assertTrue();
          expect(result > 0.19).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_NUMERIC_0300
     * @tc.name      testHspArithmeticNumeric0003
     * @tc.desc      Verify addition beyond the safe integer range rounds to the next representable value.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticNumeric0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(Number.MAX_SAFE_INTEGER, 1);
          expect(result).assertEqual(9007199254740992);
          expect(result === Number.MAX_SAFE_INTEGER).assertFalse();
          expect(result > Number.MAX_SAFE_INTEGER).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_NUMERIC_0400
     * @tc.name      testHspArithmeticNumeric0004
     * @tc.desc      Verify adding a finite value to positive infinity remains infinite.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticNumeric0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(Infinity, 1);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_NUMERIC_0500
     * @tc.name      testHspArithmeticNumeric0005
     * @tc.desc      Verify adding opposite infinities produces not-a-number.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticNumeric0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(Infinity, -Infinity);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_NUMERIC_0600
     * @tc.name      testHspArithmeticNumeric0006
     * @tc.desc      Verify adding the largest finite value to itself overflows to infinity.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticNumeric0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(Number.MAX_VALUE, Number.MAX_VALUE);
          expect(result).assertEqual(Infinity);
          expect(result > Number.MAX_VALUE).assertTrue();
          expect(Number.isFinite(result)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_NUMERIC_0700
     * @tc.name      testHspArithmeticNumeric0007
     * @tc.desc      Verify subtracting the largest finite value from its negation overflows negatively.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticNumeric0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-Number.MAX_VALUE, Number.MAX_VALUE);
          expect(result).assertEqual(-Infinity);
          expect(result < -Number.MAX_VALUE).assertTrue();
          expect(Number.isFinite(result)).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_NUMERIC_0800
     * @tc.name      testHspArithmeticNumeric0008
     * @tc.desc      Verify adding negative zero to positive zero yields positive zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticNumeric0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const negativeZero: number = -0;
          const result: number = add(negativeZero, 0);
          expect(result).assertEqual(0);
          expect(1 / result).assertEqual(Infinity);
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
