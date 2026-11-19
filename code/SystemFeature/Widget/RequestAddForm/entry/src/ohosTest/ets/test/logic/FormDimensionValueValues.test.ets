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
import { FormDimensionValue } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for FormDimensionValue (4 cases). */
export default function formDimensionValueValuesTest(): void {
  describe('FormDimensionValueValuesTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_DIMENSION_VALUE_VALUES_0001
     * @tc.name      RequestAddForm_FormDimensionValueValues_0001
     * @tc.desc      FormDimensionValue.DIMENSION_1_2 keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_FormDimensionValueValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormDimensionValueValues_0001 begin`);
      const actual: number = FormDimensionValue.DIMENSION_1_2;
      logInfo(`FormDimensionValue.DIMENSION_1_2: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FormDimensionValueValues_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_DIMENSION_VALUE_VALUES_0002
     * @tc.name      RequestAddForm_FormDimensionValueValues_0002
     * @tc.desc      FormDimensionValue.DIMENSION_2_2 keeps value 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_FormDimensionValueValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormDimensionValueValues_0002 begin`);
      const actual: number = FormDimensionValue.DIMENSION_2_2;
      logInfo(`FormDimensionValue.DIMENSION_2_2: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FormDimensionValueValues_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_DIMENSION_VALUE_VALUES_0003
     * @tc.name      RequestAddForm_FormDimensionValueValues_0003
     * @tc.desc      FormDimensionValue.DIMENSION_2_4 keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormDimensionValueValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormDimensionValueValues_0003 begin`);
      const actual: number = FormDimensionValue.DIMENSION_2_4;
      logInfo(`FormDimensionValue.DIMENSION_2_4: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FormDimensionValueValues_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_FORM_DIMENSION_VALUE_VALUES_0004
     * @tc.name      RequestAddForm_FormDimensionValueValues_0004
     * @tc.desc      FormDimensionValue.DIMENSION_4_4 keeps value 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_FormDimensionValueValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormDimensionValueValues_0004 begin`);
      const actual: number = FormDimensionValue.DIMENSION_4_4;
      logInfo(`FormDimensionValue.DIMENSION_4_4: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}FormDimensionValueValues_0004 end`);
    });
  });
}
