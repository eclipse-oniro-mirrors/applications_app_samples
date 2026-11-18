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

/** Logic checks for FormStoreModel.remove (30 cases). */
export default function formStoreModelRemoveTest(): void {
  describe('FormStoreModelRemoveTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0001
     * @tc.name      FormExtAbility_FormStoreModelRemove_0001
     * @tc.desc      FormStoreModel.remove(formId="") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelRemove_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0001 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('');
      logInfo(`remove(formId=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0002
     * @tc.name      FormExtAbility_FormStoreModelRemove_0002
     * @tc.desc      FormStoreModel.remove(formId="x") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelRemove_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0002 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('x');
      logInfo(`remove(formId="x"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0003
     * @tc.name      FormExtAbility_FormStoreModelRemove_0003
     * @tc.desc      FormStoreModel.remove(formId="a") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0003 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('a');
      logInfo(`remove(formId="a"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0004
     * @tc.name      FormExtAbility_FormStoreModelRemove_0004
     * @tc.desc      FormStoreModel.remove(formId="abc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0004 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('abc');
      logInfo(`remove(formId="abc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0005
     * @tc.name      FormExtAbility_FormStoreModelRemove_0005
     * @tc.desc      FormStoreModel.remove(formId="Hello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0005 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('Hello World');
      logInfo(`remove(formId="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0006
     * @tc.name      FormExtAbility_FormStoreModelRemove_0006
     * @tc.desc      FormStoreModel.remove(formId=" ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0006 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove(' ');
      logInfo(`remove(formId=" "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0007
     * @tc.name      FormExtAbility_FormStoreModelRemove_0007
     * @tc.desc      FormStoreModel.remove(formId="123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0007 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('123');
      logInfo(`remove(formId="123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0008
     * @tc.name      FormExtAbility_FormStoreModelRemove_0008
     * @tc.desc      FormStoreModel.remove(formId=" x ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelRemove_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0008 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove(' x ');
      logInfo(`remove(formId=" x "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0009
     * @tc.name      FormExtAbility_FormStoreModelRemove_0009
     * @tc.desc      FormStoreModel.remove(formId="xx") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0009 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('xx');
      logInfo(`remove(formId="xx"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0010
     * @tc.name      FormExtAbility_FormStoreModelRemove_0010
     * @tc.desc      FormStoreModel.remove(formId="x_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0010 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('x_1');
      logInfo(`remove(formId="x_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0011
     * @tc.name      FormExtAbility_FormStoreModelRemove_0011
     * @tc.desc      FormStoreModel.remove(formId=" a ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelRemove_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0011 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove(' a ');
      logInfo(`remove(formId=" a "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0012
     * @tc.name      FormExtAbility_FormStoreModelRemove_0012
     * @tc.desc      FormStoreModel.remove(formId="aa") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0012 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('aa');
      logInfo(`remove(formId="aa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0013
     * @tc.name      FormExtAbility_FormStoreModelRemove_0013
     * @tc.desc      FormStoreModel.remove(formId="a_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0013 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('a_1');
      logInfo(`remove(formId="a_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0014
     * @tc.name      FormExtAbility_FormStoreModelRemove_0014
     * @tc.desc      FormStoreModel.remove(formId="xa") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelRemove_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0014 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('xa');
      logInfo(`remove(formId="xa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0015
     * @tc.name      FormExtAbility_FormStoreModelRemove_0015
     * @tc.desc      FormStoreModel.remove(formId=" abc ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelRemove_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0015 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove(' abc ');
      logInfo(`remove(formId=" abc "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0016
     * @tc.name      FormExtAbility_FormStoreModelRemove_0016
     * @tc.desc      FormStoreModel.remove(formId="abcabc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0016 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('abcabc');
      logInfo(`remove(formId="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0017
     * @tc.name      FormExtAbility_FormStoreModelRemove_0017
     * @tc.desc      FormStoreModel.remove(formId="abc_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0017 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('abc_1');
      logInfo(`remove(formId="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0018
     * @tc.name      FormExtAbility_FormStoreModelRemove_0018
     * @tc.desc      FormStoreModel.remove(formId="xabc") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelRemove_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0018 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('xabc');
      logInfo(`remove(formId="xabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0019
     * @tc.name      FormExtAbility_FormStoreModelRemove_0019
     * @tc.desc      FormStoreModel.remove(formId=" Hello World ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelRemove_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0019 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove(' Hello World ');
      logInfo(`remove(formId=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0020
     * @tc.name      FormExtAbility_FormStoreModelRemove_0020
     * @tc.desc      FormStoreModel.remove(formId="Hello WorldHello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0020 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('Hello WorldHello World');
      logInfo(`remove(formId="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0021
     * @tc.name      FormExtAbility_FormStoreModelRemove_0021
     * @tc.desc      FormStoreModel.remove(formId="Hello World_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0021 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('Hello World_1');
      logInfo(`remove(formId="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0022
     * @tc.name      FormExtAbility_FormStoreModelRemove_0022
     * @tc.desc      FormStoreModel.remove(formId="xHello World") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelRemove_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0022 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('xHello World');
      logInfo(`remove(formId="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0023
     * @tc.name      FormExtAbility_FormStoreModelRemove_0023
     * @tc.desc      FormStoreModel.remove(formId="   ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelRemove_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0023 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('   ');
      logInfo(`remove(formId="   "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0024
     * @tc.name      FormExtAbility_FormStoreModelRemove_0024
     * @tc.desc      FormStoreModel.remove(formId="  ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0024 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('  ');
      logInfo(`remove(formId="  "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0025
     * @tc.name      FormExtAbility_FormStoreModelRemove_0025
     * @tc.desc      FormStoreModel.remove(formId=" _1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0025 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove(' _1');
      logInfo(`remove(formId=" _1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0026
     * @tc.name      FormExtAbility_FormStoreModelRemove_0026
     * @tc.desc      FormStoreModel.remove(formId="x ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelRemove_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0026 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('x ');
      logInfo(`remove(formId="x "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0027
     * @tc.name      FormExtAbility_FormStoreModelRemove_0027
     * @tc.desc      FormStoreModel.remove(formId=" 123 ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelRemove_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0027 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove(' 123 ');
      logInfo(`remove(formId=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0028
     * @tc.name      FormExtAbility_FormStoreModelRemove_0028
     * @tc.desc      FormStoreModel.remove(formId="123123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0028 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('123123');
      logInfo(`remove(formId="123123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0029
     * @tc.name      FormExtAbility_FormStoreModelRemove_0029
     * @tc.desc      FormStoreModel.remove(formId="123_1") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelRemove_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0029 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('123_1');
      logInfo(`remove(formId="123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_REMOVE_0030
     * @tc.name      FormExtAbility_FormStoreModelRemove_0030
     * @tc.desc      FormStoreModel.remove(formId="x123") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelRemove_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelRemove_0030 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.remove('x123');
      logInfo(`remove(formId="x123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelRemove_0030 end`);
    });
  });
}
