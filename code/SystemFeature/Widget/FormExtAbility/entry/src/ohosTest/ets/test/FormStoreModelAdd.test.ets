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

/** Logic checks for FormStoreModel.add (53 cases). */
export default function formStoreModelAddTest(): void {
  describe('FormStoreModelAddTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0001
     * @tc.name      FormExtAbility_FormStoreModelAdd_0001
     * @tc.desc      FormStoreModel.add(formId="", formName="", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelAdd_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0001 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', '', true);
      logInfo(`add(formId="", formName="", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="", tempFlag=true...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="", tempFlag=true...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="", tempFlag=true...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="", tempFlag=true...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="", formName="", tempFlag=true...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="", tempFlag=true...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0002
     * @tc.name      FormExtAbility_FormStoreModelAdd_0002
     * @tc.desc      FormStoreModel.add(formId="", formName="", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelAdd_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0002 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', '', false);
      logInfo(`add(formId="", formName="", tempFlag=false): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="", tempFlag=fals...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="", tempFlag=fals...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="", tempFlag=fals...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="", tempFlag=fals...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="", formName="", tempFlag=fals...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="", tempFlag=fals...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0003
     * @tc.name      FormExtAbility_FormStoreModelAdd_0003
     * @tc.desc      FormStoreModel.add(formId="", formName="x", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0003 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'x', true);
      logInfo(`add(formId="", formName="x", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="x", tempFlag=tru...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="x", tempFlag=tru...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="x", tempFlag=tru...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="x", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="", formName="x", tempFlag=tru...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="x", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0004
     * @tc.name      FormExtAbility_FormStoreModelAdd_0004
     * @tc.desc      FormStoreModel.add(formId="", formName="x", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0004 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'x', false);
      logInfo(`add(formId="", formName="x", tempFlag=false): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="x", tempFlag=fal...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="x", tempFlag=fal...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="x", tempFlag=fal...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="x", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="", formName="x", tempFlag=fal...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="x", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0005
     * @tc.name      FormExtAbility_FormStoreModelAdd_0005
     * @tc.desc      FormStoreModel.add(formId="", formName="Hello", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0005 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'Hello', true);
      logInfo(`add(formId="", formName="Hello", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="Hello", tempFlag...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="Hello", tempFlag...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="Hello", tempFlag...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="Hello", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="", formName="Hello", tempFlag...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="Hello", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0006
     * @tc.name      FormExtAbility_FormStoreModelAdd_0006
     * @tc.desc      FormStoreModel.add(formId="", formName="Hello", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0006 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'Hello', false);
      logInfo(`add(formId="", formName="Hello", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="Hello", tempFlag...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="Hello", tempFlag...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="Hello", tempFlag...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="Hello", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="", formName="Hello", tempFlag...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="Hello", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0007
     * @tc.name      FormExtAbility_FormStoreModelAdd_0007
     * @tc.desc      FormStoreModel.add(formId="", formName="hello world", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0007 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'hello world', true);
      logInfo(`add(formId="", formName="hello world", te...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="hello world", te...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="hello world", te...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="hello world", te...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="hello world", te...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="", formName="hello world", te...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="hello world", te...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0008
     * @tc.name      FormExtAbility_FormStoreModelAdd_0008
     * @tc.desc      FormStoreModel.add(formId="", formName="hello world", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0008 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'hello world', false);
      logInfo(`add(formId="", formName="hello world", te...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="hello world", te...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="hello world", te...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="hello world", te...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="hello world", te...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="", formName="hello world", te...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="hello world", te...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0009
     * @tc.name      FormExtAbility_FormStoreModelAdd_0009
     * @tc.desc      FormStoreModel.add(formId="", formName=" ", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0009 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', ' ', true);
      logInfo(`add(formId="", formName=" ", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName=" ", tempFlag=tru...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName=" ", tempFlag=tru...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName=" ", tempFlag=tru...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName=" ", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="", formName=" ", tempFlag=tru...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName=" ", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0010
     * @tc.name      FormExtAbility_FormStoreModelAdd_0010
     * @tc.desc      FormStoreModel.add(formId="", formName=" ", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0010 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', ' ', false);
      logInfo(`add(formId="", formName=" ", tempFlag=false): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName=" ", tempFlag=fal...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName=" ", tempFlag=fal...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName=" ", tempFlag=fal...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName=" ", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="", formName=" ", tempFlag=fal...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName=" ", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0011
     * @tc.name      FormExtAbility_FormStoreModelAdd_0011
     * @tc.desc      FormStoreModel.add(formId="", formName="A", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0011 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'A', true);
      logInfo(`add(formId="", formName="A", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="A", tempFlag=tru...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="A", tempFlag=tru...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="A", tempFlag=tru...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="A", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="", formName="A", tempFlag=tru...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="A", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0012
     * @tc.name      FormExtAbility_FormStoreModelAdd_0012
     * @tc.desc      FormStoreModel.add(formId="", formName="A", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0012 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'A', false);
      logInfo(`add(formId="", formName="A", tempFlag=false): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="A", tempFlag=fal...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="A", tempFlag=fal...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="A", tempFlag=fal...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="A", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="", formName="A", tempFlag=fal...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="A", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0013
     * @tc.name      FormExtAbility_FormStoreModelAdd_0013
     * @tc.desc      FormStoreModel.add(formId="", formName="Sample Title 123", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0013 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'Sample Title 123', true);
      logInfo(`add(formId="", formName="Sample Title 123...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="Sample Title 123...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="Sample Title 123...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="Sample Title 123...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="Sample Title 123...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="", formName="Sample Title 123...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="Sample Title 123...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0014
     * @tc.name      FormExtAbility_FormStoreModelAdd_0014
     * @tc.desc      FormStoreModel.add(formId="", formName="Sample Title 123", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0014 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'Sample Title 123', false);
      logInfo(`add(formId="", formName="Sample Title 123...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="Sample Title 123...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="Sample Title 123...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="Sample Title 123...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="Sample Title 123...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="", formName="Sample Title 123...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="Sample Title 123...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0015
     * @tc.name      FormExtAbility_FormStoreModelAdd_0015
     * @tc.desc      FormStoreModel.add(formId="", formName="??", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0015 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', '\u4e2d\u6587', true);
      logInfo(`add(formId="", formName="??", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="??", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="??", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="??", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="??", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="", formName="??", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="??", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0016
     * @tc.name      FormExtAbility_FormStoreModelAdd_0016
     * @tc.desc      FormStoreModel.add(formId="", formName="??", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0016 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', '\u4e2d\u6587', false);
      logInfo(`add(formId="", formName="??", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="??", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="??", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="??", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="??", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="", formName="??", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="??", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0017
     * @tc.name      FormExtAbility_FormStoreModelAdd_0017
     * @tc.desc      FormStoreModel.add(formId="", formName="a", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0017 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'a', true);
      logInfo(`add(formId="", formName="a", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="a", tempFlag=tru...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="a", tempFlag=tru...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="a", tempFlag=tru...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="a", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="", formName="a", tempFlag=tru...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="a", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0018
     * @tc.name      FormExtAbility_FormStoreModelAdd_0018
     * @tc.desc      FormStoreModel.add(formId="", formName="a", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0018 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'a', false);
      logInfo(`add(formId="", formName="a", tempFlag=false): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="a", tempFlag=fal...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="a", tempFlag=fal...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="a", tempFlag=fal...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="a", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="", formName="a", tempFlag=fal...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="a", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0019
     * @tc.name      FormExtAbility_FormStoreModelAdd_0019
     * @tc.desc      FormStoreModel.add(formId="", formName="abc", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0019 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'abc', true);
      logInfo(`add(formId="", formName="abc", tempFlag=t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="abc", tempFlag=t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="abc", tempFlag=t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="abc", tempFlag=t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="abc", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="", formName="abc", tempFlag=t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="abc", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0020
     * @tc.name      FormExtAbility_FormStoreModelAdd_0020
     * @tc.desc      FormStoreModel.add(formId="", formName="abc", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0020 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('', 'abc', false);
      logInfo(`add(formId="", formName="abc", tempFlag=f...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="", formName="abc", tempFlag=f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="", formName="abc", tempFlag=f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add(formId="", formName="abc", tempFlag=f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="", formName="abc", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="", formName="abc", tempFlag=f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="", formName="abc", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0021
     * @tc.name      FormExtAbility_FormStoreModelAdd_0021
     * @tc.desc      FormStoreModel.add(formId="x", formName="", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0021 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', '', true);
      logInfo(`add(formId="x", formName="", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="", tempFlag=tru...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="", tempFlag=tru...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="", tempFlag=tru...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="x", formName="", tempFlag=tru...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0022
     * @tc.name      FormExtAbility_FormStoreModelAdd_0022
     * @tc.desc      FormStoreModel.add(formId="x", formName="", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0022 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', '', false);
      logInfo(`add(formId="x", formName="", tempFlag=false): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="", tempFlag=fal...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="", tempFlag=fal...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="", tempFlag=fal...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="x", formName="", tempFlag=fal...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0023
     * @tc.name      FormExtAbility_FormStoreModelAdd_0023
     * @tc.desc      FormStoreModel.add(formId="x", formName="x", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0023 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'x', true);
      logInfo(`add(formId="x", formName="x", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="x", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="x", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="x", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="x", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="x", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="x", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0024
     * @tc.name      FormExtAbility_FormStoreModelAdd_0024
     * @tc.desc      FormStoreModel.add(formId="x", formName="x", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0024 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'x', false);
      logInfo(`add(formId="x", formName="x", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="x", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="x", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="x", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="x", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="x", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="x", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0025
     * @tc.name      FormExtAbility_FormStoreModelAdd_0025
     * @tc.desc      FormStoreModel.add(formId="x", formName="Hello", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0025 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'Hello', true);
      logInfo(`add(formId="x", formName="Hello", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="Hello", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="Hello", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="Hello", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="Hello", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="x", formName="Hello", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="Hello", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0026
     * @tc.name      FormExtAbility_FormStoreModelAdd_0026
     * @tc.desc      FormStoreModel.add(formId="x", formName="Hello", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0026 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'Hello', false);
      logInfo(`add(formId="x", formName="Hello", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="Hello", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="Hello", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="Hello", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="Hello", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="x", formName="Hello", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="Hello", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0027
     * @tc.name      FormExtAbility_FormStoreModelAdd_0027
     * @tc.desc      FormStoreModel.add(formId="x", formName="hello world", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0027 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'hello world', true);
      logInfo(`add(formId="x", formName="hello world", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="hello world", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="hello world", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="hello world", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="hello world", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="x", formName="hello world", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="hello world", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0028
     * @tc.name      FormExtAbility_FormStoreModelAdd_0028
     * @tc.desc      FormStoreModel.add(formId="x", formName="hello world", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0028 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'hello world', false);
      logInfo(`add(formId="x", formName="hello world", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="hello world", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="hello world", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="hello world", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="hello world", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="x", formName="hello world", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="hello world", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0029
     * @tc.name      FormExtAbility_FormStoreModelAdd_0029
     * @tc.desc      FormStoreModel.add(formId="x", formName=" ", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0029 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', ' ', true);
      logInfo(`add(formId="x", formName=" ", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName=" ", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName=" ", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName=" ", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName=" ", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="x", formName=" ", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName=" ", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0030
     * @tc.name      FormExtAbility_FormStoreModelAdd_0030
     * @tc.desc      FormStoreModel.add(formId="x", formName=" ", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0030 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', ' ', false);
      logInfo(`add(formId="x", formName=" ", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName=" ", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName=" ", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName=" ", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName=" ", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="x", formName=" ", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName=" ", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0031
     * @tc.name      FormExtAbility_FormStoreModelAdd_0031
     * @tc.desc      FormStoreModel.add(formId="x", formName="A", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0031 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'A', true);
      logInfo(`add(formId="x", formName="A", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="A", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="A", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="A", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="A", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="x", formName="A", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="A", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0032
     * @tc.name      FormExtAbility_FormStoreModelAdd_0032
     * @tc.desc      FormStoreModel.add(formId="x", formName="A", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0032 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'A', false);
      logInfo(`add(formId="x", formName="A", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="A", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="A", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="A", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="A", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="x", formName="A", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="A", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0033
     * @tc.name      FormExtAbility_FormStoreModelAdd_0033
     * @tc.desc      FormStoreModel.add(formId="x", formName="Sample Title 123", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0033 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'Sample Title 123', true);
      logInfo(`add(formId="x", formName="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="Sample Title 12...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="Sample Title 12...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="Sample Title 12...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="Sample Title 12...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="x", formName="Sample Title 12...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="Sample Title 12...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0034
     * @tc.name      FormExtAbility_FormStoreModelAdd_0034
     * @tc.desc      FormStoreModel.add(formId="x", formName="Sample Title 123", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0034 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'Sample Title 123', false);
      logInfo(`add(formId="x", formName="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="Sample Title 12...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="Sample Title 12...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="Sample Title 12...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="Sample Title 12...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="x", formName="Sample Title 12...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="Sample Title 12...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0035
     * @tc.name      FormExtAbility_FormStoreModelAdd_0035
     * @tc.desc      FormStoreModel.add(formId="x", formName="??", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0035 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', '\u4e2d\u6587', true);
      logInfo(`add(formId="x", formName="??", tempFlag=t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="??", tempFlag=t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="??", tempFlag=t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="??", tempFlag=t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="??", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="x", formName="??", tempFlag=t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="??", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0036
     * @tc.name      FormExtAbility_FormStoreModelAdd_0036
     * @tc.desc      FormStoreModel.add(formId="x", formName="??", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0036 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', '\u4e2d\u6587', false);
      logInfo(`add(formId="x", formName="??", tempFlag=f...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="??", tempFlag=f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="??", tempFlag=f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="??", tempFlag=f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="??", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="x", formName="??", tempFlag=f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="??", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0037
     * @tc.name      FormExtAbility_FormStoreModelAdd_0037
     * @tc.desc      FormStoreModel.add(formId="x", formName="a", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0037 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'a', true);
      logInfo(`add(formId="x", formName="a", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="a", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="a", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="a", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="a", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="x", formName="a", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="a", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0038
     * @tc.name      FormExtAbility_FormStoreModelAdd_0038
     * @tc.desc      FormStoreModel.add(formId="x", formName="a", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0038 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'a', false);
      logInfo(`add(formId="x", formName="a", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="a", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="a", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="a", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="a", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="x", formName="a", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="a", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0039
     * @tc.name      FormExtAbility_FormStoreModelAdd_0039
     * @tc.desc      FormStoreModel.add(formId="x", formName="abc", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0039 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'abc', true);
      logInfo(`add(formId="x", formName="abc", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="abc", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="abc", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="abc", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="abc", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="x", formName="abc", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="abc", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0040
     * @tc.name      FormExtAbility_FormStoreModelAdd_0040
     * @tc.desc      FormStoreModel.add(formId="x", formName="abc", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0040 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x', 'abc', false);
      logInfo(`add(formId="x", formName="abc", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x", formName="abc", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x", formName="abc", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x"]');
      logInfo(`add(formId="x", formName="abc", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x", formName="abc", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="x", formName="abc", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x", formName="abc", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0041
     * @tc.name      FormExtAbility_FormStoreModelAdd_0041
     * @tc.desc      FormStoreModel.add(formId="a", formName="", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0041 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', '', true);
      logInfo(`add(formId="a", formName="", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="", tempFlag=tru...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="", tempFlag=tru...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="", tempFlag=tru...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="a", formName="", tempFlag=tru...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0042
     * @tc.name      FormExtAbility_FormStoreModelAdd_0042
     * @tc.desc      FormStoreModel.add(formId="a", formName="", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0042 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', '', false);
      logInfo(`add(formId="a", formName="", tempFlag=false): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="", tempFlag=fal...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="", tempFlag=fal...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="", tempFlag=fal...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="a", formName="", tempFlag=fal...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0043
     * @tc.name      FormExtAbility_FormStoreModelAdd_0043
     * @tc.desc      FormStoreModel.add(formId="a", formName="x", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0043 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'x', true);
      logInfo(`add(formId="a", formName="x", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="x", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="x", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="x", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="x", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="a", formName="x", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="x", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0044
     * @tc.name      FormExtAbility_FormStoreModelAdd_0044
     * @tc.desc      FormStoreModel.add(formId="a", formName="x", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0044 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'x', false);
      logInfo(`add(formId="a", formName="x", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="x", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="x", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="x", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="x", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="a", formName="x", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="x", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0045
     * @tc.name      FormExtAbility_FormStoreModelAdd_0045
     * @tc.desc      FormStoreModel.add(formId="a", formName="Hello", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0045 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'Hello', true);
      logInfo(`add(formId="a", formName="Hello", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="Hello", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="Hello", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="Hello", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="Hello", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="a", formName="Hello", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="Hello", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0046
     * @tc.name      FormExtAbility_FormStoreModelAdd_0046
     * @tc.desc      FormStoreModel.add(formId="a", formName="Hello", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0046 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'Hello', false);
      logInfo(`add(formId="a", formName="Hello", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="Hello", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="Hello", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="Hello", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="Hello", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="a", formName="Hello", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="Hello", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0047
     * @tc.name      FormExtAbility_FormStoreModelAdd_0047
     * @tc.desc      FormStoreModel.add(formId="a", formName="hello world", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0047 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'hello world', true);
      logInfo(`add(formId="a", formName="hello world", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="hello world", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="hello world", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="hello world", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="hello world", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="a", formName="hello world", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="hello world", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0048
     * @tc.name      FormExtAbility_FormStoreModelAdd_0048
     * @tc.desc      FormStoreModel.add(formId="a", formName="hello world", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0048 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'hello world', false);
      logInfo(`add(formId="a", formName="hello world", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="hello world", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="hello world", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="hello world", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="hello world", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="a", formName="hello world", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="hello world", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0049
     * @tc.name      FormExtAbility_FormStoreModelAdd_0049
     * @tc.desc      FormStoreModel.add(formId="a", formName=" ", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0049 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', ' ', true);
      logInfo(`add(formId="a", formName=" ", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName=" ", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName=" ", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName=" ", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName=" ", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="a", formName=" ", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName=" ", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0050
     * @tc.name      FormExtAbility_FormStoreModelAdd_0050
     * @tc.desc      FormStoreModel.add(formId="a", formName=" ", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0050 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', ' ', false);
      logInfo(`add(formId="a", formName=" ", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName=" ", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName=" ", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName=" ", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName=" ", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="a", formName=" ", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName=" ", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0051
     * @tc.name      FormExtAbility_FormStoreModelAdd_0051
     * @tc.desc      FormStoreModel.add(formId="a", formName="A", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0051 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'A', true);
      logInfo(`add(formId="a", formName="A", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="A", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="A", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="A", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="A", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="a", formName="A", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="A", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0052
     * @tc.name      FormExtAbility_FormStoreModelAdd_0052
     * @tc.desc      FormStoreModel.add(formId="a", formName="A", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0052 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'A', false);
      logInfo(`add(formId="a", formName="A", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="A", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="A", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="A", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="A", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="a", formName="A", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="A", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0053
     * @tc.name      FormExtAbility_FormStoreModelAdd_0053
     * @tc.desc      FormStoreModel.add(formId="a", formName="Sample Title 123", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0053 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'Sample Title 123', true);
      logInfo(`add(formId="a", formName="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="Sample Title 12...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="Sample Title 12...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="Sample Title 12...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="Sample Title 12...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="a", formName="Sample Title 12...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="Sample Title 12...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0053 end`);
    });
  });
}
