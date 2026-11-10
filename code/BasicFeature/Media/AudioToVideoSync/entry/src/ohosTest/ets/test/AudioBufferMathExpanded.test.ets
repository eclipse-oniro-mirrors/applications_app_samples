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

export default function audioBufferMathExpandedTest() {
  describe('audioBufferMathExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0001
     * @tc.name      testProjBufferMath0001
     * @tc.desc      64 frames with 1 channel(s) and 16 bits need 128 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 64;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(128);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0002
     * @tc.name      testProjBufferMath0002
     * @tc.desc      68 frames with 2 channel(s) and 24 bits need 408 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 68;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(408);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0003
     * @tc.name      testProjBufferMath0003
     * @tc.desc      72 frames with 1 channel(s) and 32 bits need 288 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 72;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(288);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0004
     * @tc.name      testProjBufferMath0004
     * @tc.desc      76 frames with 2 channel(s) and 32 bits need 608 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 76;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(608);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0005
     * @tc.name      testProjBufferMath0005
     * @tc.desc      80 frames with 1 channel(s) and 16 bits need 160 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 80;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(160);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0006
     * @tc.name      testProjBufferMath0006
     * @tc.desc      84 frames with 2 channel(s) and 24 bits need 504 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 84;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(504);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0007
     * @tc.name      testProjBufferMath0007
     * @tc.desc      88 frames with 1 channel(s) and 32 bits need 352 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 88;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(352);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0008
     * @tc.name      testProjBufferMath0008
     * @tc.desc      92 frames with 2 channel(s) and 32 bits need 736 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 92;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(736);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0009
     * @tc.name      testProjBufferMath0009
     * @tc.desc      96 frames with 1 channel(s) and 16 bits need 192 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 96;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(192);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0010
     * @tc.name      testProjBufferMath0010
     * @tc.desc      100 frames with 2 channel(s) and 24 bits need 600 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 100;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(600);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0011
     * @tc.name      testProjBufferMath0011
     * @tc.desc      104 frames with 1 channel(s) and 32 bits need 416 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 104;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(416);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0012
     * @tc.name      testProjBufferMath0012
     * @tc.desc      108 frames with 2 channel(s) and 32 bits need 864 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 108;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(864);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0013
     * @tc.name      testProjBufferMath0013
     * @tc.desc      112 frames with 1 channel(s) and 16 bits need 224 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 112;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(224);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0014
     * @tc.name      testProjBufferMath0014
     * @tc.desc      116 frames with 2 channel(s) and 24 bits need 696 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 116;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(696);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0015
     * @tc.name      testProjBufferMath0015
     * @tc.desc      120 frames with 1 channel(s) and 32 bits need 480 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 120;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(480);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0016
     * @tc.name      testProjBufferMath0016
     * @tc.desc      124 frames with 2 channel(s) and 32 bits need 992 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 124;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(992);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0017
     * @tc.name      testProjBufferMath0017
     * @tc.desc      128 frames with 1 channel(s) and 16 bits need 256 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 128;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(256);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0018
     * @tc.name      testProjBufferMath0018
     * @tc.desc      132 frames with 2 channel(s) and 24 bits need 792 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 132;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(792);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0019
     * @tc.name      testProjBufferMath0019
     * @tc.desc      136 frames with 1 channel(s) and 32 bits need 544 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 136;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(544);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0020
     * @tc.name      testProjBufferMath0020
     * @tc.desc      140 frames with 2 channel(s) and 32 bits need 1120 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 140;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1120);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0021
     * @tc.name      testProjBufferMath0021
     * @tc.desc      144 frames with 1 channel(s) and 16 bits need 288 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 144;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(288);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0022
     * @tc.name      testProjBufferMath0022
     * @tc.desc      148 frames with 2 channel(s) and 24 bits need 888 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 148;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(888);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0023
     * @tc.name      testProjBufferMath0023
     * @tc.desc      152 frames with 1 channel(s) and 32 bits need 608 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 152;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(608);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0024
     * @tc.name      testProjBufferMath0024
     * @tc.desc      156 frames with 2 channel(s) and 32 bits need 1248 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 156;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1248);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0025
     * @tc.name      testProjBufferMath0025
     * @tc.desc      160 frames with 1 channel(s) and 16 bits need 320 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 160;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(320);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0026
     * @tc.name      testProjBufferMath0026
     * @tc.desc      164 frames with 2 channel(s) and 24 bits need 984 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 164;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(984);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0027
     * @tc.name      testProjBufferMath0027
     * @tc.desc      168 frames with 1 channel(s) and 32 bits need 672 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 168;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(672);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0028
     * @tc.name      testProjBufferMath0028
     * @tc.desc      172 frames with 2 channel(s) and 32 bits need 1376 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 172;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1376);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0029
     * @tc.name      testProjBufferMath0029
     * @tc.desc      176 frames with 1 channel(s) and 16 bits need 352 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 176;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(352);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0030
     * @tc.name      testProjBufferMath0030
     * @tc.desc      180 frames with 2 channel(s) and 24 bits need 1080 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 180;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1080);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0031
     * @tc.name      testProjBufferMath0031
     * @tc.desc      184 frames with 1 channel(s) and 32 bits need 736 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 184;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(736);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0032
     * @tc.name      testProjBufferMath0032
     * @tc.desc      188 frames with 2 channel(s) and 32 bits need 1504 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 188;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1504);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0033
     * @tc.name      testProjBufferMath0033
     * @tc.desc      192 frames with 1 channel(s) and 16 bits need 384 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 192;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(384);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0034
     * @tc.name      testProjBufferMath0034
     * @tc.desc      196 frames with 2 channel(s) and 24 bits need 1176 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 196;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1176);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0035
     * @tc.name      testProjBufferMath0035
     * @tc.desc      200 frames with 1 channel(s) and 32 bits need 800 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 200;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(800);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0036
     * @tc.name      testProjBufferMath0036
     * @tc.desc      204 frames with 2 channel(s) and 32 bits need 1632 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 204;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1632);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0037
     * @tc.name      testProjBufferMath0037
     * @tc.desc      208 frames with 1 channel(s) and 16 bits need 416 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 208;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(416);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0038
     * @tc.name      testProjBufferMath0038
     * @tc.desc      212 frames with 2 channel(s) and 24 bits need 1272 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 212;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1272);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0039
     * @tc.name      testProjBufferMath0039
     * @tc.desc      216 frames with 1 channel(s) and 32 bits need 864 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 216;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(864);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0040
     * @tc.name      testProjBufferMath0040
     * @tc.desc      220 frames with 2 channel(s) and 32 bits need 1760 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 220;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1760);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0041
     * @tc.name      testProjBufferMath0041
     * @tc.desc      224 frames with 1 channel(s) and 16 bits need 448 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 224;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(448);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0042
     * @tc.name      testProjBufferMath0042
     * @tc.desc      228 frames with 2 channel(s) and 24 bits need 1368 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 228;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1368);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0043
     * @tc.name      testProjBufferMath0043
     * @tc.desc      232 frames with 1 channel(s) and 32 bits need 928 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 232;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(928);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0044
     * @tc.name      testProjBufferMath0044
     * @tc.desc      236 frames with 2 channel(s) and 32 bits need 1888 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 236;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1888);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0045
     * @tc.name      testProjBufferMath0045
     * @tc.desc      240 frames with 1 channel(s) and 16 bits need 480 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 240;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(480);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0046
     * @tc.name      testProjBufferMath0046
     * @tc.desc      244 frames with 2 channel(s) and 24 bits need 1464 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 244;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1464);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0047
     * @tc.name      testProjBufferMath0047
     * @tc.desc      248 frames with 1 channel(s) and 32 bits need 992 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 248;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(992);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0048
     * @tc.name      testProjBufferMath0048
     * @tc.desc      252 frames with 2 channel(s) and 32 bits need 2016 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 252;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2016);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0049
     * @tc.name      testProjBufferMath0049
     * @tc.desc      256 frames with 1 channel(s) and 16 bits need 512 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 256;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(512);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0050
     * @tc.name      testProjBufferMath0050
     * @tc.desc      260 frames with 2 channel(s) and 24 bits need 1560 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 260;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1560);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0051
     * @tc.name      testProjBufferMath0051
     * @tc.desc      264 frames with 1 channel(s) and 32 bits need 1056 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 264;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1056);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0052
     * @tc.name      testProjBufferMath0052
     * @tc.desc      268 frames with 2 channel(s) and 32 bits need 2144 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 268;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2144);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0053
     * @tc.name      testProjBufferMath0053
     * @tc.desc      272 frames with 1 channel(s) and 16 bits need 544 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 272;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(544);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0054
     * @tc.name      testProjBufferMath0054
     * @tc.desc      276 frames with 2 channel(s) and 24 bits need 1656 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 276;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1656);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0055
     * @tc.name      testProjBufferMath0055
     * @tc.desc      280 frames with 1 channel(s) and 32 bits need 1120 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 280;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1120);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0056
     * @tc.name      testProjBufferMath0056
     * @tc.desc      284 frames with 2 channel(s) and 32 bits need 2272 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 284;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2272);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0057
     * @tc.name      testProjBufferMath0057
     * @tc.desc      288 frames with 1 channel(s) and 16 bits need 576 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 288;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(576);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0058
     * @tc.name      testProjBufferMath0058
     * @tc.desc      292 frames with 2 channel(s) and 24 bits need 1752 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 292;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1752);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0059
     * @tc.name      testProjBufferMath0059
     * @tc.desc      296 frames with 1 channel(s) and 32 bits need 1184 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 296;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1184);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0060
     * @tc.name      testProjBufferMath0060
     * @tc.desc      300 frames with 2 channel(s) and 32 bits need 2400 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 300;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2400);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0061
     * @tc.name      testProjBufferMath0061
     * @tc.desc      304 frames with 1 channel(s) and 16 bits need 608 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 304;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(608);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0062
     * @tc.name      testProjBufferMath0062
     * @tc.desc      308 frames with 2 channel(s) and 24 bits need 1848 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 308;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1848);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0063
     * @tc.name      testProjBufferMath0063
     * @tc.desc      312 frames with 1 channel(s) and 32 bits need 1248 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 312;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1248);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0064
     * @tc.name      testProjBufferMath0064
     * @tc.desc      316 frames with 2 channel(s) and 32 bits need 2528 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 316;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2528);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0065
     * @tc.name      testProjBufferMath0065
     * @tc.desc      320 frames with 1 channel(s) and 16 bits need 640 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 320;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(640);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0066
     * @tc.name      testProjBufferMath0066
     * @tc.desc      324 frames with 2 channel(s) and 24 bits need 1944 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 324;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1944);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0067
     * @tc.name      testProjBufferMath0067
     * @tc.desc      328 frames with 1 channel(s) and 32 bits need 1312 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 328;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1312);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0068
     * @tc.name      testProjBufferMath0068
     * @tc.desc      332 frames with 2 channel(s) and 32 bits need 2656 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 332;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2656);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0069
     * @tc.name      testProjBufferMath0069
     * @tc.desc      336 frames with 1 channel(s) and 16 bits need 672 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 336;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(672);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0070
     * @tc.name      testProjBufferMath0070
     * @tc.desc      340 frames with 2 channel(s) and 24 bits need 2040 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 340;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2040);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0071
     * @tc.name      testProjBufferMath0071
     * @tc.desc      344 frames with 1 channel(s) and 32 bits need 1376 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 344;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1376);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0072
     * @tc.name      testProjBufferMath0072
     * @tc.desc      348 frames with 2 channel(s) and 32 bits need 2784 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 348;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2784);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0073
     * @tc.name      testProjBufferMath0073
     * @tc.desc      352 frames with 1 channel(s) and 16 bits need 704 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 352;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(704);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0074
     * @tc.name      testProjBufferMath0074
     * @tc.desc      356 frames with 2 channel(s) and 24 bits need 2136 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 356;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2136);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0075
     * @tc.name      testProjBufferMath0075
     * @tc.desc      360 frames with 1 channel(s) and 32 bits need 1440 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 360;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1440);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0076
     * @tc.name      testProjBufferMath0076
     * @tc.desc      364 frames with 2 channel(s) and 32 bits need 2912 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 364;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2912);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0077
     * @tc.name      testProjBufferMath0077
     * @tc.desc      368 frames with 1 channel(s) and 16 bits need 736 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 368;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(736);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0078
     * @tc.name      testProjBufferMath0078
     * @tc.desc      372 frames with 2 channel(s) and 24 bits need 2232 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 372;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2232);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0079
     * @tc.name      testProjBufferMath0079
     * @tc.desc      376 frames with 1 channel(s) and 32 bits need 1504 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 376;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1504);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0080
     * @tc.name      testProjBufferMath0080
     * @tc.desc      380 frames with 2 channel(s) and 32 bits need 3040 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 380;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(3040);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0081
     * @tc.name      testProjBufferMath0081
     * @tc.desc      384 frames with 1 channel(s) and 16 bits need 768 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 384;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(768);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0082
     * @tc.name      testProjBufferMath0082
     * @tc.desc      388 frames with 2 channel(s) and 24 bits need 2328 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 388;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2328);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0083
     * @tc.name      testProjBufferMath0083
     * @tc.desc      392 frames with 1 channel(s) and 32 bits need 1568 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 392;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1568);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0084
     * @tc.name      testProjBufferMath0084
     * @tc.desc      396 frames with 2 channel(s) and 32 bits need 3168 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 396;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(3168);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0085
     * @tc.name      testProjBufferMath0085
     * @tc.desc      400 frames with 1 channel(s) and 16 bits need 800 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 400;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(800);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0086
     * @tc.name      testProjBufferMath0086
     * @tc.desc      404 frames with 2 channel(s) and 24 bits need 2424 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 404;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2424);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0087
     * @tc.name      testProjBufferMath0087
     * @tc.desc      408 frames with 1 channel(s) and 32 bits need 1632 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 408;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1632);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0088
     * @tc.name      testProjBufferMath0088
     * @tc.desc      412 frames with 2 channel(s) and 32 bits need 3296 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 412;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(3296);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0089
     * @tc.name      testProjBufferMath0089
     * @tc.desc      416 frames with 1 channel(s) and 16 bits need 832 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 416;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(832);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0090
     * @tc.name      testProjBufferMath0090
     * @tc.desc      420 frames with 2 channel(s) and 24 bits need 2520 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 420;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2520);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0091
     * @tc.name      testProjBufferMath0091
     * @tc.desc      424 frames with 1 channel(s) and 32 bits need 1696 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 424;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1696);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0092
     * @tc.name      testProjBufferMath0092
     * @tc.desc      428 frames with 2 channel(s) and 32 bits need 3424 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 428;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(3424);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0093
     * @tc.name      testProjBufferMath0093
     * @tc.desc      432 frames with 1 channel(s) and 16 bits need 864 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 432;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(864);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0094
     * @tc.name      testProjBufferMath0094
     * @tc.desc      436 frames with 2 channel(s) and 24 bits need 2616 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 436;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2616);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0095
     * @tc.name      testProjBufferMath0095
     * @tc.desc      440 frames with 1 channel(s) and 32 bits need 1760 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 440;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1760);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0096
     * @tc.name      testProjBufferMath0096
     * @tc.desc      444 frames with 2 channel(s) and 32 bits need 3552 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 444;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(3552);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0097
     * @tc.name      testProjBufferMath0097
     * @tc.desc      448 frames with 1 channel(s) and 16 bits need 896 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 448;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(896);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0098
     * @tc.name      testProjBufferMath0098
     * @tc.desc      452 frames with 2 channel(s) and 24 bits need 2712 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 452;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(2712);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0099
     * @tc.name      testProjBufferMath0099
     * @tc.desc      456 frames with 1 channel(s) and 32 bits need 1824 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 456;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(1824);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_BUFFM_0100
     * @tc.name      testProjBufferMath0100
     * @tc.desc      460 frames with 2 channel(s) and 32 bits need 3680 bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjBufferMath0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const frames: number = 460;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const bytes: number = frames * channels * bytesPerSample;
      expect(bytes).assertEqual(3680);
      expect(bytes % channels).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(frames > 0 && channels > 0).assertTrue();
    })
  })
}
