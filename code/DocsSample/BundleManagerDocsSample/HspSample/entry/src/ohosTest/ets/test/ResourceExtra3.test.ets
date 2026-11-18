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
import { ResManager } from 'library';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

export default function resourceExtra3Test(): void {
  describe('HspResourceExtra3Test', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA3_0100
     * @tc.name      testHspResourceExtra30001
     * @tc.desc      Verify final resource contract 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra30001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra30001');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(String(resource.bundleName).length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA3_0200
     * @tc.name      testHspResourceExtra30002
     * @tc.desc      Verify final resource contract 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra30002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra30002');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(String(resource.bundleName).length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA3_0300
     * @tc.name      testHspResourceExtra30003
     * @tc.desc      Verify final resource contract 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra30003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra30003');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(String(resource.bundleName).length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA3_0400
     * @tc.name      testHspResourceExtra30004
     * @tc.desc      Verify final resource contract 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra30004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra30004');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(String(resource.bundleName).length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA3_0500
     * @tc.name      testHspResourceExtra30005
     * @tc.desc      Verify final resource contract 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra30005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra30005');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(String(resource.bundleName).length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA3_0600
     * @tc.name      testHspResourceExtra30006
     * @tc.desc      Verify final resource contract 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra30006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra30006');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(String(resource.bundleName).length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA3_0700
     * @tc.name      testHspResourceExtra30007
     * @tc.desc      Verify final resource contract 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra30007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra30007');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(String(resource.bundleName).length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA3_0800
     * @tc.name      testHspResourceExtra30008
     * @tc.desc      Verify final resource contract 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra30008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra30008');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(String(resource.bundleName).length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA3_0900
     * @tc.name      testHspResourceExtra30009
     * @tc.desc      Verify final resource contract 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra30009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra30009');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(String(resource.bundleName).length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA3_1000
     * @tc.name      testHspResourceExtra30010
     * @tc.desc      Verify final resource contract 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra30010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra30010');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(String(resource.bundleName).length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
