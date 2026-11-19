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
import { dimensionTextOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for dimensionTextOf (96 cases). */
export default function dimensionTextOfTest(): void {
  describe('DimensionTextOfTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0001
     * @tc.name      RequestAddForm_DimensionTextOf_0001
     * @tc.desc      dimensionTextOf(dimension=1) returns "1*2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_DimensionTextOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0001 begin`);
      const actual: string = dimensionTextOf(1);
      logInfo(`dimensionTextOf(dimension=1): actual=${actual}`);
      expect(actual).assertEqual('1*2');
      logInfo(`${BUNDLE}DimensionTextOf_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0002
     * @tc.name      RequestAddForm_DimensionTextOf_0002
     * @tc.desc      dimensionTextOf(dimension=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_DimensionTextOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0002 begin`);
      const actual: string = dimensionTextOf(0);
      logInfo(`dimensionTextOf(dimension=0): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0003
     * @tc.name      RequestAddForm_DimensionTextOf_0003
     * @tc.desc      dimensionTextOf(dimension=2) returns "2*2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_DimensionTextOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0003 begin`);
      const actual: string = dimensionTextOf(2);
      logInfo(`dimensionTextOf(dimension=2): actual=${actual}`);
      expect(actual).assertEqual('2*2');
      logInfo(`${BUNDLE}DimensionTextOf_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0004
     * @tc.name      RequestAddForm_DimensionTextOf_0004
     * @tc.desc      dimensionTextOf(dimension=3) returns "2*4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_DimensionTextOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0004 begin`);
      const actual: string = dimensionTextOf(3);
      logInfo(`dimensionTextOf(dimension=3): actual=${actual}`);
      expect(actual).assertEqual('2*4');
      logInfo(`${BUNDLE}DimensionTextOf_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0005
     * @tc.name      RequestAddForm_DimensionTextOf_0005
     * @tc.desc      dimensionTextOf(dimension=4) returns "4*4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_DimensionTextOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0005 begin`);
      const actual: string = dimensionTextOf(4);
      logInfo(`dimensionTextOf(dimension=4): actual=${actual}`);
      expect(actual).assertEqual('4*4');
      logInfo(`${BUNDLE}DimensionTextOf_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0006
     * @tc.name      RequestAddForm_DimensionTextOf_0006
     * @tc.desc      dimensionTextOf(dimension=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_DimensionTextOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0006 begin`);
      const actual: string = dimensionTextOf(5);
      logInfo(`dimensionTextOf(dimension=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0007
     * @tc.name      RequestAddForm_DimensionTextOf_0007
     * @tc.desc      dimensionTextOf(dimension=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0007 begin`);
      const actual: string = dimensionTextOf(-1);
      logInfo(`dimensionTextOf(dimension=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0008
     * @tc.name      RequestAddForm_DimensionTextOf_0008
     * @tc.desc      dimensionTextOf(dimension=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0008 begin`);
      const actual: string = dimensionTextOf(10);
      logInfo(`dimensionTextOf(dimension=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0009
     * @tc.name      RequestAddForm_DimensionTextOf_0009
     * @tc.desc      dimensionTextOf(dimension=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0009 begin`);
      const actual: string = dimensionTextOf(100);
      logInfo(`dimensionTextOf(dimension=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0010
     * @tc.name      RequestAddForm_DimensionTextOf_0010
     * @tc.desc      dimensionTextOf(dimension=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0010 begin`);
      const actual: string = dimensionTextOf(15);
      logInfo(`dimensionTextOf(dimension=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0011
     * @tc.name      RequestAddForm_DimensionTextOf_0011
     * @tc.desc      dimensionTextOf(dimension=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0011 begin`);
      const actual: string = dimensionTextOf(20);
      logInfo(`dimensionTextOf(dimension=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0012
     * @tc.name      RequestAddForm_DimensionTextOf_0012
     * @tc.desc      dimensionTextOf(dimension=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0012 begin`);
      const actual: string = dimensionTextOf(25);
      logInfo(`dimensionTextOf(dimension=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0013
     * @tc.name      RequestAddForm_DimensionTextOf_0013
     * @tc.desc      dimensionTextOf(dimension=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0013 begin`);
      const actual: string = dimensionTextOf(30);
      logInfo(`dimensionTextOf(dimension=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0014
     * @tc.name      RequestAddForm_DimensionTextOf_0014
     * @tc.desc      dimensionTextOf(dimension=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0014 begin`);
      const actual: string = dimensionTextOf(35);
      logInfo(`dimensionTextOf(dimension=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0015
     * @tc.name      RequestAddForm_DimensionTextOf_0015
     * @tc.desc      dimensionTextOf(dimension=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0015 begin`);
      const actual: string = dimensionTextOf(40);
      logInfo(`dimensionTextOf(dimension=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0016
     * @tc.name      RequestAddForm_DimensionTextOf_0016
     * @tc.desc      dimensionTextOf(dimension=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0016 begin`);
      const actual: string = dimensionTextOf(45);
      logInfo(`dimensionTextOf(dimension=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0017
     * @tc.name      RequestAddForm_DimensionTextOf_0017
     * @tc.desc      dimensionTextOf(dimension=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0017 begin`);
      const actual: string = dimensionTextOf(50);
      logInfo(`dimensionTextOf(dimension=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0018
     * @tc.name      RequestAddForm_DimensionTextOf_0018
     * @tc.desc      dimensionTextOf(dimension=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0018 begin`);
      const actual: string = dimensionTextOf(55);
      logInfo(`dimensionTextOf(dimension=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0019
     * @tc.name      RequestAddForm_DimensionTextOf_0019
     * @tc.desc      dimensionTextOf(dimension=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0019 begin`);
      const actual: string = dimensionTextOf(60);
      logInfo(`dimensionTextOf(dimension=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0020
     * @tc.name      RequestAddForm_DimensionTextOf_0020
     * @tc.desc      dimensionTextOf(dimension=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0020 begin`);
      const actual: string = dimensionTextOf(65);
      logInfo(`dimensionTextOf(dimension=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0021
     * @tc.name      RequestAddForm_DimensionTextOf_0021
     * @tc.desc      dimensionTextOf(dimension=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0021 begin`);
      const actual: string = dimensionTextOf(70);
      logInfo(`dimensionTextOf(dimension=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0022
     * @tc.name      RequestAddForm_DimensionTextOf_0022
     * @tc.desc      dimensionTextOf(dimension=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0022 begin`);
      const actual: string = dimensionTextOf(75);
      logInfo(`dimensionTextOf(dimension=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0023
     * @tc.name      RequestAddForm_DimensionTextOf_0023
     * @tc.desc      dimensionTextOf(dimension=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0023 begin`);
      const actual: string = dimensionTextOf(80);
      logInfo(`dimensionTextOf(dimension=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0024
     * @tc.name      RequestAddForm_DimensionTextOf_0024
     * @tc.desc      dimensionTextOf(dimension=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0024 begin`);
      const actual: string = dimensionTextOf(85);
      logInfo(`dimensionTextOf(dimension=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0025
     * @tc.name      RequestAddForm_DimensionTextOf_0025
     * @tc.desc      dimensionTextOf(dimension=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0025 begin`);
      const actual: string = dimensionTextOf(90);
      logInfo(`dimensionTextOf(dimension=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0026
     * @tc.name      RequestAddForm_DimensionTextOf_0026
     * @tc.desc      dimensionTextOf(dimension=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0026 begin`);
      const actual: string = dimensionTextOf(95);
      logInfo(`dimensionTextOf(dimension=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0027
     * @tc.name      RequestAddForm_DimensionTextOf_0027
     * @tc.desc      dimensionTextOf(dimension=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0027 begin`);
      const actual: string = dimensionTextOf(105);
      logInfo(`dimensionTextOf(dimension=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0028
     * @tc.name      RequestAddForm_DimensionTextOf_0028
     * @tc.desc      dimensionTextOf(dimension=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0028 begin`);
      const actual: string = dimensionTextOf(110);
      logInfo(`dimensionTextOf(dimension=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0029
     * @tc.name      RequestAddForm_DimensionTextOf_0029
     * @tc.desc      dimensionTextOf(dimension=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0029 begin`);
      const actual: string = dimensionTextOf(115);
      logInfo(`dimensionTextOf(dimension=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0030
     * @tc.name      RequestAddForm_DimensionTextOf_0030
     * @tc.desc      dimensionTextOf(dimension=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0030 begin`);
      const actual: string = dimensionTextOf(120);
      logInfo(`dimensionTextOf(dimension=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0031
     * @tc.name      RequestAddForm_DimensionTextOf_0031
     * @tc.desc      dimensionTextOf(dimension=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0031 begin`);
      const actual: string = dimensionTextOf(125);
      logInfo(`dimensionTextOf(dimension=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0032
     * @tc.name      RequestAddForm_DimensionTextOf_0032
     * @tc.desc      dimensionTextOf(dimension=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0032 begin`);
      const actual: string = dimensionTextOf(130);
      logInfo(`dimensionTextOf(dimension=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0033
     * @tc.name      RequestAddForm_DimensionTextOf_0033
     * @tc.desc      dimensionTextOf(dimension=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0033 begin`);
      const actual: string = dimensionTextOf(135);
      logInfo(`dimensionTextOf(dimension=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0034
     * @tc.name      RequestAddForm_DimensionTextOf_0034
     * @tc.desc      dimensionTextOf(dimension=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0034 begin`);
      const actual: string = dimensionTextOf(140);
      logInfo(`dimensionTextOf(dimension=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0035
     * @tc.name      RequestAddForm_DimensionTextOf_0035
     * @tc.desc      dimensionTextOf(dimension=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0035 begin`);
      const actual: string = dimensionTextOf(145);
      logInfo(`dimensionTextOf(dimension=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0036
     * @tc.name      RequestAddForm_DimensionTextOf_0036
     * @tc.desc      dimensionTextOf(dimension=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0036 begin`);
      const actual: string = dimensionTextOf(150);
      logInfo(`dimensionTextOf(dimension=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0037
     * @tc.name      RequestAddForm_DimensionTextOf_0037
     * @tc.desc      dimensionTextOf(dimension=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0037 begin`);
      const actual: string = dimensionTextOf(155);
      logInfo(`dimensionTextOf(dimension=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0038
     * @tc.name      RequestAddForm_DimensionTextOf_0038
     * @tc.desc      dimensionTextOf(dimension=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0038 begin`);
      const actual: string = dimensionTextOf(160);
      logInfo(`dimensionTextOf(dimension=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0039
     * @tc.name      RequestAddForm_DimensionTextOf_0039
     * @tc.desc      dimensionTextOf(dimension=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0039 begin`);
      const actual: string = dimensionTextOf(165);
      logInfo(`dimensionTextOf(dimension=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0040
     * @tc.name      RequestAddForm_DimensionTextOf_0040
     * @tc.desc      dimensionTextOf(dimension=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0040 begin`);
      const actual: string = dimensionTextOf(170);
      logInfo(`dimensionTextOf(dimension=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0041
     * @tc.name      RequestAddForm_DimensionTextOf_0041
     * @tc.desc      dimensionTextOf(dimension=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0041 begin`);
      const actual: string = dimensionTextOf(175);
      logInfo(`dimensionTextOf(dimension=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0042
     * @tc.name      RequestAddForm_DimensionTextOf_0042
     * @tc.desc      dimensionTextOf(dimension=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0042 begin`);
      const actual: string = dimensionTextOf(180);
      logInfo(`dimensionTextOf(dimension=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0042 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0043
     * @tc.name      RequestAddForm_DimensionTextOf_0043
     * @tc.desc      dimensionTextOf(dimension=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0043 begin`);
      const actual: string = dimensionTextOf(185);
      logInfo(`dimensionTextOf(dimension=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0044
     * @tc.name      RequestAddForm_DimensionTextOf_0044
     * @tc.desc      dimensionTextOf(dimension=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0044 begin`);
      const actual: string = dimensionTextOf(190);
      logInfo(`dimensionTextOf(dimension=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0045
     * @tc.name      RequestAddForm_DimensionTextOf_0045
     * @tc.desc      dimensionTextOf(dimension=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0045 begin`);
      const actual: string = dimensionTextOf(195);
      logInfo(`dimensionTextOf(dimension=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0046
     * @tc.name      RequestAddForm_DimensionTextOf_0046
     * @tc.desc      dimensionTextOf(dimension=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0046 begin`);
      const actual: string = dimensionTextOf(200);
      logInfo(`dimensionTextOf(dimension=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0047
     * @tc.name      RequestAddForm_DimensionTextOf_0047
     * @tc.desc      dimensionTextOf(dimension=-80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0047 begin`);
      const actual: string = dimensionTextOf(-80);
      logInfo(`dimensionTextOf(dimension=-80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0048
     * @tc.name      RequestAddForm_DimensionTextOf_0048
     * @tc.desc      dimensionTextOf(dimension=163) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0048 begin`);
      const actual: string = dimensionTextOf(163);
      logInfo(`dimensionTextOf(dimension=163): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0049
     * @tc.name      RequestAddForm_DimensionTextOf_0049
     * @tc.desc      dimensionTextOf(dimension=19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0049 begin`);
      const actual: string = dimensionTextOf(19);
      logInfo(`dimensionTextOf(dimension=19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0050
     * @tc.name      RequestAddForm_DimensionTextOf_0050
     * @tc.desc      dimensionTextOf(dimension=-9) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0050 begin`);
      const actual: string = dimensionTextOf(-9);
      logInfo(`dimensionTextOf(dimension=-9): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0050 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0051
     * @tc.name      RequestAddForm_DimensionTextOf_0051
     * @tc.desc      dimensionTextOf(dimension=178) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0051 begin`);
      const actual: string = dimensionTextOf(178);
      logInfo(`dimensionTextOf(dimension=178): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0051 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0052
     * @tc.name      RequestAddForm_DimensionTextOf_0052
     * @tc.desc      dimensionTextOf(dimension=65.1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0052 begin`);
      const actual: string = dimensionTextOf(65.1);
      logInfo(`dimensionTextOf(dimension=65.1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0052 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0053
     * @tc.name      RequestAddForm_DimensionTextOf_0053
     * @tc.desc      dimensionTextOf(dimension=17) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0053 begin`);
      const actual: string = dimensionTextOf(17);
      logInfo(`dimensionTextOf(dimension=17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0053 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0054
     * @tc.name      RequestAddForm_DimensionTextOf_0054
     * @tc.desc      dimensionTextOf(dimension=-14) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0054 begin`);
      const actual: string = dimensionTextOf(-14);
      logInfo(`dimensionTextOf(dimension=-14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0054 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0055
     * @tc.name      RequestAddForm_DimensionTextOf_0055
     * @tc.desc      dimensionTextOf(dimension=-61) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0055 begin`);
      const actual: string = dimensionTextOf(-61);
      logInfo(`dimensionTextOf(dimension=-61): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0055 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0056
     * @tc.name      RequestAddForm_DimensionTextOf_0056
     * @tc.desc      dimensionTextOf(dimension=10.49) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0056 begin`);
      const actual: string = dimensionTextOf(10.49);
      logInfo(`dimensionTextOf(dimension=10.49): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0056 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0057
     * @tc.name      RequestAddForm_DimensionTextOf_0057
     * @tc.desc      dimensionTextOf(dimension=-36) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0057 begin`);
      const actual: string = dimensionTextOf(-36);
      logInfo(`dimensionTextOf(dimension=-36): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0057 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0058
     * @tc.name      RequestAddForm_DimensionTextOf_0058
     * @tc.desc      dimensionTextOf(dimension=41) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0058 begin`);
      const actual: string = dimensionTextOf(41);
      logInfo(`dimensionTextOf(dimension=41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0058 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0059
     * @tc.name      RequestAddForm_DimensionTextOf_0059
     * @tc.desc      dimensionTextOf(dimension=10.8) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0059 begin`);
      const actual: string = dimensionTextOf(10.8);
      logInfo(`dimensionTextOf(dimension=10.8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0059 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0060
     * @tc.name      RequestAddForm_DimensionTextOf_0060
     * @tc.desc      dimensionTextOf(dimension=38) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0060 begin`);
      const actual: string = dimensionTextOf(38);
      logInfo(`dimensionTextOf(dimension=38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0060 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0061
     * @tc.name      RequestAddForm_DimensionTextOf_0061
     * @tc.desc      dimensionTextOf(dimension=65.88) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0061 begin`);
      const actual: string = dimensionTextOf(65.88);
      logInfo(`dimensionTextOf(dimension=65.88): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0061 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0062
     * @tc.name      RequestAddForm_DimensionTextOf_0062
     * @tc.desc      dimensionTextOf(dimension=-71) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0062 begin`);
      const actual: string = dimensionTextOf(-71);
      logInfo(`dimensionTextOf(dimension=-71): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0062 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0063
     * @tc.name      RequestAddForm_DimensionTextOf_0063
     * @tc.desc      dimensionTextOf(dimension=98.54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0063 begin`);
      const actual: string = dimensionTextOf(98.54);
      logInfo(`dimensionTextOf(dimension=98.54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0063 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0064
     * @tc.name      RequestAddForm_DimensionTextOf_0064
     * @tc.desc      dimensionTextOf(dimension=-7) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0064 begin`);
      const actual: string = dimensionTextOf(-7);
      logInfo(`dimensionTextOf(dimension=-7): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0064 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0065
     * @tc.name      RequestAddForm_DimensionTextOf_0065
     * @tc.desc      dimensionTextOf(dimension=25.54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0065 begin`);
      const actual: string = dimensionTextOf(25.54);
      logInfo(`dimensionTextOf(dimension=25.54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0065 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0066
     * @tc.name      RequestAddForm_DimensionTextOf_0066
     * @tc.desc      dimensionTextOf(dimension=64) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0066 begin`);
      const actual: string = dimensionTextOf(64);
      logInfo(`dimensionTextOf(dimension=64): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0066 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0067
     * @tc.name      RequestAddForm_DimensionTextOf_0067
     * @tc.desc      dimensionTextOf(dimension=58) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0067 begin`);
      const actual: string = dimensionTextOf(58);
      logInfo(`dimensionTextOf(dimension=58): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0067 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0068
     * @tc.name      RequestAddForm_DimensionTextOf_0068
     * @tc.desc      dimensionTextOf(dimension=179) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0068 begin`);
      const actual: string = dimensionTextOf(179);
      logInfo(`dimensionTextOf(dimension=179): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0068 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0069
     * @tc.name      RequestAddForm_DimensionTextOf_0069
     * @tc.desc      dimensionTextOf(dimension=27.39) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0069 begin`);
      const actual: string = dimensionTextOf(27.39);
      logInfo(`dimensionTextOf(dimension=27.39): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0069 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0070
     * @tc.name      RequestAddForm_DimensionTextOf_0070
     * @tc.desc      dimensionTextOf(dimension=-78) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0070 begin`);
      const actual: string = dimensionTextOf(-78);
      logInfo(`dimensionTextOf(dimension=-78): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0070 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0071
     * @tc.name      RequestAddForm_DimensionTextOf_0071
     * @tc.desc      dimensionTextOf(dimension=197) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0071 begin`);
      const actual: string = dimensionTextOf(197);
      logInfo(`dimensionTextOf(dimension=197): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0071 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0072
     * @tc.name      RequestAddForm_DimensionTextOf_0072
     * @tc.desc      dimensionTextOf(dimension=138) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0072 begin`);
      const actual: string = dimensionTextOf(138);
      logInfo(`dimensionTextOf(dimension=138): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0072 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0073
     * @tc.name      RequestAddForm_DimensionTextOf_0073
     * @tc.desc      dimensionTextOf(dimension=-8) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0073 begin`);
      const actual: string = dimensionTextOf(-8);
      logInfo(`dimensionTextOf(dimension=-8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0073 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0074
     * @tc.name      RequestAddForm_DimensionTextOf_0074
     * @tc.desc      dimensionTextOf(dimension=153) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0074 begin`);
      const actual: string = dimensionTextOf(153);
      logInfo(`dimensionTextOf(dimension=153): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0074 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0075
     * @tc.name      RequestAddForm_DimensionTextOf_0075
     * @tc.desc      dimensionTextOf(dimension=1.97) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0075 begin`);
      const actual: string = dimensionTextOf(1.97);
      logInfo(`dimensionTextOf(dimension=1.97): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0075 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0076
     * @tc.name      RequestAddForm_DimensionTextOf_0076
     * @tc.desc      dimensionTextOf(dimension=-58) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0076 begin`);
      const actual: string = dimensionTextOf(-58);
      logInfo(`dimensionTextOf(dimension=-58): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0076 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0077
     * @tc.name      RequestAddForm_DimensionTextOf_0077
     * @tc.desc      dimensionTextOf(dimension=59.43) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0077 begin`);
      const actual: string = dimensionTextOf(59.43);
      logInfo(`dimensionTextOf(dimension=59.43): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0077 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0078
     * @tc.name      RequestAddForm_DimensionTextOf_0078
     * @tc.desc      dimensionTextOf(dimension=28) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0078 begin`);
      const actual: string = dimensionTextOf(28);
      logInfo(`dimensionTextOf(dimension=28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0078 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0079
     * @tc.name      RequestAddForm_DimensionTextOf_0079
     * @tc.desc      dimensionTextOf(dimension=144) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0079 begin`);
      const actual: string = dimensionTextOf(144);
      logInfo(`dimensionTextOf(dimension=144): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0079 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0080
     * @tc.name      RequestAddForm_DimensionTextOf_0080
     * @tc.desc      dimensionTextOf(dimension=81.71) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0080 begin`);
      const actual: string = dimensionTextOf(81.71);
      logInfo(`dimensionTextOf(dimension=81.71): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0080 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0081
     * @tc.name      RequestAddForm_DimensionTextOf_0081
     * @tc.desc      dimensionTextOf(dimension=88) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0081 begin`);
      const actual: string = dimensionTextOf(88);
      logInfo(`dimensionTextOf(dimension=88): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0081 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0082
     * @tc.name      RequestAddForm_DimensionTextOf_0082
     * @tc.desc      dimensionTextOf(dimension=168) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0082 begin`);
      const actual: string = dimensionTextOf(168);
      logInfo(`dimensionTextOf(dimension=168): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0082 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0083
     * @tc.name      RequestAddForm_DimensionTextOf_0083
     * @tc.desc      dimensionTextOf(dimension=-52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0083 begin`);
      const actual: string = dimensionTextOf(-52);
      logInfo(`dimensionTextOf(dimension=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0083 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0084
     * @tc.name      RequestAddForm_DimensionTextOf_0084
     * @tc.desc      dimensionTextOf(dimension=158) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0084 begin`);
      const actual: string = dimensionTextOf(158);
      logInfo(`dimensionTextOf(dimension=158): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0084 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0085
     * @tc.name      RequestAddForm_DimensionTextOf_0085
     * @tc.desc      dimensionTextOf(dimension=69) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0085 begin`);
      const actual: string = dimensionTextOf(69);
      logInfo(`dimensionTextOf(dimension=69): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0085 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0086
     * @tc.name      RequestAddForm_DimensionTextOf_0086
     * @tc.desc      dimensionTextOf(dimension=56) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0086 begin`);
      const actual: string = dimensionTextOf(56);
      logInfo(`dimensionTextOf(dimension=56): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0086 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0087
     * @tc.name      RequestAddForm_DimensionTextOf_0087
     * @tc.desc      dimensionTextOf(dimension=62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0087 begin`);
      const actual: string = dimensionTextOf(62);
      logInfo(`dimensionTextOf(dimension=62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0087 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0088
     * @tc.name      RequestAddForm_DimensionTextOf_0088
     * @tc.desc      dimensionTextOf(dimension=57.37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0088 begin`);
      const actual: string = dimensionTextOf(57.37);
      logInfo(`dimensionTextOf(dimension=57.37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0088 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0089
     * @tc.name      RequestAddForm_DimensionTextOf_0089
     * @tc.desc      dimensionTextOf(dimension=83) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0089 begin`);
      const actual: string = dimensionTextOf(83);
      logInfo(`dimensionTextOf(dimension=83): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0089 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0090
     * @tc.name      RequestAddForm_DimensionTextOf_0090
     * @tc.desc      dimensionTextOf(dimension=101) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0090 begin`);
      const actual: string = dimensionTextOf(101);
      logInfo(`dimensionTextOf(dimension=101): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0090 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0091
     * @tc.name      RequestAddForm_DimensionTextOf_0091
     * @tc.desc      dimensionTextOf(dimension=96.22) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0091 begin`);
      const actual: string = dimensionTextOf(96.22);
      logInfo(`dimensionTextOf(dimension=96.22): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0091 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0092
     * @tc.name      RequestAddForm_DimensionTextOf_0092
     * @tc.desc      dimensionTextOf(dimension=86) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0092 begin`);
      const actual: string = dimensionTextOf(86);
      logInfo(`dimensionTextOf(dimension=86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0092 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0093
     * @tc.name      RequestAddForm_DimensionTextOf_0093
     * @tc.desc      dimensionTextOf(dimension=68) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0093 begin`);
      const actual: string = dimensionTextOf(68);
      logInfo(`dimensionTextOf(dimension=68): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0093 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0094
     * @tc.name      RequestAddForm_DimensionTextOf_0094
     * @tc.desc      dimensionTextOf(dimension=-20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0094 begin`);
      const actual: string = dimensionTextOf(-20);
      logInfo(`dimensionTextOf(dimension=-20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0094 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0095
     * @tc.name      RequestAddForm_DimensionTextOf_0095
     * @tc.desc      dimensionTextOf(dimension=-66) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DimensionTextOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0095 begin`);
      const actual: string = dimensionTextOf(-66);
      logInfo(`dimensionTextOf(dimension=-66): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0095 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DIMENSION_TEXT_OF_0096
     * @tc.name      RequestAddForm_DimensionTextOf_0096
     * @tc.desc      dimensionTextOf(dimension=35.11) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DimensionTextOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DimensionTextOf_0096 begin`);
      const actual: string = dimensionTextOf(35.11);
      logInfo(`dimensionTextOf(dimension=35.11): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DimensionTextOf_0096 end`);
    });
  });
}
