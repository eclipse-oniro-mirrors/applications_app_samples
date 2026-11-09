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

export default function hspBulkNumericResidual3Test(): void {
  describe('HspBulkNumericResidual3Test', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0001
     * @tc.name      testHspBulkNumericResidual3_0001
     * @tc.desc      Verify add bulk3 numeric case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(1, 3);
          expect(result).assertEqual(4);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0002
     * @tc.name      testHspBulkNumericResidual3_0002
     * @tc.desc      Verify minus bulk3 numeric case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(2, 4);
          expect(result).assertEqual(-2);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0003
     * @tc.name      testHspBulkNumericResidual3_0003
     * @tc.desc      Verify nativeMulti bulk3 numeric case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(3, 5);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0004
     * @tc.name      testHspBulkNumericResidual3_0004
     * @tc.desc      Verify add bulk3 numeric case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(4, 6);
          expect(result).assertEqual(10);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0005
     * @tc.name      testHspBulkNumericResidual3_0005
     * @tc.desc      Verify minus bulk3 numeric case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(5, 7);
          expect(result).assertEqual(-2);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0006
     * @tc.name      testHspBulkNumericResidual3_0006
     * @tc.desc      Verify nativeMulti bulk3 numeric case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(6, 8);
          expect(result).assertEqual(48);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0007
     * @tc.name      testHspBulkNumericResidual3_0007
     * @tc.desc      Verify add bulk3 numeric case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(7, 9);
          expect(result).assertEqual(16);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0008
     * @tc.name      testHspBulkNumericResidual3_0008
     * @tc.desc      Verify minus bulk3 numeric case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(8, 10);
          expect(result).assertEqual(-2);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0009
     * @tc.name      testHspBulkNumericResidual3_0009
     * @tc.desc      Verify nativeMulti bulk3 numeric case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(9, 11);
          expect(result).assertEqual(99);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0010
     * @tc.name      testHspBulkNumericResidual3_0010
     * @tc.desc      Verify add bulk3 numeric case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(10, 12);
          expect(result).assertEqual(22);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0011
     * @tc.name      testHspBulkNumericResidual3_0011
     * @tc.desc      Verify minus bulk3 numeric case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-1, 1);
          expect(result).assertEqual(-2);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0012
     * @tc.name      testHspBulkNumericResidual3_0012
     * @tc.desc      Verify nativeMulti bulk3 numeric case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-2, 2);
          expect(result).assertEqual(-4);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0013
     * @tc.name      testHspBulkNumericResidual3_0013
     * @tc.desc      Verify add bulk3 numeric case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-3, 3);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0014
     * @tc.name      testHspBulkNumericResidual3_0014
     * @tc.desc      Verify minus bulk3 numeric case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-4, 4);
          expect(result).assertEqual(-8);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0015
     * @tc.name      testHspBulkNumericResidual3_0015
     * @tc.desc      Verify nativeMulti bulk3 numeric case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-5, 5);
          expect(result).assertEqual(-25);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0016
     * @tc.name      testHspBulkNumericResidual3_0016
     * @tc.desc      Verify add bulk3 numeric case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-6, 6);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0017
     * @tc.name      testHspBulkNumericResidual3_0017
     * @tc.desc      Verify minus bulk3 numeric case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-7, 7);
          expect(result).assertEqual(-14);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0018
     * @tc.name      testHspBulkNumericResidual3_0018
     * @tc.desc      Verify nativeMulti bulk3 numeric case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-8, 8);
          expect(result).assertEqual(-64);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0019
     * @tc.name      testHspBulkNumericResidual3_0019
     * @tc.desc      Verify add bulk3 numeric case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-9, 9);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0020
     * @tc.name      testHspBulkNumericResidual3_0020
     * @tc.desc      Verify minus bulk3 numeric case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-10, 10);
          expect(result).assertEqual(-20);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0021
     * @tc.name      testHspBulkNumericResidual3_0021
     * @tc.desc      Verify nativeMulti bulk3 numeric case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1.5, 2);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0022
     * @tc.name      testHspBulkNumericResidual3_0022
     * @tc.desc      Verify add bulk3 numeric case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(2.5, 2);
          expect(result).assertEqual(4.5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0023
     * @tc.name      testHspBulkNumericResidual3_0023
     * @tc.desc      Verify minus bulk3 numeric case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0023',
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0024
     * @tc.name      testHspBulkNumericResidual3_0024
     * @tc.desc      Verify nativeMulti bulk3 numeric case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(4.5, 2);
          expect(result).assertEqual(9.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0025
     * @tc.name      testHspBulkNumericResidual3_0025
     * @tc.desc      Verify add bulk3 numeric case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(5.5, 2);
          expect(result).assertEqual(7.5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0026
     * @tc.name      testHspBulkNumericResidual3_0026
     * @tc.desc      Verify minus bulk3 numeric case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(6.5, 2);
          expect(result).assertEqual(4.5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0027
     * @tc.name      testHspBulkNumericResidual3_0027
     * @tc.desc      Verify nativeMulti bulk3 numeric case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(7.5, 2);
          expect(result).assertEqual(15.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0028
     * @tc.name      testHspBulkNumericResidual3_0028
     * @tc.desc      Verify add bulk3 numeric case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(8.5, 2);
          expect(result).assertEqual(10.5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0029
     * @tc.name      testHspBulkNumericResidual3_0029
     * @tc.desc      Verify minus bulk3 numeric case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(9.5, 2);
          expect(result).assertEqual(7.5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_0030
     * @tc.name      testHspBulkNumericResidual3_0030
     * @tc.desc      Verify nativeMulti bulk3 numeric case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(10.5, 2);
          expect(result).assertEqual(21.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_3100
     * @tc.name      testHspBulkNumericResidual3_0031
     * @tc.desc      Verify add bulk3 numeric case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(2, 9);
          expect(result).assertEqual(11);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_3200
     * @tc.name      testHspBulkNumericResidual3_0032
     * @tc.desc      Verify add bulk3 numeric case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(3, 8);
          expect(result).assertEqual(11);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_3300
     * @tc.name      testHspBulkNumericResidual3_0033
     * @tc.desc      Verify add bulk3 numeric case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(4, 7);
          expect(result).assertEqual(11);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_3400
     * @tc.name      testHspBulkNumericResidual3_0034
     * @tc.desc      Verify add bulk3 numeric case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(5, 6);
          expect(result).assertEqual(11);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_3500
     * @tc.name      testHspBulkNumericResidual3_0035
     * @tc.desc      Verify add bulk3 numeric case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(6, 5);
          expect(result).assertEqual(11);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_3600
     * @tc.name      testHspBulkNumericResidual3_0036
     * @tc.desc      Verify add bulk3 numeric case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(7, 4);
          expect(result).assertEqual(11);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_3700
     * @tc.name      testHspBulkNumericResidual3_0037
     * @tc.desc      Verify add bulk3 numeric case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(8, 3);
          expect(result).assertEqual(11);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_3800
     * @tc.name      testHspBulkNumericResidual3_0038
     * @tc.desc      Verify add bulk3 numeric case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(9, 2);
          expect(result).assertEqual(11);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_3900
     * @tc.name      testHspBulkNumericResidual3_0039
     * @tc.desc      Verify add bulk3 numeric case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(10, 1);
          expect(result).assertEqual(11);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK3_NUMERIC_4000
     * @tc.name      testHspBulkNumericResidual3_0040
     * @tc.desc      Verify add bulk3 numeric case 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual3_0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(11, 0);
          expect(result).assertEqual(11);
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
