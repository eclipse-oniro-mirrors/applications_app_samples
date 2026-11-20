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

/** Logic checks for FormStoreModel.update (53 cases). */
export default function formStoreModelUpdateTest(): void {
  describe('FormStoreModelUpdateTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0001
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0001
     * @tc.desc      FormStoreModel.update(formId="") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelUpdate_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0001 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('');
      logInfo(`update(formId=""): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`update(formId="") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0002
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0002
     * @tc.desc      FormStoreModel.update(formId="x") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelUpdate_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0002 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('x');
      logInfo(`update(formId="x"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="x") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="x") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`update(formId="x") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="x") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="x") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="x") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0003
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0003
     * @tc.desc      FormStoreModel.update(formId="a") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0003 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('a');
      logInfo(`update(formId="a"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="a") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="a") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`update(formId="a") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="a") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="a") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="a") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0004
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0004
     * @tc.desc      FormStoreModel.update(formId="abc") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0004 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('abc');
      logInfo(`update(formId="abc"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="abc") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="abc") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`update(formId="abc") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="abc") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="abc") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="abc") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0005
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0005
     * @tc.desc      FormStoreModel.update(formId="Hello World") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0005 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('Hello World');
      logInfo(`update(formId="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="Hello World") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="Hello World") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`update(formId="Hello World") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="Hello World") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="Hello World") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="Hello World") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0006
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0006
     * @tc.desc      FormStoreModel.update(formId=" ") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0006 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update(' ');
      logInfo(`update(formId=" "): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId=" ") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId=" ") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`update(formId=" ") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId=" ") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId=" ") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId=" ") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0007
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0007
     * @tc.desc      FormStoreModel.update(formId="123") yields "12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0007 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('123');
      logInfo(`update(formId="123"): actual=${actual}`);
      expect(actual).assertEqual('12');
      logInfo(`update(formId="123") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="123") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`update(formId="123") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="123") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="123") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="123") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0008
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0008
     * @tc.desc      FormStoreModel.update(formId=" x ") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelUpdate_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0008 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update(' x ');
      logInfo(`update(formId=" x "): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId=" x ") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId=" x ") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`update(formId=" x ") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId=" x ") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId=" x ") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId=" x ") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0009
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0009
     * @tc.desc      FormStoreModel.update(formId="xx") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0009 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('xx');
      logInfo(`update(formId="xx"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="xx") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="xx") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`update(formId="xx") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="xx") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="xx") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="xx") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0010
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0010
     * @tc.desc      FormStoreModel.update(formId="x_1") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0010 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('x_1');
      logInfo(`update(formId="x_1"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="x_1") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="x_1") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`update(formId="x_1") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="x_1") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="x_1") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="x_1") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0011
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0011
     * @tc.desc      FormStoreModel.update(formId=" a ") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelUpdate_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0011 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update(' a ');
      logInfo(`update(formId=" a "): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId=" a ") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId=" a ") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" a "]');
      logInfo(`update(formId=" a ") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId=" a ") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId=" a ") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId=" a ") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0012
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0012
     * @tc.desc      FormStoreModel.update(formId="aa") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0012 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('aa');
      logInfo(`update(formId="aa"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="aa") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="aa") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["aa"]');
      logInfo(`update(formId="aa") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="aa") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="aa") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="aa") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0013
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0013
     * @tc.desc      FormStoreModel.update(formId="a_1") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0013 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('a_1');
      logInfo(`update(formId="a_1"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="a_1") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="a_1") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1"]');
      logInfo(`update(formId="a_1") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="a_1") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="a_1") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="a_1") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0014
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0014
     * @tc.desc      FormStoreModel.update(formId="xa") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelUpdate_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0014 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('xa');
      logInfo(`update(formId="xa"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="xa") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="xa") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xa"]');
      logInfo(`update(formId="xa") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="xa") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="xa") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="xa") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0015
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0015
     * @tc.desc      FormStoreModel.update(formId=" abc ") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelUpdate_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0015 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update(' abc ');
      logInfo(`update(formId=" abc "): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId=" abc ") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId=" abc ") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" abc "]');
      logInfo(`update(formId=" abc ") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId=" abc ") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId=" abc ") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId=" abc ") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0016
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0016
     * @tc.desc      FormStoreModel.update(formId="abcabc") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0016 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('abcabc');
      logInfo(`update(formId="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="abcabc") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="abcabc") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abcabc"]');
      logInfo(`update(formId="abcabc") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="abcabc") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="abcabc") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="abcabc") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0017
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0017
     * @tc.desc      FormStoreModel.update(formId="abc_1") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0017 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('abc_1');
      logInfo(`update(formId="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="abc_1") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="abc_1") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc_1"]');
      logInfo(`update(formId="abc_1") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="abc_1") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="abc_1") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="abc_1") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0018
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0018
     * @tc.desc      FormStoreModel.update(formId="xabc") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelUpdate_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0018 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('xabc');
      logInfo(`update(formId="xabc"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="xabc") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="xabc") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xabc"]');
      logInfo(`update(formId="xabc") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="xabc") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="xabc") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="xabc") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0019
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0019
     * @tc.desc      FormStoreModel.update(formId=" Hello World ") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelUpdate_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0019 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update(' Hello World ');
      logInfo(`update(formId=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId=" Hello World ") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId=" Hello World ") state: JSON.stringify(subject.form...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" Hello World "]');
      logInfo(`update(formId=" Hello World ") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId=" Hello World ") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId=" Hello World ") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId=" Hello World ") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0020
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0020
     * @tc.desc      FormStoreModel.update(formId="Hello WorldHello World") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0020 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('Hello WorldHello World');
      logInfo(`update(formId="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="Hello WorldHello World") s...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="Hello WorldHello World") s...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello WorldHello World"]');
      logInfo(`update(formId="Hello WorldHello World") s...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="Hello WorldHello World") s...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="Hello WorldHello World") s...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="Hello WorldHello World") s...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0021
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0021
     * @tc.desc      FormStoreModel.update(formId="Hello World_1") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0021 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('Hello World_1');
      logInfo(`update(formId="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="Hello World_1") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="Hello World_1") state: JSON.stringify(subject.form...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World_1"]');
      logInfo(`update(formId="Hello World_1") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="Hello World_1") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="Hello World_1") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="Hello World_1") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0022
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0022
     * @tc.desc      FormStoreModel.update(formId="xHello World") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelUpdate_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0022 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('xHello World');
      logInfo(`update(formId="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="xHello World") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="xHello World") state: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xHello World"]');
      logInfo(`update(formId="xHello World") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="xHello World") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="xHello World") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="xHello World") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0023
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0023
     * @tc.desc      FormStoreModel.update(formId="   ") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelUpdate_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0023 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('   ');
      logInfo(`update(formId="   "): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="   ") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="   ") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["   "]');
      logInfo(`update(formId="   ") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="   ") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="   ") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="   ") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0024
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0024
     * @tc.desc      FormStoreModel.update(formId="  ") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0024 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('  ');
      logInfo(`update(formId="  "): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="  ") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="  ") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["  "]');
      logInfo(`update(formId="  ") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="  ") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="  ") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="  ") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0025
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0025
     * @tc.desc      FormStoreModel.update(formId=" _1") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0025 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update(' _1');
      logInfo(`update(formId=" _1"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId=" _1") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId=" _1") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" _1"]');
      logInfo(`update(formId=" _1") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId=" _1") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId=" _1") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId=" _1") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0026
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0026
     * @tc.desc      FormStoreModel.update(formId="x ") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelUpdate_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0026 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('x ');
      logInfo(`update(formId="x "): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="x ") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="x ") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x "]');
      logInfo(`update(formId="x ") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="x ") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="x ") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="x ") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0027
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0027
     * @tc.desc      FormStoreModel.update(formId=" 123 ") yields "12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelUpdate_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0027 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update(' 123 ');
      logInfo(`update(formId=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('12');
      logInfo(`update(formId=" 123 ") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId=" 123 ") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" 123 "]');
      logInfo(`update(formId=" 123 ") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId=" 123 ") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId=" 123 ") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId=" 123 ") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0028
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0028
     * @tc.desc      FormStoreModel.update(formId="123123") yields "12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0028 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('123123');
      logInfo(`update(formId="123123"): actual=${actual}`);
      expect(actual).assertEqual('12');
      logInfo(`update(formId="123123") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="123123") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123123"]');
      logInfo(`update(formId="123123") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="123123") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="123123") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="123123") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0029
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0029
     * @tc.desc      FormStoreModel.update(formId="123_1") yields "12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0029 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('123_1');
      logInfo(`update(formId="123_1"): actual=${actual}`);
      expect(actual).assertEqual('12');
      logInfo(`update(formId="123_1") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="123_1") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123_1"]');
      logInfo(`update(formId="123_1") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="123_1") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="123_1") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="123_1") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0030
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0030
     * @tc.desc      FormStoreModel.update(formId="x123") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelUpdate_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0030 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('x123');
      logInfo(`update(formId="x123"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="x123") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="x123") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x123"]');
      logInfo(`update(formId="x123") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="x123") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="x123") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="x123") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0031
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0031
     * @tc.desc      FormStoreModel.update(formId="t6g") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0031 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('t6g');
      logInfo(`update(formId="t6g"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="t6g") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="t6g") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["t6g"]');
      logInfo(`update(formId="t6g") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="t6g") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="t6g") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="t6g") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0032
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0032
     * @tc.desc      FormStoreModel.update(formId="xClwfKTvO") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0032 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('xClwfKTvO');
      logInfo(`update(formId="xClwfKTvO"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="xClwfKTvO") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="xClwfKTvO") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xClwfKTvO"]');
      logInfo(`update(formId="xClwfKTvO") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="xClwfKTvO") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="xClwfKTvO") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="xClwfKTvO") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0033
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0033
     * @tc.desc      FormStoreModel.update(formId="XFrpp7IvX") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0033 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('XFrpp7IvX');
      logInfo(`update(formId="XFrpp7IvX"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="XFrpp7IvX") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="XFrpp7IvX") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["XFrpp7IvX"]');
      logInfo(`update(formId="XFrpp7IvX") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="XFrpp7IvX") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="XFrpp7IvX") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="XFrpp7IvX") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0034
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0034
     * @tc.desc      FormStoreModel.update(formId="NH4JDit5") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0034 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('NH4JDit5');
      logInfo(`update(formId="NH4JDit5"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="NH4JDit5") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="NH4JDit5") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["NH4JDit5"]');
      logInfo(`update(formId="NH4JDit5") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="NH4JDit5") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="NH4JDit5") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="NH4JDit5") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0035
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0035
     * @tc.desc      FormStoreModel.update(formId="MDg") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0035 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('MDg');
      logInfo(`update(formId="MDg"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="MDg") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="MDg") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["MDg"]');
      logInfo(`update(formId="MDg") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="MDg") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="MDg") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="MDg") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0036
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0036
     * @tc.desc      FormStoreModel.update(formId="DxouDM4r6M") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0036 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('DxouDM4r6M');
      logInfo(`update(formId="DxouDM4r6M"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="DxouDM4r6M") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="DxouDM4r6M") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["DxouDM4r6M"]');
      logInfo(`update(formId="DxouDM4r6M") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="DxouDM4r6M") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="DxouDM4r6M") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="DxouDM4r6M") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0037
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0037
     * @tc.desc      FormStoreModel.update(formId="XTx81V") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0037 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('XTx81V');
      logInfo(`update(formId="XTx81V"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="XTx81V") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="XTx81V") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["XTx81V"]');
      logInfo(`update(formId="XTx81V") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="XTx81V") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="XTx81V") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="XTx81V") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0038
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0038
     * @tc.desc      FormStoreModel.update(formId="PEX") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0038 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('PEX');
      logInfo(`update(formId="PEX"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="PEX") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="PEX") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["PEX"]');
      logInfo(`update(formId="PEX") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="PEX") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="PEX") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="PEX") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0039
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0039
     * @tc.desc      FormStoreModel.update(formId="I5FJ7Fl") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0039 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('I5FJ7Fl');
      logInfo(`update(formId="I5FJ7Fl"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="I5FJ7Fl") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="I5FJ7Fl") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["I5FJ7Fl"]');
      logInfo(`update(formId="I5FJ7Fl") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="I5FJ7Fl") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="I5FJ7Fl") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="I5FJ7Fl") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0040
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0040
     * @tc.desc      FormStoreModel.update(formId="mZHuH") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0040 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('mZHuH');
      logInfo(`update(formId="mZHuH"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="mZHuH") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="mZHuH") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["mZHuH"]');
      logInfo(`update(formId="mZHuH") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="mZHuH") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="mZHuH") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="mZHuH") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0041
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0041
     * @tc.desc      FormStoreModel.update(formId="Kg6dFIQTw1M") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0041 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('Kg6dFIQTw1M');
      logInfo(`update(formId="Kg6dFIQTw1M"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="Kg6dFIQTw1M") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="Kg6dFIQTw1M") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Kg6dFIQTw1M"]');
      logInfo(`update(formId="Kg6dFIQTw1M") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="Kg6dFIQTw1M") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="Kg6dFIQTw1M") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="Kg6dFIQTw1M") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0042
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0042
     * @tc.desc      FormStoreModel.update(formId="pIqgd4zxme") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0042 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('pIqgd4zxme');
      logInfo(`update(formId="pIqgd4zxme"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="pIqgd4zxme") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="pIqgd4zxme") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["pIqgd4zxme"]');
      logInfo(`update(formId="pIqgd4zxme") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="pIqgd4zxme") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="pIqgd4zxme") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="pIqgd4zxme") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0043
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0043
     * @tc.desc      FormStoreModel.update(formId="6tTvXkLFOLq6") yields "15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0043 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('6tTvXkLFOLq6');
      logInfo(`update(formId="6tTvXkLFOLq6"): actual=${actual}`);
      expect(actual).assertEqual('15');
      logInfo(`update(formId="6tTvXkLFOLq6") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="6tTvXkLFOLq6") state: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["6tTvXkLFOLq6"]');
      logInfo(`update(formId="6tTvXkLFOLq6") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="6tTvXkLFOLq6") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="6tTvXkLFOLq6") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="6tTvXkLFOLq6") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0044
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0044
     * @tc.desc      FormStoreModel.update(formId="oiNuZYOTenX") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0044 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('oiNuZYOTenX');
      logInfo(`update(formId="oiNuZYOTenX"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="oiNuZYOTenX") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="oiNuZYOTenX") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["oiNuZYOTenX"]');
      logInfo(`update(formId="oiNuZYOTenX") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="oiNuZYOTenX") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="oiNuZYOTenX") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="oiNuZYOTenX") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0045
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0045
     * @tc.desc      FormStoreModel.update(formId="T") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0045 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('T');
      logInfo(`update(formId="T"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="T") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="T") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["T"]');
      logInfo(`update(formId="T") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="T") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="T") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="T") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0046
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0046
     * @tc.desc      FormStoreModel.update(formId="Yi6E") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0046 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('Yi6E');
      logInfo(`update(formId="Yi6E"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="Yi6E") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="Yi6E") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Yi6E"]');
      logInfo(`update(formId="Yi6E") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="Yi6E") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="Yi6E") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="Yi6E") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0047
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0047
     * @tc.desc      FormStoreModel.update(formId="mkxaqpp") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0047 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('mkxaqpp');
      logInfo(`update(formId="mkxaqpp"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="mkxaqpp") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="mkxaqpp") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["mkxaqpp"]');
      logInfo(`update(formId="mkxaqpp") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="mkxaqpp") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="mkxaqpp") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="mkxaqpp") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0048
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0048
     * @tc.desc      FormStoreModel.update(formId="BrybBcocg6W") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0048 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('BrybBcocg6W');
      logInfo(`update(formId="BrybBcocg6W"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="BrybBcocg6W") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="BrybBcocg6W") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["BrybBcocg6W"]');
      logInfo(`update(formId="BrybBcocg6W") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="BrybBcocg6W") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="BrybBcocg6W") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="BrybBcocg6W") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0049
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0049
     * @tc.desc      FormStoreModel.update(formId="g4z") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0049 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('g4z');
      logInfo(`update(formId="g4z"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="g4z") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="g4z") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["g4z"]');
      logInfo(`update(formId="g4z") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="g4z") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="g4z") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="g4z") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0050
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0050
     * @tc.desc      FormStoreModel.update(formId="AZzdKkzvg") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0050 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('AZzdKkzvg');
      logInfo(`update(formId="AZzdKkzvg"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="AZzdKkzvg") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="AZzdKkzvg") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["AZzdKkzvg"]');
      logInfo(`update(formId="AZzdKkzvg") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="AZzdKkzvg") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="AZzdKkzvg") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="AZzdKkzvg") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0051
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0051
     * @tc.desc      FormStoreModel.update(formId="WHhk2ebfEhMM") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0051 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('WHhk2ebfEhMM');
      logInfo(`update(formId="WHhk2ebfEhMM"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="WHhk2ebfEhMM") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="WHhk2ebfEhMM") state: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["WHhk2ebfEhMM"]');
      logInfo(`update(formId="WHhk2ebfEhMM") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="WHhk2ebfEhMM") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="WHhk2ebfEhMM") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="WHhk2ebfEhMM") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0052
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0052
     * @tc.desc      FormStoreModel.update(formId="VXg0loyRr8IT") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0052 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('VXg0loyRr8IT');
      logInfo(`update(formId="VXg0loyRr8IT"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="VXg0loyRr8IT") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="VXg0loyRr8IT") state: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["VXg0loyRr8IT"]');
      logInfo(`update(formId="VXg0loyRr8IT") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="VXg0loyRr8IT") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="VXg0loyRr8IT") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="VXg0loyRr8IT") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0053
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0053
     * @tc.desc      FormStoreModel.update(formId="j555Grffw3jn") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0053 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('j555Grffw3jn');
      logInfo(`update(formId="j555Grffw3jn"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="j555Grffw3jn") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="j555Grffw3jn") state: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["j555Grffw3jn"]');
      logInfo(`update(formId="j555Grffw3jn") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="j555Grffw3jn") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="j555Grffw3jn") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="j555Grffw3jn") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0053 end`);
    });
  });
}
