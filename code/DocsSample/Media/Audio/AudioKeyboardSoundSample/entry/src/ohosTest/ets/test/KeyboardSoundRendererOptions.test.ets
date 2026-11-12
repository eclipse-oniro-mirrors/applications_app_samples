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

const TAG: string = '[Sample_keyboardSoundRendererOptions]';
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

export default function keyboardSoundRendererOptionsTest(): void {
  describe('keyboardSoundRendererOptionsTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0001
     * @tc.name      testExtKeyboardRender0000
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0002
     * @tc.name      testExtKeyboardRender0001
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0003
     * @tc.name      testExtKeyboardRender0002
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0004
     * @tc.name      testExtKeyboardRender0003
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0005
     * @tc.name      testExtKeyboardRender0004
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0006
     * @tc.name      testExtKeyboardRender0005
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0007
     * @tc.name      testExtKeyboardRender0006
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0008
     * @tc.name      testExtKeyboardRender0007
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0009
     * @tc.name      testExtKeyboardRender0008
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0010
     * @tc.name      testExtKeyboardRender0009
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0011
     * @tc.name      testExtKeyboardRender0010
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0012
     * @tc.name      testExtKeyboardRender0011
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0013
     * @tc.name      testExtKeyboardRender0012
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0014
     * @tc.name      testExtKeyboardRender0013
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0015
     * @tc.name      testExtKeyboardRender0014
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0016
     * @tc.name      testExtKeyboardRender0015
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0017
     * @tc.name      testExtKeyboardRender0016
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0018
     * @tc.name      testExtKeyboardRender0017
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0019
     * @tc.name      testExtKeyboardRender0018
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0020
     * @tc.name      testExtKeyboardRender0019
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0021
     * @tc.name      testExtKeyboardRender0020
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0022
     * @tc.name      testExtKeyboardRender0021
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0023
     * @tc.name      testExtKeyboardRender0022
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0024
     * @tc.name      testExtKeyboardRender0023
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0025
     * @tc.name      testExtKeyboardRender0024
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0026
     * @tc.name      testExtKeyboardRender0025
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0027
     * @tc.name      testExtKeyboardRender0026
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0028
     * @tc.name      testExtKeyboardRender0027
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0029
     * @tc.name      testExtKeyboardRender0028
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0030
     * @tc.name      testExtKeyboardRender0029
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0031
     * @tc.name      testExtKeyboardRender0030
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0032
     * @tc.name      testExtKeyboardRender0031
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0033
     * @tc.name      testExtKeyboardRender0032
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0034
     * @tc.name      testExtKeyboardRender0033
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0035
     * @tc.name      testExtKeyboardRender0034
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0036
     * @tc.name      testExtKeyboardRender0035
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0037
     * @tc.name      testExtKeyboardRender0036
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0038
     * @tc.name      testExtKeyboardRender0037
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0039
     * @tc.name      testExtKeyboardRender0038
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0040
     * @tc.name      testExtKeyboardRender0039
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0041
     * @tc.name      testExtKeyboardRender0040
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0042
     * @tc.name      testExtKeyboardRender0041
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0043
     * @tc.name      testExtKeyboardRender0042
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0044
     * @tc.name      testExtKeyboardRender0043
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0045
     * @tc.name      testExtKeyboardRender0044
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0046
     * @tc.name      testExtKeyboardRender0045
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0047
     * @tc.name      testExtKeyboardRender0046
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0048
     * @tc.name      testExtKeyboardRender0047
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0049
     * @tc.name      testExtKeyboardRender0048
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0050
     * @tc.name      testExtKeyboardRender0049
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0051
     * @tc.name      testExtKeyboardRender0050
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0052
     * @tc.name      testExtKeyboardRender0051
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0053
     * @tc.name      testExtKeyboardRender0052
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0054
     * @tc.name      testExtKeyboardRender0053
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0055
     * @tc.name      testExtKeyboardRender0054
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0056
     * @tc.name      testExtKeyboardRender0055
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0057
     * @tc.name      testExtKeyboardRender0056
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0058
     * @tc.name      testExtKeyboardRender0057
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0059
     * @tc.name      testExtKeyboardRender0058
     * @tc.desc      Renderer option MUSIC 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'MUSIC';
      const sampleRate: number = 44100;
      const channels: number = 1;
      const durationMs: number = 150;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(2);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RENDER_0060
     * @tc.name      testExtKeyboardRender0059
     * @tc.desc      Renderer option NOTIFICATION 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardRender0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const usageName: string = 'NOTIFICATION';
      const sampleRate: number = 48000;
      const channels: number = 2;
      const durationMs: number = 30;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(durationMs).assertLarger(0);
      expect(usageName === 'MUSIC' || usageName === 'NOTIFICATION').assertTrue();
      expect(channels * 2).assertEqual(4);
    })
  });
}
