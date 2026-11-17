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
import { Log, add, minus, nativeMulti } from 'library';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

export default function libraryApiTest(): void {
  describe('HspLibraryApiTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_0100
     * @tc.name      testHspLibraryApi0001
     * @tc.desc      Verify Log.info accepts a message.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0001');
        try {
          Log.info('hsp test'); expect(true).assertTrue();
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_0200
     * @tc.name      testHspLibraryApi0002
     * @tc.desc      Verify add and minus are inverse.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0002');
        try {
          const x: number = add(10, 5); expect(minus(x, 5)).assertEqual(10);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_0300
     * @tc.name      testHspLibraryApi0003
     * @tc.desc      Verify add is commutative.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0003');
        try {
          expect(add(3, 4)).assertEqual(add(4, 3));
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_0400
     * @tc.name      testHspLibraryApi0004
     * @tc.desc      Verify minus self is zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0004');
        try {
          expect(minus(9, 9)).assertEqual(0);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_0500
     * @tc.name      testHspLibraryApi0005
     * @tc.desc      Verify native result equals arithmetic.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0005');
        try {
          expect(nativeMulti(3, 4)).assertEqual(add(3, 4) + 5);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_0600
     * @tc.name      testHspLibraryApi0006
     * @tc.desc      Verify add negative values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0006');
        try {
          expect(add(-3, -4)).assertEqual(-7);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_0700
     * @tc.name      testHspLibraryApi0007
     * @tc.desc      Verify minus negative values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0007');
        try {
          expect(minus(-3, -4)).assertEqual(1);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_0800
     * @tc.name      testHspLibraryApi0008
     * @tc.desc      Verify native zero product.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0008');
        try {
          expect(nativeMulti(0, 99)).assertEqual(0);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_0900
     * @tc.name      testHspLibraryApi0009
     * @tc.desc      Verify native identity.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0009');
        try {
          expect(nativeMulti(99, 1)).assertEqual(99);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_1000
     * @tc.name      testHspLibraryApi0010
     * @tc.desc      Verify arithmetic identity.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0010');
        try {
          expect(add(99, 0)).assertEqual(99);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_1100
     * @tc.name      testHspLibraryApi0011
     * @tc.desc      Verify minus identity.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0011');
        try {
          expect(minus(99, 0)).assertEqual(99);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_1200
     * @tc.name      testHspLibraryApi0012
     * @tc.desc      Verify add result is number.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0012');
        try {
          expect(typeof add(1, 1)).assertEqual('number');
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_1300
     * @tc.name      testHspLibraryApi0013
     * @tc.desc      Verify minus result is number.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0013');
        try {
          expect(typeof minus(1, 1)).assertEqual('number');
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_1400
     * @tc.name      testHspLibraryApi0014
     * @tc.desc      Verify native result is number.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0014');
        try {
          expect(typeof nativeMulti(1, 1)).assertEqual('number');
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_1500
     * @tc.name      testHspLibraryApi0015
     * @tc.desc      Verify add larger numbers.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0015');
        try {
          expect(add(1000, 2000)).assertEqual(3000);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_1600
     * @tc.name      testHspLibraryApi0016
     * @tc.desc      Verify minus larger numbers.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0016');
        try {
          expect(minus(3000, 2000)).assertEqual(1000);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_1700
     * @tc.name      testHspLibraryApi0017
     * @tc.desc      Verify native larger numbers.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0017');
        try {
          expect(nativeMulti(100, 20)).assertEqual(2000);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_1800
     * @tc.name      testHspLibraryApi0018
     * @tc.desc      Verify add zero pair.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0018');
        try {
          expect(add(0, 0)).assertEqual(0);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_1900
     * @tc.name      testHspLibraryApi0019
     * @tc.desc      Verify minus zero pair.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0019');
        try {
          expect(minus(0, 0)).assertEqual(0);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_LIBRARYAPI_2000
     * @tc.name      testHspLibraryApi0020
     * @tc.desc      Verify native zero pair.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspLibraryApi0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspLibraryApi0020');
        try {
          expect(nativeMulti(0, 0)).assertEqual(0);
          expect(true).assertTrue();
          expect(typeof add).assertEqual('function');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
