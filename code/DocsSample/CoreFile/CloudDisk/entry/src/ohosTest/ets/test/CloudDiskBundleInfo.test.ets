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

const BUNDLE_NAME: string = 'com.cloud.disk001';
const ABILITY_NAME: string = 'EntryAbility';

export default function cloudDiskBundleInfoTest(): void {
  describe('CloudDiskBundleInfoTest', () => {
    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_0100
     * @tc.name      testCloudDiskBundleInfo0001
     * @tc.desc      Verify the app resolves its own bundle and entry ability names.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfo0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo | undefined = getBundleInfo();
          expect(info !== undefined).assertTrue();
          expect(info?.bundleName).assertEqual(BUNDLE_NAME);
          expect(info?.abilityName).assertEqual(ABILITY_NAME);
          expect((info?.bundleName.length ?? 0) > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_0200
     * @tc.name      testCloudDiskBundleInfo0002
     * @tc.desc      Verify repeated bundle lookups return the same identifiers.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfo0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const first: BundleInfo | undefined = getBundleInfo();
          const second: BundleInfo | undefined = getBundleInfo();
          expect(first !== undefined).assertTrue();
          expect(second !== undefined).assertTrue();
          expect(first?.bundleName).assertEqual(second?.bundleName);
          expect(first?.abilityName).assertEqual(second?.abilityName);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_0300
     * @tc.name      testCloudDiskBundleInfo0003
     * @tc.desc      Verify the returned ability name belongs to the returned bundle.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfo0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo | undefined = getBundleInfo();
          expect(info?.bundleName).assertEqual(BUNDLE_NAME);
          expect(info?.abilityName).assertEqual(ABILITY_NAME);
          expect(info?.bundleName === info?.abilityName).assertFalse();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_0400
     * @tc.name      testCloudDiskBundleInfo0004
     * @tc.desc      Verify the lookup result exposes exactly the bundle and ability fields.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfo0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo = getBundleInfo() as BundleInfo;
          const keys: string[] = Object.keys(info).sort();
          expect(keys.length).assertEqual(2);
          expect(keys[0]).assertEqual('abilityName');
          expect(keys[1]).assertEqual('bundleName');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_BUNDLEINFO_0500
     * @tc.name      testCloudDiskBundleInfo0005
     * @tc.desc      Verify bundle identifiers contain no surrounding whitespace.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCloudDiskBundleInfo0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const info: BundleInfo | undefined = getBundleInfo();
          const bundleName: string = info?.bundleName ?? '';
          const abilityName: string = info?.abilityName ?? '';
          expect(bundleName).assertEqual(bundleName.trim());
          expect(abilityName).assertEqual(abilityName.trim());
          expect(bundleName.length > abilityName.length).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
