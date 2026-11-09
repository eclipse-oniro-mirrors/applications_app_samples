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

export default function hspBulkNumericResidual2Test(): void {
  describe('HspBulkNumericResidual2Test', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0001
     * @tc.name      testHspBulkNumericResidual2_0001
     * @tc.desc      Verify add bulk2 numeric case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1, 2);
          expect(result).assertEqual(3);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0002
     * @tc.name      testHspBulkNumericResidual2_0002
     * @tc.desc      Verify minus bulk2 numeric case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(2, 3);
          expect(result).assertEqual(-1);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0003
     * @tc.name      testHspBulkNumericResidual2_0003
     * @tc.desc      Verify nativeMulti bulk2 numeric case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(3, 4);
          expect(result).assertEqual(12);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0004
     * @tc.name      testHspBulkNumericResidual2_0004
     * @tc.desc      Verify add bulk2 numeric case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(4, 5);
          expect(result).assertEqual(9);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0005
     * @tc.name      testHspBulkNumericResidual2_0005
     * @tc.desc      Verify minus bulk2 numeric case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(5, 6);
          expect(result).assertEqual(-1);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0006
     * @tc.name      testHspBulkNumericResidual2_0006
     * @tc.desc      Verify nativeMulti bulk2 numeric case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(6, 7);
          expect(result).assertEqual(42);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0007
     * @tc.name      testHspBulkNumericResidual2_0007
     * @tc.desc      Verify add bulk2 numeric case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(7, 8);
          expect(result).assertEqual(15);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0008
     * @tc.name      testHspBulkNumericResidual2_0008
     * @tc.desc      Verify minus bulk2 numeric case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(8, 9);
          expect(result).assertEqual(-1);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0009
     * @tc.name      testHspBulkNumericResidual2_0009
     * @tc.desc      Verify nativeMulti bulk2 numeric case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(9, 10);
          expect(result).assertEqual(90);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0010
     * @tc.name      testHspBulkNumericResidual2_0010
     * @tc.desc      Verify add bulk2 numeric case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(10, 11);
          expect(result).assertEqual(21);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0011
     * @tc.name      testHspBulkNumericResidual2_0011
     * @tc.desc      Verify minus bulk2 numeric case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(11, 12);
          expect(result).assertEqual(-1);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0012
     * @tc.name      testHspBulkNumericResidual2_0012
     * @tc.desc      Verify nativeMulti bulk2 numeric case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(12, 13);
          expect(result).assertEqual(156);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0013
     * @tc.name      testHspBulkNumericResidual2_0013
     * @tc.desc      Verify add bulk2 numeric case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(13, 14);
          expect(result).assertEqual(27);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0014
     * @tc.name      testHspBulkNumericResidual2_0014
     * @tc.desc      Verify minus bulk2 numeric case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(14, 15);
          expect(result).assertEqual(-1);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0015
     * @tc.name      testHspBulkNumericResidual2_0015
     * @tc.desc      Verify nativeMulti bulk2 numeric case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(15, 16);
          expect(result).assertEqual(240);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0016
     * @tc.name      testHspBulkNumericResidual2_0016
     * @tc.desc      Verify add bulk2 numeric case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(16, 17);
          expect(result).assertEqual(33);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0017
     * @tc.name      testHspBulkNumericResidual2_0017
     * @tc.desc      Verify minus bulk2 numeric case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(17, 18);
          expect(result).assertEqual(-1);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0018
     * @tc.name      testHspBulkNumericResidual2_0018
     * @tc.desc      Verify nativeMulti bulk2 numeric case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(18, 19);
          expect(result).assertEqual(342);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0019
     * @tc.name      testHspBulkNumericResidual2_0019
     * @tc.desc      Verify add bulk2 numeric case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(19, 20);
          expect(result).assertEqual(39);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0020
     * @tc.name      testHspBulkNumericResidual2_0020
     * @tc.desc      Verify minus bulk2 numeric case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(20, 21);
          expect(result).assertEqual(-1);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0021
     * @tc.name      testHspBulkNumericResidual2_0021
     * @tc.desc      Verify nativeMulti bulk2 numeric case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(21, 22);
          expect(result).assertEqual(462);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0022
     * @tc.name      testHspBulkNumericResidual2_0022
     * @tc.desc      Verify add bulk2 numeric case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(22, 23);
          expect(result).assertEqual(45);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0023
     * @tc.name      testHspBulkNumericResidual2_0023
     * @tc.desc      Verify minus bulk2 numeric case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(23, 24);
          expect(result).assertEqual(-1);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0024
     * @tc.name      testHspBulkNumericResidual2_0024
     * @tc.desc      Verify nativeMulti bulk2 numeric case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1, -1);
          expect(result).assertEqual(-1);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0025
     * @tc.name      testHspBulkNumericResidual2_0025
     * @tc.desc      Verify add bulk2 numeric case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(2, -2);
          expect(result).assertEqual(0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0026
     * @tc.name      testHspBulkNumericResidual2_0026
     * @tc.desc      Verify minus bulk2 numeric case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(3, -3);
          expect(result).assertEqual(6);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0027
     * @tc.name      testHspBulkNumericResidual2_0027
     * @tc.desc      Verify nativeMulti bulk2 numeric case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(4, -4);
          expect(result).assertEqual(-16);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0028
     * @tc.name      testHspBulkNumericResidual2_0028
     * @tc.desc      Verify add bulk2 numeric case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(5, -5);
          expect(result).assertEqual(0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0029
     * @tc.name      testHspBulkNumericResidual2_0029
     * @tc.desc      Verify minus bulk2 numeric case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(6, -6);
          expect(result).assertEqual(12);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0030
     * @tc.name      testHspBulkNumericResidual2_0030
     * @tc.desc      Verify nativeMulti bulk2 numeric case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(7, -7);
          expect(result).assertEqual(-49);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0031
     * @tc.name      testHspBulkNumericResidual2_0031
     * @tc.desc      Verify add bulk2 numeric case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(8, -8);
          expect(result).assertEqual(0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0032
     * @tc.name      testHspBulkNumericResidual2_0032
     * @tc.desc      Verify minus bulk2 numeric case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(9, -9);
          expect(result).assertEqual(18);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0033
     * @tc.name      testHspBulkNumericResidual2_0033
     * @tc.desc      Verify nativeMulti bulk2 numeric case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(10, -10);
          expect(result).assertEqual(-100);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0034
     * @tc.name      testHspBulkNumericResidual2_0034
     * @tc.desc      Verify add bulk2 numeric case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(11, -11);
          expect(result).assertEqual(0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0035
     * @tc.name      testHspBulkNumericResidual2_0035
     * @tc.desc      Verify minus bulk2 numeric case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(12, -12);
          expect(result).assertEqual(24);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0036
     * @tc.name      testHspBulkNumericResidual2_0036
     * @tc.desc      Verify nativeMulti bulk2 numeric case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(13, -13);
          expect(result).assertEqual(-169);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0037
     * @tc.name      testHspBulkNumericResidual2_0037
     * @tc.desc      Verify add bulk2 numeric case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(14, -14);
          expect(result).assertEqual(0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0038
     * @tc.name      testHspBulkNumericResidual2_0038
     * @tc.desc      Verify minus bulk2 numeric case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(15, -15);
          expect(result).assertEqual(30);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0039
     * @tc.name      testHspBulkNumericResidual2_0039
     * @tc.desc      Verify nativeMulti bulk2 numeric case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(16, -16);
          expect(result).assertEqual(-256);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0040
     * @tc.name      testHspBulkNumericResidual2_0040
     * @tc.desc      Verify add bulk2 numeric case 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(17, -17);
          expect(result).assertEqual(0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0041
     * @tc.name      testHspBulkNumericResidual2_0041
     * @tc.desc      Verify minus bulk2 numeric case 41.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(18, -18);
          expect(result).assertEqual(36);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0042
     * @tc.name      testHspBulkNumericResidual2_0042
     * @tc.desc      Verify nativeMulti bulk2 numeric case 42.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(19, -19);
          expect(result).assertEqual(-361);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0043
     * @tc.name      testHspBulkNumericResidual2_0043
     * @tc.desc      Verify add bulk2 numeric case 43.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(20, -20);
          expect(result).assertEqual(0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0044
     * @tc.name      testHspBulkNumericResidual2_0044
     * @tc.desc      Verify minus bulk2 numeric case 44.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(21, -21);
          expect(result).assertEqual(42);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0045
     * @tc.name      testHspBulkNumericResidual2_0045
     * @tc.desc      Verify nativeMulti bulk2 numeric case 45.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(22, -22);
          expect(result).assertEqual(-484);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0046
     * @tc.name      testHspBulkNumericResidual2_0046
     * @tc.desc      Verify add bulk2 numeric case 46.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(23, -23);
          expect(result).assertEqual(0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0047
     * @tc.name      testHspBulkNumericResidual2_0047
     * @tc.desc      Verify minus bulk2 numeric case 47.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(0.5, 2);
          expect(result).assertEqual(-1.5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0048
     * @tc.name      testHspBulkNumericResidual2_0048
     * @tc.desc      Verify nativeMulti bulk2 numeric case 48.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1.0, 2);
          expect(result).assertEqual(2.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0049
     * @tc.name      testHspBulkNumericResidual2_0049
     * @tc.desc      Verify add bulk2 numeric case 49.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1.5, 2);
          expect(result).assertEqual(3.5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0050
     * @tc.name      testHspBulkNumericResidual2_0050
     * @tc.desc      Verify minus bulk2 numeric case 50.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(2.0, 2);
          expect(result).assertEqual(0.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0051
     * @tc.name      testHspBulkNumericResidual2_0051
     * @tc.desc      Verify nativeMulti bulk2 numeric case 51.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(2.5, 2);
          expect(result).assertEqual(5.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0052
     * @tc.name      testHspBulkNumericResidual2_0052
     * @tc.desc      Verify add bulk2 numeric case 52.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(3.0, 2);
          expect(result).assertEqual(5.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0053
     * @tc.name      testHspBulkNumericResidual2_0053
     * @tc.desc      Verify minus bulk2 numeric case 53.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(3.5, 2);
          expect(result).assertEqual(1.5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0054
     * @tc.name      testHspBulkNumericResidual2_0054
     * @tc.desc      Verify nativeMulti bulk2 numeric case 54.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(4.0, 2);
          expect(result).assertEqual(8.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0055
     * @tc.name      testHspBulkNumericResidual2_0055
     * @tc.desc      Verify add bulk2 numeric case 55.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(4.5, 2);
          expect(result).assertEqual(6.5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0056
     * @tc.name      testHspBulkNumericResidual2_0056
     * @tc.desc      Verify minus bulk2 numeric case 56.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(5.0, 2);
          expect(result).assertEqual(3.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0057
     * @tc.name      testHspBulkNumericResidual2_0057
     * @tc.desc      Verify nativeMulti bulk2 numeric case 57.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(5.5, 2);
          expect(result).assertEqual(11.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0058
     * @tc.name      testHspBulkNumericResidual2_0058
     * @tc.desc      Verify add bulk2 numeric case 58.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(6.0, 2);
          expect(result).assertEqual(8.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0059
     * @tc.name      testHspBulkNumericResidual2_0059
     * @tc.desc      Verify minus bulk2 numeric case 59.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(1001, -3);
          expect(result).assertEqual(1004);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0060
     * @tc.name      testHspBulkNumericResidual2_0060
     * @tc.desc      Verify nativeMulti bulk2 numeric case 60.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1002, -3);
          expect(result).assertEqual(-3006);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0061
     * @tc.name      testHspBulkNumericResidual2_0061
     * @tc.desc      Verify add bulk2 numeric case 61.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1003, -3);
          expect(result).assertEqual(1000);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0062
     * @tc.name      testHspBulkNumericResidual2_0062
     * @tc.desc      Verify minus bulk2 numeric case 62.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(1004, -3);
          expect(result).assertEqual(1007);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0063
     * @tc.name      testHspBulkNumericResidual2_0063
     * @tc.desc      Verify nativeMulti bulk2 numeric case 63.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1005, -3);
          expect(result).assertEqual(-3015);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0064
     * @tc.name      testHspBulkNumericResidual2_0064
     * @tc.desc      Verify add bulk2 numeric case 64.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1006, -3);
          expect(result).assertEqual(1003);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0065
     * @tc.name      testHspBulkNumericResidual2_0065
     * @tc.desc      Verify minus bulk2 numeric case 65.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(1007, -3);
          expect(result).assertEqual(1010);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0066
     * @tc.name      testHspBulkNumericResidual2_0066
     * @tc.desc      Verify nativeMulti bulk2 numeric case 66.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1008, -3);
          expect(result).assertEqual(-3024);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0067
     * @tc.name      testHspBulkNumericResidual2_0067
     * @tc.desc      Verify add bulk2 numeric case 67.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1009, -3);
          expect(result).assertEqual(1006);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0068
     * @tc.name      testHspBulkNumericResidual2_0068
     * @tc.desc      Verify minus bulk2 numeric case 68.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(1010, -3);
          expect(result).assertEqual(1013);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0069
     * @tc.name      testHspBulkNumericResidual2_0069
     * @tc.desc      Verify nativeMulti bulk2 numeric case 69.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1011, -3);
          expect(result).assertEqual(-3033);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK2_NUMERIC_0070
     * @tc.name      testHspBulkNumericResidual2_0070
     * @tc.desc      Verify add bulk2 numeric case 70.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual2_0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1012, -3);
          expect(result).assertEqual(1009);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
