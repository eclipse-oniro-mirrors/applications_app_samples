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
import { FormStoreModel } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for FormStoreModel.castToNormal (30 cases). */
export default function formStoreModelCastToNormalTest(): void {
  describe('FormStoreModelCastToNormalTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0001
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0001
     * @tc.desc      FormStoreModel.castToNormal(formId="") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0001 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('');
      logInfo(`castToNormal(formId=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0002
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0002
     * @tc.desc      FormStoreModel.castToNormal(formId="x") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0002 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('x');
      logInfo(`castToNormal(formId="x"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0003
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0003
     * @tc.desc      FormStoreModel.castToNormal(formId="a") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0003 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('a');
      logInfo(`castToNormal(formId="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0004
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0004
     * @tc.desc      FormStoreModel.castToNormal(formId="abc") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0004 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('abc');
      logInfo(`castToNormal(formId="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0005
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0005
     * @tc.desc      FormStoreModel.castToNormal(formId="Hello World") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0005 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('Hello World');
      logInfo(`castToNormal(formId="Hello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0006
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0006
     * @tc.desc      FormStoreModel.castToNormal(formId=" ") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0006 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal(' ');
      logInfo(`castToNormal(formId=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0007
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0007
     * @tc.desc      FormStoreModel.castToNormal(formId="123") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0007 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('123');
      logInfo(`castToNormal(formId="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0008
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0008
     * @tc.desc      FormStoreModel.castToNormal(formId=" x ") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0008 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal(' x ');
      logInfo(`castToNormal(formId=" x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0009
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0009
     * @tc.desc      FormStoreModel.castToNormal(formId="xx") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0009 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('xx');
      logInfo(`castToNormal(formId="xx"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0010
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0010
     * @tc.desc      FormStoreModel.castToNormal(formId="x_1") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0010 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('x_1');
      logInfo(`castToNormal(formId="x_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0011
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0011
     * @tc.desc      FormStoreModel.castToNormal(formId=" a ") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0011 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal(' a ');
      logInfo(`castToNormal(formId=" a "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0012
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0012
     * @tc.desc      FormStoreModel.castToNormal(formId="aa") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0012 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('aa');
      logInfo(`castToNormal(formId="aa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0013
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0013
     * @tc.desc      FormStoreModel.castToNormal(formId="a_1") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0013 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('a_1');
      logInfo(`castToNormal(formId="a_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0014
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0014
     * @tc.desc      FormStoreModel.castToNormal(formId="xa") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0014 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('xa');
      logInfo(`castToNormal(formId="xa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0015
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0015
     * @tc.desc      FormStoreModel.castToNormal(formId=" abc ") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0015 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal(' abc ');
      logInfo(`castToNormal(formId=" abc "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0016
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0016
     * @tc.desc      FormStoreModel.castToNormal(formId="abcabc") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0016 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('abcabc');
      logInfo(`castToNormal(formId="abcabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0017
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0017
     * @tc.desc      FormStoreModel.castToNormal(formId="abc_1") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0017 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('abc_1');
      logInfo(`castToNormal(formId="abc_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0018
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0018
     * @tc.desc      FormStoreModel.castToNormal(formId="xabc") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0018 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('xabc');
      logInfo(`castToNormal(formId="xabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0019
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0019
     * @tc.desc      FormStoreModel.castToNormal(formId=" Hello World ") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0019 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal(' Hello World ');
      logInfo(`castToNormal(formId=" Hello World "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0020
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0020
     * @tc.desc      FormStoreModel.castToNormal(formId="Hello WorldHello World") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0020 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('Hello WorldHello World');
      logInfo(`castToNormal(formId="Hello WorldHello Wor...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0021
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0021
     * @tc.desc      FormStoreModel.castToNormal(formId="Hello World_1") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0021 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('Hello World_1');
      logInfo(`castToNormal(formId="Hello World_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0022
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0022
     * @tc.desc      FormStoreModel.castToNormal(formId="xHello World") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0022 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('xHello World');
      logInfo(`castToNormal(formId="xHello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0023
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0023
     * @tc.desc      FormStoreModel.castToNormal(formId="   ") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0023 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('   ');
      logInfo(`castToNormal(formId="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0024
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0024
     * @tc.desc      FormStoreModel.castToNormal(formId="  ") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0024 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('  ');
      logInfo(`castToNormal(formId="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0025
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0025
     * @tc.desc      FormStoreModel.castToNormal(formId=" _1") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0025 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal(' _1');
      logInfo(`castToNormal(formId=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0026
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0026
     * @tc.desc      FormStoreModel.castToNormal(formId="x ") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0026 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('x ');
      logInfo(`castToNormal(formId="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0027
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0027
     * @tc.desc      FormStoreModel.castToNormal(formId=" 123 ") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0027 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal(' 123 ');
      logInfo(`castToNormal(formId=" 123 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0028
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0028
     * @tc.desc      FormStoreModel.castToNormal(formId="123123") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0028 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('123123');
      logInfo(`castToNormal(formId="123123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0029
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0029
     * @tc.desc      FormStoreModel.castToNormal(formId="123_1") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0029 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('123_1');
      logInfo(`castToNormal(formId="123_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_CAST_TO_NORMAL_0030
     * @tc.name      FormExtAbility_FormStoreModelCastToNormal_0030
     * @tc.desc      FormStoreModel.castToNormal(formId="x123") yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCastToNormal_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0030 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: boolean = subject.castToNormal('x123');
      logInfo(`castToNormal(formId="x123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelCastToNormal_0030 end`);
    });
  });
}
