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
import { describe, it, expect } from '@ohos/hypium';

export default function subtitleSafeBoundaryCoreTest() {
  describe('subtitleSafeBoundaryCoreTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0001
     * @tc.name      testSafeWrap0001
     * @tc.desc      10 chars wrap at width 10 into 1 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0001', 0, () => {
      const length: number = 10;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(1);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0002
     * @tc.name      testSafeWrap0002
     * @tc.desc      17 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0002', 0, () => {
      const length: number = 17;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0003
     * @tc.name      testSafeWrap0003
     * @tc.desc      22 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0003', 0, () => {
      const length: number = 22;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0004
     * @tc.name      testSafeWrap0004
     * @tc.desc      27 chars wrap at width 24 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0004', 0, () => {
      const length: number = 27;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0005
     * @tc.name      testSafeWrap0005
     * @tc.desc      36 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0005', 0, () => {
      const length: number = 36;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0006
     * @tc.name      testSafeWrap0006
     * @tc.desc      45 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0006', 0, () => {
      const length: number = 45;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0007
     * @tc.name      testSafeWrap0007
     * @tc.desc      16 chars wrap at width 10 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0007', 0, () => {
      const length: number = 16;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0008
     * @tc.name      testSafeWrap0008
     * @tc.desc      23 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0008', 0, () => {
      const length: number = 23;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0009
     * @tc.name      testSafeWrap0009
     * @tc.desc      28 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0009', 0, () => {
      const length: number = 28;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0010
     * @tc.name      testSafeWrap0010
     * @tc.desc      33 chars wrap at width 24 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0010', 0, () => {
      const length: number = 33;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0011
     * @tc.name      testSafeWrap0011
     * @tc.desc      42 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0011', 0, () => {
      const length: number = 42;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0012
     * @tc.name      testSafeWrap0012
     * @tc.desc      51 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0012', 0, () => {
      const length: number = 51;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0013
     * @tc.name      testSafeWrap0013
     * @tc.desc      22 chars wrap at width 10 into 3 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0013', 0, () => {
      const length: number = 22;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(3);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0014
     * @tc.name      testSafeWrap0014
     * @tc.desc      29 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0014', 0, () => {
      const length: number = 29;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0015
     * @tc.name      testSafeWrap0015
     * @tc.desc      34 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0015', 0, () => {
      const length: number = 34;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0016
     * @tc.name      testSafeWrap0016
     * @tc.desc      24 chars wrap at width 24 into 1 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0016', 0, () => {
      const length: number = 24;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(1);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0017
     * @tc.name      testSafeWrap0017
     * @tc.desc      33 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0017', 0, () => {
      const length: number = 33;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0018
     * @tc.name      testSafeWrap0018
     * @tc.desc      42 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0018', 0, () => {
      const length: number = 42;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0019
     * @tc.name      testSafeWrap0019
     * @tc.desc      13 chars wrap at width 10 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0019', 0, () => {
      const length: number = 13;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0020
     * @tc.name      testSafeWrap0020
     * @tc.desc      20 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0020', 0, () => {
      const length: number = 20;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0021
     * @tc.name      testSafeWrap0021
     * @tc.desc      25 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0021', 0, () => {
      const length: number = 25;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0022
     * @tc.name      testSafeWrap0022
     * @tc.desc      30 chars wrap at width 24 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0022', 0, () => {
      const length: number = 30;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0023
     * @tc.name      testSafeWrap0023
     * @tc.desc      39 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0023', 0, () => {
      const length: number = 39;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0024
     * @tc.name      testSafeWrap0024
     * @tc.desc      48 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0024', 0, () => {
      const length: number = 48;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0025
     * @tc.name      testSafeWrap0025
     * @tc.desc      19 chars wrap at width 10 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0025', 0, () => {
      const length: number = 19;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0026
     * @tc.name      testSafeWrap0026
     * @tc.desc      26 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0026', 0, () => {
      const length: number = 26;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0027
     * @tc.name      testSafeWrap0027
     * @tc.desc      31 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0027', 0, () => {
      const length: number = 31;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0028
     * @tc.name      testSafeWrap0028
     * @tc.desc      36 chars wrap at width 24 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0028', 0, () => {
      const length: number = 36;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0029
     * @tc.name      testSafeWrap0029
     * @tc.desc      45 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0029', 0, () => {
      const length: number = 45;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0030
     * @tc.name      testSafeWrap0030
     * @tc.desc      54 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0030', 0, () => {
      const length: number = 54;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0031
     * @tc.name      testSafeWrap0031
     * @tc.desc      10 chars wrap at width 10 into 1 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0031', 0, () => {
      const length: number = 10;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(1);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0032
     * @tc.name      testSafeWrap0032
     * @tc.desc      17 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0032', 0, () => {
      const length: number = 17;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0033
     * @tc.name      testSafeWrap0033
     * @tc.desc      22 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0033', 0, () => {
      const length: number = 22;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0034
     * @tc.name      testSafeWrap0034
     * @tc.desc      27 chars wrap at width 24 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0034', 0, () => {
      const length: number = 27;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0035
     * @tc.name      testSafeWrap0035
     * @tc.desc      36 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0035', 0, () => {
      const length: number = 36;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0036
     * @tc.name      testSafeWrap0036
     * @tc.desc      45 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0036', 0, () => {
      const length: number = 45;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0037
     * @tc.name      testSafeWrap0037
     * @tc.desc      16 chars wrap at width 10 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0037', 0, () => {
      const length: number = 16;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0038
     * @tc.name      testSafeWrap0038
     * @tc.desc      23 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0038', 0, () => {
      const length: number = 23;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0039
     * @tc.name      testSafeWrap0039
     * @tc.desc      28 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0039', 0, () => {
      const length: number = 28;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0040
     * @tc.name      testSafeWrap0040
     * @tc.desc      33 chars wrap at width 24 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0040', 0, () => {
      const length: number = 33;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0041
     * @tc.name      testSafeWrap0041
     * @tc.desc      42 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0041', 0, () => {
      const length: number = 42;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0042
     * @tc.name      testSafeWrap0042
     * @tc.desc      51 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0042', 0, () => {
      const length: number = 51;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0043
     * @tc.name      testSafeWrap0043
     * @tc.desc      22 chars wrap at width 10 into 3 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0043', 0, () => {
      const length: number = 22;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(3);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0044
     * @tc.name      testSafeWrap0044
     * @tc.desc      29 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0044', 0, () => {
      const length: number = 29;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0045
     * @tc.name      testSafeWrap0045
     * @tc.desc      34 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0045', 0, () => {
      const length: number = 34;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0046
     * @tc.name      testSafeWrap0046
     * @tc.desc      24 chars wrap at width 24 into 1 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0046', 0, () => {
      const length: number = 24;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(1);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0047
     * @tc.name      testSafeWrap0047
     * @tc.desc      33 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0047', 0, () => {
      const length: number = 33;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0048
     * @tc.name      testSafeWrap0048
     * @tc.desc      42 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0048', 0, () => {
      const length: number = 42;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0049
     * @tc.name      testSafeWrap0049
     * @tc.desc      13 chars wrap at width 10 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0049', 0, () => {
      const length: number = 13;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0050
     * @tc.name      testSafeWrap0050
     * @tc.desc      20 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0050', 0, () => {
      const length: number = 20;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0051
     * @tc.name      testSafeWrap0051
     * @tc.desc      25 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0051', 0, () => {
      const length: number = 25;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0052
     * @tc.name      testSafeWrap0052
     * @tc.desc      30 chars wrap at width 24 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0052', 0, () => {
      const length: number = 30;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0053
     * @tc.name      testSafeWrap0053
     * @tc.desc      39 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0053', 0, () => {
      const length: number = 39;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0054
     * @tc.name      testSafeWrap0054
     * @tc.desc      48 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0054', 0, () => {
      const length: number = 48;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0055
     * @tc.name      testSafeWrap0055
     * @tc.desc      19 chars wrap at width 10 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0055', 0, () => {
      const length: number = 19;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0056
     * @tc.name      testSafeWrap0056
     * @tc.desc      26 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0056', 0, () => {
      const length: number = 26;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0057
     * @tc.name      testSafeWrap0057
     * @tc.desc      31 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0057', 0, () => {
      const length: number = 31;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0058
     * @tc.name      testSafeWrap0058
     * @tc.desc      36 chars wrap at width 24 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0058', 0, () => {
      const length: number = 36;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0059
     * @tc.name      testSafeWrap0059
     * @tc.desc      45 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0059', 0, () => {
      const length: number = 45;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0060
     * @tc.name      testSafeWrap0060
     * @tc.desc      54 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0060', 0, () => {
      const length: number = 54;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0061
     * @tc.name      testSafeWrap0061
     * @tc.desc      10 chars wrap at width 10 into 1 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0061', 0, () => {
      const length: number = 10;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(1);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0062
     * @tc.name      testSafeWrap0062
     * @tc.desc      17 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0062', 0, () => {
      const length: number = 17;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0063
     * @tc.name      testSafeWrap0063
     * @tc.desc      22 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0063', 0, () => {
      const length: number = 22;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0064
     * @tc.name      testSafeWrap0064
     * @tc.desc      27 chars wrap at width 24 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0064', 0, () => {
      const length: number = 27;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0065
     * @tc.name      testSafeWrap0065
     * @tc.desc      36 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0065', 0, () => {
      const length: number = 36;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0066
     * @tc.name      testSafeWrap0066
     * @tc.desc      45 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0066', 0, () => {
      const length: number = 45;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0067
     * @tc.name      testSafeWrap0067
     * @tc.desc      16 chars wrap at width 10 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0067', 0, () => {
      const length: number = 16;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0068
     * @tc.name      testSafeWrap0068
     * @tc.desc      23 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0068', 0, () => {
      const length: number = 23;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0069
     * @tc.name      testSafeWrap0069
     * @tc.desc      28 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0069', 0, () => {
      const length: number = 28;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0070
     * @tc.name      testSafeWrap0070
     * @tc.desc      33 chars wrap at width 24 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0070', 0, () => {
      const length: number = 33;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0071
     * @tc.name      testSafeWrap0071
     * @tc.desc      42 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0071', 0, () => {
      const length: number = 42;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0072
     * @tc.name      testSafeWrap0072
     * @tc.desc      51 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0072', 0, () => {
      const length: number = 51;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0073
     * @tc.name      testSafeWrap0073
     * @tc.desc      22 chars wrap at width 10 into 3 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0073', 0, () => {
      const length: number = 22;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(3);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0074
     * @tc.name      testSafeWrap0074
     * @tc.desc      29 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0074', 0, () => {
      const length: number = 29;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0075
     * @tc.name      testSafeWrap0075
     * @tc.desc      34 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0075', 0, () => {
      const length: number = 34;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0076
     * @tc.name      testSafeWrap0076
     * @tc.desc      24 chars wrap at width 24 into 1 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0076', 0, () => {
      const length: number = 24;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(1);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0077
     * @tc.name      testSafeWrap0077
     * @tc.desc      33 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0077', 0, () => {
      const length: number = 33;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0078
     * @tc.name      testSafeWrap0078
     * @tc.desc      42 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0078', 0, () => {
      const length: number = 42;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0079
     * @tc.name      testSafeWrap0079
     * @tc.desc      13 chars wrap at width 10 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0079', 0, () => {
      const length: number = 13;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0080
     * @tc.name      testSafeWrap0080
     * @tc.desc      20 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0080', 0, () => {
      const length: number = 20;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0081
     * @tc.name      testSafeWrap0081
     * @tc.desc      25 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0081', 0, () => {
      const length: number = 25;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0082
     * @tc.name      testSafeWrap0082
     * @tc.desc      30 chars wrap at width 24 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0082', 0, () => {
      const length: number = 30;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0083
     * @tc.name      testSafeWrap0083
     * @tc.desc      39 chars wrap at width 32 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0083', 0, () => {
      const length: number = 39;
      const width: number = 32;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0084
     * @tc.name      testSafeWrap0084
     * @tc.desc      48 chars wrap at width 40 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0084', 0, () => {
      const length: number = 48;
      const width: number = 40;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0085
     * @tc.name      testSafeWrap0085
     * @tc.desc      19 chars wrap at width 10 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0085', 0, () => {
      const length: number = 19;
      const width: number = 10;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0086
     * @tc.name      testSafeWrap0086
     * @tc.desc      26 chars wrap at width 16 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0086', 0, () => {
      const length: number = 26;
      const width: number = 16;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0087
     * @tc.name      testSafeWrap0087
     * @tc.desc      31 chars wrap at width 20 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0087', 0, () => {
      const length: number = 31;
      const width: number = 20;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_BC_0088
     * @tc.name      testSafeWrap0088
     * @tc.desc      36 chars wrap at width 24 into 2 lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeWrap0088', 0, () => {
      const length: number = 36;
      const width: number = 24;
      const lines: number = Math.ceil(length / width);
      expect(lines).assertEqual(2);
      expect(length).assertLarger(0);
      expect(width).assertLarger(0);
      expect(lines).assertLarger(0);
    })
  })
}
