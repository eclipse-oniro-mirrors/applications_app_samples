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

const TAG: string = '[Sample_keyboardSoundControllerGuardMatrix]';
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

export default function keyboardSoundControllerGuardMatrixTest(): void {
  describe('keyboardSoundControllerGuardMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0001
     * @tc.name      testExtKeyboardGuard0000
     * @tc.desc      Controller guard play token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 0;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0002
     * @tc.name      testExtKeyboardGuard0001
     * @tc.desc      Controller guard stop token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 1;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0003
     * @tc.name      testExtKeyboardGuard0002
     * @tc.desc      Controller guard release token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 2;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0004
     * @tc.name      testExtKeyboardGuard0003
     * @tc.desc      Controller guard play token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 3;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0005
     * @tc.name      testExtKeyboardGuard0004
     * @tc.desc      Controller guard stop token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 4;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0006
     * @tc.name      testExtKeyboardGuard0005
     * @tc.desc      Controller guard release token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 0;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0007
     * @tc.name      testExtKeyboardGuard0006
     * @tc.desc      Controller guard play token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 1;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0008
     * @tc.name      testExtKeyboardGuard0007
     * @tc.desc      Controller guard stop token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 2;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0009
     * @tc.name      testExtKeyboardGuard0008
     * @tc.desc      Controller guard release token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 3;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0010
     * @tc.name      testExtKeyboardGuard0009
     * @tc.desc      Controller guard play token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 4;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(5);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0011
     * @tc.name      testExtKeyboardGuard0010
     * @tc.desc      Controller guard stop token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 0;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(0);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0012
     * @tc.name      testExtKeyboardGuard0011
     * @tc.desc      Controller guard release token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 1;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0013
     * @tc.name      testExtKeyboardGuard0012
     * @tc.desc      Controller guard play token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 2;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0014
     * @tc.name      testExtKeyboardGuard0013
     * @tc.desc      Controller guard stop token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 3;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0015
     * @tc.name      testExtKeyboardGuard0014
     * @tc.desc      Controller guard release token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 4;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(5);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0016
     * @tc.name      testExtKeyboardGuard0015
     * @tc.desc      Controller guard play token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 0;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0017
     * @tc.name      testExtKeyboardGuard0016
     * @tc.desc      Controller guard stop token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 1;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0018
     * @tc.name      testExtKeyboardGuard0017
     * @tc.desc      Controller guard release token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 2;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0019
     * @tc.name      testExtKeyboardGuard0018
     * @tc.desc      Controller guard play token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 3;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0020
     * @tc.name      testExtKeyboardGuard0019
     * @tc.desc      Controller guard stop token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 4;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0021
     * @tc.name      testExtKeyboardGuard0020
     * @tc.desc      Controller guard release token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 0;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0022
     * @tc.name      testExtKeyboardGuard0021
     * @tc.desc      Controller guard play token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 1;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0023
     * @tc.name      testExtKeyboardGuard0022
     * @tc.desc      Controller guard stop token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 2;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0024
     * @tc.name      testExtKeyboardGuard0023
     * @tc.desc      Controller guard release token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 3;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0025
     * @tc.name      testExtKeyboardGuard0024
     * @tc.desc      Controller guard play token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 4;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(5);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0026
     * @tc.name      testExtKeyboardGuard0025
     * @tc.desc      Controller guard stop token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 0;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(0);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0027
     * @tc.name      testExtKeyboardGuard0026
     * @tc.desc      Controller guard release token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 1;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0028
     * @tc.name      testExtKeyboardGuard0027
     * @tc.desc      Controller guard play token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 2;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0029
     * @tc.name      testExtKeyboardGuard0028
     * @tc.desc      Controller guard stop token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 3;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0030
     * @tc.name      testExtKeyboardGuard0029
     * @tc.desc      Controller guard release token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 4;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(5);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0031
     * @tc.name      testExtKeyboardGuard0030
     * @tc.desc      Controller guard play token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 0;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0032
     * @tc.name      testExtKeyboardGuard0031
     * @tc.desc      Controller guard stop token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 1;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0033
     * @tc.name      testExtKeyboardGuard0032
     * @tc.desc      Controller guard release token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 2;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0034
     * @tc.name      testExtKeyboardGuard0033
     * @tc.desc      Controller guard play token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 3;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0035
     * @tc.name      testExtKeyboardGuard0034
     * @tc.desc      Controller guard stop token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 4;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0036
     * @tc.name      testExtKeyboardGuard0035
     * @tc.desc      Controller guard release token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 0;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0037
     * @tc.name      testExtKeyboardGuard0036
     * @tc.desc      Controller guard play token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 1;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0038
     * @tc.name      testExtKeyboardGuard0037
     * @tc.desc      Controller guard stop token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 2;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0039
     * @tc.name      testExtKeyboardGuard0038
     * @tc.desc      Controller guard release token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 3;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0040
     * @tc.name      testExtKeyboardGuard0039
     * @tc.desc      Controller guard play token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 4;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(5);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0041
     * @tc.name      testExtKeyboardGuard0040
     * @tc.desc      Controller guard stop token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 0;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(0);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0042
     * @tc.name      testExtKeyboardGuard0041
     * @tc.desc      Controller guard release token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 1;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0043
     * @tc.name      testExtKeyboardGuard0042
     * @tc.desc      Controller guard play token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 2;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0044
     * @tc.name      testExtKeyboardGuard0043
     * @tc.desc      Controller guard stop token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 3;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0045
     * @tc.name      testExtKeyboardGuard0044
     * @tc.desc      Controller guard release token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 4;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(5);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0046
     * @tc.name      testExtKeyboardGuard0045
     * @tc.desc      Controller guard play token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 0;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0047
     * @tc.name      testExtKeyboardGuard0046
     * @tc.desc      Controller guard stop token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 1;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0048
     * @tc.name      testExtKeyboardGuard0047
     * @tc.desc      Controller guard release token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 2;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0049
     * @tc.name      testExtKeyboardGuard0048
     * @tc.desc      Controller guard play token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 3;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0050
     * @tc.name      testExtKeyboardGuard0049
     * @tc.desc      Controller guard stop token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 4;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0051
     * @tc.name      testExtKeyboardGuard0050
     * @tc.desc      Controller guard release token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 0;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0052
     * @tc.name      testExtKeyboardGuard0051
     * @tc.desc      Controller guard play token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 1;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0053
     * @tc.name      testExtKeyboardGuard0052
     * @tc.desc      Controller guard stop token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 2;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0054
     * @tc.name      testExtKeyboardGuard0053
     * @tc.desc      Controller guard release token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 3;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0055
     * @tc.name      testExtKeyboardGuard0054
     * @tc.desc      Controller guard play token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 4;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(5);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0056
     * @tc.name      testExtKeyboardGuard0055
     * @tc.desc      Controller guard stop token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 0;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(0);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0057
     * @tc.name      testExtKeyboardGuard0056
     * @tc.desc      Controller guard release token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 1;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0058
     * @tc.name      testExtKeyboardGuard0057
     * @tc.desc      Controller guard play token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 2;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0059
     * @tc.name      testExtKeyboardGuard0058
     * @tc.desc      Controller guard stop token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 3;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0060
     * @tc.name      testExtKeyboardGuard0059
     * @tc.desc      Controller guard release token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 4;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(5);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0061
     * @tc.name      testExtKeyboardGuard0060
     * @tc.desc      Controller guard play token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 0;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0062
     * @tc.name      testExtKeyboardGuard0061
     * @tc.desc      Controller guard stop token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 1;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0063
     * @tc.name      testExtKeyboardGuard0062
     * @tc.desc      Controller guard release token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 2;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0064
     * @tc.name      testExtKeyboardGuard0063
     * @tc.desc      Controller guard play token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 3;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0065
     * @tc.name      testExtKeyboardGuard0064
     * @tc.desc      Controller guard stop token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 4;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0066
     * @tc.name      testExtKeyboardGuard0065
     * @tc.desc      Controller guard release token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 0;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0067
     * @tc.name      testExtKeyboardGuard0066
     * @tc.desc      Controller guard play token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 1;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0068
     * @tc.name      testExtKeyboardGuard0067
     * @tc.desc      Controller guard stop token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 2;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0069
     * @tc.name      testExtKeyboardGuard0068
     * @tc.desc      Controller guard release token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 3;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0070
     * @tc.name      testExtKeyboardGuard0069
     * @tc.desc      Controller guard play token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 4;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(5);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0071
     * @tc.name      testExtKeyboardGuard0070
     * @tc.desc      Controller guard stop token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 0;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(0);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0072
     * @tc.name      testExtKeyboardGuard0071
     * @tc.desc      Controller guard release token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 1;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(2);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0073
     * @tc.name      testExtKeyboardGuard0072
     * @tc.desc      Controller guard play token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 2;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0074
     * @tc.name      testExtKeyboardGuard0073
     * @tc.desc      Controller guard stop token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 3;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0075
     * @tc.name      testExtKeyboardGuard0074
     * @tc.desc      Controller guard release token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 4;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(5);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0076
     * @tc.name      testExtKeyboardGuard0075
     * @tc.desc      Controller guard play token 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 0;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0077
     * @tc.name      testExtKeyboardGuard0076
     * @tc.desc      Controller guard stop token 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 1;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(1);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0078
     * @tc.name      testExtKeyboardGuard0077
     * @tc.desc      Controller guard release token 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 2;
      const action: string = 'release';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(3);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0079
     * @tc.name      testExtKeyboardGuard0078
     * @tc.desc      Controller guard play token 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = true;
      let playToken: number = 3;
      const action: string = 'play';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(true);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_GUARD_0080
     * @tc.name      testExtKeyboardGuard0079
     * @tc.desc      Controller guard stop token 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardGuard0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStarted: boolean = false;
      let playToken: number = 4;
      const action: string = 'stop';
      if (action === 'play') { playToken++; isStarted = true; }
      else if (action === 'stop') { isStarted = false; }
      else { playToken++; isStarted = false; }
      expect(isStarted).assertEqual(false);
      expect(playToken).assertEqual(4);
      expect(playToken).assertLargerOrEqual(0);
    })
  });
}
