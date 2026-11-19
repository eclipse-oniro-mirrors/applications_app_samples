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
import { popUpOpacityOf } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for popUpOpacityOf (50 cases). */
export default function popUpOpacityOfTest(): void {
  describe('PopUpOpacityOfTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0001
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0001
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_PopUpOpacityOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0001 begin`);
      const actual: number = popUpOpacityOf(0);
      logInfo(`popUpOpacityOf(keyboardHeightVp=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PopUpOpacityOf_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0002
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0002
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=1) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_PopUpOpacityOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0002 begin`);
      const actual: number = popUpOpacityOf(1);
      logInfo(`popUpOpacityOf(keyboardHeightVp=1): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0002 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0003
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0003
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('KeyboardAvoid_PopUpOpacityOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0003 begin`);
      const actual: number = popUpOpacityOf(-1);
      logInfo(`popUpOpacityOf(keyboardHeightVp=-1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PopUpOpacityOf_0003 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0004
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0004
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=100) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0004 begin`);
      const actual: number = popUpOpacityOf(100);
      logInfo(`popUpOpacityOf(keyboardHeightVp=100): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0004 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0005
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0005
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=360) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0005 begin`);
      const actual: number = popUpOpacityOf(360);
      logInfo(`popUpOpacityOf(keyboardHeightVp=360): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0005 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0006
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0006
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=720) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0006 begin`);
      const actual: number = popUpOpacityOf(720);
      logInfo(`popUpOpacityOf(keyboardHeightVp=720): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0006 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0007
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0007
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=1080) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0007 begin`);
      const actual: number = popUpOpacityOf(1080);
      logInfo(`popUpOpacityOf(keyboardHeightVp=1080): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0007 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0008
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0008
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=1920) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0008 begin`);
      const actual: number = popUpOpacityOf(1920);
      logInfo(`popUpOpacityOf(keyboardHeightVp=1920): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0008 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0009
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0009
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=2) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0009 begin`);
      const actual: number = popUpOpacityOf(2);
      logInfo(`popUpOpacityOf(keyboardHeightVp=2): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0009 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0010
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0010
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=3) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0010 begin`);
      const actual: number = popUpOpacityOf(3);
      logInfo(`popUpOpacityOf(keyboardHeightVp=3): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0010 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0011
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0011
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=10) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0011 begin`);
      const actual: number = popUpOpacityOf(10);
      logInfo(`popUpOpacityOf(keyboardHeightVp=10): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0011 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0012
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0012
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=96) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0012 begin`);
      const actual: number = popUpOpacityOf(96);
      logInfo(`popUpOpacityOf(keyboardHeightVp=96): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0012 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0013
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0013
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=192) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0013 begin`);
      const actual: number = popUpOpacityOf(192);
      logInfo(`popUpOpacityOf(keyboardHeightVp=192): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0013 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0014
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0014
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=288) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0014 begin`);
      const actual: number = popUpOpacityOf(288);
      logInfo(`popUpOpacityOf(keyboardHeightVp=288): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0014 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0015
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0015
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=384) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0015 begin`);
      const actual: number = popUpOpacityOf(384);
      logInfo(`popUpOpacityOf(keyboardHeightVp=384): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0015 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0016
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0016
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=480) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0016 begin`);
      const actual: number = popUpOpacityOf(480);
      logInfo(`popUpOpacityOf(keyboardHeightVp=480): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0016 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0017
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0017
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=576) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0017 begin`);
      const actual: number = popUpOpacityOf(576);
      logInfo(`popUpOpacityOf(keyboardHeightVp=576): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0017 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0018
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0018
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=672) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0018 begin`);
      const actual: number = popUpOpacityOf(672);
      logInfo(`popUpOpacityOf(keyboardHeightVp=672): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0018 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0019
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0019
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=768) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0019 begin`);
      const actual: number = popUpOpacityOf(768);
      logInfo(`popUpOpacityOf(keyboardHeightVp=768): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0019 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0020
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0020
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=864) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0020 begin`);
      const actual: number = popUpOpacityOf(864);
      logInfo(`popUpOpacityOf(keyboardHeightVp=864): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0020 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0021
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0021
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=960) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0021 begin`);
      const actual: number = popUpOpacityOf(960);
      logInfo(`popUpOpacityOf(keyboardHeightVp=960): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0021 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0022
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0022
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=1056) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0022 begin`);
      const actual: number = popUpOpacityOf(1056);
      logInfo(`popUpOpacityOf(keyboardHeightVp=1056): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0022 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0023
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0023
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=1152) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0023 begin`);
      const actual: number = popUpOpacityOf(1152);
      logInfo(`popUpOpacityOf(keyboardHeightVp=1152): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0023 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0024
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0024
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=1248) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0024 begin`);
      const actual: number = popUpOpacityOf(1248);
      logInfo(`popUpOpacityOf(keyboardHeightVp=1248): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0024 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0025
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0025
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=1344) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0025 begin`);
      const actual: number = popUpOpacityOf(1344);
      logInfo(`popUpOpacityOf(keyboardHeightVp=1344): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0025 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0026
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0026
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=1440) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0026 begin`);
      const actual: number = popUpOpacityOf(1440);
      logInfo(`popUpOpacityOf(keyboardHeightVp=1440): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0026 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0027
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0027
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=1536) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0027 begin`);
      const actual: number = popUpOpacityOf(1536);
      logInfo(`popUpOpacityOf(keyboardHeightVp=1536): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0027 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0028
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0028
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=1632) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0028 begin`);
      const actual: number = popUpOpacityOf(1632);
      logInfo(`popUpOpacityOf(keyboardHeightVp=1632): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0028 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0029
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0029
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=1728) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0029 begin`);
      const actual: number = popUpOpacityOf(1728);
      logInfo(`popUpOpacityOf(keyboardHeightVp=1728): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0029 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0030
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0030
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=1824) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0030 begin`);
      const actual: number = popUpOpacityOf(1824);
      logInfo(`popUpOpacityOf(keyboardHeightVp=1824): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0030 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0031
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0031
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=2016) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0031 begin`);
      const actual: number = popUpOpacityOf(2016);
      logInfo(`popUpOpacityOf(keyboardHeightVp=2016): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0031 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0032
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0032
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=2112) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0032 begin`);
      const actual: number = popUpOpacityOf(2112);
      logInfo(`popUpOpacityOf(keyboardHeightVp=2112): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0032 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0033
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0033
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=2208) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0033 begin`);
      const actual: number = popUpOpacityOf(2208);
      logInfo(`popUpOpacityOf(keyboardHeightVp=2208): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0033 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0034
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0034
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=2304) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0034 begin`);
      const actual: number = popUpOpacityOf(2304);
      logInfo(`popUpOpacityOf(keyboardHeightVp=2304): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0034 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0035
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0035
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=2400) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0035 begin`);
      const actual: number = popUpOpacityOf(2400);
      logInfo(`popUpOpacityOf(keyboardHeightVp=2400): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0035 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0036
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0036
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=2496) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0036 begin`);
      const actual: number = popUpOpacityOf(2496);
      logInfo(`popUpOpacityOf(keyboardHeightVp=2496): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0036 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0037
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0037
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=2592) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0037 begin`);
      const actual: number = popUpOpacityOf(2592);
      logInfo(`popUpOpacityOf(keyboardHeightVp=2592): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0037 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0038
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0038
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=2688) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0038 begin`);
      const actual: number = popUpOpacityOf(2688);
      logInfo(`popUpOpacityOf(keyboardHeightVp=2688): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0038 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0039
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0039
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=2784) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0039 begin`);
      const actual: number = popUpOpacityOf(2784);
      logInfo(`popUpOpacityOf(keyboardHeightVp=2784): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0039 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0040
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0040
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=2880) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0040 begin`);
      const actual: number = popUpOpacityOf(2880);
      logInfo(`popUpOpacityOf(keyboardHeightVp=2880): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0040 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0041
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0041
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=2976) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0041 begin`);
      const actual: number = popUpOpacityOf(2976);
      logInfo(`popUpOpacityOf(keyboardHeightVp=2976): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0041 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0042
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0042
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=3072) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0042 begin`);
      const actual: number = popUpOpacityOf(3072);
      logInfo(`popUpOpacityOf(keyboardHeightVp=3072): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0042 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0043
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0043
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=3168) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0043 begin`);
      const actual: number = popUpOpacityOf(3168);
      logInfo(`popUpOpacityOf(keyboardHeightVp=3168): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0043 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0044
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0044
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=3264) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0044 begin`);
      const actual: number = popUpOpacityOf(3264);
      logInfo(`popUpOpacityOf(keyboardHeightVp=3264): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0044 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0045
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0045
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=3360) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0045 begin`);
      const actual: number = popUpOpacityOf(3360);
      logInfo(`popUpOpacityOf(keyboardHeightVp=3360): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0045 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0046
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0046
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=3456) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0046 begin`);
      const actual: number = popUpOpacityOf(3456);
      logInfo(`popUpOpacityOf(keyboardHeightVp=3456): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0046 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0047
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0047
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=3552) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0047 begin`);
      const actual: number = popUpOpacityOf(3552);
      logInfo(`popUpOpacityOf(keyboardHeightVp=3552): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0047 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0048
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0048
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=3648) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0048 begin`);
      const actual: number = popUpOpacityOf(3648);
      logInfo(`popUpOpacityOf(keyboardHeightVp=3648): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0048 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0049
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0049
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=3744) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0049 begin`);
      const actual: number = popUpOpacityOf(3744);
      logInfo(`popUpOpacityOf(keyboardHeightVp=3744): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0049 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_POP_UP_OPACITY_OF_0050
     * @tc.name      KeyboardAvoid_PopUpOpacityOf_0050
     * @tc.desc      popUpOpacityOf(keyboardHeightVp=3840) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('KeyboardAvoid_PopUpOpacityOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PopUpOpacityOf_0050 begin`);
      const actual: number = popUpOpacityOf(3840);
      logInfo(`popUpOpacityOf(keyboardHeightVp=3840): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}PopUpOpacityOf_0050 end`);
    });
  });
}
