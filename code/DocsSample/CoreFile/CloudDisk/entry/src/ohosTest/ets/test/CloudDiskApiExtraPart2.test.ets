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

export default function cloudDiskApiExtraTestPart2(): void {
  describe('CloudDiskApiExtraTestPart2', () => {
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
    it('testCloudDiskApiExtra0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0050');
        try {
          const code: number = cloudDisk.updateDisplayName('C:/cloud/path', 'alias10');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_5100
     * @tc.name      testCloudDiskApiExtra0051
     * @tc.desc      Verify registerSyncFolderChange path variant 1 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0051');
        try {
          const code: number = cloudDisk.registerSyncFolderChange(API_BASE);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_5200
     * @tc.name      testCloudDiskApiExtra0052
     * @tc.desc      Verify registerSyncFolderChange path variant 2 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0052');
        try {
          const code: number = cloudDisk.registerSyncFolderChange(API_BASE + '/sub');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_5300
     * @tc.name      testCloudDiskApiExtra0053
     * @tc.desc      Verify registerSyncFolderChange path variant 3 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0053');
        try {
          const code: number = cloudDisk.registerSyncFolderChange(API_BASE + '/中文');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_5400
     * @tc.name      testCloudDiskApiExtra0054
     * @tc.desc      Verify registerSyncFolderChange path variant 4 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0054');
        try {
          const code: number = cloudDisk.registerSyncFolderChange('/');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_5500
     * @tc.name      testCloudDiskApiExtra0055
     * @tc.desc      Verify registerSyncFolderChange path variant 5 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0055');
        try {
          const code: number = cloudDisk.registerSyncFolderChange('');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_5600
     * @tc.name      testCloudDiskApiExtra0056
     * @tc.desc      Verify registerSyncFolderChange path variant 6 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0056');
        try {
          const code: number = cloudDisk.registerSyncFolderChange('relative/path');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_5700
     * @tc.name      testCloudDiskApiExtra0057
     * @tc.desc      Verify registerSyncFolderChange path variant 7 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0057');
        try {
          const code: number = cloudDisk.registerSyncFolderChange('../escape');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_5800
     * @tc.name      testCloudDiskApiExtra0058
     * @tc.desc      Verify registerSyncFolderChange path variant 8 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0058');
        try {
          const code: number = cloudDisk.registerSyncFolderChange(API_BASE + ' with space');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_5900
     * @tc.name      testCloudDiskApiExtra0059
     * @tc.desc      Verify registerSyncFolderChange path variant 9 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0059');
        try {
          const code: number = cloudDisk.registerSyncFolderChange('file://cloud/path');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_6000
     * @tc.name      testCloudDiskApiExtra0060
     * @tc.desc      Verify registerSyncFolderChange path variant 10 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0060');
        try {
          const code: number = cloudDisk.registerSyncFolderChange('C:/cloud/path');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_6100
     * @tc.name      testCloudDiskApiExtra0061
     * @tc.desc      Verify unRegisterSyncFolderChange path variant 1 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0061');
        try {
          const code: number = cloudDisk.unRegisterSyncFolderChange(API_BASE);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_6200
     * @tc.name      testCloudDiskApiExtra0062
     * @tc.desc      Verify unRegisterSyncFolderChange path variant 2 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0062');
        try {
          const code: number = cloudDisk.unRegisterSyncFolderChange(API_BASE + '/sub');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_6300
     * @tc.name      testCloudDiskApiExtra0063
     * @tc.desc      Verify unRegisterSyncFolderChange path variant 3 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0063');
        try {
          const code: number = cloudDisk.unRegisterSyncFolderChange(API_BASE + '/中文');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_6400
     * @tc.name      testCloudDiskApiExtra0064
     * @tc.desc      Verify unRegisterSyncFolderChange path variant 4 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0064');
        try {
          const code: number = cloudDisk.unRegisterSyncFolderChange('/');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_6500
     * @tc.name      testCloudDiskApiExtra0065
     * @tc.desc      Verify unRegisterSyncFolderChange path variant 5 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0065');
        try {
          const code: number = cloudDisk.unRegisterSyncFolderChange('');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_6600
     * @tc.name      testCloudDiskApiExtra0066
     * @tc.desc      Verify unRegisterSyncFolderChange path variant 6 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0066');
        try {
          const code: number = cloudDisk.unRegisterSyncFolderChange('relative/path');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_6700
     * @tc.name      testCloudDiskApiExtra0067
     * @tc.desc      Verify unRegisterSyncFolderChange path variant 7 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0067');
        try {
          const code: number = cloudDisk.unRegisterSyncFolderChange('../escape');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_6800
     * @tc.name      testCloudDiskApiExtra0068
     * @tc.desc      Verify unRegisterSyncFolderChange path variant 8 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0068');
        try {
          const code: number = cloudDisk.unRegisterSyncFolderChange(API_BASE + ' with space');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_6900
     * @tc.name      testCloudDiskApiExtra0069
     * @tc.desc      Verify unRegisterSyncFolderChange path variant 9 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0069');
        try {
          const code: number = cloudDisk.unRegisterSyncFolderChange('file://cloud/path');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_7000
     * @tc.name      testCloudDiskApiExtra0070
     * @tc.desc      Verify unRegisterSyncFolderChange path variant 10 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0070');
        try {
          const code: number = cloudDisk.unRegisterSyncFolderChange('C:/cloud/path');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_7100
     * @tc.name      testCloudDiskApiExtra0071
     * @tc.desc      Verify createPlaceholderFile path variant 1 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0071');
        try {
          const code: number = cloudDisk.createPlaceholderFile(API_BASE, 'a.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_7200
     * @tc.name      testCloudDiskApiExtra0072
     * @tc.desc      Verify createPlaceholderFile path variant 2 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0072');
        try {
          const code: number = cloudDisk.createPlaceholderFile(API_BASE + '/sub', 'a.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_7300
     * @tc.name      testCloudDiskApiExtra0073
     * @tc.desc      Verify createPlaceholderFile path variant 3 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0073');
        try {
          const code: number = cloudDisk.createPlaceholderFile(API_BASE + '/中文', 'a.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_7400
     * @tc.name      testCloudDiskApiExtra0074
     * @tc.desc      Verify createPlaceholderFile path variant 4 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0074');
        try {
          const code: number = cloudDisk.createPlaceholderFile('/', 'a.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_7500
     * @tc.name      testCloudDiskApiExtra0075
     * @tc.desc      Verify createPlaceholderFile path variant 5 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0075');
        try {
          const code: number = cloudDisk.createPlaceholderFile('', 'a.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_7600
     * @tc.name      testCloudDiskApiExtra0076
     * @tc.desc      Verify createPlaceholderFile path variant 6 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0076');
        try {
          const code: number = cloudDisk.createPlaceholderFile('relative/path', 'a.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_7700
     * @tc.name      testCloudDiskApiExtra0077
     * @tc.desc      Verify createPlaceholderFile path variant 7 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0077');
        try {
          const code: number = cloudDisk.createPlaceholderFile('../escape', 'a.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_7800
     * @tc.name      testCloudDiskApiExtra0078
     * @tc.desc      Verify createPlaceholderFile path variant 8 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0078');
        try {
          const code: number = cloudDisk.createPlaceholderFile(API_BASE + ' with space', 'a.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_7900
     * @tc.name      testCloudDiskApiExtra0079
     * @tc.desc      Verify createPlaceholderFile path variant 9 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0079');
        try {
          const code: number = cloudDisk.createPlaceholderFile('file://cloud/path', 'a.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_8000
     * @tc.name      testCloudDiskApiExtra0080
     * @tc.desc      Verify createPlaceholderFile path variant 10 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0080');
        try {
          const code: number = cloudDisk.createPlaceholderFile('C:/cloud/path', 'a.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_8100
     * @tc.name      testCloudDiskApiExtra0081
     * @tc.desc      Verify updatePlaceholder path variant 1 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0081');
        try {
          const code: number = cloudDisk.updatePlaceholder(API_BASE, 'a.txt', 2, 3, 4, 'meta2');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_8200
     * @tc.name      testCloudDiskApiExtra0082
     * @tc.desc      Verify updatePlaceholder path variant 2 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0082');
        try {
          const code: number = cloudDisk.updatePlaceholder(API_BASE + '/sub', 'a.txt', 2, 3, 4, 'meta2');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_8300
     * @tc.name      testCloudDiskApiExtra0083
     * @tc.desc      Verify updatePlaceholder path variant 3 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0083');
        try {
          const code: number = cloudDisk.updatePlaceholder(API_BASE + '/中文', 'a.txt', 2, 3, 4, 'meta2');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_8400
     * @tc.name      testCloudDiskApiExtra0084
     * @tc.desc      Verify updatePlaceholder path variant 4 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0084');
        try {
          const code: number = cloudDisk.updatePlaceholder('/', 'a.txt', 2, 3, 4, 'meta2');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_8500
     * @tc.name      testCloudDiskApiExtra0085
     * @tc.desc      Verify updatePlaceholder path variant 5 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0085');
        try {
          const code: number = cloudDisk.updatePlaceholder('', 'a.txt', 2, 3, 4, 'meta2');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_8600
     * @tc.name      testCloudDiskApiExtra0086
     * @tc.desc      Verify updatePlaceholder path variant 6 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0086');
        try {
          const code: number = cloudDisk.updatePlaceholder('relative/path', 'a.txt', 2, 3, 4, 'meta2');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_8700
     * @tc.name      testCloudDiskApiExtra0087
     * @tc.desc      Verify updatePlaceholder path variant 7 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0087');
        try {
          const code: number = cloudDisk.updatePlaceholder('../escape', 'a.txt', 2, 3, 4, 'meta2');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_8800
     * @tc.name      testCloudDiskApiExtra0088
     * @tc.desc      Verify updatePlaceholder path variant 8 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0088');
        try {
          const code: number = cloudDisk.updatePlaceholder(API_BASE + ' with space', 'a.txt', 2, 3, 4, 'meta2');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_8900
     * @tc.name      testCloudDiskApiExtra0089
     * @tc.desc      Verify updatePlaceholder path variant 9 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0089');
        try {
          const code: number = cloudDisk.updatePlaceholder('file://cloud/path', 'a.txt', 2, 3, 4, 'meta2');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_9000
     * @tc.name      testCloudDiskApiExtra0090
     * @tc.desc      Verify updatePlaceholder path variant 10 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0090');
        try {
          const code: number = cloudDisk.updatePlaceholder('C:/cloud/path', 'a.txt', 2, 3, 4, 'meta2');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_9100
     * @tc.name      testCloudDiskApiExtra0091
     * @tc.desc      Verify convertPlaceholderToFile path variant 1 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0091');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile(API_BASE, 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_9200
     * @tc.name      testCloudDiskApiExtra0092
     * @tc.desc      Verify convertPlaceholderToFile path variant 2 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0092');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile(API_BASE + '/sub', 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_9300
     * @tc.name      testCloudDiskApiExtra0093
     * @tc.desc      Verify convertPlaceholderToFile path variant 3 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0093');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile(API_BASE + '/中文', 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_9400
     * @tc.name      testCloudDiskApiExtra0094
     * @tc.desc      Verify convertPlaceholderToFile path variant 4 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0094',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0094');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile('/', 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_9500
     * @tc.name      testCloudDiskApiExtra0095
     * @tc.desc      Verify convertPlaceholderToFile path variant 5 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0095',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0095');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile('', 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_9600
     * @tc.name      testCloudDiskApiExtra0096
     * @tc.desc      Verify convertPlaceholderToFile path variant 6 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0096',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0096');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile('relative/path', 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_9700
     * @tc.name      testCloudDiskApiExtra0097
     * @tc.desc      Verify convertPlaceholderToFile path variant 7 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0097',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0097');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile('../escape', 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_9800
     * @tc.name      testCloudDiskApiExtra0098
     * @tc.desc      Verify convertPlaceholderToFile path variant 8 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0098',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0098');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile(API_BASE + ' with space', 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_9900
     * @tc.name      testCloudDiskApiExtra0099
     * @tc.desc      Verify convertPlaceholderToFile path variant 9 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0099',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0099');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile('file://cloud/path', 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA_10000
     * @tc.name      testCloudDiskApiExtra0100
     * @tc.desc      Verify convertPlaceholderToFile path variant 10 returns a non-zero code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra0100');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile('C:/cloud/path', 'a.txt');
          expect(code !== 0).assertTrue();
          expect(typeof code).assertEqual('number');
          expect(code >= 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
