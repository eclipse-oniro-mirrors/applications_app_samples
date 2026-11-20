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

/** Logic checks for FormStoreModel flow (45 cases). */
export default function formStoreModelFlowTest(): void {
  describe('FormStoreModelFlowTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0001
     * @tc.name      FormExtAbility_FormStoreModelFlow_0001
     * @tc.desc      FormStoreModel call flow countOf > castToNormal > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0001 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('DqKu');
      logInfo(`step1 countOf("DqKu"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.castToNormal('  ');
      logInfo(`step2 castToNormal("  "): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.countOf('7HFyKzJ1q4');
      logInfo(`step3 countOf("7HFyKzJ1q4"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0002
     * @tc.name      FormExtAbility_FormStoreModelFlow_0002
     * @tc.desc      FormStoreModel call flow countOf > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormStoreModelFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0002 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('FJaDB7J');
      logInfo(`step1 countOf("FJaDB7J"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.remove('vTa6dtKT14qI');
      logInfo(`step2 remove("vTa6dtKT14qI"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0003
     * @tc.name      FormExtAbility_FormStoreModelFlow_0003
     * @tc.desc      FormStoreModel call flow countOf > castToNormal > remove > castToNormal > remove keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0003 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('LAn9');
      logInfo(`step1 countOf("LAn9"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.castToNormal('7ZV6gWCDY9g');
      logInfo(`step2 castToNormal("7ZV6gWCDY9g"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.remove('wzLcpu');
      logInfo(`step3 remove("wzLcpu"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.castToNormal('abcabc');
      logInfo(`step4 castToNormal("abcabc"): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.remove('09wfm');
      logInfo(`step5 remove("09wfm"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0004
     * @tc.name      FormExtAbility_FormStoreModelFlow_0004
     * @tc.desc      FormStoreModel call flow castToNormal > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0004 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('abcabc');
      logInfo(`step1 castToNormal("abcabc"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.castToNormal('mfcce');
      logInfo(`step2 castToNormal("mfcce"): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0005
     * @tc.name      FormExtAbility_FormStoreModelFlow_0005
     * @tc.desc      FormStoreModel call flow update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0005 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update(' x ');
      logInfo(`step1 update(" x "): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('ilsYSVW');
      logInfo(`step2 castToNormal("ilsYSVW"): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`update>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" x "]');
      logInfo(`update>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0006
     * @tc.name      FormExtAbility_FormStoreModelFlow_0006
     * @tc.desc      FormStoreModel call flow castToNormal > add > countOf > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0006 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('');
      logInfo(`step1 castToNormal(""): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add('aa', 'abc', false);
      logInfo(`step2 add("aa", "abc", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.countOf('xHello World');
      logInfo(`step3 countOf("xHello World"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.remove('Hello WorldHello World');
      logInfo(`step4 remove("Hello WorldHello World"): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`castToNormal>add>countOf>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>add>countOf>remove final: JSON.stringify(subject.for...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["aa"]');
      logInfo(`castToNormal>add>countOf>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>add>countOf>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`castToNormal>add>countOf>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>add>countOf>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0007
     * @tc.name      FormExtAbility_FormStoreModelFlow_0007
     * @tc.desc      FormStoreModel call flow remove > remove > castToNormal > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0007 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove(' a ');
      logInfo(`step1 remove(" a "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.remove('L285MhOx');
      logInfo(`step2 remove("L285MhOx"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.castToNormal(' a ');
      logInfo(`step3 castToNormal(" a "): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.castToNormal('FwCK');
      logInfo(`step4 castToNormal("FwCK"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0008
     * @tc.name      FormExtAbility_FormStoreModelFlow_0008
     * @tc.desc      FormStoreModel call flow remove > add > add > add > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0008 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove(' ');
      logInfo(`step1 remove(" "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.add('a', 'a', false);
      logInfo(`step2 add("a", "a", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.add('', 'abc', true);
      logInfo(`step3 add("", "abc", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.add('a_1', '', true);
      logInfo(`step4 add("a_1", "", true): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: boolean = subject.castToNormal('abc');
      logInfo(`step5 castToNormal("abc"): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`remove>add>add>add>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`remove>add>add>add>castToNormal final: JSON.stringify(subject.for...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a","","a_1"]');
      logInfo(`remove>add>add>add>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`remove>add>add>add>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a","abc",""]');
      logInfo(`remove>add>add>add>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`remove>add>add>add>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0009
     * @tc.name      FormExtAbility_FormStoreModelFlow_0009
     * @tc.desc      FormStoreModel call flow add > castToNormal > castToNormal > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0009 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' a ', 'Hello', false);
      logInfo(`step1 add(" a ", "Hello", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('x ');
      logInfo(`step2 castToNormal("x "): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.castToNormal('abc');
      logInfo(`step3 castToNormal("abc"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.update('123123');
      logInfo(`step4 update("123123"): step4=${step4}`);
      expect(step4).assertEqual('12');
      const step5: string = subject.update('XFrpp7IvX');
      logInfo(`step5 update("XFrpp7IvX"): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`add>castToNormal>castToNormal>update>upda...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`add>castToNormal>castToNormal>update>upda...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" a ","123123","XFrpp7IvX"]');
      logInfo(`add>castToNormal>castToNormal>update>upda...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`add>castToNormal>castToNormal>update>upda...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello","",""]');
      logInfo(`add>castToNormal>castToNormal>update>upda...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`add>castToNormal>castToNormal>update>upda...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0010
     * @tc.name      FormExtAbility_FormStoreModelFlow_0010
     * @tc.desc      FormStoreModel call flow update > countOf > add > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0010 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('3faGjx');
      logInfo(`step1 update("3faGjx"): step1=${step1}`);
      expect(step1).assertEqual('12');
      const step2: number = subject.countOf('tD');
      logInfo(`step2 countOf("tD"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.add('xa', 'A', false);
      logInfo(`step3 add("xa", "A", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('123_1');
      logInfo(`step4 update("123_1"): step4=${step4}`);
      expect(step4).assertEqual('12');
      logInfo(`update>countOf>add>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`update>countOf>add>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["3faGjx","xa","123_1"]');
      logInfo(`update>countOf>add>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`update>countOf>add>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","A",""]');
      logInfo(`update>countOf>add>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`update>countOf>add>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0011
     * @tc.name      FormExtAbility_FormStoreModelFlow_0011
     * @tc.desc      FormStoreModel call flow remove > update > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0011 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('HGSDdGq2Xz');
      logInfo(`step1 remove("HGSDdGq2Xz"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.update('a');
      logInfo(`step2 update("a"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.add(' a ', 'abc', true);
      logInfo(`step3 add(" a ", "abc", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      logInfo(`remove>update>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`remove>update>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"," a "]');
      logInfo(`remove>update>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`remove>update>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","abc"]');
      logInfo(`remove>update>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`remove>update>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0012
     * @tc.name      FormExtAbility_FormStoreModelFlow_0012
     * @tc.desc      FormStoreModel call flow add > castToNormal > countOf > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0012 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' ', 'A', false);
      logInfo(`step1 add(" ", "A", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('Y');
      logInfo(`step2 castToNormal("Y"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.countOf('vF');
      logInfo(`step3 countOf("vF"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.countOf('y');
      logInfo(`step4 countOf("y"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`add>castToNormal>countOf>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>castToNormal>countOf>countOf final: JSON.stringify(subject.fo...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add>castToNormal>countOf>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>castToNormal>countOf>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add>castToNormal>countOf>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>castToNormal>countOf>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0013
     * @tc.name      FormExtAbility_FormStoreModelFlow_0013
     * @tc.desc      FormStoreModel call flow remove > remove > castToNormal > castToNormal > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0013 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('Mjk');
      logInfo(`step1 remove("Mjk"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.remove('567dEJ7n');
      logInfo(`step2 remove("567dEJ7n"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.castToNormal('s');
      logInfo(`step3 castToNormal("s"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.castToNormal('kNkArm');
      logInfo(`step4 castToNormal("kNkArm"): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.add('', 'A', false);
      logInfo(`step5 add("", "A", false): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`remove>remove>castToNormal>castToNormal>a...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>remove>castToNormal>castToNormal>a...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`remove>remove>castToNormal>castToNormal>a...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>remove>castToNormal>castToNormal>a...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`remove>remove>castToNormal>castToNormal>a...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>remove>castToNormal>castToNormal>a...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0014
     * @tc.name      FormExtAbility_FormStoreModelFlow_0014
     * @tc.desc      FormStoreModel call flow castToNormal > countOf > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0014 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('123_1');
      logInfo(`step1 castToNormal("123_1"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.countOf('xa');
      logInfo(`step2 countOf("xa"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.remove('IH5irVjtjt8K');
      logInfo(`step3 remove("IH5irVjtjt8K"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0015
     * @tc.name      FormExtAbility_FormStoreModelFlow_0015
     * @tc.desc      FormStoreModel call flow add > countOf > remove > update > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0015 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' ', '\u4e2d\u6587', false);
      logInfo(`step1 add(" ", "??", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('bQmtD');
      logInfo(`step2 countOf("bQmtD"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.remove('x123');
      logInfo(`step3 remove("x123"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.update('AHmQ');
      logInfo(`step4 update("AHmQ"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: number = subject.remove('JyCO4xeYMn');
      logInfo(`step5 remove("JyCO4xeYMn"): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`add>countOf>remove>update>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>countOf>remove>update>remove final: JSON.stringify(subject.fo...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" ","AHmQ"]');
      logInfo(`add>countOf>remove>update>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>countOf>remove>update>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587",""]');
      logInfo(`add>countOf>remove>update>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>countOf>remove>update>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0016
     * @tc.name      FormExtAbility_FormStoreModelFlow_0016
     * @tc.desc      FormStoreModel call flow add > add > castToNormal > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0016 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('abc', '', false);
      logInfo(`step1 add("abc", "", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add('123', 'a', false);
      logInfo(`step2 add("123", "a", false): step2=${step2}`);
      expect(step2).assertEqual('13');
      const step3: boolean = subject.castToNormal('xfVFQmf5GlZ');
      logInfo(`step3 castToNormal("xfVFQmf5GlZ"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.countOf('Hello World');
      logInfo(`step4 countOf("Hello World"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`add>add>castToNormal>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>add>castToNormal>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc","123"]');
      logInfo(`add>add>castToNormal>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>add>castToNormal>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","a"]');
      logInfo(`add>add>castToNormal>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>add>castToNormal>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0017
     * @tc.name      FormExtAbility_FormStoreModelFlow_0017
     * @tc.desc      FormStoreModel call flow castToNormal > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0017 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('xa');
      logInfo(`step1 castToNormal("xa"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.countOf('vF');
      logInfo(`step2 countOf("vF"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0018
     * @tc.name      FormExtAbility_FormStoreModelFlow_0018
     * @tc.desc      FormStoreModel call flow add > add > add > update > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0018 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('a_1', 'Hello', true);
      logInfo(`step1 add("a_1", "Hello", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add('Hello World', 'Hello', true);
      logInfo(`step2 add("Hello World", "Hello", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.add('xa', 'abc', true);
      logInfo(`step3 add("xa", "abc", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('g4z');
      logInfo(`step4 update("g4z"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: number = subject.countOf(' 123 ');
      logInfo(`step5 countOf(" 123 "): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`add>add>add>update>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(4);
      logInfo(`add>add>add>update>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1","Hello World","xa","g4z"]');
      logInfo(`add>add>add>update>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(4);
      logInfo(`add>add>add>update>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello","Hello","abc",""]');
      logInfo(`add>add>add>update>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(4);
      logInfo(`add>add>add>update>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,true,true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0019
     * @tc.name      FormExtAbility_FormStoreModelFlow_0019
     * @tc.desc      FormStoreModel call flow countOf > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0019 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('9kvpoB6FH');
      logInfo(`step1 countOf("9kvpoB6FH"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.castToNormal('q9GUT');
      logInfo(`step2 castToNormal("q9GUT"): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0020
     * @tc.name      FormExtAbility_FormStoreModelFlow_0020
     * @tc.desc      FormStoreModel call flow add > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0020 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('a', 'a', true);
      logInfo(`step1 add("a", "a", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add('a_1', 'a', true);
      logInfo(`step2 add("a_1", "a", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`add>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a","a_1"]');
      logInfo(`add>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a","a"]');
      logInfo(`add>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0021
     * @tc.name      FormExtAbility_FormStoreModelFlow_0021
     * @tc.desc      FormStoreModel call flow remove > update > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0021 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('123_1');
      logInfo(`step1 remove("123_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.update('pI2KPWeUyVaO');
      logInfo(`step2 update("pI2KPWeUyVaO"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.add('', 'Hello', false);
      logInfo(`step3 add("", "Hello", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      logInfo(`remove>update>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`remove>update>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["pI2KPWeUyVaO",""]');
      logInfo(`remove>update>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`remove>update>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","Hello"]');
      logInfo(`remove>update>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`remove>update>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0022
     * @tc.name      FormExtAbility_FormStoreModelFlow_0022
     * @tc.desc      FormStoreModel call flow add > castToNormal > castToNormal > remove > countOf keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0022 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' ', 'A', false);
      logInfo(`step1 add(" ", "A", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('CYbMcoCFDCBz');
      logInfo(`step2 castToNormal("CYbMcoCFDCBz"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.castToNormal('kNkArm');
      logInfo(`step3 castToNormal("kNkArm"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.remove('');
      logInfo(`step4 remove(""): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.countOf('3lAqn');
      logInfo(`step5 countOf("3lAqn"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`add>castToNormal>castToNormal>remove>coun...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>castToNormal>castToNormal>remove>coun...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`add>castToNormal>castToNormal>remove>coun...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>castToNormal>castToNormal>remove>coun...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`add>castToNormal>castToNormal>remove>coun...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>castToNormal>castToNormal>remove>coun...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0023
     * @tc.name      FormExtAbility_FormStoreModelFlow_0023
     * @tc.desc      FormStoreModel call flow castToNormal > update > castToNormal > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0023 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('VFKHHhcF');
      logInfo(`step1 castToNormal("VFKHHhcF"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.update('3faGjx');
      logInfo(`step2 update("3faGjx"): step2=${step2}`);
      expect(step2).assertEqual('12');
      const step3: boolean = subject.castToNormal('2OVdV6');
      logInfo(`step3 castToNormal("2OVdV6"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.remove('9trAaR');
      logInfo(`step4 remove("9trAaR"): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`castToNormal>update>castToNormal>remove f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>update>castToNormal>remove f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["3faGjx"]');
      logInfo(`castToNormal>update>castToNormal>remove f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>update>castToNormal>remove f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>update>castToNormal>remove f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>update>castToNormal>remove f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0024
     * @tc.name      FormExtAbility_FormStoreModelFlow_0024
     * @tc.desc      FormStoreModel call flow remove > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0024 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('xYZxdlfDYt');
      logInfo(`step1 remove("xYZxdlfDYt"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.remove('abc_1');
      logInfo(`step2 remove("abc_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0025
     * @tc.name      FormExtAbility_FormStoreModelFlow_0025
     * @tc.desc      FormStoreModel call flow countOf > remove > castToNormal > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0025 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('xa');
      logInfo(`step1 countOf("xa"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.remove('xHello World');
      logInfo(`step2 remove("xHello World"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.castToNormal('vo');
      logInfo(`step3 castToNormal("vo"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.update('a_1');
      logInfo(`step4 update("a_1"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`countOf>remove>castToNormal>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>remove>castToNormal>update final: JSON.stringify(subject....${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1"]');
      logInfo(`countOf>remove>castToNormal>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>remove>castToNormal>update final: JSON.stringify(subject.na...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`countOf>remove>castToNormal>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>remove>castToNormal>update final: JSON.stringify(subject.te...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0026
     * @tc.name      FormExtAbility_FormStoreModelFlow_0026
     * @tc.desc      FormStoreModel call flow remove > castToNormal > countOf > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0026 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('xa');
      logInfo(`step1 remove("xa"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.castToNormal('Mz8owtfvXd');
      logInfo(`step2 castToNormal("Mz8owtfvXd"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.countOf('Sv');
      logInfo(`step3 countOf("Sv"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.update(' ');
      logInfo(`step4 update(" "): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`remove>castToNormal>countOf>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>castToNormal>countOf>update final: JSON.stringify(subject....${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`remove>castToNormal>countOf>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>castToNormal>countOf>update final: JSON.stringify(subject.na...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`remove>castToNormal>countOf>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>castToNormal>countOf>update final: JSON.stringify(subject.te...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0027
     * @tc.name      FormExtAbility_FormStoreModelFlow_0027
     * @tc.desc      FormStoreModel call flow countOf > update > castToNormal > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0027 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('x123');
      logInfo(`step1 countOf("x123"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.update('   ');
      logInfo(`step2 update("   "): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('FwCK');
      logInfo(`step3 castToNormal("FwCK"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.castToNormal('xa');
      logInfo(`step4 castToNormal("xa"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`countOf>update>castToNormal>castToNormal ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>update>castToNormal>castToNormal ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["   "]');
      logInfo(`countOf>update>castToNormal>castToNormal ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>update>castToNormal>castToNormal ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`countOf>update>castToNormal>castToNormal ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>update>castToNormal>castToNormal ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0028
     * @tc.name      FormExtAbility_FormStoreModelFlow_0028
     * @tc.desc      FormStoreModel call flow castToNormal > add > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0028 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('Hello World');
      logInfo(`step1 castToNormal("Hello World"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add('', 'Sample Title 123', true);
      logInfo(`step2 add("", "Sample Title 123", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('mm');
      logInfo(`step3 remove("mm"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`castToNormal>add>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>add>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`castToNormal>add>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>add>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`castToNormal>add>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>add>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0029
     * @tc.name      FormExtAbility_FormStoreModelFlow_0029
     * @tc.desc      FormStoreModel call flow add > remove > remove > update > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0029 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' ', 'abc', true);
      logInfo(`step1 add(" ", "abc", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.remove('5zgqxMFm');
      logInfo(`step2 remove("5zgqxMFm"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.remove('a');
      logInfo(`step3 remove("a"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.update('W1rrx');
      logInfo(`step4 update("W1rrx"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: string = subject.add('abc', '', false);
      logInfo(`step5 add("abc", "", false): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`add>remove>remove>update>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`add>remove>remove>update>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" ","W1rrx","abc"]');
      logInfo(`add>remove>remove>update>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`add>remove>remove>update>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc","",""]');
      logInfo(`add>remove>remove>update>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`add>remove>remove>update>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0030
     * @tc.name      FormExtAbility_FormStoreModelFlow_0030
     * @tc.desc      FormStoreModel call flow add > remove > castToNormal > castToNormal > countOf keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0030 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('abc', 'Hello World', true);
      logInfo(`step1 add("abc", "Hello World", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.remove('HhYyo');
      logInfo(`step2 remove("HhYyo"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: boolean = subject.castToNormal('a_1');
      logInfo(`step3 castToNormal("a_1"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.castToNormal('  ');
      logInfo(`step4 castToNormal("  "): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.countOf('jHRLt');
      logInfo(`step5 countOf("jHRLt"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`add>remove>castToNormal>castToNormal>coun...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>remove>castToNormal>castToNormal>coun...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc"]');
      logInfo(`add>remove>castToNormal>castToNormal>coun...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>remove>castToNormal>castToNormal>coun...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello World"]');
      logInfo(`add>remove>castToNormal>castToNormal>coun...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>remove>castToNormal>castToNormal>coun...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0031
     * @tc.name      FormExtAbility_FormStoreModelFlow_0031
     * @tc.desc      FormStoreModel call flow countOf > countOf > castToNormal > update > castToNormal keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0031 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('NdrWdE');
      logInfo(`step1 countOf("NdrWdE"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.countOf('LXX5o');
      logInfo(`step2 countOf("LXX5o"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.castToNormal('x5u34YdFbcQr');
      logInfo(`step3 castToNormal("x5u34YdFbcQr"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.update('XTx81V');
      logInfo(`step4 update("XTx81V"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: boolean = subject.castToNormal('wFg6PaTgeQ');
      logInfo(`step5 castToNormal("wFg6PaTgeQ"): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`countOf>countOf>castToNormal>update>castT...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>countOf>castToNormal>update>castT...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["XTx81V"]');
      logInfo(`countOf>countOf>castToNormal>update>castT...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>countOf>castToNormal>update>castT...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`countOf>countOf>castToNormal>update>castT...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>countOf>castToNormal>update>castT...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0032
     * @tc.name      FormExtAbility_FormStoreModelFlow_0032
     * @tc.desc      FormStoreModel call flow countOf > add > castToNormal > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0032 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('3lAqn');
      logInfo(`step1 countOf("3lAqn"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.add('', 'A', false);
      logInfo(`step2 add("", "A", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('IL6x4S2CE');
      logInfo(`step3 castToNormal("IL6x4S2CE"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.castToNormal('q9GUT');
      logInfo(`step4 castToNormal("q9GUT"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`countOf>add>castToNormal>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>add>castToNormal>castToNormal final: JSON.stringify(subje...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`countOf>add>castToNormal>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>add>castToNormal>castToNormal final: JSON.stringify(subject...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A"]');
      logInfo(`countOf>add>castToNormal>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>add>castToNormal>castToNormal final: JSON.stringify(subject...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0033
     * @tc.name      FormExtAbility_FormStoreModelFlow_0033
     * @tc.desc      FormStoreModel call flow remove > update > remove > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0033 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('abc_1');
      logInfo(`step1 remove("abc_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.update(' 123 ');
      logInfo(`step2 update(" 123 "): step2=${step2}`);
      expect(step2).assertEqual('12');
      const step3: number = subject.remove('xabc');
      logInfo(`step3 remove("xabc"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.countOf('ZTO8I20yqH');
      logInfo(`step4 countOf("ZTO8I20yqH"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`remove>update>remove>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>update>remove>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" 123 "]');
      logInfo(`remove>update>remove>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>update>remove>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`remove>update>remove>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>update>remove>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0034
     * @tc.name      FormExtAbility_FormStoreModelFlow_0034
     * @tc.desc      FormStoreModel call flow remove > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0034 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('j7HJlgiM1gzW');
      logInfo(`step1 remove("j7HJlgiM1gzW"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.add('123', '\u4e2d\u6587', false);
      logInfo(`step2 add("123", "??", false): step2=${step2}`);
      expect(step2).assertEqual('13');
      logInfo(`remove>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`remove>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`remove>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0035
     * @tc.name      FormExtAbility_FormStoreModelFlow_0035
     * @tc.desc      FormStoreModel call flow update > update > add > countOf > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0035 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('XbUePPZy');
      logInfo(`step1 update("XbUePPZy"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update('MDg');
      logInfo(`step2 update("MDg"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.add(' ', 'abc', false);
      logInfo(`step3 add(" ", "abc", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.countOf('xfMXx8l3');
      logInfo(`step4 countOf("xfMXx8l3"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: string = subject.add('', 'hello world', false);
      logInfo(`step5 add("", "hello world", false): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`update>update>add>countOf>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(4);
      logInfo(`update>update>add>countOf>add final: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["XbUePPZy","MDg"," ",""]');
      logInfo(`update>update>add>countOf>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(4);
      logInfo(`update>update>add>countOf>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","","abc","hello world"]');
      logInfo(`update>update>add>countOf>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(4);
      logInfo(`update>update>add>countOf>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0036
     * @tc.name      FormExtAbility_FormStoreModelFlow_0036
     * @tc.desc      FormStoreModel call flow remove > update > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0036 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('qcfMkkkNH6');
      logInfo(`step1 remove("qcfMkkkNH6"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.update('9xXqY');
      logInfo(`step2 update("9xXqY"): step2=${step2}`);
      expect(step2).assertEqual('18');
      const step3: number = subject.countOf('123');
      logInfo(`step3 countOf("123"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`remove>update>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>update>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["9xXqY"]');
      logInfo(`remove>update>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>update>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`remove>update>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>update>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0037
     * @tc.name      FormExtAbility_FormStoreModelFlow_0037
     * @tc.desc      FormStoreModel call flow countOf > add > countOf > update > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0037 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('YsVDz4e0Xt');
      logInfo(`step1 countOf("YsVDz4e0Xt"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.add(' a ', ' ', true);
      logInfo(`step2 add(" a ", " ", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.countOf('y');
      logInfo(`step3 countOf("y"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string = subject.update('KeZBzgpEzO');
      logInfo(`step4 update("KeZBzgpEzO"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: string = subject.add('a_1', 'a', true);
      logInfo(`step5 add("a_1", "a", true): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`countOf>add>countOf>update>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`countOf>add>countOf>update>add final: JSON.stringify(subject.form...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" a ","KeZBzgpEzO","a_1"]');
      logInfo(`countOf>add>countOf>update>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`countOf>add>countOf>update>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" ","","a"]');
      logInfo(`countOf>add>countOf>update>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`countOf>add>countOf>update>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0038
     * @tc.name      FormExtAbility_FormStoreModelFlow_0038
     * @tc.desc      FormStoreModel call flow countOf > castToNormal > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0038 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('T2');
      logInfo(`step1 countOf("T2"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.castToNormal('IL6x4S2CE');
      logInfo(`step2 castToNormal("IL6x4S2CE"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.remove('h');
      logInfo(`step3 remove("h"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0039
     * @tc.name      FormExtAbility_FormStoreModelFlow_0039
     * @tc.desc      FormStoreModel call flow add > castToNormal > remove > update > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0039 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('abc', ' ', false);
      logInfo(`step1 add("abc", " ", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('TbK40xHRY4J');
      logInfo(`step2 castToNormal("TbK40xHRY4J"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.remove('  ');
      logInfo(`step3 remove("  "): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.update('xabc');
      logInfo(`step4 update("xabc"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: number = subject.countOf('byo');
      logInfo(`step5 countOf("byo"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`add>castToNormal>remove>update>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>castToNormal>remove>update>countOf final: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc","xabc"]');
      logInfo(`add>castToNormal>remove>update>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>castToNormal>remove>update>countOf final: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" ",""]');
      logInfo(`add>castToNormal>remove>update>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>castToNormal>remove>update>countOf final: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0040
     * @tc.name      FormExtAbility_FormStoreModelFlow_0040
     * @tc.desc      FormStoreModel call flow add > countOf > update > add > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0040 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('', 'a', true);
      logInfo(`step1 add("", "a", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('xabc');
      logInfo(`step2 countOf("xabc"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.update('j555Grffw3jn');
      logInfo(`step3 update("j555Grffw3jn"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.add(' a ', 'Hello', false);
      logInfo(`step4 add(" a ", "Hello", false): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: string = subject.update('WHhk2ebfEhMM');
      logInfo(`step5 update("WHhk2ebfEhMM"): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`add>countOf>update>add>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(4);
      logInfo(`add>countOf>update>add>update final: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["","j555Grffw3jn"," a ","WHhk2ebfEhMM"]');
      logInfo(`add>countOf>update>add>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(4);
      logInfo(`add>countOf>update>add>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a","","Hello",""]');
      logInfo(`add>countOf>update>add>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(4);
      logInfo(`add>countOf>update>add>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0041
     * @tc.name      FormExtAbility_FormStoreModelFlow_0041
     * @tc.desc      FormStoreModel call flow update > countOf > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0041 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('x_1');
      logInfo(`step1 update("x_1"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('abc');
      logInfo(`step2 countOf("abc"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.castToNormal('x63mvZRv');
      logInfo(`step3 castToNormal("x63mvZRv"): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`update>countOf>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>countOf>castToNormal final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["x_1"]');
      logInfo(`update>countOf>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>countOf>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>countOf>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>countOf>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0042
     * @tc.name      FormExtAbility_FormStoreModelFlow_0042
     * @tc.desc      FormStoreModel call flow update > add > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0042 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('pI2KPWeUyVaO');
      logInfo(`step1 update("pI2KPWeUyVaO"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add(' ', 'A', false);
      logInfo(`step2 add(" ", "A", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('  ');
      logInfo(`step3 remove("  "): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`update>add>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`update>add>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["pI2KPWeUyVaO"," "]');
      logInfo(`update>add>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`update>add>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","A"]');
      logInfo(`update>add>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`update>add>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0043
     * @tc.name      FormExtAbility_FormStoreModelFlow_0043
     * @tc.desc      FormStoreModel call flow remove > countOf > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0043 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('SwWZ1E1');
      logInfo(`step1 remove("SwWZ1E1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.countOf('NdrWdE');
      logInfo(`step2 countOf("NdrWdE"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.countOf('FTWo');
      logInfo(`step3 countOf("FTWo"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0044
     * @tc.name      FormExtAbility_FormStoreModelFlow_0044
     * @tc.desc      FormStoreModel call flow update > castToNormal > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0044 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('a');
      logInfo(`step1 update("a"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('aa');
      logInfo(`step2 castToNormal("aa"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.add('', 'abc', true);
      logInfo(`step3 add("", "abc", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      logInfo(`update>castToNormal>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`update>castToNormal>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a",""]');
      logInfo(`update>castToNormal>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`update>castToNormal>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","abc"]');
      logInfo(`update>castToNormal>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`update>castToNormal>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0045
     * @tc.name      FormExtAbility_FormStoreModelFlow_0045
     * @tc.desc      FormStoreModel call flow castToNormal > castToNormal > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0045 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('ilsYSVW');
      logInfo(`step1 castToNormal("ilsYSVW"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.castToNormal('FwCK');
      logInfo(`step2 castToNormal("FwCK"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.remove('wzLcpu');
      logInfo(`step3 remove("wzLcpu"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelFlow_0045 end`);
    });
  });
}
