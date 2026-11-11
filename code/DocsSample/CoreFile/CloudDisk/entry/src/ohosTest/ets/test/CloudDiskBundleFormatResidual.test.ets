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

export default function cloudDiskBundleFormatResidualTest(): void {
  describe('CloudDiskBundleFormatResidualTest', () => {
    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEFORMAT_RESIDUAL_0100
     * @tc.name      testCloudDiskBundleFormatResidual0001
     * @tc.desc      Verify the bundle name starts with the com prefix.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleFormatResidual0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName.startsWith('com.')).assertTrue();
          expect(info.bundleName.startsWith('org.')).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEFORMAT_RESIDUAL_0200
     * @tc.name      testCloudDiskBundleFormatResidual0002
     * @tc.desc      Verify the bundle name has exactly three segments.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleFormatResidual0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          const segments: string[] = info.bundleName.split('.');
          expect(segments.length).assertEqual(3);
          expect(segments[1]).assertEqual('cloud');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEFORMAT_RESIDUAL_0300
     * @tc.name      testCloudDiskBundleFormatResidual0003
     * @tc.desc      Verify the bundle name has no upper-case letters.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleFormatResidual0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.bundleName).assertEqual(info.bundleName.toLowerCase());
          expect(info.bundleName.toUpperCase() === info.bundleName).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEFORMAT_RESIDUAL_0400
     * @tc.name      testCloudDiskBundleFormatResidual0004
     * @tc.desc      Verify the ability name has a reasonable length and no separator.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleFormatResidual0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
          expect(info.abilityName.length >= 5).assertTrue();
          expect(info.abilityName.includes('.')).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEFORMAT_RESIDUAL_0500
     * @tc.name      testCloudDiskBundleFormatResidual0005
     * @tc.desc      Verify serialization retains both identifier fields.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleFormatResidual0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          hilog.info(DOMAIN, TAG, 'bundle: %{public}s', info?.bundleName ?? '');
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
     * @tc.number    SUB_CLOUD_DISK_BUNDLEFORMAT_RESIDUAL_0600
     * @tc.name      testCloudDiskBundleFormatResidual0006
     * @tc.desc      Verify twenty repeated lookups stay identical.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleFormatResidual0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const first: BundleInfo = getBundleInfo() as BundleInfo;
          let stable: boolean = true;
          for (let i = 0; i < 20; i++) {
            const next: BundleInfo = getBundleInfo() as BundleInfo;
            if (next.bundleName !== first.bundleName || next.abilityName !== first.abilityName) {
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

  });
}
