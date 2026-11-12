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
import { DefaultKeyboardController, SolutionKeyboardController } from '../../../main/ets/common/controllers/KeyboardSoundController';

const TAG: string = '[Sample_keyboardSoundControllerReset]';
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

export default function keyboardSoundControllerResetTest(): void {
  describe('keyboardSoundControllerResetTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0001
     * @tc.name      testExtKeyboardReset0000
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0002
     * @tc.name      testExtKeyboardReset0001
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0003
     * @tc.name      testExtKeyboardReset0002
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0004
     * @tc.name      testExtKeyboardReset0003
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0005
     * @tc.name      testExtKeyboardReset0004
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0006
     * @tc.name      testExtKeyboardReset0005
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0007
     * @tc.name      testExtKeyboardReset0006
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0008
     * @tc.name      testExtKeyboardReset0007
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0009
     * @tc.name      testExtKeyboardReset0008
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0010
     * @tc.name      testExtKeyboardReset0009
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0011
     * @tc.name      testExtKeyboardReset0010
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0012
     * @tc.name      testExtKeyboardReset0011
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0013
     * @tc.name      testExtKeyboardReset0012
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0014
     * @tc.name      testExtKeyboardReset0013
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0015
     * @tc.name      testExtKeyboardReset0014
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0016
     * @tc.name      testExtKeyboardReset0015
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0017
     * @tc.name      testExtKeyboardReset0016
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0018
     * @tc.name      testExtKeyboardReset0017
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0019
     * @tc.name      testExtKeyboardReset0018
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0020
     * @tc.name      testExtKeyboardReset0019
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0021
     * @tc.name      testExtKeyboardReset0020
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0022
     * @tc.name      testExtKeyboardReset0021
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0023
     * @tc.name      testExtKeyboardReset0022
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0024
     * @tc.name      testExtKeyboardReset0023
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0025
     * @tc.name      testExtKeyboardReset0024
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0026
     * @tc.name      testExtKeyboardReset0025
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0027
     * @tc.name      testExtKeyboardReset0026
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0028
     * @tc.name      testExtKeyboardReset0027
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0029
     * @tc.name      testExtKeyboardReset0028
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0030
     * @tc.name      testExtKeyboardReset0029
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0031
     * @tc.name      testExtKeyboardReset0030
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0032
     * @tc.name      testExtKeyboardReset0031
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0033
     * @tc.name      testExtKeyboardReset0032
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0034
     * @tc.name      testExtKeyboardReset0033
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0035
     * @tc.name      testExtKeyboardReset0034
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0036
     * @tc.name      testExtKeyboardReset0035
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0037
     * @tc.name      testExtKeyboardReset0036
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0038
     * @tc.name      testExtKeyboardReset0037
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0039
     * @tc.name      testExtKeyboardReset0038
     * @tc.desc      DefaultKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_RESET_0040
     * @tc.name      testExtKeyboardReset0039
     * @tc.desc      SolutionKeyboardController reset/release sequence.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardReset0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.release();
        controller.resetStrategy();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
    })
  });
}
