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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { isKeyboardShown } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isKeyboardShown (50 cases). */
export default function isKeyboardShownTest(): void {
  describe('IsKeyboardShownTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0001
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0001
     * @tc.desc      isKeyboardShown(keyboardHeightVp=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_IsKeyboardShown_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0001 begin`);
      const actual: boolean = isKeyboardShown(0);
      logInfo(`isKeyboardShown(keyboardHeightVp=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsKeyboardShown_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0002
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0002
     * @tc.desc      isKeyboardShown(keyboardHeightVp=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_IsKeyboardShown_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0002 begin`);
      const actual: boolean = isKeyboardShown(1);
      logInfo(`isKeyboardShown(keyboardHeightVp=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0003
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0003
     * @tc.desc      isKeyboardShown(keyboardHeightVp=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_IsKeyboardShown_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0003 begin`);
      const actual: boolean = isKeyboardShown(-1);
      logInfo(`isKeyboardShown(keyboardHeightVp=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsKeyboardShown_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0004
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0004
     * @tc.desc      isKeyboardShown(keyboardHeightVp=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0004 begin`);
      const actual: boolean = isKeyboardShown(100);
      logInfo(`isKeyboardShown(keyboardHeightVp=100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0005
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0005
     * @tc.desc      isKeyboardShown(keyboardHeightVp=360) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0005 begin`);
      const actual: boolean = isKeyboardShown(360);
      logInfo(`isKeyboardShown(keyboardHeightVp=360): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0006
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0006
     * @tc.desc      isKeyboardShown(keyboardHeightVp=720) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0006 begin`);
      const actual: boolean = isKeyboardShown(720);
      logInfo(`isKeyboardShown(keyboardHeightVp=720): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0007
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0007
     * @tc.desc      isKeyboardShown(keyboardHeightVp=1080) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0007 begin`);
      const actual: boolean = isKeyboardShown(1080);
      logInfo(`isKeyboardShown(keyboardHeightVp=1080): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0008
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0008
     * @tc.desc      isKeyboardShown(keyboardHeightVp=1920) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0008 begin`);
      const actual: boolean = isKeyboardShown(1920);
      logInfo(`isKeyboardShown(keyboardHeightVp=1920): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0009
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0009
     * @tc.desc      isKeyboardShown(keyboardHeightVp=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0009 begin`);
      const actual: boolean = isKeyboardShown(2);
      logInfo(`isKeyboardShown(keyboardHeightVp=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0010
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0010
     * @tc.desc      isKeyboardShown(keyboardHeightVp=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0010 begin`);
      const actual: boolean = isKeyboardShown(3);
      logInfo(`isKeyboardShown(keyboardHeightVp=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0011
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0011
     * @tc.desc      isKeyboardShown(keyboardHeightVp=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0011 begin`);
      const actual: boolean = isKeyboardShown(10);
      logInfo(`isKeyboardShown(keyboardHeightVp=10): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0012
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0012
     * @tc.desc      isKeyboardShown(keyboardHeightVp=96) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0012 begin`);
      const actual: boolean = isKeyboardShown(96);
      logInfo(`isKeyboardShown(keyboardHeightVp=96): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0013
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0013
     * @tc.desc      isKeyboardShown(keyboardHeightVp=192) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0013 begin`);
      const actual: boolean = isKeyboardShown(192);
      logInfo(`isKeyboardShown(keyboardHeightVp=192): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0014
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0014
     * @tc.desc      isKeyboardShown(keyboardHeightVp=288) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0014 begin`);
      const actual: boolean = isKeyboardShown(288);
      logInfo(`isKeyboardShown(keyboardHeightVp=288): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0015
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0015
     * @tc.desc      isKeyboardShown(keyboardHeightVp=384) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0015 begin`);
      const actual: boolean = isKeyboardShown(384);
      logInfo(`isKeyboardShown(keyboardHeightVp=384): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0016
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0016
     * @tc.desc      isKeyboardShown(keyboardHeightVp=480) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0016 begin`);
      const actual: boolean = isKeyboardShown(480);
      logInfo(`isKeyboardShown(keyboardHeightVp=480): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0017
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0017
     * @tc.desc      isKeyboardShown(keyboardHeightVp=576) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0017 begin`);
      const actual: boolean = isKeyboardShown(576);
      logInfo(`isKeyboardShown(keyboardHeightVp=576): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0018
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0018
     * @tc.desc      isKeyboardShown(keyboardHeightVp=672) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0018 begin`);
      const actual: boolean = isKeyboardShown(672);
      logInfo(`isKeyboardShown(keyboardHeightVp=672): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0019
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0019
     * @tc.desc      isKeyboardShown(keyboardHeightVp=768) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0019 begin`);
      const actual: boolean = isKeyboardShown(768);
      logInfo(`isKeyboardShown(keyboardHeightVp=768): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0020
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0020
     * @tc.desc      isKeyboardShown(keyboardHeightVp=864) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0020 begin`);
      const actual: boolean = isKeyboardShown(864);
      logInfo(`isKeyboardShown(keyboardHeightVp=864): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0021
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0021
     * @tc.desc      isKeyboardShown(keyboardHeightVp=960) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0021 begin`);
      const actual: boolean = isKeyboardShown(960);
      logInfo(`isKeyboardShown(keyboardHeightVp=960): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0022
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0022
     * @tc.desc      isKeyboardShown(keyboardHeightVp=1056) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0022 begin`);
      const actual: boolean = isKeyboardShown(1056);
      logInfo(`isKeyboardShown(keyboardHeightVp=1056): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0023
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0023
     * @tc.desc      isKeyboardShown(keyboardHeightVp=1152) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0023 begin`);
      const actual: boolean = isKeyboardShown(1152);
      logInfo(`isKeyboardShown(keyboardHeightVp=1152): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0024
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0024
     * @tc.desc      isKeyboardShown(keyboardHeightVp=1248) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0024 begin`);
      const actual: boolean = isKeyboardShown(1248);
      logInfo(`isKeyboardShown(keyboardHeightVp=1248): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0025
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0025
     * @tc.desc      isKeyboardShown(keyboardHeightVp=1344) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0025 begin`);
      const actual: boolean = isKeyboardShown(1344);
      logInfo(`isKeyboardShown(keyboardHeightVp=1344): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0026
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0026
     * @tc.desc      isKeyboardShown(keyboardHeightVp=1440) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0026 begin`);
      const actual: boolean = isKeyboardShown(1440);
      logInfo(`isKeyboardShown(keyboardHeightVp=1440): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0027
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0027
     * @tc.desc      isKeyboardShown(keyboardHeightVp=1536) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0027 begin`);
      const actual: boolean = isKeyboardShown(1536);
      logInfo(`isKeyboardShown(keyboardHeightVp=1536): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0028
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0028
     * @tc.desc      isKeyboardShown(keyboardHeightVp=1632) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0028 begin`);
      const actual: boolean = isKeyboardShown(1632);
      logInfo(`isKeyboardShown(keyboardHeightVp=1632): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0029
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0029
     * @tc.desc      isKeyboardShown(keyboardHeightVp=1728) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0029 begin`);
      const actual: boolean = isKeyboardShown(1728);
      logInfo(`isKeyboardShown(keyboardHeightVp=1728): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0030
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0030
     * @tc.desc      isKeyboardShown(keyboardHeightVp=1824) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0030 begin`);
      const actual: boolean = isKeyboardShown(1824);
      logInfo(`isKeyboardShown(keyboardHeightVp=1824): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0031
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0031
     * @tc.desc      isKeyboardShown(keyboardHeightVp=2016) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0031 begin`);
      const actual: boolean = isKeyboardShown(2016);
      logInfo(`isKeyboardShown(keyboardHeightVp=2016): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0032
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0032
     * @tc.desc      isKeyboardShown(keyboardHeightVp=2112) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0032 begin`);
      const actual: boolean = isKeyboardShown(2112);
      logInfo(`isKeyboardShown(keyboardHeightVp=2112): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0033
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0033
     * @tc.desc      isKeyboardShown(keyboardHeightVp=2208) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0033 begin`);
      const actual: boolean = isKeyboardShown(2208);
      logInfo(`isKeyboardShown(keyboardHeightVp=2208): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0034
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0034
     * @tc.desc      isKeyboardShown(keyboardHeightVp=2304) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0034 begin`);
      const actual: boolean = isKeyboardShown(2304);
      logInfo(`isKeyboardShown(keyboardHeightVp=2304): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0035
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0035
     * @tc.desc      isKeyboardShown(keyboardHeightVp=2400) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0035 begin`);
      const actual: boolean = isKeyboardShown(2400);
      logInfo(`isKeyboardShown(keyboardHeightVp=2400): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0036
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0036
     * @tc.desc      isKeyboardShown(keyboardHeightVp=2496) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0036 begin`);
      const actual: boolean = isKeyboardShown(2496);
      logInfo(`isKeyboardShown(keyboardHeightVp=2496): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0037
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0037
     * @tc.desc      isKeyboardShown(keyboardHeightVp=2592) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0037 begin`);
      const actual: boolean = isKeyboardShown(2592);
      logInfo(`isKeyboardShown(keyboardHeightVp=2592): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0038
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0038
     * @tc.desc      isKeyboardShown(keyboardHeightVp=2688) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0038 begin`);
      const actual: boolean = isKeyboardShown(2688);
      logInfo(`isKeyboardShown(keyboardHeightVp=2688): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0039
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0039
     * @tc.desc      isKeyboardShown(keyboardHeightVp=2784) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0039 begin`);
      const actual: boolean = isKeyboardShown(2784);
      logInfo(`isKeyboardShown(keyboardHeightVp=2784): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0040
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0040
     * @tc.desc      isKeyboardShown(keyboardHeightVp=2880) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0040 begin`);
      const actual: boolean = isKeyboardShown(2880);
      logInfo(`isKeyboardShown(keyboardHeightVp=2880): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0041
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0041
     * @tc.desc      isKeyboardShown(keyboardHeightVp=2976) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0041 begin`);
      const actual: boolean = isKeyboardShown(2976);
      logInfo(`isKeyboardShown(keyboardHeightVp=2976): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0042
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0042
     * @tc.desc      isKeyboardShown(keyboardHeightVp=3072) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0042 begin`);
      const actual: boolean = isKeyboardShown(3072);
      logInfo(`isKeyboardShown(keyboardHeightVp=3072): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0043
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0043
     * @tc.desc      isKeyboardShown(keyboardHeightVp=3168) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0043 begin`);
      const actual: boolean = isKeyboardShown(3168);
      logInfo(`isKeyboardShown(keyboardHeightVp=3168): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0044
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0044
     * @tc.desc      isKeyboardShown(keyboardHeightVp=3264) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0044 begin`);
      const actual: boolean = isKeyboardShown(3264);
      logInfo(`isKeyboardShown(keyboardHeightVp=3264): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0045
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0045
     * @tc.desc      isKeyboardShown(keyboardHeightVp=3360) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0045 begin`);
      const actual: boolean = isKeyboardShown(3360);
      logInfo(`isKeyboardShown(keyboardHeightVp=3360): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0046
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0046
     * @tc.desc      isKeyboardShown(keyboardHeightVp=3456) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0046 begin`);
      const actual: boolean = isKeyboardShown(3456);
      logInfo(`isKeyboardShown(keyboardHeightVp=3456): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0047
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0047
     * @tc.desc      isKeyboardShown(keyboardHeightVp=3552) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0047 begin`);
      const actual: boolean = isKeyboardShown(3552);
      logInfo(`isKeyboardShown(keyboardHeightVp=3552): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0048
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0048
     * @tc.desc      isKeyboardShown(keyboardHeightVp=3648) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0048 begin`);
      const actual: boolean = isKeyboardShown(3648);
      logInfo(`isKeyboardShown(keyboardHeightVp=3648): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0048 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0049
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0049
     * @tc.desc      isKeyboardShown(keyboardHeightVp=3744) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0049 begin`);
      const actual: boolean = isKeyboardShown(3744);
      logInfo(`isKeyboardShown(keyboardHeightVp=3744): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0049 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_IS_KEYBOARD_SHOWN_0050
     * @tc.name      KeyboardAvoid_IsKeyboardShown_0050
     * @tc.desc      isKeyboardShown(keyboardHeightVp=3840) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_IsKeyboardShown_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsKeyboardShown_0050 begin`);
      const actual: boolean = isKeyboardShown(3840);
      logInfo(`isKeyboardShown(keyboardHeightVp=3840): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsKeyboardShown_0050 end`);
    });
  });
}
