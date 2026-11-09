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

export default function arithmeticExtraTest(): void {
  describe('HspArithmeticExtraTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_0100
     * @tc.name      testHspArithmeticExtra0001
     * @tc.desc      Verify extra add(0, 1) returns 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(0, 1);
          expect(result).assertEqual(1);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_0200
     * @tc.name      testHspArithmeticExtra0002
     * @tc.desc      Verify extra add(0, -1) returns -1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(0, -1);
          expect(result).assertEqual(-1);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_0300
     * @tc.name      testHspArithmeticExtra0003
     * @tc.desc      Verify extra add(1, 0) returns 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1, 0);
          expect(result).assertEqual(1);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_0400
     * @tc.name      testHspArithmeticExtra0004
     * @tc.desc      Verify extra add(-1, 0) returns -1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-1, 0);
          expect(result).assertEqual(-1);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_0500
     * @tc.name      testHspArithmeticExtra0005
     * @tc.desc      Verify extra add(2, -2) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(2, -2);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_0600
     * @tc.name      testHspArithmeticExtra0006
     * @tc.desc      Verify extra add(-2, 2) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-2, 2);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_0700
     * @tc.name      testHspArithmeticExtra0007
     * @tc.desc      Verify extra add(10, -10) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(10, -10);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_0800
     * @tc.name      testHspArithmeticExtra0008
     * @tc.desc      Verify extra add(-10, 10) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-10, 10);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_0900
     * @tc.name      testHspArithmeticExtra0009
     * @tc.desc      Verify extra add(100, -50) returns 50.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(100, -50);
          expect(result).assertEqual(50);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_1000
     * @tc.name      testHspArithmeticExtra0010
     * @tc.desc      Verify extra add(-100, 50) returns -50.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-100, 50);
          expect(result).assertEqual(-50);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_1100
     * @tc.name      testHspArithmeticExtra0011
     * @tc.desc      Verify extra add(7, -7) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(7, -7);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_1200
     * @tc.name      testHspArithmeticExtra0012
     * @tc.desc      Verify extra add(-7, 7) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-7, 7);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_1300
     * @tc.name      testHspArithmeticExtra0013
     * @tc.desc      Verify extra add(1000, -1) returns 999.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1000, -1);
          expect(result).assertEqual(999);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_1400
     * @tc.name      testHspArithmeticExtra0014
     * @tc.desc      Verify extra add(-1000, 1) returns -999.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-1000, 1);
          expect(result).assertEqual(-999);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_1500
     * @tc.name      testHspArithmeticExtra0015
     * @tc.desc      Verify extra add(999, 1) returns 1000.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(999, 1);
          expect(result).assertEqual(1000);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_1600
     * @tc.name      testHspArithmeticExtra0016
     * @tc.desc      Verify extra add(-999, -1) returns -1000.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-999, -1);
          expect(result).assertEqual(-1000);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_1700
     * @tc.name      testHspArithmeticExtra0017
     * @tc.desc      Verify extra add(50, 50) returns 100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(50, 50);
          expect(result).assertEqual(100);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_1800
     * @tc.name      testHspArithmeticExtra0018
     * @tc.desc      Verify extra add(50, -50) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(50, -50);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_1900
     * @tc.name      testHspArithmeticExtra0019
     * @tc.desc      Verify extra add(1234, 5678) returns 6912.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1234, 5678);
          expect(result).assertEqual(6912);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_2000
     * @tc.name      testHspArithmeticExtra0020
     * @tc.desc      Verify extra add(-1234, 5678) returns 4444.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-1234, 5678);
          expect(result).assertEqual(4444);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_2100
     * @tc.name      testHspArithmeticExtra0021
     * @tc.desc      Verify extra minus(0, 1) returns -1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(0, 1);
          expect(result).assertEqual(-1);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_2200
     * @tc.name      testHspArithmeticExtra0022
     * @tc.desc      Verify extra minus(0, -1) returns 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(0, -1);
          expect(result).assertEqual(1);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_2300
     * @tc.name      testHspArithmeticExtra0023
     * @tc.desc      Verify extra minus(1, 0) returns 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(1, 0);
          expect(result).assertEqual(1);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_2400
     * @tc.name      testHspArithmeticExtra0024
     * @tc.desc      Verify extra minus(-1, 0) returns -1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-1, 0);
          expect(result).assertEqual(-1);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_2500
     * @tc.name      testHspArithmeticExtra0025
     * @tc.desc      Verify extra minus(2, -2) returns 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(2, -2);
          expect(result).assertEqual(4);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_2600
     * @tc.name      testHspArithmeticExtra0026
     * @tc.desc      Verify extra minus(-2, 2) returns -4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-2, 2);
          expect(result).assertEqual(-4);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_2700
     * @tc.name      testHspArithmeticExtra0027
     * @tc.desc      Verify extra minus(10, -10) returns 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(10, -10);
          expect(result).assertEqual(20);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_2800
     * @tc.name      testHspArithmeticExtra0028
     * @tc.desc      Verify extra minus(-10, 10) returns -20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-10, 10);
          expect(result).assertEqual(-20);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_2900
     * @tc.name      testHspArithmeticExtra0029
     * @tc.desc      Verify extra minus(100, -50) returns 150.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(100, -50);
          expect(result).assertEqual(150);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_3000
     * @tc.name      testHspArithmeticExtra0030
     * @tc.desc      Verify extra minus(-100, 50) returns -150.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-100, 50);
          expect(result).assertEqual(-150);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_3100
     * @tc.name      testHspArithmeticExtra0031
     * @tc.desc      Verify extra minus(7, -7) returns 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(7, -7);
          expect(result).assertEqual(14);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_3200
     * @tc.name      testHspArithmeticExtra0032
     * @tc.desc      Verify extra minus(-7, 7) returns -14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-7, 7);
          expect(result).assertEqual(-14);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_3300
     * @tc.name      testHspArithmeticExtra0033
     * @tc.desc      Verify extra minus(1000, -1) returns 1001.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(1000, -1);
          expect(result).assertEqual(1001);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_3400
     * @tc.name      testHspArithmeticExtra0034
     * @tc.desc      Verify extra minus(-1000, 1) returns -1001.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-1000, 1);
          expect(result).assertEqual(-1001);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_3500
     * @tc.name      testHspArithmeticExtra0035
     * @tc.desc      Verify extra minus(999, 1) returns 998.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(999, 1);
          expect(result).assertEqual(998);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_3600
     * @tc.name      testHspArithmeticExtra0036
     * @tc.desc      Verify extra minus(-999, -1) returns -998.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-999, -1);
          expect(result).assertEqual(-998);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_3700
     * @tc.name      testHspArithmeticExtra0037
     * @tc.desc      Verify extra minus(50, 50) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(50, 50);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_3800
     * @tc.name      testHspArithmeticExtra0038
     * @tc.desc      Verify extra minus(50, -50) returns 100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(50, -50);
          expect(result).assertEqual(100);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_3900
     * @tc.name      testHspArithmeticExtra0039
     * @tc.desc      Verify extra minus(1234, 5678) returns -4444.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(1234, 5678);
          expect(result).assertEqual(-4444);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA_4000
     * @tc.name      testHspArithmeticExtra0040
     * @tc.desc      Verify extra minus(-1234, 5678) returns -6912.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-1234, 5678);
          expect(result).assertEqual(-6912);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
