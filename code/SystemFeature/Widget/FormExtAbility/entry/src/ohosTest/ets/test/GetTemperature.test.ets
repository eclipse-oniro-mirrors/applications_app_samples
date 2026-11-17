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
import { getTemperature } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for getTemperature (96 cases). */
export default function getTemperatureTest(): void {
  describe('GetTemperatureTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0001
     * @tc.name      FormExtAbility_GetTemperature_0001
     * @tc.desc      getTemperature(formId="", count=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_GetTemperature_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0001 begin`);
      const actual: number = getTemperature('', 0);
      logInfo(`getTemperature(formId="", count=0): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0002
     * @tc.name      FormExtAbility_GetTemperature_0002
     * @tc.desc      getTemperature(formId="123", count=0) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_GetTemperature_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0002 begin`);
      const actual: number = getTemperature('123', 0);
      logInfo(`getTemperature(formId="123", count=0): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}GetTemperature_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0003
     * @tc.name      FormExtAbility_GetTemperature_0003
     * @tc.desc      getTemperature(formId="123", count=1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0003 begin`);
      const actual: number = getTemperature('123', 1);
      logInfo(`getTemperature(formId="123", count=1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GetTemperature_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0004
     * @tc.name      FormExtAbility_GetTemperature_0004
     * @tc.desc      getTemperature(formId="123", count=10) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0004 begin`);
      const actual: number = getTemperature('123', 10);
      logInfo(`getTemperature(formId="123", count=10): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}GetTemperature_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0005
     * @tc.name      FormExtAbility_GetTemperature_0005
     * @tc.desc      getTemperature(formId="123", count=9) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0005 begin`);
      const actual: number = getTemperature('123', 9);
      logInfo(`getTemperature(formId="123", count=9): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}GetTemperature_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0006
     * @tc.name      FormExtAbility_GetTemperature_0006
     * @tc.desc      getTemperature(formId="123", count=5) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0006 begin`);
      const actual: number = getTemperature('123', 5);
      logInfo(`getTemperature(formId="123", count=5): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GetTemperature_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0007
     * @tc.name      FormExtAbility_GetTemperature_0007
     * @tc.desc      getTemperature(formId="123", count=2) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0007 begin`);
      const actual: number = getTemperature('123', 2);
      logInfo(`getTemperature(formId="123", count=2): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}GetTemperature_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0008
     * @tc.name      FormExtAbility_GetTemperature_0008
     * @tc.desc      getTemperature(formId="123", count=3) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0008 begin`);
      const actual: number = getTemperature('123', 3);
      logInfo(`getTemperature(formId="123", count=3): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}GetTemperature_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0009
     * @tc.name      FormExtAbility_GetTemperature_0009
     * @tc.desc      getTemperature(formId="123", count=-1) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0009 begin`);
      const actual: number = getTemperature('123', -1);
      logInfo(`getTemperature(formId="123", count=-1): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}GetTemperature_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0010
     * @tc.name      FormExtAbility_GetTemperature_0010
     * @tc.desc      getTemperature(formId="123", count=186) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0010 begin`);
      const actual: number = getTemperature('123', 186);
      logInfo(`getTemperature(formId="123", count=186): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}GetTemperature_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0011
     * @tc.name      FormExtAbility_GetTemperature_0011
     * @tc.desc      getTemperature(formId="123", count=26.63) returns 6.370000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0011 begin`);
      const actual: number = getTemperature('123', 26.63);
      logInfo(`getTemperature(formId="123", count=26.63): actual=${actual}`);
      expect(actual).assertClose(6.370000000000001, PRECISION);
      logInfo(`${BUNDLE}GetTemperature_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0012
     * @tc.name      FormExtAbility_GetTemperature_0012
     * @tc.desc      getTemperature(formId="", count=1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0012 begin`);
      const actual: number = getTemperature('', 1);
      logInfo(`getTemperature(formId="", count=1): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0013
     * @tc.name      FormExtAbility_GetTemperature_0013
     * @tc.desc      getTemperature(formId="", count=10) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0013 begin`);
      const actual: number = getTemperature('', 10);
      logInfo(`getTemperature(formId="", count=10): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0014
     * @tc.name      FormExtAbility_GetTemperature_0014
     * @tc.desc      getTemperature(formId="", count=9) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0014 begin`);
      const actual: number = getTemperature('', 9);
      logInfo(`getTemperature(formId="", count=9): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0015
     * @tc.name      FormExtAbility_GetTemperature_0015
     * @tc.desc      getTemperature(formId="", count=11) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0015 begin`);
      const actual: number = getTemperature('', 11);
      logInfo(`getTemperature(formId="", count=11): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0016
     * @tc.name      FormExtAbility_GetTemperature_0016
     * @tc.desc      getTemperature(formId="", count=20) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0016 begin`);
      const actual: number = getTemperature('', 20);
      logInfo(`getTemperature(formId="", count=20): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0017
     * @tc.name      FormExtAbility_GetTemperature_0017
     * @tc.desc      getTemperature(formId="", count=5) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0017 begin`);
      const actual: number = getTemperature('', 5);
      logInfo(`getTemperature(formId="", count=5): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0018
     * @tc.name      FormExtAbility_GetTemperature_0018
     * @tc.desc      getTemperature(formId="", count=2) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0018 begin`);
      const actual: number = getTemperature('', 2);
      logInfo(`getTemperature(formId="", count=2): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0019
     * @tc.name      FormExtAbility_GetTemperature_0019
     * @tc.desc      getTemperature(formId="", count=3) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0019 begin`);
      const actual: number = getTemperature('', 3);
      logInfo(`getTemperature(formId="", count=3): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0020
     * @tc.name      FormExtAbility_GetTemperature_0020
     * @tc.desc      getTemperature(formId="", count=100) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0020 begin`);
      const actual: number = getTemperature('', 100);
      logInfo(`getTemperature(formId="", count=100): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0021
     * @tc.name      FormExtAbility_GetTemperature_0021
     * @tc.desc      getTemperature(formId="", count=-1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0021 begin`);
      const actual: number = getTemperature('', -1);
      logInfo(`getTemperature(formId="", count=-1): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0022
     * @tc.name      FormExtAbility_GetTemperature_0022
     * @tc.desc      getTemperature(formId="", count=15) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0022 begin`);
      const actual: number = getTemperature('', 15);
      logInfo(`getTemperature(formId="", count=15): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0023
     * @tc.name      FormExtAbility_GetTemperature_0023
     * @tc.desc      getTemperature(formId="", count=25) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0023 begin`);
      const actual: number = getTemperature('', 25);
      logInfo(`getTemperature(formId="", count=25): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0024
     * @tc.name      FormExtAbility_GetTemperature_0024
     * @tc.desc      getTemperature(formId="", count=30) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0024 begin`);
      const actual: number = getTemperature('', 30);
      logInfo(`getTemperature(formId="", count=30): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0025
     * @tc.name      FormExtAbility_GetTemperature_0025
     * @tc.desc      getTemperature(formId="", count=35) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0025 begin`);
      const actual: number = getTemperature('', 35);
      logInfo(`getTemperature(formId="", count=35): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0026
     * @tc.name      FormExtAbility_GetTemperature_0026
     * @tc.desc      getTemperature(formId="", count=40) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0026 begin`);
      const actual: number = getTemperature('', 40);
      logInfo(`getTemperature(formId="", count=40): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0027
     * @tc.name      FormExtAbility_GetTemperature_0027
     * @tc.desc      getTemperature(formId="", count=45) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0027 begin`);
      const actual: number = getTemperature('', 45);
      logInfo(`getTemperature(formId="", count=45): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0028
     * @tc.name      FormExtAbility_GetTemperature_0028
     * @tc.desc      getTemperature(formId="", count=50) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0028 begin`);
      const actual: number = getTemperature('', 50);
      logInfo(`getTemperature(formId="", count=50): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0029
     * @tc.name      FormExtAbility_GetTemperature_0029
     * @tc.desc      getTemperature(formId="", count=55) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0029 begin`);
      const actual: number = getTemperature('', 55);
      logInfo(`getTemperature(formId="", count=55): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0030
     * @tc.name      FormExtAbility_GetTemperature_0030
     * @tc.desc      getTemperature(formId="", count=60) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0030 begin`);
      const actual: number = getTemperature('', 60);
      logInfo(`getTemperature(formId="", count=60): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0031
     * @tc.name      FormExtAbility_GetTemperature_0031
     * @tc.desc      getTemperature(formId="", count=65) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0031 begin`);
      const actual: number = getTemperature('', 65);
      logInfo(`getTemperature(formId="", count=65): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0032
     * @tc.name      FormExtAbility_GetTemperature_0032
     * @tc.desc      getTemperature(formId="", count=70) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0032 begin`);
      const actual: number = getTemperature('', 70);
      logInfo(`getTemperature(formId="", count=70): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0033
     * @tc.name      FormExtAbility_GetTemperature_0033
     * @tc.desc      getTemperature(formId="", count=75) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0033 begin`);
      const actual: number = getTemperature('', 75);
      logInfo(`getTemperature(formId="", count=75): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0034
     * @tc.name      FormExtAbility_GetTemperature_0034
     * @tc.desc      getTemperature(formId="", count=80) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0034 begin`);
      const actual: number = getTemperature('', 80);
      logInfo(`getTemperature(formId="", count=80): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0035
     * @tc.name      FormExtAbility_GetTemperature_0035
     * @tc.desc      getTemperature(formId="", count=85) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0035 begin`);
      const actual: number = getTemperature('', 85);
      logInfo(`getTemperature(formId="", count=85): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0036
     * @tc.name      FormExtAbility_GetTemperature_0036
     * @tc.desc      getTemperature(formId="", count=90) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0036 begin`);
      const actual: number = getTemperature('', 90);
      logInfo(`getTemperature(formId="", count=90): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0037
     * @tc.name      FormExtAbility_GetTemperature_0037
     * @tc.desc      getTemperature(formId="", count=95) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0037 begin`);
      const actual: number = getTemperature('', 95);
      logInfo(`getTemperature(formId="", count=95): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0038
     * @tc.name      FormExtAbility_GetTemperature_0038
     * @tc.desc      getTemperature(formId="", count=69) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0038 begin`);
      const actual: number = getTemperature('', 69);
      logInfo(`getTemperature(formId="", count=69): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0039
     * @tc.name      FormExtAbility_GetTemperature_0039
     * @tc.desc      getTemperature(formId="", count=186) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0039 begin`);
      const actual: number = getTemperature('', 186);
      logInfo(`getTemperature(formId="", count=186): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0040
     * @tc.name      FormExtAbility_GetTemperature_0040
     * @tc.desc      getTemperature(formId="", count=26.63) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0040 begin`);
      const actual: number = getTemperature('', 26.63);
      logInfo(`getTemperature(formId="", count=26.63): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0041
     * @tc.name      FormExtAbility_GetTemperature_0041
     * @tc.desc      getTemperature(formId="a", count=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0041 begin`);
      const actual: number = getTemperature('a', 0);
      logInfo(`getTemperature(formId="a", count=0): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0042
     * @tc.name      FormExtAbility_GetTemperature_0042
     * @tc.desc      getTemperature(formId="a", count=1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0042 begin`);
      const actual: number = getTemperature('a', 1);
      logInfo(`getTemperature(formId="a", count=1): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0043
     * @tc.name      FormExtAbility_GetTemperature_0043
     * @tc.desc      getTemperature(formId="a", count=10) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0043 begin`);
      const actual: number = getTemperature('a', 10);
      logInfo(`getTemperature(formId="a", count=10): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0044
     * @tc.name      FormExtAbility_GetTemperature_0044
     * @tc.desc      getTemperature(formId="a", count=9) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0044 begin`);
      const actual: number = getTemperature('a', 9);
      logInfo(`getTemperature(formId="a", count=9): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0045
     * @tc.name      FormExtAbility_GetTemperature_0045
     * @tc.desc      getTemperature(formId="a", count=11) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0045 begin`);
      const actual: number = getTemperature('a', 11);
      logInfo(`getTemperature(formId="a", count=11): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0046
     * @tc.name      FormExtAbility_GetTemperature_0046
     * @tc.desc      getTemperature(formId="a", count=20) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0046 begin`);
      const actual: number = getTemperature('a', 20);
      logInfo(`getTemperature(formId="a", count=20): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0047
     * @tc.name      FormExtAbility_GetTemperature_0047
     * @tc.desc      getTemperature(formId="a", count=5) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0047 begin`);
      const actual: number = getTemperature('a', 5);
      logInfo(`getTemperature(formId="a", count=5): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0048
     * @tc.name      FormExtAbility_GetTemperature_0048
     * @tc.desc      getTemperature(formId="a", count=2) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0048 begin`);
      const actual: number = getTemperature('a', 2);
      logInfo(`getTemperature(formId="a", count=2): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0049
     * @tc.name      FormExtAbility_GetTemperature_0049
     * @tc.desc      getTemperature(formId="a", count=3) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0049 begin`);
      const actual: number = getTemperature('a', 3);
      logInfo(`getTemperature(formId="a", count=3): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0050
     * @tc.name      FormExtAbility_GetTemperature_0050
     * @tc.desc      getTemperature(formId="a", count=100) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0050 begin`);
      const actual: number = getTemperature('a', 100);
      logInfo(`getTemperature(formId="a", count=100): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0051
     * @tc.name      FormExtAbility_GetTemperature_0051
     * @tc.desc      getTemperature(formId="a", count=-1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0051 begin`);
      const actual: number = getTemperature('a', -1);
      logInfo(`getTemperature(formId="a", count=-1): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0052
     * @tc.name      FormExtAbility_GetTemperature_0052
     * @tc.desc      getTemperature(formId="a", count=15) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0052 begin`);
      const actual: number = getTemperature('a', 15);
      logInfo(`getTemperature(formId="a", count=15): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0053
     * @tc.name      FormExtAbility_GetTemperature_0053
     * @tc.desc      getTemperature(formId="a", count=25) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0053 begin`);
      const actual: number = getTemperature('a', 25);
      logInfo(`getTemperature(formId="a", count=25): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0053 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0054
     * @tc.name      FormExtAbility_GetTemperature_0054
     * @tc.desc      getTemperature(formId="a", count=30) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0054 begin`);
      const actual: number = getTemperature('a', 30);
      logInfo(`getTemperature(formId="a", count=30): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0055
     * @tc.name      FormExtAbility_GetTemperature_0055
     * @tc.desc      getTemperature(formId="a", count=35) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0055 begin`);
      const actual: number = getTemperature('a', 35);
      logInfo(`getTemperature(formId="a", count=35): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0056
     * @tc.name      FormExtAbility_GetTemperature_0056
     * @tc.desc      getTemperature(formId="a", count=40) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0056 begin`);
      const actual: number = getTemperature('a', 40);
      logInfo(`getTemperature(formId="a", count=40): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0057
     * @tc.name      FormExtAbility_GetTemperature_0057
     * @tc.desc      getTemperature(formId="a", count=45) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0057 begin`);
      const actual: number = getTemperature('a', 45);
      logInfo(`getTemperature(formId="a", count=45): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0058
     * @tc.name      FormExtAbility_GetTemperature_0058
     * @tc.desc      getTemperature(formId="a", count=50) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0058 begin`);
      const actual: number = getTemperature('a', 50);
      logInfo(`getTemperature(formId="a", count=50): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0059
     * @tc.name      FormExtAbility_GetTemperature_0059
     * @tc.desc      getTemperature(formId="a", count=55) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0059 begin`);
      const actual: number = getTemperature('a', 55);
      logInfo(`getTemperature(formId="a", count=55): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0060
     * @tc.name      FormExtAbility_GetTemperature_0060
     * @tc.desc      getTemperature(formId="a", count=60) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0060 begin`);
      const actual: number = getTemperature('a', 60);
      logInfo(`getTemperature(formId="a", count=60): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0061
     * @tc.name      FormExtAbility_GetTemperature_0061
     * @tc.desc      getTemperature(formId="a", count=65) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0061 begin`);
      const actual: number = getTemperature('a', 65);
      logInfo(`getTemperature(formId="a", count=65): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0062
     * @tc.name      FormExtAbility_GetTemperature_0062
     * @tc.desc      getTemperature(formId="a", count=70) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0062 begin`);
      const actual: number = getTemperature('a', 70);
      logInfo(`getTemperature(formId="a", count=70): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0063
     * @tc.name      FormExtAbility_GetTemperature_0063
     * @tc.desc      getTemperature(formId="a", count=75) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0063 begin`);
      const actual: number = getTemperature('a', 75);
      logInfo(`getTemperature(formId="a", count=75): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0064
     * @tc.name      FormExtAbility_GetTemperature_0064
     * @tc.desc      getTemperature(formId="a", count=80) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0064 begin`);
      const actual: number = getTemperature('a', 80);
      logInfo(`getTemperature(formId="a", count=80): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0065
     * @tc.name      FormExtAbility_GetTemperature_0065
     * @tc.desc      getTemperature(formId="a", count=85) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0065 begin`);
      const actual: number = getTemperature('a', 85);
      logInfo(`getTemperature(formId="a", count=85): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0066
     * @tc.name      FormExtAbility_GetTemperature_0066
     * @tc.desc      getTemperature(formId="a", count=90) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0066 begin`);
      const actual: number = getTemperature('a', 90);
      logInfo(`getTemperature(formId="a", count=90): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0067
     * @tc.name      FormExtAbility_GetTemperature_0067
     * @tc.desc      getTemperature(formId="a", count=95) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0067 begin`);
      const actual: number = getTemperature('a', 95);
      logInfo(`getTemperature(formId="a", count=95): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0068
     * @tc.name      FormExtAbility_GetTemperature_0068
     * @tc.desc      getTemperature(formId="a", count=69) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0068 begin`);
      const actual: number = getTemperature('a', 69);
      logInfo(`getTemperature(formId="a", count=69): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0069
     * @tc.name      FormExtAbility_GetTemperature_0069
     * @tc.desc      getTemperature(formId="a", count=186) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0069 begin`);
      const actual: number = getTemperature('a', 186);
      logInfo(`getTemperature(formId="a", count=186): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0070
     * @tc.name      FormExtAbility_GetTemperature_0070
     * @tc.desc      getTemperature(formId="a", count=26.63) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0070 begin`);
      const actual: number = getTemperature('a', 26.63);
      logInfo(`getTemperature(formId="a", count=26.63): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0071
     * @tc.name      FormExtAbility_GetTemperature_0071
     * @tc.desc      getTemperature(formId="abc", count=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0071 begin`);
      const actual: number = getTemperature('abc', 0);
      logInfo(`getTemperature(formId="abc", count=0): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0072
     * @tc.name      FormExtAbility_GetTemperature_0072
     * @tc.desc      getTemperature(formId="abc", count=1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0072 begin`);
      const actual: number = getTemperature('abc', 1);
      logInfo(`getTemperature(formId="abc", count=1): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0073
     * @tc.name      FormExtAbility_GetTemperature_0073
     * @tc.desc      getTemperature(formId="abc", count=10) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0073 begin`);
      const actual: number = getTemperature('abc', 10);
      logInfo(`getTemperature(formId="abc", count=10): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0074
     * @tc.name      FormExtAbility_GetTemperature_0074
     * @tc.desc      getTemperature(formId="abc", count=9) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0074 begin`);
      const actual: number = getTemperature('abc', 9);
      logInfo(`getTemperature(formId="abc", count=9): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0075
     * @tc.name      FormExtAbility_GetTemperature_0075
     * @tc.desc      getTemperature(formId="abc", count=11) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0075 begin`);
      const actual: number = getTemperature('abc', 11);
      logInfo(`getTemperature(formId="abc", count=11): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0076
     * @tc.name      FormExtAbility_GetTemperature_0076
     * @tc.desc      getTemperature(formId="abc", count=20) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0076 begin`);
      const actual: number = getTemperature('abc', 20);
      logInfo(`getTemperature(formId="abc", count=20): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0077
     * @tc.name      FormExtAbility_GetTemperature_0077
     * @tc.desc      getTemperature(formId="abc", count=5) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0077 begin`);
      const actual: number = getTemperature('abc', 5);
      logInfo(`getTemperature(formId="abc", count=5): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0077 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0078
     * @tc.name      FormExtAbility_GetTemperature_0078
     * @tc.desc      getTemperature(formId="abc", count=2) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0078 begin`);
      const actual: number = getTemperature('abc', 2);
      logInfo(`getTemperature(formId="abc", count=2): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0079
     * @tc.name      FormExtAbility_GetTemperature_0079
     * @tc.desc      getTemperature(formId="abc", count=3) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0079 begin`);
      const actual: number = getTemperature('abc', 3);
      logInfo(`getTemperature(formId="abc", count=3): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0080
     * @tc.name      FormExtAbility_GetTemperature_0080
     * @tc.desc      getTemperature(formId="abc", count=100) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0080 begin`);
      const actual: number = getTemperature('abc', 100);
      logInfo(`getTemperature(formId="abc", count=100): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0081
     * @tc.name      FormExtAbility_GetTemperature_0081
     * @tc.desc      getTemperature(formId="abc", count=-1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0081 begin`);
      const actual: number = getTemperature('abc', -1);
      logInfo(`getTemperature(formId="abc", count=-1): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0082
     * @tc.name      FormExtAbility_GetTemperature_0082
     * @tc.desc      getTemperature(formId="abc", count=15) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0082 begin`);
      const actual: number = getTemperature('abc', 15);
      logInfo(`getTemperature(formId="abc", count=15): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0083
     * @tc.name      FormExtAbility_GetTemperature_0083
     * @tc.desc      getTemperature(formId="abc", count=25) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0083 begin`);
      const actual: number = getTemperature('abc', 25);
      logInfo(`getTemperature(formId="abc", count=25): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0084
     * @tc.name      FormExtAbility_GetTemperature_0084
     * @tc.desc      getTemperature(formId="abc", count=30) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0084 begin`);
      const actual: number = getTemperature('abc', 30);
      logInfo(`getTemperature(formId="abc", count=30): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0085
     * @tc.name      FormExtAbility_GetTemperature_0085
     * @tc.desc      getTemperature(formId="abc", count=35) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0085 begin`);
      const actual: number = getTemperature('abc', 35);
      logInfo(`getTemperature(formId="abc", count=35): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0086
     * @tc.name      FormExtAbility_GetTemperature_0086
     * @tc.desc      getTemperature(formId="abc", count=40) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0086 begin`);
      const actual: number = getTemperature('abc', 40);
      logInfo(`getTemperature(formId="abc", count=40): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0087
     * @tc.name      FormExtAbility_GetTemperature_0087
     * @tc.desc      getTemperature(formId="abc", count=45) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0087 begin`);
      const actual: number = getTemperature('abc', 45);
      logInfo(`getTemperature(formId="abc", count=45): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0088
     * @tc.name      FormExtAbility_GetTemperature_0088
     * @tc.desc      getTemperature(formId="abc", count=50) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0088 begin`);
      const actual: number = getTemperature('abc', 50);
      logInfo(`getTemperature(formId="abc", count=50): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0089
     * @tc.name      FormExtAbility_GetTemperature_0089
     * @tc.desc      getTemperature(formId="abc", count=55) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0089 begin`);
      const actual: number = getTemperature('abc', 55);
      logInfo(`getTemperature(formId="abc", count=55): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0090
     * @tc.name      FormExtAbility_GetTemperature_0090
     * @tc.desc      getTemperature(formId="abc", count=60) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0090 begin`);
      const actual: number = getTemperature('abc', 60);
      logInfo(`getTemperature(formId="abc", count=60): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0090 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0091
     * @tc.name      FormExtAbility_GetTemperature_0091
     * @tc.desc      getTemperature(formId="abc", count=65) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0091 begin`);
      const actual: number = getTemperature('abc', 65);
      logInfo(`getTemperature(formId="abc", count=65): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0091 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0092
     * @tc.name      FormExtAbility_GetTemperature_0092
     * @tc.desc      getTemperature(formId="abc", count=70) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0092 begin`);
      const actual: number = getTemperature('abc', 70);
      logInfo(`getTemperature(formId="abc", count=70): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0092 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0093
     * @tc.name      FormExtAbility_GetTemperature_0093
     * @tc.desc      getTemperature(formId="abc", count=75) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0093 begin`);
      const actual: number = getTemperature('abc', 75);
      logInfo(`getTemperature(formId="abc", count=75): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0093 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0094
     * @tc.name      FormExtAbility_GetTemperature_0094
     * @tc.desc      getTemperature(formId="abc", count=80) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0094 begin`);
      const actual: number = getTemperature('abc', 80);
      logInfo(`getTemperature(formId="abc", count=80): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0094 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0095
     * @tc.name      FormExtAbility_GetTemperature_0095
     * @tc.desc      getTemperature(formId="abc", count=85) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0095 begin`);
      const actual: number = getTemperature('abc', 85);
      logInfo(`getTemperature(formId="abc", count=85): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0095 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0096
     * @tc.name      FormExtAbility_GetTemperature_0096
     * @tc.desc      getTemperature(formId="abc", count=90) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0096 begin`);
      const actual: number = getTemperature('abc', 90);
      logInfo(`getTemperature(formId="abc", count=90): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0096 end`);
    });
  });
}
