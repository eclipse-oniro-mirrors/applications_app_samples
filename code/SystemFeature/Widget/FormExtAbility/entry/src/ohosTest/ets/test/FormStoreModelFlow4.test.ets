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
export default function formStoreModelFlow4Test(): void {
  describe('FormStoreModelFlow4Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0131
     * @tc.name      FormExtAbility_FormStoreModelFlow_0131
     * @tc.desc      FormStoreModel call flow update > remove > castToNormal > add > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0131 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('S9jQnJL');
      logInfo(`step1 update("S9jQnJL"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.remove('L285MhOx');
      logInfo(`step2 remove("L285MhOx"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: boolean = subject.castToNormal('TbK40xHRY4J');
      logInfo(`step3 castToNormal("TbK40xHRY4J"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.add('aa', '', true);
      logInfo(`step4 add("aa", "", true): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: boolean = subject.castToNormal('  ');
      logInfo(`step5 castToNormal("  "): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`update>remove>castToNormal>add>castToNorm...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`update>remove>castToNormal>add>castToNorm...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["S9jQnJL","aa"]');
      logInfo(`update>remove>castToNormal>add>castToNorm...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`update>remove>castToNormal>add>castToNorm...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["",""]');
      logInfo(`update>remove>castToNormal>add>castToNorm...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`update>remove>castToNormal>add>castToNorm...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0132
     * @tc.name      FormExtAbility_FormStoreModelFlow_0132
     * @tc.desc      FormStoreModel call flow castToNormal > countOf > remove > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0132 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('ilXxu');
      logInfo(`step1 castToNormal("ilXxu"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.countOf('abcabc');
      logInfo(`step2 countOf("abcabc"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.remove('f');
      logInfo(`step3 remove("f"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.update('XTCQt');
      logInfo(`step4 update("XTCQt"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`castToNormal>countOf>remove>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>countOf>remove>update final: JSON.stringify(subject....${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["XTCQt"]');
      logInfo(`castToNormal>countOf>remove>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>countOf>remove>update final: JSON.stringify(subject.na...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>countOf>remove>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>countOf>remove>update final: JSON.stringify(subject.te...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0133
     * @tc.name      FormExtAbility_FormStoreModelFlow_0133
     * @tc.desc      FormStoreModel call flow add > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0133 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' a ', 'hello world', true);
      logInfo(`step1 add(" a ", "hello world", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update('xabc');
      logInfo(`step2 update("xabc"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`add>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" a ","xabc"]');
      logInfo(`add>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["hello world",""]');
      logInfo(`add>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0134
     * @tc.name      FormExtAbility_FormStoreModelFlow_0134
     * @tc.desc      FormStoreModel call flow countOf > castToNormal > castToNormal > add > castToNormal keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0134 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('mdokQWX8QPyh');
      logInfo(`step1 countOf("mdokQWX8QPyh"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.castToNormal('aa');
      logInfo(`step2 castToNormal("aa"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.castToNormal('IL6x4S2CE');
      logInfo(`step3 castToNormal("IL6x4S2CE"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.add(' ', 'Hello World', true);
      logInfo(`step4 add(" ", "Hello World", true): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: boolean = subject.castToNormal('gT');
      logInfo(`step5 castToNormal("gT"): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`countOf>castToNormal>castToNormal>add>cas...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>castToNormal>castToNormal>add>cas...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`countOf>castToNormal>castToNormal>add>cas...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>castToNormal>castToNormal>add>cas...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello World"]');
      logInfo(`countOf>castToNormal>castToNormal>add>cas...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>castToNormal>castToNormal>add>cas...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0135
     * @tc.name      FormExtAbility_FormStoreModelFlow_0135
     * @tc.desc      FormStoreModel call flow remove > countOf > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0135 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove(' _1');
      logInfo(`step1 remove(" _1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.countOf('gqOdtifCgL');
      logInfo(`step2 countOf("gqOdtifCgL"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.castToNormal('VFKHHhcF');
      logInfo(`step3 castToNormal("VFKHHhcF"): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0136
     * @tc.name      FormExtAbility_FormStoreModelFlow_0136
     * @tc.desc      FormStoreModel call flow countOf > castToNormal > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0136 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('NdrWdE');
      logInfo(`step1 countOf("NdrWdE"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.castToNormal('saRqI');
      logInfo(`step2 castToNormal("saRqI"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.castToNormal('TbK40xHRY4J');
      logInfo(`step3 castToNormal("TbK40xHRY4J"): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}FormStoreModelFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0137
     * @tc.name      FormExtAbility_FormStoreModelFlow_0137
     * @tc.desc      FormStoreModel call flow castToNormal > update > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0137 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('mtf5i9');
      logInfo(`step1 castToNormal("mtf5i9"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.update('XFrpp7IvX');
      logInfo(`step2 update("XFrpp7IvX"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.update('  ');
      logInfo(`step3 update("  "): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('a_1');
      logInfo(`step4 update("a_1"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`castToNormal>update>update>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`castToNormal>update>update>update final: JSON.stringify(subject.f...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["XFrpp7IvX","  ","a_1"]');
      logInfo(`castToNormal>update>update>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`castToNormal>update>update>update final: JSON.stringify(subject.nam...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","",""]');
      logInfo(`castToNormal>update>update>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`castToNormal>update>update>update final: JSON.stringify(subject.tem...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0138
     * @tc.name      FormExtAbility_FormStoreModelFlow_0138
     * @tc.desc      FormStoreModel call flow countOf > countOf > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0138 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('LAn9');
      logInfo(`step1 countOf("LAn9"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.countOf('TVy');
      logInfo(`step2 countOf("TVy"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.countOf('zQ');
      logInfo(`step3 countOf("zQ"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0139
     * @tc.name      FormExtAbility_FormStoreModelFlow_0139
     * @tc.desc      FormStoreModel call flow castToNormal > update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0139 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('vu6');
      logInfo(`step1 castToNormal("vu6"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.update('Yi6E');
      logInfo(`step2 update("Yi6E"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('2OVdV6');
      logInfo(`step3 castToNormal("2OVdV6"): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`castToNormal>update>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>update>castToNormal final: JSON.stringify(subject.fo...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Yi6E"]');
      logInfo(`castToNormal>update>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>update>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>update>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>update>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0140
     * @tc.name      FormExtAbility_FormStoreModelFlow_0140
     * @tc.desc      FormStoreModel call flow add > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0140 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('a', 'Sample Title 123', true);
      logInfo(`step1 add("a", "Sample Title 123", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add(' ', 'abc', true);
      logInfo(`step2 add(" ", "abc", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`add>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"," "]');
      logInfo(`add>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123","abc"]');
      logInfo(`add>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0141
     * @tc.name      FormExtAbility_FormStoreModelFlow_0141
     * @tc.desc      FormStoreModel call flow castToNormal > countOf > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0141 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('D7UR5Wh3dg');
      logInfo(`step1 castToNormal("D7UR5Wh3dg"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.countOf('  ');
      logInfo(`step2 countOf("  "): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.update('6tTvXkLFOLq6');
      logInfo(`step3 update("6tTvXkLFOLq6"): step3=${step3}`);
      expect(step3).assertEqual('15');
      logInfo(`castToNormal>countOf>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>countOf>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["6tTvXkLFOLq6"]');
      logInfo(`castToNormal>countOf>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>countOf>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>countOf>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>countOf>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0142
     * @tc.name      FormExtAbility_FormStoreModelFlow_0142
     * @tc.desc      FormStoreModel call flow remove > remove > update > update > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0142 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove(' ');
      logInfo(`step1 remove(" "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.remove('h');
      logInfo(`step2 remove("h"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.update('xmcsPKMRBBav');
      logInfo(`step3 update("xmcsPKMRBBav"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('AZzdKkzvg');
      logInfo(`step4 update("AZzdKkzvg"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: string = subject.update('35bvadQURnd0');
      logInfo(`step5 update("35bvadQURnd0"): step5=${step5}`);
      expect(step5).assertEqual('24');
      logInfo(`remove>remove>update>update>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`remove>remove>update>update>update final: JSON.stringify(subject....${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xmcsPKMRBBav","AZzdKkzvg","35bvadQURnd0"]');
      logInfo(`remove>remove>update>update>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`remove>remove>update>update>update final: JSON.stringify(subject.na...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","",""]');
      logInfo(`remove>remove>update>update>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`remove>remove>update>update>update final: JSON.stringify(subject.te...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0143
     * @tc.name      FormExtAbility_FormStoreModelFlow_0143
     * @tc.desc      FormStoreModel call flow add > countOf > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0143 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('a', 'a', true);
      logInfo(`step1 add("a", "a", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('tfXD8z');
      logInfo(`step2 countOf("tfXD8z"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.add(' a ', 'Sample Title 123', false);
      logInfo(`step3 add(" a ", "Sample Title 123", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      logInfo(`add>countOf>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>countOf>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"," a "]');
      logInfo(`add>countOf>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>countOf>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a","Sample Title 123"]');
      logInfo(`add>countOf>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>countOf>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0144
     * @tc.name      FormExtAbility_FormStoreModelFlow_0144
     * @tc.desc      FormStoreModel call flow remove > castToNormal > remove > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0144 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove(' ');
      logInfo(`step1 remove(" "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.castToNormal('q7');
      logInfo(`step2 castToNormal("q7"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.remove('18s6ViA4HV');
      logInfo(`step3 remove("18s6ViA4HV"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.remove('KMOQhOoGYH7G');
      logInfo(`step4 remove("KMOQhOoGYH7G"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}FormStoreModelFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0145
     * @tc.name      FormExtAbility_FormStoreModelFlow_0145
     * @tc.desc      FormStoreModel call flow remove > add > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0145 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('  ');
      logInfo(`step1 remove("  "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.add('', '\u4e2d\u6587', true);
      logInfo(`step2 add("", "??", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('xYZxdlfDYt');
      logInfo(`step3 remove("xYZxdlfDYt"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`remove>add>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>add>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`remove>add>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>add>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`remove>add>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>add>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0146
     * @tc.name      FormExtAbility_FormStoreModelFlow_0146
     * @tc.desc      FormStoreModel call flow countOf > add > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0146 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('GI');
      logInfo(`step1 countOf("GI"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.add(' a ', 'Sample Title 123', true);
      logInfo(`step2 add(" a ", "Sample Title 123", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.countOf('Hello WorldHello World');
      logInfo(`step3 countOf("Hello WorldHello World"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`countOf>add>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>add>countOf final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" a "]');
      logInfo(`countOf>add>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>add>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`countOf>add>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>add>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0147
     * @tc.name      FormExtAbility_FormStoreModelFlow_0147
     * @tc.desc      FormStoreModel call flow add > update > remove > remove > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0147 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('a', 'abc', true);
      logInfo(`step1 add("a", "abc", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.update(' _1');
      logInfo(`step2 update(" _1"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('5eCHkekd49pG');
      logInfo(`step3 remove("5eCHkekd49pG"): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.remove('9trAaR');
      logInfo(`step4 remove("9trAaR"): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: string = subject.update('T');
      logInfo(`step5 update("T"): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`add>update>remove>remove>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`add>update>remove>remove>update final: JSON.stringify(subject.for...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a"," _1","T"]');
      logInfo(`add>update>remove>remove>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`add>update>remove>remove>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc","",""]');
      logInfo(`add>update>remove>remove>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`add>update>remove>remove>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0148
     * @tc.name      FormExtAbility_FormStoreModelFlow_0148
     * @tc.desc      FormStoreModel call flow update > countOf > update > castToNormal > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0148 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('g4z');
      logInfo(`step1 update("g4z"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('Kfhp9B5');
      logInfo(`step2 countOf("Kfhp9B5"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.update('j555Grffw3jn');
      logInfo(`step3 update("j555Grffw3jn"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: boolean = subject.castToNormal('123');
      logInfo(`step4 castToNormal("123"): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.update('aa');
      logInfo(`step5 update("aa"): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`update>countOf>update>castToNormal>update...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`update>countOf>update>castToNormal>update...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["g4z","j555Grffw3jn","aa"]');
      logInfo(`update>countOf>update>castToNormal>update...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`update>countOf>update>castToNormal>update...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","",""]');
      logInfo(`update>countOf>update>castToNormal>update...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`update>countOf>update>castToNormal>update...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0149
     * @tc.name      FormExtAbility_FormStoreModelFlow_0149
     * @tc.desc      FormStoreModel call flow countOf > countOf > add > remove > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0149 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('123_1');
      logInfo(`step1 countOf("123_1"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.countOf('vF');
      logInfo(`step2 countOf("vF"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.add('a_1', '\u4e2d\u6587', false);
      logInfo(`step3 add("a_1", "??", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.remove('YC');
      logInfo(`step4 remove("YC"): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: string = subject.update('Kg6dFIQTw1M');
      logInfo(`step5 update("Kg6dFIQTw1M"): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`countOf>countOf>add>remove>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`countOf>countOf>add>remove>update final: JSON.stringify(subject.f...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1","Kg6dFIQTw1M"]');
      logInfo(`countOf>countOf>add>remove>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`countOf>countOf>add>remove>update final: JSON.stringify(subject.nam...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587",""]');
      logInfo(`countOf>countOf>add>remove>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`countOf>countOf>add>remove>update final: JSON.stringify(subject.tem...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0150
     * @tc.name      FormExtAbility_FormStoreModelFlow_0150
     * @tc.desc      FormStoreModel call flow countOf > remove > add > update > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0150 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('gI56LQs9B');
      logInfo(`step1 countOf("gI56LQs9B"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.remove('838Mb5duE');
      logInfo(`step2 remove("838Mb5duE"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.add('Hello World', '', true);
      logInfo(`step3 add("Hello World", "", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('PEX');
      logInfo(`step4 update("PEX"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: string = subject.add('a_1', 'a', true);
      logInfo(`step5 add("a_1", "a", true): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`countOf>remove>add>update>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`countOf>remove>add>update>add final: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World","PEX","a_1"]');
      logInfo(`countOf>remove>add>update>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`countOf>remove>add>update>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","","a"]');
      logInfo(`countOf>remove>add>update>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`countOf>remove>add>update>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0151
     * @tc.name      FormExtAbility_FormStoreModelFlow_0151
     * @tc.desc      FormStoreModel call flow remove > add > castToNormal > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0151 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('q');
      logInfo(`step1 remove("q"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.add('Hello World', '\u4e2d\u6587', true);
      logInfo(`step2 add("Hello World", "??", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('123123');
      logInfo(`step3 castToNormal("123123"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.add('a', 'A', true);
      logInfo(`step4 add("a", "A", true): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`remove>add>castToNormal>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`remove>add>castToNormal>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World","a"]');
      logInfo(`remove>add>castToNormal>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`remove>add>castToNormal>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587","A"]');
      logInfo(`remove>add>castToNormal>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`remove>add>castToNormal>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0152
     * @tc.name      FormExtAbility_FormStoreModelFlow_0152
     * @tc.desc      FormStoreModel call flow update > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0152 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('ceMh');
      logInfo(`step1 update("ceMh"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.remove('U');
      logInfo(`step2 remove("U"): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`update>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["ceMh"]');
      logInfo(`update>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0153
     * @tc.name      FormExtAbility_FormStoreModelFlow_0153
     * @tc.desc      FormStoreModel call flow castToNormal > remove > castToNormal > castToNormal > update keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0153 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('oWCEkwPD');
      logInfo(`step1 castToNormal("oWCEkwPD"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.remove('XmQQC');
      logInfo(`step2 remove("XmQQC"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.castToNormal('Mz8owtfvXd');
      logInfo(`step3 castToNormal("Mz8owtfvXd"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.castToNormal('xa');
      logInfo(`step4 castToNormal("xa"): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.update('BDh');
      logInfo(`step5 update("BDh"): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`castToNormal>remove>castToNormal>castToNo...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`castToNormal>remove>castToNormal>castToNo...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["BDh"]');
      logInfo(`castToNormal>remove>castToNormal>castToNo...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`castToNormal>remove>castToNormal>castToNo...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`castToNormal>remove>castToNormal>castToNo...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`castToNormal>remove>castToNormal>castToNo...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0154
     * @tc.name      FormExtAbility_FormStoreModelFlow_0154
     * @tc.desc      FormStoreModel call flow castToNormal > add > update > remove > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0154 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('6Ego');
      logInfo(`step1 castToNormal("6Ego"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.add('a_1', 'Hello World', false);
      logInfo(`step2 add("a_1", "Hello World", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.update(' 123 ');
      logInfo(`step3 update(" 123 "): step3=${step3}`);
      expect(step3).assertEqual('12');
      const step4: number = subject.remove('uL');
      logInfo(`step4 remove("uL"): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: string = subject.update('9xXqY');
      logInfo(`step5 update("9xXqY"): step5=${step5}`);
      expect(step5).assertEqual('18');
      logInfo(`castToNormal>add>update>remove>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`castToNormal>add>update>remove>update final: JSON.stringify(subje...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a_1"," 123 ","9xXqY"]');
      logInfo(`castToNormal>add>update>remove>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`castToNormal>add>update>remove>update final: JSON.stringify(subject...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello World","",""]');
      logInfo(`castToNormal>add>update>remove>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`castToNormal>add>update>remove>update final: JSON.stringify(subject...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0155
     * @tc.name      FormExtAbility_FormStoreModelFlow_0155
     * @tc.desc      FormStoreModel call flow update > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0155 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('AHmQ');
      logInfo(`step1 update("AHmQ"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('vW');
      logInfo(`step2 castToNormal("vW"): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`update>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["AHmQ"]');
      logInfo(`update>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0156
     * @tc.name      FormExtAbility_FormStoreModelFlow_0156
     * @tc.desc      FormStoreModel call flow add > add > castToNormal > remove > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0156 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('xa', 'a', false);
      logInfo(`step1 add("xa", "a", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add('Hello World', '\u4e2d\u6587', false);
      logInfo(`step2 add("Hello World", "??", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('pkEIYvCZWB');
      logInfo(`step3 castToNormal("pkEIYvCZWB"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.remove('ojwq6S');
      logInfo(`step4 remove("ojwq6S"): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: string = subject.update(' a ');
      logInfo(`step5 update(" a "): step5=${step5}`);
      expect(step5).assertEqual('NaN');
      logInfo(`add>add>castToNormal>remove>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`add>add>castToNormal>remove>update final: JSON.stringify(subject....${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xa","Hello World"," a "]');
      logInfo(`add>add>castToNormal>remove>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`add>add>castToNormal>remove>update final: JSON.stringify(subject.na...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a","\u4e2d\u6587",""]');
      logInfo(`add>add>castToNormal>remove>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`add>add>castToNormal>remove>update final: JSON.stringify(subject.te...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0157
     * @tc.name      FormExtAbility_FormStoreModelFlow_0157
     * @tc.desc      FormStoreModel call flow castToNormal > remove > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0157 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: boolean = subject.castToNormal('xHello World');
      logInfo(`step1 castToNormal("xHello World"): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: number = subject.remove('xa');
      logInfo(`step2 remove("xa"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.countOf('  ');
      logInfo(`step3 countOf("  "): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0158
     * @tc.name      FormExtAbility_FormStoreModelFlow_0158
     * @tc.desc      FormStoreModel call flow update > remove > add > castToNormal > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0158 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('Hello World');
      logInfo(`step1 update("Hello World"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.remove('ojwq6S');
      logInfo(`step2 remove("ojwq6S"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.add(' a ', ' ', true);
      logInfo(`step3 add(" a ", " ", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: boolean = subject.castToNormal('Mz8owtfvXd');
      logInfo(`step4 castToNormal("Mz8owtfvXd"): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.remove('HGSDdGq2Xz');
      logInfo(`step5 remove("HGSDdGq2Xz"): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`update>remove>add>castToNormal>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`update>remove>add>castToNormal>remove final: JSON.stringify(subje...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World"," a "]');
      logInfo(`update>remove>add>castToNormal>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`update>remove>add>castToNormal>remove final: JSON.stringify(subject...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""," "]');
      logInfo(`update>remove>add>castToNormal>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`update>remove>add>castToNormal>remove final: JSON.stringify(subject...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0159
     * @tc.name      FormExtAbility_FormStoreModelFlow_0159
     * @tc.desc      FormStoreModel call flow remove > castToNormal > castToNormal > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0159 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('Mjk');
      logInfo(`step1 remove("Mjk"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.castToNormal('sTb');
      logInfo(`step2 castToNormal("sTb"): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.castToNormal('mtf5i9');
      logInfo(`step3 castToNormal("mtf5i9"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.update(' Hello World ');
      logInfo(`step4 update(" Hello World "): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`remove>castToNormal>castToNormal>update f...: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`remove>castToNormal>castToNormal>update f...: JSON.stringify(subj...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" Hello World "]');
      logInfo(`remove>castToNormal>castToNormal>update f...: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`remove>castToNormal>castToNormal>update f...: JSON.stringify(subjec...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`remove>castToNormal>castToNormal>update f...: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`remove>castToNormal>castToNormal>update f...: JSON.stringify(subjec...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0160
     * @tc.name      FormExtAbility_FormStoreModelFlow_0160
     * @tc.desc      FormStoreModel call flow update > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0160 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('OWHOCN9');
      logInfo(`step1 update("OWHOCN9"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add('abc', ' ', true);
      logInfo(`step2 add("abc", " ", true): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      logInfo(`update>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`update>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["OWHOCN9","abc"]');
      logInfo(`update>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`update>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""," "]');
      logInfo(`update>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`update>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0161
     * @tc.name      FormExtAbility_FormStoreModelFlow_0161
     * @tc.desc      FormStoreModel call flow countOf > countOf > add > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0161 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('NdrWdE');
      logInfo(`step1 countOf("NdrWdE"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.countOf('2b4');
      logInfo(`step2 countOf("2b4"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.add('', '\u4e2d\u6587', true);
      logInfo(`step3 add("", "??", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: boolean = subject.castToNormal('xA5O7');
      logInfo(`step4 castToNormal("xA5O7"): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`countOf>countOf>add>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>countOf>add>castToNormal final: JSON.stringify(subject.fo...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`countOf>countOf>add>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>countOf>add>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`countOf>countOf>add>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>countOf>add>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0162
     * @tc.name      FormExtAbility_FormStoreModelFlow_0162
     * @tc.desc      FormStoreModel call flow remove > remove > add > update > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0162 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('SwWZ1E1');
      logInfo(`step1 remove("SwWZ1E1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.remove('xHello World');
      logInfo(`step2 remove("xHello World"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.add(' ', 'Sample Title 123', true);
      logInfo(`step3 add(" ", "Sample Title 123", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('XTx81V');
      logInfo(`step4 update("XTx81V"): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      const step5: number = subject.countOf('vF');
      logInfo(`step5 countOf("vF"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`remove>remove>add>update>countOf final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`remove>remove>add>update>countOf final: JSON.stringify(subject.fo...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" ","XTx81V"]');
      logInfo(`remove>remove>add>update>countOf final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`remove>remove>add>update>countOf final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123",""]');
      logInfo(`remove>remove>add>update>countOf final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`remove>remove>add>update>countOf final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0163
     * @tc.name      FormExtAbility_FormStoreModelFlow_0163
     * @tc.desc      FormStoreModel call flow add > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0163 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('', 'Sample Title 123', true);
      logInfo(`step1 add("", "Sample Title 123", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: boolean = subject.castToNormal('UCFxZV');
      logInfo(`step2 castToNormal("UCFxZV"): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`add>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>castToNormal final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[""]');
      logInfo(`add>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Sample Title 123"]');
      logInfo(`add>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0164
     * @tc.name      FormExtAbility_FormStoreModelFlow_0164
     * @tc.desc      FormStoreModel call flow countOf > add > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0164 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('l6uSEnTSL');
      logInfo(`step1 countOf("l6uSEnTSL"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.add(' ', '\u4e2d\u6587', false);
      logInfo(`step2 add(" ", "??", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: number = subject.remove('j7HJlgiM1gzW');
      logInfo(`step3 remove("j7HJlgiM1gzW"): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`countOf>add>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>add>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" "]');
      logInfo(`countOf>add>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>add>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["\u4e2d\u6587"]');
      logInfo(`countOf>add>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>add>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0165
     * @tc.name      FormExtAbility_FormStoreModelFlow_0165
     * @tc.desc      FormStoreModel call flow countOf > remove > countOf keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0165 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('pYkrju');
      logInfo(`step1 countOf("pYkrju"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.remove(' ');
      logInfo(`step2 remove(" "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.countOf('D28kRCbt');
      logInfo(`step3 countOf("D28kRCbt"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}FormStoreModelFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0166
     * @tc.name      FormExtAbility_FormStoreModelFlow_0166
     * @tc.desc      FormStoreModel call flow remove > add > add > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0166 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.remove('XmQQC');
      logInfo(`step1 remove("XmQQC"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.add('Hello World', 'A', false);
      logInfo(`step2 add("Hello World", "A", false): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.add('', 'a', false);
      logInfo(`step3 add("", "a", false): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.update('  ');
      logInfo(`step4 update("  "): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`remove>add>add>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`remove>add>add>update final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Hello World","","  "]');
      logInfo(`remove>add>add>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`remove>add>add>update final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["A","a",""]');
      logInfo(`remove>add>add>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`remove>add>add>update final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0167
     * @tc.name      FormExtAbility_FormStoreModelFlow_0167
     * @tc.desc      FormStoreModel call flow update > add > add > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0167 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('a');
      logInfo(`step1 update("a"): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: string = subject.add('123', '\u4e2d\u6587', false);
      logInfo(`step2 add("123", "??", false): step2=${step2}`);
      expect(step2).assertEqual('13');
      const step3: string = subject.add('a_1', ' ', true);
      logInfo(`step3 add("a_1", " ", true): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: string = subject.add('a_1', '', false);
      logInfo(`step4 add("a_1", "", false): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`update>add>add>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`update>add>add>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["a","123","a_1"]');
      logInfo(`update>add>add>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`update>add>add>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","\u4e2d\u6587",""]');
      logInfo(`update>add>add>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`update>add>add>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0168
     * @tc.name      FormExtAbility_FormStoreModelFlow_0168
     * @tc.desc      FormStoreModel call flow countOf > update > update > remove > update keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0168 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('zQ');
      logInfo(`step1 countOf("zQ"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.update('Kg6dFIQTw1M');
      logInfo(`step2 update("Kg6dFIQTw1M"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: string = subject.update('I3owLXk');
      logInfo(`step3 update("I3owLXk"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.remove(' 123 ');
      logInfo(`step4 remove(" 123 "): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: string = subject.update('123123');
      logInfo(`step5 update("123123"): step5=${step5}`);
      expect(step5).assertEqual('12');
      logInfo(`countOf>update>update>remove>update final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(3);
      logInfo(`countOf>update>update>remove>update final: JSON.stringify(subject...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Kg6dFIQTw1M","I3owLXk","123123"]');
      logInfo(`countOf>update>update>remove>update final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(3);
      logInfo(`countOf>update>update>remove>update final: JSON.stringify(subject.n...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["","",""]');
      logInfo(`countOf>update>update>remove>update final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(3);
      logInfo(`countOf>update>update>remove>update final: JSON.stringify(subject.t...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0169
     * @tc.name      FormExtAbility_FormStoreModelFlow_0169
     * @tc.desc      FormStoreModel call flow add > countOf > update > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0169 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' a ', 'abc', true);
      logInfo(`step1 add(" a ", "abc", true): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('Hello World_1');
      logInfo(`step2 countOf("Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string = subject.update('aa');
      logInfo(`step3 update("aa"): step3=${step3}`);
      expect(step3).assertEqual('NaN');
      const step4: number = subject.remove('HvzaKI');
      logInfo(`step4 remove("HvzaKI"): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`add>countOf>update>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>countOf>update>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" a ","aa"]');
      logInfo(`add>countOf>update>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>countOf>update>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["abc",""]');
      logInfo(`add>countOf>update>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>countOf>update>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[true,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0170
     * @tc.name      FormExtAbility_FormStoreModelFlow_0170
     * @tc.desc      FormStoreModel call flow countOf > update > castToNormal > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0170 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: number = subject.countOf('123_1');
      logInfo(`step1 countOf("123_1"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string = subject.update('MT7krsynX');
      logInfo(`step2 update("MT7krsynX"): step2=${step2}`);
      expect(step2).assertEqual('NaN');
      const step3: boolean = subject.castToNormal('unKFdYo19kz');
      logInfo(`step3 castToNormal("unKFdYo19kz"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.remove('IH5irVjtjt8K');
      logInfo(`step4 remove("IH5irVjtjt8K"): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`countOf>update>castToNormal>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`countOf>update>castToNormal>remove final: JSON.stringify(subject....${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["MT7krsynX"]');
      logInfo(`countOf>update>castToNormal>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`countOf>update>castToNormal>remove final: JSON.stringify(subject.na...${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`countOf>update>castToNormal>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`countOf>update>castToNormal>remove final: JSON.stringify(subject.te...${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0171
     * @tc.name      FormExtAbility_FormStoreModelFlow_0171
     * @tc.desc      FormStoreModel call flow add > countOf > castToNormal > add keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0171 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add(' a ', 'Hello', false);
      logInfo(`step1 add(" a ", "Hello", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.countOf('P3R6CltB1l');
      logInfo(`step2 countOf("P3R6CltB1l"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.castToNormal('xfVFQmf5GlZ');
      logInfo(`step3 castToNormal("xfVFQmf5GlZ"): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.add('a_1', 'Sample Title 123', false);
      logInfo(`step4 add("a_1", "Sample Title 123", false): step4=${step4}`);
      expect(step4).assertEqual('NaN');
      logInfo(`add>countOf>castToNormal>add final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(2);
      logInfo(`add>countOf>castToNormal>add final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('[" a ","a_1"]');
      logInfo(`add>countOf>castToNormal>add final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(2);
      logInfo(`add>countOf>castToNormal>add final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["Hello","Sample Title 123"]');
      logInfo(`add>countOf>castToNormal>add final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(2);
      logInfo(`add>countOf>castToNormal>add final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false,false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0172
     * @tc.name      FormExtAbility_FormStoreModelFlow_0172
     * @tc.desc      FormStoreModel call flow add > remove > remove keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0172 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.add('aa', 'a', false);
      logInfo(`step1 add("aa", "a", false): step1=${step1}`);
      expect(step1).assertEqual('NaN');
      const step2: number = subject.remove('7pUcexRKMzaG');
      logInfo(`step2 remove("7pUcexRKMzaG"): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.remove('   ');
      logInfo(`step3 remove("   "): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`add>remove>remove final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`add>remove>remove final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["aa"]');
      logInfo(`add>remove>remove final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`add>remove>remove final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('["a"]');
      logInfo(`add>remove>remove final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`add>remove>remove final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_FLOW_0173
     * @tc.name      FormExtAbility_FormStoreModelFlow_0173
     * @tc.desc      FormStoreModel call flow update > countOf > castToNormal keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelFlow_0173 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const step1: string = subject.update('123_1');
      logInfo(`step1 update("123_1"): step1=${step1}`);
      expect(step1).assertEqual('12');
      const step2: number = subject.countOf('T2');
      logInfo(`step2 countOf("T2"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.castToNormal(' _1');
      logInfo(`step3 castToNormal(" _1"): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`update>countOf>castToNormal final: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update>countOf>castToNormal final: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["123_1"]');
      logInfo(`update>countOf>castToNormal final: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update>countOf>castToNormal final: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update>countOf>castToNormal final: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update>countOf>castToNormal final: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelFlow_0173 end`);
    });
  });
}
