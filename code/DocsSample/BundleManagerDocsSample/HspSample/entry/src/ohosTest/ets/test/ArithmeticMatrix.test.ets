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
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

export default function arithmeticMatrixTest(): void {
  describe('HspArithmeticMatrixTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_0100
     * @tc.name      testHspArithmetic0001
     * @tc.desc      Verify add(0, 0) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0001');
        try {
          const result: number = add(0, 0);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_0200
     * @tc.name      testHspArithmetic0002
     * @tc.desc      Verify add(1, 2) returns 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0002');
        try {
          const result: number = add(1, 2);
          expect(result).assertEqual(3);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_0300
     * @tc.name      testHspArithmetic0003
     * @tc.desc      Verify add(1, -1) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0003');
        try {
          const result: number = add(1, -1);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_0400
     * @tc.name      testHspArithmetic0004
     * @tc.desc      Verify add(-1, 1) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0004');
        try {
          const result: number = add(-1, 1);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_0500
     * @tc.name      testHspArithmetic0005
     * @tc.desc      Verify add(2, 3) returns 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0005');
        try {
          const result: number = add(2, 3);
          expect(result).assertEqual(5);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_0600
     * @tc.name      testHspArithmetic0006
     * @tc.desc      Verify add(3, 4) returns 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0006');
        try {
          const result: number = add(3, 4);
          expect(result).assertEqual(7);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_0700
     * @tc.name      testHspArithmetic0007
     * @tc.desc      Verify add(10, 20) returns 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0007');
        try {
          const result: number = add(10, 20);
          expect(result).assertEqual(30);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_0800
     * @tc.name      testHspArithmetic0008
     * @tc.desc      Verify add(100, 200) returns 300.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0008');
        try {
          const result: number = add(100, 200);
          expect(result).assertEqual(300);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_0900
     * @tc.name      testHspArithmetic0009
     * @tc.desc      Verify add(-2, -3) returns -5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0009');
        try {
          const result: number = add(-2, -3);
          expect(result).assertEqual(-5);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_1000
     * @tc.name      testHspArithmetic0010
     * @tc.desc      Verify add(-10, 5) returns -5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0010');
        try {
          const result: number = add(-10, 5);
          expect(result).assertEqual(-5);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_1100
     * @tc.name      testHspArithmetic0011
     * @tc.desc      Verify add(5, -10) returns -5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0011');
        try {
          const result: number = add(5, -10);
          expect(result).assertEqual(-5);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_1200
     * @tc.name      testHspArithmetic0012
     * @tc.desc      Verify add(0, 9) returns 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0012');
        try {
          const result: number = add(0, 9);
          expect(result).assertEqual(9);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_1300
     * @tc.name      testHspArithmetic0013
     * @tc.desc      Verify add(9, 0) returns 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0013');
        try {
          const result: number = add(9, 0);
          expect(result).assertEqual(9);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_1400
     * @tc.name      testHspArithmetic0014
     * @tc.desc      Verify add(-9, 0) returns -9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0014');
        try {
          const result: number = add(-9, 0);
          expect(result).assertEqual(-9);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_1500
     * @tc.name      testHspArithmetic0015
     * @tc.desc      Verify add(0, -9) returns -9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0015');
        try {
          const result: number = add(0, -9);
          expect(result).assertEqual(-9);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_1600
     * @tc.name      testHspArithmetic0016
     * @tc.desc      Verify add(7, 8) returns 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0016');
        try {
          const result: number = add(7, 8);
          expect(result).assertEqual(15);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_1700
     * @tc.name      testHspArithmetic0017
     * @tc.desc      Verify add(42, 58) returns 100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0017');
        try {
          const result: number = add(42, 58);
          expect(result).assertEqual(100);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_1800
     * @tc.name      testHspArithmetic0018
     * @tc.desc      Verify add(99, 1) returns 100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0018');
        try {
          const result: number = add(99, 1);
          expect(result).assertEqual(100);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_1900
     * @tc.name      testHspArithmetic0019
     * @tc.desc      Verify add(-99, -1) returns -100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0019');
        try {
          const result: number = add(-99, -1);
          expect(result).assertEqual(-100);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_2000
     * @tc.name      testHspArithmetic0020
     * @tc.desc      Verify add(1000, 2000) returns 3000.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0020');
        try {
          const result: number = add(1000, 2000);
          expect(result).assertEqual(3000);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_2100
     * @tc.name      testHspArithmetic0021
     * @tc.desc      Verify add(-1000, 500) returns -500.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0021');
        try {
          const result: number = add(-1000, 500);
          expect(result).assertEqual(-500);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_2200
     * @tc.name      testHspArithmetic0022
     * @tc.desc      Verify add(500, -1000) returns -500.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0022');
        try {
          const result: number = add(500, -1000);
          expect(result).assertEqual(-500);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_2300
     * @tc.name      testHspArithmetic0023
     * @tc.desc      Verify add(123, 456) returns 579.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0023');
        try {
          const result: number = add(123, 456);
          expect(result).assertEqual(579);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_2400
     * @tc.name      testHspArithmetic0024
     * @tc.desc      Verify add(789, 321) returns 1110.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0024');
        try {
          const result: number = add(789, 321);
          expect(result).assertEqual(1110);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_2500
     * @tc.name      testHspArithmetic0025
     * @tc.desc      Verify add(214748, 1) returns 214749.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0025');
        try {
          const result: number = add(214748, 1);
          expect(result).assertEqual(214749);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_2600
     * @tc.name      testHspArithmetic0026
     * @tc.desc      Verify add(1, 214748) returns 214749.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0026');
        try {
          const result: number = add(1, 214748);
          expect(result).assertEqual(214749);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_2700
     * @tc.name      testHspArithmetic0027
     * @tc.desc      Verify add(-214748, 1) returns -214747.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0027');
        try {
          const result: number = add(-214748, 1);
          expect(result).assertEqual(-214747);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_2800
     * @tc.name      testHspArithmetic0028
     * @tc.desc      Verify add(9999, 1) returns 10000.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0028');
        try {
          const result: number = add(9999, 1);
          expect(result).assertEqual(10000);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_2900
     * @tc.name      testHspArithmetic0029
     * @tc.desc      Verify add(1, 9999) returns 10000.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0029');
        try {
          const result: number = add(1, 9999);
          expect(result).assertEqual(10000);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_3000
     * @tc.name      testHspArithmetic0030
     * @tc.desc      Verify add(12345, 6789) returns 19134.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0030');
        try {
          const result: number = add(12345, 6789);
          expect(result).assertEqual(19134);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_3100
     * @tc.name      testHspArithmetic0031
     * @tc.desc      Verify minus(0, 0) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0031');
        try {
          const result: number = minus(0, 0);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_3200
     * @tc.name      testHspArithmetic0032
     * @tc.desc      Verify minus(1, 2) returns -1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0032');
        try {
          const result: number = minus(1, 2);
          expect(result).assertEqual(-1);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_3300
     * @tc.name      testHspArithmetic0033
     * @tc.desc      Verify minus(1, -1) returns 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0033');
        try {
          const result: number = minus(1, -1);
          expect(result).assertEqual(2);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_3400
     * @tc.name      testHspArithmetic0034
     * @tc.desc      Verify minus(-1, 1) returns -2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0034');
        try {
          const result: number = minus(-1, 1);
          expect(result).assertEqual(-2);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_3500
     * @tc.name      testHspArithmetic0035
     * @tc.desc      Verify minus(2, 3) returns -1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0035');
        try {
          const result: number = minus(2, 3);
          expect(result).assertEqual(-1);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_3600
     * @tc.name      testHspArithmetic0036
     * @tc.desc      Verify minus(10, 20) returns -10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0036');
        try {
          const result: number = minus(10, 20);
          expect(result).assertEqual(-10);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_3700
     * @tc.name      testHspArithmetic0037
     * @tc.desc      Verify minus(100, 200) returns -100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0037');
        try {
          const result: number = minus(100, 200);
          expect(result).assertEqual(-100);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_3800
     * @tc.name      testHspArithmetic0038
     * @tc.desc      Verify minus(-2, -3) returns 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0038');
        try {
          const result: number = minus(-2, -3);
          expect(result).assertEqual(1);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_3900
     * @tc.name      testHspArithmetic0039
     * @tc.desc      Verify minus(-10, 5) returns -15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0039');
        try {
          const result: number = minus(-10, 5);
          expect(result).assertEqual(-15);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_4000
     * @tc.name      testHspArithmetic0040
     * @tc.desc      Verify minus(5, -10) returns 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0040');
        try {
          const result: number = minus(5, -10);
          expect(result).assertEqual(15);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_4100
     * @tc.name      testHspArithmetic0041
     * @tc.desc      Verify minus(0, 9) returns -9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0041');
        try {
          const result: number = minus(0, 9);
          expect(result).assertEqual(-9);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_4200
     * @tc.name      testHspArithmetic0042
     * @tc.desc      Verify minus(9, 0) returns 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0042');
        try {
          const result: number = minus(9, 0);
          expect(result).assertEqual(9);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_4300
     * @tc.name      testHspArithmetic0043
     * @tc.desc      Verify minus(-9, 0) returns -9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0043');
        try {
          const result: number = minus(-9, 0);
          expect(result).assertEqual(-9);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_4400
     * @tc.name      testHspArithmetic0044
     * @tc.desc      Verify minus(0, -9) returns 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0044');
        try {
          const result: number = minus(0, -9);
          expect(result).assertEqual(9);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_4500
     * @tc.name      testHspArithmetic0045
     * @tc.desc      Verify minus(7, 8) returns -1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0045');
        try {
          const result: number = minus(7, 8);
          expect(result).assertEqual(-1);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_4600
     * @tc.name      testHspArithmetic0046
     * @tc.desc      Verify minus(42, 58) returns -16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0046');
        try {
          const result: number = minus(42, 58);
          expect(result).assertEqual(-16);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_4700
     * @tc.name      testHspArithmetic0047
     * @tc.desc      Verify minus(99, 1) returns 98.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0047');
        try {
          const result: number = minus(99, 1);
          expect(result).assertEqual(98);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_4800
     * @tc.name      testHspArithmetic0048
     * @tc.desc      Verify minus(-99, -1) returns -98.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0048');
        try {
          const result: number = minus(-99, -1);
          expect(result).assertEqual(-98);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_4900
     * @tc.name      testHspArithmetic0049
     * @tc.desc      Verify minus(1000, 2000) returns -1000.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0049');
        try {
          const result: number = minus(1000, 2000);
          expect(result).assertEqual(-1000);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_5000
     * @tc.name      testHspArithmetic0050
     * @tc.desc      Verify minus(-1000, 500) returns -1500.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0050');
        try {
          const result: number = minus(-1000, 500);
          expect(result).assertEqual(-1500);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_5100
     * @tc.name      testHspArithmetic0051
     * @tc.desc      Verify minus(500, -1000) returns 1500.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0051');
        try {
          const result: number = minus(500, -1000);
          expect(result).assertEqual(1500);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_5200
     * @tc.name      testHspArithmetic0052
     * @tc.desc      Verify minus(123, 456) returns -333.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0052');
        try {
          const result: number = minus(123, 456);
          expect(result).assertEqual(-333);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_5300
     * @tc.name      testHspArithmetic0053
     * @tc.desc      Verify minus(789, 321) returns 468.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0053');
        try {
          const result: number = minus(789, 321);
          expect(result).assertEqual(468);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_5400
     * @tc.name      testHspArithmetic0054
     * @tc.desc      Verify minus(214748, 1) returns 214747.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0054');
        try {
          const result: number = minus(214748, 1);
          expect(result).assertEqual(214747);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_5500
     * @tc.name      testHspArithmetic0055
     * @tc.desc      Verify minus(1, 214748) returns -214747.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0055');
        try {
          const result: number = minus(1, 214748);
          expect(result).assertEqual(-214747);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_5600
     * @tc.name      testHspArithmetic0056
     * @tc.desc      Verify minus(-214748, 1) returns -214749.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0056');
        try {
          const result: number = minus(-214748, 1);
          expect(result).assertEqual(-214749);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_5700
     * @tc.name      testHspArithmetic0057
     * @tc.desc      Verify minus(9999, 1) returns 9998.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0057');
        try {
          const result: number = minus(9999, 1);
          expect(result).assertEqual(9998);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_5800
     * @tc.name      testHspArithmetic0058
     * @tc.desc      Verify minus(1, 9999) returns -9998.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0058');
        try {
          const result: number = minus(1, 9999);
          expect(result).assertEqual(-9998);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_5900
     * @tc.name      testHspArithmetic0059
     * @tc.desc      Verify minus(12345, 6789) returns 5556.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0059');
        try {
          const result: number = minus(12345, 6789);
          expect(result).assertEqual(5556);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_6000
     * @tc.name      testHspArithmetic0060
     * @tc.desc      Verify minus(0, 100) returns -100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmetic0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspArithmetic0060');
        try {
          const result: number = minus(0, 100);
          expect(result).assertEqual(-100);
          expect(typeof result).assertEqual('number');
          expect(result === result).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
