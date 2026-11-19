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

/** Logic checks for FormStoreModel flow (35 cases). */
export default function formStoreModelFlow5Test(): void {
  describe('FormStoreModelFlow5Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0174
     * @tc.name      FormExtAbility_FormStoreModelFlow_0174
     * @tc.desc      FormStoreModel call flow add > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0174 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('abc', ' ', false);
      logInfo(`step1 add("abc", " ", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update('x_1');
      logInfo(`step2 update("x_1"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`add>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc","x_1"]');
      logInfo(`add>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" ",""]');
      logInfo(`add>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0175
     * @tc.name      FormExtAbility_FormStoreModelFlow_0175
     * @tc.desc      FormStoreModel call flow add > add > castToNormal > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0175 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('123', 'a', true);
      logInfo(`step1 add("123", "a", true): step1=${step1}`);
      expect(step1).assertEqual('13');
      const step2: string = subject.add('a_1', ' ', false);
      logInfo(`step2 add("a_1", " ", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('mtf5i9');
      logInfo(`step3 castToNormal("mtf5i9"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.castToNormal('uFP');
      logInfo(`step4 castToNormal("uFP"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`add>add>castToNormal>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>add>castToNormal>castToNormal final: JSON.stringify(subject.f...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123","a_1"]');
      logInfo(`add>add>castToNormal>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>add>castToNormal>castToNormal final: JSON.stringify(subject.nam...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"," "]');
      logInfo(`add>add>castToNormal>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>add>castToNormal>castToNormal final: JSON.stringify(subject.tem...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0176
     * @tc.name      FormExtAbility_FormStoreModelFlow_0176
     * @tc.desc      FormStoreModel call flow remove > castToNormal > add > remove > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0176 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('xHello World');
      logInfo(`step1 remove("xHello World"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.castToNormal(' abc ');
      logInfo(`step2 castToNormal(" abc "): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.add(' ', 'abc', true);
      logInfo(`step3 add(" ", "abc", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.remove('S0QzDI');
      logInfo(`step4 remove("S0QzDI"): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: boolean = subject.castToNormal('BJsEI4');
      logInfo(`step5 castToNormal("BJsEI4"): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`remove>castToNormal>add>remove>castToNorm...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>castToNormal>add>remove>castToNorm...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`remove>castToNormal>add>remove>castToNorm...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>castToNormal>add>remove>castToNorm...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`remove>castToNormal>add>remove>castToNorm...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>castToNormal>add>remove>castToNorm...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0177
     * @tc.name      FormExtAbility_FormStoreModelFlow_0177
     * @tc.desc      FormStoreModel call flow add > remove > add > countOf > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0177 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' a ', 'hello world', true);
      logInfo(`step1 add(" a ", "hello world", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.remove('V0rA1');
      logInfo(`step2 remove("V0rA1"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.add('xa', 'Hello', false);
      logInfo(`step3 add("xa", "Hello", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.countOf('DqKu');
      logInfo(`step4 countOf("DqKu"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.remove('abcabc');
      logInfo(`step5 remove("abcabc"): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`add>remove>add>countOf>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>remove>add>countOf>remove final: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" a ","xa"]');
      logInfo(`add>remove>add>countOf>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>remove>add>countOf>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world","Hello"]');
      logInfo(`add>remove>add>countOf>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>remove>add>countOf>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0178
     * @tc.name      FormExtAbility_FormStoreModelFlow_0178
     * @tc.desc      FormStoreModel call flow add > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0178 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('aa', 'hello world', true);
      logInfo(`step1 add("aa", "hello world", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('xHello World');
      logInfo(`step2 castToNormal("xHello World"): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`add>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>castToNormal final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["aa"]');
      logInfo(`add>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0179
     * @tc.name      FormExtAbility_FormStoreModelFlow_0179
     * @tc.desc      FormStoreModel call flow update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0179 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('pIqgd4zxme');
      logInfo(`step1 update("pIqgd4zxme"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('Y');
      logInfo(`step2 castToNormal("Y"): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`update>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["pIqgd4zxme"]');
      logInfo(`update>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0180
     * @tc.name      FormExtAbility_FormStoreModelFlow_0180
     * @tc.desc      FormStoreModel call flow remove > countOf > countOf > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0180 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('i');
      logInfo(`step1 remove("i"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.countOf('gRZoE');
      logInfo(`step2 countOf("gRZoE"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.countOf('TOBmolerxS2');
      logInfo(`step3 countOf("TOBmolerxS2"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: boolean = subject.castToNormal('pkEIYvCZWB');
      logInfo(`step4 castToNormal("pkEIYvCZWB"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0181
     * @tc.name      FormExtAbility_FormStoreModelFlow_0181
     * @tc.desc      FormStoreModel call flow castToNormal > add > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0181 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('S1vX4');
      logInfo(`step1 castToNormal("S1vX4"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add('a', 'a', false);
      logInfo(`step2 add("a", "a", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.update('MT7krsynX');
      logInfo(`step3 update("MT7krsynX"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      logInfo(`castToNormal>add>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`castToNormal>add>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a","MT7krsynX"]');
      logInfo(`castToNormal>add>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`castToNormal>add>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a",""]');
      logInfo(`castToNormal>add>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`castToNormal>add>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0182
     * @tc.name      FormExtAbility_FormStoreModelFlow_0182
     * @tc.desc      FormStoreModel call flow remove > castToNormal > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0182 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('HOuNIixUvnNG');
      logInfo(`step1 remove("HOuNIixUvnNG"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.castToNormal(' ');
      logInfo(`step2 castToNormal(" "): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.add('', 'Hello', true);
      logInfo(`step3 add("", "Hello", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      logInfo(`remove>castToNormal>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>castToNormal>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`remove>castToNormal>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>castToNormal>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello"]');
      logInfo(`remove>castToNormal>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>castToNormal>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0183
     * @tc.name      FormExtAbility_FormStoreModelFlow_0183
     * @tc.desc      FormStoreModel call flow castToNormal > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0183 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('UCFxZV');
      logInfo(`step1 castToNormal("UCFxZV"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.update('abc');
      logInfo(`step2 update("abc"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`castToNormal>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`castToNormal>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0184
     * @tc.name      FormExtAbility_FormStoreModelFlow_0184
     * @tc.desc      FormStoreModel call flow countOf > remove > add > update > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0184 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('SnbRSUZ5s8A');
      logInfo(`step1 countOf("SnbRSUZ5s8A"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.remove('wzLcpu');
      logInfo(`step2 remove("wzLcpu"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.add('abc', ' ', true);
      logInfo(`step3 add("abc", " ", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('mkxaqpp');
      logInfo(`step4 update("mkxaqpp"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: number = subject.countOf('xabc');
      logInfo(`step5 countOf("xabc"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`countOf>remove>add>update>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`countOf>remove>add>update>countOf final: JSON.stringify(subject.f...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc","mkxaqpp"]');
      logInfo(`countOf>remove>add>update>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`countOf>remove>add>update>countOf final: JSON.stringify(subject.nam...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" ",""]');
      logInfo(`countOf>remove>add>update>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`countOf>remove>add>update>countOf final: JSON.stringify(subject.tem...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0185
     * @tc.name      FormExtAbility_FormStoreModelFlow_0185
     * @tc.desc      FormStoreModel call flow remove > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0185 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('HvzaKI');
      logInfo(`step1 remove("HvzaKI"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.castToNormal('oWoi');
      logInfo(`step2 castToNormal("oWoi"): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0186
     * @tc.name      FormExtAbility_FormStoreModelFlow_0186
     * @tc.desc      FormStoreModel call flow remove > remove > countOf > update > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0186 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove(' ');
      logInfo(`step1 remove(" "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.remove('HGSDdGq2Xz');
      logInfo(`step2 remove("HGSDdGq2Xz"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.countOf('Gla');
      logInfo(`step3 countOf("Gla"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.update('Hello World');
      logInfo(`step4 update("Hello World"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: string = subject.add('abc', 'Hello', true);
      logInfo(`step5 add("abc", "Hello", true): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`remove>remove>countOf>update>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`remove>remove>countOf>update>add final: JSON.stringify(subject.fo...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World","abc"]');
      logInfo(`remove>remove>countOf>update>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`remove>remove>countOf>update>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","Hello"]');
      logInfo(`remove>remove>countOf>update>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`remove>remove>countOf>update>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0187
     * @tc.name      FormExtAbility_FormStoreModelFlow_0187
     * @tc.desc      FormStoreModel call flow castToNormal > add > add > update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0187 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('fbXz6yB');
      logInfo(`step1 castToNormal("fbXz6yB"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add('Hello World', 'Hello', true);
      logInfo(`step2 add("Hello World", "Hello", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.add('', 'Hello World', true);
      logInfo(`step3 add("", "Hello World", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('6tTvXkLFOLq6');
      logInfo(`step4 update("6tTvXkLFOLq6"): step4=${step4}`);
      expect(step4).assertEqual('15');
      const step5: boolean = subject.castToNormal('TbK40xHRY4J');
      logInfo(`step5 castToNormal("TbK40xHRY4J"): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`castToNormal>add>add>update>castToNormal ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`castToNormal>add>add>update>castToNormal ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World","","6tTvXkLFOLq6"]');
      logInfo(`castToNormal>add>add>update>castToNormal ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`castToNormal>add>add>update>castToNormal ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello","Hello World",""]');
      logInfo(`castToNormal>add>add>update>castToNormal ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`castToNormal>add>add>update>castToNormal ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0188
     * @tc.name      FormExtAbility_FormStoreModelFlow_0188
     * @tc.desc      FormStoreModel call flow remove > castToNormal > update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0188 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('aa');
      logInfo(`step1 remove("aa"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.castToNormal('xA5O7');
      logInfo(`step2 castToNormal("xA5O7"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.update('z8tV4RGeuP7');
      logInfo(`step3 update("z8tV4RGeuP7"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: boolean = subject.castToNormal('Hello WorldHello World');
      logInfo(`step4 castToNormal("Hello WorldHello World"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`remove>castToNormal>update>castToNormal f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>castToNormal>update>castToNormal f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["z8tV4RGeuP7"]');
      logInfo(`remove>castToNormal>update>castToNormal f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>castToNormal>update>castToNormal f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`remove>castToNormal>update>castToNormal f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>castToNormal>update>castToNormal f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0189
     * @tc.name      FormExtAbility_FormStoreModelFlow_0189
     * @tc.desc      FormStoreModel call flow add > castToNormal > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0189 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' ', 'Hello World', true);
      logInfo(`step1 add(" ", "Hello World", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('hE7vAFl0rE2M');
      logInfo(`step2 castToNormal("hE7vAFl0rE2M"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.castToNormal('lU');
      logInfo(`step3 castToNormal("lU"): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`add>castToNormal>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>castToNormal>castToNormal final: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add>castToNormal>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>castToNormal>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello World"]');
      logInfo(`add>castToNormal>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>castToNormal>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0190
     * @tc.name      FormExtAbility_FormStoreModelFlow_0190
     * @tc.desc      FormStoreModel call flow castToNormal > add > add > update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0190 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('xfVFQmf5GlZ');
      logInfo(`step1 castToNormal("xfVFQmf5GlZ"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add('xa', 'hello world', false);
      logInfo(`step2 add("xa", "hello world", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.add('xa', 'a', false);
      logInfo(`step3 add("xa", "a", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('LvrtP8oo');
      logInfo(`step4 update("LvrtP8oo"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: boolean = subject.castToNormal('x123');
      logInfo(`step5 castToNormal("x123"): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`castToNormal>add>add>update>castToNormal ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`castToNormal>add>add>update>castToNormal ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xa","LvrtP8oo"]');
      logInfo(`castToNormal>add>add>update>castToNormal ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`castToNormal>add>add>update>castToNormal ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a",""]');
      logInfo(`castToNormal>add>add>update>castToNormal ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`castToNormal>add>add>update>castToNormal ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0191
     * @tc.name      FormExtAbility_FormStoreModelFlow_0191
     * @tc.desc      FormStoreModel call flow add > countOf > countOf > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0191 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' a ', 'A', true);
      logInfo(`step1 add(" a ", "A", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('O1lr65u');
      logInfo(`step2 countOf("O1lr65u"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.countOf('xfMXx8l3');
      logInfo(`step3 countOf("xfMXx8l3"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.countOf('LXX5o');
      logInfo(`step4 countOf("LXX5o"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`add>countOf>countOf>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>countOf>countOf>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" a "]');
      logInfo(`add>countOf>countOf>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>countOf>countOf>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add>countOf>countOf>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>countOf>countOf>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0192
     * @tc.name      FormExtAbility_FormStoreModelFlow_0192
     * @tc.desc      FormStoreModel call flow castToNormal > remove > update > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0192 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('vTG');
      logInfo(`step1 castToNormal("vTG"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.remove('567dEJ7n');
      logInfo(`step2 remove("567dEJ7n"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.update('Hello World');
      logInfo(`step3 update("Hello World"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.add('a_1', 'Sample Title 123', false);
      logInfo(`step4 add("a_1", "Sample Title 123", false): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`castToNormal>remove>update>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`castToNormal>remove>update>add final: JSON.stringify(subject.form...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World","a_1"]');
      logInfo(`castToNormal>remove>update>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`castToNormal>remove>update>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","Sample Title 123"]');
      logInfo(`castToNormal>remove>update>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`castToNormal>remove>update>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0193
     * @tc.name      FormExtAbility_FormStoreModelFlow_0193
     * @tc.desc      FormStoreModel call flow update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0193 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('WHhk2ebfEhMM');
      logInfo(`step1 update("WHhk2ebfEhMM"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('IL6x4S2CE');
      logInfo(`step2 castToNormal("IL6x4S2CE"): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`update>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["WHhk2ebfEhMM"]');
      logInfo(`update>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0194
     * @tc.name      FormExtAbility_FormStoreModelFlow_0194
     * @tc.desc      FormStoreModel call flow add > countOf > add > update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0194 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('xa', 'a', false);
      logInfo(`step1 add("xa", "a", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('a');
      logInfo(`step2 countOf("a"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.add(' ', 'abc', false);
      logInfo(`step3 add(" ", "abc", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('  ');
      logInfo(`step4 update("  "): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: boolean = subject.castToNormal('AE7A2');
      logInfo(`step5 castToNormal("AE7A2"): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`add>countOf>add>update>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`add>countOf>add>update>castToNormal final: JSON.stringify(subject...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xa"," ","  "]');
      logInfo(`add>countOf>add>update>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`add>countOf>add>update>castToNormal final: JSON.stringify(subject.n...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a","abc",""]');
      logInfo(`add>countOf>add>update>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`add>countOf>add>update>castToNormal final: JSON.stringify(subject.t...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0195
     * @tc.name      FormExtAbility_FormStoreModelFlow_0195
     * @tc.desc      FormStoreModel call flow update > countOf > remove > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0195 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('XTx81V');
      logInfo(`step1 update("XTx81V"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('vF');
      logInfo(`step2 countOf("vF"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.remove('wwzHGezYWJLi');
      logInfo(`step3 remove("wwzHGezYWJLi"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.countOf('9j');
      logInfo(`step4 countOf("9j"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`update>countOf>remove>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>countOf>remove>countOf final: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["XTx81V"]');
      logInfo(`update>countOf>remove>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>countOf>remove>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>countOf>remove>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>countOf>remove>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0196
     * @tc.name      FormExtAbility_FormStoreModelFlow_0196
     * @tc.desc      FormStoreModel call flow update > countOf > countOf > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0196 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('2l5Z8yY4');
      logInfo(`step1 update("2l5Z8yY4"): step1=${step1}`);
      expect(step1).assertEqual('11');
      const step2: number = subject.countOf('tzRehFvX');
      logInfo(`step2 countOf("tzRehFvX"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.countOf('LAn9');
      logInfo(`step3 countOf("LAn9"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.add('Hello World', '', true);
      logInfo(`step4 add("Hello World", "", true): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`update>countOf>countOf>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`update>countOf>countOf>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["2l5Z8yY4","Hello World"]');
      logInfo(`update>countOf>countOf>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`update>countOf>countOf>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["",""]');
      logInfo(`update>countOf>countOf>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`update>countOf>countOf>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0197
     * @tc.name      FormExtAbility_FormStoreModelFlow_0197
     * @tc.desc      FormStoreModel call flow add > add > update > castToNormal > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0197 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('a_1', 'Hello World', false);
      logInfo(`step1 add("a_1", "Hello World", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add(' ', ' ', false);
      logInfo(`step2 add(" ", " ", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.update('Hello World_1');
      logInfo(`step3 update("Hello World_1"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: boolean = subject.castToNormal('fbXz6yB');
      logInfo(`step4 castToNormal("fbXz6yB"): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.remove('q');
      logInfo(`step5 remove("q"): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`add>add>update>castToNormal>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`add>add>update>castToNormal>remove final: JSON.stringify(subject....${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1"," ","Hello World_1"]');
      logInfo(`add>add>update>castToNormal>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`add>add>update>castToNormal>remove final: JSON.stringify(subject.na...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello World"," ",""]');
      logInfo(`add>add>update>castToNormal>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`add>add>update>castToNormal>remove final: JSON.stringify(subject.te...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0198
     * @tc.name      FormExtAbility_FormStoreModelFlow_0198
     * @tc.desc      FormStoreModel call flow castToNormal > countOf > add > countOf > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0198 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('oWCEkwPD');
      logInfo(`step1 castToNormal("oWCEkwPD"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.countOf('7Cj');
      logInfo(`step2 countOf("7Cj"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.add('a_1', ' ', false);
      logInfo(`step3 add("a_1", " ", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.countOf('Hello World_1');
      logInfo(`step4 countOf("Hello World_1"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: string = subject.update('tWQ');
      logInfo(`step5 update("tWQ"): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`castToNormal>countOf>add>countOf>update f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`castToNormal>countOf>add>countOf>update f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1","tWQ"]');
      logInfo(`castToNormal>countOf>add>countOf>update f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`castToNormal>countOf>add>countOf>update f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" ",""]');
      logInfo(`castToNormal>countOf>add>countOf>update f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`castToNormal>countOf>add>countOf>update f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0199
     * @tc.name      FormExtAbility_FormStoreModelFlow_0199
     * @tc.desc      FormStoreModel call flow castToNormal > add > remove > castToNormal > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0199 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('x ');
      logInfo(`step1 castToNormal("x "): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add('', 'abc', true);
      logInfo(`step2 add("", "abc", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('OaDVF9U');
      logInfo(`step3 remove("OaDVF9U"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: boolean = subject.castToNormal('iJXAuI3P');
      logInfo(`step4 castToNormal("iJXAuI3P"): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.add(' a ', ' ', false);
      logInfo(`step5 add(" a ", " ", false): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`castToNormal>add>remove>castToNormal>add ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`castToNormal>add>remove>castToNormal>add ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""," a "]');
      logInfo(`castToNormal>add>remove>castToNormal>add ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`castToNormal>add>remove>castToNormal>add ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"," "]');
      logInfo(`castToNormal>add>remove>castToNormal>add ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`castToNormal>add>remove>castToNormal>add ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0200
     * @tc.name      FormExtAbility_FormStoreModelFlow_0200
     * @tc.desc      FormStoreModel call flow castToNormal > countOf > castToNormal > castToNormal keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0200 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal(' ');
      logInfo(`step1 castToNormal(" "): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.countOf('nT1rS');
      logInfo(`step2 countOf("nT1rS"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.castToNormal('q7');
      logInfo(`step3 castToNormal("q7"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.castToNormal('ilsYSVW');
      logInfo(`step4 castToNormal("ilsYSVW"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0201
     * @tc.name      FormExtAbility_FormStoreModelFlow_0201
     * @tc.desc      FormStoreModel call flow remove > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0201 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('vTa6dtKT14qI');
      logInfo(`step1 remove("vTa6dtKT14qI"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.update('XFrpp7IvX');
      logInfo(`step2 update("XFrpp7IvX"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`remove>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["XFrpp7IvX"]');
      logInfo(`remove>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`remove>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0202
     * @tc.name      FormExtAbility_FormStoreModelFlow_0202
     * @tc.desc      FormStoreModel call flow countOf > castToNormal > countOf > update > castToNormal keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0202 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('SnbRSUZ5s8A');
      logInfo(`step1 countOf("SnbRSUZ5s8A"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.castToNormal('UCFxZV');
      logInfo(`step2 castToNormal("UCFxZV"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.countOf('7HFyKzJ1q4');
      logInfo(`step3 countOf("7HFyKzJ1q4"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.update('0L');
      logInfo(`step4 update("0L"): step4=${step4}`);
      expect(step4).assertEqual('9');
      const step5: boolean = subject.castToNormal('uFP');
      logInfo(`step5 castToNormal("uFP"): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`countOf>castToNormal>countOf>update>castT...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>castToNormal>countOf>update>castT...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["0L"]');
      logInfo(`countOf>castToNormal>countOf>update>castT...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>castToNormal>countOf>update>castT...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`countOf>castToNormal>countOf>update>castT...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>castToNormal>countOf>update>castT...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0203
     * @tc.name      FormExtAbility_FormStoreModelFlow_0203
     * @tc.desc      FormStoreModel call flow add > castToNormal > update > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0203 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('aa', 'a', false);
      logInfo(`step1 add("aa", "a", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('BJsEI4');
      logInfo(`step2 castToNormal("BJsEI4"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.update('Hello WorldHello World');
      logInfo(`step3 update("Hello WorldHello World"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.remove('Hello World');
      logInfo(`step4 remove("Hello World"): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`add>castToNormal>update>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>castToNormal>update>remove final: JSON.stringify(subject.form...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["aa","Hello WorldHello World"]');
      logInfo(`add>castToNormal>update>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>castToNormal>update>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a",""]');
      logInfo(`add>castToNormal>update>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>castToNormal>update>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0204
     * @tc.name      FormExtAbility_FormStoreModelFlow_0204
     * @tc.desc      FormStoreModel call flow countOf > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0204 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('l6uSEnTSL');
      logInfo(`step1 countOf("l6uSEnTSL"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.update('LvrtP8oo');
      logInfo(`step2 update("LvrtP8oo"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`countOf>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["LvrtP8oo"]');
      logInfo(`countOf>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`countOf>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0205
     * @tc.name      FormExtAbility_FormStoreModelFlow_0205
     * @tc.desc      FormStoreModel call flow update > add > update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0205 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('J');
      logInfo(`step1 update("J"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add('a', 'a', true);
      logInfo(`step2 add("a", "a", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.update(' ');
      logInfo(`step3 update(" "): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: boolean = subject.castToNormal('Awp');
      logInfo(`step4 castToNormal("Awp"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`update>add>update>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`update>add>update>castToNormal final: JSON.stringify(subject.form...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["J","a"," "]');
      logInfo(`update>add>update>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`update>add>update>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","a",""]');
      logInfo(`update>add>update>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`update>add>update>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0206
     * @tc.name      FormExtAbility_FormStoreModelFlow_0206
     * @tc.desc      FormStoreModel call flow add > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0206 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' ', 'abc', true);
      logInfo(`step1 add(" ", "abc", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('3lAqn');
      logInfo(`step2 countOf("3lAqn"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`add>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`add>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0207
     * @tc.name      FormExtAbility_FormStoreModelFlow_0207
     * @tc.desc      FormStoreModel call flow countOf > update > add > update > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0207 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf(' abc ');
      logInfo(`step1 countOf(" abc "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.update('123_1');
      logInfo(`step2 update("123_1"): step2=${step2}`);
      expect(step2).assertEqual('12');
      const step3: string = subject.add('a_1', 'Sample Title 123', false);
      logInfo(`step3 add("a_1", "Sample Title 123", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('35bvadQURnd0');
      logInfo(`step4 update("35bvadQURnd0"): step4=${step4}`);
      expect(step4).assertEqual('24');
      const step5: number = subject.remove(' _1');
      logInfo(`step5 remove(" _1"): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`countOf>update>add>update>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`countOf>update>add>update>remove final: JSON.stringify(subject.fo...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123_1","a_1","35bvadQURnd0"]');
      logInfo(`countOf>update>add>update>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`countOf>update>add>update>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","Sample Title 123",""]');
      logInfo(`countOf>update>add>update>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`countOf>update>add>update>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0208
     * @tc.name      FormExtAbility_FormStoreModelFlow_0208
     * @tc.desc      FormStoreModel call flow castToNormal > update > remove > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0208 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('xa');
      logInfo(`step1 castToNormal("xa"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.update('abc_1');
      logInfo(`step2 update("abc_1"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('ZRt');
      logInfo(`step3 remove("ZRt"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: boolean = subject.castToNormal('x63mvZRv');
      logInfo(`step4 castToNormal("x63mvZRv"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`castToNormal>update>remove>castToNormal f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>update>remove>castToNormal f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc_1"]');
      logInfo(`castToNormal>update>remove>castToNormal f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>update>remove>castToNormal f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>update>remove>castToNormal f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>update>remove>castToNormal f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0208 end`);
    });
  });
}
