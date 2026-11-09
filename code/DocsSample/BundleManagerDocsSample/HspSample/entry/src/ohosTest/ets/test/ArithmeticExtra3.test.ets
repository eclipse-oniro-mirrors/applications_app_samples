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

export default function arithmeticExtra3Test(): void {
  describe('HspArithmeticExtra3Test', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_0100
     * @tc.name      testHspArithmeticExtra30001
     * @tc.desc      Verify final add(0, 100) returns 100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(0, 100);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_0200
     * @tc.name      testHspArithmeticExtra30002
     * @tc.desc      Verify final add(100, 0) returns 100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(100, 0);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_0300
     * @tc.name      testHspArithmeticExtra30003
     * @tc.desc      Verify final add(-100, 100) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-100, 100);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_0400
     * @tc.name      testHspArithmeticExtra30004
     * @tc.desc      Verify final add(100, -100) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(100, -100);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_0500
     * @tc.name      testHspArithmeticExtra30005
     * @tc.desc      Verify final add(200, -50) returns 150.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(200, -50);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_0600
     * @tc.name      testHspArithmeticExtra30006
     * @tc.desc      Verify final add(-200, 50) returns -150.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-200, 50);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_0700
     * @tc.name      testHspArithmeticExtra30007
     * @tc.desc      Verify final add(300, 300) returns 600.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(300, 300);
          expect(result).assertEqual(600);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_0800
     * @tc.name      testHspArithmeticExtra30008
     * @tc.desc      Verify final add(-300, -300) returns -600.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-300, -300);
          expect(result).assertEqual(-600);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_0900
     * @tc.name      testHspArithmeticExtra30009
     * @tc.desc      Verify final add(400, -100) returns 300.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(400, -100);
          expect(result).assertEqual(300);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_1000
     * @tc.name      testHspArithmeticExtra30010
     * @tc.desc      Verify final add(-400, 100) returns -300.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-400, 100);
          expect(result).assertEqual(-300);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_1100
     * @tc.name      testHspArithmeticExtra30011
     * @tc.desc      Verify final add(500, 1) returns 501.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(500, 1);
          expect(result).assertEqual(501);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_1200
     * @tc.name      testHspArithmeticExtra30012
     * @tc.desc      Verify final add(1, 500) returns 501.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1, 500);
          expect(result).assertEqual(501);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_1300
     * @tc.name      testHspArithmeticExtra30013
     * @tc.desc      Verify final add(600, 2) returns 602.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(600, 2);
          expect(result).assertEqual(602);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_1400
     * @tc.name      testHspArithmeticExtra30014
     * @tc.desc      Verify final add(2, 600) returns 602.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(2, 600);
          expect(result).assertEqual(602);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_1500
     * @tc.name      testHspArithmeticExtra30015
     * @tc.desc      Verify final add(700, 3) returns 703.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(700, 3);
          expect(result).assertEqual(703);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_1600
     * @tc.name      testHspArithmeticExtra30016
     * @tc.desc      Verify final add(3, 700) returns 703.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(3, 700);
          expect(result).assertEqual(703);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_1700
     * @tc.name      testHspArithmeticExtra30017
     * @tc.desc      Verify final add(800, 4) returns 804.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(800, 4);
          expect(result).assertEqual(804);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_1800
     * @tc.name      testHspArithmeticExtra30018
     * @tc.desc      Verify final add(4, 800) returns 804.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(4, 800);
          expect(result).assertEqual(804);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_1900
     * @tc.name      testHspArithmeticExtra30019
     * @tc.desc      Verify final add(900, 5) returns 905.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(900, 5);
          expect(result).assertEqual(905);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_2000
     * @tc.name      testHspArithmeticExtra30020
     * @tc.desc      Verify final add(5, 900) returns 905.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(5, 900);
          expect(result).assertEqual(905);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_2100
     * @tc.name      testHspArithmeticExtra30021
     * @tc.desc      Verify final add(1000, 1000) returns 2000.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1000, 1000);
          expect(result).assertEqual(2000);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_2200
     * @tc.name      testHspArithmeticExtra30022
     * @tc.desc      Verify final add(-1000, 1000) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-1000, 1000);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_2300
     * @tc.name      testHspArithmeticExtra30023
     * @tc.desc      Verify final add(1234, 1) returns 1235.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1234, 1);
          expect(result).assertEqual(1235);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_2400
     * @tc.name      testHspArithmeticExtra30024
     * @tc.desc      Verify final add(1, 1234) returns 1235.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1, 1234);
          expect(result).assertEqual(1235);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA3_2500
     * @tc.name      testHspArithmeticExtra30025
     * @tc.desc      Verify final add(0, -100) returns -100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra30025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(0, -100);
          expect(result).assertEqual(-100);
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
