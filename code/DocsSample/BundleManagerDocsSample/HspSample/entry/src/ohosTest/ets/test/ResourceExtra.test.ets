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

export default function resourceExtraTest(): void {
  describe('HspResourceExtraTest', () => {
    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA_0100
     * @tc.name      testHspResourceExtra0001
     * @tc.desc      Verify extra HSP description resource 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA_0200
     * @tc.name      testHspResourceExtra0002
     * @tc.desc      Verify extra HSP picture resource 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA_0300
     * @tc.name      testHspResourceExtra0003
     * @tc.desc      Verify extra HSP picture resource 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA_0400
     * @tc.name      testHspResourceExtra0004
     * @tc.desc      Verify extra HSP description resource 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA_0500
     * @tc.name      testHspResourceExtra0005
     * @tc.desc      Verify extra HSP picture resource 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA_0600
     * @tc.name      testHspResourceExtra0006
     * @tc.desc      Verify extra HSP picture resource 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA_0700
     * @tc.name      testHspResourceExtra0007
     * @tc.desc      Verify extra HSP description resource 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA_0800
     * @tc.name      testHspResourceExtra0008
     * @tc.desc      Verify extra HSP picture resource 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA_0900
     * @tc.name      testHspResourceExtra0009
     * @tc.desc      Verify extra HSP picture resource 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.number    SUB_BUNDLEMANAGER_HSP_RESOURCE_EXTRA_1000
     * @tc.name      testHspResourceExtra0010
     * @tc.desc      Verify extra HSP description resource 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspResourceExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
