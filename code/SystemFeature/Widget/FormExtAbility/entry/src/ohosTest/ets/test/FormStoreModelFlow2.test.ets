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

/** Logic checks for FormStoreModel flow (43 cases). */
export default function formStoreModelFlow2Test(): void {
  describe('FormStoreModelFlow2Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0046
     * @tc.name      FormExtAbility_FormStoreModelFlow_0046
     * @tc.desc      FormStoreModel call flow update > remove > add > update > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0046 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('x');
      logInfo(`step1 update("x"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.remove('Hello WorldHello World');
      logInfo(`step2 remove("Hello WorldHello World"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.add('a', 'Hello', true);
      logInfo(`step3 add("a", "Hello", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('x_1');
      logInfo(`step4 update("x_1"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: number = subject.remove('  ');
      logInfo(`step5 remove("  "): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`update>remove>add>update>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`update>remove>add>update>remove final: JSON.stringify(subject.for...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x","a","x_1"]');
      logInfo(`update>remove>add>update>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`update>remove>add>update>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","Hello",""]');
      logInfo(`update>remove>add>update>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`update>remove>add>update>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0047
     * @tc.name      FormExtAbility_FormStoreModelFlow_0047
     * @tc.desc      FormStoreModel call flow remove > add > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0047 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('2R');
      logInfo(`step1 remove("2R"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.add(' ', '\u4e2d\u6587', false);
      logInfo(`step2 add(" ", "??", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.countOf('FJaDB7J');
      logInfo(`step3 countOf("FJaDB7J"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`remove>add>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>add>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`remove>add>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>add>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`remove>add>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>add>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0048
     * @tc.name      FormExtAbility_FormStoreModelFlow_0048
     * @tc.desc      FormStoreModel call flow castToNormal > add > countOf > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0048 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('mtf5i9');
      logInfo(`step1 castToNormal("mtf5i9"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add(' ', 'A', false);
      logInfo(`step2 add(" ", "A", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.countOf('123_1');
      logInfo(`step3 countOf("123_1"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.countOf('Hello WorldHello World');
      logInfo(`step4 countOf("Hello WorldHello World"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`castToNormal>add>countOf>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>add>countOf>countOf final: JSON.stringify(subject.fo...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`castToNormal>add>countOf>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>add>countOf>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`castToNormal>add>countOf>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>add>countOf>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0049
     * @tc.name      FormExtAbility_FormStoreModelFlow_0049
     * @tc.desc      FormStoreModel call flow countOf > castToNormal > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0049 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('tra2Ozfs');
      logInfo(`step1 countOf("tra2Ozfs"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.castToNormal('TbK40xHRY4J');
      logInfo(`step2 castToNormal("TbK40xHRY4J"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.add('xa', 'Hello', false);
      logInfo(`step3 add("xa", "Hello", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      logInfo(`countOf>castToNormal>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>castToNormal>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xa"]');
      logInfo(`countOf>castToNormal>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>castToNormal>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`countOf>castToNormal>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>castToNormal>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0050
     * @tc.name      FormExtAbility_FormStoreModelFlow_0050
     * @tc.desc      FormStoreModel call flow castToNormal > remove > update > remove > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0050 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('x123');
      logInfo(`step1 castToNormal("x123"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.remove('123');
      logInfo(`step2 remove("123"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.update('U');
      logInfo(`step3 update("U"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.remove('567dEJ7n');
      logInfo(`step4 remove("567dEJ7n"): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.add('Hello World', '\u4e2d\u6587', true);
      logInfo(`step5 add("Hello World", "??", true): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`castToNormal>remove>update>remove>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`castToNormal>remove>update>remove>add final: JSON.stringify(subje...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["U","Hello World"]');
      logInfo(`castToNormal>remove>update>remove>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`castToNormal>remove>update>remove>add final: JSON.stringify(subject...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","\u4e2d\u6587"]');
      logInfo(`castToNormal>remove>update>remove>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`castToNormal>remove>update>remove>add final: JSON.stringify(subject...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0051
     * @tc.name      FormExtAbility_FormStoreModelFlow_0051
     * @tc.desc      FormStoreModel call flow update > add > castToNormal > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0051 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('z8tV4RGeuP7');
      logInfo(`step1 update("z8tV4RGeuP7"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add('Hello World', 'abc', false);
      logInfo(`step2 add("Hello World", "abc", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('UCFxZV');
      logInfo(`step3 castToNormal("UCFxZV"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.countOf('abcabc');
      logInfo(`step4 countOf("abcabc"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`update>add>castToNormal>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`update>add>castToNormal>countOf final: JSON.stringify(subject.for...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["z8tV4RGeuP7","Hello World"]');
      logInfo(`update>add>castToNormal>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`update>add>castToNormal>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","abc"]');
      logInfo(`update>add>castToNormal>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`update>add>castToNormal>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0052
     * @tc.name      FormExtAbility_FormStoreModelFlow_0052
     * @tc.desc      FormStoreModel call flow castToNormal > countOf > add > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0052 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('xa');
      logInfo(`step1 castToNormal("xa"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.countOf('FTWo');
      logInfo(`step2 countOf("FTWo"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.add('', 'a', false);
      logInfo(`step3 add("", "a", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update(' x ');
      logInfo(`step4 update(" x "): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: string = subject.update('AHmQ');
      logInfo(`step5 update("AHmQ"): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`castToNormal>countOf>add>update>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`castToNormal>countOf>add>update>update final: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""," x ","AHmQ"]');
      logInfo(`castToNormal>countOf>add>update>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`castToNormal>countOf>add>update>update final: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a","",""]');
      logInfo(`castToNormal>countOf>add>update>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`castToNormal>countOf>add>update>update final: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0053
     * @tc.name      FormExtAbility_FormStoreModelFlow_0053
     * @tc.desc      FormStoreModel call flow add > update > castToNormal > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0053 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('123', 'Hello', false);
      logInfo(`step1 add("123", "Hello", false): step1=${step1}`);
      expect(step1).assertEqual('13');
      const step2: string = subject.update('D');
      logInfo(`step2 update("D"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('Hello WorldHello World');
      logInfo(`step3 castToNormal("Hello WorldHello World"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.remove('SZW8Qo7u3h');
      logInfo(`step4 remove("SZW8Qo7u3h"): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`add>update>castToNormal>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>update>castToNormal>remove final: JSON.stringify(subject.form...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123","D"]');
      logInfo(`add>update>castToNormal>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>update>castToNormal>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello",""]');
      logInfo(`add>update>castToNormal>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>update>castToNormal>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0054
     * @tc.name      FormExtAbility_FormStoreModelFlow_0054
     * @tc.desc      FormStoreModel call flow castToNormal > update > update > add > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0054 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('Hello World_1');
      logInfo(`step1 castToNormal("Hello World_1"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.update(' abc ');
      logInfo(`step2 update(" abc "): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.update(' x ');
      logInfo(`step3 update(" x "): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.add('123', 'hello world', false);
      logInfo(`step4 add("123", "hello world", false): step4=${step4}`);
      expect(step4).assertEqual('13');
      const step5: string = subject.update('xmcsPKMRBBav');
      logInfo(`step5 update("xmcsPKMRBBav"): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`castToNormal>update>update>add>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(4);
      logInfo(`castToNormal>update>update>add>update final: JSON.stringify(subje...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" abc "," x ","123","xmcsPKMRBBav"]');
      logInfo(`castToNormal>update>update>add>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(4);
      logInfo(`castToNormal>update>update>add>update final: JSON.stringify(subject...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","","hello world",""]');
      logInfo(`castToNormal>update>update>add>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(4);
      logInfo(`castToNormal>update>update>add>update final: JSON.stringify(subject...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0055
     * @tc.name      FormExtAbility_FormStoreModelFlow_0055
     * @tc.desc      FormStoreModel call flow remove > countOf > add > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0055 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('Hello WorldHello World');
      logInfo(`step1 remove("Hello WorldHello World"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.countOf('  ');
      logInfo(`step2 countOf("  "): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.add('', 'A', true);
      logInfo(`step3 add("", "A", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.countOf('ZTO8I20yqH');
      logInfo(`step4 countOf("ZTO8I20yqH"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`remove>countOf>add>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>countOf>add>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`remove>countOf>add>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>countOf>add>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`remove>countOf>add>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>countOf>add>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0056
     * @tc.name      FormExtAbility_FormStoreModelFlow_0056
     * @tc.desc      FormStoreModel call flow castToNormal > remove > update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0056 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('123');
      logInfo(`step1 castToNormal("123"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.remove('q');
      logInfo(`step2 remove("q"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.update('VXg0loyRr8IT');
      logInfo(`step3 update("VXg0loyRr8IT"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: boolean = subject.castToNormal('FwCK');
      logInfo(`step4 castToNormal("FwCK"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`castToNormal>remove>update>castToNormal f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>remove>update>castToNormal f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["VXg0loyRr8IT"]');
      logInfo(`castToNormal>remove>update>castToNormal f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>remove>update>castToNormal f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>remove>update>castToNormal f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>remove>update>castToNormal f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0057
     * @tc.name      FormExtAbility_FormStoreModelFlow_0057
     * @tc.desc      FormStoreModel call flow castToNormal > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0057 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal(' Hello World ');
      logInfo(`step1 castToNormal(" Hello World "): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.update('KeZBzgpEzO');
      logInfo(`step2 update("KeZBzgpEzO"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`castToNormal>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["KeZBzgpEzO"]');
      logInfo(`castToNormal>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0058
     * @tc.name      FormExtAbility_FormStoreModelFlow_0058
     * @tc.desc      FormStoreModel call flow castToNormal > remove > update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0058 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('q7');
      logInfo(`step1 castToNormal("q7"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.remove('Q');
      logInfo(`step2 remove("Q"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.update('Hello World');
      logInfo(`step3 update("Hello World"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: boolean = subject.castToNormal('aa');
      logInfo(`step4 castToNormal("aa"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`castToNormal>remove>update>castToNormal f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>remove>update>castToNormal f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`castToNormal>remove>update>castToNormal f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>remove>update>castToNormal f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>remove>update>castToNormal f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>remove>update>castToNormal f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0059
     * @tc.name      FormExtAbility_FormStoreModelFlow_0059
     * @tc.desc      FormStoreModel call flow add > countOf > castToNormal > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0059 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('a_1', 'a', true);
      logInfo(`step1 add("a_1", "a", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('XsEAwD');
      logInfo(`step2 countOf("XsEAwD"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.castToNormal('q7');
      logInfo(`step3 castToNormal("q7"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.add(' a ', 'A', true);
      logInfo(`step4 add(" a ", "A", true): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`add>countOf>castToNormal>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>countOf>castToNormal>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1"," a "]');
      logInfo(`add>countOf>castToNormal>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>countOf>castToNormal>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a","A"]');
      logInfo(`add>countOf>castToNormal>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>countOf>castToNormal>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0060
     * @tc.name      FormExtAbility_FormStoreModelFlow_0060
     * @tc.desc      FormStoreModel call flow add > update > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0060 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('a', 'abc', false);
      logInfo(`step1 add("a", "abc", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update('6tTvXkLFOLq6');
      logInfo(`step2 update("6tTvXkLFOLq6"): step2=${step2}`);
      expect(step2).assertEqual('15');
      const step3: number = subject.countOf('7Cj');
      logInfo(`step3 countOf("7Cj"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`add>update>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>update>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a","6tTvXkLFOLq6"]');
      logInfo(`add>update>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>update>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc",""]');
      logInfo(`add>update>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>update>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0061
     * @tc.name      FormExtAbility_FormStoreModelFlow_0061
     * @tc.desc      FormStoreModel call flow add > update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0061 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('', '\u4e2d\u6587', true);
      logInfo(`step1 add("", "??", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update('NH4JDit5');
      logInfo(`step2 update("NH4JDit5"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('BJsEI4');
      logInfo(`step3 castToNormal("BJsEI4"): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`add>update>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>update>castToNormal final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["","NH4JDit5"]');
      logInfo(`add>update>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>update>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587",""]');
      logInfo(`add>update>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>update>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0062
     * @tc.name      FormExtAbility_FormStoreModelFlow_0062
     * @tc.desc      FormStoreModel call flow remove > castToNormal > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0062 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('qFXwzIkX4NLc');
      logInfo(`step1 remove("qFXwzIkX4NLc"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.castToNormal(' 123 ');
      logInfo(`step2 castToNormal(" 123 "): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.add('Hello World', 'Hello World', false);
      logInfo(`step3 add("Hello World", "Hello World", f...: step3=${step3}`);
      expect(step3).assertEqual('NaN');
      logInfo(`remove>castToNormal>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>castToNormal>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`remove>castToNormal>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>castToNormal>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello World"]');
      logInfo(`remove>castToNormal>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>castToNormal>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0063
     * @tc.name      FormExtAbility_FormStoreModelFlow_0063
     * @tc.desc      FormStoreModel call flow remove > remove > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0063 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('KMOQhOoGYH7G');
      logInfo(`step1 remove("KMOQhOoGYH7G"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.remove('XmQQC');
      logInfo(`step2 remove("XmQQC"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.countOf('9j');
      logInfo(`step3 countOf("9j"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0064
     * @tc.name      FormExtAbility_FormStoreModelFlow_0064
     * @tc.desc      FormStoreModel call flow countOf > castToNormal > countOf > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0064 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('Hello World');
      logInfo(`step1 countOf("Hello World"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.castToNormal('1');
      logInfo(`step2 castToNormal("1"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.countOf('Kfhp9B5');
      logInfo(`step3 countOf("Kfhp9B5"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.remove('f');
      logInfo(`step4 remove("f"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0065
     * @tc.name      FormExtAbility_FormStoreModelFlow_0065
     * @tc.desc      FormStoreModel call flow castToNormal > add > castToNormal > add > castToNormal keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0065 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('kJ');
      logInfo(`step1 castToNormal("kJ"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add('a_1', ' ', false);
      logInfo(`step2 add("a_1", " ", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('xA5O7');
      logInfo(`step3 castToNormal("xA5O7"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.add('a', 'Sample Title 123', true);
      logInfo(`step4 add("a", "Sample Title 123", true): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: boolean = subject.castToNormal('UCFxZV');
      logInfo(`step5 castToNormal("UCFxZV"): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`castToNormal>add>castToNormal>add>castToN...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`castToNormal>add>castToNormal>add>castToN...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1","a"]');
      logInfo(`castToNormal>add>castToNormal>add>castToN...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`castToNormal>add>castToNormal>add>castToN...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" ","Sample Title 123"]');
      logInfo(`castToNormal>add>castToNormal>add>castToN...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`castToNormal>add>castToNormal>add>castToN...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0066
     * @tc.name      FormExtAbility_FormStoreModelFlow_0066
     * @tc.desc      FormStoreModel call flow add > add > castToNormal > countOf > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0066 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('Hello World', 'Hello', true);
      logInfo(`step1 add("Hello World", "Hello", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add('a', 'abc', false);
      logInfo(`step2 add("a", "abc", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('x ');
      logInfo(`step3 castToNormal("x "): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.countOf('ghyC84jyJ');
      logInfo(`step4 countOf("ghyC84jyJ"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: boolean = subject.castToNormal('   ');
      logInfo(`step5 castToNormal("   "): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`add>add>castToNormal>countOf>castToNormal...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>add>castToNormal>countOf>castToNormal...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World","a"]');
      logInfo(`add>add>castToNormal>countOf>castToNormal...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>add>castToNormal>countOf>castToNormal...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello","abc"]');
      logInfo(`add>add>castToNormal>countOf>castToNormal...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>add>castToNormal>countOf>castToNormal...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0067
     * @tc.name      FormExtAbility_FormStoreModelFlow_0067
     * @tc.desc      FormStoreModel call flow update > castToNormal > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0067 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('t6g');
      logInfo(`step1 update("t6g"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('abc_1');
      logInfo(`step2 castToNormal("abc_1"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.update('  ');
      logInfo(`step3 update("  "): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('123');
      logInfo(`step4 update("123"): step4=${step4}`);
      expect(step4).assertEqual('12');
      logInfo(`update>castToNormal>update>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`update>castToNormal>update>update final: JSON.stringify(subject.f...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["t6g","  ","123"]');
      logInfo(`update>castToNormal>update>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`update>castToNormal>update>update final: JSON.stringify(subject.nam...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","",""]');
      logInfo(`update>castToNormal>update>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`update>castToNormal>update>update final: JSON.stringify(subject.tem...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0068
     * @tc.name      FormExtAbility_FormStoreModelFlow_0068
     * @tc.desc      FormStoreModel call flow remove > countOf > castToNormal > remove > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0068 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('tF');
      logInfo(`step1 remove("tF"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.countOf('7HFyKzJ1q4');
      logInfo(`step2 countOf("7HFyKzJ1q4"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.castToNormal('Hello World');
      logInfo(`step3 castToNormal("Hello World"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.remove('HhYyo');
      logInfo(`step4 remove("HhYyo"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.update('U');
      logInfo(`step5 update("U"): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`remove>countOf>castToNormal>remove>update...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>countOf>castToNormal>remove>update...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["U"]');
      logInfo(`remove>countOf>castToNormal>remove>update...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>countOf>castToNormal>remove>update...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`remove>countOf>castToNormal>remove>update...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>countOf>castToNormal>remove>update...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0069
     * @tc.name      FormExtAbility_FormStoreModelFlow_0069
     * @tc.desc      FormStoreModel call flow countOf > update > castToNormal > castToNormal > castToNormal keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0069 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('ZTO8I20yqH');
      logInfo(`step1 countOf("ZTO8I20yqH"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.update('AHmQ');
      logInfo(`step2 update("AHmQ"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal(' ');
      logInfo(`step3 castToNormal(" "): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.castToNormal('TbK40xHRY4J');
      logInfo(`step4 castToNormal("TbK40xHRY4J"): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.castToNormal('IL6x4S2CE');
      logInfo(`step5 castToNormal("IL6x4S2CE"): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`countOf>update>castToNormal>castToNormal>...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>update>castToNormal>castToNormal>...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["AHmQ"]');
      logInfo(`countOf>update>castToNormal>castToNormal>...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>update>castToNormal>castToNormal>...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`countOf>update>castToNormal>castToNormal>...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>update>castToNormal>castToNormal>...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0070
     * @tc.name      FormExtAbility_FormStoreModelFlow_0070
     * @tc.desc      FormStoreModel call flow add > castToNormal > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0070 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('a_1', 'a', false);
      logInfo(`step1 add("a_1", "a", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('   ');
      logInfo(`step2 castToNormal("   "): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.remove('wzLcpu');
      logInfo(`step3 remove("wzLcpu"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`add>castToNormal>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>castToNormal>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1"]');
      logInfo(`add>castToNormal>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>castToNormal>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add>castToNormal>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>castToNormal>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0071
     * @tc.name      FormExtAbility_FormStoreModelFlow_0071
     * @tc.desc      FormStoreModel call flow castToNormal > update > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0071 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal(' 123 ');
      logInfo(`step1 castToNormal(" 123 "): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.update('aa');
      logInfo(`step2 update("aa"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('Q');
      logInfo(`step3 remove("Q"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`castToNormal>update>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>update>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["aa"]');
      logInfo(`castToNormal>update>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>update>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>update>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>update>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0072
     * @tc.name      FormExtAbility_FormStoreModelFlow_0072
     * @tc.desc      FormStoreModel call flow countOf > countOf > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0072 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('xa');
      logInfo(`step1 countOf("xa"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.countOf('aa');
      logInfo(`step2 countOf("aa"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.remove('abc');
      logInfo(`step3 remove("abc"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0073
     * @tc.name      FormExtAbility_FormStoreModelFlow_0073
     * @tc.desc      FormStoreModel call flow countOf > castToNormal > add > countOf > castToNormal keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0073 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf(' 123 ');
      logInfo(`step1 countOf(" 123 "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.castToNormal('vW');
      logInfo(`step2 castToNormal("vW"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.add('abc', 'Hello World', true);
      logInfo(`step3 add("abc", "Hello World", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.countOf('DqKu');
      logInfo(`step4 countOf("DqKu"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: boolean = subject.castToNormal('kJ');
      logInfo(`step5 castToNormal("kJ"): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`countOf>castToNormal>add>countOf>castToNo...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>castToNormal>add>countOf>castToNo...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`countOf>castToNormal>add>countOf>castToNo...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>castToNormal>add>countOf>castToNo...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello World"]');
      logInfo(`countOf>castToNormal>add>countOf>castToNo...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>castToNormal>add>countOf>castToNo...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0074
     * @tc.name      FormExtAbility_FormStoreModelFlow_0074
     * @tc.desc      FormStoreModel call flow update > countOf > countOf > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0074 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('pIqgd4zxme');
      logInfo(`step1 update("pIqgd4zxme"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('vF');
      logInfo(`step2 countOf("vF"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.countOf('nT1rS');
      logInfo(`step3 countOf("nT1rS"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: boolean = subject.castToNormal('NDciy');
      logInfo(`step4 castToNormal("NDciy"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`update>countOf>countOf>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>countOf>countOf>castToNormal final: JSON.stringify(subject...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["pIqgd4zxme"]');
      logInfo(`update>countOf>countOf>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>countOf>countOf>castToNormal final: JSON.stringify(subject.n...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>countOf>countOf>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>countOf>countOf>castToNormal final: JSON.stringify(subject.t...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0075
     * @tc.name      FormExtAbility_FormStoreModelFlow_0075
     * @tc.desc      FormStoreModel call flow update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0075 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('XTx81V');
      logInfo(`step1 update("XTx81V"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('1');
      logInfo(`step2 castToNormal("1"): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`update>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["XTx81V"]');
      logInfo(`update>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0076
     * @tc.name      FormExtAbility_FormStoreModelFlow_0076
     * @tc.desc      FormStoreModel call flow update > countOf > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0076 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update(' ');
      logInfo(`step1 update(" "): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('NSEpMG');
      logInfo(`step2 countOf("NSEpMG"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.remove('Avaw');
      logInfo(`step3 remove("Avaw"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`update>countOf>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>countOf>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`update>countOf>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>countOf>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>countOf>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>countOf>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0077
     * @tc.name      FormExtAbility_FormStoreModelFlow_0077
     * @tc.desc      FormStoreModel call flow add > castToNormal > remove > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0077 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('', 'a', false);
      logInfo(`step1 add("", "a", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('mpi');
      logInfo(`step2 castToNormal("mpi"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.remove('HGSDdGq2Xz');
      logInfo(`step3 remove("HGSDdGq2Xz"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.update('WHhk2ebfEhMM');
      logInfo(`step4 update("WHhk2ebfEhMM"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`add>castToNormal>remove>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>castToNormal>remove>update final: JSON.stringify(subject.form...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["","WHhk2ebfEhMM"]');
      logInfo(`add>castToNormal>remove>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>castToNormal>remove>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a",""]');
      logInfo(`add>castToNormal>remove>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>castToNormal>remove>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0078
     * @tc.name      FormExtAbility_FormStoreModelFlow_0078
     * @tc.desc      FormStoreModel call flow remove > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0078 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('4JYeRY85X');
      logInfo(`step1 remove("4JYeRY85X"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.countOf('O1lr65u');
      logInfo(`step2 countOf("O1lr65u"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0079
     * @tc.name      FormExtAbility_FormStoreModelFlow_0079
     * @tc.desc      FormStoreModel call flow remove > add > remove > add > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0079 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('IH5irVjtjt8K');
      logInfo(`step1 remove("IH5irVjtjt8K"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.add('', 'Hello', true);
      logInfo(`step2 add("", "Hello", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('a_1');
      logInfo(`step3 remove("a_1"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.add('xa', 'A', false);
      logInfo(`step4 add("xa", "A", false): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: string = subject.update('LvrtP8oo');
      logInfo(`step5 update("LvrtP8oo"): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`remove>add>remove>add>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`remove>add>remove>add>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["","xa","LvrtP8oo"]');
      logInfo(`remove>add>remove>add>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`remove>add>remove>add>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello","A",""]');
      logInfo(`remove>add>remove>add>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`remove>add>remove>add>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0080
     * @tc.name      FormExtAbility_FormStoreModelFlow_0080
     * @tc.desc      FormStoreModel call flow countOf > add > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0080 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('');
      logInfo(`step1 countOf(""): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.add(' ', ' ', false);
      logInfo(`step2 add(" ", " ", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('18s6ViA4HV');
      logInfo(`step3 remove("18s6ViA4HV"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`countOf>add>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>add>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`countOf>add>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>add>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`countOf>add>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>add>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0081
     * @tc.name      FormExtAbility_FormStoreModelFlow_0081
     * @tc.desc      FormStoreModel call flow castToNormal > countOf > castToNormal > countOf > update keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0081 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('FwCK');
      logInfo(`step1 castToNormal("FwCK"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.countOf('O1lr65u');
      logInfo(`step2 countOf("O1lr65u"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.castToNormal('0ABS7b1BHDYP');
      logInfo(`step3 castToNormal("0ABS7b1BHDYP"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.countOf(' ');
      logInfo(`step4 countOf(" "): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: string = subject.update('g4z');
      logInfo(`step5 update("g4z"): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`castToNormal>countOf>castToNormal>countOf...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>countOf>castToNormal>countOf...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["g4z"]');
      logInfo(`castToNormal>countOf>castToNormal>countOf...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>countOf>castToNormal>countOf...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>countOf>castToNormal>countOf...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>countOf>castToNormal>countOf...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0082
     * @tc.name      FormExtAbility_FormStoreModelFlow_0082
     * @tc.desc      FormStoreModel call flow update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0082 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('MDg');
      logInfo(`step1 update("MDg"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('Y');
      logInfo(`step2 castToNormal("Y"): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`update>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["MDg"]');
      logInfo(`update>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0083
     * @tc.name      FormExtAbility_FormStoreModelFlow_0083
     * @tc.desc      FormStoreModel call flow add > countOf > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0083 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('xa', 'hello world', false);
      logInfo(`step1 add("xa", "hello world", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('ebFT');
      logInfo(`step2 countOf("ebFT"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.castToNormal('abc');
      logInfo(`step3 castToNormal("abc"): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`add>countOf>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>countOf>castToNormal final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xa"]');
      logInfo(`add>countOf>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>countOf>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add>countOf>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>countOf>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0084
     * @tc.name      FormExtAbility_FormStoreModelFlow_0084
     * @tc.desc      FormStoreModel call flow castToNormal > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0084 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('7ZV6gWCDY9g');
      logInfo(`step1 castToNormal("7ZV6gWCDY9g"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.remove('JyCO4xeYMn');
      logInfo(`step2 remove("JyCO4xeYMn"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0085
     * @tc.name      FormExtAbility_FormStoreModelFlow_0085
     * @tc.desc      FormStoreModel call flow remove > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0085 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('OaDVF9U');
      logInfo(`step1 remove("OaDVF9U"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.update(' a ');
      logInfo(`step2 update(" a "): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.update('x');
      logInfo(`step3 update("x"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      logInfo(`remove>update>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`remove>update>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" a ","x"]');
      logInfo(`remove>update>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`remove>update>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["",""]');
      logInfo(`remove>update>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`remove>update>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0086
     * @tc.name      FormExtAbility_FormStoreModelFlow_0086
     * @tc.desc      FormStoreModel call flow add > castToNormal > update > countOf > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0086 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' ', '\u4e2d\u6587', false);
      logInfo(`step1 add(" ", "??", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('vu6');
      logInfo(`step2 castToNormal("vu6"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.update('abHU1akRpQyE');
      logInfo(`step3 update("abHU1akRpQyE"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.countOf('');
      logInfo(`step4 countOf(""): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.remove('L285MhOx');
      logInfo(`step5 remove("L285MhOx"): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`add>castToNormal>update>countOf>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>castToNormal>update>countOf>remove final: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" ","abHU1akRpQyE"]');
      logInfo(`add>castToNormal>update>countOf>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>castToNormal>update>countOf>remove final: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587",""]');
      logInfo(`add>castToNormal>update>countOf>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>castToNormal>update>countOf>remove final: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0087
     * @tc.name      FormExtAbility_FormStoreModelFlow_0087
     * @tc.desc      FormStoreModel call flow update > castToNormal > countOf > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0087 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('MDg');
      logInfo(`step1 update("MDg"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('iJXAuI3P');
      logInfo(`step2 castToNormal("iJXAuI3P"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.countOf('gRZoE');
      logInfo(`step3 countOf("gRZoE"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.countOf('abc_1');
      logInfo(`step4 countOf("abc_1"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`update>castToNormal>countOf>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>castToNormal>countOf>countOf final: JSON.stringify(subject...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["MDg"]');
      logInfo(`update>castToNormal>countOf>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>castToNormal>countOf>countOf final: JSON.stringify(subject.n...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>castToNormal>countOf>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>castToNormal>countOf>countOf final: JSON.stringify(subject.t...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0088
     * @tc.name      FormExtAbility_FormStoreModelFlow_0088
     * @tc.desc      FormStoreModel call flow castToNormal > add > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0088 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('x63mvZRv');
      logInfo(`step1 castToNormal("x63mvZRv"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add('123', 'a', true);
      logInfo(`step2 add("123", "a", true): step2=${step2}`);
      expect(step2).assertEqual('13');
      const step3: number = subject.countOf(' abc ');
      logInfo(`step3 countOf(" abc "): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`castToNormal>add>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>add>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`castToNormal>add>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>add>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`castToNormal>add>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>add>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0088 end`);
    });
  });
}
