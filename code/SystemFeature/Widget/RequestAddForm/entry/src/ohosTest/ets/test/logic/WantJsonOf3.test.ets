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
import { wantJsonOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for wantJsonOf (77 cases). */
export default function wantJsonOf3Test(): void {
  describe('WantJsonOf3Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0155
     * @tc.name      RequestAddForm_WantJsonOf_0155
     * @tc.desc      wantJsonOf(formName="", dimension=50) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0155 begin`);
      const actual: string = wantJsonOf('', 50);
      logInfo(`wantJsonOf(formName="", dimension=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=50): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=50): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0155 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0156
     * @tc.name      RequestAddForm_WantJsonOf_0156
     * @tc.desc      wantJsonOf(formName="", dimension=55) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0156 begin`);
      const actual: string = wantJsonOf('', 55);
      logInfo(`wantJsonOf(formName="", dimension=55): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=55): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=55): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0156 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0157
     * @tc.name      RequestAddForm_WantJsonOf_0157
     * @tc.desc      wantJsonOf(formName="", dimension=60) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0157 begin`);
      const actual: string = wantJsonOf('', 60);
      logInfo(`wantJsonOf(formName="", dimension=60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=60): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=60): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0157 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0158
     * @tc.name      RequestAddForm_WantJsonOf_0158
     * @tc.desc      wantJsonOf(formName="", dimension=65) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0158 begin`);
      const actual: string = wantJsonOf('', 65);
      logInfo(`wantJsonOf(formName="", dimension=65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=65): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=65): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0158 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0159
     * @tc.name      RequestAddForm_WantJsonOf_0159
     * @tc.desc      wantJsonOf(formName="", dimension=70) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0159 begin`);
      const actual: string = wantJsonOf('', 70);
      logInfo(`wantJsonOf(formName="", dimension=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=70): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=70): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0159 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0160
     * @tc.name      RequestAddForm_WantJsonOf_0160
     * @tc.desc      wantJsonOf(formName="", dimension=75) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0160 begin`);
      const actual: string = wantJsonOf('', 75);
      logInfo(`wantJsonOf(formName="", dimension=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=75): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=75): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0160 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0161
     * @tc.name      RequestAddForm_WantJsonOf_0161
     * @tc.desc      wantJsonOf(formName="", dimension=80) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0161 begin`);
      const actual: string = wantJsonOf('', 80);
      logInfo(`wantJsonOf(formName="", dimension=80): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=80): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=80): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0161 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0162
     * @tc.name      RequestAddForm_WantJsonOf_0162
     * @tc.desc      wantJsonOf(formName="", dimension=85) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0162 begin`);
      const actual: string = wantJsonOf('', 85);
      logInfo(`wantJsonOf(formName="", dimension=85): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=85): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=85): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0162 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0163
     * @tc.name      RequestAddForm_WantJsonOf_0163
     * @tc.desc      wantJsonOf(formName="", dimension=90) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0163 begin`);
      const actual: string = wantJsonOf('', 90);
      logInfo(`wantJsonOf(formName="", dimension=90): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=90): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=90): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0163 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0164
     * @tc.name      RequestAddForm_WantJsonOf_0164
     * @tc.desc      wantJsonOf(formName="", dimension=95) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0164 begin`);
      const actual: string = wantJsonOf('', 95);
      logInfo(`wantJsonOf(formName="", dimension=95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=95): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=95): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0164 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0165
     * @tc.name      RequestAddForm_WantJsonOf_0165
     * @tc.desc      wantJsonOf(formName="", dimension=105) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0165 begin`);
      const actual: string = wantJsonOf('', 105);
      logInfo(`wantJsonOf(formName="", dimension=105): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=105): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=105): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0165 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0166
     * @tc.name      RequestAddForm_WantJsonOf_0166
     * @tc.desc      wantJsonOf(formName="", dimension=110) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0166 begin`);
      const actual: string = wantJsonOf('', 110);
      logInfo(`wantJsonOf(formName="", dimension=110): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=110): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=110): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0166 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0167
     * @tc.name      RequestAddForm_WantJsonOf_0167
     * @tc.desc      wantJsonOf(formName="", dimension=115) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0167 begin`);
      const actual: string = wantJsonOf('', 115);
      logInfo(`wantJsonOf(formName="", dimension=115): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=115): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=115): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0167 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0168
     * @tc.name      RequestAddForm_WantJsonOf_0168
     * @tc.desc      wantJsonOf(formName="", dimension=120) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0168 begin`);
      const actual: string = wantJsonOf('', 120);
      logInfo(`wantJsonOf(formName="", dimension=120): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=120): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=120): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0168 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0169
     * @tc.name      RequestAddForm_WantJsonOf_0169
     * @tc.desc      wantJsonOf(formName="", dimension=125) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0169 begin`);
      const actual: string = wantJsonOf('', 125);
      logInfo(`wantJsonOf(formName="", dimension=125): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=125): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=125): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0169 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0170
     * @tc.name      RequestAddForm_WantJsonOf_0170
     * @tc.desc      wantJsonOf(formName="", dimension=130) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0170 begin`);
      const actual: string = wantJsonOf('', 130);
      logInfo(`wantJsonOf(formName="", dimension=130): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=130): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=130): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0170 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0171
     * @tc.name      RequestAddForm_WantJsonOf_0171
     * @tc.desc      wantJsonOf(formName="", dimension=135) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0171 begin`);
      const actual: string = wantJsonOf('', 135);
      logInfo(`wantJsonOf(formName="", dimension=135): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=135): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=135): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0171 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0172
     * @tc.name      RequestAddForm_WantJsonOf_0172
     * @tc.desc      wantJsonOf(formName="", dimension=140) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0172 begin`);
      const actual: string = wantJsonOf('', 140);
      logInfo(`wantJsonOf(formName="", dimension=140): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=140): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=140): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0172 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0173
     * @tc.name      RequestAddForm_WantJsonOf_0173
     * @tc.desc      wantJsonOf(formName="", dimension=145) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0173 begin`);
      const actual: string = wantJsonOf('', 145);
      logInfo(`wantJsonOf(formName="", dimension=145): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=145): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=145): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0173 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0174
     * @tc.name      RequestAddForm_WantJsonOf_0174
     * @tc.desc      wantJsonOf(formName="", dimension=150) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0174 begin`);
      const actual: string = wantJsonOf('', 150);
      logInfo(`wantJsonOf(formName="", dimension=150): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=150): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=150): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0174 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0175
     * @tc.name      RequestAddForm_WantJsonOf_0175
     * @tc.desc      wantJsonOf(formName="", dimension=155) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0175 begin`);
      const actual: string = wantJsonOf('', 155);
      logInfo(`wantJsonOf(formName="", dimension=155): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=155): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=155): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0175 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0176
     * @tc.name      RequestAddForm_WantJsonOf_0176
     * @tc.desc      wantJsonOf(formName="", dimension=160) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0176 begin`);
      const actual: string = wantJsonOf('', 160);
      logInfo(`wantJsonOf(formName="", dimension=160): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=160): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=160): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0176 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0177
     * @tc.name      RequestAddForm_WantJsonOf_0177
     * @tc.desc      wantJsonOf(formName="", dimension=165) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0177 begin`);
      const actual: string = wantJsonOf('', 165);
      logInfo(`wantJsonOf(formName="", dimension=165): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=165): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=165): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0177 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0178
     * @tc.name      RequestAddForm_WantJsonOf_0178
     * @tc.desc      wantJsonOf(formName="", dimension=170) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0178 begin`);
      const actual: string = wantJsonOf('', 170);
      logInfo(`wantJsonOf(formName="", dimension=170): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=170): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=170): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0178 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0179
     * @tc.name      RequestAddForm_WantJsonOf_0179
     * @tc.desc      wantJsonOf(formName="", dimension=175) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0179 begin`);
      const actual: string = wantJsonOf('', 175);
      logInfo(`wantJsonOf(formName="", dimension=175): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=175): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=175): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0179 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0180
     * @tc.name      RequestAddForm_WantJsonOf_0180
     * @tc.desc      wantJsonOf(formName="", dimension=180) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0180 begin`);
      const actual: string = wantJsonOf('', 180);
      logInfo(`wantJsonOf(formName="", dimension=180): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=180): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=180): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0180 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0181
     * @tc.name      RequestAddForm_WantJsonOf_0181
     * @tc.desc      wantJsonOf(formName="", dimension=185) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0181 begin`);
      const actual: string = wantJsonOf('', 185);
      logInfo(`wantJsonOf(formName="", dimension=185): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=185): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=185): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0181 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0182
     * @tc.name      RequestAddForm_WantJsonOf_0182
     * @tc.desc      wantJsonOf(formName="", dimension=190) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0182 begin`);
      const actual: string = wantJsonOf('', 190);
      logInfo(`wantJsonOf(formName="", dimension=190): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=190): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=190): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0182 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0183
     * @tc.name      RequestAddForm_WantJsonOf_0183
     * @tc.desc      wantJsonOf(formName="", dimension=195) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0183 begin`);
      const actual: string = wantJsonOf('', 195);
      logInfo(`wantJsonOf(formName="", dimension=195): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=195): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=195): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0183 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0184
     * @tc.name      RequestAddForm_WantJsonOf_0184
     * @tc.desc      wantJsonOf(formName="", dimension=200) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0184 begin`);
      const actual: string = wantJsonOf('', 200);
      logInfo(`wantJsonOf(formName="", dimension=200): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=200): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=200): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0184 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0185
     * @tc.name      RequestAddForm_WantJsonOf_0185
     * @tc.desc      wantJsonOf(formName="", dimension=186) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0185 begin`);
      const actual: string = wantJsonOf('', 186);
      logInfo(`wantJsonOf(formName="", dimension=186): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=186): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=186): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0185 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0186
     * @tc.name      RequestAddForm_WantJsonOf_0186
     * @tc.desc      wantJsonOf(formName="", dimension=158) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0186 begin`);
      const actual: string = wantJsonOf('', 158);
      logInfo(`wantJsonOf(formName="", dimension=158): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=158): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=158): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0186 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0187
     * @tc.name      RequestAddForm_WantJsonOf_0187
     * @tc.desc      wantJsonOf(formName="", dimension=99.4) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0187 begin`);
      const actual: string = wantJsonOf('', 99.4);
      logInfo(`wantJsonOf(formName="", dimension=99.4): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName="", dimension=99.4): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=99.4): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0187 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0188
     * @tc.name      RequestAddForm_WantJsonOf_0188
     * @tc.desc      wantJsonOf(formName="", dimension=86) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0188 begin`);
      const actual: string = wantJsonOf('', 86);
      logInfo(`wantJsonOf(formName="", dimension=86): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=86): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=86): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0188 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0189
     * @tc.name      RequestAddForm_WantJsonOf_0189
     * @tc.desc      wantJsonOf(formName="", dimension=-12) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0189 begin`);
      const actual: string = wantJsonOf('', -12);
      logInfo(`wantJsonOf(formName="", dimension=-12): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=-12): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=-12): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0189 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0190
     * @tc.name      RequestAddForm_WantJsonOf_0190
     * @tc.desc      wantJsonOf(formName="", dimension=139) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0190 begin`);
      const actual: string = wantJsonOf('', 139);
      logInfo(`wantJsonOf(formName="", dimension=139): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=139): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=139): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0190 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0191
     * @tc.name      RequestAddForm_WantJsonOf_0191
     * @tc.desc      wantJsonOf(formName="", dimension=152) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0191 begin`);
      const actual: string = wantJsonOf('', 152);
      logInfo(`wantJsonOf(formName="", dimension=152): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=152): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=152): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0191 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0192
     * @tc.name      RequestAddForm_WantJsonOf_0192
     * @tc.desc      wantJsonOf(formName="", dimension=4) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0192 begin`);
      const actual: string = wantJsonOf('', 4);
      logInfo(`wantJsonOf(formName="", dimension=4): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(168);
      logInfo(`wantJsonOf(formName="", dimension=4): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=4): actual.substring(136)=${actual.substring(136)}`);
      expect(actual.substring(136)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0192 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0193
     * @tc.name      RequestAddForm_WantJsonOf_0193
     * @tc.desc      wantJsonOf(formName="", dimension=-99) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0193 begin`);
      const actual: string = wantJsonOf('', -99);
      logInfo(`wantJsonOf(formName="", dimension=-99): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=-99): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=-99): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0193 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0194
     * @tc.name      RequestAddForm_WantJsonOf_0194
     * @tc.desc      wantJsonOf(formName="", dimension=16.17) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0194 begin`);
      const actual: string = wantJsonOf('', 16.17);
      logInfo(`wantJsonOf(formName="", dimension=16.17): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(172);
      logInfo(`wantJsonOf(formName="", dimension=16.17): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=16.17): actual.substring(140)=${actual.substring(140)}`);
      expect(actual.substring(140)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0194 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0195
     * @tc.name      RequestAddForm_WantJsonOf_0195
     * @tc.desc      wantJsonOf(formName="", dimension=46.73) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0195 begin`);
      const actual: string = wantJsonOf('', 46.73);
      logInfo(`wantJsonOf(formName="", dimension=46.73): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(172);
      logInfo(`wantJsonOf(formName="", dimension=46.73): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=46.73): actual.substring(140)=${actual.substring(140)}`);
      expect(actual.substring(140)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0195 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0196
     * @tc.name      RequestAddForm_WantJsonOf_0196
     * @tc.desc      wantJsonOf(formName="", dimension=37.79) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0196 begin`);
      const actual: string = wantJsonOf('', 37.79);
      logInfo(`wantJsonOf(formName="", dimension=37.79): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(172);
      logInfo(`wantJsonOf(formName="", dimension=37.79): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=37.79): actual.substring(140)=${actual.substring(140)}`);
      expect(actual.substring(140)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0196 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0197
     * @tc.name      RequestAddForm_WantJsonOf_0197
     * @tc.desc      wantJsonOf(formName="", dimension=88.57) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0197 begin`);
      const actual: string = wantJsonOf('', 88.57);
      logInfo(`wantJsonOf(formName="", dimension=88.57): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(172);
      logInfo(`wantJsonOf(formName="", dimension=88.57): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=88.57): actual.substring(140)=${actual.substring(140)}`);
      expect(actual.substring(140)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0197 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0198
     * @tc.name      RequestAddForm_WantJsonOf_0198
     * @tc.desc      wantJsonOf(formName=" ", dimension=0) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0198 begin`);
      const actual: string = wantJsonOf(' ', 0);
      logInfo(`wantJsonOf(formName=" ", dimension=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName=" ", dimension=0): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=0): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0198 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0199
     * @tc.name      RequestAddForm_WantJsonOf_0199
     * @tc.desc      wantJsonOf(formName=" ", dimension=1) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0199 begin`);
      const actual: string = wantJsonOf(' ', 1);
      logInfo(`wantJsonOf(formName=" ", dimension=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName=" ", dimension=1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=1): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0199 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0200
     * @tc.name      RequestAddForm_WantJsonOf_0200
     * @tc.desc      wantJsonOf(formName=" ", dimension=-1) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0200 begin`);
      const actual: string = wantJsonOf(' ', -1);
      logInfo(`wantJsonOf(formName=" ", dimension=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=-1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=-1): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0200 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0201
     * @tc.name      RequestAddForm_WantJsonOf_0201
     * @tc.desc      wantJsonOf(formName=" ", dimension=2) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0201 begin`);
      const actual: string = wantJsonOf(' ', 2);
      logInfo(`wantJsonOf(formName=" ", dimension=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName=" ", dimension=2): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=2): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0201 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0202
     * @tc.name      RequestAddForm_WantJsonOf_0202
     * @tc.desc      wantJsonOf(formName=" ", dimension=3) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0202 begin`);
      const actual: string = wantJsonOf(' ', 3);
      logInfo(`wantJsonOf(formName=" ", dimension=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName=" ", dimension=3): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=3): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0202 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0203
     * @tc.name      RequestAddForm_WantJsonOf_0203
     * @tc.desc      wantJsonOf(formName=" ", dimension=10) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0203 begin`);
      const actual: string = wantJsonOf(' ', 10);
      logInfo(`wantJsonOf(formName=" ", dimension=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=10): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=10): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0203 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0204
     * @tc.name      RequestAddForm_WantJsonOf_0204
     * @tc.desc      wantJsonOf(formName=" ", dimension=100) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0204 begin`);
      const actual: string = wantJsonOf(' ', 100);
      logInfo(`wantJsonOf(formName=" ", dimension=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=100): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=100): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0204 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0205
     * @tc.name      RequestAddForm_WantJsonOf_0205
     * @tc.desc      wantJsonOf(formName=" ", dimension=5) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0205 begin`);
      const actual: string = wantJsonOf(' ', 5);
      logInfo(`wantJsonOf(formName=" ", dimension=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName=" ", dimension=5): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=5): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0205 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0206
     * @tc.name      RequestAddForm_WantJsonOf_0206
     * @tc.desc      wantJsonOf(formName=" ", dimension=15) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0206 begin`);
      const actual: string = wantJsonOf(' ', 15);
      logInfo(`wantJsonOf(formName=" ", dimension=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=15): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=15): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0206 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0207
     * @tc.name      RequestAddForm_WantJsonOf_0207
     * @tc.desc      wantJsonOf(formName=" ", dimension=20) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0207 begin`);
      const actual: string = wantJsonOf(' ', 20);
      logInfo(`wantJsonOf(formName=" ", dimension=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=20): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=20): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0207 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0208
     * @tc.name      RequestAddForm_WantJsonOf_0208
     * @tc.desc      wantJsonOf(formName=" ", dimension=25) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0208 begin`);
      const actual: string = wantJsonOf(' ', 25);
      logInfo(`wantJsonOf(formName=" ", dimension=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=25): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=25): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0208 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0209
     * @tc.name      RequestAddForm_WantJsonOf_0209
     * @tc.desc      wantJsonOf(formName=" ", dimension=30) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0209 begin`);
      const actual: string = wantJsonOf(' ', 30);
      logInfo(`wantJsonOf(formName=" ", dimension=30): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=30): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=30): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0209 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0210
     * @tc.name      RequestAddForm_WantJsonOf_0210
     * @tc.desc      wantJsonOf(formName=" ", dimension=35) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0210 begin`);
      const actual: string = wantJsonOf(' ', 35);
      logInfo(`wantJsonOf(formName=" ", dimension=35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=35): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=35): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0210 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0211
     * @tc.name      RequestAddForm_WantJsonOf_0211
     * @tc.desc      wantJsonOf(formName=" ", dimension=40) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0211 begin`);
      const actual: string = wantJsonOf(' ', 40);
      logInfo(`wantJsonOf(formName=" ", dimension=40): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=40): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=40): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0211 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0212
     * @tc.name      RequestAddForm_WantJsonOf_0212
     * @tc.desc      wantJsonOf(formName=" ", dimension=45) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0212 begin`);
      const actual: string = wantJsonOf(' ', 45);
      logInfo(`wantJsonOf(formName=" ", dimension=45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=45): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=45): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0212 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0213
     * @tc.name      RequestAddForm_WantJsonOf_0213
     * @tc.desc      wantJsonOf(formName=" ", dimension=50) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0213 begin`);
      const actual: string = wantJsonOf(' ', 50);
      logInfo(`wantJsonOf(formName=" ", dimension=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=50): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=50): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0213 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0214
     * @tc.name      RequestAddForm_WantJsonOf_0214
     * @tc.desc      wantJsonOf(formName=" ", dimension=55) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0214 begin`);
      const actual: string = wantJsonOf(' ', 55);
      logInfo(`wantJsonOf(formName=" ", dimension=55): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=55): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=55): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0214 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0215
     * @tc.name      RequestAddForm_WantJsonOf_0215
     * @tc.desc      wantJsonOf(formName=" ", dimension=60) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0215 begin`);
      const actual: string = wantJsonOf(' ', 60);
      logInfo(`wantJsonOf(formName=" ", dimension=60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=60): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=60): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0215 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0216
     * @tc.name      RequestAddForm_WantJsonOf_0216
     * @tc.desc      wantJsonOf(formName=" ", dimension=65) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0216 begin`);
      const actual: string = wantJsonOf(' ', 65);
      logInfo(`wantJsonOf(formName=" ", dimension=65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=65): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=65): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0216 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0217
     * @tc.name      RequestAddForm_WantJsonOf_0217
     * @tc.desc      wantJsonOf(formName=" ", dimension=70) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0217 begin`);
      const actual: string = wantJsonOf(' ', 70);
      logInfo(`wantJsonOf(formName=" ", dimension=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=70): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=70): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0217 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0218
     * @tc.name      RequestAddForm_WantJsonOf_0218
     * @tc.desc      wantJsonOf(formName=" ", dimension=75) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0218 begin`);
      const actual: string = wantJsonOf(' ', 75);
      logInfo(`wantJsonOf(formName=" ", dimension=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=75): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=75): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0218 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0219
     * @tc.name      RequestAddForm_WantJsonOf_0219
     * @tc.desc      wantJsonOf(formName=" ", dimension=80) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0219 begin`);
      const actual: string = wantJsonOf(' ', 80);
      logInfo(`wantJsonOf(formName=" ", dimension=80): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=80): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=80): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0219 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0220
     * @tc.name      RequestAddForm_WantJsonOf_0220
     * @tc.desc      wantJsonOf(formName=" ", dimension=85) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0220 begin`);
      const actual: string = wantJsonOf(' ', 85);
      logInfo(`wantJsonOf(formName=" ", dimension=85): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=85): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=85): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0220 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0221
     * @tc.name      RequestAddForm_WantJsonOf_0221
     * @tc.desc      wantJsonOf(formName=" ", dimension=90) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0221 begin`);
      const actual: string = wantJsonOf(' ', 90);
      logInfo(`wantJsonOf(formName=" ", dimension=90): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=90): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=90): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0221 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0222
     * @tc.name      RequestAddForm_WantJsonOf_0222
     * @tc.desc      wantJsonOf(formName=" ", dimension=95) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0222 begin`);
      const actual: string = wantJsonOf(' ', 95);
      logInfo(`wantJsonOf(formName=" ", dimension=95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=95): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=95): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0222 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0223
     * @tc.name      RequestAddForm_WantJsonOf_0223
     * @tc.desc      wantJsonOf(formName=" ", dimension=105) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0223 begin`);
      const actual: string = wantJsonOf(' ', 105);
      logInfo(`wantJsonOf(formName=" ", dimension=105): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=105): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=105): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0223 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0224
     * @tc.name      RequestAddForm_WantJsonOf_0224
     * @tc.desc      wantJsonOf(formName=" ", dimension=110) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0224 begin`);
      const actual: string = wantJsonOf(' ', 110);
      logInfo(`wantJsonOf(formName=" ", dimension=110): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=110): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=110): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0224 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0225
     * @tc.name      RequestAddForm_WantJsonOf_0225
     * @tc.desc      wantJsonOf(formName=" ", dimension=115) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0225 begin`);
      const actual: string = wantJsonOf(' ', 115);
      logInfo(`wantJsonOf(formName=" ", dimension=115): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=115): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=115): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0225 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0226
     * @tc.name      RequestAddForm_WantJsonOf_0226
     * @tc.desc      wantJsonOf(formName=" ", dimension=120) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0226 begin`);
      const actual: string = wantJsonOf(' ', 120);
      logInfo(`wantJsonOf(formName=" ", dimension=120): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=120): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=120): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0226 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0227
     * @tc.name      RequestAddForm_WantJsonOf_0227
     * @tc.desc      wantJsonOf(formName=" ", dimension=125) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0227 begin`);
      const actual: string = wantJsonOf(' ', 125);
      logInfo(`wantJsonOf(formName=" ", dimension=125): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=125): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=125): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0227 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0228
     * @tc.name      RequestAddForm_WantJsonOf_0228
     * @tc.desc      wantJsonOf(formName=" ", dimension=130) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0228 begin`);
      const actual: string = wantJsonOf(' ', 130);
      logInfo(`wantJsonOf(formName=" ", dimension=130): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=130): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=130): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0228 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0229
     * @tc.name      RequestAddForm_WantJsonOf_0229
     * @tc.desc      wantJsonOf(formName=" ", dimension=135) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0229 begin`);
      const actual: string = wantJsonOf(' ', 135);
      logInfo(`wantJsonOf(formName=" ", dimension=135): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=135): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=135): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0229 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0230
     * @tc.name      RequestAddForm_WantJsonOf_0230
     * @tc.desc      wantJsonOf(formName=" ", dimension=140) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0230 begin`);
      const actual: string = wantJsonOf(' ', 140);
      logInfo(`wantJsonOf(formName=" ", dimension=140): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=140): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=140): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0230 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0231
     * @tc.name      RequestAddForm_WantJsonOf_0231
     * @tc.desc      wantJsonOf(formName=" ", dimension=145) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0231 begin`);
      const actual: string = wantJsonOf(' ', 145);
      logInfo(`wantJsonOf(formName=" ", dimension=145): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=145): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=145): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0231 end`);
    });
  });
}
