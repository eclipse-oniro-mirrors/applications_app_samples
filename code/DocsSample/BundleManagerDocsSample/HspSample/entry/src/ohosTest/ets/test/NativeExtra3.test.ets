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

export default function nativeExtra3Test(): void {
  describe('HspNativeExtra3Test', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_0100
     * @tc.name      testHspNativeExtra30001
     * @tc.desc      Verify final native product 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(5, 7);
          expect(result).assertEqual(35);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_0200
     * @tc.name      testHspNativeExtra30002
     * @tc.desc      Verify final native product 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(7, 5);
          expect(result).assertEqual(35);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_0300
     * @tc.name      testHspNativeExtra30003
     * @tc.desc      Verify final native product 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(6, 8);
          expect(result).assertEqual(48);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_0400
     * @tc.name      testHspNativeExtra30004
     * @tc.desc      Verify final native product 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(8, 6);
          expect(result).assertEqual(48);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_0500
     * @tc.name      testHspNativeExtra30005
     * @tc.desc      Verify final native product 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(9, 10);
          expect(result).assertEqual(90);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_0600
     * @tc.name      testHspNativeExtra30006
     * @tc.desc      Verify final native product 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(10, 9);
          expect(result).assertEqual(90);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_0700
     * @tc.name      testHspNativeExtra30007
     * @tc.desc      Verify final native product 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(11, 12);
          expect(result).assertEqual(132);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_0800
     * @tc.name      testHspNativeExtra30008
     * @tc.desc      Verify final native product 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(12, 11);
          expect(result).assertEqual(132);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_0900
     * @tc.name      testHspNativeExtra30009
     * @tc.desc      Verify final native product 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(13, 14);
          expect(result).assertEqual(182);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_1000
     * @tc.name      testHspNativeExtra30010
     * @tc.desc      Verify final native product 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(14, 13);
          expect(result).assertEqual(182);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_1100
     * @tc.name      testHspNativeExtra30011
     * @tc.desc      Verify final native product 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-5, 7);
          expect(result).assertEqual(-35);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_1200
     * @tc.name      testHspNativeExtra30012
     * @tc.desc      Verify final native product 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(7, -5);
          expect(result).assertEqual(-35);
          expect(typeof result).assertEqual('number');
          expect(Number.isInteger(result)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_1300
     * @tc.name      testHspNativeExtra30013
     * @tc.desc      Verify final native product 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(0, 100);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_1400
     * @tc.name      testHspNativeExtra30014
     * @tc.desc      Verify final native product 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(100, 0);
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_NATIVE_EXTRA3_1500
     * @tc.name      testHspNativeExtra30015
     * @tc.desc      Verify final native product 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspNativeExtra30015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: number = nativeMulti(-10, -10);
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
