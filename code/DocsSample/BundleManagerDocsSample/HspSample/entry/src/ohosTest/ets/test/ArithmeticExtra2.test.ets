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
import { add } from 'library';

export default function arithmeticExtra2Test(): void {
  describe('HspArithmeticExtra2Test', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_0100
     * @tc.name      testHspArithmeticExtra20001
     * @tc.desc      Verify associative add case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(1, 2), 3)).assertEqual(6);
          expect(add(1, add(2, 3))).assertEqual(6);
          expect(typeof add(1, 2)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_0200
     * @tc.name      testHspArithmeticExtra20002
     * @tc.desc      Verify associative add case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(2, 3), 4)).assertEqual(9);
          expect(add(2, add(3, 4))).assertEqual(9);
          expect(typeof add(2, 3)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_0300
     * @tc.name      testHspArithmeticExtra20003
     * @tc.desc      Verify associative add case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(5, 5), 5)).assertEqual(15);
          expect(add(5, add(5, 5))).assertEqual(15);
          expect(typeof add(5, 5)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_0400
     * @tc.name      testHspArithmeticExtra20004
     * @tc.desc      Verify associative add case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(10, 0), 10)).assertEqual(20);
          expect(add(10, add(0, 10))).assertEqual(20);
          expect(typeof add(10, 0)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_0500
     * @tc.name      testHspArithmeticExtra20005
     * @tc.desc      Verify associative add case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(0, 10), 10)).assertEqual(20);
          expect(add(0, add(10, 10))).assertEqual(20);
          expect(typeof add(0, 10)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_0600
     * @tc.name      testHspArithmeticExtra20006
     * @tc.desc      Verify associative add case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(-1, 1), 2)).assertEqual(2);
          expect(add(-1, add(1, 2))).assertEqual(2);
          expect(typeof add(-1, 1)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_0700
     * @tc.name      testHspArithmeticExtra20007
     * @tc.desc      Verify associative add case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(-5, 5), 10)).assertEqual(10);
          expect(add(-5, add(5, 10))).assertEqual(10);
          expect(typeof add(-5, 5)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_0800
     * @tc.name      testHspArithmeticExtra20008
     * @tc.desc      Verify associative add case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(100, 50), 25)).assertEqual(175);
          expect(add(100, add(50, 25))).assertEqual(175);
          expect(typeof add(100, 50)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_0900
     * @tc.name      testHspArithmeticExtra20009
     * @tc.desc      Verify associative add case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(-100, -50), -25)).assertEqual(-175);
          expect(add(-100, add(-50, -25))).assertEqual(-175);
          expect(typeof add(-100, -50)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_1000
     * @tc.name      testHspArithmeticExtra20010
     * @tc.desc      Verify associative add case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(7, 3), 2)).assertEqual(12);
          expect(add(7, add(3, 2))).assertEqual(12);
          expect(typeof add(7, 3)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_1100
     * @tc.name      testHspArithmeticExtra20011
     * @tc.desc      Verify associative add case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(9, 4), 1)).assertEqual(14);
          expect(add(9, add(4, 1))).assertEqual(14);
          expect(typeof add(9, 4)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_1200
     * @tc.name      testHspArithmeticExtra20012
     * @tc.desc      Verify associative add case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(11, 22), 33)).assertEqual(66);
          expect(add(11, add(22, 33))).assertEqual(66);
          expect(typeof add(11, 22)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_1300
     * @tc.name      testHspArithmeticExtra20013
     * @tc.desc      Verify associative add case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(123, 456), 789)).assertEqual(1368);
          expect(add(123, add(456, 789))).assertEqual(1368);
          expect(typeof add(123, 456)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_1400
     * @tc.name      testHspArithmeticExtra20014
     * @tc.desc      Verify associative add case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(999, 1), 1)).assertEqual(1001);
          expect(add(999, add(1, 1))).assertEqual(1001);
          expect(typeof add(999, 1)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_1500
     * @tc.name      testHspArithmeticExtra20015
     * @tc.desc      Verify associative add case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(-999, -1), -1)).assertEqual(-1001);
          expect(add(-999, add(-1, -1))).assertEqual(-1001);
          expect(typeof add(-999, -1)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_1600
     * @tc.name      testHspArithmeticExtra20016
     * @tc.desc      Verify associative add case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(50, 50), 50)).assertEqual(150);
          expect(add(50, add(50, 50))).assertEqual(150);
          expect(typeof add(50, 50)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_1700
     * @tc.name      testHspArithmeticExtra20017
     * @tc.desc      Verify associative add case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(20, -10), 5)).assertEqual(15);
          expect(add(20, add(-10, 5))).assertEqual(15);
          expect(typeof add(20, -10)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_1800
     * @tc.name      testHspArithmeticExtra20018
     * @tc.desc      Verify associative add case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(-20, 10), -5)).assertEqual(-15);
          expect(add(-20, add(10, -5))).assertEqual(-15);
          expect(typeof add(-20, 10)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_1900
     * @tc.name      testHspArithmeticExtra20019
     * @tc.desc      Verify associative add case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(1000, 2000), 3000)).assertEqual(6000);
          expect(add(1000, add(2000, 3000))).assertEqual(6000);
          expect(typeof add(1000, 2000)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_2000
     * @tc.name      testHspArithmeticExtra20020
     * @tc.desc      Verify associative add case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(-1000, 500), -500)).assertEqual(-1000);
          expect(add(-1000, add(500, -500))).assertEqual(-1000);
          expect(typeof add(-1000, 500)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_2100
     * @tc.name      testHspArithmeticExtra20021
     * @tc.desc      Verify associative add case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(3, 7), 11)).assertEqual(21);
          expect(add(3, add(7, 11))).assertEqual(21);
          expect(typeof add(3, 7)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_2200
     * @tc.name      testHspArithmeticExtra20022
     * @tc.desc      Verify associative add case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(13, 17), 19)).assertEqual(49);
          expect(add(13, add(17, 19))).assertEqual(49);
          expect(typeof add(13, 17)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_2300
     * @tc.name      testHspArithmeticExtra20023
     * @tc.desc      Verify associative add case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(23, 29), 31)).assertEqual(83);
          expect(add(23, add(29, 31))).assertEqual(83);
          expect(typeof add(23, 29)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_2400
     * @tc.name      testHspArithmeticExtra20024
     * @tc.desc      Verify associative add case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(37, 41), 43)).assertEqual(121);
          expect(add(37, add(41, 43))).assertEqual(121);
          expect(typeof add(37, 41)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ARITHMETIC_EXTRA2_2500
     * @tc.name      testHspArithmeticExtra20025
     * @tc.desc      Verify associative add case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspArithmeticExtra20025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(add(add(101, 103), 107)).assertEqual(311);
          expect(add(101, add(103, 107))).assertEqual(311);
          expect(typeof add(101, 103)).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
