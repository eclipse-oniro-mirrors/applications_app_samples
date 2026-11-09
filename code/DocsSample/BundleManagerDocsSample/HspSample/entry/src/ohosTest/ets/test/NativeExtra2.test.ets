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

export default function nativeExtra2Test(): void {
  describe('HspNativeExtra2Test', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_0100
     * @tc.name      testHspNativeExtra20001
     * @tc.desc      Verify extra native product 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(2, 5);
          expect(result).assertEqual(10);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_0200
     * @tc.name      testHspNativeExtra20002
     * @tc.desc      Verify extra native product 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(5, 2);
          expect(result).assertEqual(10);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_0300
     * @tc.name      testHspNativeExtra20003
     * @tc.desc      Verify extra native product 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(3, 7);
          expect(result).assertEqual(21);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_0400
     * @tc.name      testHspNativeExtra20004
     * @tc.desc      Verify extra native product 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(7, 3);
          expect(result).assertEqual(21);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_0500
     * @tc.name      testHspNativeExtra20005
     * @tc.desc      Verify extra native product 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(4, 6);
          expect(result).assertEqual(24);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_0600
     * @tc.name      testHspNativeExtra20006
     * @tc.desc      Verify extra native product 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(6, 4);
          expect(result).assertEqual(24);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_0700
     * @tc.name      testHspNativeExtra20007
     * @tc.desc      Verify extra native product 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(8, 9);
          expect(result).assertEqual(72);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_0800
     * @tc.name      testHspNativeExtra20008
     * @tc.desc      Verify extra native product 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(9, 8);
          expect(result).assertEqual(72);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_0900
     * @tc.name      testHspNativeExtra20009
     * @tc.desc      Verify extra native product 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-2, 4);
          expect(result).assertEqual(-8);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_1000
     * @tc.name      testHspNativeExtra20010
     * @tc.desc      Verify extra native product 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(4, -2);
          expect(result).assertEqual(-8);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_1100
     * @tc.name      testHspNativeExtra20011
     * @tc.desc      Verify extra native product 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-3, -4);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_1200
     * @tc.name      testHspNativeExtra20012
     * @tc.desc      Verify extra native product 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(12, 3);
          expect(result).assertEqual(36);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_1300
     * @tc.name      testHspNativeExtra20013
     * @tc.desc      Verify extra native product 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(3, 12);
          expect(result).assertEqual(36);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_1400
     * @tc.name      testHspNativeExtra20014
     * @tc.desc      Verify extra native product 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(25, 4);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA2_1500
     * @tc.name      testHspNativeExtra20015
     * @tc.desc      Verify extra native product 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra20015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(4, 25);
          expect(result).assertEqual(100);
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
