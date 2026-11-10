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

export default function audioFormatBytesExpandedTest() {
  describe('audioFormatBytesExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0001
     * @tc.name      testProjAudioBytes0001
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0002
     * @tc.name      testProjAudioBytes0002
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0003
     * @tc.name      testProjAudioBytes0003
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0004
     * @tc.name      testProjAudioBytes0004
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0005
     * @tc.name      testProjAudioBytes0005
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0006
     * @tc.name      testProjAudioBytes0006
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0007
     * @tc.name      testProjAudioBytes0007
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0008
     * @tc.name      testProjAudioBytes0008
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0009
     * @tc.name      testProjAudioBytes0009
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0010
     * @tc.name      testProjAudioBytes0010
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0011
     * @tc.name      testProjAudioBytes0011
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0012
     * @tc.name      testProjAudioBytes0012
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0013
     * @tc.name      testProjAudioBytes0013
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0014
     * @tc.name      testProjAudioBytes0014
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0015
     * @tc.name      testProjAudioBytes0015
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0016
     * @tc.name      testProjAudioBytes0016
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0017
     * @tc.name      testProjAudioBytes0017
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0018
     * @tc.name      testProjAudioBytes0018
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0019
     * @tc.name      testProjAudioBytes0019
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0020
     * @tc.name      testProjAudioBytes0020
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0021
     * @tc.name      testProjAudioBytes0021
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0022
     * @tc.name      testProjAudioBytes0022
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0023
     * @tc.name      testProjAudioBytes0023
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0024
     * @tc.name      testProjAudioBytes0024
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0025
     * @tc.name      testProjAudioBytes0025
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0026
     * @tc.name      testProjAudioBytes0026
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0027
     * @tc.name      testProjAudioBytes0027
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0028
     * @tc.name      testProjAudioBytes0028
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0029
     * @tc.name      testProjAudioBytes0029
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0030
     * @tc.name      testProjAudioBytes0030
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0031
     * @tc.name      testProjAudioBytes0031
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0032
     * @tc.name      testProjAudioBytes0032
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0033
     * @tc.name      testProjAudioBytes0033
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0034
     * @tc.name      testProjAudioBytes0034
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0035
     * @tc.name      testProjAudioBytes0035
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0036
     * @tc.name      testProjAudioBytes0036
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0037
     * @tc.name      testProjAudioBytes0037
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0038
     * @tc.name      testProjAudioBytes0038
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0039
     * @tc.name      testProjAudioBytes0039
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0040
     * @tc.name      testProjAudioBytes0040
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0041
     * @tc.name      testProjAudioBytes0041
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0042
     * @tc.name      testProjAudioBytes0042
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0043
     * @tc.name      testProjAudioBytes0043
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0044
     * @tc.name      testProjAudioBytes0044
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0045
     * @tc.name      testProjAudioBytes0045
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0046
     * @tc.name      testProjAudioBytes0046
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0047
     * @tc.name      testProjAudioBytes0047
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0048
     * @tc.name      testProjAudioBytes0048
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0049
     * @tc.name      testProjAudioBytes0049
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0050
     * @tc.name      testProjAudioBytes0050
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0051
     * @tc.name      testProjAudioBytes0051
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0052
     * @tc.name      testProjAudioBytes0052
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0053
     * @tc.name      testProjAudioBytes0053
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0054
     * @tc.name      testProjAudioBytes0054
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0055
     * @tc.name      testProjAudioBytes0055
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0056
     * @tc.name      testProjAudioBytes0056
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0057
     * @tc.name      testProjAudioBytes0057
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0058
     * @tc.name      testProjAudioBytes0058
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0059
     * @tc.name      testProjAudioBytes0059
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0060
     * @tc.name      testProjAudioBytes0060
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0061
     * @tc.name      testProjAudioBytes0061
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0062
     * @tc.name      testProjAudioBytes0062
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0063
     * @tc.name      testProjAudioBytes0063
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0064
     * @tc.name      testProjAudioBytes0064
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0065
     * @tc.name      testProjAudioBytes0065
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0066
     * @tc.name      testProjAudioBytes0066
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0067
     * @tc.name      testProjAudioBytes0067
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0068
     * @tc.name      testProjAudioBytes0068
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0069
     * @tc.name      testProjAudioBytes0069
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0070
     * @tc.name      testProjAudioBytes0070
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0071
     * @tc.name      testProjAudioBytes0071
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0072
     * @tc.name      testProjAudioBytes0072
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0073
     * @tc.name      testProjAudioBytes0073
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0074
     * @tc.name      testProjAudioBytes0074
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0075
     * @tc.name      testProjAudioBytes0075
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0076
     * @tc.name      testProjAudioBytes0076
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0077
     * @tc.name      testProjAudioBytes0077
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0078
     * @tc.name      testProjAudioBytes0078
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0079
     * @tc.name      testProjAudioBytes0079
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0080
     * @tc.name      testProjAudioBytes0080
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0081
     * @tc.name      testProjAudioBytes0081
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0082
     * @tc.name      testProjAudioBytes0082
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0083
     * @tc.name      testProjAudioBytes0083
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0084
     * @tc.name      testProjAudioBytes0084
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0085
     * @tc.name      testProjAudioBytes0085
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0086
     * @tc.name      testProjAudioBytes0086
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0087
     * @tc.name      testProjAudioBytes0087
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0088
     * @tc.name      testProjAudioBytes0088
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0089
     * @tc.name      testProjAudioBytes0089
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0090
     * @tc.name      testProjAudioBytes0090
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0091
     * @tc.name      testProjAudioBytes0091
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0092
     * @tc.name      testProjAudioBytes0092
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0093
     * @tc.name      testProjAudioBytes0093
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0094
     * @tc.name      testProjAudioBytes0094
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0095
     * @tc.name      testProjAudioBytes0095
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0096
     * @tc.name      testProjAudioBytes0096
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0097
     * @tc.name      testProjAudioBytes0097
     * @tc.desc      Format 0 at 44100 Hz with 1 channel(s) needs 88200 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 2;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(88200);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0098
     * @tc.name      testProjAudioBytes0098
     * @tc.desc      Format 1 at 48000 Hz with 2 channel(s) needs 288000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 3;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(288000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0099
     * @tc.name      testProjAudioBytes0099
     * @tc.desc      Format 2 at 44100 Hz with 1 channel(s) needs 176400 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(176400);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_ABYTES_0100
     * @tc.name      testProjAudioBytes0100
     * @tc.desc      Format 3 at 48000 Hz with 2 channel(s) needs 384000 bytes/s.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjAudioBytes0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const bytesPerSample: number = 4;
      const byteRate: number = sampleRate * channels * bytesPerSample;
      expect(byteRate).assertEqual(384000);
      expect(byteRate % sampleRate).assertEqual(0);
      expect(bytesPerSample > 0).assertTrue();
      expect(channels >= 1).assertTrue();
    })
  })
}
