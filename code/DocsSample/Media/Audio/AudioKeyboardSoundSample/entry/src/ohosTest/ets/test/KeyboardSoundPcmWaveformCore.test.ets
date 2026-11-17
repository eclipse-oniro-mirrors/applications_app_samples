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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_keyboardSoundPcmWaveformCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function keyboardSoundPcmWaveformCoreTest(): void {
  describe('keyboardSoundPcmWaveformCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0001
     * @tc.name      testExtKeyboardWave0000
     * @tc.desc      Waveform 440Hz amp 0.1 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 0.0;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0002
     * @tc.name      testExtKeyboardWave0001
     * @tc.desc      Waveform 1000Hz amp 0.3 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.3;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 0.1;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0003
     * @tc.name      testExtKeyboardWave0002
     * @tc.desc      Waveform 2000Hz amp 0.5 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.5;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 0.2;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0004
     * @tc.name      testExtKeyboardWave0003
     * @tc.desc      Waveform 440Hz amp 1.0 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 0.30000000000000004;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0005
     * @tc.name      testExtKeyboardWave0004
     * @tc.desc      Waveform 1000Hz amp 0.1 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.1;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 0.4;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0006
     * @tc.name      testExtKeyboardWave0005
     * @tc.desc      Waveform 2000Hz amp 0.3 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.3;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 0.5;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0007
     * @tc.name      testExtKeyboardWave0006
     * @tc.desc      Waveform 440Hz amp 0.5 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 0.6000000000000001;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0008
     * @tc.name      testExtKeyboardWave0007
     * @tc.desc      Waveform 1000Hz amp 1.0 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 1.0;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 0.7000000000000001;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0009
     * @tc.name      testExtKeyboardWave0008
     * @tc.desc      Waveform 2000Hz amp 0.1 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.1;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 0.8;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0010
     * @tc.name      testExtKeyboardWave0009
     * @tc.desc      Waveform 440Hz amp 0.3 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 0.9;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0011
     * @tc.name      testExtKeyboardWave0010
     * @tc.desc      Waveform 1000Hz amp 0.5 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.5;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 1.0;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0012
     * @tc.name      testExtKeyboardWave0011
     * @tc.desc      Waveform 2000Hz amp 1.0 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 1.0;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 1.1;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0013
     * @tc.name      testExtKeyboardWave0012
     * @tc.desc      Waveform 440Hz amp 0.1 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 1.2000000000000002;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0014
     * @tc.name      testExtKeyboardWave0013
     * @tc.desc      Waveform 1000Hz amp 0.3 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.3;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 1.3;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0015
     * @tc.name      testExtKeyboardWave0014
     * @tc.desc      Waveform 2000Hz amp 0.5 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.5;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 1.4000000000000001;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0016
     * @tc.name      testExtKeyboardWave0015
     * @tc.desc      Waveform 440Hz amp 1.0 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 1.5;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0017
     * @tc.name      testExtKeyboardWave0016
     * @tc.desc      Waveform 1000Hz amp 0.1 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.1;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 1.6;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0018
     * @tc.name      testExtKeyboardWave0017
     * @tc.desc      Waveform 2000Hz amp 0.3 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.3;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 1.7000000000000002;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0019
     * @tc.name      testExtKeyboardWave0018
     * @tc.desc      Waveform 440Hz amp 0.5 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 1.8;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0020
     * @tc.name      testExtKeyboardWave0019
     * @tc.desc      Waveform 1000Hz amp 1.0 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 1.0;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 1.9000000000000001;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0021
     * @tc.name      testExtKeyboardWave0020
     * @tc.desc      Waveform 2000Hz amp 0.1 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.1;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 2.0;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0022
     * @tc.name      testExtKeyboardWave0021
     * @tc.desc      Waveform 440Hz amp 0.3 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 2.1;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0023
     * @tc.name      testExtKeyboardWave0022
     * @tc.desc      Waveform 1000Hz amp 0.5 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.5;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 2.2;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0024
     * @tc.name      testExtKeyboardWave0023
     * @tc.desc      Waveform 2000Hz amp 1.0 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 1.0;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 2.3000000000000003;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0025
     * @tc.name      testExtKeyboardWave0024
     * @tc.desc      Waveform 440Hz amp 0.1 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 2.4000000000000004;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0026
     * @tc.name      testExtKeyboardWave0025
     * @tc.desc      Waveform 1000Hz amp 0.3 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.3;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 2.5;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0027
     * @tc.name      testExtKeyboardWave0026
     * @tc.desc      Waveform 2000Hz amp 0.5 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.5;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 2.6;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0028
     * @tc.name      testExtKeyboardWave0027
     * @tc.desc      Waveform 440Hz amp 1.0 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 2.7;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0029
     * @tc.name      testExtKeyboardWave0028
     * @tc.desc      Waveform 1000Hz amp 0.1 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.1;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 2.8000000000000003;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0030
     * @tc.name      testExtKeyboardWave0029
     * @tc.desc      Waveform 2000Hz amp 0.3 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.3;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 2.9000000000000004;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0031
     * @tc.name      testExtKeyboardWave0030
     * @tc.desc      Waveform 440Hz amp 0.5 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 3.0;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0032
     * @tc.name      testExtKeyboardWave0031
     * @tc.desc      Waveform 1000Hz amp 1.0 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 1.0;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 3.1;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0033
     * @tc.name      testExtKeyboardWave0032
     * @tc.desc      Waveform 2000Hz amp 0.1 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.1;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 3.2;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0034
     * @tc.name      testExtKeyboardWave0033
     * @tc.desc      Waveform 440Hz amp 0.3 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 3.3000000000000003;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0035
     * @tc.name      testExtKeyboardWave0034
     * @tc.desc      Waveform 1000Hz amp 0.5 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.5;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 3.4000000000000004;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0036
     * @tc.name      testExtKeyboardWave0035
     * @tc.desc      Waveform 2000Hz amp 1.0 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 1.0;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 3.5;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0037
     * @tc.name      testExtKeyboardWave0036
     * @tc.desc      Waveform 440Hz amp 0.1 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 3.6;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0038
     * @tc.name      testExtKeyboardWave0037
     * @tc.desc      Waveform 1000Hz amp 0.3 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.3;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 3.7;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0039
     * @tc.name      testExtKeyboardWave0038
     * @tc.desc      Waveform 2000Hz amp 0.5 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.5;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 3.8000000000000003;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0040
     * @tc.name      testExtKeyboardWave0039
     * @tc.desc      Waveform 440Hz amp 1.0 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 3.9000000000000004;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0041
     * @tc.name      testExtKeyboardWave0040
     * @tc.desc      Waveform 1000Hz amp 0.1 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.1;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 4.0;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0042
     * @tc.name      testExtKeyboardWave0041
     * @tc.desc      Waveform 2000Hz amp 0.3 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.3;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 4.1000000000000005;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0043
     * @tc.name      testExtKeyboardWave0042
     * @tc.desc      Waveform 440Hz amp 0.5 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 4.2;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0044
     * @tc.name      testExtKeyboardWave0043
     * @tc.desc      Waveform 1000Hz amp 1.0 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 1.0;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 4.3;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0045
     * @tc.name      testExtKeyboardWave0044
     * @tc.desc      Waveform 2000Hz amp 0.1 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.1;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 4.4;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0046
     * @tc.name      testExtKeyboardWave0045
     * @tc.desc      Waveform 440Hz amp 0.3 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 4.5;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0047
     * @tc.name      testExtKeyboardWave0046
     * @tc.desc      Waveform 1000Hz amp 0.5 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.5;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 4.6000000000000005;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0048
     * @tc.name      testExtKeyboardWave0047
     * @tc.desc      Waveform 2000Hz amp 1.0 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 1.0;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 4.7;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0049
     * @tc.name      testExtKeyboardWave0048
     * @tc.desc      Waveform 440Hz amp 0.1 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 4.800000000000001;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0050
     * @tc.name      testExtKeyboardWave0049
     * @tc.desc      Waveform 1000Hz amp 0.3 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.3;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 4.9;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0051
     * @tc.name      testExtKeyboardWave0050
     * @tc.desc      Waveform 2000Hz amp 0.5 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.5;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 5.0;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0052
     * @tc.name      testExtKeyboardWave0051
     * @tc.desc      Waveform 440Hz amp 1.0 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 5.1000000000000005;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0053
     * @tc.name      testExtKeyboardWave0052
     * @tc.desc      Waveform 1000Hz amp 0.1 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.1;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 5.2;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0054
     * @tc.name      testExtKeyboardWave0053
     * @tc.desc      Waveform 2000Hz amp 0.3 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.3;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 5.300000000000001;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0055
     * @tc.name      testExtKeyboardWave0054
     * @tc.desc      Waveform 440Hz amp 0.5 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 5.4;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0056
     * @tc.name      testExtKeyboardWave0055
     * @tc.desc      Waveform 1000Hz amp 1.0 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 1.0;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 5.5;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0057
     * @tc.name      testExtKeyboardWave0056
     * @tc.desc      Waveform 2000Hz amp 0.1 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.1;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 5.6000000000000005;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0058
     * @tc.name      testExtKeyboardWave0057
     * @tc.desc      Waveform 440Hz amp 0.3 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 5.7;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0059
     * @tc.name      testExtKeyboardWave0058
     * @tc.desc      Waveform 1000Hz amp 0.5 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.5;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 5.800000000000001;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0060
     * @tc.name      testExtKeyboardWave0059
     * @tc.desc      Waveform 2000Hz amp 1.0 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 1.0;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 5.9;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0061
     * @tc.name      testExtKeyboardWave0060
     * @tc.desc      Waveform 440Hz amp 0.1 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 6.0;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0062
     * @tc.name      testExtKeyboardWave0061
     * @tc.desc      Waveform 1000Hz amp 0.3 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.3;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 6.1000000000000005;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0063
     * @tc.name      testExtKeyboardWave0062
     * @tc.desc      Waveform 2000Hz amp 0.5 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.5;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 6.2;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0064
     * @tc.name      testExtKeyboardWave0063
     * @tc.desc      Waveform 440Hz amp 1.0 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 6.300000000000001;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0065
     * @tc.name      testExtKeyboardWave0064
     * @tc.desc      Waveform 1000Hz amp 0.1 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.1;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 6.4;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0066
     * @tc.name      testExtKeyboardWave0065
     * @tc.desc      Waveform 2000Hz amp 0.3 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.3;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 6.5;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0067
     * @tc.name      testExtKeyboardWave0066
     * @tc.desc      Waveform 440Hz amp 0.5 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 6.6000000000000005;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0068
     * @tc.name      testExtKeyboardWave0067
     * @tc.desc      Waveform 1000Hz amp 1.0 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 1.0;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 6.7;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0069
     * @tc.name      testExtKeyboardWave0068
     * @tc.desc      Waveform 2000Hz amp 0.1 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.1;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 6.800000000000001;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0070
     * @tc.name      testExtKeyboardWave0069
     * @tc.desc      Waveform 440Hz amp 0.3 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 6.9;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0071
     * @tc.name      testExtKeyboardWave0070
     * @tc.desc      Waveform 1000Hz amp 0.5 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.5;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 7.0;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0072
     * @tc.name      testExtKeyboardWave0071
     * @tc.desc      Waveform 2000Hz amp 1.0 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 1.0;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 7.1000000000000005;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0073
     * @tc.name      testExtKeyboardWave0072
     * @tc.desc      Waveform 440Hz amp 0.1 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.1;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 7.2;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0074
     * @tc.name      testExtKeyboardWave0073
     * @tc.desc      Waveform 1000Hz amp 0.3 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.3;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 7.300000000000001;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0075
     * @tc.name      testExtKeyboardWave0074
     * @tc.desc      Waveform 2000Hz amp 0.5 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.5;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 7.4;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0076
     * @tc.name      testExtKeyboardWave0075
     * @tc.desc      Waveform 440Hz amp 1.0 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 1.0;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 7.5;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0077
     * @tc.name      testExtKeyboardWave0076
     * @tc.desc      Waveform 1000Hz amp 0.1 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.1;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 7.6000000000000005;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0078
     * @tc.name      testExtKeyboardWave0077
     * @tc.desc      Waveform 2000Hz amp 0.3 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.3;
      const frames: number = 256;
      const channels: number = 2;
      const phase: number = 7.7;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0079
     * @tc.name      testExtKeyboardWave0078
     * @tc.desc      Waveform 440Hz amp 0.5 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.5;
      const frames: number = 64;
      const channels: number = 1;
      const phase: number = 7.800000000000001;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0080
     * @tc.name      testExtKeyboardWave0079
     * @tc.desc      Waveform 1000Hz amp 1.0 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 1.0;
      const frames: number = 128;
      const channels: number = 2;
      const phase: number = 7.9;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0081
     * @tc.name      testExtKeyboardWave0080
     * @tc.desc      Waveform 2000Hz amp 0.1 frames 256.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 2000;
      const amplitude: number = 0.1;
      const frames: number = 256;
      const channels: number = 1;
      const phase: number = 8.0;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0082
     * @tc.name      testExtKeyboardWave0081
     * @tc.desc      Waveform 440Hz amp 0.3 frames 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const frames: number = 64;
      const channels: number = 2;
      const phase: number = 8.1;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_WAVE_0083
     * @tc.name      testExtKeyboardWave0082
     * @tc.desc      Waveform 1000Hz amp 0.5 frames 128.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardWave0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frequency: number = 1000;
      const amplitude: number = 0.5;
      const frames: number = 128;
      const channels: number = 1;
      const phase: number = 8.200000000000001;
      const sampleValue: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sampleValue));
      expect(frames).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
    })
  });
}
