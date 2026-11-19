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

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for getTemperature (96 cases). */
export default function getTemperature2Test(): void {
  describe('GetTemperature2Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0097
     * @tc.name      FormExtAbility_GetTemperature_0097
     * @tc.desc      getTemperature(formId="abc", count=95) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0097 begin`);
      const actual: number = getTemperature('abc', 95);
      logInfo(`getTemperature(formId="abc", count=95): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0097 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0098
     * @tc.name      FormExtAbility_GetTemperature_0098
     * @tc.desc      getTemperature(formId="abc", count=69) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0098 begin`);
      const actual: number = getTemperature('abc', 69);
      logInfo(`getTemperature(formId="abc", count=69): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0098 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0099
     * @tc.name      FormExtAbility_GetTemperature_0099
     * @tc.desc      getTemperature(formId="abc", count=186) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0099 begin`);
      const actual: number = getTemperature('abc', 186);
      logInfo(`getTemperature(formId="abc", count=186): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0099 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0100
     * @tc.name      FormExtAbility_GetTemperature_0100
     * @tc.desc      getTemperature(formId="abc", count=26.63) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0100 begin`);
      const actual: number = getTemperature('abc', 26.63);
      logInfo(`getTemperature(formId="abc", count=26.63): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0100 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0101
     * @tc.name      FormExtAbility_GetTemperature_0101
     * @tc.desc      getTemperature(formId="Hello World", count=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0101 begin`);
      const actual: number = getTemperature('Hello World', 0);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0101 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0102
     * @tc.name      FormExtAbility_GetTemperature_0102
     * @tc.desc      getTemperature(formId="Hello World", count=1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0102 begin`);
      const actual: number = getTemperature('Hello World', 1);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0102 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0103
     * @tc.name      FormExtAbility_GetTemperature_0103
     * @tc.desc      getTemperature(formId="Hello World", count=10) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0103 begin`);
      const actual: number = getTemperature('Hello World', 10);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0103 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0104
     * @tc.name      FormExtAbility_GetTemperature_0104
     * @tc.desc      getTemperature(formId="Hello World", count=9) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0104 begin`);
      const actual: number = getTemperature('Hello World', 9);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0104 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0105
     * @tc.name      FormExtAbility_GetTemperature_0105
     * @tc.desc      getTemperature(formId="Hello World", count=11) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0105 begin`);
      const actual: number = getTemperature('Hello World', 11);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0105 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0106
     * @tc.name      FormExtAbility_GetTemperature_0106
     * @tc.desc      getTemperature(formId="Hello World", count=20) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0106 begin`);
      const actual: number = getTemperature('Hello World', 20);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0106 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0107
     * @tc.name      FormExtAbility_GetTemperature_0107
     * @tc.desc      getTemperature(formId="Hello World", count=5) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0107 begin`);
      const actual: number = getTemperature('Hello World', 5);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0107 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0108
     * @tc.name      FormExtAbility_GetTemperature_0108
     * @tc.desc      getTemperature(formId="Hello World", count=2) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0108 begin`);
      const actual: number = getTemperature('Hello World', 2);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0108 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0109
     * @tc.name      FormExtAbility_GetTemperature_0109
     * @tc.desc      getTemperature(formId="Hello World", count=3) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0109 begin`);
      const actual: number = getTemperature('Hello World', 3);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0109 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0110
     * @tc.name      FormExtAbility_GetTemperature_0110
     * @tc.desc      getTemperature(formId="Hello World", count=100) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0110 begin`);
      const actual: number = getTemperature('Hello World', 100);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0110 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0111
     * @tc.name      FormExtAbility_GetTemperature_0111
     * @tc.desc      getTemperature(formId="Hello World", count=-1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0111 begin`);
      const actual: number = getTemperature('Hello World', -1);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0111 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0112
     * @tc.name      FormExtAbility_GetTemperature_0112
     * @tc.desc      getTemperature(formId="Hello World", count=15) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0112 begin`);
      const actual: number = getTemperature('Hello World', 15);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0112 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0113
     * @tc.name      FormExtAbility_GetTemperature_0113
     * @tc.desc      getTemperature(formId="Hello World", count=25) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0113 begin`);
      const actual: number = getTemperature('Hello World', 25);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0113 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0114
     * @tc.name      FormExtAbility_GetTemperature_0114
     * @tc.desc      getTemperature(formId="Hello World", count=30) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0114 begin`);
      const actual: number = getTemperature('Hello World', 30);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0114 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0115
     * @tc.name      FormExtAbility_GetTemperature_0115
     * @tc.desc      getTemperature(formId="Hello World", count=35) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0115 begin`);
      const actual: number = getTemperature('Hello World', 35);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0115 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0116
     * @tc.name      FormExtAbility_GetTemperature_0116
     * @tc.desc      getTemperature(formId="Hello World", count=40) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0116 begin`);
      const actual: number = getTemperature('Hello World', 40);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0116 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0117
     * @tc.name      FormExtAbility_GetTemperature_0117
     * @tc.desc      getTemperature(formId="Hello World", count=45) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0117 begin`);
      const actual: number = getTemperature('Hello World', 45);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0117 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0118
     * @tc.name      FormExtAbility_GetTemperature_0118
     * @tc.desc      getTemperature(formId="Hello World", count=50) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0118 begin`);
      const actual: number = getTemperature('Hello World', 50);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0118 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0119
     * @tc.name      FormExtAbility_GetTemperature_0119
     * @tc.desc      getTemperature(formId="Hello World", count=55) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0119 begin`);
      const actual: number = getTemperature('Hello World', 55);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0119 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0120
     * @tc.name      FormExtAbility_GetTemperature_0120
     * @tc.desc      getTemperature(formId="Hello World", count=60) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0120 begin`);
      const actual: number = getTemperature('Hello World', 60);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0120 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0121
     * @tc.name      FormExtAbility_GetTemperature_0121
     * @tc.desc      getTemperature(formId="Hello World", count=65) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0121 begin`);
      const actual: number = getTemperature('Hello World', 65);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0121 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0122
     * @tc.name      FormExtAbility_GetTemperature_0122
     * @tc.desc      getTemperature(formId="Hello World", count=70) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0122 begin`);
      const actual: number = getTemperature('Hello World', 70);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0122 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0123
     * @tc.name      FormExtAbility_GetTemperature_0123
     * @tc.desc      getTemperature(formId="Hello World", count=75) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0123 begin`);
      const actual: number = getTemperature('Hello World', 75);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0123 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0124
     * @tc.name      FormExtAbility_GetTemperature_0124
     * @tc.desc      getTemperature(formId="Hello World", count=80) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0124 begin`);
      const actual: number = getTemperature('Hello World', 80);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0124 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0125
     * @tc.name      FormExtAbility_GetTemperature_0125
     * @tc.desc      getTemperature(formId="Hello World", count=85) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0125 begin`);
      const actual: number = getTemperature('Hello World', 85);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0125 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0126
     * @tc.name      FormExtAbility_GetTemperature_0126
     * @tc.desc      getTemperature(formId="Hello World", count=90) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0126 begin`);
      const actual: number = getTemperature('Hello World', 90);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0126 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0127
     * @tc.name      FormExtAbility_GetTemperature_0127
     * @tc.desc      getTemperature(formId="Hello World", count=95) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0127 begin`);
      const actual: number = getTemperature('Hello World', 95);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0127 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0128
     * @tc.name      FormExtAbility_GetTemperature_0128
     * @tc.desc      getTemperature(formId="Hello World", count=69) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0128 begin`);
      const actual: number = getTemperature('Hello World', 69);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0128 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0129
     * @tc.name      FormExtAbility_GetTemperature_0129
     * @tc.desc      getTemperature(formId="Hello World", count=186) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0129 begin`);
      const actual: number = getTemperature('Hello World', 186);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0129 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0130
     * @tc.name      FormExtAbility_GetTemperature_0130
     * @tc.desc      getTemperature(formId="Hello World", count=26.63) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0130 begin`);
      const actual: number = getTemperature('Hello World', 26.63);
      logInfo(`getTemperature(formId="Hello World", coun...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0130 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0131
     * @tc.name      FormExtAbility_GetTemperature_0131
     * @tc.desc      getTemperature(formId=" ", count=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0131 begin`);
      const actual: number = getTemperature(' ', 0);
      logInfo(`getTemperature(formId=" ", count=0): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0131 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0132
     * @tc.name      FormExtAbility_GetTemperature_0132
     * @tc.desc      getTemperature(formId=" ", count=1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0132 begin`);
      const actual: number = getTemperature(' ', 1);
      logInfo(`getTemperature(formId=" ", count=1): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0132 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0133
     * @tc.name      FormExtAbility_GetTemperature_0133
     * @tc.desc      getTemperature(formId=" ", count=10) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0133 begin`);
      const actual: number = getTemperature(' ', 10);
      logInfo(`getTemperature(formId=" ", count=10): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0133 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0134
     * @tc.name      FormExtAbility_GetTemperature_0134
     * @tc.desc      getTemperature(formId=" ", count=9) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0134 begin`);
      const actual: number = getTemperature(' ', 9);
      logInfo(`getTemperature(formId=" ", count=9): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0134 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0135
     * @tc.name      FormExtAbility_GetTemperature_0135
     * @tc.desc      getTemperature(formId=" ", count=11) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0135 begin`);
      const actual: number = getTemperature(' ', 11);
      logInfo(`getTemperature(formId=" ", count=11): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0135 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0136
     * @tc.name      FormExtAbility_GetTemperature_0136
     * @tc.desc      getTemperature(formId=" ", count=20) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0136 begin`);
      const actual: number = getTemperature(' ', 20);
      logInfo(`getTemperature(formId=" ", count=20): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0136 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0137
     * @tc.name      FormExtAbility_GetTemperature_0137
     * @tc.desc      getTemperature(formId=" ", count=5) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0137 begin`);
      const actual: number = getTemperature(' ', 5);
      logInfo(`getTemperature(formId=" ", count=5): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0137 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0138
     * @tc.name      FormExtAbility_GetTemperature_0138
     * @tc.desc      getTemperature(formId=" ", count=2) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0138 begin`);
      const actual: number = getTemperature(' ', 2);
      logInfo(`getTemperature(formId=" ", count=2): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0138 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0139
     * @tc.name      FormExtAbility_GetTemperature_0139
     * @tc.desc      getTemperature(formId=" ", count=3) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0139 begin`);
      const actual: number = getTemperature(' ', 3);
      logInfo(`getTemperature(formId=" ", count=3): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0139 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0140
     * @tc.name      FormExtAbility_GetTemperature_0140
     * @tc.desc      getTemperature(formId=" ", count=100) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0140 begin`);
      const actual: number = getTemperature(' ', 100);
      logInfo(`getTemperature(formId=" ", count=100): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0140 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0141
     * @tc.name      FormExtAbility_GetTemperature_0141
     * @tc.desc      getTemperature(formId=" ", count=-1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0141 begin`);
      const actual: number = getTemperature(' ', -1);
      logInfo(`getTemperature(formId=" ", count=-1): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0141 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0142
     * @tc.name      FormExtAbility_GetTemperature_0142
     * @tc.desc      getTemperature(formId=" ", count=15) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0142 begin`);
      const actual: number = getTemperature(' ', 15);
      logInfo(`getTemperature(formId=" ", count=15): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0142 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0143
     * @tc.name      FormExtAbility_GetTemperature_0143
     * @tc.desc      getTemperature(formId=" ", count=25) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0143 begin`);
      const actual: number = getTemperature(' ', 25);
      logInfo(`getTemperature(formId=" ", count=25): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0143 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0144
     * @tc.name      FormExtAbility_GetTemperature_0144
     * @tc.desc      getTemperature(formId=" ", count=30) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0144 begin`);
      const actual: number = getTemperature(' ', 30);
      logInfo(`getTemperature(formId=" ", count=30): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0144 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0145
     * @tc.name      FormExtAbility_GetTemperature_0145
     * @tc.desc      getTemperature(formId=" ", count=35) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0145 begin`);
      const actual: number = getTemperature(' ', 35);
      logInfo(`getTemperature(formId=" ", count=35): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0145 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0146
     * @tc.name      FormExtAbility_GetTemperature_0146
     * @tc.desc      getTemperature(formId=" ", count=40) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0146 begin`);
      const actual: number = getTemperature(' ', 40);
      logInfo(`getTemperature(formId=" ", count=40): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0146 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0147
     * @tc.name      FormExtAbility_GetTemperature_0147
     * @tc.desc      getTemperature(formId=" ", count=45) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0147 begin`);
      const actual: number = getTemperature(' ', 45);
      logInfo(`getTemperature(formId=" ", count=45): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0147 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0148
     * @tc.name      FormExtAbility_GetTemperature_0148
     * @tc.desc      getTemperature(formId=" ", count=50) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0148 begin`);
      const actual: number = getTemperature(' ', 50);
      logInfo(`getTemperature(formId=" ", count=50): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0148 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0149
     * @tc.name      FormExtAbility_GetTemperature_0149
     * @tc.desc      getTemperature(formId=" ", count=55) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0149 begin`);
      const actual: number = getTemperature(' ', 55);
      logInfo(`getTemperature(formId=" ", count=55): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0149 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0150
     * @tc.name      FormExtAbility_GetTemperature_0150
     * @tc.desc      getTemperature(formId=" ", count=60) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0150 begin`);
      const actual: number = getTemperature(' ', 60);
      logInfo(`getTemperature(formId=" ", count=60): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0150 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0151
     * @tc.name      FormExtAbility_GetTemperature_0151
     * @tc.desc      getTemperature(formId=" ", count=65) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0151 begin`);
      const actual: number = getTemperature(' ', 65);
      logInfo(`getTemperature(formId=" ", count=65): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0151 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0152
     * @tc.name      FormExtAbility_GetTemperature_0152
     * @tc.desc      getTemperature(formId=" ", count=70) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0152 begin`);
      const actual: number = getTemperature(' ', 70);
      logInfo(`getTemperature(formId=" ", count=70): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0152 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0153
     * @tc.name      FormExtAbility_GetTemperature_0153
     * @tc.desc      getTemperature(formId=" ", count=75) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0153 begin`);
      const actual: number = getTemperature(' ', 75);
      logInfo(`getTemperature(formId=" ", count=75): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0153 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0154
     * @tc.name      FormExtAbility_GetTemperature_0154
     * @tc.desc      getTemperature(formId=" ", count=80) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0154 begin`);
      const actual: number = getTemperature(' ', 80);
      logInfo(`getTemperature(formId=" ", count=80): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0154 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0155
     * @tc.name      FormExtAbility_GetTemperature_0155
     * @tc.desc      getTemperature(formId=" ", count=85) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0155 begin`);
      const actual: number = getTemperature(' ', 85);
      logInfo(`getTemperature(formId=" ", count=85): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0155 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0156
     * @tc.name      FormExtAbility_GetTemperature_0156
     * @tc.desc      getTemperature(formId=" ", count=90) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0156 begin`);
      const actual: number = getTemperature(' ', 90);
      logInfo(`getTemperature(formId=" ", count=90): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0156 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0157
     * @tc.name      FormExtAbility_GetTemperature_0157
     * @tc.desc      getTemperature(formId=" ", count=95) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0157 begin`);
      const actual: number = getTemperature(' ', 95);
      logInfo(`getTemperature(formId=" ", count=95): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0157 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0158
     * @tc.name      FormExtAbility_GetTemperature_0158
     * @tc.desc      getTemperature(formId=" ", count=69) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0158 begin`);
      const actual: number = getTemperature(' ', 69);
      logInfo(`getTemperature(formId=" ", count=69): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0158 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0159
     * @tc.name      FormExtAbility_GetTemperature_0159
     * @tc.desc      getTemperature(formId=" ", count=186) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0159 begin`);
      const actual: number = getTemperature(' ', 186);
      logInfo(`getTemperature(formId=" ", count=186): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0159 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0160
     * @tc.name      FormExtAbility_GetTemperature_0160
     * @tc.desc      getTemperature(formId=" ", count=26.63) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0160 begin`);
      const actual: number = getTemperature(' ', 26.63);
      logInfo(`getTemperature(formId=" ", count=26.63): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0160 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0161
     * @tc.name      FormExtAbility_GetTemperature_0161
     * @tc.desc      getTemperature(formId="123", count=11) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_GetTemperature_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0161 begin`);
      const actual: number = getTemperature('123', 11);
      logInfo(`getTemperature(formId="123", count=11): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}GetTemperature_0161 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0162
     * @tc.name      FormExtAbility_GetTemperature_0162
     * @tc.desc      getTemperature(formId="123", count=20) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0162 begin`);
      const actual: number = getTemperature('123', 20);
      logInfo(`getTemperature(formId="123", count=20): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}GetTemperature_0162 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0163
     * @tc.name      FormExtAbility_GetTemperature_0163
     * @tc.desc      getTemperature(formId="123", count=100) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0163 begin`);
      const actual: number = getTemperature('123', 100);
      logInfo(`getTemperature(formId="123", count=100): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}GetTemperature_0163 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0164
     * @tc.name      FormExtAbility_GetTemperature_0164
     * @tc.desc      getTemperature(formId="123", count=15) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0164 begin`);
      const actual: number = getTemperature('123', 15);
      logInfo(`getTemperature(formId="123", count=15): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GetTemperature_0164 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0165
     * @tc.name      FormExtAbility_GetTemperature_0165
     * @tc.desc      getTemperature(formId="123", count=25) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0165 begin`);
      const actual: number = getTemperature('123', 25);
      logInfo(`getTemperature(formId="123", count=25): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GetTemperature_0165 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0166
     * @tc.name      FormExtAbility_GetTemperature_0166
     * @tc.desc      getTemperature(formId="123", count=30) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0166 begin`);
      const actual: number = getTemperature('123', 30);
      logInfo(`getTemperature(formId="123", count=30): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}GetTemperature_0166 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0167
     * @tc.name      FormExtAbility_GetTemperature_0167
     * @tc.desc      getTemperature(formId="123", count=35) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0167 begin`);
      const actual: number = getTemperature('123', 35);
      logInfo(`getTemperature(formId="123", count=35): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GetTemperature_0167 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0168
     * @tc.name      FormExtAbility_GetTemperature_0168
     * @tc.desc      getTemperature(formId="123", count=40) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0168 begin`);
      const actual: number = getTemperature('123', 40);
      logInfo(`getTemperature(formId="123", count=40): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}GetTemperature_0168 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0169
     * @tc.name      FormExtAbility_GetTemperature_0169
     * @tc.desc      getTemperature(formId="123", count=45) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0169 begin`);
      const actual: number = getTemperature('123', 45);
      logInfo(`getTemperature(formId="123", count=45): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GetTemperature_0169 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0170
     * @tc.name      FormExtAbility_GetTemperature_0170
     * @tc.desc      getTemperature(formId="123", count=50) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0170 begin`);
      const actual: number = getTemperature('123', 50);
      logInfo(`getTemperature(formId="123", count=50): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}GetTemperature_0170 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0171
     * @tc.name      FormExtAbility_GetTemperature_0171
     * @tc.desc      getTemperature(formId="123", count=55) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0171 begin`);
      const actual: number = getTemperature('123', 55);
      logInfo(`getTemperature(formId="123", count=55): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GetTemperature_0171 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0172
     * @tc.name      FormExtAbility_GetTemperature_0172
     * @tc.desc      getTemperature(formId="123", count=60) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0172 begin`);
      const actual: number = getTemperature('123', 60);
      logInfo(`getTemperature(formId="123", count=60): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}GetTemperature_0172 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0173
     * @tc.name      FormExtAbility_GetTemperature_0173
     * @tc.desc      getTemperature(formId="123", count=65) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0173 begin`);
      const actual: number = getTemperature('123', 65);
      logInfo(`getTemperature(formId="123", count=65): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GetTemperature_0173 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0174
     * @tc.name      FormExtAbility_GetTemperature_0174
     * @tc.desc      getTemperature(formId="123", count=70) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0174 begin`);
      const actual: number = getTemperature('123', 70);
      logInfo(`getTemperature(formId="123", count=70): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}GetTemperature_0174 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0175
     * @tc.name      FormExtAbility_GetTemperature_0175
     * @tc.desc      getTemperature(formId="123", count=75) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0175 begin`);
      const actual: number = getTemperature('123', 75);
      logInfo(`getTemperature(formId="123", count=75): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GetTemperature_0175 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0176
     * @tc.name      FormExtAbility_GetTemperature_0176
     * @tc.desc      getTemperature(formId="123", count=80) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0176 begin`);
      const actual: number = getTemperature('123', 80);
      logInfo(`getTemperature(formId="123", count=80): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}GetTemperature_0176 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0177
     * @tc.name      FormExtAbility_GetTemperature_0177
     * @tc.desc      getTemperature(formId="123", count=85) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0177 begin`);
      const actual: number = getTemperature('123', 85);
      logInfo(`getTemperature(formId="123", count=85): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GetTemperature_0177 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0178
     * @tc.name      FormExtAbility_GetTemperature_0178
     * @tc.desc      getTemperature(formId="123", count=90) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0178 begin`);
      const actual: number = getTemperature('123', 90);
      logInfo(`getTemperature(formId="123", count=90): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}GetTemperature_0178 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0179
     * @tc.name      FormExtAbility_GetTemperature_0179
     * @tc.desc      getTemperature(formId="123", count=95) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0179 begin`);
      const actual: number = getTemperature('123', 95);
      logInfo(`getTemperature(formId="123", count=95): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GetTemperature_0179 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0180
     * @tc.name      FormExtAbility_GetTemperature_0180
     * @tc.desc      getTemperature(formId="123", count=69) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_GetTemperature_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0180 begin`);
      const actual: number = getTemperature('123', 69);
      logInfo(`getTemperature(formId="123", count=69): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}GetTemperature_0180 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0181
     * @tc.name      FormExtAbility_GetTemperature_0181
     * @tc.desc      getTemperature(formId=" a ", count=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0181 begin`);
      const actual: number = getTemperature(' a ', 0);
      logInfo(`getTemperature(formId=" a ", count=0): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0181 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0182
     * @tc.name      FormExtAbility_GetTemperature_0182
     * @tc.desc      getTemperature(formId=" a ", count=1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0182 begin`);
      const actual: number = getTemperature(' a ', 1);
      logInfo(`getTemperature(formId=" a ", count=1): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0182 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0183
     * @tc.name      FormExtAbility_GetTemperature_0183
     * @tc.desc      getTemperature(formId=" a ", count=10) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0183 begin`);
      const actual: number = getTemperature(' a ', 10);
      logInfo(`getTemperature(formId=" a ", count=10): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0183 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0184
     * @tc.name      FormExtAbility_GetTemperature_0184
     * @tc.desc      getTemperature(formId=" a ", count=9) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0184 begin`);
      const actual: number = getTemperature(' a ', 9);
      logInfo(`getTemperature(formId=" a ", count=9): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0184 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0185
     * @tc.name      FormExtAbility_GetTemperature_0185
     * @tc.desc      getTemperature(formId=" a ", count=11) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0185 begin`);
      const actual: number = getTemperature(' a ', 11);
      logInfo(`getTemperature(formId=" a ", count=11): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0185 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0186
     * @tc.name      FormExtAbility_GetTemperature_0186
     * @tc.desc      getTemperature(formId=" a ", count=20) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0186 begin`);
      const actual: number = getTemperature(' a ', 20);
      logInfo(`getTemperature(formId=" a ", count=20): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0186 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0187
     * @tc.name      FormExtAbility_GetTemperature_0187
     * @tc.desc      getTemperature(formId=" a ", count=5) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0187 begin`);
      const actual: number = getTemperature(' a ', 5);
      logInfo(`getTemperature(formId=" a ", count=5): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0187 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0188
     * @tc.name      FormExtAbility_GetTemperature_0188
     * @tc.desc      getTemperature(formId=" a ", count=2) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0188 begin`);
      const actual: number = getTemperature(' a ', 2);
      logInfo(`getTemperature(formId=" a ", count=2): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0188 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0189
     * @tc.name      FormExtAbility_GetTemperature_0189
     * @tc.desc      getTemperature(formId=" a ", count=3) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0189 begin`);
      const actual: number = getTemperature(' a ', 3);
      logInfo(`getTemperature(formId=" a ", count=3): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0189 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0190
     * @tc.name      FormExtAbility_GetTemperature_0190
     * @tc.desc      getTemperature(formId=" a ", count=100) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0190 begin`);
      const actual: number = getTemperature(' a ', 100);
      logInfo(`getTemperature(formId=" a ", count=100): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0190 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0191
     * @tc.name      FormExtAbility_GetTemperature_0191
     * @tc.desc      getTemperature(formId=" a ", count=-1) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0191 begin`);
      const actual: number = getTemperature(' a ', -1);
      logInfo(`getTemperature(formId=" a ", count=-1): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0191 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0192
     * @tc.name      FormExtAbility_GetTemperature_0192
     * @tc.desc      getTemperature(formId=" a ", count=15) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0192 begin`);
      const actual: number = getTemperature(' a ', 15);
      logInfo(`getTemperature(formId=" a ", count=15): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0192 end`);
    });
  });
}
