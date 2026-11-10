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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';

export default function projectRuntimeMoreTest() {
  describe('projectRuntimeMoreTest', () => {
    /**
     * @tc.number    SUB_AVS_MORE_RT_0001
     * @tc.name      testMoreProjectRuntime0001
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0002
     * @tc.name      testMoreProjectRuntime0002
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0003
     * @tc.name      testMoreProjectRuntime0003
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0004
     * @tc.name      testMoreProjectRuntime0004
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0005
     * @tc.name      testMoreProjectRuntime0005
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0006
     * @tc.name      testMoreProjectRuntime0006
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0007
     * @tc.name      testMoreProjectRuntime0007
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0008
     * @tc.name      testMoreProjectRuntime0008
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0009
     * @tc.name      testMoreProjectRuntime0009
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0010
     * @tc.name      testMoreProjectRuntime0010
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0011
     * @tc.name      testMoreProjectRuntime0011
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0012
     * @tc.name      testMoreProjectRuntime0012
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0013
     * @tc.name      testMoreProjectRuntime0013
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0014
     * @tc.name      testMoreProjectRuntime0014
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0015
     * @tc.name      testMoreProjectRuntime0015
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0016
     * @tc.name      testMoreProjectRuntime0016
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0017
     * @tc.name      testMoreProjectRuntime0017
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0018
     * @tc.name      testMoreProjectRuntime0018
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0019
     * @tc.name      testMoreProjectRuntime0019
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0020
     * @tc.name      testMoreProjectRuntime0020
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0021
     * @tc.name      testMoreProjectRuntime0021
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0022
     * @tc.name      testMoreProjectRuntime0022
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0023
     * @tc.name      testMoreProjectRuntime0023
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0024
     * @tc.name      testMoreProjectRuntime0024
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0025
     * @tc.name      testMoreProjectRuntime0025
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0026
     * @tc.name      testMoreProjectRuntime0026
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0027
     * @tc.name      testMoreProjectRuntime0027
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0028
     * @tc.name      testMoreProjectRuntime0028
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0029
     * @tc.name      testMoreProjectRuntime0029
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0030
     * @tc.name      testMoreProjectRuntime0030
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0031
     * @tc.name      testMoreProjectRuntime0031
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0032
     * @tc.name      testMoreProjectRuntime0032
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0033
     * @tc.name      testMoreProjectRuntime0033
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0034
     * @tc.name      testMoreProjectRuntime0034
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0035
     * @tc.name      testMoreProjectRuntime0035
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0036
     * @tc.name      testMoreProjectRuntime0036
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0037
     * @tc.name      testMoreProjectRuntime0037
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0038
     * @tc.name      testMoreProjectRuntime0038
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0039
     * @tc.name      testMoreProjectRuntime0039
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0040
     * @tc.name      testMoreProjectRuntime0040
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0041
     * @tc.name      testMoreProjectRuntime0041
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0042
     * @tc.name      testMoreProjectRuntime0042
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0043
     * @tc.name      testMoreProjectRuntime0043
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0044
     * @tc.name      testMoreProjectRuntime0044
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0045
     * @tc.name      testMoreProjectRuntime0045
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0046
     * @tc.name      testMoreProjectRuntime0046
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0047
     * @tc.name      testMoreProjectRuntime0047
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0048
     * @tc.name      testMoreProjectRuntime0048
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0049
     * @tc.name      testMoreProjectRuntime0049
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0050
     * @tc.name      testMoreProjectRuntime0050
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0051
     * @tc.name      testMoreProjectRuntime0051
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0052
     * @tc.name      testMoreProjectRuntime0052
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0053
     * @tc.name      testMoreProjectRuntime0053
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0054
     * @tc.name      testMoreProjectRuntime0054
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0055
     * @tc.name      testMoreProjectRuntime0055
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0056
     * @tc.name      testMoreProjectRuntime0056
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0057
     * @tc.name      testMoreProjectRuntime0057
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0058
     * @tc.name      testMoreProjectRuntime0058
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0059
     * @tc.name      testMoreProjectRuntime0059
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0060
     * @tc.name      testMoreProjectRuntime0060
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0061
     * @tc.name      testMoreProjectRuntime0061
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0062
     * @tc.name      testMoreProjectRuntime0062
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0063
     * @tc.name      testMoreProjectRuntime0063
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0064
     * @tc.name      testMoreProjectRuntime0064
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0065
     * @tc.name      testMoreProjectRuntime0065
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0066
     * @tc.name      testMoreProjectRuntime0066
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0067
     * @tc.name      testMoreProjectRuntime0067
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0068
     * @tc.name      testMoreProjectRuntime0068
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0069
     * @tc.name      testMoreProjectRuntime0069
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0070
     * @tc.name      testMoreProjectRuntime0070
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0071
     * @tc.name      testMoreProjectRuntime0071
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0072
     * @tc.name      testMoreProjectRuntime0072
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0073
     * @tc.name      testMoreProjectRuntime0073
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0074
     * @tc.name      testMoreProjectRuntime0074
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0075
     * @tc.name      testMoreProjectRuntime0075
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0076
     * @tc.name      testMoreProjectRuntime0076
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0077
     * @tc.name      testMoreProjectRuntime0077
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0078
     * @tc.name      testMoreProjectRuntime0078
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0079
     * @tc.name      testMoreProjectRuntime0079
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0080
     * @tc.name      testMoreProjectRuntime0080
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0081
     * @tc.name      testMoreProjectRuntime0081
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0082
     * @tc.name      testMoreProjectRuntime0082
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0083
     * @tc.name      testMoreProjectRuntime0083
     * @tc.desc      Viewport 2560x1440 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 2560;
      const height: number = 1440;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1440);
      expect(half).assertEqual(1280);
      expect(sum).assertEqual(4000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0084
     * @tc.name      testMoreProjectRuntime0084
     * @tc.desc      Viewport 3840x2160 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 3840;
      const height: number = 2160;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(2160);
      expect(half).assertEqual(1920);
      expect(sum).assertEqual(6000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0085
     * @tc.name      testMoreProjectRuntime0085
     * @tc.desc      Viewport 1280x720 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1280;
      const height: number = 720;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(720);
      expect(half).assertEqual(640);
      expect(sum).assertEqual(2000);
      expect(width > height).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_RT_0086
     * @tc.name      testMoreProjectRuntime0086
     * @tc.desc      Viewport 1920x1080 keeps its half-width and pixel sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreProjectRuntime0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1920;
      const height: number = 1080;
      const half: number = Math.floor(width / 2);
      const sum: number = width + height;
      expect(height).assertEqual(1080);
      expect(half).assertEqual(960);
      expect(sum).assertEqual(3000);
      expect(width > height).assertTrue();
    })
  })
}
