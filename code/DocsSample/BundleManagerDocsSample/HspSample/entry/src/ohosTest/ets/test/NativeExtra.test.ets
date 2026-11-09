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

export default function nativeExtraTest(): void {
  describe('HspNativeExtraTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_0100
     * @tc.name      testHspNativeExtra0001
     * @tc.desc      Verify extra nativeMulti(1, 3) returns 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1, 3);
          expect(result).assertEqual(3);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_0200
     * @tc.name      testHspNativeExtra0002
     * @tc.desc      Verify extra nativeMulti(3, 1) returns 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(3, 1);
          expect(result).assertEqual(3);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_0300
     * @tc.name      testHspNativeExtra0003
     * @tc.desc      Verify extra nativeMulti(2, 4) returns 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(2, 4);
          expect(result).assertEqual(8);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_0400
     * @tc.name      testHspNativeExtra0004
     * @tc.desc      Verify extra nativeMulti(4, 2) returns 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(4, 2);
          expect(result).assertEqual(8);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_0500
     * @tc.name      testHspNativeExtra0005
     * @tc.desc      Verify extra nativeMulti(5, 6) returns 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(5, 6);
          expect(result).assertEqual(30);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_0600
     * @tc.name      testHspNativeExtra0006
     * @tc.desc      Verify extra nativeMulti(6, 5) returns 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(6, 5);
          expect(result).assertEqual(30);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_0700
     * @tc.name      testHspNativeExtra0007
     * @tc.desc      Verify extra nativeMulti(-1, 2) returns -2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-1, 2);
          expect(result).assertEqual(-2);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_0800
     * @tc.name      testHspNativeExtra0008
     * @tc.desc      Verify extra nativeMulti(2, -1) returns -2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(2, -1);
          expect(result).assertEqual(-2);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_0900
     * @tc.name      testHspNativeExtra0009
     * @tc.desc      Verify extra nativeMulti(-2, -2) returns 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-2, -2);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_1000
     * @tc.name      testHspNativeExtra0010
     * @tc.desc      Verify extra nativeMulti(-3, 3) returns -9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-3, 3);
          expect(result).assertEqual(-9);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_1100
     * @tc.name      testHspNativeExtra0011
     * @tc.desc      Verify extra nativeMulti(3, -3) returns -9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(3, -3);
          expect(result).assertEqual(-9);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_1200
     * @tc.name      testHspNativeExtra0012
     * @tc.desc      Verify extra nativeMulti(10, 2) returns 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(10, 2);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_1300
     * @tc.name      testHspNativeExtra0013
     * @tc.desc      Verify extra nativeMulti(2, 10) returns 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(2, 10);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_1400
     * @tc.name      testHspNativeExtra0014
     * @tc.desc      Verify extra nativeMulti(100, 3) returns 300.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(100, 3);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_1500
     * @tc.name      testHspNativeExtra0015
     * @tc.desc      Verify extra nativeMulti(3, 100) returns 300.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(3, 100);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_1600
     * @tc.name      testHspNativeExtra0016
     * @tc.desc      Verify extra nativeMulti(999, 1) returns 999.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(999, 1);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_1700
     * @tc.name      testHspNativeExtra0017
     * @tc.desc      Verify extra nativeMulti(1, 999) returns 999.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(1, 999);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_1800
     * @tc.name      testHspNativeExtra0018
     * @tc.desc      Verify extra nativeMulti(7, 7) returns 49.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(7, 7);
          expect(result).assertEqual(49);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_1900
     * @tc.name      testHspNativeExtra0019
     * @tc.desc      Verify extra nativeMulti(8, 8) returns 64.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(8, 8);
          expect(result).assertEqual(64);
          expect(typeof result).assertEqual('number');
          expect(Number.isFinite(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA_2000
     * @tc.name      testHspNativeExtra0020
     * @tc.desc      Verify extra nativeMulti(9, 0) returns 0.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(9, 0);
          expect(result).assertEqual(0);
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
