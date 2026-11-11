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

export default function resourceContractTest(): void {
  describe('HspResourceContractTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_0100
     * @tc.name      testHspResourceContract0001
     * @tc.desc      Verify HSP picture resource contract 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceContract0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceContract0001');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource !== null).assertTrue();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_0200
     * @tc.name      testHspResourceContract0002
     * @tc.desc      Verify HSP description resource contract 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceContract0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceContract0002');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource !== null).assertTrue();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_0300
     * @tc.name      testHspResourceContract0003
     * @tc.desc      Verify HSP picture resource contract 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceContract0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceContract0003');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource !== null).assertTrue();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_0400
     * @tc.name      testHspResourceContract0004
     * @tc.desc      Verify HSP description resource contract 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceContract0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceContract0004');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource !== null).assertTrue();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_0500
     * @tc.name      testHspResourceContract0005
     * @tc.desc      Verify HSP picture resource contract 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceContract0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceContract0005');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource !== null).assertTrue();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_0600
     * @tc.name      testHspResourceContract0006
     * @tc.desc      Verify HSP description resource contract 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceContract0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceContract0006');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource !== null).assertTrue();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_0700
     * @tc.name      testHspResourceContract0007
     * @tc.desc      Verify HSP picture resource contract 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceContract0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceContract0007');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource !== null).assertTrue();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_0800
     * @tc.name      testHspResourceContract0008
     * @tc.desc      Verify HSP description resource contract 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceContract0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceContract0008');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource !== null).assertTrue();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_0900
     * @tc.name      testHspResourceContract0009
     * @tc.desc      Verify HSP picture resource contract 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceContract0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceContract0009');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource !== null).assertTrue();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_1000
     * @tc.name      testHspResourceContract0010
     * @tc.desc      Verify HSP description resource contract 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceContract0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceContract0010');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource !== null).assertTrue();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
