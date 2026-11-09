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
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = 'SampleTest';

export default function hspBulkNumericResidualTest(): void {
  describe('HspBulkNumericResidualTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_0100
     * @tc.name      testHspBulkNumericResidual0001
     * @tc.desc      Verify add bulk numeric case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(7, 3);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_0200
     * @tc.name      testHspBulkNumericResidual0002
     * @tc.desc      Verify minus bulk numeric case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(0, 0);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_0300
     * @tc.name      testHspBulkNumericResidual0003
     * @tc.desc      Verify nativeMulti bulk numeric case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1, 1);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(1);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_0400
     * @tc.name      testHspBulkNumericResidual0004
     * @tc.desc      Verify add bulk numeric case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-1, 1);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_0500
     * @tc.name      testHspBulkNumericResidual0005
     * @tc.desc      Verify minus bulk numeric case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(10, 5);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_0600
     * @tc.name      testHspBulkNumericResidual0006
     * @tc.desc      Verify nativeMulti bulk numeric case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-10, 5);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-50);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_0700
     * @tc.name      testHspBulkNumericResidual0007
     * @tc.desc      Verify add bulk numeric case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(100, 25);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(125);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_0800
     * @tc.name      testHspBulkNumericResidual0008
     * @tc.desc      Verify minus bulk numeric case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-100, -25);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-75);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_0900
     * @tc.name      testHspBulkNumericResidual0009
     * @tc.desc      Verify nativeMulti bulk numeric case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(2.5, 4);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(10.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_1000
     * @tc.name      testHspBulkNumericResidual0010
     * @tc.desc      Verify add bulk numeric case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(0.5, 2);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(2.5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_1100
     * @tc.name      testHspBulkNumericResidual0011
     * @tc.desc      Verify minus bulk numeric case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(1.5, 2);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-0.5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_1200
     * @tc.name      testHspBulkNumericResidual0012
     * @tc.desc      Verify nativeMulti bulk numeric case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-1.5, 2);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-3.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_1300
     * @tc.name      testHspBulkNumericResidual0013
     * @tc.desc      Verify add bulk numeric case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(12, 12);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_1400
     * @tc.name      testHspBulkNumericResidual0014
     * @tc.desc      Verify minus bulk numeric case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-12, 12);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-24);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_1500
     * @tc.name      testHspBulkNumericResidual0015
     * @tc.desc      Verify nativeMulti bulk numeric case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(999, 1);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(999);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_1600
     * @tc.name      testHspBulkNumericResidual0016
     * @tc.desc      Verify add bulk numeric case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-999, 1);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-998);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_1700
     * @tc.name      testHspBulkNumericResidual0017
     * @tc.desc      Verify minus bulk numeric case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(1000, -1);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(1001);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_1800
     * @tc.name      testHspBulkNumericResidual0018
     * @tc.desc      Verify nativeMulti bulk numeric case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(64, 8);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(512);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_1900
     * @tc.name      testHspBulkNumericResidual0019
     * @tc.desc      Verify add bulk numeric case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-64, 8);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-56);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_2000
     * @tc.name      testHspBulkNumericResidual0020
     * @tc.desc      Verify minus bulk numeric case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(3, 7);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_2100
     * @tc.name      testHspBulkNumericResidual0021
     * @tc.desc      Verify nativeMulti bulk numeric case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-3, -7);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_2200
     * @tc.name      testHspBulkNumericResidual0022
     * @tc.desc      Verify add bulk numeric case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(123, 456);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(579);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_2300
     * @tc.name      testHspBulkNumericResidual0023
     * @tc.desc      Verify minus bulk numeric case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-123, 456);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-579);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_2400
     * @tc.name      testHspBulkNumericResidual0024
     * @tc.desc      Verify nativeMulti bulk numeric case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1000.0, 2);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(2000.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_2500
     * @tc.name      testHspBulkNumericResidual0025
     * @tc.desc      Verify add bulk numeric case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-1000.0, 2);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-998.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_2600
     * @tc.name      testHspBulkNumericResidual0026
     * @tc.desc      Verify minus bulk numeric case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(1000000.0, 3);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(999997.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_2700
     * @tc.name      testHspBulkNumericResidual0027
     * @tc.desc      Verify nativeMulti bulk numeric case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-1000000.0, 3);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-3000000.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_2800
     * @tc.name      testHspBulkNumericResidual0028
     * @tc.desc      Verify add bulk numeric case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(5, 0);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_2900
     * @tc.name      testHspBulkNumericResidual0029
     * @tc.desc      Verify minus bulk numeric case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-5, 0);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_3000
     * @tc.name      testHspBulkNumericResidual0030
     * @tc.desc      Verify nativeMulti bulk numeric case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(0, 5);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_3100
     * @tc.name      testHspBulkNumericResidual0031
     * @tc.desc      Verify add bulk numeric case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(0, -5);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-5);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_3200
     * @tc.name      testHspBulkNumericResidual0032
     * @tc.desc      Verify minus bulk numeric case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(17, 13);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_3300
     * @tc.name      testHspBulkNumericResidual0033
     * @tc.desc      Verify nativeMulti bulk numeric case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-17, 13);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-221);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_3400
     * @tc.name      testHspBulkNumericResidual0034
     * @tc.desc      Verify add bulk numeric case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(23, 19);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_3500
     * @tc.name      testHspBulkNumericResidual0035
     * @tc.desc      Verify minus bulk numeric case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-23, -19);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_3600
     * @tc.name      testHspBulkNumericResidual0036
     * @tc.desc      Verify nativeMulti bulk numeric case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(2, 0.5);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(1.0);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_3700
     * @tc.name      testHspBulkNumericResidual0037
     * @tc.desc      Verify add bulk numeric case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-2, 0.5);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_3800
     * @tc.name      testHspBulkNumericResidual0038
     * @tc.desc      Verify minus bulk numeric case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(9, 3);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_3900
     * @tc.name      testHspBulkNumericResidual0039
     * @tc.desc      Verify nativeMulti bulk numeric case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-9, 3);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-27);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_4000
     * @tc.name      testHspBulkNumericResidual0040
     * @tc.desc      Verify add bulk numeric case 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(11, 11);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_4100
     * @tc.name      testHspBulkNumericResidual0041
     * @tc.desc      Verify minus bulk numeric case 41.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(-11, 11);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-22);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_4200
     * @tc.name      testHspBulkNumericResidual0042
     * @tc.desc      Verify nativeMulti bulk numeric case 42.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(100, 100);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(10000);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_4300
     * @tc.name      testHspBulkNumericResidual0043
     * @tc.desc      Verify add bulk numeric case 43.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(-100, 100);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_4400
     * @tc.name      testHspBulkNumericResidual0044
     * @tc.desc      Verify minus bulk numeric case 44.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = minus(45, 9);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_4500
     * @tc.name      testHspBulkNumericResidual0045
     * @tc.desc      Verify nativeMulti bulk numeric case 45.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-45, 9);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(-405);
          expect(Number.isFinite(result)).assertTrue();
          expect(typeof result).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_BULK_NUMERIC_4600
     * @tc.name      testHspBulkNumericResidual0046
     * @tc.desc      Verify add bulk numeric case 46.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspBulkNumericResidual0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = add(81, 9);
          hilog.info(DOMAIN, TAG, 'result: %{public}d', result);
          expect(result).assertEqual(90);
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
