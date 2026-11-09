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
import cloudDisk, { ChangesResult, ResultList, SyncFolder, IsPlaceholderResult } from 'libentry.so';

let API_BASE: string;

export default function cloudDiskContractExtraTest(): void {
  describe('CloudDiskContractExtraTest', () => {
    beforeAll(async () => {
      const appContext = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      API_BASE = appContext.filesDir + '/clouddisk_contract_extra';
      if (!fs.accessSync(API_BASE)) {
        fs.mkdirSync(API_BASE);
      }
    });
    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_0100
     * @tc.name      testCloudDiskContractExtra0001
     * @tc.desc      Verify empty sync folder list contract 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const folders: SyncFolder[] = cloudDisk.getAllSyncFolder();
          expect(Array.isArray(folders)).assertTrue();
          expect(folders.length).assertEqual(0);
          expect(folders !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_0200
     * @tc.name      testCloudDiskContractExtra0002
     * @tc.desc      Verify empty sync folder list contract 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const folders: SyncFolder[] = cloudDisk.getAllSyncFolder();
          expect(Array.isArray(folders)).assertTrue();
          expect(folders.length).assertEqual(0);
          expect(folders !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_0300
     * @tc.name      testCloudDiskContractExtra0003
     * @tc.desc      Verify empty sync folder list contract 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const folders: SyncFolder[] = cloudDisk.getAllSyncFolder();
          expect(Array.isArray(folders)).assertTrue();
          expect(folders.length).assertEqual(0);
          expect(folders !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_0400
     * @tc.name      testCloudDiskContractExtra0004
     * @tc.desc      Verify empty sync folder list contract 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const folders: SyncFolder[] = cloudDisk.getAllSyncFolder();
          expect(Array.isArray(folders)).assertTrue();
          expect(folders.length).assertEqual(0);
          expect(folders !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_0500
     * @tc.name      testCloudDiskContractExtra0005
     * @tc.desc      Verify empty sync folder list contract 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const folders: SyncFolder[] = cloudDisk.getAllSyncFolder();
          expect(Array.isArray(folders)).assertTrue();
          expect(folders.length).assertEqual(0);
          expect(folders !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_0600
     * @tc.name      testCloudDiskContractExtra0006
     * @tc.desc      Verify empty sync folder list contract 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const folders: SyncFolder[] = cloudDisk.getAllSyncFolder();
          expect(Array.isArray(folders)).assertTrue();
          expect(folders.length).assertEqual(0);
          expect(folders !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_0700
     * @tc.name      testCloudDiskContractExtra0007
     * @tc.desc      Verify empty sync folder list contract 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const folders: SyncFolder[] = cloudDisk.getAllSyncFolder();
          expect(Array.isArray(folders)).assertTrue();
          expect(folders.length).assertEqual(0);
          expect(folders !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_0800
     * @tc.name      testCloudDiskContractExtra0008
     * @tc.desc      Verify empty sync folder list contract 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const folders: SyncFolder[] = cloudDisk.getAllSyncFolder();
          expect(Array.isArray(folders)).assertTrue();
          expect(folders.length).assertEqual(0);
          expect(folders !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_0900
     * @tc.name      testCloudDiskContractExtra0009
     * @tc.desc      Verify empty sync folder list contract 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const folders: SyncFolder[] = cloudDisk.getAllSyncFolder();
          expect(Array.isArray(folders)).assertTrue();
          expect(folders.length).assertEqual(0);
          expect(folders !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_1000
     * @tc.name      testCloudDiskContractExtra0010
     * @tc.desc      Verify empty sync folder list contract 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const folders: SyncFolder[] = cloudDisk.getAllSyncFolder();
          expect(Array.isArray(folders)).assertTrue();
          expect(folders.length).assertEqual(0);
          expect(folders !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_1100
     * @tc.name      testCloudDiskContractExtra0011
     * @tc.desc      Verify change query contract 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 1, 10);
          expect(changes === null || changes === undefined || changes.changesData.length === 0).assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_1200
     * @tc.name      testCloudDiskContractExtra0012
     * @tc.desc      Verify change query contract 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 2, 10);
          expect(changes === null || changes === undefined || changes.changesData.length === 0).assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_1300
     * @tc.name      testCloudDiskContractExtra0013
     * @tc.desc      Verify change query contract 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 3, 10);
          expect(changes === null || changes === undefined || changes.changesData.length === 0).assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_1400
     * @tc.name      testCloudDiskContractExtra0014
     * @tc.desc      Verify change query contract 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 4, 10);
          expect(changes === null || changes === undefined || changes.changesData.length === 0).assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_1500
     * @tc.name      testCloudDiskContractExtra0015
     * @tc.desc      Verify change query contract 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 5, 10);
          expect(changes === null || changes === undefined || changes.changesData.length === 0).assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_1600
     * @tc.name      testCloudDiskContractExtra0016
     * @tc.desc      Verify change query contract 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 6, 10);
          expect(changes === null || changes === undefined || changes.changesData.length === 0).assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_1700
     * @tc.name      testCloudDiskContractExtra0017
     * @tc.desc      Verify change query contract 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 7, 10);
          expect(changes === null || changes === undefined || changes.changesData.length === 0).assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_1800
     * @tc.name      testCloudDiskContractExtra0018
     * @tc.desc      Verify change query contract 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 8, 10);
          expect(changes === null || changes === undefined || changes.changesData.length === 0).assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_1900
     * @tc.name      testCloudDiskContractExtra0019
     * @tc.desc      Verify change query contract 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 9, 10);
          expect(changes === null || changes === undefined || changes.changesData.length === 0).assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_2000
     * @tc.name      testCloudDiskContractExtra0020
     * @tc.desc      Verify change query contract 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 10, 10);
          expect(changes === null || changes === undefined || changes.changesData.length === 0).assertTrue();
          expect(changes === null || changes === undefined || Array.isArray(changes.changesData)).assertTrue();
          expect(changes === null || changes === undefined || typeof changes.nextUsn === 'number').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_2100
     * @tc.name      testCloudDiskContractExtra0021
     * @tc.desc      Verify file sync state query contract 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const states: ResultList[] = cloudDisk.getFileSyncStates(API_BASE, 1, ['a.txt']);
          expect(states === null || states === undefined || Array.isArray(states)).assertTrue();
          expect(states === null || states === undefined || states.length === 0).assertTrue();
          expect(states === null || states === undefined || typeof states === 'object').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_2200
     * @tc.name      testCloudDiskContractExtra0022
     * @tc.desc      Verify file sync state query contract 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const states: ResultList[] = cloudDisk.getFileSyncStates(API_BASE, 2, ['a.txt']);
          expect(states === null || states === undefined || Array.isArray(states)).assertTrue();
          expect(states === null || states === undefined || states.length === 0).assertTrue();
          expect(states === null || states === undefined || typeof states === 'object').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_2300
     * @tc.name      testCloudDiskContractExtra0023
     * @tc.desc      Verify file sync state query contract 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const states: ResultList[] = cloudDisk.getFileSyncStates(API_BASE, 3, ['a.txt']);
          expect(states === null || states === undefined || Array.isArray(states)).assertTrue();
          expect(states === null || states === undefined || states.length === 0).assertTrue();
          expect(states === null || states === undefined || typeof states === 'object').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_2400
     * @tc.name      testCloudDiskContractExtra0024
     * @tc.desc      Verify file sync state query contract 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const states: ResultList[] = cloudDisk.getFileSyncStates(API_BASE, 4, ['a.txt']);
          expect(states === null || states === undefined || Array.isArray(states)).assertTrue();
          expect(states === null || states === undefined || states.length === 0).assertTrue();
          expect(states === null || states === undefined || typeof states === 'object').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_2500
     * @tc.name      testCloudDiskContractExtra0025
     * @tc.desc      Verify file sync state query contract 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const states: ResultList[] = cloudDisk.getFileSyncStates(API_BASE, 5, ['a.txt']);
          expect(states === null || states === undefined || Array.isArray(states)).assertTrue();
          expect(states === null || states === undefined || states.length === 0).assertTrue();
          expect(states === null || states === undefined || typeof states === 'object').assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_2600
     * @tc.name      testCloudDiskContractExtra0026
     * @tc.desc      Verify placeholder query result contract 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: IsPlaceholderResult = cloudDisk.isPlaceholderFile(API_BASE, 'a1.txt');
          expect(result.code !== 0).assertTrue();
          expect(result.isPlaceholder).assertFalse();
          expect(typeof result.code).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_2700
     * @tc.name      testCloudDiskContractExtra0027
     * @tc.desc      Verify placeholder query result contract 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: IsPlaceholderResult = cloudDisk.isPlaceholderFile(API_BASE, 'a2.txt');
          expect(result.code !== 0).assertTrue();
          expect(result.isPlaceholder).assertFalse();
          expect(typeof result.code).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_2800
     * @tc.name      testCloudDiskContractExtra0028
     * @tc.desc      Verify placeholder query result contract 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: IsPlaceholderResult = cloudDisk.isPlaceholderFile(API_BASE, 'a3.txt');
          expect(result.code !== 0).assertTrue();
          expect(result.isPlaceholder).assertFalse();
          expect(typeof result.code).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_2900
     * @tc.name      testCloudDiskContractExtra0029
     * @tc.desc      Verify placeholder query result contract 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: IsPlaceholderResult = cloudDisk.isPlaceholderFile(API_BASE, 'a4.txt');
          expect(result.code !== 0).assertTrue();
          expect(result.isPlaceholder).assertFalse();
          expect(typeof result.code).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_CONTRACT_EXTRA_3000
     * @tc.name      testCloudDiskContractExtra0030
     * @tc.desc      Verify placeholder query result contract 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskContractExtra0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const result: IsPlaceholderResult = cloudDisk.isPlaceholderFile(API_BASE, 'a5.txt');
          expect(result.code !== 0).assertTrue();
          expect(result.isPlaceholder).assertFalse();
          expect(typeof result.code).assertEqual('number');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
