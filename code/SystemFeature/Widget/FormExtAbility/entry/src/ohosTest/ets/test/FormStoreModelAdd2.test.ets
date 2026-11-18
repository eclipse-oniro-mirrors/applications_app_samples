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
export default function formStoreModelAdd2Test(): void {
  describe('FormStoreModelAdd2Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0054
     * @tc.name      FormExtAbility_FormStoreModelAdd_0054
     * @tc.desc      FormStoreModel.add(formId="a", formName="Sample Title 123", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0054 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'Sample Title 123', false);
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
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0055
     * @tc.name      FormExtAbility_FormStoreModelAdd_0055
     * @tc.desc      FormStoreModel.add(formId="a", formName="??", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0055 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', '\u4e2d\u6587', true);
      logInfo(`add(formId="a", formName="??", tempFlag=t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="??", tempFlag=t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="??", tempFlag=t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="??", tempFlag=t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="??", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="a", formName="??", tempFlag=t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="??", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0056
     * @tc.name      FormExtAbility_FormStoreModelAdd_0056
     * @tc.desc      FormStoreModel.add(formId="a", formName="??", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0056 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', '\u4e2d\u6587', false);
      logInfo(`add(formId="a", formName="??", tempFlag=f...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="??", tempFlag=f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="??", tempFlag=f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="??", tempFlag=f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="??", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="a", formName="??", tempFlag=f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="??", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0057
     * @tc.name      FormExtAbility_FormStoreModelAdd_0057
     * @tc.desc      FormStoreModel.add(formId="a", formName="a", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0057 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'a', true);
      logInfo(`add(formId="a", formName="a", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="a", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="a", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="a", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="a", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="a", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="a", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0058
     * @tc.name      FormExtAbility_FormStoreModelAdd_0058
     * @tc.desc      FormStoreModel.add(formId="a", formName="a", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0058 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'a', false);
      logInfo(`add(formId="a", formName="a", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="a", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="a", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="a", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="a", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="a", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="a", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0059
     * @tc.name      FormExtAbility_FormStoreModelAdd_0059
     * @tc.desc      FormStoreModel.add(formId="a", formName="abc", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0059 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'abc', true);
      logInfo(`add(formId="a", formName="abc", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="abc", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="abc", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="abc", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="abc", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="a", formName="abc", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="abc", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0060
     * @tc.name      FormExtAbility_FormStoreModelAdd_0060
     * @tc.desc      FormStoreModel.add(formId="a", formName="abc", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0060 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('a', 'abc', false);
      logInfo(`add(formId="a", formName="abc", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="a", formName="abc", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="a", formName="abc", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`add(formId="a", formName="abc", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="a", formName="abc", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="a", formName="abc", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="a", formName="abc", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0061
     * @tc.name      FormExtAbility_FormStoreModelAdd_0061
     * @tc.desc      FormStoreModel.add(formId="abc", formName="", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0061 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', '', true);
      logInfo(`add(formId="abc", formName="", tempFlag=t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="", tempFlag=t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="", tempFlag=t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="", tempFlag=t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="abc", formName="", tempFlag=t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="", tempFlag=t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0062
     * @tc.name      FormExtAbility_FormStoreModelAdd_0062
     * @tc.desc      FormStoreModel.add(formId="abc", formName="", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0062 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', '', false);
      logInfo(`add(formId="abc", formName="", tempFlag=f...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="", tempFlag=f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="", tempFlag=f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="", tempFlag=f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="abc", formName="", tempFlag=f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="", tempFlag=f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0063
     * @tc.name      FormExtAbility_FormStoreModelAdd_0063
     * @tc.desc      FormStoreModel.add(formId="abc", formName="x", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0063 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'x', true);
      logInfo(`add(formId="abc", formName="x", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="x", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="x", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="x", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="abc", formName="x", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0064
     * @tc.name      FormExtAbility_FormStoreModelAdd_0064
     * @tc.desc      FormStoreModel.add(formId="abc", formName="x", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0064 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'x', false);
      logInfo(`add(formId="abc", formName="x", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="x", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="x", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="x", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="abc", formName="x", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="x", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0065
     * @tc.name      FormExtAbility_FormStoreModelAdd_0065
     * @tc.desc      FormStoreModel.add(formId="abc", formName="Hello", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0065 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'Hello', true);
      logInfo(`add(formId="abc", formName="Hello", tempF...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="Hello", tempF...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="Hello", tempF...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="Hello", tempF...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="abc", formName="Hello", tempF...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0066
     * @tc.name      FormExtAbility_FormStoreModelAdd_0066
     * @tc.desc      FormStoreModel.add(formId="abc", formName="Hello", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0066 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'Hello', false);
      logInfo(`add(formId="abc", formName="Hello", tempF...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="Hello", tempF...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="Hello", tempF...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="Hello", tempF...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="abc", formName="Hello", tempF...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="Hello", tempF...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0067
     * @tc.name      FormExtAbility_FormStoreModelAdd_0067
     * @tc.desc      FormStoreModel.add(formId="abc", formName="hello world", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0067 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'hello world', true);
      logInfo(`add(formId="abc", formName="hello world",...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="hello world",...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="hello world",...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="hello world",...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="abc", formName="hello world",...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0068
     * @tc.name      FormExtAbility_FormStoreModelAdd_0068
     * @tc.desc      FormStoreModel.add(formId="abc", formName="hello world", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0068 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'hello world', false);
      logInfo(`add(formId="abc", formName="hello world",...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="hello world",...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="hello world",...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="hello world",...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="abc", formName="hello world",...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="hello world",...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0069
     * @tc.name      FormExtAbility_FormStoreModelAdd_0069
     * @tc.desc      FormStoreModel.add(formId="abc", formName=" ", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0069 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', ' ', true);
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0070
     * @tc.name      FormExtAbility_FormStoreModelAdd_0070
     * @tc.desc      FormStoreModel.add(formId="abc", formName=" ", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0070 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', ' ', false);
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName=" ", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0071
     * @tc.name      FormExtAbility_FormStoreModelAdd_0071
     * @tc.desc      FormStoreModel.add(formId="abc", formName="A", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0071 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'A', true);
      logInfo(`add(formId="abc", formName="A", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="A", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="A", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="A", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="abc", formName="A", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0072
     * @tc.name      FormExtAbility_FormStoreModelAdd_0072
     * @tc.desc      FormStoreModel.add(formId="abc", formName="A", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0072 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'A', false);
      logInfo(`add(formId="abc", formName="A", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="A", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="A", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="A", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="abc", formName="A", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="A", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0073
     * @tc.name      FormExtAbility_FormStoreModelAdd_0073
     * @tc.desc      FormStoreModel.add(formId="abc", formName="Sample Title 123", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0073 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'Sample Title 123', true);
      logInfo(`add(formId="abc", formName="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="Sample Title ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="Sample Title ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="Sample Title ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="abc", formName="Sample Title ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0074
     * @tc.name      FormExtAbility_FormStoreModelAdd_0074
     * @tc.desc      FormStoreModel.add(formId="abc", formName="Sample Title 123", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0074 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'Sample Title 123', false);
      logInfo(`add(formId="abc", formName="Sample Title ...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="Sample Title ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="Sample Title ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="Sample Title ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="abc", formName="Sample Title ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="Sample Title ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0075
     * @tc.name      FormExtAbility_FormStoreModelAdd_0075
     * @tc.desc      FormStoreModel.add(formId="abc", formName="??", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0075 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', '\u4e2d\u6587', true);
      logInfo(`add(formId="abc", formName="??", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="??", tempFlag...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="??", tempFlag...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="??", tempFlag...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="abc", formName="??", tempFlag...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0076
     * @tc.name      FormExtAbility_FormStoreModelAdd_0076
     * @tc.desc      FormStoreModel.add(formId="abc", formName="??", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0076 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', '\u4e2d\u6587', false);
      logInfo(`add(formId="abc", formName="??", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="??", tempFlag...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="??", tempFlag...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="??", tempFlag...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="abc", formName="??", tempFlag...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="??", tempFlag...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0077
     * @tc.name      FormExtAbility_FormStoreModelAdd_0077
     * @tc.desc      FormStoreModel.add(formId="abc", formName="a", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0077 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'a', true);
      logInfo(`add(formId="abc", formName="a", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="a", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="a", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="a", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="abc", formName="a", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0077 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0078
     * @tc.name      FormExtAbility_FormStoreModelAdd_0078
     * @tc.desc      FormStoreModel.add(formId="abc", formName="a", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0078 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'a', false);
      logInfo(`add(formId="abc", formName="a", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="a", tempFlag=...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="a", tempFlag=...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="a", tempFlag=...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="abc", formName="a", tempFlag=...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="a", tempFlag=...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0079
     * @tc.name      FormExtAbility_FormStoreModelAdd_0079
     * @tc.desc      FormStoreModel.add(formId="abc", formName="abc", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0079 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'abc', true);
      logInfo(`add(formId="abc", formName="abc", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="abc", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="abc", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="abc", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="abc", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0080
     * @tc.name      FormExtAbility_FormStoreModelAdd_0080
     * @tc.desc      FormStoreModel.add(formId="abc", formName="abc", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0080 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('abc', 'abc', false);
      logInfo(`add(formId="abc", formName="abc", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="abc", formName="abc", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="abc", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="abc", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="abc", formName="abc", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="abc", formName="abc", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0081
     * @tc.name      FormExtAbility_FormStoreModelAdd_0081
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0081 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', '', true);
      logInfo(`add(formId="Hello World", formName="", te...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="", te...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="", te...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="", te...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="", te...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="Hello World", formName="", te...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="", te...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0082
     * @tc.name      FormExtAbility_FormStoreModelAdd_0082
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0082 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', '', false);
      logInfo(`add(formId="Hello World", formName="", te...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="", te...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="", te...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="", te...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="", te...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId="Hello World", formName="", te...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="", te...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0083
     * @tc.name      FormExtAbility_FormStoreModelAdd_0083
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="x", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0083 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'x', true);
      logInfo(`add(formId="Hello World", formName="x", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="x", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="x", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="x", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="x", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="Hello World", formName="x", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="x", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0084
     * @tc.name      FormExtAbility_FormStoreModelAdd_0084
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="x", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0084 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'x', false);
      logInfo(`add(formId="Hello World", formName="x", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="x", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="x", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="x", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="x", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId="Hello World", formName="x", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="x", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0085
     * @tc.name      FormExtAbility_FormStoreModelAdd_0085
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="Hello", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0085 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'Hello', true);
      logInfo(`add(formId="Hello World", formName="Hello...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="Hello...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="Hello...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="Hello...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="Hello...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="Hello World", formName="Hello...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="Hello...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0086
     * @tc.name      FormExtAbility_FormStoreModelAdd_0086
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="Hello", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0086 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'Hello', false);
      logInfo(`add(formId="Hello World", formName="Hello...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="Hello...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="Hello...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="Hello...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="Hello...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId="Hello World", formName="Hello...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="Hello...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0087
     * @tc.name      FormExtAbility_FormStoreModelAdd_0087
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="hello world", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0087 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'hello world', true);
      logInfo(`add(formId="Hello World", formName="hello...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="hello...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="hello...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="hello...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="hello...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="Hello World", formName="hello...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="hello...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0088
     * @tc.name      FormExtAbility_FormStoreModelAdd_0088
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="hello world", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0088 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'hello world', false);
      logInfo(`add(formId="Hello World", formName="hello...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="hello...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="hello...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="hello...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="hello...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add(formId="Hello World", formName="hello...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="hello...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0089
     * @tc.name      FormExtAbility_FormStoreModelAdd_0089
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName=" ", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0089 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', ' ', true);
      logInfo(`add(formId="Hello World", formName=" ", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName=" ", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName=" ", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName=" ", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName=" ", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="Hello World", formName=" ", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName=" ", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0090
     * @tc.name      FormExtAbility_FormStoreModelAdd_0090
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName=" ", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0090 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', ' ', false);
      logInfo(`add(formId="Hello World", formName=" ", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName=" ", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName=" ", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName=" ", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName=" ", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`add(formId="Hello World", formName=" ", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName=" ", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0090 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0091
     * @tc.name      FormExtAbility_FormStoreModelAdd_0091
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="A", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0091 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'A', true);
      logInfo(`add(formId="Hello World", formName="A", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="A", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="A", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="A", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="A", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="Hello World", formName="A", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="A", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0091 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0092
     * @tc.name      FormExtAbility_FormStoreModelAdd_0092
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="A", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0092 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'A', false);
      logInfo(`add(formId="Hello World", formName="A", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="A", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="A", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="A", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="A", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add(formId="Hello World", formName="A", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="A", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0092 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0093
     * @tc.name      FormExtAbility_FormStoreModelAdd_0093
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="Sample Title 123", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0093 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'Sample Title 123', true);
      logInfo(`add(formId="Hello World", formName="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="Sampl...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="Sampl...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="Sampl...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="Sampl...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="Hello World", formName="Sampl...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="Sampl...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0093 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0094
     * @tc.name      FormExtAbility_FormStoreModelAdd_0094
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="Sample Title 123", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0094 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'Sample Title 123', false);
      logInfo(`add(formId="Hello World", formName="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="Sampl...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="Sampl...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="Sampl...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="Sampl...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add(formId="Hello World", formName="Sampl...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="Sampl...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0094 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0095
     * @tc.name      FormExtAbility_FormStoreModelAdd_0095
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="??", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0095 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', '\u4e2d\u6587', true);
      logInfo(`add(formId="Hello World", formName="??", ...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="??", ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="??", ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="??", ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="??", ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="Hello World", formName="??", ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="??", ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0095 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0096
     * @tc.name      FormExtAbility_FormStoreModelAdd_0096
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="??", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0096 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', '\u4e2d\u6587', false);
      logInfo(`add(formId="Hello World", formName="??", ...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="??", ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="??", ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="??", ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="??", ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add(formId="Hello World", formName="??", ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="??", ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0096 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0097
     * @tc.name      FormExtAbility_FormStoreModelAdd_0097
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="a", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0097 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'a', true);
      logInfo(`add(formId="Hello World", formName="a", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="a", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="a", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="a", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="a", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="Hello World", formName="a", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="a", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0097 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0098
     * @tc.name      FormExtAbility_FormStoreModelAdd_0098
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="a", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0098 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'a', false);
      logInfo(`add(formId="Hello World", formName="a", t...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="a", t...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="a", t...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="a", t...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="a", t...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add(formId="Hello World", formName="a", t...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="a", t...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0098 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0099
     * @tc.name      FormExtAbility_FormStoreModelAdd_0099
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="abc", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0099 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'abc', true);
      logInfo(`add(formId="Hello World", formName="abc",...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="abc",...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="abc",...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="abc",...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="abc",...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="Hello World", formName="abc",...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="abc",...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0099 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0100
     * @tc.name      FormExtAbility_FormStoreModelAdd_0100
     * @tc.desc      FormStoreModel.add(formId="Hello World", formName="abc", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0100 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add('Hello World', 'abc', false);
      logInfo(`add(formId="Hello World", formName="abc",...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId="Hello World", formName="abc",...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="abc",...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add(formId="Hello World", formName="abc",...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="abc",...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add(formId="Hello World", formName="abc",...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId="Hello World", formName="abc",...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0100 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0101
     * @tc.name      FormExtAbility_FormStoreModelAdd_0101
     * @tc.desc      FormStoreModel.add(formId=" ", formName="", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0101 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', '', true);
      logInfo(`add(formId=" ", formName="", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="", tempFlag=tru...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="", tempFlag=tru...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="", tempFlag=tru...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId=" ", formName="", tempFlag=tru...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="", tempFlag=tru...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0101 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0102
     * @tc.name      FormExtAbility_FormStoreModelAdd_0102
     * @tc.desc      FormStoreModel.add(formId=" ", formName="", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('FormExtAbility_FormStoreModelAdd_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0102 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', '', false);
      logInfo(`add(formId=" ", formName="", tempFlag=false): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="", tempFlag=fal...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="", tempFlag=fal...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="", tempFlag=fal...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`add(formId=" ", formName="", tempFlag=fal...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="", tempFlag=fal...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0102 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0103
     * @tc.name      FormExtAbility_FormStoreModelAdd_0103
     * @tc.desc      FormStoreModel.add(formId=" ", formName="x", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0103 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'x', true);
      logInfo(`add(formId=" ", formName="x", tempFlag=true): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="x", tempFlag=tr...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="x", tempFlag=tr...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="x", tempFlag=tr...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="x", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId=" ", formName="x", tempFlag=tr...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="x", tempFlag=tr...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0103 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0104
     * @tc.name      FormExtAbility_FormStoreModelAdd_0104
     * @tc.desc      FormStoreModel.add(formId=" ", formName="x", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormStoreModelAdd_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0104 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'x', false);
      logInfo(`add(formId=" ", formName="x", tempFlag=fa...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="x", tempFlag=fa...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="x", tempFlag=fa...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="x", tempFlag=fa...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="x", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["x"]');
      logInfo(`add(formId=" ", formName="x", tempFlag=fa...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="x", tempFlag=fa...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0104 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0105
     * @tc.name      FormExtAbility_FormStoreModelAdd_0105
     * @tc.desc      FormStoreModel.add(formId=" ", formName="Hello", tempFlag=true) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0105 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'Hello', true);
      logInfo(`add(formId=" ", formName="Hello", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="Hello", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="Hello", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="Hello", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="Hello", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId=" ", formName="Hello", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="Hello", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0105 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_ADD_0106
     * @tc.name      FormExtAbility_FormStoreModelAdd_0106
     * @tc.desc      FormStoreModel.add(formId=" ", formName="Hello", tempFlag=false) yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelAdd_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelAdd_0106 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.add(' ', 'Hello', false);
      logInfo(`add(formId=" ", formName="Hello", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`add(formId=" ", formName="Hello", tempFla...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="Hello", tempFla...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add(formId=" ", formName="Hello", tempFla...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="Hello", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`add(formId=" ", formName="Hello", tempFla...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add(formId=" ", formName="Hello", tempFla...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelAdd_0106 end`);
    });
  });
}
