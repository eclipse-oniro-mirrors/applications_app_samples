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
import cloudDisk, { ChangesResult, FileSyncState, ResultList } from 'libentry.so';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

let API_BASE: string;

export default function cloudDiskApiExtra3Test(): void {
  describe('CloudDiskApiExtra3Test', () => {
    beforeAll(async () => {
      const appContext = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      API_BASE = appContext.filesDir + '/clouddisk_extra3';
      if (!fs.accessSync(API_BASE)) {
        fs.mkdirSync(API_BASE);
      }
    });
    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_0100
     * @tc.name      testCloudDiskApiExtra30001
     * @tc.desc      Verify execute parameter combination 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30001');
        try {
          const code: number = cloudDisk.execute(1, 1, API_BASE, 'a.txt', 'content', 1, 2, true, 2);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_0200
     * @tc.name      testCloudDiskApiExtra30002
     * @tc.desc      Verify execute parameter combination 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30002');
        try {
          const code: number = cloudDisk.execute(2, 2, API_BASE, 'a.txt', 'content', 2, 3, true, 3);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_0300
     * @tc.name      testCloudDiskApiExtra30003
     * @tc.desc      Verify execute parameter combination 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30003');
        try {
          const code: number = cloudDisk.execute(0, 3, API_BASE, 'a.txt', 'content', 3, 4, true, 4);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_0400
     * @tc.name      testCloudDiskApiExtra30004
     * @tc.desc      Verify execute parameter combination 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30004');
        try {
          const code: number = cloudDisk.execute(1, 4, API_BASE, 'a.txt', 'content', 4, 5, true, 5);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_0500
     * @tc.name      testCloudDiskApiExtra30005
     * @tc.desc      Verify execute parameter combination 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30005');
        try {
          const code: number = cloudDisk.execute(2, 5, API_BASE, 'a.txt', 'content', 5, 6, true, 6);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_0600
     * @tc.name      testCloudDiskApiExtra30006
     * @tc.desc      Verify execute parameter combination 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30006');
        try {
          const code: number = cloudDisk.execute(0, 6, API_BASE, 'a.txt', 'content', 6, 7, true, 7);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_0700
     * @tc.name      testCloudDiskApiExtra30007
     * @tc.desc      Verify execute parameter combination 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30007');
        try {
          const code: number = cloudDisk.execute(1, 7, API_BASE, 'a.txt', 'content', 7, 8, true, 8);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_0800
     * @tc.name      testCloudDiskApiExtra30008
     * @tc.desc      Verify execute parameter combination 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30008');
        try {
          const code: number = cloudDisk.execute(2, 8, API_BASE, 'a.txt', 'content', 8, 9, true, 9);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_0900
     * @tc.name      testCloudDiskApiExtra30009
     * @tc.desc      Verify execute parameter combination 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30009');
        try {
          const code: number = cloudDisk.execute(0, 9, API_BASE, 'a.txt', 'content', 9, 10, true, 10);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_1000
     * @tc.name      testCloudDiskApiExtra30010
     * @tc.desc      Verify execute parameter combination 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30010');
        try {
          const code: number = cloudDisk.execute(1, 10, API_BASE, 'a.txt', 'content', 10, 11, true, 11);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_1100
     * @tc.name      testCloudDiskApiExtra30011
     * @tc.desc      Verify empty sync state array case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30011');
        try {
          const states: FileSyncState[] = [];
          const code: number = cloudDisk.setFileSyncStates(API_BASE, 1, states);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_1200
     * @tc.name      testCloudDiskApiExtra30012
     * @tc.desc      Verify empty sync state array case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30012');
        try {
          const states: FileSyncState[] = [];
          const code: number = cloudDisk.setFileSyncStates(API_BASE, 2, states);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_1300
     * @tc.name      testCloudDiskApiExtra30013
     * @tc.desc      Verify empty sync state array case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30013');
        try {
          const states: FileSyncState[] = [];
          const code: number = cloudDisk.setFileSyncStates(API_BASE, 3, states);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_1400
     * @tc.name      testCloudDiskApiExtra30014
     * @tc.desc      Verify empty sync state array case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30014');
        try {
          const states: FileSyncState[] = [];
          const code: number = cloudDisk.setFileSyncStates(API_BASE, 4, states);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_1500
     * @tc.name      testCloudDiskApiExtra30015
     * @tc.desc      Verify empty sync state array case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30015');
        try {
          const states: FileSyncState[] = [];
          const code: number = cloudDisk.setFileSyncStates(API_BASE, 5, states);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_1600
     * @tc.name      testCloudDiskApiExtra30016
     * @tc.desc      Verify empty sync state array case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30016');
        try {
          const states: FileSyncState[] = [];
          const code: number = cloudDisk.setFileSyncStates(API_BASE, 6, states);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_1700
     * @tc.name      testCloudDiskApiExtra30017
     * @tc.desc      Verify empty sync state array case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30017');
        try {
          const states: FileSyncState[] = [];
          const code: number = cloudDisk.setFileSyncStates(API_BASE, 7, states);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_1800
     * @tc.name      testCloudDiskApiExtra30018
     * @tc.desc      Verify empty sync state array case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30018');
        try {
          const states: FileSyncState[] = [];
          const code: number = cloudDisk.setFileSyncStates(API_BASE, 8, states);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_1900
     * @tc.name      testCloudDiskApiExtra30019
     * @tc.desc      Verify empty sync state array case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30019');
        try {
          const states: FileSyncState[] = [];
          const code: number = cloudDisk.setFileSyncStates(API_BASE, 9, states);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_2000
     * @tc.name      testCloudDiskApiExtra30020
     * @tc.desc      Verify empty sync state array case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30020');
        try {
          const states: FileSyncState[] = [];
          const code: number = cloudDisk.setFileSyncStates(API_BASE, 10, states);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_2100
     * @tc.name      testCloudDiskApiExtra30021
     * @tc.desc      Verify hydrate callback parameter case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30021');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, 'a.txt', 0);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_2200
     * @tc.name      testCloudDiskApiExtra30022
     * @tc.desc      Verify hydrate callback parameter case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30022');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, 'a.txt', 1);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_2300
     * @tc.name      testCloudDiskApiExtra30023
     * @tc.desc      Verify hydrate callback parameter case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30023');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, 'a.txt', 2);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_2400
     * @tc.name      testCloudDiskApiExtra30024
     * @tc.desc      Verify hydrate callback parameter case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30024');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, 'a.txt', 3);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_2500
     * @tc.name      testCloudDiskApiExtra30025
     * @tc.desc      Verify hydrate callback parameter case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30025');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, 'a.txt', 4);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_2600
     * @tc.name      testCloudDiskApiExtra30026
     * @tc.desc      Verify hydrate callback parameter case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30026');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, 'a.txt', 5);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_2700
     * @tc.name      testCloudDiskApiExtra30027
     * @tc.desc      Verify hydrate callback parameter case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30027');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, 'a.txt', 6);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_2800
     * @tc.name      testCloudDiskApiExtra30028
     * @tc.desc      Verify hydrate callback parameter case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30028');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, 'a.txt', 7);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_2900
     * @tc.name      testCloudDiskApiExtra30029
     * @tc.desc      Verify hydrate callback parameter case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30029');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, 'a.txt', 8);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA3_3000
     * @tc.name      testCloudDiskApiExtra30030
     * @tc.desc      Verify hydrate callback parameter case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra30030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra30030');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, 'a.txt', 9);
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
