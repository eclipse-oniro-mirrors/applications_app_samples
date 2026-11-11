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

export default function resourceExtra2Test(): void {
  describe('HspResourceExtra2Test', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA2_0100
     * @tc.name      testHspResourceExtra20001
     * @tc.desc      Verify resource identity case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra20001');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(resource.id === resource.id).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA2_0200
     * @tc.name      testHspResourceExtra20002
     * @tc.desc      Verify resource identity case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra20002');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(resource.id === resource.id).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA2_0300
     * @tc.name      testHspResourceExtra20003
     * @tc.desc      Verify resource identity case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra20003');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(resource.id === resource.id).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA2_0400
     * @tc.name      testHspResourceExtra20004
     * @tc.desc      Verify resource identity case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra20004');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(resource.id === resource.id).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA2_0500
     * @tc.name      testHspResourceExtra20005
     * @tc.desc      Verify resource identity case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra20005');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(resource.id === resource.id).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA2_0600
     * @tc.name      testHspResourceExtra20006
     * @tc.desc      Verify resource identity case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra20006');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(resource.id === resource.id).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA2_0700
     * @tc.name      testHspResourceExtra20007
     * @tc.desc      Verify resource identity case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra20007');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(resource.id === resource.id).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA2_0800
     * @tc.name      testHspResourceExtra20008
     * @tc.desc      Verify resource identity case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra20008');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(resource.id === resource.id).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA2_0900
     * @tc.name      testHspResourceExtra20009
     * @tc.desc      Verify resource identity case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra20009');
        try {
          const resource: Resource = ResManager.getPic();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(resource.id === resource.id).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA2_1000
     * @tc.name      testHspResourceExtra20010
     * @tc.desc      Verify resource identity case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspResourceExtra20010');
        try {
          const resource: Resource = ResManager.getDesc();
          expect(resource.id > 0).assertTrue();
          expect(String(resource.moduleName)).assertEqual('library');
          expect(resource.id === resource.id).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
