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
import { isValidBrightness } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isValidBrightness (50 cases). */
export default function isValidBrightnessTest(): void {
  describe('IsValidBrightnessTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0001
     * @tc.name      WindowManage_IsValidBrightness_0001
     * @tc.desc      isValidBrightness(brightness=-100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_IsValidBrightness_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0001 begin`);
      const actual: boolean = isValidBrightness(-100);
      logInfo(`isValidBrightness(brightness=-100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0002
     * @tc.name      WindowManage_IsValidBrightness_0002
     * @tc.desc      isValidBrightness(brightness=-1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_IsValidBrightness_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0002 begin`);
      const actual: boolean = isValidBrightness(-1);
      logInfo(`isValidBrightness(brightness=-1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidBrightness_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0003
     * @tc.name      WindowManage_IsValidBrightness_0003
     * @tc.desc      isValidBrightness(brightness=-2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_IsValidBrightness_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0003 begin`);
      const actual: boolean = isValidBrightness(-2);
      logInfo(`isValidBrightness(brightness=-2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0004
     * @tc.name      WindowManage_IsValidBrightness_0004
     * @tc.desc      isValidBrightness(brightness=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_IsValidBrightness_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0004 begin`);
      const actual: boolean = isValidBrightness(0);
      logInfo(`isValidBrightness(brightness=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidBrightness_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0005
     * @tc.name      WindowManage_IsValidBrightness_0005
     * @tc.desc      isValidBrightness(brightness=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_IsValidBrightness_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0005 begin`);
      const actual: boolean = isValidBrightness(1);
      logInfo(`isValidBrightness(brightness=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsValidBrightness_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0006
     * @tc.name      WindowManage_IsValidBrightness_0006
     * @tc.desc      isValidBrightness(brightness=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_IsValidBrightness_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0006 begin`);
      const actual: boolean = isValidBrightness(2);
      logInfo(`isValidBrightness(brightness=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0007
     * @tc.name      WindowManage_IsValidBrightness_0007
     * @tc.desc      isValidBrightness(brightness=50) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0007 begin`);
      const actual: boolean = isValidBrightness(50);
      logInfo(`isValidBrightness(brightness=50): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0008
     * @tc.name      WindowManage_IsValidBrightness_0008
     * @tc.desc      isValidBrightness(brightness=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0008 begin`);
      const actual: boolean = isValidBrightness(100);
      logInfo(`isValidBrightness(brightness=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0009
     * @tc.name      WindowManage_IsValidBrightness_0009
     * @tc.desc      isValidBrightness(brightness=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0009 begin`);
      const actual: boolean = isValidBrightness(3);
      logInfo(`isValidBrightness(brightness=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0010
     * @tc.name      WindowManage_IsValidBrightness_0010
     * @tc.desc      isValidBrightness(brightness=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0010 begin`);
      const actual: boolean = isValidBrightness(10);
      logInfo(`isValidBrightness(brightness=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0011
     * @tc.name      WindowManage_IsValidBrightness_0011
     * @tc.desc      isValidBrightness(brightness=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0011 begin`);
      const actual: boolean = isValidBrightness(5);
      logInfo(`isValidBrightness(brightness=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0012
     * @tc.name      WindowManage_IsValidBrightness_0012
     * @tc.desc      isValidBrightness(brightness=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0012 begin`);
      const actual: boolean = isValidBrightness(15);
      logInfo(`isValidBrightness(brightness=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0013
     * @tc.name      WindowManage_IsValidBrightness_0013
     * @tc.desc      isValidBrightness(brightness=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0013 begin`);
      const actual: boolean = isValidBrightness(20);
      logInfo(`isValidBrightness(brightness=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0014
     * @tc.name      WindowManage_IsValidBrightness_0014
     * @tc.desc      isValidBrightness(brightness=25) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0014 begin`);
      const actual: boolean = isValidBrightness(25);
      logInfo(`isValidBrightness(brightness=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0015
     * @tc.name      WindowManage_IsValidBrightness_0015
     * @tc.desc      isValidBrightness(brightness=30) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0015 begin`);
      const actual: boolean = isValidBrightness(30);
      logInfo(`isValidBrightness(brightness=30): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0016
     * @tc.name      WindowManage_IsValidBrightness_0016
     * @tc.desc      isValidBrightness(brightness=35) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0016 begin`);
      const actual: boolean = isValidBrightness(35);
      logInfo(`isValidBrightness(brightness=35): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0017
     * @tc.name      WindowManage_IsValidBrightness_0017
     * @tc.desc      isValidBrightness(brightness=40) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0017 begin`);
      const actual: boolean = isValidBrightness(40);
      logInfo(`isValidBrightness(brightness=40): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0018
     * @tc.name      WindowManage_IsValidBrightness_0018
     * @tc.desc      isValidBrightness(brightness=45) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0018 begin`);
      const actual: boolean = isValidBrightness(45);
      logInfo(`isValidBrightness(brightness=45): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0019
     * @tc.name      WindowManage_IsValidBrightness_0019
     * @tc.desc      isValidBrightness(brightness=55) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0019 begin`);
      const actual: boolean = isValidBrightness(55);
      logInfo(`isValidBrightness(brightness=55): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0020
     * @tc.name      WindowManage_IsValidBrightness_0020
     * @tc.desc      isValidBrightness(brightness=60) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0020 begin`);
      const actual: boolean = isValidBrightness(60);
      logInfo(`isValidBrightness(brightness=60): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0021
     * @tc.name      WindowManage_IsValidBrightness_0021
     * @tc.desc      isValidBrightness(brightness=65) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0021 begin`);
      const actual: boolean = isValidBrightness(65);
      logInfo(`isValidBrightness(brightness=65): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0022
     * @tc.name      WindowManage_IsValidBrightness_0022
     * @tc.desc      isValidBrightness(brightness=70) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0022 begin`);
      const actual: boolean = isValidBrightness(70);
      logInfo(`isValidBrightness(brightness=70): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0023
     * @tc.name      WindowManage_IsValidBrightness_0023
     * @tc.desc      isValidBrightness(brightness=75) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0023 begin`);
      const actual: boolean = isValidBrightness(75);
      logInfo(`isValidBrightness(brightness=75): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0024
     * @tc.name      WindowManage_IsValidBrightness_0024
     * @tc.desc      isValidBrightness(brightness=80) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0024 begin`);
      const actual: boolean = isValidBrightness(80);
      logInfo(`isValidBrightness(brightness=80): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0025
     * @tc.name      WindowManage_IsValidBrightness_0025
     * @tc.desc      isValidBrightness(brightness=85) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0025 begin`);
      const actual: boolean = isValidBrightness(85);
      logInfo(`isValidBrightness(brightness=85): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0026
     * @tc.name      WindowManage_IsValidBrightness_0026
     * @tc.desc      isValidBrightness(brightness=90) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0026 begin`);
      const actual: boolean = isValidBrightness(90);
      logInfo(`isValidBrightness(brightness=90): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0027
     * @tc.name      WindowManage_IsValidBrightness_0027
     * @tc.desc      isValidBrightness(brightness=95) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0027 begin`);
      const actual: boolean = isValidBrightness(95);
      logInfo(`isValidBrightness(brightness=95): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0028
     * @tc.name      WindowManage_IsValidBrightness_0028
     * @tc.desc      isValidBrightness(brightness=105) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0028 begin`);
      const actual: boolean = isValidBrightness(105);
      logInfo(`isValidBrightness(brightness=105): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0029
     * @tc.name      WindowManage_IsValidBrightness_0029
     * @tc.desc      isValidBrightness(brightness=110) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0029 begin`);
      const actual: boolean = isValidBrightness(110);
      logInfo(`isValidBrightness(brightness=110): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0030
     * @tc.name      WindowManage_IsValidBrightness_0030
     * @tc.desc      isValidBrightness(brightness=115) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0030 begin`);
      const actual: boolean = isValidBrightness(115);
      logInfo(`isValidBrightness(brightness=115): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0031
     * @tc.name      WindowManage_IsValidBrightness_0031
     * @tc.desc      isValidBrightness(brightness=120) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0031 begin`);
      const actual: boolean = isValidBrightness(120);
      logInfo(`isValidBrightness(brightness=120): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0032
     * @tc.name      WindowManage_IsValidBrightness_0032
     * @tc.desc      isValidBrightness(brightness=125) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0032 begin`);
      const actual: boolean = isValidBrightness(125);
      logInfo(`isValidBrightness(brightness=125): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0033
     * @tc.name      WindowManage_IsValidBrightness_0033
     * @tc.desc      isValidBrightness(brightness=130) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0033 begin`);
      const actual: boolean = isValidBrightness(130);
      logInfo(`isValidBrightness(brightness=130): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0034
     * @tc.name      WindowManage_IsValidBrightness_0034
     * @tc.desc      isValidBrightness(brightness=135) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0034 begin`);
      const actual: boolean = isValidBrightness(135);
      logInfo(`isValidBrightness(brightness=135): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0035
     * @tc.name      WindowManage_IsValidBrightness_0035
     * @tc.desc      isValidBrightness(brightness=140) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0035 begin`);
      const actual: boolean = isValidBrightness(140);
      logInfo(`isValidBrightness(brightness=140): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0036
     * @tc.name      WindowManage_IsValidBrightness_0036
     * @tc.desc      isValidBrightness(brightness=145) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0036 begin`);
      const actual: boolean = isValidBrightness(145);
      logInfo(`isValidBrightness(brightness=145): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0037
     * @tc.name      WindowManage_IsValidBrightness_0037
     * @tc.desc      isValidBrightness(brightness=150) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0037 begin`);
      const actual: boolean = isValidBrightness(150);
      logInfo(`isValidBrightness(brightness=150): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0038
     * @tc.name      WindowManage_IsValidBrightness_0038
     * @tc.desc      isValidBrightness(brightness=155) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0038 begin`);
      const actual: boolean = isValidBrightness(155);
      logInfo(`isValidBrightness(brightness=155): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0039
     * @tc.name      WindowManage_IsValidBrightness_0039
     * @tc.desc      isValidBrightness(brightness=160) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0039 begin`);
      const actual: boolean = isValidBrightness(160);
      logInfo(`isValidBrightness(brightness=160): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0040
     * @tc.name      WindowManage_IsValidBrightness_0040
     * @tc.desc      isValidBrightness(brightness=165) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0040 begin`);
      const actual: boolean = isValidBrightness(165);
      logInfo(`isValidBrightness(brightness=165): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0041
     * @tc.name      WindowManage_IsValidBrightness_0041
     * @tc.desc      isValidBrightness(brightness=170) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0041 begin`);
      const actual: boolean = isValidBrightness(170);
      logInfo(`isValidBrightness(brightness=170): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0042
     * @tc.name      WindowManage_IsValidBrightness_0042
     * @tc.desc      isValidBrightness(brightness=175) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0042 begin`);
      const actual: boolean = isValidBrightness(175);
      logInfo(`isValidBrightness(brightness=175): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0043
     * @tc.name      WindowManage_IsValidBrightness_0043
     * @tc.desc      isValidBrightness(brightness=180) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0043 begin`);
      const actual: boolean = isValidBrightness(180);
      logInfo(`isValidBrightness(brightness=180): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0044
     * @tc.name      WindowManage_IsValidBrightness_0044
     * @tc.desc      isValidBrightness(brightness=185) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0044 begin`);
      const actual: boolean = isValidBrightness(185);
      logInfo(`isValidBrightness(brightness=185): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0045
     * @tc.name      WindowManage_IsValidBrightness_0045
     * @tc.desc      isValidBrightness(brightness=190) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0045 begin`);
      const actual: boolean = isValidBrightness(190);
      logInfo(`isValidBrightness(brightness=190): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0046
     * @tc.name      WindowManage_IsValidBrightness_0046
     * @tc.desc      isValidBrightness(brightness=195) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0046 begin`);
      const actual: boolean = isValidBrightness(195);
      logInfo(`isValidBrightness(brightness=195): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0047
     * @tc.name      WindowManage_IsValidBrightness_0047
     * @tc.desc      isValidBrightness(brightness=200) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0047 begin`);
      const actual: boolean = isValidBrightness(200);
      logInfo(`isValidBrightness(brightness=200): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0048
     * @tc.name      WindowManage_IsValidBrightness_0048
     * @tc.desc      isValidBrightness(brightness=7) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0048 begin`);
      const actual: boolean = isValidBrightness(7);
      logInfo(`isValidBrightness(brightness=7): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0049
     * @tc.name      WindowManage_IsValidBrightness_0049
     * @tc.desc      isValidBrightness(brightness=9.72) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_IsValidBrightness_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0049 begin`);
      const actual: boolean = isValidBrightness(9.72);
      logInfo(`isValidBrightness(brightness=9.72): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_IS_VALID_BRIGHTNESS_0050
     * @tc.name      WindowManage_IsValidBrightness_0050
     * @tc.desc      isValidBrightness(brightness=-13) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_IsValidBrightness_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsValidBrightness_0050 begin`);
      const actual: boolean = isValidBrightness(-13);
      logInfo(`isValidBrightness(brightness=-13): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsValidBrightness_0050 end`);
    });
  });
}
