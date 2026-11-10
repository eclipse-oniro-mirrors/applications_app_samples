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

export default function audioPipelineMoreTest() {
  describe('audioPipelineMoreTest', () => {
    /**
     * @tc.number    SUB_AVS_MORE_AP_0001
     * @tc.name      testMoreAudioPipeline0001
     * @tc.desc      Pipeline 8000Hz/1ch/2B needs 256 bytes per 128 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 128;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(256);
      expect(byteRate).assertEqual(16000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0002
     * @tc.name      testMoreAudioPipeline0002
     * @tc.desc      Pipeline 16000Hz/2ch/3B needs 792 bytes per 132 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 132;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(792);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0003
     * @tc.name      testMoreAudioPipeline0003
     * @tc.desc      Pipeline 22050Hz/1ch/4B needs 544 bytes per 136 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 136;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(544);
      expect(byteRate).assertEqual(88200);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0004
     * @tc.name      testMoreAudioPipeline0004
     * @tc.desc      Pipeline 44100Hz/2ch/4B needs 1120 bytes per 140 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 140;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1120);
      expect(byteRate).assertEqual(352800);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0005
     * @tc.name      testMoreAudioPipeline0005
     * @tc.desc      Pipeline 48000Hz/1ch/2B needs 288 bytes per 144 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 144;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(288);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0006
     * @tc.name      testMoreAudioPipeline0006
     * @tc.desc      Pipeline 96000Hz/2ch/3B needs 888 bytes per 148 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 148;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(888);
      expect(byteRate).assertEqual(576000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0007
     * @tc.name      testMoreAudioPipeline0007
     * @tc.desc      Pipeline 8000Hz/1ch/4B needs 608 bytes per 152 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 152;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(608);
      expect(byteRate).assertEqual(32000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0008
     * @tc.name      testMoreAudioPipeline0008
     * @tc.desc      Pipeline 16000Hz/2ch/4B needs 1248 bytes per 156 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 156;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1248);
      expect(byteRate).assertEqual(128000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0009
     * @tc.name      testMoreAudioPipeline0009
     * @tc.desc      Pipeline 22050Hz/1ch/2B needs 320 bytes per 160 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 160;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(320);
      expect(byteRate).assertEqual(44100);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0010
     * @tc.name      testMoreAudioPipeline0010
     * @tc.desc      Pipeline 44100Hz/2ch/3B needs 984 bytes per 164 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 164;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(984);
      expect(byteRate).assertEqual(264600);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0011
     * @tc.name      testMoreAudioPipeline0011
     * @tc.desc      Pipeline 48000Hz/1ch/4B needs 672 bytes per 168 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 168;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(672);
      expect(byteRate).assertEqual(192000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0012
     * @tc.name      testMoreAudioPipeline0012
     * @tc.desc      Pipeline 96000Hz/2ch/4B needs 1376 bytes per 172 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 172;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1376);
      expect(byteRate).assertEqual(768000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0013
     * @tc.name      testMoreAudioPipeline0013
     * @tc.desc      Pipeline 8000Hz/1ch/2B needs 352 bytes per 176 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 176;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(352);
      expect(byteRate).assertEqual(16000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0014
     * @tc.name      testMoreAudioPipeline0014
     * @tc.desc      Pipeline 16000Hz/2ch/3B needs 1080 bytes per 180 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 180;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1080);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0015
     * @tc.name      testMoreAudioPipeline0015
     * @tc.desc      Pipeline 22050Hz/1ch/4B needs 736 bytes per 184 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 184;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(736);
      expect(byteRate).assertEqual(88200);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0016
     * @tc.name      testMoreAudioPipeline0016
     * @tc.desc      Pipeline 44100Hz/2ch/4B needs 1504 bytes per 188 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 188;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1504);
      expect(byteRate).assertEqual(352800);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0017
     * @tc.name      testMoreAudioPipeline0017
     * @tc.desc      Pipeline 48000Hz/1ch/2B needs 384 bytes per 192 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 192;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(384);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0018
     * @tc.name      testMoreAudioPipeline0018
     * @tc.desc      Pipeline 96000Hz/2ch/3B needs 1176 bytes per 196 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 196;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1176);
      expect(byteRate).assertEqual(576000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0019
     * @tc.name      testMoreAudioPipeline0019
     * @tc.desc      Pipeline 8000Hz/1ch/4B needs 800 bytes per 200 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 200;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(800);
      expect(byteRate).assertEqual(32000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0020
     * @tc.name      testMoreAudioPipeline0020
     * @tc.desc      Pipeline 16000Hz/2ch/4B needs 1632 bytes per 204 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 204;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1632);
      expect(byteRate).assertEqual(128000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0021
     * @tc.name      testMoreAudioPipeline0021
     * @tc.desc      Pipeline 22050Hz/1ch/2B needs 416 bytes per 208 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 208;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(416);
      expect(byteRate).assertEqual(44100);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0022
     * @tc.name      testMoreAudioPipeline0022
     * @tc.desc      Pipeline 44100Hz/2ch/3B needs 1272 bytes per 212 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 212;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1272);
      expect(byteRate).assertEqual(264600);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0023
     * @tc.name      testMoreAudioPipeline0023
     * @tc.desc      Pipeline 48000Hz/1ch/4B needs 864 bytes per 216 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 216;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(864);
      expect(byteRate).assertEqual(192000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0024
     * @tc.name      testMoreAudioPipeline0024
     * @tc.desc      Pipeline 96000Hz/2ch/4B needs 1760 bytes per 220 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 220;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1760);
      expect(byteRate).assertEqual(768000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0025
     * @tc.name      testMoreAudioPipeline0025
     * @tc.desc      Pipeline 8000Hz/1ch/2B needs 448 bytes per 224 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 224;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(448);
      expect(byteRate).assertEqual(16000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0026
     * @tc.name      testMoreAudioPipeline0026
     * @tc.desc      Pipeline 16000Hz/2ch/3B needs 1368 bytes per 228 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 228;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1368);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0027
     * @tc.name      testMoreAudioPipeline0027
     * @tc.desc      Pipeline 22050Hz/1ch/4B needs 928 bytes per 232 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 232;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(928);
      expect(byteRate).assertEqual(88200);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0028
     * @tc.name      testMoreAudioPipeline0028
     * @tc.desc      Pipeline 44100Hz/2ch/4B needs 1888 bytes per 236 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 236;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1888);
      expect(byteRate).assertEqual(352800);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0029
     * @tc.name      testMoreAudioPipeline0029
     * @tc.desc      Pipeline 48000Hz/1ch/2B needs 480 bytes per 240 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 240;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(480);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0030
     * @tc.name      testMoreAudioPipeline0030
     * @tc.desc      Pipeline 96000Hz/2ch/3B needs 1464 bytes per 244 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 244;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1464);
      expect(byteRate).assertEqual(576000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0031
     * @tc.name      testMoreAudioPipeline0031
     * @tc.desc      Pipeline 8000Hz/1ch/4B needs 992 bytes per 248 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 248;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(992);
      expect(byteRate).assertEqual(32000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0032
     * @tc.name      testMoreAudioPipeline0032
     * @tc.desc      Pipeline 16000Hz/2ch/4B needs 2016 bytes per 252 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 252;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2016);
      expect(byteRate).assertEqual(128000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0033
     * @tc.name      testMoreAudioPipeline0033
     * @tc.desc      Pipeline 22050Hz/1ch/2B needs 512 bytes per 256 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 256;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(512);
      expect(byteRate).assertEqual(44100);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0034
     * @tc.name      testMoreAudioPipeline0034
     * @tc.desc      Pipeline 44100Hz/2ch/3B needs 1560 bytes per 260 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 260;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1560);
      expect(byteRate).assertEqual(264600);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0035
     * @tc.name      testMoreAudioPipeline0035
     * @tc.desc      Pipeline 48000Hz/1ch/4B needs 1056 bytes per 264 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 264;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1056);
      expect(byteRate).assertEqual(192000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0036
     * @tc.name      testMoreAudioPipeline0036
     * @tc.desc      Pipeline 96000Hz/2ch/4B needs 2144 bytes per 268 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 268;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2144);
      expect(byteRate).assertEqual(768000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0037
     * @tc.name      testMoreAudioPipeline0037
     * @tc.desc      Pipeline 8000Hz/1ch/2B needs 544 bytes per 272 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 272;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(544);
      expect(byteRate).assertEqual(16000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0038
     * @tc.name      testMoreAudioPipeline0038
     * @tc.desc      Pipeline 16000Hz/2ch/3B needs 1656 bytes per 276 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 276;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1656);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0039
     * @tc.name      testMoreAudioPipeline0039
     * @tc.desc      Pipeline 22050Hz/1ch/4B needs 1120 bytes per 280 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 280;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1120);
      expect(byteRate).assertEqual(88200);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0040
     * @tc.name      testMoreAudioPipeline0040
     * @tc.desc      Pipeline 44100Hz/2ch/4B needs 2272 bytes per 284 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 284;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2272);
      expect(byteRate).assertEqual(352800);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0041
     * @tc.name      testMoreAudioPipeline0041
     * @tc.desc      Pipeline 48000Hz/1ch/2B needs 576 bytes per 288 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 288;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(576);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0042
     * @tc.name      testMoreAudioPipeline0042
     * @tc.desc      Pipeline 96000Hz/2ch/3B needs 1752 bytes per 292 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 292;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1752);
      expect(byteRate).assertEqual(576000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0043
     * @tc.name      testMoreAudioPipeline0043
     * @tc.desc      Pipeline 8000Hz/1ch/4B needs 1184 bytes per 296 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 296;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1184);
      expect(byteRate).assertEqual(32000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0044
     * @tc.name      testMoreAudioPipeline0044
     * @tc.desc      Pipeline 16000Hz/2ch/4B needs 2400 bytes per 300 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 300;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2400);
      expect(byteRate).assertEqual(128000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0045
     * @tc.name      testMoreAudioPipeline0045
     * @tc.desc      Pipeline 22050Hz/1ch/2B needs 608 bytes per 304 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 304;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(608);
      expect(byteRate).assertEqual(44100);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0046
     * @tc.name      testMoreAudioPipeline0046
     * @tc.desc      Pipeline 44100Hz/2ch/3B needs 1848 bytes per 308 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 308;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1848);
      expect(byteRate).assertEqual(264600);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0047
     * @tc.name      testMoreAudioPipeline0047
     * @tc.desc      Pipeline 48000Hz/1ch/4B needs 1248 bytes per 312 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 312;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1248);
      expect(byteRate).assertEqual(192000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0048
     * @tc.name      testMoreAudioPipeline0048
     * @tc.desc      Pipeline 96000Hz/2ch/4B needs 2528 bytes per 316 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 316;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2528);
      expect(byteRate).assertEqual(768000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0049
     * @tc.name      testMoreAudioPipeline0049
     * @tc.desc      Pipeline 8000Hz/1ch/2B needs 640 bytes per 320 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 320;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(640);
      expect(byteRate).assertEqual(16000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0050
     * @tc.name      testMoreAudioPipeline0050
     * @tc.desc      Pipeline 16000Hz/2ch/3B needs 1944 bytes per 324 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 324;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1944);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0051
     * @tc.name      testMoreAudioPipeline0051
     * @tc.desc      Pipeline 22050Hz/1ch/4B needs 1312 bytes per 328 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 328;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1312);
      expect(byteRate).assertEqual(88200);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0052
     * @tc.name      testMoreAudioPipeline0052
     * @tc.desc      Pipeline 44100Hz/2ch/4B needs 2656 bytes per 332 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 332;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2656);
      expect(byteRate).assertEqual(352800);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0053
     * @tc.name      testMoreAudioPipeline0053
     * @tc.desc      Pipeline 48000Hz/1ch/2B needs 672 bytes per 336 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 336;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(672);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0054
     * @tc.name      testMoreAudioPipeline0054
     * @tc.desc      Pipeline 96000Hz/2ch/3B needs 2040 bytes per 340 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 340;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2040);
      expect(byteRate).assertEqual(576000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0055
     * @tc.name      testMoreAudioPipeline0055
     * @tc.desc      Pipeline 8000Hz/1ch/4B needs 1376 bytes per 344 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 344;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1376);
      expect(byteRate).assertEqual(32000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0056
     * @tc.name      testMoreAudioPipeline0056
     * @tc.desc      Pipeline 16000Hz/2ch/4B needs 2784 bytes per 348 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 348;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2784);
      expect(byteRate).assertEqual(128000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0057
     * @tc.name      testMoreAudioPipeline0057
     * @tc.desc      Pipeline 22050Hz/1ch/2B needs 704 bytes per 352 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 352;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(704);
      expect(byteRate).assertEqual(44100);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0058
     * @tc.name      testMoreAudioPipeline0058
     * @tc.desc      Pipeline 44100Hz/2ch/3B needs 2136 bytes per 356 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 356;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2136);
      expect(byteRate).assertEqual(264600);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0059
     * @tc.name      testMoreAudioPipeline0059
     * @tc.desc      Pipeline 48000Hz/1ch/4B needs 1440 bytes per 360 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 360;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1440);
      expect(byteRate).assertEqual(192000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0060
     * @tc.name      testMoreAudioPipeline0060
     * @tc.desc      Pipeline 96000Hz/2ch/4B needs 2912 bytes per 364 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 364;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2912);
      expect(byteRate).assertEqual(768000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0061
     * @tc.name      testMoreAudioPipeline0061
     * @tc.desc      Pipeline 8000Hz/1ch/2B needs 736 bytes per 368 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 368;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(736);
      expect(byteRate).assertEqual(16000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0062
     * @tc.name      testMoreAudioPipeline0062
     * @tc.desc      Pipeline 16000Hz/2ch/3B needs 2232 bytes per 372 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 372;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2232);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0063
     * @tc.name      testMoreAudioPipeline0063
     * @tc.desc      Pipeline 22050Hz/1ch/4B needs 1504 bytes per 376 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 376;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1504);
      expect(byteRate).assertEqual(88200);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0064
     * @tc.name      testMoreAudioPipeline0064
     * @tc.desc      Pipeline 44100Hz/2ch/4B needs 3040 bytes per 380 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 380;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(3040);
      expect(byteRate).assertEqual(352800);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0065
     * @tc.name      testMoreAudioPipeline0065
     * @tc.desc      Pipeline 48000Hz/1ch/2B needs 768 bytes per 384 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 384;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(768);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0066
     * @tc.name      testMoreAudioPipeline0066
     * @tc.desc      Pipeline 96000Hz/2ch/3B needs 2328 bytes per 388 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 388;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2328);
      expect(byteRate).assertEqual(576000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0067
     * @tc.name      testMoreAudioPipeline0067
     * @tc.desc      Pipeline 8000Hz/1ch/4B needs 1568 bytes per 392 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 392;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1568);
      expect(byteRate).assertEqual(32000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0068
     * @tc.name      testMoreAudioPipeline0068
     * @tc.desc      Pipeline 16000Hz/2ch/4B needs 3168 bytes per 396 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 396;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(3168);
      expect(byteRate).assertEqual(128000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0069
     * @tc.name      testMoreAudioPipeline0069
     * @tc.desc      Pipeline 22050Hz/1ch/2B needs 800 bytes per 400 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 400;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(800);
      expect(byteRate).assertEqual(44100);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0070
     * @tc.name      testMoreAudioPipeline0070
     * @tc.desc      Pipeline 44100Hz/2ch/3B needs 2424 bytes per 404 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 404;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2424);
      expect(byteRate).assertEqual(264600);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0071
     * @tc.name      testMoreAudioPipeline0071
     * @tc.desc      Pipeline 48000Hz/1ch/4B needs 1632 bytes per 408 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 408;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1632);
      expect(byteRate).assertEqual(192000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0072
     * @tc.name      testMoreAudioPipeline0072
     * @tc.desc      Pipeline 96000Hz/2ch/4B needs 3296 bytes per 412 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 412;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(3296);
      expect(byteRate).assertEqual(768000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0073
     * @tc.name      testMoreAudioPipeline0073
     * @tc.desc      Pipeline 8000Hz/1ch/2B needs 832 bytes per 416 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 416;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(832);
      expect(byteRate).assertEqual(16000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0074
     * @tc.name      testMoreAudioPipeline0074
     * @tc.desc      Pipeline 16000Hz/2ch/3B needs 2520 bytes per 420 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 420;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2520);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0075
     * @tc.name      testMoreAudioPipeline0075
     * @tc.desc      Pipeline 22050Hz/1ch/4B needs 1696 bytes per 424 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 424;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1696);
      expect(byteRate).assertEqual(88200);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0076
     * @tc.name      testMoreAudioPipeline0076
     * @tc.desc      Pipeline 44100Hz/2ch/4B needs 3424 bytes per 428 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 428;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(3424);
      expect(byteRate).assertEqual(352800);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0077
     * @tc.name      testMoreAudioPipeline0077
     * @tc.desc      Pipeline 48000Hz/1ch/2B needs 864 bytes per 432 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 432;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(864);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0078
     * @tc.name      testMoreAudioPipeline0078
     * @tc.desc      Pipeline 96000Hz/2ch/3B needs 2616 bytes per 436 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 436;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2616);
      expect(byteRate).assertEqual(576000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0079
     * @tc.name      testMoreAudioPipeline0079
     * @tc.desc      Pipeline 8000Hz/1ch/4B needs 1760 bytes per 440 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 440;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1760);
      expect(byteRate).assertEqual(32000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0080
     * @tc.name      testMoreAudioPipeline0080
     * @tc.desc      Pipeline 16000Hz/2ch/4B needs 3552 bytes per 444 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 444;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(3552);
      expect(byteRate).assertEqual(128000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0081
     * @tc.name      testMoreAudioPipeline0081
     * @tc.desc      Pipeline 22050Hz/1ch/2B needs 896 bytes per 448 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 22050;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 448;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(896);
      expect(byteRate).assertEqual(44100);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0082
     * @tc.name      testMoreAudioPipeline0082
     * @tc.desc      Pipeline 44100Hz/2ch/3B needs 2712 bytes per 452 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 452;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2712);
      expect(byteRate).assertEqual(264600);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0083
     * @tc.name      testMoreAudioPipeline0083
     * @tc.desc      Pipeline 48000Hz/1ch/4B needs 1824 bytes per 456 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const frames: number = 456;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(1824);
      expect(byteRate).assertEqual(192000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0084
     * @tc.name      testMoreAudioPipeline0084
     * @tc.desc      Pipeline 96000Hz/2ch/4B needs 3680 bytes per 460 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const frames: number = 460;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(3680);
      expect(byteRate).assertEqual(768000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0085
     * @tc.name      testMoreAudioPipeline0085
     * @tc.desc      Pipeline 8000Hz/1ch/2B needs 928 bytes per 464 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 8000;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const frames: number = 464;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(928);
      expect(byteRate).assertEqual(16000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVS_MORE_AP_0086
     * @tc.name      testMoreAudioPipeline0086
     * @tc.desc      Pipeline 16000Hz/2ch/3B needs 2808 bytes per 468 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreAudioPipeline0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 16000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const frames: number = 468;
      const bytes: number = frames * channels * bytesPerSample;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(bytes).assertEqual(2808);
      expect(byteRate).assertEqual(96000);
      expect(bytes % channels).assertEqual(0);
      expect(byteRate % sampleRate).assertEqual(0);
    })
  })
}
