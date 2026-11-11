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

import { describe, expect, it, Level, Size, TestType, beforeAll } from '@ohos/hypium';
import { abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import cloudDisk from 'libentry.so';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

let API_BASE: string;

export default function cloudDiskApiExtraTest(): void {
  describe('CloudDiskApiExtraTest', () => {
    beforeAll(async () => {
      const appContext = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      API_BASE = appContext.filesDir + '/clouddisk_api_extra';
      if (!fs.accessSync(API_BASE)) {
        fs.mkdirSync(API_BASE);
      }
    });
    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_0100
     * @tc.name      testCloudDiskApiExtra0001
     * @tc.desc      Verify registerSyncFolder path variant 1 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0001');
        try {
          const code: number = cloudDisk.registerSyncFolder(API_BASE, 'alias1');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_0200
     * @tc.name      testCloudDiskApiExtra0002
     * @tc.desc      Verify registerSyncFolder path variant 2 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0002');
        try {
          const code: number = cloudDisk.registerSyncFolder(API_BASE + '/sub', 'alias2');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_0300
     * @tc.name      testCloudDiskApiExtra0003
     * @tc.desc      Verify registerSyncFolder path variant 3 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0003');
        try {
          const code: number = cloudDisk.registerSyncFolder(API_BASE + '/中文', 'alias3');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_0400
     * @tc.name      testCloudDiskApiExtra0004
     * @tc.desc      Verify registerSyncFolder path variant 4 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0004');
        try {
          const code: number = cloudDisk.registerSyncFolder('/', 'alias4');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_0500
     * @tc.name      testCloudDiskApiExtra0005
     * @tc.desc      Verify registerSyncFolder path variant 5 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0005');
        try {
          const code: number = cloudDisk.registerSyncFolder('', 'alias5');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_0600
     * @tc.name      testCloudDiskApiExtra0006
     * @tc.desc      Verify registerSyncFolder path variant 6 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0006');
        try {
          const code: number = cloudDisk.registerSyncFolder('relative/path', 'alias6');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_0700
     * @tc.name      testCloudDiskApiExtra0007
     * @tc.desc      Verify registerSyncFolder path variant 7 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0007');
        try {
          const code: number = cloudDisk.registerSyncFolder('../escape', 'alias7');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_0800
     * @tc.name      testCloudDiskApiExtra0008
     * @tc.desc      Verify registerSyncFolder path variant 8 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0008');
        try {
          const code: number = cloudDisk.registerSyncFolder(API_BASE + ' with space', 'alias8');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_0900
     * @tc.name      testCloudDiskApiExtra0009
     * @tc.desc      Verify registerSyncFolder path variant 9 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0009');
        try {
          const code: number = cloudDisk.registerSyncFolder('file://cloud/path', 'alias9');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_1000
     * @tc.name      testCloudDiskApiExtra0010
     * @tc.desc      Verify registerSyncFolder path variant 10 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0010');
        try {
          const code: number = cloudDisk.registerSyncFolder('C:/cloud/path', 'alias10');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_1100
     * @tc.name      testCloudDiskApiExtra0011
     * @tc.desc      Verify unRegisterSyncFolder path variant 1 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0011');
        try {
          const code: number = cloudDisk.unRegisterSyncFolder(API_BASE);
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_1200
     * @tc.name      testCloudDiskApiExtra0012
     * @tc.desc      Verify unRegisterSyncFolder path variant 2 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0012');
        try {
          const code: number = cloudDisk.unRegisterSyncFolder(API_BASE + '/sub');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_1300
     * @tc.name      testCloudDiskApiExtra0013
     * @tc.desc      Verify unRegisterSyncFolder path variant 3 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0013');
        try {
          const code: number = cloudDisk.unRegisterSyncFolder(API_BASE + '/中文');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_1400
     * @tc.name      testCloudDiskApiExtra0014
     * @tc.desc      Verify unRegisterSyncFolder path variant 4 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0014');
        try {
          const code: number = cloudDisk.unRegisterSyncFolder('/');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_1500
     * @tc.name      testCloudDiskApiExtra0015
     * @tc.desc      Verify unRegisterSyncFolder path variant 5 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0015');
        try {
          const code: number = cloudDisk.unRegisterSyncFolder('');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_1600
     * @tc.name      testCloudDiskApiExtra0016
     * @tc.desc      Verify unRegisterSyncFolder path variant 6 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0016');
        try {
          const code: number = cloudDisk.unRegisterSyncFolder('relative/path');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_1700
     * @tc.name      testCloudDiskApiExtra0017
     * @tc.desc      Verify unRegisterSyncFolder path variant 7 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0017');
        try {
          const code: number = cloudDisk.unRegisterSyncFolder('../escape');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_1800
     * @tc.name      testCloudDiskApiExtra0018
     * @tc.desc      Verify unRegisterSyncFolder path variant 8 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0018');
        try {
          const code: number = cloudDisk.unRegisterSyncFolder(API_BASE + ' with space');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_1900
     * @tc.name      testCloudDiskApiExtra0019
     * @tc.desc      Verify unRegisterSyncFolder path variant 9 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0019');
        try {
          const code: number = cloudDisk.unRegisterSyncFolder('file://cloud/path');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_2000
     * @tc.name      testCloudDiskApiExtra0020
     * @tc.desc      Verify unRegisterSyncFolder path variant 10 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0020');
        try {
          const code: number = cloudDisk.unRegisterSyncFolder('C:/cloud/path');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_2100
     * @tc.name      testCloudDiskApiExtra0021
     * @tc.desc      Verify activeSyncFolder path variant 1 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0021');
        try {
          const code: number = cloudDisk.activeSyncFolder(API_BASE);
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_2200
     * @tc.name      testCloudDiskApiExtra0022
     * @tc.desc      Verify activeSyncFolder path variant 2 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0022');
        try {
          const code: number = cloudDisk.activeSyncFolder(API_BASE + '/sub');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_2300
     * @tc.name      testCloudDiskApiExtra0023
     * @tc.desc      Verify activeSyncFolder path variant 3 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0023');
        try {
          const code: number = cloudDisk.activeSyncFolder(API_BASE + '/中文');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_2400
     * @tc.name      testCloudDiskApiExtra0024
     * @tc.desc      Verify activeSyncFolder path variant 4 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0024');
        try {
          const code: number = cloudDisk.activeSyncFolder('/');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_2500
     * @tc.name      testCloudDiskApiExtra0025
     * @tc.desc      Verify activeSyncFolder path variant 5 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0025');
        try {
          const code: number = cloudDisk.activeSyncFolder('');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_2600
     * @tc.name      testCloudDiskApiExtra0026
     * @tc.desc      Verify activeSyncFolder path variant 6 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0026');
        try {
          const code: number = cloudDisk.activeSyncFolder('relative/path');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_2700
     * @tc.name      testCloudDiskApiExtra0027
     * @tc.desc      Verify activeSyncFolder path variant 7 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0027');
        try {
          const code: number = cloudDisk.activeSyncFolder('../escape');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_2800
     * @tc.name      testCloudDiskApiExtra0028
     * @tc.desc      Verify activeSyncFolder path variant 8 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0028');
        try {
          const code: number = cloudDisk.activeSyncFolder(API_BASE + ' with space');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_2900
     * @tc.name      testCloudDiskApiExtra0029
     * @tc.desc      Verify activeSyncFolder path variant 9 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0029');
        try {
          const code: number = cloudDisk.activeSyncFolder('file://cloud/path');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_3000
     * @tc.name      testCloudDiskApiExtra0030
     * @tc.desc      Verify activeSyncFolder path variant 10 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0030');
        try {
          const code: number = cloudDisk.activeSyncFolder('C:/cloud/path');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_3100
     * @tc.name      testCloudDiskApiExtra0031
     * @tc.desc      Verify deactiveSyncFolder path variant 1 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0031');
        try {
          const code: number = cloudDisk.deactiveSyncFolder(API_BASE);
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_3200
     * @tc.name      testCloudDiskApiExtra0032
     * @tc.desc      Verify deactiveSyncFolder path variant 2 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0032');
        try {
          const code: number = cloudDisk.deactiveSyncFolder(API_BASE + '/sub');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_3300
     * @tc.name      testCloudDiskApiExtra0033
     * @tc.desc      Verify deactiveSyncFolder path variant 3 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0033');
        try {
          const code: number = cloudDisk.deactiveSyncFolder(API_BASE + '/中文');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_3400
     * @tc.name      testCloudDiskApiExtra0034
     * @tc.desc      Verify deactiveSyncFolder path variant 4 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0034');
        try {
          const code: number = cloudDisk.deactiveSyncFolder('/');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_3500
     * @tc.name      testCloudDiskApiExtra0035
     * @tc.desc      Verify deactiveSyncFolder path variant 5 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0035');
        try {
          const code: number = cloudDisk.deactiveSyncFolder('');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_3600
     * @tc.name      testCloudDiskApiExtra0036
     * @tc.desc      Verify deactiveSyncFolder path variant 6 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0036');
        try {
          const code: number = cloudDisk.deactiveSyncFolder('relative/path');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_3700
     * @tc.name      testCloudDiskApiExtra0037
     * @tc.desc      Verify deactiveSyncFolder path variant 7 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0037');
        try {
          const code: number = cloudDisk.deactiveSyncFolder('../escape');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_3800
     * @tc.name      testCloudDiskApiExtra0038
     * @tc.desc      Verify deactiveSyncFolder path variant 8 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0038');
        try {
          const code: number = cloudDisk.deactiveSyncFolder(API_BASE + ' with space');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_3900
     * @tc.name      testCloudDiskApiExtra0039
     * @tc.desc      Verify deactiveSyncFolder path variant 9 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0039');
        try {
          const code: number = cloudDisk.deactiveSyncFolder('file://cloud/path');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_4000
     * @tc.name      testCloudDiskApiExtra0040
     * @tc.desc      Verify deactiveSyncFolder path variant 10 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0040');
        try {
          const code: number = cloudDisk.deactiveSyncFolder('C:/cloud/path');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_4100
     * @tc.name      testCloudDiskApiExtra0041
     * @tc.desc      Verify updateDisplayName path variant 1 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0041');
        try {
          const code: number = cloudDisk.updateDisplayName(API_BASE, 'alias1');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_4200
     * @tc.name      testCloudDiskApiExtra0042
     * @tc.desc      Verify updateDisplayName path variant 2 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0042');
        try {
          const code: number = cloudDisk.updateDisplayName(API_BASE + '/sub', 'alias2');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_4300
     * @tc.name      testCloudDiskApiExtra0043
     * @tc.desc      Verify updateDisplayName path variant 3 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0043');
        try {
          const code: number = cloudDisk.updateDisplayName(API_BASE + '/中文', 'alias3');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_4400
     * @tc.name      testCloudDiskApiExtra0044
     * @tc.desc      Verify updateDisplayName path variant 4 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0044');
        try {
          const code: number = cloudDisk.updateDisplayName('/', 'alias4');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_4500
     * @tc.name      testCloudDiskApiExtra0045
     * @tc.desc      Verify updateDisplayName path variant 5 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0045');
        try {
          const code: number = cloudDisk.updateDisplayName('', 'alias5');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_4600
     * @tc.name      testCloudDiskApiExtra0046
     * @tc.desc      Verify updateDisplayName path variant 6 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0046');
        try {
          const code: number = cloudDisk.updateDisplayName('relative/path', 'alias6');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_4700
     * @tc.name      testCloudDiskApiExtra0047
     * @tc.desc      Verify updateDisplayName path variant 7 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0047');
        try {
          const code: number = cloudDisk.updateDisplayName('../escape', 'alias7');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_4800
     * @tc.name      testCloudDiskApiExtra0048
     * @tc.desc      Verify updateDisplayName path variant 8 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0048');
        try {
          const code: number = cloudDisk.updateDisplayName(API_BASE + ' with space', 'alias8');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_4900
     * @tc.name      testCloudDiskApiExtra0049
     * @tc.desc      Verify updateDisplayName path variant 9 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0049');
        try {
          const code: number = cloudDisk.updateDisplayName('file://cloud/path', 'alias9');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_5000
     * @tc.name      testCloudDiskApiExtra0050
     * @tc.desc      Verify updateDisplayName path variant 10 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
  });
}
