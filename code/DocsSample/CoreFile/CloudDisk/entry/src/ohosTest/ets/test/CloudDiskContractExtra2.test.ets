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

export default function cloudDiskContractExtra2Test(): void {
  describe('CloudDiskContractExtra2Test', () => {
    beforeAll(async () => {
      const appContext = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      API_BASE = appContext.filesDir + '/clouddisk_extra3';
      if (!fs.accessSync(API_BASE)) {
        fs.mkdirSync(API_BASE);
      }
    });
    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_0100
     * @tc.name      testCloudDiskContractExtra20001
     * @tc.desc      Verify change result fields case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20001');
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 1, 5);
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
          expect(changes === null || changes === undefined || typeof changes.isEof === 'boolean').assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_0200
     * @tc.name      testCloudDiskContractExtra20002
     * @tc.desc      Verify change result fields case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20002');
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 2, 5);
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
          expect(changes === null || changes === undefined || typeof changes.isEof === 'boolean').assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_0300
     * @tc.name      testCloudDiskContractExtra20003
     * @tc.desc      Verify change result fields case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20003');
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 3, 5);
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
          expect(changes === null || changes === undefined || typeof changes.isEof === 'boolean').assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_0400
     * @tc.name      testCloudDiskContractExtra20004
     * @tc.desc      Verify change result fields case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20004');
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 4, 5);
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
          expect(changes === null || changes === undefined || typeof changes.isEof === 'boolean').assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_0500
     * @tc.name      testCloudDiskContractExtra20005
     * @tc.desc      Verify change result fields case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20005');
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 5, 5);
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
          expect(changes === null || changes === undefined || typeof changes.isEof === 'boolean').assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_0600
     * @tc.name      testCloudDiskContractExtra20006
     * @tc.desc      Verify change result fields case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20006');
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 6, 5);
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
          expect(changes === null || changes === undefined || typeof changes.isEof === 'boolean').assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_0700
     * @tc.name      testCloudDiskContractExtra20007
     * @tc.desc      Verify change result fields case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20007');
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 7, 5);
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
          expect(changes === null || changes === undefined || typeof changes.isEof === 'boolean').assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_0800
     * @tc.name      testCloudDiskContractExtra20008
     * @tc.desc      Verify change result fields case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20008');
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 8, 5);
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
          expect(changes === null || changes === undefined || typeof changes.isEof === 'boolean').assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_0900
     * @tc.name      testCloudDiskContractExtra20009
     * @tc.desc      Verify change result fields case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20009');
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 9, 5);
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
          expect(changes === null || changes === undefined || typeof changes.isEof === 'boolean').assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_1000
     * @tc.name      testCloudDiskContractExtra20010
     * @tc.desc      Verify change result fields case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20010');
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 10, 5);
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
          expect(changes === null || changes === undefined || typeof changes.isEof === 'boolean').assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_1100
     * @tc.name      testCloudDiskContractExtra20011
     * @tc.desc      Verify callback request key contract 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20011');
        try {
          const key: number = cloudDisk.getCallbackReqKey();
          const version: number = cloudDisk.getCallbackReqKeyVersion();
          expect(key).assertEqual(0);
          expect(version >= 0).assertTrue();
          expect(typeof version).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_1200
     * @tc.name      testCloudDiskContractExtra20012
     * @tc.desc      Verify callback request key contract 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20012');
        try {
          const key: number = cloudDisk.getCallbackReqKey();
          const version: number = cloudDisk.getCallbackReqKeyVersion();
          expect(key).assertEqual(0);
          expect(version >= 0).assertTrue();
          expect(typeof version).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_1300
     * @tc.name      testCloudDiskContractExtra20013
     * @tc.desc      Verify callback request key contract 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20013');
        try {
          const key: number = cloudDisk.getCallbackReqKey();
          const version: number = cloudDisk.getCallbackReqKeyVersion();
          expect(key).assertEqual(0);
          expect(version >= 0).assertTrue();
          expect(typeof version).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_1400
     * @tc.name      testCloudDiskContractExtra20014
     * @tc.desc      Verify callback request key contract 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20014');
        try {
          const key: number = cloudDisk.getCallbackReqKey();
          const version: number = cloudDisk.getCallbackReqKeyVersion();
          expect(key).assertEqual(0);
          expect(version >= 0).assertTrue();
          expect(typeof version).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_1500
     * @tc.name      testCloudDiskContractExtra20015
     * @tc.desc      Verify callback request key contract 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20015');
        try {
          const key: number = cloudDisk.getCallbackReqKey();
          const version: number = cloudDisk.getCallbackReqKeyVersion();
          expect(key).assertEqual(0);
          expect(version >= 0).assertTrue();
          expect(typeof version).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_1600
     * @tc.name      testCloudDiskContractExtra20016
     * @tc.desc      Verify callback request key contract 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20016');
        try {
          const key: number = cloudDisk.getCallbackReqKey();
          const version: number = cloudDisk.getCallbackReqKeyVersion();
          expect(key).assertEqual(0);
          expect(version >= 0).assertTrue();
          expect(typeof version).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_1700
     * @tc.name      testCloudDiskContractExtra20017
     * @tc.desc      Verify callback request key contract 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20017');
        try {
          const key: number = cloudDisk.getCallbackReqKey();
          const version: number = cloudDisk.getCallbackReqKeyVersion();
          expect(key).assertEqual(0);
          expect(version >= 0).assertTrue();
          expect(typeof version).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_1800
     * @tc.name      testCloudDiskContractExtra20018
     * @tc.desc      Verify callback request key contract 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20018');
        try {
          const key: number = cloudDisk.getCallbackReqKey();
          const version: number = cloudDisk.getCallbackReqKeyVersion();
          expect(key).assertEqual(0);
          expect(version >= 0).assertTrue();
          expect(typeof version).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_1900
     * @tc.name      testCloudDiskContractExtra20019
     * @tc.desc      Verify callback request key contract 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20019');
        try {
          const key: number = cloudDisk.getCallbackReqKey();
          const version: number = cloudDisk.getCallbackReqKeyVersion();
          expect(key).assertEqual(0);
          expect(version >= 0).assertTrue();
          expect(typeof version).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA2_2000
     * @tc.name      testCloudDiskContractExtra20020
     * @tc.desc      Verify callback request key contract 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra20020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testCloudDiskContractExtra20020');
        try {
          const key: number = cloudDisk.getCallbackReqKey();
          const version: number = cloudDisk.getCallbackReqKeyVersion();
          expect(key).assertEqual(0);
          expect(version >= 0).assertTrue();
          expect(typeof version).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
