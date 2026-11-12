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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { audio } from '@kit.AudioKit';
import Utils from '../Util.test';
import { SolutionKeyboardController } from '../../../main/ets/common/controllers/KeyboardSoundController';

const TAG: string = '[Sample_keyboardSoundSolution]';
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

export default function KeyboardSoundSolutionTest(): void {
  describe('KeyboardSoundSolutionTest', () => {
    beforeEach(async () => {
      await Utils.msSleep(30);
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOLUTION_0100
     * @tc.name      testKeyboardSoundSolutionRenderer0001
     * @tc.desc      Notification renderer creation reports the STREAM_USAGE_NOTIFICATION usage.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundSolutionRenderer0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const renderer = await audio.createAudioRenderer(Utils.getNotificationRendererOptions());
      expect(renderer != null).assertTrue();
      const info = await renderer.getRendererInfo();
      expect(info.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
      await renderer.release();
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOLUTION_0200
     * @tc.name      testKeyboardSoundSolutionLifecycle0002
     * @tc.desc      Solution controller supports init, play and release lifecycle.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundSolutionLifecycle0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const controller = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.init();
        await controller.play();
        await controller.release();
      } catch (err) {
        hasError = true;
      }
      expect(hasError).assertFalse();
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOLUTION_0300
     * @tc.name      testKeyboardSoundSolutionGuards0003
     * @tc.desc      Play and resetStrategy before init stay silent without any renderer.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundSolutionGuards0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const controller = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        controller.resetStrategy();
      } catch (err) {
        hasError = true;
      }
      expect(hasError).assertFalse();
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOLUTION_0400
     * @tc.name      testKeyboardSoundSolutionStrategy0004
     * @tc.desc      Notification renderer accepts MIX_WITH_OTHERS then resets to DEFAULT mode.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundSolutionStrategy0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const renderer = await audio.createAudioRenderer(Utils.getNotificationRendererOptions());
      expect(renderer != null).assertTrue();
      let hasError = false;
      try {
        renderer.setIndependentAudioSessionStrategy({
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
        }, audio.AudioSessionBehaviorFlags.DEFAULT_BEHAVIOR);
        renderer.setIndependentAudioSessionStrategy({
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }, audio.AudioSessionBehaviorFlags.DEFAULT_BEHAVIOR);
      } catch (err) {
        hasError = true;
      }
      await renderer.release();
      expect(hasError).assertFalse();
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOLUTION_0500
     * @tc.name      testKeyboardSoundSolutionReset0005
     * @tc.desc      Initialized controller resets the audio session strategy before release.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundSolutionReset0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const controller = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.init();
        controller.resetStrategy();
        await controller.release();
      } catch (err) {
        hasError = true;
      }
      expect(hasError).assertFalse();
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOLUTION_0600
     * @tc.name      testKeyboardSoundSolutionConcurrent0006
     * @tc.desc      Solution NOTIFICATION renderer survives rapid replays: later play and release succeed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundSolutionConcurrent0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const controller = new SolutionKeyboardController();
      await controller.init();
      const results = await Promise.allSettled([controller.play(), controller.play()]);
      const fulfilledCount =
        results.filter((r: PromiseSettledResult<void>): boolean => r.status === 'fulfilled').length;
      expect(fulfilledCount >= 1).assertTrue();
      let replayOk = false;
      try {
        await controller.play();
        replayOk = true;
      } catch (err) {
        replayOk = false;
      }
      expect(replayOk).assertTrue();
      let releaseOk = false;
      try {
        await controller.release();
        releaseOk = true;
      } catch (err) {
        releaseOk = false;
      }
      expect(releaseOk).assertTrue();
    })

    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOLUTION_0700
     * @tc.name      testKeyboardSoundSolutionReRelease0007
     * @tc.desc      Repeated release after init stays silent without throwing errors.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it("testKeyboardSoundSolutionReRelease0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const controller = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.init();
        await controller.release();
        await controller.release();
      } catch (err) {
        hasError = true;
      }
      expect(hasError).assertFalse();
    })
  })
}
