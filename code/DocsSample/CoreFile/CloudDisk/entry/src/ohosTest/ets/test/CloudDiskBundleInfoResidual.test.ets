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

export default function cloudDiskBundleInfoResidualTest(): void {
  describe('CloudDiskBundleInfoResidualTest', () => {
    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_RESIDUAL_0100
     * @tc.name      testCloudDiskBundleInfoResidual0001
     * @tc.desc      Verify the bundle name contains non-empty dot-separated segments.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfoResidual0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          const segments: string[] = info.bundleName.split('.');
          expect(segments.length >= 2).assertTrue();
          expect(segments.every((value: string) => value.length > 0)).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_RESIDUAL_0200
     * @tc.name      testCloudDiskBundleInfoResidual0002
     * @tc.desc      Verify the bundle name is lower case.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfoResidual0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_RESIDUAL_0300
     * @tc.name      testCloudDiskBundleInfoResidual0003
     * @tc.desc      Verify the ability name contains no package separator.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfoResidual0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.abilityName.includes('.')).assertFalse();
          expect(info.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_RESIDUAL_0400
     * @tc.name      testCloudDiskBundleInfoResidual0004
     * @tc.desc      Verify the ability name starts with an upper-case letter.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfoResidual0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          const first: string = info.abilityName.substring(0, 1);
          expect(first).assertEqual(first.toUpperCase());
          expect(first).assertEqual('E');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_RESIDUAL_0500
     * @tc.name      testCloudDiskBundleInfoResidual0005
     * @tc.desc      Verify ten repeated bundle lookups stay identical.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfoResidual0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const first: BundleInfo = getBundleInfo() as BundleInfo;
          let stable: boolean = true;
          for (let i = 0; i < 10; i++) {
            const next: BundleInfo = getBundleInfo() as BundleInfo;
            if (next.bundleName !== first.bundleName) {
              stable = false;
            }
          }
          expect(stable).assertTrue();
          expect(first.bundleName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_RESIDUAL_0600
     * @tc.name      testCloudDiskBundleInfoResidual0006
     * @tc.desc      Verify ten repeated ability lookups stay identical.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfoResidual0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const first: BundleInfo = getBundleInfo() as BundleInfo;
          let stable: boolean = true;
          for (let i = 0; i < 10; i++) {
            const next: BundleInfo = getBundleInfo() as BundleInfo;
            if (next.abilityName !== first.abilityName) {
              stable = false;
            }
          }
          expect(stable).assertTrue();
          expect(first.abilityName.length > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_RESIDUAL_0700
     * @tc.name      testCloudDiskBundleInfoResidual0007
     * @tc.desc      Verify each lookup returns a fresh result object.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfoResidual0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const first: BundleInfo = getBundleInfo() as BundleInfo;
          const second: BundleInfo = getBundleInfo() as BundleInfo;
          expect(first === second).assertFalse();
          expect(first.bundleName).assertEqual(second.bundleName);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_RESIDUAL_0800
     * @tc.name      testCloudDiskBundleInfoResidual0008
     * @tc.desc      Verify both identifier fields are strings.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfoResidual0008',
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
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_RESIDUAL_0900
     * @tc.name      testCloudDiskBundleInfoResidual0009
     * @tc.desc      Verify the bundle and ability identifiers differ.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfoResidual0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName === info.abilityName).assertFalse();
          expect(info.bundleName.endsWith('.disk001')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_RESIDUAL_1000
     * @tc.name      testCloudDiskBundleInfoResidual0010
     * @tc.desc      Verify the ability name ends with the Ability suffix.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfoResidual0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.abilityName.endsWith('Ability')).assertTrue();
          expect(info.abilityName.startsWith('Entry')).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
