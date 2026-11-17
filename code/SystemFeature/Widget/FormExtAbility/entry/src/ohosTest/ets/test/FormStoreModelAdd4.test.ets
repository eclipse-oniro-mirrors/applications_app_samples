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

/** Logic checks for FormStoreModel.add (41 cases). */
export default function formStoreModelAdd4Test(): void {
  describe('FormStoreModelAdd4Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0160
     * @tc.name      FormExtAbility_FormStoreModelAdd_0160
     * @tc.desc      FormStoreModel.add(formId=" x ", formName="abc", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0160 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' x ', 'abc', false);
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
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0160 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0161
     * @tc.name      FormExtAbility_FormStoreModelAdd_0161
     * @tc.desc      FormStoreModel.add(formId="xx", formName="", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0161 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', '', true);
      logInfo(`add(formId="xx", formName="", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="xx", formName="", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0161 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0162
     * @tc.name      FormExtAbility_FormStoreModelAdd_0162
     * @tc.desc      FormStoreModel.add(formId="xx", formName="", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0162 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', '', false);
      logInfo(`add(formId="xx", formName="", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="xx", formName="", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0162 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0163
     * @tc.name      FormExtAbility_FormStoreModelAdd_0163
     * @tc.desc      FormStoreModel.add(formId="xx", formName="x", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0163 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'x', true);
      logInfo(`add(formId="xx", formName="x", tempFlag=t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="x", tempFlag=t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="x", tempFlag=t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="x", tempFlag=t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="x", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="xx", formName="x", tempFlag=t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="x", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0163 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0164
     * @tc.name      FormExtAbility_FormStoreModelAdd_0164
     * @tc.desc      FormStoreModel.add(formId="xx", formName="x", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0164 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'x', false);
      logInfo(`add(formId="xx", formName="x", tempFlag=f...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="x", tempFlag=f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="x", tempFlag=f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="x", tempFlag=f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="x", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="xx", formName="x", tempFlag=f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="x", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0164 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0165
     * @tc.name      FormExtAbility_FormStoreModelAdd_0165
     * @tc.desc      FormStoreModel.add(formId="xx", formName="Hello", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0165 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'Hello', true);
      logInfo(`add(formId="xx", formName="Hello", tempFl...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="Hello", tempFl...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="Hello", tempFl...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="Hello", tempFl...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="Hello", tempFl...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="xx", formName="Hello", tempFl...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="Hello", tempFl...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0165 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0166
     * @tc.name      FormExtAbility_FormStoreModelAdd_0166
     * @tc.desc      FormStoreModel.add(formId="xx", formName="Hello", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0166 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'Hello', false);
      logInfo(`add(formId="xx", formName="Hello", tempFl...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="Hello", tempFl...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="Hello", tempFl...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="Hello", tempFl...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="Hello", tempFl...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="xx", formName="Hello", tempFl...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="Hello", tempFl...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0166 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0167
     * @tc.name      FormExtAbility_FormStoreModelAdd_0167
     * @tc.desc      FormStoreModel.add(formId="xx", formName="hello world", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0167 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'hello world', true);
      logInfo(`add(formId="xx", formName="hello world", ...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="hello world", ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="hello world", ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="hello world", ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="hello world", ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="xx", formName="hello world", ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="hello world", ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0167 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0168
     * @tc.name      FormExtAbility_FormStoreModelAdd_0168
     * @tc.desc      FormStoreModel.add(formId="xx", formName="hello world", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0168 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'hello world', false);
      logInfo(`add(formId="xx", formName="hello world", ...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="hello world", ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="hello world", ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="hello world", ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="hello world", ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="xx", formName="hello world", ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="hello world", ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0168 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0169
     * @tc.name      FormExtAbility_FormStoreModelAdd_0169
     * @tc.desc      FormStoreModel.add(formId="xx", formName=" ", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0169 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', ' ', true);
      logInfo(`add(formId="xx", formName=" ", tempFlag=t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName=" ", tempFlag=t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName=" ", tempFlag=t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName=" ", tempFlag=t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName=" ", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="xx", formName=" ", tempFlag=t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName=" ", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0169 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0170
     * @tc.name      FormExtAbility_FormStoreModelAdd_0170
     * @tc.desc      FormStoreModel.add(formId="xx", formName=" ", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0170 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', ' ', false);
      logInfo(`add(formId="xx", formName=" ", tempFlag=f...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName=" ", tempFlag=f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName=" ", tempFlag=f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName=" ", tempFlag=f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName=" ", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="xx", formName=" ", tempFlag=f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName=" ", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0170 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0171
     * @tc.name      FormExtAbility_FormStoreModelAdd_0171
     * @tc.desc      FormStoreModel.add(formId="xx", formName="A", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0171 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'A', true);
      logInfo(`add(formId="xx", formName="A", tempFlag=t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="A", tempFlag=t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="A", tempFlag=t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="A", tempFlag=t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="A", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="xx", formName="A", tempFlag=t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="A", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0171 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0172
     * @tc.name      FormExtAbility_FormStoreModelAdd_0172
     * @tc.desc      FormStoreModel.add(formId="xx", formName="A", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0172 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'A', false);
      logInfo(`add(formId="xx", formName="A", tempFlag=f...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="A", tempFlag=f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="A", tempFlag=f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="A", tempFlag=f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="A", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="xx", formName="A", tempFlag=f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="A", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0172 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0173
     * @tc.name      FormExtAbility_FormStoreModelAdd_0173
     * @tc.desc      FormStoreModel.add(formId="xx", formName="Sample Title 123", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0173 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'Sample Title 123', true);
      logInfo(`add(formId="xx", formName="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="Sample Title 1...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="Sample Title 1...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="Sample Title 1...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="Sample Title 1...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="xx", formName="Sample Title 1...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="Sample Title 1...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0173 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0174
     * @tc.name      FormExtAbility_FormStoreModelAdd_0174
     * @tc.desc      FormStoreModel.add(formId="xx", formName="Sample Title 123", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0174 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'Sample Title 123', false);
      logInfo(`add(formId="xx", formName="Sample Title 1...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="Sample Title 1...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="Sample Title 1...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="Sample Title 1...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="Sample Title 1...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="xx", formName="Sample Title 1...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="Sample Title 1...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0174 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0175
     * @tc.name      FormExtAbility_FormStoreModelAdd_0175
     * @tc.desc      FormStoreModel.add(formId="xx", formName="??", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0175 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', '\u4e2d\u6587', true);
      logInfo(`add(formId="xx", formName="??", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="??", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="??", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="??", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="??", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="xx", formName="??", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="??", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0175 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0176
     * @tc.name      FormExtAbility_FormStoreModelAdd_0176
     * @tc.desc      FormStoreModel.add(formId="xx", formName="??", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0176 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', '\u4e2d\u6587', false);
      logInfo(`add(formId="xx", formName="??", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="??", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="??", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="??", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="??", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="xx", formName="??", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="??", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0176 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0177
     * @tc.name      FormExtAbility_FormStoreModelAdd_0177
     * @tc.desc      FormStoreModel.add(formId="xx", formName="a", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0177 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'a', true);
      logInfo(`add(formId="xx", formName="a", tempFlag=t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="a", tempFlag=t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="a", tempFlag=t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="a", tempFlag=t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="a", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="xx", formName="a", tempFlag=t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="a", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0177 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0178
     * @tc.name      FormExtAbility_FormStoreModelAdd_0178
     * @tc.desc      FormStoreModel.add(formId="xx", formName="a", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0178 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'a', false);
      logInfo(`add(formId="xx", formName="a", tempFlag=f...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="a", tempFlag=f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="a", tempFlag=f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="a", tempFlag=f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="a", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="xx", formName="a", tempFlag=f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="a", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0178 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0179
     * @tc.name      FormExtAbility_FormStoreModelAdd_0179
     * @tc.desc      FormStoreModel.add(formId="xx", formName="abc", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0179 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'abc', true);
      logInfo(`add(formId="xx", formName="abc", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="abc", tempFlag...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="abc", tempFlag...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="abc", tempFlag...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="abc", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="xx", formName="abc", tempFlag...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="abc", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0179 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0180
     * @tc.name      FormExtAbility_FormStoreModelAdd_0180
     * @tc.desc      FormStoreModel.add(formId="xx", formName="abc", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0180 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('xx', 'abc', false);
      logInfo(`add(formId="xx", formName="abc", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="xx", formName="abc", tempFlag...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="abc", tempFlag...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xx"]');
      logInfo(`add(formId="xx", formName="abc", tempFlag...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="abc", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="xx", formName="abc", tempFlag...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="xx", formName="abc", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0180 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0181
     * @tc.name      FormExtAbility_FormStoreModelAdd_0181
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0181 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', '', true);
      logInfo(`add(formId="x_1", formName="", tempFlag=t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="", tempFlag=t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="", tempFlag=t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="", tempFlag=t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="x_1", formName="", tempFlag=t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0181 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0182
     * @tc.name      FormExtAbility_FormStoreModelAdd_0182
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0182 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', '', false);
      logInfo(`add(formId="x_1", formName="", tempFlag=f...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="", tempFlag=f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="", tempFlag=f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="", tempFlag=f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="x_1", formName="", tempFlag=f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0182 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0183
     * @tc.name      FormExtAbility_FormStoreModelAdd_0183
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="x", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0183 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'x', true);
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0183 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0184
     * @tc.name      FormExtAbility_FormStoreModelAdd_0184
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="x", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0184 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'x', false);
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0184 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0185
     * @tc.name      FormExtAbility_FormStoreModelAdd_0185
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="Hello", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0185 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'Hello', true);
      logInfo(`add(formId="x_1", formName="Hello", tempF...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="Hello", tempF...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="Hello", tempF...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="Hello", tempF...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="x_1", formName="Hello", tempF...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0185 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0186
     * @tc.name      FormExtAbility_FormStoreModelAdd_0186
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="Hello", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0186 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'Hello', false);
      logInfo(`add(formId="x_1", formName="Hello", tempF...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="Hello", tempF...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="Hello", tempF...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="Hello", tempF...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="x_1", formName="Hello", tempF...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0186 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0187
     * @tc.name      FormExtAbility_FormStoreModelAdd_0187
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="hello world", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0187 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'hello world', true);
      logInfo(`add(formId="x_1", formName="hello world",...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="hello world",...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="hello world",...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="hello world",...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="x_1", formName="hello world",...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0187 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0188
     * @tc.name      FormExtAbility_FormStoreModelAdd_0188
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="hello world", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0188 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'hello world', false);
      logInfo(`add(formId="x_1", formName="hello world",...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="hello world",...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="hello world",...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="hello world",...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="x_1", formName="hello world",...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0188 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0189
     * @tc.name      FormExtAbility_FormStoreModelAdd_0189
     * @tc.desc      FormStoreModel.add(formId="x_1", formName=" ", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0189 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', ' ', true);
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0189 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0190
     * @tc.name      FormExtAbility_FormStoreModelAdd_0190
     * @tc.desc      FormStoreModel.add(formId="x_1", formName=" ", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0190 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', ' ', false);
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0190 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0191
     * @tc.name      FormExtAbility_FormStoreModelAdd_0191
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="A", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0191 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'A', true);
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0191 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0192
     * @tc.name      FormExtAbility_FormStoreModelAdd_0192
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="A", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0192 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'A', false);
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0192 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0193
     * @tc.name      FormExtAbility_FormStoreModelAdd_0193
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="Sample Title 123", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0193 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'Sample Title 123', true);
      logInfo(`add(formId="x_1", formName="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="Sample Title ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="Sample Title ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="Sample Title ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="x_1", formName="Sample Title ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0193 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0194
     * @tc.name      FormExtAbility_FormStoreModelAdd_0194
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="Sample Title 123", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0194 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'Sample Title 123', false);
      logInfo(`add(formId="x_1", formName="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="Sample Title ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="Sample Title ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="Sample Title ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="x_1", formName="Sample Title ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0194 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0195
     * @tc.name      FormExtAbility_FormStoreModelAdd_0195
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="??", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0195 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', '\u4e2d\u6587', true);
      logInfo(`add(formId="x_1", formName="??", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="??", tempFlag...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="??", tempFlag...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="??", tempFlag...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="x_1", formName="??", tempFlag...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0195 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0196
     * @tc.name      FormExtAbility_FormStoreModelAdd_0196
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="??", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0196 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', '\u4e2d\u6587', false);
      logInfo(`add(formId="x_1", formName="??", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="??", tempFlag...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="??", tempFlag...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="??", tempFlag...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="x_1", formName="??", tempFlag...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0196 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0197
     * @tc.name      FormExtAbility_FormStoreModelAdd_0197
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="a", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0197 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'a', true);
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0197 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0198
     * @tc.name      FormExtAbility_FormStoreModelAdd_0198
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="a", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0198 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'a', false);
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0198 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0199
     * @tc.name      FormExtAbility_FormStoreModelAdd_0199
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="abc", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0199 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'abc', true);
      logInfo(`add(formId="x_1", formName="abc", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="abc", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="abc", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="abc", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="x_1", formName="abc", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0199 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0200
     * @tc.name      FormExtAbility_FormStoreModelAdd_0200
     * @tc.desc      FormStoreModel.add(formId="x_1", formName="abc", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0200 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('x_1', 'abc', false);
      logInfo(`add(formId="x_1", formName="abc", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="x_1", formName="abc", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="abc", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`add(formId="x_1", formName="abc", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="x_1", formName="abc", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="x_1", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0200 end`);
    });
  });
}
