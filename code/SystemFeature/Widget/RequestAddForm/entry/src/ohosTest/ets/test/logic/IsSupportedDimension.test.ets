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
import { isSupportedDimension } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isSupportedDimension (50 cases). */
export default function isSupportedDimensionTest(): void {
  describe('IsSupportedDimensionTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0001
     * @tc.name      RequestAddForm_IsSupportedDimension_0001
     * @tc.desc      isSupportedDimension(dimension=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_IsSupportedDimension_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0001 begin`);
      const actual: boolean = isSupportedDimension(0);
      logInfo(`isSupportedDimension(dimension=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0002
     * @tc.name      RequestAddForm_IsSupportedDimension_0002
     * @tc.desc      isSupportedDimension(dimension=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_IsSupportedDimension_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0002 begin`);
      const actual: boolean = isSupportedDimension(2);
      logInfo(`isSupportedDimension(dimension=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsSupportedDimension_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0003
     * @tc.name      RequestAddForm_IsSupportedDimension_0003
     * @tc.desc      isSupportedDimension(dimension=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_IsSupportedDimension_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0003 begin`);
      const actual: boolean = isSupportedDimension(-1);
      logInfo(`isSupportedDimension(dimension=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0004
     * @tc.name      RequestAddForm_IsSupportedDimension_0004
     * @tc.desc      isSupportedDimension(dimension=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_IsSupportedDimension_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0004 begin`);
      const actual: boolean = isSupportedDimension(1);
      logInfo(`isSupportedDimension(dimension=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0005
     * @tc.name      RequestAddForm_IsSupportedDimension_0005
     * @tc.desc      isSupportedDimension(dimension=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0005 begin`);
      const actual: boolean = isSupportedDimension(3);
      logInfo(`isSupportedDimension(dimension=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0006
     * @tc.name      RequestAddForm_IsSupportedDimension_0006
     * @tc.desc      isSupportedDimension(dimension=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0006 begin`);
      const actual: boolean = isSupportedDimension(10);
      logInfo(`isSupportedDimension(dimension=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0007
     * @tc.name      RequestAddForm_IsSupportedDimension_0007
     * @tc.desc      isSupportedDimension(dimension=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0007 begin`);
      const actual: boolean = isSupportedDimension(100);
      logInfo(`isSupportedDimension(dimension=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0008
     * @tc.name      RequestAddForm_IsSupportedDimension_0008
     * @tc.desc      isSupportedDimension(dimension=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0008 begin`);
      const actual: boolean = isSupportedDimension(5);
      logInfo(`isSupportedDimension(dimension=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0009
     * @tc.name      RequestAddForm_IsSupportedDimension_0009
     * @tc.desc      isSupportedDimension(dimension=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0009 begin`);
      const actual: boolean = isSupportedDimension(15);
      logInfo(`isSupportedDimension(dimension=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0010
     * @tc.name      RequestAddForm_IsSupportedDimension_0010
     * @tc.desc      isSupportedDimension(dimension=20) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0010 begin`);
      const actual: boolean = isSupportedDimension(20);
      logInfo(`isSupportedDimension(dimension=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0011
     * @tc.name      RequestAddForm_IsSupportedDimension_0011
     * @tc.desc      isSupportedDimension(dimension=25) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0011 begin`);
      const actual: boolean = isSupportedDimension(25);
      logInfo(`isSupportedDimension(dimension=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0012
     * @tc.name      RequestAddForm_IsSupportedDimension_0012
     * @tc.desc      isSupportedDimension(dimension=30) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0012 begin`);
      const actual: boolean = isSupportedDimension(30);
      logInfo(`isSupportedDimension(dimension=30): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0013
     * @tc.name      RequestAddForm_IsSupportedDimension_0013
     * @tc.desc      isSupportedDimension(dimension=35) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0013 begin`);
      const actual: boolean = isSupportedDimension(35);
      logInfo(`isSupportedDimension(dimension=35): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0014
     * @tc.name      RequestAddForm_IsSupportedDimension_0014
     * @tc.desc      isSupportedDimension(dimension=40) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0014 begin`);
      const actual: boolean = isSupportedDimension(40);
      logInfo(`isSupportedDimension(dimension=40): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0015
     * @tc.name      RequestAddForm_IsSupportedDimension_0015
     * @tc.desc      isSupportedDimension(dimension=45) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0015 begin`);
      const actual: boolean = isSupportedDimension(45);
      logInfo(`isSupportedDimension(dimension=45): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0016
     * @tc.name      RequestAddForm_IsSupportedDimension_0016
     * @tc.desc      isSupportedDimension(dimension=50) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0016 begin`);
      const actual: boolean = isSupportedDimension(50);
      logInfo(`isSupportedDimension(dimension=50): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0017
     * @tc.name      RequestAddForm_IsSupportedDimension_0017
     * @tc.desc      isSupportedDimension(dimension=55) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0017 begin`);
      const actual: boolean = isSupportedDimension(55);
      logInfo(`isSupportedDimension(dimension=55): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0018
     * @tc.name      RequestAddForm_IsSupportedDimension_0018
     * @tc.desc      isSupportedDimension(dimension=60) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0018 begin`);
      const actual: boolean = isSupportedDimension(60);
      logInfo(`isSupportedDimension(dimension=60): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0019
     * @tc.name      RequestAddForm_IsSupportedDimension_0019
     * @tc.desc      isSupportedDimension(dimension=65) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0019 begin`);
      const actual: boolean = isSupportedDimension(65);
      logInfo(`isSupportedDimension(dimension=65): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0020
     * @tc.name      RequestAddForm_IsSupportedDimension_0020
     * @tc.desc      isSupportedDimension(dimension=70) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0020 begin`);
      const actual: boolean = isSupportedDimension(70);
      logInfo(`isSupportedDimension(dimension=70): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0021
     * @tc.name      RequestAddForm_IsSupportedDimension_0021
     * @tc.desc      isSupportedDimension(dimension=75) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0021 begin`);
      const actual: boolean = isSupportedDimension(75);
      logInfo(`isSupportedDimension(dimension=75): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0022
     * @tc.name      RequestAddForm_IsSupportedDimension_0022
     * @tc.desc      isSupportedDimension(dimension=80) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0022 begin`);
      const actual: boolean = isSupportedDimension(80);
      logInfo(`isSupportedDimension(dimension=80): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0023
     * @tc.name      RequestAddForm_IsSupportedDimension_0023
     * @tc.desc      isSupportedDimension(dimension=85) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0023 begin`);
      const actual: boolean = isSupportedDimension(85);
      logInfo(`isSupportedDimension(dimension=85): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0024
     * @tc.name      RequestAddForm_IsSupportedDimension_0024
     * @tc.desc      isSupportedDimension(dimension=90) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0024 begin`);
      const actual: boolean = isSupportedDimension(90);
      logInfo(`isSupportedDimension(dimension=90): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0025
     * @tc.name      RequestAddForm_IsSupportedDimension_0025
     * @tc.desc      isSupportedDimension(dimension=95) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0025 begin`);
      const actual: boolean = isSupportedDimension(95);
      logInfo(`isSupportedDimension(dimension=95): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0026
     * @tc.name      RequestAddForm_IsSupportedDimension_0026
     * @tc.desc      isSupportedDimension(dimension=105) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0026 begin`);
      const actual: boolean = isSupportedDimension(105);
      logInfo(`isSupportedDimension(dimension=105): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0027
     * @tc.name      RequestAddForm_IsSupportedDimension_0027
     * @tc.desc      isSupportedDimension(dimension=110) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0027 begin`);
      const actual: boolean = isSupportedDimension(110);
      logInfo(`isSupportedDimension(dimension=110): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0028
     * @tc.name      RequestAddForm_IsSupportedDimension_0028
     * @tc.desc      isSupportedDimension(dimension=115) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0028 begin`);
      const actual: boolean = isSupportedDimension(115);
      logInfo(`isSupportedDimension(dimension=115): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0029
     * @tc.name      RequestAddForm_IsSupportedDimension_0029
     * @tc.desc      isSupportedDimension(dimension=120) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0029 begin`);
      const actual: boolean = isSupportedDimension(120);
      logInfo(`isSupportedDimension(dimension=120): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0030
     * @tc.name      RequestAddForm_IsSupportedDimension_0030
     * @tc.desc      isSupportedDimension(dimension=125) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0030 begin`);
      const actual: boolean = isSupportedDimension(125);
      logInfo(`isSupportedDimension(dimension=125): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0031
     * @tc.name      RequestAddForm_IsSupportedDimension_0031
     * @tc.desc      isSupportedDimension(dimension=130) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0031 begin`);
      const actual: boolean = isSupportedDimension(130);
      logInfo(`isSupportedDimension(dimension=130): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0032
     * @tc.name      RequestAddForm_IsSupportedDimension_0032
     * @tc.desc      isSupportedDimension(dimension=135) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0032 begin`);
      const actual: boolean = isSupportedDimension(135);
      logInfo(`isSupportedDimension(dimension=135): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0033
     * @tc.name      RequestAddForm_IsSupportedDimension_0033
     * @tc.desc      isSupportedDimension(dimension=140) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0033 begin`);
      const actual: boolean = isSupportedDimension(140);
      logInfo(`isSupportedDimension(dimension=140): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0034
     * @tc.name      RequestAddForm_IsSupportedDimension_0034
     * @tc.desc      isSupportedDimension(dimension=145) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0034 begin`);
      const actual: boolean = isSupportedDimension(145);
      logInfo(`isSupportedDimension(dimension=145): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0035
     * @tc.name      RequestAddForm_IsSupportedDimension_0035
     * @tc.desc      isSupportedDimension(dimension=150) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0035 begin`);
      const actual: boolean = isSupportedDimension(150);
      logInfo(`isSupportedDimension(dimension=150): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0036
     * @tc.name      RequestAddForm_IsSupportedDimension_0036
     * @tc.desc      isSupportedDimension(dimension=155) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0036 begin`);
      const actual: boolean = isSupportedDimension(155);
      logInfo(`isSupportedDimension(dimension=155): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0037
     * @tc.name      RequestAddForm_IsSupportedDimension_0037
     * @tc.desc      isSupportedDimension(dimension=160) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0037 begin`);
      const actual: boolean = isSupportedDimension(160);
      logInfo(`isSupportedDimension(dimension=160): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0038
     * @tc.name      RequestAddForm_IsSupportedDimension_0038
     * @tc.desc      isSupportedDimension(dimension=165) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0038 begin`);
      const actual: boolean = isSupportedDimension(165);
      logInfo(`isSupportedDimension(dimension=165): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0039
     * @tc.name      RequestAddForm_IsSupportedDimension_0039
     * @tc.desc      isSupportedDimension(dimension=170) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0039 begin`);
      const actual: boolean = isSupportedDimension(170);
      logInfo(`isSupportedDimension(dimension=170): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0040
     * @tc.name      RequestAddForm_IsSupportedDimension_0040
     * @tc.desc      isSupportedDimension(dimension=175) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0040 begin`);
      const actual: boolean = isSupportedDimension(175);
      logInfo(`isSupportedDimension(dimension=175): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0041
     * @tc.name      RequestAddForm_IsSupportedDimension_0041
     * @tc.desc      isSupportedDimension(dimension=180) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0041 begin`);
      const actual: boolean = isSupportedDimension(180);
      logInfo(`isSupportedDimension(dimension=180): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0042
     * @tc.name      RequestAddForm_IsSupportedDimension_0042
     * @tc.desc      isSupportedDimension(dimension=185) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0042 begin`);
      const actual: boolean = isSupportedDimension(185);
      logInfo(`isSupportedDimension(dimension=185): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0042 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0043
     * @tc.name      RequestAddForm_IsSupportedDimension_0043
     * @tc.desc      isSupportedDimension(dimension=190) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0043 begin`);
      const actual: boolean = isSupportedDimension(190);
      logInfo(`isSupportedDimension(dimension=190): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0044
     * @tc.name      RequestAddForm_IsSupportedDimension_0044
     * @tc.desc      isSupportedDimension(dimension=195) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0044 begin`);
      const actual: boolean = isSupportedDimension(195);
      logInfo(`isSupportedDimension(dimension=195): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0045
     * @tc.name      RequestAddForm_IsSupportedDimension_0045
     * @tc.desc      isSupportedDimension(dimension=200) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0045 begin`);
      const actual: boolean = isSupportedDimension(200);
      logInfo(`isSupportedDimension(dimension=200): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0046
     * @tc.name      RequestAddForm_IsSupportedDimension_0046
     * @tc.desc      isSupportedDimension(dimension=74.63) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0046 begin`);
      const actual: boolean = isSupportedDimension(74.63);
      logInfo(`isSupportedDimension(dimension=74.63): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0047
     * @tc.name      RequestAddForm_IsSupportedDimension_0047
     * @tc.desc      isSupportedDimension(dimension=17) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0047 begin`);
      const actual: boolean = isSupportedDimension(17);
      logInfo(`isSupportedDimension(dimension=17): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0048
     * @tc.name      RequestAddForm_IsSupportedDimension_0048
     * @tc.desc      isSupportedDimension(dimension=147) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0048 begin`);
      const actual: boolean = isSupportedDimension(147);
      logInfo(`isSupportedDimension(dimension=147): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0049
     * @tc.name      RequestAddForm_IsSupportedDimension_0049
     * @tc.desc      isSupportedDimension(dimension=-51) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_IsSupportedDimension_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0049 begin`);
      const actual: boolean = isSupportedDimension(-51);
      logInfo(`isSupportedDimension(dimension=-51): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_IS_SUPPORTED_DIMENSION_0050
     * @tc.name      RequestAddForm_IsSupportedDimension_0050
     * @tc.desc      isSupportedDimension(dimension=19) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_IsSupportedDimension_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsSupportedDimension_0050 begin`);
      const actual: boolean = isSupportedDimension(19);
      logInfo(`isSupportedDimension(dimension=19): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsSupportedDimension_0050 end`);
    });
  });
}
