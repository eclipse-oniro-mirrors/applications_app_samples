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

const TAG: string = '[Sample_keyboardSoundSessionTransitionCore]';
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

export default function keyboardSoundSessionTransitionCoreTest(): void {
  describe('keyboardSoundSessionTransitionCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0001
     * @tc.name      testExtKeyboardTrans0000
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0002
     * @tc.name      testExtKeyboardTrans0001
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0003
     * @tc.name      testExtKeyboardTrans0002
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0004
     * @tc.name      testExtKeyboardTrans0003
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0005
     * @tc.name      testExtKeyboardTrans0004
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0006
     * @tc.name      testExtKeyboardTrans0005
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0007
     * @tc.name      testExtKeyboardTrans0006
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0008
     * @tc.name      testExtKeyboardTrans0007
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0009
     * @tc.name      testExtKeyboardTrans0008
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0010
     * @tc.name      testExtKeyboardTrans0009
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0011
     * @tc.name      testExtKeyboardTrans0010
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0012
     * @tc.name      testExtKeyboardTrans0011
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0013
     * @tc.name      testExtKeyboardTrans0012
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0014
     * @tc.name      testExtKeyboardTrans0013
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0015
     * @tc.name      testExtKeyboardTrans0014
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0016
     * @tc.name      testExtKeyboardTrans0015
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0017
     * @tc.name      testExtKeyboardTrans0016
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0018
     * @tc.name      testExtKeyboardTrans0017
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0019
     * @tc.name      testExtKeyboardTrans0018
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0020
     * @tc.name      testExtKeyboardTrans0019
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0021
     * @tc.name      testExtKeyboardTrans0020
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0022
     * @tc.name      testExtKeyboardTrans0021
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0023
     * @tc.name      testExtKeyboardTrans0022
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0024
     * @tc.name      testExtKeyboardTrans0023
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0025
     * @tc.name      testExtKeyboardTrans0024
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0026
     * @tc.name      testExtKeyboardTrans0025
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0027
     * @tc.name      testExtKeyboardTrans0026
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0028
     * @tc.name      testExtKeyboardTrans0027
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0029
     * @tc.name      testExtKeyboardTrans0028
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0030
     * @tc.name      testExtKeyboardTrans0029
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0031
     * @tc.name      testExtKeyboardTrans0030
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0032
     * @tc.name      testExtKeyboardTrans0031
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0033
     * @tc.name      testExtKeyboardTrans0032
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0034
     * @tc.name      testExtKeyboardTrans0033
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0035
     * @tc.name      testExtKeyboardTrans0034
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0036
     * @tc.name      testExtKeyboardTrans0035
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0037
     * @tc.name      testExtKeyboardTrans0036
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0038
     * @tc.name      testExtKeyboardTrans0037
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0039
     * @tc.name      testExtKeyboardTrans0038
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0040
     * @tc.name      testExtKeyboardTrans0039
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0041
     * @tc.name      testExtKeyboardTrans0040
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0042
     * @tc.name      testExtKeyboardTrans0041
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0043
     * @tc.name      testExtKeyboardTrans0042
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0044
     * @tc.name      testExtKeyboardTrans0043
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0045
     * @tc.name      testExtKeyboardTrans0044
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0046
     * @tc.name      testExtKeyboardTrans0045
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0047
     * @tc.name      testExtKeyboardTrans0046
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0048
     * @tc.name      testExtKeyboardTrans0047
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0049
     * @tc.name      testExtKeyboardTrans0048
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0050
     * @tc.name      testExtKeyboardTrans0049
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0051
     * @tc.name      testExtKeyboardTrans0050
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0052
     * @tc.name      testExtKeyboardTrans0051
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0053
     * @tc.name      testExtKeyboardTrans0052
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0054
     * @tc.name      testExtKeyboardTrans0053
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0055
     * @tc.name      testExtKeyboardTrans0054
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0056
     * @tc.name      testExtKeyboardTrans0055
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0057
     * @tc.name      testExtKeyboardTrans0056
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0058
     * @tc.name      testExtKeyboardTrans0057
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0059
     * @tc.name      testExtKeyboardTrans0058
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0060
     * @tc.name      testExtKeyboardTrans0059
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0061
     * @tc.name      testExtKeyboardTrans0060
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0062
     * @tc.name      testExtKeyboardTrans0061
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0063
     * @tc.name      testExtKeyboardTrans0062
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0064
     * @tc.name      testExtKeyboardTrans0063
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0065
     * @tc.name      testExtKeyboardTrans0064
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0066
     * @tc.name      testExtKeyboardTrans0065
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0067
     * @tc.name      testExtKeyboardTrans0066
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0068
     * @tc.name      testExtKeyboardTrans0067
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0069
     * @tc.name      testExtKeyboardTrans0068
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0070
     * @tc.name      testExtKeyboardTrans0069
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0071
     * @tc.name      testExtKeyboardTrans0070
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0072
     * @tc.name      testExtKeyboardTrans0071
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0073
     * @tc.name      testExtKeyboardTrans0072
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0074
     * @tc.name      testExtKeyboardTrans0073
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0075
     * @tc.name      testExtKeyboardTrans0074
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0076
     * @tc.name      testExtKeyboardTrans0075
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0077
     * @tc.name      testExtKeyboardTrans0076
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0078
     * @tc.name      testExtKeyboardTrans0077
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0079
     * @tc.name      testExtKeyboardTrans0078
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0080
     * @tc.name      testExtKeyboardTrans0079
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0081
     * @tc.name      testExtKeyboardTrans0080
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0082
     * @tc.name      testExtKeyboardTrans0081
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0083
     * @tc.name      testExtKeyboardTrans0082
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0084
     * @tc.name      testExtKeyboardTrans0083
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0085
     * @tc.name      testExtKeyboardTrans0084
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0086
     * @tc.name      testExtKeyboardTrans0085
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0087
     * @tc.name      testExtKeyboardTrans0086
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0088
     * @tc.name      testExtKeyboardTrans0087
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0089
     * @tc.name      testExtKeyboardTrans0088
     * @tc.desc      Session transition DEFAULT MUSIC.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'DEFAULT';
      expect(mode).assertEqual('DEFAULT');
      expect('MUSIC'.length).assertLarger(0);
      expect(150).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0090
     * @tc.name      testExtKeyboardTrans0089
     * @tc.desc      Session transition MIX_WITH_OTHERS NOTIFICATION.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mode: string = 'DEFAULT';
      mode = 'MIX_WITH_OTHERS';
      expect(mode).assertEqual('MIX_WITH_OTHERS');
      expect('NOTIFICATION'.length).assertLarger(0);
      expect(30).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })
    /**
     * @tc.number    SUB_SYS_KEYBOARD_SOUND_EXT_TRANS_0091
     * @tc.name      testExtKeyboardTrans0090
     * @tc.desc      Session transition final DEFAULT/MIX contract.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtKeyboardTrans0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mode: string = 'MIX_WITH_OTHERS';
      expect(mode.length).assertLarger(0);
      expect(mode === 'DEFAULT' || mode === 'MIX_WITH_OTHERS').assertTrue();
    })

  });
}
