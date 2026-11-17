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

/** Logic checks for getTemperature (16 cases). */
export default function getTemperature3Test(): void {
  describe('GetTemperature3Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0193
     * @tc.name      FormExtAbility_GetTemperature_0193
     * @tc.desc      getTemperature(formId=" a ", count=25) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0193 begin`);
      const actual: number = getTemperature(' a ', 25);
      logInfo(`getTemperature(formId=" a ", count=25): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0193 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0194
     * @tc.name      FormExtAbility_GetTemperature_0194
     * @tc.desc      getTemperature(formId=" a ", count=30) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0194 begin`);
      const actual: number = getTemperature(' a ', 30);
      logInfo(`getTemperature(formId=" a ", count=30): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0194 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0195
     * @tc.name      FormExtAbility_GetTemperature_0195
     * @tc.desc      getTemperature(formId=" a ", count=35) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0195 begin`);
      const actual: number = getTemperature(' a ', 35);
      logInfo(`getTemperature(formId=" a ", count=35): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0195 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0196
     * @tc.name      FormExtAbility_GetTemperature_0196
     * @tc.desc      getTemperature(formId=" a ", count=40) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0196 begin`);
      const actual: number = getTemperature(' a ', 40);
      logInfo(`getTemperature(formId=" a ", count=40): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0196 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0197
     * @tc.name      FormExtAbility_GetTemperature_0197
     * @tc.desc      getTemperature(formId=" a ", count=45) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0197 begin`);
      const actual: number = getTemperature(' a ', 45);
      logInfo(`getTemperature(formId=" a ", count=45): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0197 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0198
     * @tc.name      FormExtAbility_GetTemperature_0198
     * @tc.desc      getTemperature(formId=" a ", count=50) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0198 begin`);
      const actual: number = getTemperature(' a ', 50);
      logInfo(`getTemperature(formId=" a ", count=50): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0198 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0199
     * @tc.name      FormExtAbility_GetTemperature_0199
     * @tc.desc      getTemperature(formId=" a ", count=55) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0199 begin`);
      const actual: number = getTemperature(' a ', 55);
      logInfo(`getTemperature(formId=" a ", count=55): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0199 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0200
     * @tc.name      FormExtAbility_GetTemperature_0200
     * @tc.desc      getTemperature(formId=" a ", count=60) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0200 begin`);
      const actual: number = getTemperature(' a ', 60);
      logInfo(`getTemperature(formId=" a ", count=60): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0200 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0201
     * @tc.name      FormExtAbility_GetTemperature_0201
     * @tc.desc      getTemperature(formId=" a ", count=65) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0201 begin`);
      const actual: number = getTemperature(' a ', 65);
      logInfo(`getTemperature(formId=" a ", count=65): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0201 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0202
     * @tc.name      FormExtAbility_GetTemperature_0202
     * @tc.desc      getTemperature(formId=" a ", count=70) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0202 begin`);
      const actual: number = getTemperature(' a ', 70);
      logInfo(`getTemperature(formId=" a ", count=70): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0202 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0203
     * @tc.name      FormExtAbility_GetTemperature_0203
     * @tc.desc      getTemperature(formId=" a ", count=75) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0203 begin`);
      const actual: number = getTemperature(' a ', 75);
      logInfo(`getTemperature(formId=" a ", count=75): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0203 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0204
     * @tc.name      FormExtAbility_GetTemperature_0204
     * @tc.desc      getTemperature(formId=" a ", count=80) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0204 begin`);
      const actual: number = getTemperature(' a ', 80);
      logInfo(`getTemperature(formId=" a ", count=80): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0204 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0205
     * @tc.name      FormExtAbility_GetTemperature_0205
     * @tc.desc      getTemperature(formId=" a ", count=85) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0205 begin`);
      const actual: number = getTemperature(' a ', 85);
      logInfo(`getTemperature(formId=" a ", count=85): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0205 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0206
     * @tc.name      FormExtAbility_GetTemperature_0206
     * @tc.desc      getTemperature(formId=" a ", count=90) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0206 begin`);
      const actual: number = getTemperature(' a ', 90);
      logInfo(`getTemperature(formId=" a ", count=90): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0206 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0207
     * @tc.name      FormExtAbility_GetTemperature_0207
     * @tc.desc      getTemperature(formId=" a ", count=95) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0207 begin`);
      const actual: number = getTemperature(' a ', 95);
      logInfo(`getTemperature(formId=" a ", count=95): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0207 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_GET_TEMPERATURE_0208
     * @tc.name      FormExtAbility_GetTemperature_0208
     * @tc.desc      getTemperature(formId=" a ", count=69) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_GetTemperature_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GetTemperature_0208 begin`);
      const actual: number = getTemperature(' a ', 69);
      logInfo(`getTemperature(formId=" a ", count=69): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}GetTemperature_0208 end`);
    });
  });
}
