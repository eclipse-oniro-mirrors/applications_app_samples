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
import cloudDisk, { CustomInfoResult, IsPlaceholderResult, PlaceholderStateResult } from 'libentry.so';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

let API_BASE: string;

export default function cloudDiskApiExtra2Test(): void {
  describe('CloudDiskApiExtra2Test', () => {
    beforeAll(async () => {
      const appContext = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      API_BASE = appContext.filesDir + '/clouddisk_api_extra2';
      if (!fs.accessSync(API_BASE)) {
        fs.mkdirSync(API_BASE);
      }
    });
    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_0100
     * @tc.name      testCloudDiskApiExtra20001
     * @tc.desc      Verify isPlaceholderFile relative path variant 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20001');
        try {
          const result = cloudDisk.isPlaceholderFile(API_BASE, 'a.txt');
          expect(result.code !== 0).assertTrue();
          expect(typeof result.code).assertEqual('number');
          expect(result !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_0200
     * @tc.name      testCloudDiskApiExtra20002
     * @tc.desc      Verify isPlaceholderFile relative path variant 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20002');
        try {
          const result = cloudDisk.isPlaceholderFile(API_BASE, '中文.txt');
          expect(result.code !== 0).assertTrue();
          expect(typeof result.code).assertEqual('number');
          expect(result !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_0300
     * @tc.name      testCloudDiskApiExtra20003
     * @tc.desc      Verify isPlaceholderFile relative path variant 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20003');
        try {
          const result = cloudDisk.isPlaceholderFile(API_BASE, 'folder/a.txt');
          expect(result.code !== 0).assertTrue();
          expect(typeof result.code).assertEqual('number');
          expect(result !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_0400
     * @tc.name      testCloudDiskApiExtra20004
     * @tc.desc      Verify isPlaceholderFile relative path variant 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20004');
        try {
          const result = cloudDisk.isPlaceholderFile(API_BASE, '');
          expect(result.code !== 0).assertTrue();
          expect(typeof result.code).assertEqual('number');
          expect(result !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_0500
     * @tc.name      testCloudDiskApiExtra20005
     * @tc.desc      Verify isPlaceholderFile relative path variant 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20005');
        try {
          const result = cloudDisk.isPlaceholderFile(API_BASE, 'a b.txt');
          expect(result.code !== 0).assertTrue();
          expect(typeof result.code).assertEqual('number');
          expect(result !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_0600
     * @tc.name      testCloudDiskApiExtra20006
     * @tc.desc      Verify getPlaceholderState relative path variant 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20006');
        try {
          const result = cloudDisk.getPlaceholderState(API_BASE, 'a.txt');
          expect(result.code !== 0).assertTrue();
          expect(typeof result.code).assertEqual('number');
          expect(result !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_0700
     * @tc.name      testCloudDiskApiExtra20007
     * @tc.desc      Verify getPlaceholderState relative path variant 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20007');
        try {
          const result = cloudDisk.getPlaceholderState(API_BASE, '中文.txt');
          expect(result.code !== 0).assertTrue();
          expect(typeof result.code).assertEqual('number');
          expect(result !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_0800
     * @tc.name      testCloudDiskApiExtra20008
     * @tc.desc      Verify getPlaceholderState relative path variant 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20008');
        try {
          const result = cloudDisk.getPlaceholderState(API_BASE, 'folder/a.txt');
          expect(result.code !== 0).assertTrue();
          expect(typeof result.code).assertEqual('number');
          expect(result !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_0900
     * @tc.name      testCloudDiskApiExtra20009
     * @tc.desc      Verify getPlaceholderState relative path variant 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20009');
        try {
          const result = cloudDisk.getPlaceholderState(API_BASE, '');
          expect(result.code !== 0).assertTrue();
          expect(typeof result.code).assertEqual('number');
          expect(result !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_1000
     * @tc.name      testCloudDiskApiExtra20010
     * @tc.desc      Verify getPlaceholderState relative path variant 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20010');
        try {
          const result = cloudDisk.getPlaceholderState(API_BASE, 'a b.txt');
          expect(result.code !== 0).assertTrue();
          expect(typeof result.code).assertEqual('number');
          expect(result !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_1100
     * @tc.name      testCloudDiskApiExtra20011
     * @tc.desc      Verify updatePlaceholder relative path variant 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20011');
        try {
          const code: number = cloudDisk.updatePlaceholder(API_BASE, 'a.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_1200
     * @tc.name      testCloudDiskApiExtra20012
     * @tc.desc      Verify updatePlaceholder relative path variant 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20012');
        try {
          const code: number = cloudDisk.updatePlaceholder(API_BASE, '中文.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_1300
     * @tc.name      testCloudDiskApiExtra20013
     * @tc.desc      Verify updatePlaceholder relative path variant 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20013');
        try {
          const code: number = cloudDisk.updatePlaceholder(API_BASE, 'folder/a.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_1400
     * @tc.name      testCloudDiskApiExtra20014
     * @tc.desc      Verify updatePlaceholder relative path variant 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20014');
        try {
          const code: number = cloudDisk.updatePlaceholder(API_BASE, '', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_1500
     * @tc.name      testCloudDiskApiExtra20015
     * @tc.desc      Verify updatePlaceholder relative path variant 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20015');
        try {
          const code: number = cloudDisk.updatePlaceholder(API_BASE, 'a b.txt', 1, 2, 3, 'meta');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_1600
     * @tc.name      testCloudDiskApiExtra20016
     * @tc.desc      Verify convertPlaceholderToFile relative path variant 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20016');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_1700
     * @tc.name      testCloudDiskApiExtra20017
     * @tc.desc      Verify convertPlaceholderToFile relative path variant 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20017');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile(API_BASE, '中文.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_1800
     * @tc.name      testCloudDiskApiExtra20018
     * @tc.desc      Verify convertPlaceholderToFile relative path variant 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20018');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile(API_BASE, 'folder/a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_1900
     * @tc.name      testCloudDiskApiExtra20019
     * @tc.desc      Verify convertPlaceholderToFile relative path variant 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20019');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile(API_BASE, '');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_2000
     * @tc.name      testCloudDiskApiExtra20020
     * @tc.desc      Verify convertPlaceholderToFile relative path variant 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20020');
        try {
          const code: number = cloudDisk.convertPlaceholderToFile(API_BASE, 'a b.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_2100
     * @tc.name      testCloudDiskApiExtra20021
     * @tc.desc      Verify markFileAsPlaceholder relative path variant 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20021');
        try {
          const code: number = cloudDisk.markFileAsPlaceholder(API_BASE, 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_2200
     * @tc.name      testCloudDiskApiExtra20022
     * @tc.desc      Verify markFileAsPlaceholder relative path variant 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20022');
        try {
          const code: number = cloudDisk.markFileAsPlaceholder(API_BASE, '中文.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_2300
     * @tc.name      testCloudDiskApiExtra20023
     * @tc.desc      Verify markFileAsPlaceholder relative path variant 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20023');
        try {
          const code: number = cloudDisk.markFileAsPlaceholder(API_BASE, 'folder/a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_2400
     * @tc.name      testCloudDiskApiExtra20024
     * @tc.desc      Verify markFileAsPlaceholder relative path variant 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20024');
        try {
          const code: number = cloudDisk.markFileAsPlaceholder(API_BASE, '');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_2500
     * @tc.name      testCloudDiskApiExtra20025
     * @tc.desc      Verify markFileAsPlaceholder relative path variant 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20025');
        try {
          const code: number = cloudDisk.markFileAsPlaceholder(API_BASE, 'a b.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_2600
     * @tc.name      testCloudDiskApiExtra20026
     * @tc.desc      Verify unmarkPlaceholderFile relative path variant 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20026');
        try {
          const code: number = cloudDisk.unmarkPlaceholderFile(API_BASE, 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_2700
     * @tc.name      testCloudDiskApiExtra20027
     * @tc.desc      Verify unmarkPlaceholderFile relative path variant 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20027');
        try {
          const code: number = cloudDisk.unmarkPlaceholderFile(API_BASE, '中文.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_2800
     * @tc.name      testCloudDiskApiExtra20028
     * @tc.desc      Verify unmarkPlaceholderFile relative path variant 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20028');
        try {
          const code: number = cloudDisk.unmarkPlaceholderFile(API_BASE, 'folder/a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_2900
     * @tc.name      testCloudDiskApiExtra20029
     * @tc.desc      Verify unmarkPlaceholderFile relative path variant 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20029');
        try {
          const code: number = cloudDisk.unmarkPlaceholderFile(API_BASE, '');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_3000
     * @tc.name      testCloudDiskApiExtra20030
     * @tc.desc      Verify unmarkPlaceholderFile relative path variant 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20030');
        try {
          const code: number = cloudDisk.unmarkPlaceholderFile(API_BASE, 'a b.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_3100
     * @tc.name      testCloudDiskApiExtra20031
     * @tc.desc      Verify getPlaceholderCustomInfo relative path variant 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20031');
        try {
          const result: CustomInfoResult = cloudDisk.getPlaceholderCustomInfo(API_BASE, 'a.txt');
          expect(result.code !== 0).assertTrue();
          expect(result.dataLength).assertEqual(0);
          expect(typeof result.code).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_3200
     * @tc.name      testCloudDiskApiExtra20032
     * @tc.desc      Verify getPlaceholderCustomInfo relative path variant 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20032');
        try {
          const result: CustomInfoResult = cloudDisk.getPlaceholderCustomInfo(API_BASE, '中文.txt');
          expect(result.code !== 0).assertTrue();
          expect(result.dataLength).assertEqual(0);
          expect(typeof result.code).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_3300
     * @tc.name      testCloudDiskApiExtra20033
     * @tc.desc      Verify getPlaceholderCustomInfo relative path variant 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20033');
        try {
          const result: CustomInfoResult = cloudDisk.getPlaceholderCustomInfo(API_BASE, 'folder/a.txt');
          expect(result.code !== 0).assertTrue();
          expect(result.dataLength).assertEqual(0);
          expect(typeof result.code).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_3400
     * @tc.name      testCloudDiskApiExtra20034
     * @tc.desc      Verify getPlaceholderCustomInfo relative path variant 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20034');
        try {
          const result: CustomInfoResult = cloudDisk.getPlaceholderCustomInfo(API_BASE, '');
          expect(result.code !== 0).assertTrue();
          expect(result.dataLength).assertEqual(0);
          expect(typeof result.code).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_3500
     * @tc.name      testCloudDiskApiExtra20035
     * @tc.desc      Verify getPlaceholderCustomInfo relative path variant 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20035');
        try {
          const result: CustomInfoResult = cloudDisk.getPlaceholderCustomInfo(API_BASE, 'a b.txt');
          expect(result.code !== 0).assertTrue();
          expect(result.dataLength).assertEqual(0);
          expect(typeof result.code).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_3600
     * @tc.name      testCloudDiskApiExtra20036
     * @tc.desc      Verify dehydrateFile relative path variant 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20036');
        try {
          const code: number = cloudDisk.dehydrateFile(API_BASE, 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_3700
     * @tc.name      testCloudDiskApiExtra20037
     * @tc.desc      Verify dehydrateFile relative path variant 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20037');
        try {
          const code: number = cloudDisk.dehydrateFile(API_BASE, '中文.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_3800
     * @tc.name      testCloudDiskApiExtra20038
     * @tc.desc      Verify dehydrateFile relative path variant 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20038');
        try {
          const code: number = cloudDisk.dehydrateFile(API_BASE, 'folder/a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_3900
     * @tc.name      testCloudDiskApiExtra20039
     * @tc.desc      Verify dehydrateFile relative path variant 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20039');
        try {
          const code: number = cloudDisk.dehydrateFile(API_BASE, '');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_4000
     * @tc.name      testCloudDiskApiExtra20040
     * @tc.desc      Verify dehydrateFile relative path variant 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20040');
        try {
          const code: number = cloudDisk.dehydrateFile(API_BASE, 'a b.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_4100
     * @tc.name      testCloudDiskApiExtra20041
     * @tc.desc      Verify hydratePlaceholder relative path variant 41.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20041');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_4200
     * @tc.name      testCloudDiskApiExtra20042
     * @tc.desc      Verify hydratePlaceholder relative path variant 42.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20042');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, '中文.txt', 0);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_4300
     * @tc.name      testCloudDiskApiExtra20043
     * @tc.desc      Verify hydratePlaceholder relative path variant 43.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20043');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, 'folder/a.txt', 0);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_4400
     * @tc.name      testCloudDiskApiExtra20044
     * @tc.desc      Verify hydratePlaceholder relative path variant 44.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20044');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, '', 0);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_4500
     * @tc.name      testCloudDiskApiExtra20045
     * @tc.desc      Verify hydratePlaceholder relative path variant 45.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20045');
        try {
          const code: number = cloudDisk.hydratePlaceholder(API_BASE, 'a b.txt', 0);
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_4600
     * @tc.name      testCloudDiskApiExtra20046
     * @tc.desc      Verify registerCallbackTable relative path variant 46.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20046');
        try {
          const code: number = cloudDisk.registerCallbackTable(API_BASE, 'a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_4700
     * @tc.name      testCloudDiskApiExtra20047
     * @tc.desc      Verify registerCallbackTable relative path variant 47.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20047');
        try {
          const code: number = cloudDisk.registerCallbackTable(API_BASE, '中文.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_4800
     * @tc.name      testCloudDiskApiExtra20048
     * @tc.desc      Verify registerCallbackTable relative path variant 48.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20048');
        try {
          const code: number = cloudDisk.registerCallbackTable(API_BASE, 'folder/a.txt');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_4900
     * @tc.name      testCloudDiskApiExtra20049
     * @tc.desc      Verify registerCallbackTable relative path variant 49.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20049');
        try {
          const code: number = cloudDisk.registerCallbackTable(API_BASE, '');
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
     * @tc.number    SUB_CLOUD_DISK_API_EXTRA2_5000
     * @tc.name      testCloudDiskApiExtra20050
     * @tc.desc      Verify registerCallbackTable relative path variant 50.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskApiExtra20050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskApiExtra20050');
        try {
          const code: number = cloudDisk.registerCallbackTable(API_BASE, 'a b.txt');
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
