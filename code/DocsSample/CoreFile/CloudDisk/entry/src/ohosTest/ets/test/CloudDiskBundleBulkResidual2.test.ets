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
import { BundleInfo, getBundleInfo } from '../../../main/ets/common/Utils';

export default function cloudDiskBundleBulkResidual2Test(): void {
  describe('CloudDiskBundleBulkResidual2Test', () => {
    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0001
     * @tc.name      testCloudDiskBundleBulkResidual2_0001
     * @tc.desc      Verify bundle bulk2 contract case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info !== undefined).assertTrue();
          expect(info.bundleName).assertEqual('com.cloud.disk001');
          expect(info.abilityName).assertEqual('EntryAbility');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0002
     * @tc.name      testCloudDiskBundleBulkResidual2_0002
     * @tc.desc      Verify bundle bulk2 contract case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName === info.abilityName).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0003
     * @tc.name      testCloudDiskBundleBulkResidual2_0003
     * @tc.desc      Verify bundle bulk2 contract case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.startsWith('com.')).assertTrue();
          expect(info.bundleName.split('.').length).assertEqual(3);
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0004
     * @tc.name      testCloudDiskBundleBulkResidual2_0004
     * @tc.desc      Verify bundle bulk2 contract case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.abilityName.includes('.')).assertFalse();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0005
     * @tc.name      testCloudDiskBundleBulkResidual2_0005
     * @tc.desc      Verify bundle bulk2 contract case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(typeof info.bundleName).assertEqual('string');
          expect(typeof info.abilityName).assertEqual('string');
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0006
     * @tc.name      testCloudDiskBundleBulkResidual2_0006
     * @tc.desc      Verify bundle bulk2 contract case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.trim()).assertEqual(info.bundleName);
          expect(info.abilityName.trim()).assertEqual(info.abilityName);
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0007
     * @tc.name      testCloudDiskBundleBulkResidual2_0007
     * @tc.desc      Verify bundle bulk2 contract case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.includes('cloud')).assertTrue();
          expect(info.abilityName.endsWith('Ability')).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0008
     * @tc.name      testCloudDiskBundleBulkResidual2_0008
     * @tc.desc      Verify bundle bulk2 contract case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          const json: string = JSON.stringify(info);
          expect(json.includes('bundleName')).assertTrue();
          expect(json.includes('abilityName')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0009
     * @tc.name      testCloudDiskBundleBulkResidual2_0009
     * @tc.desc      Verify bundle bulk2 contract case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info !== undefined).assertTrue();
          expect(info.bundleName).assertEqual('com.cloud.disk001');
          expect(info.abilityName).assertEqual('EntryAbility');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0010
     * @tc.name      testCloudDiskBundleBulkResidual2_0010
     * @tc.desc      Verify bundle bulk2 contract case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName === info.abilityName).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0011
     * @tc.name      testCloudDiskBundleBulkResidual2_0011
     * @tc.desc      Verify bundle bulk2 contract case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.startsWith('com.')).assertTrue();
          expect(info.bundleName.split('.').length).assertEqual(3);
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0012
     * @tc.name      testCloudDiskBundleBulkResidual2_0012
     * @tc.desc      Verify bundle bulk2 contract case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.abilityName.includes('.')).assertFalse();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0013
     * @tc.name      testCloudDiskBundleBulkResidual2_0013
     * @tc.desc      Verify bundle bulk2 contract case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(typeof info.bundleName).assertEqual('string');
          expect(typeof info.abilityName).assertEqual('string');
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0014
     * @tc.name      testCloudDiskBundleBulkResidual2_0014
     * @tc.desc      Verify bundle bulk2 contract case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.trim()).assertEqual(info.bundleName);
          expect(info.abilityName.trim()).assertEqual(info.abilityName);
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0015
     * @tc.name      testCloudDiskBundleBulkResidual2_0015
     * @tc.desc      Verify bundle bulk2 contract case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.includes('cloud')).assertTrue();
          expect(info.abilityName.endsWith('Ability')).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0016
     * @tc.name      testCloudDiskBundleBulkResidual2_0016
     * @tc.desc      Verify bundle bulk2 contract case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          const json: string = JSON.stringify(info);
          expect(json.includes('bundleName')).assertTrue();
          expect(json.includes('abilityName')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0017
     * @tc.name      testCloudDiskBundleBulkResidual2_0017
     * @tc.desc      Verify bundle bulk2 contract case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info !== undefined).assertTrue();
          expect(info.bundleName).assertEqual('com.cloud.disk001');
          expect(info.abilityName).assertEqual('EntryAbility');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0018
     * @tc.name      testCloudDiskBundleBulkResidual2_0018
     * @tc.desc      Verify bundle bulk2 contract case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName === info.abilityName).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0019
     * @tc.name      testCloudDiskBundleBulkResidual2_0019
     * @tc.desc      Verify bundle bulk2 contract case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.startsWith('com.')).assertTrue();
          expect(info.bundleName.split('.').length).assertEqual(3);
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0020
     * @tc.name      testCloudDiskBundleBulkResidual2_0020
     * @tc.desc      Verify bundle bulk2 contract case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.abilityName.includes('.')).assertFalse();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0021
     * @tc.name      testCloudDiskBundleBulkResidual2_0021
     * @tc.desc      Verify bundle bulk2 contract case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(typeof info.bundleName).assertEqual('string');
          expect(typeof info.abilityName).assertEqual('string');
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0022
     * @tc.name      testCloudDiskBundleBulkResidual2_0022
     * @tc.desc      Verify bundle bulk2 contract case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.trim()).assertEqual(info.bundleName);
          expect(info.abilityName.trim()).assertEqual(info.abilityName);
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0023
     * @tc.name      testCloudDiskBundleBulkResidual2_0023
     * @tc.desc      Verify bundle bulk2 contract case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.includes('cloud')).assertTrue();
          expect(info.abilityName.endsWith('Ability')).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0024
     * @tc.name      testCloudDiskBundleBulkResidual2_0024
     * @tc.desc      Verify bundle bulk2 contract case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          const json: string = JSON.stringify(info);
          expect(json.includes('bundleName')).assertTrue();
          expect(json.includes('abilityName')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0025
     * @tc.name      testCloudDiskBundleBulkResidual2_0025
     * @tc.desc      Verify bundle bulk2 contract case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info !== undefined).assertTrue();
          expect(info.bundleName).assertEqual('com.cloud.disk001');
          expect(info.abilityName).assertEqual('EntryAbility');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0026
     * @tc.name      testCloudDiskBundleBulkResidual2_0026
     * @tc.desc      Verify bundle bulk2 contract case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName === info.abilityName).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0027
     * @tc.name      testCloudDiskBundleBulkResidual2_0027
     * @tc.desc      Verify bundle bulk2 contract case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.startsWith('com.')).assertTrue();
          expect(info.bundleName.split('.').length).assertEqual(3);
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0028
     * @tc.name      testCloudDiskBundleBulkResidual2_0028
     * @tc.desc      Verify bundle bulk2 contract case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.abilityName.includes('.')).assertFalse();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0029
     * @tc.name      testCloudDiskBundleBulkResidual2_0029
     * @tc.desc      Verify bundle bulk2 contract case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(typeof info.bundleName).assertEqual('string');
          expect(typeof info.abilityName).assertEqual('string');
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0030
     * @tc.name      testCloudDiskBundleBulkResidual2_0030
     * @tc.desc      Verify bundle bulk2 contract case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.trim()).assertEqual(info.bundleName);
          expect(info.abilityName.trim()).assertEqual(info.abilityName);
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0031
     * @tc.name      testCloudDiskBundleBulkResidual2_0031
     * @tc.desc      Verify bundle bulk2 contract case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.includes('cloud')).assertTrue();
          expect(info.abilityName.endsWith('Ability')).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0032
     * @tc.name      testCloudDiskBundleBulkResidual2_0032
     * @tc.desc      Verify bundle bulk2 contract case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          const json: string = JSON.stringify(info);
          expect(json.includes('bundleName')).assertTrue();
          expect(json.includes('abilityName')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0033
     * @tc.name      testCloudDiskBundleBulkResidual2_0033
     * @tc.desc      Verify bundle bulk2 contract case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info !== undefined).assertTrue();
          expect(info.bundleName).assertEqual('com.cloud.disk001');
          expect(info.abilityName).assertEqual('EntryAbility');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0034
     * @tc.name      testCloudDiskBundleBulkResidual2_0034
     * @tc.desc      Verify bundle bulk2 contract case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName === info.abilityName).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0035
     * @tc.name      testCloudDiskBundleBulkResidual2_0035
     * @tc.desc      Verify bundle bulk2 contract case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.startsWith('com.')).assertTrue();
          expect(info.bundleName.split('.').length).assertEqual(3);
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0036
     * @tc.name      testCloudDiskBundleBulkResidual2_0036
     * @tc.desc      Verify bundle bulk2 contract case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.abilityName.includes('.')).assertFalse();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0037
     * @tc.name      testCloudDiskBundleBulkResidual2_0037
     * @tc.desc      Verify bundle bulk2 contract case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(typeof info.bundleName).assertEqual('string');
          expect(typeof info.abilityName).assertEqual('string');
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0038
     * @tc.name      testCloudDiskBundleBulkResidual2_0038
     * @tc.desc      Verify bundle bulk2 contract case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.trim()).assertEqual(info.bundleName);
          expect(info.abilityName.trim()).assertEqual(info.abilityName);
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0039
     * @tc.name      testCloudDiskBundleBulkResidual2_0039
     * @tc.desc      Verify bundle bulk2 contract case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.includes('cloud')).assertTrue();
          expect(info.abilityName.endsWith('Ability')).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0040
     * @tc.name      testCloudDiskBundleBulkResidual2_0040
     * @tc.desc      Verify bundle bulk2 contract case 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          const json: string = JSON.stringify(info);
          expect(json.includes('bundleName')).assertTrue();
          expect(json.includes('abilityName')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0041
     * @tc.name      testCloudDiskBundleBulkResidual2_0041
     * @tc.desc      Verify bundle bulk2 contract case 41.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info !== undefined).assertTrue();
          expect(info.bundleName).assertEqual('com.cloud.disk001');
          expect(info.abilityName).assertEqual('EntryAbility');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0042
     * @tc.name      testCloudDiskBundleBulkResidual2_0042
     * @tc.desc      Verify bundle bulk2 contract case 42.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName === info.abilityName).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0043
     * @tc.name      testCloudDiskBundleBulkResidual2_0043
     * @tc.desc      Verify bundle bulk2 contract case 43.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.startsWith('com.')).assertTrue();
          expect(info.bundleName.split('.').length).assertEqual(3);
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0044
     * @tc.name      testCloudDiskBundleBulkResidual2_0044
     * @tc.desc      Verify bundle bulk2 contract case 44.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.abilityName.includes('.')).assertFalse();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0045
     * @tc.name      testCloudDiskBundleBulkResidual2_0045
     * @tc.desc      Verify bundle bulk2 contract case 45.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(typeof info.bundleName).assertEqual('string');
          expect(typeof info.abilityName).assertEqual('string');
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0046
     * @tc.name      testCloudDiskBundleBulkResidual2_0046
     * @tc.desc      Verify bundle bulk2 contract case 46.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.trim()).assertEqual(info.bundleName);
          expect(info.abilityName.trim()).assertEqual(info.abilityName);
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0047
     * @tc.name      testCloudDiskBundleBulkResidual2_0047
     * @tc.desc      Verify bundle bulk2 contract case 47.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.includes('cloud')).assertTrue();
          expect(info.abilityName.endsWith('Ability')).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0048
     * @tc.name      testCloudDiskBundleBulkResidual2_0048
     * @tc.desc      Verify bundle bulk2 contract case 48.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          const json: string = JSON.stringify(info);
          expect(json.includes('bundleName')).assertTrue();
          expect(json.includes('abilityName')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0049
     * @tc.name      testCloudDiskBundleBulkResidual2_0049
     * @tc.desc      Verify bundle bulk2 contract case 49.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info !== undefined).assertTrue();
          expect(info.bundleName).assertEqual('com.cloud.disk001');
          expect(info.abilityName).assertEqual('EntryAbility');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0050
     * @tc.name      testCloudDiskBundleBulkResidual2_0050
     * @tc.desc      Verify bundle bulk2 contract case 50.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName === info.abilityName).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0051
     * @tc.name      testCloudDiskBundleBulkResidual2_0051
     * @tc.desc      Verify bundle bulk2 contract case 51.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.startsWith('com.')).assertTrue();
          expect(info.bundleName.split('.').length).assertEqual(3);
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0052
     * @tc.name      testCloudDiskBundleBulkResidual2_0052
     * @tc.desc      Verify bundle bulk2 contract case 52.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.abilityName.includes('.')).assertFalse();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0053
     * @tc.name      testCloudDiskBundleBulkResidual2_0053
     * @tc.desc      Verify bundle bulk2 contract case 53.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName === info.abilityName).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0054
     * @tc.name      testCloudDiskBundleBulkResidual2_0054
     * @tc.desc      Verify bundle bulk2 contract case 54.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName === info.abilityName).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK2_0055
     * @tc.name      testCloudDiskBundleBulkResidual2_0055
     * @tc.desc      Verify bundle bulk2 contract case 55.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual2_0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName === info.abilityName).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
