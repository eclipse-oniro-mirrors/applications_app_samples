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

/** Logic checks for FormStoreModel.countOf (30 cases). */
export default function formStoreModelCountOfTest(): void {
  describe('FormStoreModelCountOfTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0001
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0001
     * @tc.desc      FormStoreModel.countOf(formId="") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0001 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('');
      logInfo(`countOf(formId=""): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0002
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0002
     * @tc.desc      FormStoreModel.countOf(formId="x") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0002 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('x');
      logInfo(`countOf(formId="x"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0003
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0003
     * @tc.desc      FormStoreModel.countOf(formId="a") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0003 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('a');
      logInfo(`countOf(formId="a"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0004
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0004
     * @tc.desc      FormStoreModel.countOf(formId="abc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0004 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('abc');
      logInfo(`countOf(formId="abc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0005
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0005
     * @tc.desc      FormStoreModel.countOf(formId="Hello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0005 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('Hello World');
      logInfo(`countOf(formId="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0006
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0006
     * @tc.desc      FormStoreModel.countOf(formId=" ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0006 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf(' ');
      logInfo(`countOf(formId=" "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0007
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0007
     * @tc.desc      FormStoreModel.countOf(formId="123") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0007 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('123');
      logInfo(`countOf(formId="123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0008
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0008
     * @tc.desc      FormStoreModel.countOf(formId=" x ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCountOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0008 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf(' x ');
      logInfo(`countOf(formId=" x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0009
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0009
     * @tc.desc      FormStoreModel.countOf(formId="xx") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0009 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('xx');
      logInfo(`countOf(formId="xx"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0010
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0010
     * @tc.desc      FormStoreModel.countOf(formId="x_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0010 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('x_1');
      logInfo(`countOf(formId="x_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0011
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0011
     * @tc.desc      FormStoreModel.countOf(formId=" a ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCountOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0011 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf(' a ');
      logInfo(`countOf(formId=" a "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0012
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0012
     * @tc.desc      FormStoreModel.countOf(formId="aa") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0012 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('aa');
      logInfo(`countOf(formId="aa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0013
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0013
     * @tc.desc      FormStoreModel.countOf(formId="a_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0013 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('a_1');
      logInfo(`countOf(formId="a_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0014
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0014
     * @tc.desc      FormStoreModel.countOf(formId="xa") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCountOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0014 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('xa');
      logInfo(`countOf(formId="xa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0015
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0015
     * @tc.desc      FormStoreModel.countOf(formId=" abc ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCountOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0015 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf(' abc ');
      logInfo(`countOf(formId=" abc "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0016
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0016
     * @tc.desc      FormStoreModel.countOf(formId="abcabc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0016 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('abcabc');
      logInfo(`countOf(formId="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0017
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0017
     * @tc.desc      FormStoreModel.countOf(formId="abc_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0017 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('abc_1');
      logInfo(`countOf(formId="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0018
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0018
     * @tc.desc      FormStoreModel.countOf(formId="xabc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCountOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0018 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('xabc');
      logInfo(`countOf(formId="xabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0019
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0019
     * @tc.desc      FormStoreModel.countOf(formId=" Hello World ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCountOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0019 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf(' Hello World ');
      logInfo(`countOf(formId=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0020
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0020
     * @tc.desc      FormStoreModel.countOf(formId="Hello WorldHello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0020 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('Hello WorldHello World');
      logInfo(`countOf(formId="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0021
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0021
     * @tc.desc      FormStoreModel.countOf(formId="Hello World_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0021 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('Hello World_1');
      logInfo(`countOf(formId="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0022
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0022
     * @tc.desc      FormStoreModel.countOf(formId="xHello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCountOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0022 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('xHello World');
      logInfo(`countOf(formId="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0023
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0023
     * @tc.desc      FormStoreModel.countOf(formId="   ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCountOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0023 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('   ');
      logInfo(`countOf(formId="   "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0024
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0024
     * @tc.desc      FormStoreModel.countOf(formId="  ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0024 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('  ');
      logInfo(`countOf(formId="  "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0025
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0025
     * @tc.desc      FormStoreModel.countOf(formId=" _1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0025 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf(' _1');
      logInfo(`countOf(formId=" _1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0026
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0026
     * @tc.desc      FormStoreModel.countOf(formId="x ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCountOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0026 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('x ');
      logInfo(`countOf(formId="x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0027
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0027
     * @tc.desc      FormStoreModel.countOf(formId=" 123 ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCountOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0027 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf(' 123 ');
      logInfo(`countOf(formId=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0028
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0028
     * @tc.desc      FormStoreModel.countOf(formId="123123") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0028 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('123123');
      logInfo(`countOf(formId="123123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0029
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0029
     * @tc.desc      FormStoreModel.countOf(formId="123_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelCountOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0029 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('123_1');
      logInfo(`countOf(formId="123_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_COUNT_OF_0030
     * @tc.name      FormExtAbility_FormStoreModelCountOf_0030
     * @tc.desc      FormStoreModel.countOf(formId="x123") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelCountOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelCountOf_0030 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: number = subject.countOf('x123');
      logInfo(`countOf(formId="x123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelCountOf_0030 end`);
    });
  });
}
