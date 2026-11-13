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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
let bundleInfo: bundleManager.BundleInfo;
export default function launcherPermissionModelMatrixTest() {
  describe('LauncherPermissionModelMatrixTest', () => {
    beforeAll(() => { bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION); })

    /**
     * @tc.name   testPermissionModel0001
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0001
     * @tc.desc   Test Launcher permission model case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0002
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0002
     * @tc.desc   Test Launcher permission model case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0003
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0003
     * @tc.desc   Test Launcher permission model case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0004
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0004
     * @tc.desc   Test Launcher permission model case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0005
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0005
     * @tc.desc   Test Launcher permission model case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0006
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0006
     * @tc.desc   Test Launcher permission model case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0007
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0007
     * @tc.desc   Test Launcher permission model case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0008
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0008
     * @tc.desc   Test Launcher permission model case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0009
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0009
     * @tc.desc   Test Launcher permission model case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0010
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0010
     * @tc.desc   Test Launcher permission model case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0011
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0011
     * @tc.desc   Test Launcher permission model case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0012
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0012
     * @tc.desc   Test Launcher permission model case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0013
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0013
     * @tc.desc   Test Launcher permission model case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0014
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0014
     * @tc.desc   Test Launcher permission model case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0015
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0015
     * @tc.desc   Test Launcher permission model case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0016
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0016
     * @tc.desc   Test Launcher permission model case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0017
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0017
     * @tc.desc   Test Launcher permission model case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0018
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0018
     * @tc.desc   Test Launcher permission model case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0019
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0019
     * @tc.desc   Test Launcher permission model case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0020
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0020
     * @tc.desc   Test Launcher permission model case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0021
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0021
     * @tc.desc   Test Launcher permission model case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0022
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0022
     * @tc.desc   Test Launcher permission model case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0023
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0023
     * @tc.desc   Test Launcher permission model case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0024
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0024
     * @tc.desc   Test Launcher permission model case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0025
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0025
     * @tc.desc   Test Launcher permission model case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0026
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0026
     * @tc.desc   Test Launcher permission model case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0027
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0027
     * @tc.desc   Test Launcher permission model case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0028
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0028
     * @tc.desc   Test Launcher permission model case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0029
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0029
     * @tc.desc   Test Launcher permission model case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })

    /**
     * @tc.name   testPermissionModel0030
     * @tc.number SUB_LAUNCHER_PERMISSION_MODEL_0030
     * @tc.desc   Test Launcher permission model case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionModel0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bundleInfo.reqPermissionDetails.length >= 7).assertTrue();
      const names: Set<string> = new Set<string>();
      for (let i: number = 0; i < bundleInfo.reqPermissionDetails.length; i++) {
        names.add(bundleInfo.reqPermissionDetails[i].name);
        expect(bundleInfo.reqPermissionDetails[i].reason.length > 0).assertTrue();
      }
      expect(names.size).assertEqual(bundleInfo.reqPermissionDetails.length);
    })
  })
}
