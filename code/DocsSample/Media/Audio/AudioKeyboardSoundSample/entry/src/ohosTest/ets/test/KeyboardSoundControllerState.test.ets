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

const TAG: string = '[Sample_keyboardSoundControllerState]';
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

export default function keyboardSoundControllerStateTest(): void {
  describe('keyboardSoundControllerStateTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0001
     * @tc.name      testExtKeyboardState0000
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0002
     * @tc.name      testExtKeyboardState0001
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0003
     * @tc.name      testExtKeyboardState0002
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0004
     * @tc.name      testExtKeyboardState0003
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0005
     * @tc.name      testExtKeyboardState0004
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0006
     * @tc.name      testExtKeyboardState0005
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0007
     * @tc.name      testExtKeyboardState0006
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0008
     * @tc.name      testExtKeyboardState0007
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0009
     * @tc.name      testExtKeyboardState0008
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0010
     * @tc.name      testExtKeyboardState0009
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0011
     * @tc.name      testExtKeyboardState0010
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0012
     * @tc.name      testExtKeyboardState0011
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0013
     * @tc.name      testExtKeyboardState0012
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0014
     * @tc.name      testExtKeyboardState0013
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0015
     * @tc.name      testExtKeyboardState0014
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0016
     * @tc.name      testExtKeyboardState0015
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0017
     * @tc.name      testExtKeyboardState0016
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0018
     * @tc.name      testExtKeyboardState0017
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0019
     * @tc.name      testExtKeyboardState0018
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0020
     * @tc.name      testExtKeyboardState0019
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0021
     * @tc.name      testExtKeyboardState0020
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0022
     * @tc.name      testExtKeyboardState0021
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0023
     * @tc.name      testExtKeyboardState0022
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0024
     * @tc.name      testExtKeyboardState0023
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0025
     * @tc.name      testExtKeyboardState0024
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0026
     * @tc.name      testExtKeyboardState0025
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0027
     * @tc.name      testExtKeyboardState0026
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0028
     * @tc.name      testExtKeyboardState0027
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0029
     * @tc.name      testExtKeyboardState0028
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0030
     * @tc.name      testExtKeyboardState0029
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0031
     * @tc.name      testExtKeyboardState0030
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0032
     * @tc.name      testExtKeyboardState0031
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0033
     * @tc.name      testExtKeyboardState0032
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0034
     * @tc.name      testExtKeyboardState0033
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0035
     * @tc.name      testExtKeyboardState0034
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0036
     * @tc.name      testExtKeyboardState0035
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0037
     * @tc.name      testExtKeyboardState0036
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0038
     * @tc.name      testExtKeyboardState0037
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0039
     * @tc.name      testExtKeyboardState0038
     * @tc.desc      DefaultKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_STATE_0040
     * @tc.name      testExtKeyboardState0039
     * @tc.desc      SolutionKeyboardController sequence before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      let hasError = false;
      try {
        await controller.play();
        await controller.release();
        await controller.play();
      } catch (err) { hasError = true; }
      expect(hasError).assertFalse();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
  });
}
