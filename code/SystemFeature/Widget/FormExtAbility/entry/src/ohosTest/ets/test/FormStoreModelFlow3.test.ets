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

/** Logic checks for FormStoreModel flow (42 cases). */
export default function formStoreModelFlow3Test(): void {
  describe('FormStoreModelFlow3Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0089
     * @tc.name      FormExtAbility_FormStoreModelFlow_0089
     * @tc.desc      FormStoreModel call flow remove > add > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0089 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('UCEjs9Lew');
      logInfo(`step1 remove("UCEjs9Lew"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.add(' ', 'abc', false);
      logInfo(`step2 add(" ", "abc", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('UjiOdYExM');
      logInfo(`step3 remove("UjiOdYExM"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`remove>add>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>add>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`remove>add>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>add>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc"]');
      logInfo(`remove>add>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>add>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0090
     * @tc.name      FormExtAbility_FormStoreModelFlow_0090
     * @tc.desc      FormStoreModel call flow update > update > remove > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0090 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update(' _1');
      logInfo(`step1 update(" _1"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update('x_1');
      logInfo(`step2 update("x_1"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('a');
      logInfo(`step3 remove("a"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string = subject.update('x123');
      logInfo(`step4 update("x123"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`update>update>remove>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`update>update>remove>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" _1","x_1","x123"]');
      logInfo(`update>update>remove>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`update>update>remove>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","",""]');
      logInfo(`update>update>remove>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`update>update>remove>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0091
     * @tc.name      FormExtAbility_FormStoreModelFlow_0091
     * @tc.desc      FormStoreModel call flow castToNormal > countOf > castToNormal > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0091 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('xabc');
      logInfo(`step1 castToNormal("xabc"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.countOf('123');
      logInfo(`step2 countOf("123"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.castToNormal('FwCK');
      logInfo(`step3 castToNormal("FwCK"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.update('xHello World');
      logInfo(`step4 update("xHello World"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`castToNormal>countOf>castToNormal>update ...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>countOf>castToNormal>update ...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xHello World"]');
      logInfo(`castToNormal>countOf>castToNormal>update ...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>countOf>castToNormal>update ...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>countOf>castToNormal>update ...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>countOf>castToNormal>update ...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0092
     * @tc.name      FormExtAbility_FormStoreModelFlow_0092
     * @tc.desc      FormStoreModel call flow castToNormal > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0092 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('VFKHHhcF');
      logInfo(`step1 castToNormal("VFKHHhcF"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.update('xClwfKTvO');
      logInfo(`step2 update("xClwfKTvO"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`castToNormal>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xClwfKTvO"]');
      logInfo(`castToNormal>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0093
     * @tc.name      FormExtAbility_FormStoreModelFlow_0093
     * @tc.desc      FormStoreModel call flow add > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0093 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('', 'a', true);
      logInfo(`step1 add("", "a", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('xxEm4lenI');
      logInfo(`step2 countOf("xxEm4lenI"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`add>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0094
     * @tc.name      FormExtAbility_FormStoreModelFlow_0094
     * @tc.desc      FormStoreModel call flow countOf > countOf > countOf > countOf > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0094 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('FTWo');
      logInfo(`step1 countOf("FTWo"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.countOf('tra2Ozfs');
      logInfo(`step2 countOf("tra2Ozfs"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.countOf('xabc');
      logInfo(`step3 countOf("xabc"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.countOf('   ');
      logInfo(`step4 countOf("   "): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: string = subject.update('  ');
      logInfo(`step5 update("  "): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`countOf>countOf>countOf>countOf>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>countOf>countOf>countOf>update final: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["  "]');
      logInfo(`countOf>countOf>countOf>countOf>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>countOf>countOf>countOf>update final: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`countOf>countOf>countOf>countOf>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>countOf>countOf>countOf>update final: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0095
     * @tc.name      FormExtAbility_FormStoreModelFlow_0095
     * @tc.desc      FormStoreModel call flow castToNormal > add > update > add > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0095 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('TbK40xHRY4J');
      logInfo(`step1 castToNormal("TbK40xHRY4J"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add('xa', 'abc', true);
      logInfo(`step2 add("xa", "abc", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.update('Kg6dFIQTw1M');
      logInfo(`step3 update("Kg6dFIQTw1M"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.add(' ', 'abc', false);
      logInfo(`step4 add(" ", "abc", false): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: number = subject.remove('Avaw');
      logInfo(`step5 remove("Avaw"): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`castToNormal>add>update>add>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`castToNormal>add>update>add>remove final: JSON.stringify(subject....${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xa","Kg6dFIQTw1M"," "]');
      logInfo(`castToNormal>add>update>add>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`castToNormal>add>update>add>remove final: JSON.stringify(subject.na...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc","","abc"]');
      logInfo(`castToNormal>add>update>add>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`castToNormal>add>update>add>remove final: JSON.stringify(subject.te...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0096
     * @tc.name      FormExtAbility_FormStoreModelFlow_0096
     * @tc.desc      FormStoreModel call flow add > update > add > update > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0096 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('abc', '', false);
      logInfo(`step1 add("abc", "", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update('MT7krsynX');
      logInfo(`step2 update("MT7krsynX"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.add('a', 'Sample Title 123', true);
      logInfo(`step3 add("a", "Sample Title 123", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('6tTvXkLFOLq6');
      logInfo(`step4 update("6tTvXkLFOLq6"): step4=${step4}`);
      expect(step4).assertEqual('15');
      const step5: number = subject.countOf('U1tyjyq');
      logInfo(`step5 countOf("U1tyjyq"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`add>update>add>update>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(4);
      logInfo(`add>update>add>update>countOf final: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc","MT7krsynX","a","6tTvXkLFOLq6"]');
      logInfo(`add>update>add>update>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(4);
      logInfo(`add>update>add>update>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","","Sample Title 123",""]');
      logInfo(`add>update>add>update>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(4);
      logInfo(`add>update>add>update>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0097
     * @tc.name      FormExtAbility_FormStoreModelFlow_0097
     * @tc.desc      FormStoreModel call flow update > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0097 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('a');
      logInfo(`step1 update("a"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.remove('xHello World');
      logInfo(`step2 remove("xHello World"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`update>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"]');
      logInfo(`update>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0098
     * @tc.name      FormExtAbility_FormStoreModelFlow_0098
     * @tc.desc      FormStoreModel call flow countOf > update > add > add > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0098 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('F0xQ69Hr');
      logInfo(`step1 countOf("F0xQ69Hr"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.update('Hello World');
      logInfo(`step2 update("Hello World"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.add('', 'abc', true);
      logInfo(`step3 add("", "abc", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.add(' a ', ' ', false);
      logInfo(`step4 add(" a ", " ", false): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: string = subject.add('abc', 'A', true);
      logInfo(`step5 add("abc", "A", true): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`countOf>update>add>add>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(4);
      logInfo(`countOf>update>add>add>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World",""," a ","abc"]');
      logInfo(`countOf>update>add>add>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(4);
      logInfo(`countOf>update>add>add>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","abc"," ","A"]');
      logInfo(`countOf>update>add>add>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(4);
      logInfo(`countOf>update>add>add>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true,false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0099
     * @tc.name      FormExtAbility_FormStoreModelFlow_0099
     * @tc.desc      FormStoreModel call flow add > add > castToNormal > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0099 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('123', 'a', true);
      logInfo(`step1 add("123", "a", true): step1=${step1}`);
      expect(step1).assertEqual('13');
      const step2: string = subject.add('123', 'Sample Title 123', true);
      logInfo(`step2 add("123", "Sample Title 123", true): step2=${step2}`);
      expect(step2).assertEqual('13');
      const step3: boolean = subject.castToNormal('41VX');
      logInfo(`step3 castToNormal("41VX"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.castToNormal('uFP');
      logInfo(`step4 castToNormal("uFP"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`add>add>castToNormal>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>add>castToNormal>castToNormal final: JSON.stringify(subject.f...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123"]');
      logInfo(`add>add>castToNormal>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>add>castToNormal>castToNormal final: JSON.stringify(subject.nam...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add>add>castToNormal>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>add>castToNormal>castToNormal final: JSON.stringify(subject.tem...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0100
     * @tc.name      FormExtAbility_FormStoreModelFlow_0100
     * @tc.desc      FormStoreModel call flow remove > remove > update > remove > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0100 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('SZW8Qo7u3h');
      logInfo(`step1 remove("SZW8Qo7u3h"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.remove('Hello World_1');
      logInfo(`step2 remove("Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.update('xmcsPKMRBBav');
      logInfo(`step3 update("xmcsPKMRBBav"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.remove('Hello World_1');
      logInfo(`step4 remove("Hello World_1"): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.add(' a ', 'a', true);
      logInfo(`step5 add(" a ", "a", true): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`remove>remove>update>remove>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`remove>remove>update>remove>add final: JSON.stringify(subject.for...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xmcsPKMRBBav"," a "]');
      logInfo(`remove>remove>update>remove>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`remove>remove>update>remove>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","a"]');
      logInfo(`remove>remove>update>remove>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`remove>remove>update>remove>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0101
     * @tc.name      FormExtAbility_FormStoreModelFlow_0101
     * @tc.desc      FormStoreModel call flow countOf > remove > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0101 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('Hello World');
      logInfo(`step1 countOf("Hello World"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.remove('xYZxdlfDYt');
      logInfo(`step2 remove("xYZxdlfDYt"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.update(' ');
      logInfo(`step3 update(" "): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      logInfo(`countOf>remove>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>remove>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`countOf>remove>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>remove>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`countOf>remove>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>remove>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0102
     * @tc.name      FormExtAbility_FormStoreModelFlow_0102
     * @tc.desc      FormStoreModel call flow add > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0102 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('a_1', '\u4e2d\u6587', false);
      logInfo(`step1 add("a_1", "??", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('T2');
      logInfo(`step2 countOf("T2"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`add>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1"]');
      logInfo(`add>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`add>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0103
     * @tc.name      FormExtAbility_FormStoreModelFlow_0103
     * @tc.desc      FormStoreModel call flow castToNormal > add > add > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0103 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('vo');
      logInfo(`step1 castToNormal("vo"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add('a_1', '', true);
      logInfo(`step2 add("a_1", "", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.add('123', 'Hello', false);
      logInfo(`step3 add("123", "Hello", false): step3=${step3}`);
      expect(step3).assertEqual('13');
      const step4: string = subject.add('aa', '\u4e2d\u6587', true);
      logInfo(`step4 add("aa", "??", true): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`castToNormal>add>add>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`castToNormal>add>add>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1","123","aa"]');
      logInfo(`castToNormal>add>add>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`castToNormal>add>add>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","Hello","\u4e2d\u6587"]');
      logInfo(`castToNormal>add>add>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`castToNormal>add>add>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0104
     * @tc.name      FormExtAbility_FormStoreModelFlow_0104
     * @tc.desc      FormStoreModel call flow countOf > castToNormal > castToNormal > castToNormal keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0104 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('tra2Ozfs');
      logInfo(`step1 countOf("tra2Ozfs"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.castToNormal('1');
      logInfo(`step2 castToNormal("1"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.castToNormal('s');
      logInfo(`step3 castToNormal("s"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.castToNormal('IL6x4S2CE');
      logInfo(`step4 castToNormal("IL6x4S2CE"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0105
     * @tc.name      FormExtAbility_FormStoreModelFlow_0105
     * @tc.desc      FormStoreModel call flow update > countOf > add > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0105 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('z8tV4RGeuP7');
      logInfo(`step1 update("z8tV4RGeuP7"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf(' Hello World ');
      logInfo(`step2 countOf(" Hello World "): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.add('Hello World', '\u4e2d\u6587', true);
      logInfo(`step3 add("Hello World", "??", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: boolean = subject.castToNormal('IsAoQF');
      logInfo(`step4 castToNormal("IsAoQF"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`update>countOf>add>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`update>countOf>add>castToNormal final: JSON.stringify(subject.for...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["z8tV4RGeuP7","Hello World"]');
      logInfo(`update>countOf>add>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`update>countOf>add>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","\u4e2d\u6587"]');
      logInfo(`update>countOf>add>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`update>countOf>add>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0106
     * @tc.name      FormExtAbility_FormStoreModelFlow_0106
     * @tc.desc      FormStoreModel call flow add > update > add > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0106 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('abc', 'Hello World', true);
      logInfo(`step1 add("abc", "Hello World", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update('AZzdKkzvg');
      logInfo(`step2 update("AZzdKkzvg"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.add('', '\u4e2d\u6587', true);
      logInfo(`step3 add("", "??", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.remove('UCEjs9Lew');
      logInfo(`step4 remove("UCEjs9Lew"): step4=${step4}`);
      expect(step4).assertEqual(3);
      logInfo(`add>update>add>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`add>update>add>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc","AZzdKkzvg",""]');
      logInfo(`add>update>add>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`add>update>add>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello World","","\u4e2d\u6587"]');
      logInfo(`add>update>add>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`add>update>add>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0107
     * @tc.name      FormExtAbility_FormStoreModelFlow_0107
     * @tc.desc      FormStoreModel call flow castToNormal > add > castToNormal > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0107 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('vW');
      logInfo(`step1 castToNormal("vW"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add('', 'hello world', false);
      logInfo(`step2 add("", "hello world", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('AE7A2');
      logInfo(`step3 castToNormal("AE7A2"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.remove('0L');
      logInfo(`step4 remove("0L"): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`castToNormal>add>castToNormal>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>add>castToNormal>remove final: JSON.stringify(subjec...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`castToNormal>add>castToNormal>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>add>castToNormal>remove final: JSON.stringify(subject....${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`castToNormal>add>castToNormal>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>add>castToNormal>remove final: JSON.stringify(subject....${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0108
     * @tc.name      FormExtAbility_FormStoreModelFlow_0108
     * @tc.desc      FormStoreModel call flow countOf > add > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0108 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('SnbRSUZ5s8A');
      logInfo(`step1 countOf("SnbRSUZ5s8A"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.add('a_1', 'a', true);
      logInfo(`step2 add("a_1", "a", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('q');
      logInfo(`step3 remove("q"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`countOf>add>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>add>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1"]');
      logInfo(`countOf>add>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>add>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`countOf>add>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>add>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0109
     * @tc.name      FormExtAbility_FormStoreModelFlow_0109
     * @tc.desc      FormStoreModel call flow add > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0109 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('Hello World', 'hello world', true);
      logInfo(`step1 add("Hello World", "hello world", t...: step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.remove('');
      logInfo(`step2 remove(""): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`add>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"]');
      logInfo(`add>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world"]');
      logInfo(`add>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0110
     * @tc.name      FormExtAbility_FormStoreModelFlow_0110
     * @tc.desc      FormStoreModel call flow remove > update > remove > add > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0110 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('h');
      logInfo(`step1 remove("h"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.update('DxouDM4r6M');
      logInfo(`step2 update("DxouDM4r6M"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('vTa6dtKT14qI');
      logInfo(`step3 remove("vTa6dtKT14qI"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.add('aa', 'a', false);
      logInfo(`step4 add("aa", "a", false): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: number = subject.countOf('yH8uzba');
      logInfo(`step5 countOf("yH8uzba"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`remove>update>remove>add>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`remove>update>remove>add>countOf final: JSON.stringify(subject.fo...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["DxouDM4r6M","aa"]');
      logInfo(`remove>update>remove>add>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`remove>update>remove>add>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","a"]');
      logInfo(`remove>update>remove>add>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`remove>update>remove>add>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0111
     * @tc.name      FormExtAbility_FormStoreModelFlow_0111
     * @tc.desc      FormStoreModel call flow castToNormal > update > remove > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0111 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('a_1');
      logInfo(`step1 castToNormal("a_1"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.update('Yi6E');
      logInfo(`step2 update("Yi6E"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('HhYyo');
      logInfo(`step3 remove("HhYyo"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.update(' _1');
      logInfo(`step4 update(" _1"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`castToNormal>update>remove>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`castToNormal>update>remove>update final: JSON.stringify(subject.f...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Yi6E"," _1"]');
      logInfo(`castToNormal>update>remove>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`castToNormal>update>remove>update final: JSON.stringify(subject.nam...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["",""]');
      logInfo(`castToNormal>update>remove>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`castToNormal>update>remove>update final: JSON.stringify(subject.tem...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0112
     * @tc.name      FormExtAbility_FormStoreModelFlow_0112
     * @tc.desc      FormStoreModel call flow add > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0112 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('aa', 'Hello', false);
      logInfo(`step1 add("aa", "Hello", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update('MDg');
      logInfo(`step2 update("MDg"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`add>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["aa","MDg"]');
      logInfo(`add>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello",""]');
      logInfo(`add>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0113
     * @tc.name      FormExtAbility_FormStoreModelFlow_0113
     * @tc.desc      FormStoreModel call flow remove > castToNormal > castToNormal > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0113 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('HvzaKI');
      logInfo(`step1 remove("HvzaKI"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.castToNormal('qNfUIvg');
      logInfo(`step2 castToNormal("qNfUIvg"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.castToNormal('unKFdYo19kz');
      logInfo(`step3 castToNormal("unKFdYo19kz"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.add('a_1', ' ', false);
      logInfo(`step4 add("a_1", " ", false): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`remove>castToNormal>castToNormal>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>castToNormal>castToNormal>add final: JSON.stringify(subjec...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1"]');
      logInfo(`remove>castToNormal>castToNormal>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>castToNormal>castToNormal>add final: JSON.stringify(subject....${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" "]');
      logInfo(`remove>castToNormal>castToNormal>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>castToNormal>castToNormal>add final: JSON.stringify(subject....${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0114
     * @tc.name      FormExtAbility_FormStoreModelFlow_0114
     * @tc.desc      FormStoreModel call flow castToNormal > countOf > add > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0114 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('vo');
      logInfo(`step1 castToNormal("vo"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.countOf('YsVDz4e0Xt');
      logInfo(`step2 countOf("YsVDz4e0Xt"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.add(' ', '', false);
      logInfo(`step3 add(" ", "", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: boolean = subject.castToNormal('gT');
      logInfo(`step4 castToNormal("gT"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`castToNormal>countOf>add>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>countOf>add>castToNormal final: JSON.stringify(subje...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`castToNormal>countOf>add>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>countOf>add>castToNormal final: JSON.stringify(subject...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>countOf>add>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>countOf>add>castToNormal final: JSON.stringify(subject...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0115
     * @tc.name      FormExtAbility_FormStoreModelFlow_0115
     * @tc.desc      FormStoreModel call flow add > castToNormal > remove > update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0115 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' ', 'A', false);
      logInfo(`step1 add(" ", "A", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('xa');
      logInfo(`step2 castToNormal("xa"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.remove('L285MhOx');
      logInfo(`step3 remove("L285MhOx"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.update('2l5Z8yY4');
      logInfo(`step4 update("2l5Z8yY4"): step4=${step4}`);
      expect(step4).assertEqual('11');
      const step5: boolean = subject.castToNormal('abc');
      logInfo(`step5 castToNormal("abc"): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`add>castToNormal>remove>update>castToNorm...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>castToNormal>remove>update>castToNorm...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" ","2l5Z8yY4"]');
      logInfo(`add>castToNormal>remove>update>castToNorm...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>castToNormal>remove>update>castToNorm...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A",""]');
      logInfo(`add>castToNormal>remove>update>castToNorm...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>castToNormal>remove>update>castToNorm...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0116
     * @tc.name      FormExtAbility_FormStoreModelFlow_0116
     * @tc.desc      FormStoreModel call flow castToNormal > update > remove > update > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0116 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('6Ego');
      logInfo(`step1 castToNormal("6Ego"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.update('WHhk2ebfEhMM');
      logInfo(`step2 update("WHhk2ebfEhMM"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('xHello World');
      logInfo(`step3 remove("xHello World"): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string = subject.update('P87hAVlYM');
      logInfo(`step4 update("P87hAVlYM"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: string = subject.add(' a ', 'A', true);
      logInfo(`step5 add(" a ", "A", true): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`castToNormal>update>remove>update>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`castToNormal>update>remove>update>add final: JSON.stringify(subje...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["WHhk2ebfEhMM","P87hAVlYM"," a "]');
      logInfo(`castToNormal>update>remove>update>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`castToNormal>update>remove>update>add final: JSON.stringify(subject...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","","A"]');
      logInfo(`castToNormal>update>remove>update>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`castToNormal>update>remove>update>add final: JSON.stringify(subject...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0117
     * @tc.name      FormExtAbility_FormStoreModelFlow_0117
     * @tc.desc      FormStoreModel call flow add > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0117 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('aa', ' ', true);
      logInfo(`step1 add("aa", " ", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update('DxouDM4r6M');
      logInfo(`step2 update("DxouDM4r6M"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`add>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["aa","DxouDM4r6M"]');
      logInfo(`add>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" ",""]');
      logInfo(`add>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0118
     * @tc.name      FormExtAbility_FormStoreModelFlow_0118
     * @tc.desc      FormStoreModel call flow remove > update > update > remove > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0118 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('aa');
      logInfo(`step1 remove("aa"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.update('  ');
      logInfo(`step2 update("  "): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.update('LvrtP8oo');
      logInfo(`step3 update("LvrtP8oo"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.remove('j7HJlgiM1gzW');
      logInfo(`step4 remove("j7HJlgiM1gzW"): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.remove('9trAaR');
      logInfo(`step5 remove("9trAaR"): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`remove>update>update>remove>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`remove>update>update>remove>remove final: JSON.stringify(subject....${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["  ","LvrtP8oo"]');
      logInfo(`remove>update>update>remove>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`remove>update>update>remove>remove final: JSON.stringify(subject.na...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["",""]');
      logInfo(`remove>update>update>remove>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`remove>update>update>remove>remove final: JSON.stringify(subject.te...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0119
     * @tc.name      FormExtAbility_FormStoreModelFlow_0119
     * @tc.desc      FormStoreModel call flow remove > update > update > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0119 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('ojwq6S');
      logInfo(`step1 remove("ojwq6S"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.update('Hello WorldHello World');
      logInfo(`step2 update("Hello WorldHello World"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.update('YYiDdR7Fe');
      logInfo(`step3 update("YYiDdR7Fe"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.countOf('E3Hbq6h');
      logInfo(`step4 countOf("E3Hbq6h"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`remove>update>update>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`remove>update>update>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello WorldHello World","YYiDdR7Fe"]');
      logInfo(`remove>update>update>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`remove>update>update>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["",""]');
      logInfo(`remove>update>update>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`remove>update>update>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0120
     * @tc.name      FormExtAbility_FormStoreModelFlow_0120
     * @tc.desc      FormStoreModel call flow castToNormal > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0120 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('iJXAuI3P');
      logInfo(`step1 castToNormal("iJXAuI3P"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.update('I5FJ7Fl');
      logInfo(`step2 update("I5FJ7Fl"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`castToNormal>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["I5FJ7Fl"]');
      logInfo(`castToNormal>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0121
     * @tc.name      FormExtAbility_FormStoreModelFlow_0121
     * @tc.desc      FormStoreModel call flow update > update > countOf > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0121 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('abc');
      logInfo(`step1 update("abc"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update('bc');
      logInfo(`step2 update("bc"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.countOf('TOBmolerxS2');
      logInfo(`step3 countOf("TOBmolerxS2"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.countOf('GI');
      logInfo(`step4 countOf("GI"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`update>update>countOf>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`update>update>countOf>countOf final: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc","bc"]');
      logInfo(`update>update>countOf>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`update>update>countOf>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["",""]');
      logInfo(`update>update>countOf>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`update>update>countOf>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0122
     * @tc.name      FormExtAbility_FormStoreModelFlow_0122
     * @tc.desc      FormStoreModel call flow castToNormal > remove > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0122 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('saRqI');
      logInfo(`step1 castToNormal("saRqI"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.remove(' ');
      logInfo(`step2 remove(" "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.castToNormal('Hello World');
      logInfo(`step3 castToNormal("Hello World"): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0123
     * @tc.name      FormExtAbility_FormStoreModelFlow_0123
     * @tc.desc      FormStoreModel call flow add > remove > update > countOf > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0123 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('123', 'a', false);
      logInfo(`step1 add("123", "a", false): step1=${step1}`);
      expect(step1).assertEqual('13');
      const step2: number = subject.remove('');
      logInfo(`step2 remove(""): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.update('NH4JDit5');
      logInfo(`step3 update("NH4JDit5"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.countOf('xa');
      logInfo(`step4 countOf("xa"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: string = subject.add('a', 'a', true);
      logInfo(`step5 add("a", "a", true): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`add>remove>update>countOf>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`add>remove>update>countOf>add final: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123","NH4JDit5","a"]');
      logInfo(`add>remove>update>countOf>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`add>remove>update>countOf>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a","","a"]');
      logInfo(`add>remove>update>countOf>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`add>remove>update>countOf>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0124
     * @tc.name      FormExtAbility_FormStoreModelFlow_0124
     * @tc.desc      FormStoreModel call flow add > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0124 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('a', 'Hello World', false);
      logInfo(`step1 add("a", "Hello World", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update('bc');
      logInfo(`step2 update("bc"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`add>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a","bc"]');
      logInfo(`add>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello World",""]');
      logInfo(`add>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0125
     * @tc.name      FormExtAbility_FormStoreModelFlow_0125
     * @tc.desc      FormStoreModel call flow countOf > remove > add > add > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0125 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('xa');
      logInfo(`step1 countOf("xa"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.remove('U');
      logInfo(`step2 remove("U"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.add('abc', ' ', false);
      logInfo(`step3 add("abc", " ", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.add('Hello World', '', true);
      logInfo(`step4 add("Hello World", "", true): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: string = subject.add(' a ', 'Hello', false);
      logInfo(`step5 add(" a ", "Hello", false): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`countOf>remove>add>add>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`countOf>remove>add>add>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abc","Hello World"," a "]');
      logInfo(`countOf>remove>add>add>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`countOf>remove>add>add>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[" ","","Hello"]');
      logInfo(`countOf>remove>add>add>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`countOf>remove>add>add>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0126
     * @tc.name      FormExtAbility_FormStoreModelFlow_0126
     * @tc.desc      FormStoreModel call flow countOf > countOf > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0126 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('Hello World');
      logInfo(`step1 countOf("Hello World"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.countOf(' _1');
      logInfo(`step2 countOf(" _1"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.castToNormal('uFP');
      logInfo(`step3 castToNormal("uFP"): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0127
     * @tc.name      FormExtAbility_FormStoreModelFlow_0127
     * @tc.desc      FormStoreModel call flow castToNormal > remove > remove > update > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0127 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('vo');
      logInfo(`step1 castToNormal("vo"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.remove('Mjk');
      logInfo(`step2 remove("Mjk"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.remove('5eCHkekd49pG');
      logInfo(`step3 remove("5eCHkekd49pG"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.update('W1rrx');
      logInfo(`step4 update("W1rrx"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: string = subject.add('a', 'a', true);
      logInfo(`step5 add("a", "a", true): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`castToNormal>remove>remove>update>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`castToNormal>remove>remove>update>add final: JSON.stringify(subje...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["W1rrx","a"]');
      logInfo(`castToNormal>remove>remove>update>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`castToNormal>remove>remove>update>add final: JSON.stringify(subject...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","a"]');
      logInfo(`castToNormal>remove>remove>update>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`castToNormal>remove>remove>update>add final: JSON.stringify(subject...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0128
     * @tc.name      FormExtAbility_FormStoreModelFlow_0128
     * @tc.desc      FormStoreModel call flow update > add > castToNormal > castToNormal > countOf keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0128 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('   ');
      logInfo(`step1 update("   "): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add('abc', 'Hello World', true);
      logInfo(`step2 add("abc", "Hello World", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('lU');
      logInfo(`step3 castToNormal("lU"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.castToNormal('qNfUIvg');
      logInfo(`step4 castToNormal("qNfUIvg"): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.countOf('LAn9');
      logInfo(`step5 countOf("LAn9"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`update>add>castToNormal>castToNormal>coun...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`update>add>castToNormal>castToNormal>coun...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["   ","abc"]');
      logInfo(`update>add>castToNormal>castToNormal>coun...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`update>add>castToNormal>castToNormal>coun...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","Hello World"]');
      logInfo(`update>add>castToNormal>castToNormal>coun...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`update>add>castToNormal>castToNormal>coun...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0129
     * @tc.name      FormExtAbility_FormStoreModelFlow_0129
     * @tc.desc      FormStoreModel call flow update > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0129 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('t6g');
      logInfo(`step1 update("t6g"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('gRZoE');
      logInfo(`step2 countOf("gRZoE"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`update>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["t6g"]');
      logInfo(`update>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0130
     * @tc.name      FormExtAbility_FormStoreModelFlow_0130
     * @tc.desc      FormStoreModel call flow update > remove > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0130 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('Hello WorldHello World');
      logInfo(`step1 update("Hello WorldHello World"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.remove('abcabc');
      logInfo(`step2 remove("abcabc"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.add('a', '', true);
      logInfo(`step3 add("a", "", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      logInfo(`update>remove>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`update>remove>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello WorldHello World","a"]');
      logInfo(`update>remove>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`update>remove>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["",""]');
      logInfo(`update>remove>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`update>remove>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0130 end`);
    });
  });
}
