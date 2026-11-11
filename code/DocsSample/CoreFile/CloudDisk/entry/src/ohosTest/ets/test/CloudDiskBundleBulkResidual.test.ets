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
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = 'SampleTest';

export default function cloudDiskBundleBulkResidualTest(): void {
  describe('CloudDiskBundleBulkResidualTest', () => {
    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_0100
     * @tc.name      testCloudDiskBundleBulkResidual0001
     * @tc.desc      Verify bundle contract bulk case 1.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info !== undefined).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_0200
     * @tc.name      testCloudDiskBundleBulkResidual0002
     * @tc.desc      Verify bundle contract bulk case 2.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName.startsWith('com.')).assertTrue();
          expect(info.bundleName.includes('.')).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_0300
     * @tc.name      testCloudDiskBundleBulkResidual0003
     * @tc.desc      Verify bundle contract bulk case 3.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName.split('.').length).assertEqual(3);
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_0400
     * @tc.name      testCloudDiskBundleBulkResidual0004
     * @tc.desc      Verify bundle contract bulk case 4.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_0500
     * @tc.name      testCloudDiskBundleBulkResidual0005
     * @tc.desc      Verify bundle contract bulk case 5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.abilityName.includes('.')).assertFalse();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_0600
     * @tc.name      testCloudDiskBundleBulkResidual0006
     * @tc.desc      Verify bundle contract bulk case 6.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.abilityName.endsWith('Ability')).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_0700
     * @tc.name      testCloudDiskBundleBulkResidual0007
     * @tc.desc      Verify bundle contract bulk case 7.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName === info.abilityName).assertFalse();
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_0800
     * @tc.name      testCloudDiskBundleBulkResidual0008
     * @tc.desc      Verify bundle contract bulk case 8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
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
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_0900
     * @tc.name      testCloudDiskBundleBulkResidual0009
     * @tc.desc      Verify bundle contract bulk case 9.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
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
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_1000
     * @tc.name      testCloudDiskBundleBulkResidual0010
     * @tc.desc      Verify bundle contract bulk case 10.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName.includes('cloud')).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_1100
     * @tc.name      testCloudDiskBundleBulkResidual0011
     * @tc.desc      Verify bundle contract bulk case 11.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info !== undefined).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_1200
     * @tc.name      testCloudDiskBundleBulkResidual0012
     * @tc.desc      Verify bundle contract bulk case 12.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName.startsWith('com.')).assertTrue();
          expect(info.bundleName.includes('.')).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_1300
     * @tc.name      testCloudDiskBundleBulkResidual0013
     * @tc.desc      Verify bundle contract bulk case 13.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName.split('.').length).assertEqual(3);
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_1400
     * @tc.name      testCloudDiskBundleBulkResidual0014
     * @tc.desc      Verify bundle contract bulk case 14.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_1500
     * @tc.name      testCloudDiskBundleBulkResidual0015
     * @tc.desc      Verify bundle contract bulk case 15.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.abilityName.includes('.')).assertFalse();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_1600
     * @tc.name      testCloudDiskBundleBulkResidual0016
     * @tc.desc      Verify bundle contract bulk case 16.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.abilityName.endsWith('Ability')).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_1700
     * @tc.name      testCloudDiskBundleBulkResidual0017
     * @tc.desc      Verify bundle contract bulk case 17.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName === info.abilityName).assertFalse();
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_1800
     * @tc.name      testCloudDiskBundleBulkResidual0018
     * @tc.desc      Verify bundle contract bulk case 18.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
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
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_1900
     * @tc.name      testCloudDiskBundleBulkResidual0019
     * @tc.desc      Verify bundle contract bulk case 19.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
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
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_2000
     * @tc.name      testCloudDiskBundleBulkResidual0020
     * @tc.desc      Verify bundle contract bulk case 20.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName.includes('cloud')).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_2100
     * @tc.name      testCloudDiskBundleBulkResidual0021
     * @tc.desc      Verify bundle contract bulk case 21.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info !== undefined).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_2200
     * @tc.name      testCloudDiskBundleBulkResidual0022
     * @tc.desc      Verify bundle contract bulk case 22.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName.startsWith('com.')).assertTrue();
          expect(info.bundleName.includes('.')).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_2300
     * @tc.name      testCloudDiskBundleBulkResidual0023
     * @tc.desc      Verify bundle contract bulk case 23.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName.split('.').length).assertEqual(3);
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_2400
     * @tc.name      testCloudDiskBundleBulkResidual0024
     * @tc.desc      Verify bundle contract bulk case 24.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_2500
     * @tc.name      testCloudDiskBundleBulkResidual0025
     * @tc.desc      Verify bundle contract bulk case 25.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.abilityName.includes('.')).assertFalse();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_2600
     * @tc.name      testCloudDiskBundleBulkResidual0026
     * @tc.desc      Verify bundle contract bulk case 26.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.abilityName.endsWith('Ability')).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_2700
     * @tc.name      testCloudDiskBundleBulkResidual0027
     * @tc.desc      Verify bundle contract bulk case 27.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName === info.abilityName).assertFalse();
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_2800
     * @tc.name      testCloudDiskBundleBulkResidual0028
     * @tc.desc      Verify bundle contract bulk case 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
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
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_2900
     * @tc.name      testCloudDiskBundleBulkResidual0029
     * @tc.desc      Verify bundle contract bulk case 29.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
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
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_3000
     * @tc.name      testCloudDiskBundleBulkResidual0030
     * @tc.desc      Verify bundle contract bulk case 30.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName.includes('cloud')).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_3100
     * @tc.name      testCloudDiskBundleBulkResidual0031
     * @tc.desc      Verify bundle contract bulk case 31.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info !== undefined).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_3200
     * @tc.name      testCloudDiskBundleBulkResidual0032
     * @tc.desc      Verify bundle contract bulk case 32.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName.startsWith('com.')).assertTrue();
          expect(info.bundleName.includes('.')).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_3300
     * @tc.name      testCloudDiskBundleBulkResidual0033
     * @tc.desc      Verify bundle contract bulk case 33.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName.split('.').length).assertEqual(3);
          expect(info.bundleName.length > 0).assertTrue();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_3400
     * @tc.name      testCloudDiskBundleBulkResidual0034
     * @tc.desc      Verify bundle contract bulk case 34.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_3500
     * @tc.name      testCloudDiskBundleBulkResidual0035
     * @tc.desc      Verify bundle contract bulk case 35.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.abilityName.includes('.')).assertFalse();
          expect(info.abilityName.length > 0).assertTrue();
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_3600
     * @tc.name      testCloudDiskBundleBulkResidual0036
     * @tc.desc      Verify bundle contract bulk case 36.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
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
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_3700
     * @tc.name      testCloudDiskBundleBulkResidual0037
     * @tc.desc      Verify bundle contract bulk case 37.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
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
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_3800
     * @tc.name      testCloudDiskBundleBulkResidual0038
     * @tc.desc      Verify bundle contract bulk case 38.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
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
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_3900
     * @tc.name      testCloudDiskBundleBulkResidual0039
     * @tc.desc      Verify bundle contract bulk case 39.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
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
     * @tc.number    SUB_CLOUD_DISK_BUNDLE_BULK_4000
     * @tc.name      testCloudDiskBundleBulkResidual0040
     * @tc.desc      Verify bundle contract bulk case 40.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleBulkResidual0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
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
