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
export default function formStoreModelAdd3Test(): void {
  describe('FormStoreModelAdd3Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0107
     * @tc.name      FormExtAbility_FormStoreModelAdd_0107
     * @tc.desc      FormStoreModel.add(formId=" ", formName="hello world", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0107 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'hello world', true);
      logInfo(`add(formId=" ", formName="hello world", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="hello world", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="hello world", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="hello world", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="hello world", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId=" ", formName="hello world", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="hello world", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0107 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0108
     * @tc.name      FormExtAbility_FormStoreModelAdd_0108
     * @tc.desc      FormStoreModel.add(formId=" ", formName="hello world", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0108 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'hello world', false);
      logInfo(`add(formId=" ", formName="hello world", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="hello world", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="hello world", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="hello world", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="hello world", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId=" ", formName="hello world", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="hello world", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0108 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0109
     * @tc.name      FormExtAbility_FormStoreModelAdd_0109
     * @tc.desc      FormStoreModel.add(formId=" ", formName=" ", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0109 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', ' ', true);
      logInfo(`add(formId=" ", formName=" ", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName=" ", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName=" ", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName=" ", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName=" ", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName=" ", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName=" ", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0109 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0110
     * @tc.name      FormExtAbility_FormStoreModelAdd_0110
     * @tc.desc      FormStoreModel.add(formId=" ", formName=" ", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0110 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', ' ', false);
      logInfo(`add(formId=" ", formName=" ", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName=" ", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName=" ", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName=" ", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName=" ", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName=" ", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName=" ", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0110 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0111
     * @tc.name      FormExtAbility_FormStoreModelAdd_0111
     * @tc.desc      FormStoreModel.add(formId=" ", formName="A", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0111 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'A', true);
      logInfo(`add(formId=" ", formName="A", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="A", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="A", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="A", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="A", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId=" ", formName="A", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="A", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0111 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0112
     * @tc.name      FormExtAbility_FormStoreModelAdd_0112
     * @tc.desc      FormStoreModel.add(formId=" ", formName="A", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0112 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'A', false);
      logInfo(`add(formId=" ", formName="A", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="A", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="A", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="A", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="A", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId=" ", formName="A", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="A", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0112 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0113
     * @tc.name      FormExtAbility_FormStoreModelAdd_0113
     * @tc.desc      FormStoreModel.add(formId=" ", formName="Sample Title 123", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0113 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'Sample Title 123', true);
      logInfo(`add(formId=" ", formName="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="Sample Title 12...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="Sample Title 12...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="Sample Title 12...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="Sample Title 12...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId=" ", formName="Sample Title 12...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="Sample Title 12...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0113 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0114
     * @tc.name      FormExtAbility_FormStoreModelAdd_0114
     * @tc.desc      FormStoreModel.add(formId=" ", formName="Sample Title 123", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0114 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'Sample Title 123', false);
      logInfo(`add(formId=" ", formName="Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="Sample Title 12...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="Sample Title 12...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="Sample Title 12...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="Sample Title 12...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId=" ", formName="Sample Title 12...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="Sample Title 12...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0114 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0115
     * @tc.name      FormExtAbility_FormStoreModelAdd_0115
     * @tc.desc      FormStoreModel.add(formId=" ", formName="??", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0115 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', '\u4e2d\u6587', true);
      logInfo(`add(formId=" ", formName="??", tempFlag=t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="??", tempFlag=t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="??", tempFlag=t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="??", tempFlag=t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="??", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId=" ", formName="??", tempFlag=t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="??", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0115 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0116
     * @tc.name      FormExtAbility_FormStoreModelAdd_0116
     * @tc.desc      FormStoreModel.add(formId=" ", formName="??", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0116 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', '\u4e2d\u6587', false);
      logInfo(`add(formId=" ", formName="??", tempFlag=f...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="??", tempFlag=f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="??", tempFlag=f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="??", tempFlag=f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="??", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId=" ", formName="??", tempFlag=f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="??", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0116 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0117
     * @tc.name      FormExtAbility_FormStoreModelAdd_0117
     * @tc.desc      FormStoreModel.add(formId=" ", formName="a", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0117 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'a', true);
      logInfo(`add(formId=" ", formName="a", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="a", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="a", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="a", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="a", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId=" ", formName="a", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="a", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0117 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0118
     * @tc.name      FormExtAbility_FormStoreModelAdd_0118
     * @tc.desc      FormStoreModel.add(formId=" ", formName="a", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0118 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'a', false);
      logInfo(`add(formId=" ", formName="a", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="a", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="a", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="a", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="a", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId=" ", formName="a", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="a", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0118 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0119
     * @tc.name      FormExtAbility_FormStoreModelAdd_0119
     * @tc.desc      FormStoreModel.add(formId=" ", formName="abc", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0119 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'abc', true);
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0119 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0120
     * @tc.name      FormExtAbility_FormStoreModelAdd_0120
     * @tc.desc      FormStoreModel.add(formId=" ", formName="abc", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0120 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'abc', false);
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="abc", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0120 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0121
     * @tc.name      FormExtAbility_FormStoreModelAdd_0121
     * @tc.desc      FormStoreModel.add(formId="123", formName="", tempFlag=true) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0121 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', '', true);
      logInfo(`add(formId="123", formName="", tempFlag=t...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="", tempFlag=t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="", tempFlag=t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="", tempFlag=t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="123", formName="", tempFlag=t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0121 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0122
     * @tc.name      FormExtAbility_FormStoreModelAdd_0122
     * @tc.desc      FormStoreModel.add(formId="123", formName="", tempFlag=false) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0122 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', '', false);
      logInfo(`add(formId="123", formName="", tempFlag=f...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="", tempFlag=f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="", tempFlag=f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="", tempFlag=f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="123", formName="", tempFlag=f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0122 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0123
     * @tc.name      FormExtAbility_FormStoreModelAdd_0123
     * @tc.desc      FormStoreModel.add(formId="123", formName="x", tempFlag=true) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0123 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'x', true);
      logInfo(`add(formId="123", formName="x", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="x", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="x", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="x", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="123", formName="x", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0123 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0124
     * @tc.name      FormExtAbility_FormStoreModelAdd_0124
     * @tc.desc      FormStoreModel.add(formId="123", formName="x", tempFlag=false) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0124 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'x', false);
      logInfo(`add(formId="123", formName="x", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="x", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="x", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="x", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="123", formName="x", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0124 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0125
     * @tc.name      FormExtAbility_FormStoreModelAdd_0125
     * @tc.desc      FormStoreModel.add(formId="123", formName="Hello", tempFlag=true) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0125 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'Hello', true);
      logInfo(`add(formId="123", formName="Hello", tempF...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="Hello", tempF...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="Hello", tempF...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="Hello", tempF...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="123", formName="Hello", tempF...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0125 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0126
     * @tc.name      FormExtAbility_FormStoreModelAdd_0126
     * @tc.desc      FormStoreModel.add(formId="123", formName="Hello", tempFlag=false) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0126 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'Hello', false);
      logInfo(`add(formId="123", formName="Hello", tempF...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="Hello", tempF...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="Hello", tempF...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="Hello", tempF...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="123", formName="Hello", tempF...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0126 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0127
     * @tc.name      FormExtAbility_FormStoreModelAdd_0127
     * @tc.desc      FormStoreModel.add(formId="123", formName="hello world", tempFlag=true) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0127 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'hello world', true);
      logInfo(`add(formId="123", formName="hello world",...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="hello world",...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="hello world",...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="hello world",...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="123", formName="hello world",...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0127 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0128
     * @tc.name      FormExtAbility_FormStoreModelAdd_0128
     * @tc.desc      FormStoreModel.add(formId="123", formName="hello world", tempFlag=false) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0128 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'hello world', false);
      logInfo(`add(formId="123", formName="hello world",...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="hello world",...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="hello world",...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="hello world",...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="123", formName="hello world",...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0128 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0129
     * @tc.name      FormExtAbility_FormStoreModelAdd_0129
     * @tc.desc      FormStoreModel.add(formId="123", formName=" ", tempFlag=true) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0129 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', ' ', true);
      logInfo(`add(formId="123", formName=" ", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName=" ", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName=" ", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName=" ", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="123", formName=" ", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0129 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0130
     * @tc.name      FormExtAbility_FormStoreModelAdd_0130
     * @tc.desc      FormStoreModel.add(formId="123", formName=" ", tempFlag=false) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0130 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', ' ', false);
      logInfo(`add(formId="123", formName=" ", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName=" ", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName=" ", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName=" ", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="123", formName=" ", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0130 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0131
     * @tc.name      FormExtAbility_FormStoreModelAdd_0131
     * @tc.desc      FormStoreModel.add(formId="123", formName="A", tempFlag=true) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0131 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'A', true);
      logInfo(`add(formId="123", formName="A", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="A", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="A", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="A", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="123", formName="A", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0131 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0132
     * @tc.name      FormExtAbility_FormStoreModelAdd_0132
     * @tc.desc      FormStoreModel.add(formId="123", formName="A", tempFlag=false) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0132 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'A', false);
      logInfo(`add(formId="123", formName="A", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="A", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="A", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="A", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="123", formName="A", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0132 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0133
     * @tc.name      FormExtAbility_FormStoreModelAdd_0133
     * @tc.desc      FormStoreModel.add(formId="123", formName="Sample Title 123", tempFlag=true) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0133 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'Sample Title 123', true);
      logInfo(`add(formId="123", formName="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="Sample Title ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="Sample Title ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="Sample Title ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="123", formName="Sample Title ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0133 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0134
     * @tc.name      FormExtAbility_FormStoreModelAdd_0134
     * @tc.desc      FormStoreModel.add(formId="123", formName="Sample Title 123", tempFlag=false) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0134 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'Sample Title 123', false);
      logInfo(`add(formId="123", formName="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="Sample Title ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="Sample Title ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="Sample Title ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="123", formName="Sample Title ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0134 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0135
     * @tc.name      FormExtAbility_FormStoreModelAdd_0135
     * @tc.desc      FormStoreModel.add(formId="123", formName="??", tempFlag=true) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0135 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', '\u4e2d\u6587', true);
      logInfo(`add(formId="123", formName="??", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="??", tempFlag...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="??", tempFlag...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="??", tempFlag...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="123", formName="??", tempFlag...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0135 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0136
     * @tc.name      FormExtAbility_FormStoreModelAdd_0136
     * @tc.desc      FormStoreModel.add(formId="123", formName="??", tempFlag=false) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0136 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', '\u4e2d\u6587', false);
      logInfo(`add(formId="123", formName="??", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="??", tempFlag...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="??", tempFlag...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="??", tempFlag...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="123", formName="??", tempFlag...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0136 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0137
     * @tc.name      FormExtAbility_FormStoreModelAdd_0137
     * @tc.desc      FormStoreModel.add(formId="123", formName="a", tempFlag=true) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0137 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'a', true);
      logInfo(`add(formId="123", formName="a", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="a", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="a", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="a", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="123", formName="a", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0137 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0138
     * @tc.name      FormExtAbility_FormStoreModelAdd_0138
     * @tc.desc      FormStoreModel.add(formId="123", formName="a", tempFlag=false) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0138 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'a', false);
      logInfo(`add(formId="123", formName="a", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="a", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="a", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="a", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="123", formName="a", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0138 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0139
     * @tc.name      FormExtAbility_FormStoreModelAdd_0139
     * @tc.desc      FormStoreModel.add(formId="123", formName="abc", tempFlag=true) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0139 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'abc', true);
      logInfo(`add(formId="123", formName="abc", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="abc", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="abc", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="abc", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="123", formName="abc", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0139 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0140
     * @tc.name      FormExtAbility_FormStoreModelAdd_0140
     * @tc.desc      FormStoreModel.add(formId="123", formName="abc", tempFlag=false) yields "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0140 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('123', 'abc', false);
      logInfo(`add(formId="123", formName="abc", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`add(formId="123", formName="abc", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="123", formName="abc", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add(formId="123", formName="abc", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="123", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="123", formName="abc", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="123", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0140 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0141
     * @tc.name      FormExtAbility_FormStoreModelAdd_0141
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0141 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', '', true);
      logInfo(`add(formId=" x ", formName="", tempFlag=t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="", tempFlag=t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="", tempFlag=t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="", tempFlag=t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId=" x ", formName="", tempFlag=t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0141 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0142
     * @tc.name      FormExtAbility_FormStoreModelAdd_0142
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0142 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', '', false);
      logInfo(`add(formId=" x ", formName="", tempFlag=f...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="", tempFlag=f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="", tempFlag=f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="", tempFlag=f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId=" x ", formName="", tempFlag=f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0142 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0143
     * @tc.name      FormExtAbility_FormStoreModelAdd_0143
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="x", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0143 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'x', true);
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0143 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0144
     * @tc.name      FormExtAbility_FormStoreModelAdd_0144
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="x", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0144 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'x', false);
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0144 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0145
     * @tc.name      FormExtAbility_FormStoreModelAdd_0145
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="Hello", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0145 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'Hello', true);
      logInfo(`add(formId=" x ", formName="Hello", tempF...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="Hello", tempF...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="Hello", tempF...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="Hello", tempF...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId=" x ", formName="Hello", tempF...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0145 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0146
     * @tc.name      FormExtAbility_FormStoreModelAdd_0146
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="Hello", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0146 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'Hello', false);
      logInfo(`add(formId=" x ", formName="Hello", tempF...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="Hello", tempF...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="Hello", tempF...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="Hello", tempF...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId=" x ", formName="Hello", tempF...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0146 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0147
     * @tc.name      FormExtAbility_FormStoreModelAdd_0147
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="hello world", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0147 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'hello world', true);
      logInfo(`add(formId=" x ", formName="hello world",...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="hello world",...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="hello world",...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="hello world",...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId=" x ", formName="hello world",...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0147 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0148
     * @tc.name      FormExtAbility_FormStoreModelAdd_0148
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="hello world", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0148 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'hello world', false);
      logInfo(`add(formId=" x ", formName="hello world",...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="hello world",...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="hello world",...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="hello world",...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId=" x ", formName="hello world",...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0148 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0149
     * @tc.name      FormExtAbility_FormStoreModelAdd_0149
     * @tc.desc      FormStoreModel.add(formId=" x ", formName=" ", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0149 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', ' ', true);
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0149 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0150
     * @tc.name      FormExtAbility_FormStoreModelAdd_0150
     * @tc.desc      FormStoreModel.add(formId=" x ", formName=" ", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0150 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', ' ', false);
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0150 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0151
     * @tc.name      FormExtAbility_FormStoreModelAdd_0151
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="A", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0151 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'A', true);
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0151 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0152
     * @tc.name      FormExtAbility_FormStoreModelAdd_0152
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="A", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0152 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'A', false);
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0152 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0153
     * @tc.name      FormExtAbility_FormStoreModelAdd_0153
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="Sample Title 123", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0153 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'Sample Title 123', true);
      logInfo(`add(formId=" x ", formName="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="Sample Title ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="Sample Title ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="Sample Title ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId=" x ", formName="Sample Title ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0153 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0154
     * @tc.name      FormExtAbility_FormStoreModelAdd_0154
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="Sample Title 123", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0154 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'Sample Title 123', false);
      logInfo(`add(formId=" x ", formName="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="Sample Title ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="Sample Title ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="Sample Title ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId=" x ", formName="Sample Title ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0154 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0155
     * @tc.name      FormExtAbility_FormStoreModelAdd_0155
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="??", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0155 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', '\u4e2d\u6587', true);
      logInfo(`add(formId=" x ", formName="??", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="??", tempFlag...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="??", tempFlag...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="??", tempFlag...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId=" x ", formName="??", tempFlag...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0155 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0156
     * @tc.name      FormExtAbility_FormStoreModelAdd_0156
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="??", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0156 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', '\u4e2d\u6587', false);
      logInfo(`add(formId=" x ", formName="??", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="??", tempFlag...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="??", tempFlag...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="??", tempFlag...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId=" x ", formName="??", tempFlag...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0156 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0157
     * @tc.name      FormExtAbility_FormStoreModelAdd_0157
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="a", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0157 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'a', true);
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0157 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0158
     * @tc.name      FormExtAbility_FormStoreModelAdd_0158
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="a", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0158 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'a', false);
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0158 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0159
     * @tc.name      FormExtAbility_FormStoreModelAdd_0159
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="abc", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0159 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'abc', true);
      logInfo(`add(formId=" x ", formName="abc", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" x ", formName="abc", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="abc", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`add(formId=" x ", formName="abc", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId=" x ", formName="abc", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" x ", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0159 end`);
    });
  });
}
