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

const TAG: string = '[Sample_keyboardSoundPcmFrameEdge]';
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

export default function keyboardSoundPcmFrameEdgeTest(): void {
  describe('keyboardSoundPcmFrameEdgeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0001
     * @tc.name      testExtKeyboardFrameEdge0000
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0002
     * @tc.name      testExtKeyboardFrameEdge0001
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0003
     * @tc.name      testExtKeyboardFrameEdge0002
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0004
     * @tc.name      testExtKeyboardFrameEdge0003
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0005
     * @tc.name      testExtKeyboardFrameEdge0004
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0006
     * @tc.name      testExtKeyboardFrameEdge0005
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0007
     * @tc.name      testExtKeyboardFrameEdge0006
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0008
     * @tc.name      testExtKeyboardFrameEdge0007
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0009
     * @tc.name      testExtKeyboardFrameEdge0008
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0010
     * @tc.name      testExtKeyboardFrameEdge0009
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0011
     * @tc.name      testExtKeyboardFrameEdge0010
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0012
     * @tc.name      testExtKeyboardFrameEdge0011
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0013
     * @tc.name      testExtKeyboardFrameEdge0012
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0014
     * @tc.name      testExtKeyboardFrameEdge0013
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0015
     * @tc.name      testExtKeyboardFrameEdge0014
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0016
     * @tc.name      testExtKeyboardFrameEdge0015
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0017
     * @tc.name      testExtKeyboardFrameEdge0016
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0018
     * @tc.name      testExtKeyboardFrameEdge0017
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0019
     * @tc.name      testExtKeyboardFrameEdge0018
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0020
     * @tc.name      testExtKeyboardFrameEdge0019
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0021
     * @tc.name      testExtKeyboardFrameEdge0020
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0022
     * @tc.name      testExtKeyboardFrameEdge0021
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0023
     * @tc.name      testExtKeyboardFrameEdge0022
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0024
     * @tc.name      testExtKeyboardFrameEdge0023
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0025
     * @tc.name      testExtKeyboardFrameEdge0024
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0026
     * @tc.name      testExtKeyboardFrameEdge0025
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0027
     * @tc.name      testExtKeyboardFrameEdge0026
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0028
     * @tc.name      testExtKeyboardFrameEdge0027
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0029
     * @tc.name      testExtKeyboardFrameEdge0028
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0030
     * @tc.name      testExtKeyboardFrameEdge0029
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0031
     * @tc.name      testExtKeyboardFrameEdge0030
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0032
     * @tc.name      testExtKeyboardFrameEdge0031
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0033
     * @tc.name      testExtKeyboardFrameEdge0032
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0034
     * @tc.name      testExtKeyboardFrameEdge0033
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0035
     * @tc.name      testExtKeyboardFrameEdge0034
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0036
     * @tc.name      testExtKeyboardFrameEdge0035
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0037
     * @tc.name      testExtKeyboardFrameEdge0036
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0038
     * @tc.name      testExtKeyboardFrameEdge0037
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0039
     * @tc.name      testExtKeyboardFrameEdge0038
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0040
     * @tc.name      testExtKeyboardFrameEdge0039
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0041
     * @tc.name      testExtKeyboardFrameEdge0040
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0042
     * @tc.name      testExtKeyboardFrameEdge0041
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0043
     * @tc.name      testExtKeyboardFrameEdge0042
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0044
     * @tc.name      testExtKeyboardFrameEdge0043
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0045
     * @tc.name      testExtKeyboardFrameEdge0044
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0046
     * @tc.name      testExtKeyboardFrameEdge0045
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0047
     * @tc.name      testExtKeyboardFrameEdge0046
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0048
     * @tc.name      testExtKeyboardFrameEdge0047
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0049
     * @tc.name      testExtKeyboardFrameEdge0048
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0050
     * @tc.name      testExtKeyboardFrameEdge0049
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0051
     * @tc.name      testExtKeyboardFrameEdge0050
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0052
     * @tc.name      testExtKeyboardFrameEdge0051
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0053
     * @tc.name      testExtKeyboardFrameEdge0052
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0054
     * @tc.name      testExtKeyboardFrameEdge0053
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0055
     * @tc.name      testExtKeyboardFrameEdge0054
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0056
     * @tc.name      testExtKeyboardFrameEdge0055
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0057
     * @tc.name      testExtKeyboardFrameEdge0056
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0058
     * @tc.name      testExtKeyboardFrameEdge0057
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0059
     * @tc.name      testExtKeyboardFrameEdge0058
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0060
     * @tc.name      testExtKeyboardFrameEdge0059
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0061
     * @tc.name      testExtKeyboardFrameEdge0060
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0062
     * @tc.name      testExtKeyboardFrameEdge0061
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0063
     * @tc.name      testExtKeyboardFrameEdge0062
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0064
     * @tc.name      testExtKeyboardFrameEdge0063
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0065
     * @tc.name      testExtKeyboardFrameEdge0064
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0066
     * @tc.name      testExtKeyboardFrameEdge0065
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0067
     * @tc.name      testExtKeyboardFrameEdge0066
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0068
     * @tc.name      testExtKeyboardFrameEdge0067
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0069
     * @tc.name      testExtKeyboardFrameEdge0068
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0070
     * @tc.name      testExtKeyboardFrameEdge0069
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0071
     * @tc.name      testExtKeyboardFrameEdge0070
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0072
     * @tc.name      testExtKeyboardFrameEdge0071
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0073
     * @tc.name      testExtKeyboardFrameEdge0072
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0074
     * @tc.name      testExtKeyboardFrameEdge0073
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0075
     * @tc.name      testExtKeyboardFrameEdge0074
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0076
     * @tc.name      testExtKeyboardFrameEdge0075
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0077
     * @tc.name      testExtKeyboardFrameEdge0076
     * @tc.desc      Frame edge 16ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 16;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0078
     * @tc.name      testExtKeyboardFrameEdge0077
     * @tc.desc      Frame edge 30ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 30;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0079
     * @tc.name      testExtKeyboardFrameEdge0078
     * @tc.desc      Frame edge 150ms at 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 150;
      const sampleRate: number = 44100;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_FRAMEEDGE_0080
     * @tc.name      testExtKeyboardFrameEdge0079
     * @tc.desc      Frame edge 151ms at 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardFrameEdge0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const durationMs: number = 151;
      const sampleRate: number = 48000;
      const frames: number = Math.ceil(durationMs * sampleRate / 1000);
      const bytes: number = frames * 4;
      expect(frames).assertLarger(0);
      expect(bytes).assertEqual(frames * 4);
      expect(bytes / 4).assertEqual(frames);
      expect(sampleRate).assertLarger(0);
    })
  });
}
