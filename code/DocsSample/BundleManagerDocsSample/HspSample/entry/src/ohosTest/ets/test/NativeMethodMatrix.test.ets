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

export default function nativeMethodMatrixTest(): void {
  describe('HspNativeMethodMatrixTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_0100
     * @tc.name      testHspNativeMulti0001
     * @tc.desc      Verify nativeMulti(0, 0) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(0, 0);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_0200
     * @tc.name      testHspNativeMulti0002
     * @tc.desc      Verify nativeMulti(1, 1) returns 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1, 1);
          expect(result).assertEqual(1);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_0300
     * @tc.name      testHspNativeMulti0003
     * @tc.desc      Verify nativeMulti(1, 2) returns 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1, 2);
          expect(result).assertEqual(2);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_0400
     * @tc.name      testHspNativeMulti0004
     * @tc.desc      Verify nativeMulti(2, 1) returns 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(2, 1);
          expect(result).assertEqual(2);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_0500
     * @tc.name      testHspNativeMulti0005
     * @tc.desc      Verify nativeMulti(2, 3) returns 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(2, 3);
          expect(result).assertEqual(6);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_0600
     * @tc.name      testHspNativeMulti0006
     * @tc.desc      Verify nativeMulti(3, 2) returns 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(3, 2);
          expect(result).assertEqual(6);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_0700
     * @tc.name      testHspNativeMulti0007
     * @tc.desc      Verify nativeMulti(3, 4) returns 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(3, 4);
          expect(result).assertEqual(12);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_0800
     * @tc.name      testHspNativeMulti0008
     * @tc.desc      Verify nativeMulti(4, 3) returns 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(4, 3);
          expect(result).assertEqual(12);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_0900
     * @tc.name      testHspNativeMulti0009
     * @tc.desc      Verify nativeMulti(-1, 1) returns -1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-1, 1);
          expect(result).assertEqual(-1);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_1000
     * @tc.name      testHspNativeMulti0010
     * @tc.desc      Verify nativeMulti(1, -1) returns -1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1, -1);
          expect(result).assertEqual(-1);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_1100
     * @tc.name      testHspNativeMulti0011
     * @tc.desc      Verify nativeMulti(-2, 3) returns -6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-2, 3);
          expect(result).assertEqual(-6);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_1200
     * @tc.name      testHspNativeMulti0012
     * @tc.desc      Verify nativeMulti(2, -3) returns -6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(2, -3);
          expect(result).assertEqual(-6);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_1300
     * @tc.name      testHspNativeMulti0013
     * @tc.desc      Verify nativeMulti(-2, -3) returns 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-2, -3);
          expect(result).assertEqual(6);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_1400
     * @tc.name      testHspNativeMulti0014
     * @tc.desc      Verify nativeMulti(10, 10) returns 100.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(10, 10);
          expect(result).assertEqual(100);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_1500
     * @tc.name      testHspNativeMulti0015
     * @tc.desc      Verify nativeMulti(100, 2) returns 200.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(100, 2);
          expect(result).assertEqual(200);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_1600
     * @tc.name      testHspNativeMulti0016
     * @tc.desc      Verify nativeMulti(2, 100) returns 200.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(2, 100);
          expect(result).assertEqual(200);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_1700
     * @tc.name      testHspNativeMulti0017
     * @tc.desc      Verify nativeMulti(7, 8) returns 56.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(7, 8);
          expect(result).assertEqual(56);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_1800
     * @tc.name      testHspNativeMulti0018
     * @tc.desc      Verify nativeMulti(8, 7) returns 56.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(8, 7);
          expect(result).assertEqual(56);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_1900
     * @tc.name      testHspNativeMulti0019
     * @tc.desc      Verify nativeMulti(9, 9) returns 81.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(9, 9);
          expect(result).assertEqual(81);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_2000
     * @tc.name      testHspNativeMulti0020
     * @tc.desc      Verify nativeMulti(12, 12) returns 144.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(12, 12);
          expect(result).assertEqual(144);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_2100
     * @tc.name      testHspNativeMulti0021
     * @tc.desc      Verify nativeMulti(123, 1) returns 123.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(123, 1);
          expect(result).assertEqual(123);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_2200
     * @tc.name      testHspNativeMulti0022
     * @tc.desc      Verify nativeMulti(1, 123) returns 123.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1, 123);
          expect(result).assertEqual(123);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_2300
     * @tc.name      testHspNativeMulti0023
     * @tc.desc      Verify nativeMulti(999, 0) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(999, 0);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_2400
     * @tc.name      testHspNativeMulti0024
     * @tc.desc      Verify nativeMulti(0, 999) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(0, 999);
          expect(result).assertEqual(0);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_2500
     * @tc.name      testHspNativeMulti0025
     * @tc.desc      Verify nativeMulti(214748, 1) returns 214748.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(214748, 1);
          expect(result).assertEqual(214748);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_2600
     * @tc.name      testHspNativeMulti0026
     * @tc.desc      Verify nativeMulti(1, 214748) returns 214748.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1, 214748);
          expect(result).assertEqual(214748);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_2700
     * @tc.name      testHspNativeMulti0027
     * @tc.desc      Verify nativeMulti(-5, -5) returns 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-5, -5);
          expect(result).assertEqual(25);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_2800
     * @tc.name      testHspNativeMulti0028
     * @tc.desc      Verify nativeMulti(5, 5) returns 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(5, 5);
          expect(result).assertEqual(25);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_2900
     * @tc.name      testHspNativeMulti0029
     * @tc.desc      Verify nativeMulti(11, 11) returns 121.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(11, 11);
          expect(result).assertEqual(121);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_3000
     * @tc.name      testHspNativeMulti0030
     * @tc.desc      Verify nativeMulti(13, 2) returns 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeMulti0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(13, 2);
          expect(result).assertEqual(26);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
