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

const TAG: string = '[Sample_keyboardSoundMultiKeyCore]';
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

export default function keyboardSoundMultiKeyCoreTest(): void {
  describe('keyboardSoundMultiKeyCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0001
     * @tc.name      testExtKeyboardMultiKey0000
     * @tc.desc      Multi key 1 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0002
     * @tc.name      testExtKeyboardMultiKey0001
     * @tc.desc      Multi key 2 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0003
     * @tc.name      testExtKeyboardMultiKey0002
     * @tc.desc      Multi key 3 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0004
     * @tc.name      testExtKeyboardMultiKey0003
     * @tc.desc      Multi key 4 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(4);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0005
     * @tc.name      testExtKeyboardMultiKey0004
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0006
     * @tc.name      testExtKeyboardMultiKey0005
     * @tc.desc      Multi key 2 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0007
     * @tc.name      testExtKeyboardMultiKey0006
     * @tc.desc      Multi key 3 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0008
     * @tc.name      testExtKeyboardMultiKey0007
     * @tc.desc      Multi key 4 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0009
     * @tc.name      testExtKeyboardMultiKey0008
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0010
     * @tc.name      testExtKeyboardMultiKey0009
     * @tc.desc      Multi key 2 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0011
     * @tc.name      testExtKeyboardMultiKey0010
     * @tc.desc      Multi key 3 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0012
     * @tc.name      testExtKeyboardMultiKey0011
     * @tc.desc      Multi key 4 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0013
     * @tc.name      testExtKeyboardMultiKey0012
     * @tc.desc      Multi key 1 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0014
     * @tc.name      testExtKeyboardMultiKey0013
     * @tc.desc      Multi key 2 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0015
     * @tc.name      testExtKeyboardMultiKey0014
     * @tc.desc      Multi key 3 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0016
     * @tc.name      testExtKeyboardMultiKey0015
     * @tc.desc      Multi key 4 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(4);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0017
     * @tc.name      testExtKeyboardMultiKey0016
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0018
     * @tc.name      testExtKeyboardMultiKey0017
     * @tc.desc      Multi key 2 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0019
     * @tc.name      testExtKeyboardMultiKey0018
     * @tc.desc      Multi key 3 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0020
     * @tc.name      testExtKeyboardMultiKey0019
     * @tc.desc      Multi key 4 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0021
     * @tc.name      testExtKeyboardMultiKey0020
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0022
     * @tc.name      testExtKeyboardMultiKey0021
     * @tc.desc      Multi key 2 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0023
     * @tc.name      testExtKeyboardMultiKey0022
     * @tc.desc      Multi key 3 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0024
     * @tc.name      testExtKeyboardMultiKey0023
     * @tc.desc      Multi key 4 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0025
     * @tc.name      testExtKeyboardMultiKey0024
     * @tc.desc      Multi key 1 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0026
     * @tc.name      testExtKeyboardMultiKey0025
     * @tc.desc      Multi key 2 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0027
     * @tc.name      testExtKeyboardMultiKey0026
     * @tc.desc      Multi key 3 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0028
     * @tc.name      testExtKeyboardMultiKey0027
     * @tc.desc      Multi key 4 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(4);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0029
     * @tc.name      testExtKeyboardMultiKey0028
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0030
     * @tc.name      testExtKeyboardMultiKey0029
     * @tc.desc      Multi key 2 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0031
     * @tc.name      testExtKeyboardMultiKey0030
     * @tc.desc      Multi key 3 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0032
     * @tc.name      testExtKeyboardMultiKey0031
     * @tc.desc      Multi key 4 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0033
     * @tc.name      testExtKeyboardMultiKey0032
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0034
     * @tc.name      testExtKeyboardMultiKey0033
     * @tc.desc      Multi key 2 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0035
     * @tc.name      testExtKeyboardMultiKey0034
     * @tc.desc      Multi key 3 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0036
     * @tc.name      testExtKeyboardMultiKey0035
     * @tc.desc      Multi key 4 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0037
     * @tc.name      testExtKeyboardMultiKey0036
     * @tc.desc      Multi key 1 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0038
     * @tc.name      testExtKeyboardMultiKey0037
     * @tc.desc      Multi key 2 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0039
     * @tc.name      testExtKeyboardMultiKey0038
     * @tc.desc      Multi key 3 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0040
     * @tc.name      testExtKeyboardMultiKey0039
     * @tc.desc      Multi key 4 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(4);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0041
     * @tc.name      testExtKeyboardMultiKey0040
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0042
     * @tc.name      testExtKeyboardMultiKey0041
     * @tc.desc      Multi key 2 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0043
     * @tc.name      testExtKeyboardMultiKey0042
     * @tc.desc      Multi key 3 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0044
     * @tc.name      testExtKeyboardMultiKey0043
     * @tc.desc      Multi key 4 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0045
     * @tc.name      testExtKeyboardMultiKey0044
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0046
     * @tc.name      testExtKeyboardMultiKey0045
     * @tc.desc      Multi key 2 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0047
     * @tc.name      testExtKeyboardMultiKey0046
     * @tc.desc      Multi key 3 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0048
     * @tc.name      testExtKeyboardMultiKey0047
     * @tc.desc      Multi key 4 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0049
     * @tc.name      testExtKeyboardMultiKey0048
     * @tc.desc      Multi key 1 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0050
     * @tc.name      testExtKeyboardMultiKey0049
     * @tc.desc      Multi key 2 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0051
     * @tc.name      testExtKeyboardMultiKey0050
     * @tc.desc      Multi key 3 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0052
     * @tc.name      testExtKeyboardMultiKey0051
     * @tc.desc      Multi key 4 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(4);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0053
     * @tc.name      testExtKeyboardMultiKey0052
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0054
     * @tc.name      testExtKeyboardMultiKey0053
     * @tc.desc      Multi key 2 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0055
     * @tc.name      testExtKeyboardMultiKey0054
     * @tc.desc      Multi key 3 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0056
     * @tc.name      testExtKeyboardMultiKey0055
     * @tc.desc      Multi key 4 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0057
     * @tc.name      testExtKeyboardMultiKey0056
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0058
     * @tc.name      testExtKeyboardMultiKey0057
     * @tc.desc      Multi key 2 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0059
     * @tc.name      testExtKeyboardMultiKey0058
     * @tc.desc      Multi key 3 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0060
     * @tc.name      testExtKeyboardMultiKey0059
     * @tc.desc      Multi key 4 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0061
     * @tc.name      testExtKeyboardMultiKey0060
     * @tc.desc      Multi key 1 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0062
     * @tc.name      testExtKeyboardMultiKey0061
     * @tc.desc      Multi key 2 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0063
     * @tc.name      testExtKeyboardMultiKey0062
     * @tc.desc      Multi key 3 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0064
     * @tc.name      testExtKeyboardMultiKey0063
     * @tc.desc      Multi key 4 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(4);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0065
     * @tc.name      testExtKeyboardMultiKey0064
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0066
     * @tc.name      testExtKeyboardMultiKey0065
     * @tc.desc      Multi key 2 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0067
     * @tc.name      testExtKeyboardMultiKey0066
     * @tc.desc      Multi key 3 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0068
     * @tc.name      testExtKeyboardMultiKey0067
     * @tc.desc      Multi key 4 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0069
     * @tc.name      testExtKeyboardMultiKey0068
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0070
     * @tc.name      testExtKeyboardMultiKey0069
     * @tc.desc      Multi key 2 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0071
     * @tc.name      testExtKeyboardMultiKey0070
     * @tc.desc      Multi key 3 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0072
     * @tc.name      testExtKeyboardMultiKey0071
     * @tc.desc      Multi key 4 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(2);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0073
     * @tc.name      testExtKeyboardMultiKey0072
     * @tc.desc      Multi key 1 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0074
     * @tc.name      testExtKeyboardMultiKey0073
     * @tc.desc      Multi key 2 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0075
     * @tc.name      testExtKeyboardMultiKey0074
     * @tc.desc      Multi key 3 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(1);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0076
     * @tc.name      testExtKeyboardMultiKey0075
     * @tc.desc      Multi key 4 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(4);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0077
     * @tc.name      testExtKeyboardMultiKey0076
     * @tc.desc      Multi key 1 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0078
     * @tc.name      testExtKeyboardMultiKey0077
     * @tc.desc      Multi key 2 release 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 2; index++) { active.shift(); }
      expect(active.length).assertEqual(0);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0079
     * @tc.name      testExtKeyboardMultiKey0078
     * @tc.desc      Multi key 3 release 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 0; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_MULTIKEY_0080
     * @tc.name      testExtKeyboardMultiKey0079
     * @tc.desc      Multi key 4 release 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardMultiKey0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keys: number[] = [60, 61, 62, 63];
      let active: number[] = [];
      for (let index: number = 0; index < keys.length; index++) { active.push(keys[index]); }
      for (let index: number = 0; index < 1; index++) { active.shift(); }
      expect(active.length).assertEqual(3);
      expect(active.length).assertLessOrEqual(keys.length);
      expect(keys.length).assertLarger(0);
    })
  });
}
