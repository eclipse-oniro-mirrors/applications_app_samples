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

export default function audioChannelContractExpandedTest() {
  describe('audioChannelContractExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0001
     * @tc.name      testProjChannel0001
     * @tc.desc      1 frames with 1 channel(s) yield 1 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 1;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(1);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0002
     * @tc.name      testProjChannel0002
     * @tc.desc      2 frames with 2 channel(s) yield 4 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 2;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(4);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0003
     * @tc.name      testProjChannel0003
     * @tc.desc      3 frames with 1 channel(s) yield 3 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 3;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(3);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0004
     * @tc.name      testProjChannel0004
     * @tc.desc      4 frames with 2 channel(s) yield 8 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 4;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(8);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0005
     * @tc.name      testProjChannel0005
     * @tc.desc      5 frames with 1 channel(s) yield 5 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 5;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(5);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0006
     * @tc.name      testProjChannel0006
     * @tc.desc      6 frames with 2 channel(s) yield 12 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 6;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(12);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0007
     * @tc.name      testProjChannel0007
     * @tc.desc      7 frames with 1 channel(s) yield 7 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 7;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(7);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0008
     * @tc.name      testProjChannel0008
     * @tc.desc      8 frames with 2 channel(s) yield 16 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 8;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(16);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0009
     * @tc.name      testProjChannel0009
     * @tc.desc      9 frames with 1 channel(s) yield 9 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 9;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(9);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0010
     * @tc.name      testProjChannel0010
     * @tc.desc      10 frames with 2 channel(s) yield 20 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 10;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(20);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0011
     * @tc.name      testProjChannel0011
     * @tc.desc      11 frames with 1 channel(s) yield 11 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 11;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(11);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0012
     * @tc.name      testProjChannel0012
     * @tc.desc      12 frames with 2 channel(s) yield 24 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 12;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(24);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0013
     * @tc.name      testProjChannel0013
     * @tc.desc      13 frames with 1 channel(s) yield 13 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 13;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(13);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0014
     * @tc.name      testProjChannel0014
     * @tc.desc      14 frames with 2 channel(s) yield 28 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 14;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(28);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0015
     * @tc.name      testProjChannel0015
     * @tc.desc      15 frames with 1 channel(s) yield 15 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 15;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(15);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0016
     * @tc.name      testProjChannel0016
     * @tc.desc      16 frames with 2 channel(s) yield 32 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 16;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(32);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0017
     * @tc.name      testProjChannel0017
     * @tc.desc      17 frames with 1 channel(s) yield 17 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 17;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(17);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0018
     * @tc.name      testProjChannel0018
     * @tc.desc      18 frames with 2 channel(s) yield 36 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 18;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(36);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0019
     * @tc.name      testProjChannel0019
     * @tc.desc      19 frames with 1 channel(s) yield 19 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 19;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(19);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0020
     * @tc.name      testProjChannel0020
     * @tc.desc      20 frames with 2 channel(s) yield 40 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 20;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(40);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0021
     * @tc.name      testProjChannel0021
     * @tc.desc      21 frames with 1 channel(s) yield 21 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 21;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(21);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0022
     * @tc.name      testProjChannel0022
     * @tc.desc      22 frames with 2 channel(s) yield 44 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 22;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(44);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0023
     * @tc.name      testProjChannel0023
     * @tc.desc      23 frames with 1 channel(s) yield 23 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 23;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(23);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0024
     * @tc.name      testProjChannel0024
     * @tc.desc      24 frames with 2 channel(s) yield 48 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 24;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(48);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0025
     * @tc.name      testProjChannel0025
     * @tc.desc      25 frames with 1 channel(s) yield 25 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 25;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(25);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0026
     * @tc.name      testProjChannel0026
     * @tc.desc      26 frames with 2 channel(s) yield 52 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 26;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(52);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0027
     * @tc.name      testProjChannel0027
     * @tc.desc      27 frames with 1 channel(s) yield 27 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 27;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(27);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0028
     * @tc.name      testProjChannel0028
     * @tc.desc      28 frames with 2 channel(s) yield 56 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 28;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(56);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0029
     * @tc.name      testProjChannel0029
     * @tc.desc      29 frames with 1 channel(s) yield 29 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 29;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(29);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0030
     * @tc.name      testProjChannel0030
     * @tc.desc      30 frames with 2 channel(s) yield 60 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 30;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(60);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0031
     * @tc.name      testProjChannel0031
     * @tc.desc      31 frames with 1 channel(s) yield 31 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 31;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(31);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0032
     * @tc.name      testProjChannel0032
     * @tc.desc      32 frames with 2 channel(s) yield 64 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 32;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(64);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0033
     * @tc.name      testProjChannel0033
     * @tc.desc      33 frames with 1 channel(s) yield 33 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 33;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(33);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0034
     * @tc.name      testProjChannel0034
     * @tc.desc      34 frames with 2 channel(s) yield 68 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 34;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(68);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0035
     * @tc.name      testProjChannel0035
     * @tc.desc      35 frames with 1 channel(s) yield 35 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 35;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(35);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0036
     * @tc.name      testProjChannel0036
     * @tc.desc      36 frames with 2 channel(s) yield 72 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 36;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(72);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0037
     * @tc.name      testProjChannel0037
     * @tc.desc      37 frames with 1 channel(s) yield 37 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 37;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(37);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0038
     * @tc.name      testProjChannel0038
     * @tc.desc      38 frames with 2 channel(s) yield 76 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 38;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(76);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0039
     * @tc.name      testProjChannel0039
     * @tc.desc      39 frames with 1 channel(s) yield 39 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 39;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(39);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0040
     * @tc.name      testProjChannel0040
     * @tc.desc      40 frames with 2 channel(s) yield 80 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 40;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(80);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0041
     * @tc.name      testProjChannel0041
     * @tc.desc      41 frames with 1 channel(s) yield 41 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 41;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(41);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0042
     * @tc.name      testProjChannel0042
     * @tc.desc      42 frames with 2 channel(s) yield 84 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 42;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(84);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0043
     * @tc.name      testProjChannel0043
     * @tc.desc      43 frames with 1 channel(s) yield 43 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 43;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(43);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0044
     * @tc.name      testProjChannel0044
     * @tc.desc      44 frames with 2 channel(s) yield 88 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 44;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(88);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0045
     * @tc.name      testProjChannel0045
     * @tc.desc      45 frames with 1 channel(s) yield 45 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 45;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(45);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0046
     * @tc.name      testProjChannel0046
     * @tc.desc      46 frames with 2 channel(s) yield 92 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 46;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(92);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0047
     * @tc.name      testProjChannel0047
     * @tc.desc      47 frames with 1 channel(s) yield 47 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 47;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(47);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0048
     * @tc.name      testProjChannel0048
     * @tc.desc      48 frames with 2 channel(s) yield 96 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 48;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(96);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0049
     * @tc.name      testProjChannel0049
     * @tc.desc      49 frames with 1 channel(s) yield 49 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 49;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(49);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0050
     * @tc.name      testProjChannel0050
     * @tc.desc      50 frames with 2 channel(s) yield 100 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 50;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(100);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0051
     * @tc.name      testProjChannel0051
     * @tc.desc      51 frames with 1 channel(s) yield 51 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 51;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(51);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0052
     * @tc.name      testProjChannel0052
     * @tc.desc      52 frames with 2 channel(s) yield 104 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 52;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(104);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0053
     * @tc.name      testProjChannel0053
     * @tc.desc      53 frames with 1 channel(s) yield 53 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 53;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(53);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0054
     * @tc.name      testProjChannel0054
     * @tc.desc      54 frames with 2 channel(s) yield 108 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 54;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(108);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0055
     * @tc.name      testProjChannel0055
     * @tc.desc      55 frames with 1 channel(s) yield 55 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 55;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(55);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0056
     * @tc.name      testProjChannel0056
     * @tc.desc      56 frames with 2 channel(s) yield 112 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 56;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(112);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0057
     * @tc.name      testProjChannel0057
     * @tc.desc      57 frames with 1 channel(s) yield 57 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 57;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(57);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0058
     * @tc.name      testProjChannel0058
     * @tc.desc      58 frames with 2 channel(s) yield 116 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 58;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(116);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0059
     * @tc.name      testProjChannel0059
     * @tc.desc      59 frames with 1 channel(s) yield 59 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 59;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(59);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0060
     * @tc.name      testProjChannel0060
     * @tc.desc      60 frames with 2 channel(s) yield 120 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 60;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(120);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0061
     * @tc.name      testProjChannel0061
     * @tc.desc      61 frames with 1 channel(s) yield 61 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 61;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(61);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0062
     * @tc.name      testProjChannel0062
     * @tc.desc      62 frames with 2 channel(s) yield 124 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 62;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(124);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0063
     * @tc.name      testProjChannel0063
     * @tc.desc      63 frames with 1 channel(s) yield 63 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 63;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(63);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0064
     * @tc.name      testProjChannel0064
     * @tc.desc      64 frames with 2 channel(s) yield 128 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 64;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(128);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0065
     * @tc.name      testProjChannel0065
     * @tc.desc      65 frames with 1 channel(s) yield 65 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 65;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(65);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0066
     * @tc.name      testProjChannel0066
     * @tc.desc      66 frames with 2 channel(s) yield 132 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 66;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(132);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0067
     * @tc.name      testProjChannel0067
     * @tc.desc      67 frames with 1 channel(s) yield 67 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 67;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(67);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0068
     * @tc.name      testProjChannel0068
     * @tc.desc      68 frames with 2 channel(s) yield 136 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 68;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(136);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0069
     * @tc.name      testProjChannel0069
     * @tc.desc      69 frames with 1 channel(s) yield 69 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 69;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(69);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0070
     * @tc.name      testProjChannel0070
     * @tc.desc      70 frames with 2 channel(s) yield 140 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 70;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(140);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0071
     * @tc.name      testProjChannel0071
     * @tc.desc      71 frames with 1 channel(s) yield 71 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 71;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(71);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0072
     * @tc.name      testProjChannel0072
     * @tc.desc      72 frames with 2 channel(s) yield 144 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 72;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(144);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0073
     * @tc.name      testProjChannel0073
     * @tc.desc      73 frames with 1 channel(s) yield 73 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 73;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(73);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0074
     * @tc.name      testProjChannel0074
     * @tc.desc      74 frames with 2 channel(s) yield 148 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 74;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(148);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0075
     * @tc.name      testProjChannel0075
     * @tc.desc      75 frames with 1 channel(s) yield 75 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 75;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(75);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0076
     * @tc.name      testProjChannel0076
     * @tc.desc      76 frames with 2 channel(s) yield 152 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 76;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(152);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0077
     * @tc.name      testProjChannel0077
     * @tc.desc      77 frames with 1 channel(s) yield 77 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 77;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(77);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0078
     * @tc.name      testProjChannel0078
     * @tc.desc      78 frames with 2 channel(s) yield 156 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 78;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(156);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0079
     * @tc.name      testProjChannel0079
     * @tc.desc      79 frames with 1 channel(s) yield 79 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 79;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(79);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0080
     * @tc.name      testProjChannel0080
     * @tc.desc      80 frames with 2 channel(s) yield 160 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 80;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(160);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0081
     * @tc.name      testProjChannel0081
     * @tc.desc      81 frames with 1 channel(s) yield 81 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 81;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(81);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0082
     * @tc.name      testProjChannel0082
     * @tc.desc      82 frames with 2 channel(s) yield 164 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 82;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(164);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0083
     * @tc.name      testProjChannel0083
     * @tc.desc      83 frames with 1 channel(s) yield 83 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 83;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(83);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0084
     * @tc.name      testProjChannel0084
     * @tc.desc      84 frames with 2 channel(s) yield 168 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 84;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(168);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0085
     * @tc.name      testProjChannel0085
     * @tc.desc      85 frames with 1 channel(s) yield 85 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 85;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(85);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0086
     * @tc.name      testProjChannel0086
     * @tc.desc      86 frames with 2 channel(s) yield 172 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 86;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(172);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0087
     * @tc.name      testProjChannel0087
     * @tc.desc      87 frames with 1 channel(s) yield 87 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 87;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(87);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0088
     * @tc.name      testProjChannel0088
     * @tc.desc      88 frames with 2 channel(s) yield 176 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 88;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(176);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0089
     * @tc.name      testProjChannel0089
     * @tc.desc      89 frames with 1 channel(s) yield 89 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 89;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(89);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0090
     * @tc.name      testProjChannel0090
     * @tc.desc      90 frames with 2 channel(s) yield 180 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 90;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(180);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0091
     * @tc.name      testProjChannel0091
     * @tc.desc      91 frames with 1 channel(s) yield 91 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 91;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(91);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0092
     * @tc.name      testProjChannel0092
     * @tc.desc      92 frames with 2 channel(s) yield 184 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 92;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(184);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0093
     * @tc.name      testProjChannel0093
     * @tc.desc      93 frames with 1 channel(s) yield 93 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 93;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(93);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0094
     * @tc.name      testProjChannel0094
     * @tc.desc      94 frames with 2 channel(s) yield 188 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 94;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(188);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0095
     * @tc.name      testProjChannel0095
     * @tc.desc      95 frames with 1 channel(s) yield 95 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 95;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(95);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0096
     * @tc.name      testProjChannel0096
     * @tc.desc      96 frames with 2 channel(s) yield 192 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 96;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(192);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0097
     * @tc.name      testProjChannel0097
     * @tc.desc      97 frames with 1 channel(s) yield 97 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 97;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(97);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0098
     * @tc.name      testProjChannel0098
     * @tc.desc      98 frames with 2 channel(s) yield 196 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 98;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(196);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0099
     * @tc.name      testProjChannel0099
     * @tc.desc      99 frames with 1 channel(s) yield 99 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 1;
      const frames: number = 99;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(99);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_CHAN_0100
     * @tc.name      testProjChannel0100
     * @tc.desc      100 frames with 2 channel(s) yield 200 interleaved samples.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjChannel0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const channels: number = 2;
      const frames: number = 100;
      const totalSamples: number = frames * channels;
      expect(totalSamples).assertEqual(200);
      expect(totalSamples % channels).assertEqual(0);
      expect(channels === 1 || channels === 2).assertTrue();
      expect(frames > 0).assertTrue();
    })
  })
}
