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

const TAG: string = '[Sample_keyboardSoundDurationEnvelopeCore]';
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

export default function keyboardSoundDurationEnvelopeCoreTest(): void {
  describe('keyboardSoundDurationEnvelopeCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0001
     * @tc.name      testExtKeyboardEnvelope0000
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0002
     * @tc.name      testExtKeyboardEnvelope0001
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0003
     * @tc.name      testExtKeyboardEnvelope0002
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0004
     * @tc.name      testExtKeyboardEnvelope0003
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0005
     * @tc.name      testExtKeyboardEnvelope0004
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0006
     * @tc.name      testExtKeyboardEnvelope0005
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0007
     * @tc.name      testExtKeyboardEnvelope0006
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0008
     * @tc.name      testExtKeyboardEnvelope0007
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0009
     * @tc.name      testExtKeyboardEnvelope0008
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0010
     * @tc.name      testExtKeyboardEnvelope0009
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0011
     * @tc.name      testExtKeyboardEnvelope0010
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0012
     * @tc.name      testExtKeyboardEnvelope0011
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0013
     * @tc.name      testExtKeyboardEnvelope0012
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0014
     * @tc.name      testExtKeyboardEnvelope0013
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0015
     * @tc.name      testExtKeyboardEnvelope0014
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0016
     * @tc.name      testExtKeyboardEnvelope0015
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0017
     * @tc.name      testExtKeyboardEnvelope0016
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0018
     * @tc.name      testExtKeyboardEnvelope0017
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0019
     * @tc.name      testExtKeyboardEnvelope0018
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0020
     * @tc.name      testExtKeyboardEnvelope0019
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0021
     * @tc.name      testExtKeyboardEnvelope0020
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0022
     * @tc.name      testExtKeyboardEnvelope0021
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0023
     * @tc.name      testExtKeyboardEnvelope0022
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0024
     * @tc.name      testExtKeyboardEnvelope0023
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0025
     * @tc.name      testExtKeyboardEnvelope0024
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0026
     * @tc.name      testExtKeyboardEnvelope0025
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0027
     * @tc.name      testExtKeyboardEnvelope0026
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0028
     * @tc.name      testExtKeyboardEnvelope0027
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0029
     * @tc.name      testExtKeyboardEnvelope0028
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0030
     * @tc.name      testExtKeyboardEnvelope0029
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0031
     * @tc.name      testExtKeyboardEnvelope0030
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0032
     * @tc.name      testExtKeyboardEnvelope0031
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0033
     * @tc.name      testExtKeyboardEnvelope0032
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0034
     * @tc.name      testExtKeyboardEnvelope0033
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0035
     * @tc.name      testExtKeyboardEnvelope0034
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0036
     * @tc.name      testExtKeyboardEnvelope0035
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0037
     * @tc.name      testExtKeyboardEnvelope0036
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0038
     * @tc.name      testExtKeyboardEnvelope0037
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0039
     * @tc.name      testExtKeyboardEnvelope0038
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0040
     * @tc.name      testExtKeyboardEnvelope0039
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0041
     * @tc.name      testExtKeyboardEnvelope0040
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0042
     * @tc.name      testExtKeyboardEnvelope0041
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0043
     * @tc.name      testExtKeyboardEnvelope0042
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0044
     * @tc.name      testExtKeyboardEnvelope0043
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0045
     * @tc.name      testExtKeyboardEnvelope0044
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0046
     * @tc.name      testExtKeyboardEnvelope0045
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0047
     * @tc.name      testExtKeyboardEnvelope0046
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0048
     * @tc.name      testExtKeyboardEnvelope0047
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0049
     * @tc.name      testExtKeyboardEnvelope0048
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0050
     * @tc.name      testExtKeyboardEnvelope0049
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0051
     * @tc.name      testExtKeyboardEnvelope0050
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0052
     * @tc.name      testExtKeyboardEnvelope0051
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0053
     * @tc.name      testExtKeyboardEnvelope0052
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0054
     * @tc.name      testExtKeyboardEnvelope0053
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0055
     * @tc.name      testExtKeyboardEnvelope0054
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0056
     * @tc.name      testExtKeyboardEnvelope0055
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0057
     * @tc.name      testExtKeyboardEnvelope0056
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0058
     * @tc.name      testExtKeyboardEnvelope0057
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0059
     * @tc.name      testExtKeyboardEnvelope0058
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0060
     * @tc.name      testExtKeyboardEnvelope0059
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0061
     * @tc.name      testExtKeyboardEnvelope0060
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0062
     * @tc.name      testExtKeyboardEnvelope0061
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0063
     * @tc.name      testExtKeyboardEnvelope0062
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0064
     * @tc.name      testExtKeyboardEnvelope0063
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0065
     * @tc.name      testExtKeyboardEnvelope0064
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0066
     * @tc.name      testExtKeyboardEnvelope0065
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0067
     * @tc.name      testExtKeyboardEnvelope0066
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0068
     * @tc.name      testExtKeyboardEnvelope0067
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0069
     * @tc.name      testExtKeyboardEnvelope0068
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0070
     * @tc.name      testExtKeyboardEnvelope0069
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0071
     * @tc.name      testExtKeyboardEnvelope0070
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0072
     * @tc.name      testExtKeyboardEnvelope0071
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0073
     * @tc.name      testExtKeyboardEnvelope0072
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0074
     * @tc.name      testExtKeyboardEnvelope0073
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0075
     * @tc.name      testExtKeyboardEnvelope0074
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0076
     * @tc.name      testExtKeyboardEnvelope0075
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0077
     * @tc.name      testExtKeyboardEnvelope0076
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0078
     * @tc.name      testExtKeyboardEnvelope0077
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0079
     * @tc.name      testExtKeyboardEnvelope0078
     * @tc.desc      Duration 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.3;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_ENVELOPE_0080
     * @tc.name      testExtKeyboardEnvelope0079
     * @tc.desc      Duration 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardEnvelope0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 2 * 2;
      const amplitude: number = 0.5;
      const first: number = Math.floor(Math.sin(0) * amplitude * 32767);
      const last: number = Math.floor(Math.sin(2 * Math.PI) * amplitude * 32767);
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(first).assertEqual(0);
      expect(Math.abs(last)).assertLessOrEqual(1);
    })
  });
}
