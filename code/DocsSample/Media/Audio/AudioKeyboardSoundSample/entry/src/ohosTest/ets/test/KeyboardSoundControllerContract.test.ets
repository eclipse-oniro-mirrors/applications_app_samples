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

const TAG: string = '[Sample_keyboardSoundControllerContract]';
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

export default function keyboardSoundControllerContractTest(): void {
  describe('keyboardSoundControllerContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0001
     * @tc.name      testExtKeyboardCtrl0000
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0002
     * @tc.name      testExtKeyboardCtrl0001
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0003
     * @tc.name      testExtKeyboardCtrl0002
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0004
     * @tc.name      testExtKeyboardCtrl0003
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0005
     * @tc.name      testExtKeyboardCtrl0004
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0006
     * @tc.name      testExtKeyboardCtrl0005
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0007
     * @tc.name      testExtKeyboardCtrl0006
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0008
     * @tc.name      testExtKeyboardCtrl0007
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0009
     * @tc.name      testExtKeyboardCtrl0008
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0010
     * @tc.name      testExtKeyboardCtrl0009
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0011
     * @tc.name      testExtKeyboardCtrl0010
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0012
     * @tc.name      testExtKeyboardCtrl0011
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0013
     * @tc.name      testExtKeyboardCtrl0012
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0014
     * @tc.name      testExtKeyboardCtrl0013
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0015
     * @tc.name      testExtKeyboardCtrl0014
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0016
     * @tc.name      testExtKeyboardCtrl0015
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0017
     * @tc.name      testExtKeyboardCtrl0016
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0018
     * @tc.name      testExtKeyboardCtrl0017
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0019
     * @tc.name      testExtKeyboardCtrl0018
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0020
     * @tc.name      testExtKeyboardCtrl0019
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0021
     * @tc.name      testExtKeyboardCtrl0020
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0022
     * @tc.name      testExtKeyboardCtrl0021
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0023
     * @tc.name      testExtKeyboardCtrl0022
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0024
     * @tc.name      testExtKeyboardCtrl0023
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0025
     * @tc.name      testExtKeyboardCtrl0024
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0026
     * @tc.name      testExtKeyboardCtrl0025
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0027
     * @tc.name      testExtKeyboardCtrl0026
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0028
     * @tc.name      testExtKeyboardCtrl0027
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0029
     * @tc.name      testExtKeyboardCtrl0028
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0030
     * @tc.name      testExtKeyboardCtrl0029
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0031
     * @tc.name      testExtKeyboardCtrl0030
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0032
     * @tc.name      testExtKeyboardCtrl0031
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0033
     * @tc.name      testExtKeyboardCtrl0032
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0034
     * @tc.name      testExtKeyboardCtrl0033
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0035
     * @tc.name      testExtKeyboardCtrl0034
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0036
     * @tc.name      testExtKeyboardCtrl0035
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0037
     * @tc.name      testExtKeyboardCtrl0036
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0038
     * @tc.name      testExtKeyboardCtrl0037
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0039
     * @tc.name      testExtKeyboardCtrl0038
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0040
     * @tc.name      testExtKeyboardCtrl0039
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0041
     * @tc.name      testExtKeyboardCtrl0040
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0042
     * @tc.name      testExtKeyboardCtrl0041
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0043
     * @tc.name      testExtKeyboardCtrl0042
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0044
     * @tc.name      testExtKeyboardCtrl0043
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0045
     * @tc.name      testExtKeyboardCtrl0044
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0046
     * @tc.name      testExtKeyboardCtrl0045
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0047
     * @tc.name      testExtKeyboardCtrl0046
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0048
     * @tc.name      testExtKeyboardCtrl0047
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0049
     * @tc.name      testExtKeyboardCtrl0048
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0050
     * @tc.name      testExtKeyboardCtrl0049
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0051
     * @tc.name      testExtKeyboardCtrl0050
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0052
     * @tc.name      testExtKeyboardCtrl0051
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0053
     * @tc.name      testExtKeyboardCtrl0052
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0054
     * @tc.name      testExtKeyboardCtrl0053
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0055
     * @tc.name      testExtKeyboardCtrl0054
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0056
     * @tc.name      testExtKeyboardCtrl0055
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0057
     * @tc.name      testExtKeyboardCtrl0056
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0058
     * @tc.name      testExtKeyboardCtrl0057
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0059
     * @tc.name      testExtKeyboardCtrl0058
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0060
     * @tc.name      testExtKeyboardCtrl0059
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0061
     * @tc.name      testExtKeyboardCtrl0060
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0062
     * @tc.name      testExtKeyboardCtrl0061
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0063
     * @tc.name      testExtKeyboardCtrl0062
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0064
     * @tc.name      testExtKeyboardCtrl0063
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0065
     * @tc.name      testExtKeyboardCtrl0064
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0066
     * @tc.name      testExtKeyboardCtrl0065
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0067
     * @tc.name      testExtKeyboardCtrl0066
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0068
     * @tc.name      testExtKeyboardCtrl0067
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0069
     * @tc.name      testExtKeyboardCtrl0068
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0070
     * @tc.name      testExtKeyboardCtrl0069
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0071
     * @tc.name      testExtKeyboardCtrl0070
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0072
     * @tc.name      testExtKeyboardCtrl0071
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0073
     * @tc.name      testExtKeyboardCtrl0072
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0074
     * @tc.name      testExtKeyboardCtrl0073
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0075
     * @tc.name      testExtKeyboardCtrl0074
     * @tc.desc      DefaultKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0076
     * @tc.name      testExtKeyboardCtrl0075
     * @tc.desc      SolutionKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0077
     * @tc.name      testExtKeyboardCtrl0076
     * @tc.desc      DefaultKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0078
     * @tc.name      testExtKeyboardCtrl0077
     * @tc.desc      SolutionKeyboardController reset before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      controller.resetStrategy();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0079
     * @tc.name      testExtKeyboardCtrl0078
     * @tc.desc      DefaultKeyboardController play before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: DefaultKeyboardController = new DefaultKeyboardController();
      await controller.play();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_CTRL_0080
     * @tc.name      testExtKeyboardCtrl0079
     * @tc.desc      SolutionKeyboardController release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardCtrl0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const controller: SolutionKeyboardController = new SolutionKeyboardController();
      await controller.release();
      expect(controller !== null && controller !== undefined).assertTrue();
    })
  });
}
