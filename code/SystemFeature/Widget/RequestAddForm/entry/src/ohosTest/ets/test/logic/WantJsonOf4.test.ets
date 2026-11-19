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

/** Logic checks for wantJsonOf (28 cases). */
export default function wantJsonOf4Test(): void {
  describe('WantJsonOf4Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0232
     * @tc.name      RequestAddForm_WantJsonOf_0232
     * @tc.desc      wantJsonOf(formName=" ", dimension=150) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0232 begin`);
      const actual: string = wantJsonOf(' ', 150);
      logInfo(`wantJsonOf(formName=" ", dimension=150): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=150): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=150): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0232 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0233
     * @tc.name      RequestAddForm_WantJsonOf_0233
     * @tc.desc      wantJsonOf(formName=" ", dimension=155) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0233 begin`);
      const actual: string = wantJsonOf(' ', 155);
      logInfo(`wantJsonOf(formName=" ", dimension=155): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=155): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=155): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0233 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0234
     * @tc.name      RequestAddForm_WantJsonOf_0234
     * @tc.desc      wantJsonOf(formName=" ", dimension=160) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0234 begin`);
      const actual: string = wantJsonOf(' ', 160);
      logInfo(`wantJsonOf(formName=" ", dimension=160): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=160): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=160): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0234 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0235
     * @tc.name      RequestAddForm_WantJsonOf_0235
     * @tc.desc      wantJsonOf(formName=" ", dimension=165) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0235 begin`);
      const actual: string = wantJsonOf(' ', 165);
      logInfo(`wantJsonOf(formName=" ", dimension=165): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=165): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=165): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0235 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0236
     * @tc.name      RequestAddForm_WantJsonOf_0236
     * @tc.desc      wantJsonOf(formName=" ", dimension=170) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0236 begin`);
      const actual: string = wantJsonOf(' ', 170);
      logInfo(`wantJsonOf(formName=" ", dimension=170): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=170): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=170): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0236 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0237
     * @tc.name      RequestAddForm_WantJsonOf_0237
     * @tc.desc      wantJsonOf(formName=" ", dimension=175) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0237 begin`);
      const actual: string = wantJsonOf(' ', 175);
      logInfo(`wantJsonOf(formName=" ", dimension=175): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=175): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=175): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0237 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0238
     * @tc.name      RequestAddForm_WantJsonOf_0238
     * @tc.desc      wantJsonOf(formName=" ", dimension=180) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0238 begin`);
      const actual: string = wantJsonOf(' ', 180);
      logInfo(`wantJsonOf(formName=" ", dimension=180): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=180): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=180): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0238 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0239
     * @tc.name      RequestAddForm_WantJsonOf_0239
     * @tc.desc      wantJsonOf(formName=" ", dimension=185) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0239 begin`);
      const actual: string = wantJsonOf(' ', 185);
      logInfo(`wantJsonOf(formName=" ", dimension=185): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=185): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=185): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0239 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0240
     * @tc.name      RequestAddForm_WantJsonOf_0240
     * @tc.desc      wantJsonOf(formName=" ", dimension=190) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0240 begin`);
      const actual: string = wantJsonOf(' ', 190);
      logInfo(`wantJsonOf(formName=" ", dimension=190): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=190): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=190): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0240 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0241
     * @tc.name      RequestAddForm_WantJsonOf_0241
     * @tc.desc      wantJsonOf(formName=" ", dimension=195) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0241 begin`);
      const actual: string = wantJsonOf(' ', 195);
      logInfo(`wantJsonOf(formName=" ", dimension=195): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=195): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=195): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0241 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0242
     * @tc.name      RequestAddForm_WantJsonOf_0242
     * @tc.desc      wantJsonOf(formName=" ", dimension=200) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0242 begin`);
      const actual: string = wantJsonOf(' ', 200);
      logInfo(`wantJsonOf(formName=" ", dimension=200): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=200): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=200): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0242 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0243
     * @tc.name      RequestAddForm_WantJsonOf_0243
     * @tc.desc      wantJsonOf(formName=" ", dimension=90.7) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0243 begin`);
      const actual: string = wantJsonOf(' ', 90.7);
      logInfo(`wantJsonOf(formName=" ", dimension=90.7): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(172);
      logInfo(`wantJsonOf(formName=" ", dimension=90.7): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=90.7): actual.substring(140)=${actual.substring(140)}`);
      expect(actual.substring(140)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0243 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0244
     * @tc.name      RequestAddForm_WantJsonOf_0244
     * @tc.desc      wantJsonOf(formName=" ", dimension=186) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0244 begin`);
      const actual: string = wantJsonOf(' ', 186);
      logInfo(`wantJsonOf(formName=" ", dimension=186): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=186): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=186): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0244 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0245
     * @tc.name      RequestAddForm_WantJsonOf_0245
     * @tc.desc      wantJsonOf(formName=" ", dimension=158) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0245 begin`);
      const actual: string = wantJsonOf(' ', 158);
      logInfo(`wantJsonOf(formName=" ", dimension=158): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=158): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=158): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0245 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0246
     * @tc.name      RequestAddForm_WantJsonOf_0246
     * @tc.desc      wantJsonOf(formName=" ", dimension=99.4) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0246 begin`);
      const actual: string = wantJsonOf(' ', 99.4);
      logInfo(`wantJsonOf(formName=" ", dimension=99.4): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(172);
      logInfo(`wantJsonOf(formName=" ", dimension=99.4): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=99.4): actual.substring(140)=${actual.substring(140)}`);
      expect(actual.substring(140)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0246 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0247
     * @tc.name      RequestAddForm_WantJsonOf_0247
     * @tc.desc      wantJsonOf(formName=" ", dimension=86) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0247 begin`);
      const actual: string = wantJsonOf(' ', 86);
      logInfo(`wantJsonOf(formName=" ", dimension=86): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName=" ", dimension=86): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=86): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0247 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0248
     * @tc.name      RequestAddForm_WantJsonOf_0248
     * @tc.desc      wantJsonOf(formName=" ", dimension=-12) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0248 begin`);
      const actual: string = wantJsonOf(' ', -12);
      logInfo(`wantJsonOf(formName=" ", dimension=-12): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=-12): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=-12): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0248 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0249
     * @tc.name      RequestAddForm_WantJsonOf_0249
     * @tc.desc      wantJsonOf(formName=" ", dimension=139) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0249 begin`);
      const actual: string = wantJsonOf(' ', 139);
      logInfo(`wantJsonOf(formName=" ", dimension=139): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=139): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=139): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0249 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0250
     * @tc.name      RequestAddForm_WantJsonOf_0250
     * @tc.desc      wantJsonOf(formName=" ", dimension=152) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0250 begin`);
      const actual: string = wantJsonOf(' ', 152);
      logInfo(`wantJsonOf(formName=" ", dimension=152): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=152): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=152): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0250 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0251
     * @tc.name      RequestAddForm_WantJsonOf_0251
     * @tc.desc      wantJsonOf(formName=" ", dimension=87.21) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0251 begin`);
      const actual: string = wantJsonOf(' ', 87.21);
      logInfo(`wantJsonOf(formName=" ", dimension=87.21): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`wantJsonOf(formName=" ", dimension=87.21): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=87.21): actual.substring(141)=${actual.substring(141)}`);
      expect(actual.substring(141)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0251 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0252
     * @tc.name      RequestAddForm_WantJsonOf_0252
     * @tc.desc      wantJsonOf(formName=" ", dimension=4) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0252 begin`);
      const actual: string = wantJsonOf(' ', 4);
      logInfo(`wantJsonOf(formName=" ", dimension=4): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName=" ", dimension=4): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=4): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0252 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0253
     * @tc.name      RequestAddForm_WantJsonOf_0253
     * @tc.desc      wantJsonOf(formName=" ", dimension=-99) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0253 begin`);
      const actual: string = wantJsonOf(' ', -99);
      logInfo(`wantJsonOf(formName=" ", dimension=-99): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName=" ", dimension=-99): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=-99): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0253 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0254
     * @tc.name      RequestAddForm_WantJsonOf_0254
     * @tc.desc      wantJsonOf(formName=" ", dimension=16.17) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0254 begin`);
      const actual: string = wantJsonOf(' ', 16.17);
      logInfo(`wantJsonOf(formName=" ", dimension=16.17): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`wantJsonOf(formName=" ", dimension=16.17): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=16.17): actual.substring(141)=${actual.substring(141)}`);
      expect(actual.substring(141)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0254 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0255
     * @tc.name      RequestAddForm_WantJsonOf_0255
     * @tc.desc      wantJsonOf(formName=" ", dimension=46.73) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0255 begin`);
      const actual: string = wantJsonOf(' ', 46.73);
      logInfo(`wantJsonOf(formName=" ", dimension=46.73): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`wantJsonOf(formName=" ", dimension=46.73): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=46.73): actual.substring(141)=${actual.substring(141)}`);
      expect(actual.substring(141)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0255 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0256
     * @tc.name      RequestAddForm_WantJsonOf_0256
     * @tc.desc      wantJsonOf(formName=" ", dimension=37.79) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0256 begin`);
      const actual: string = wantJsonOf(' ', 37.79);
      logInfo(`wantJsonOf(formName=" ", dimension=37.79): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`wantJsonOf(formName=" ", dimension=37.79): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=37.79): actual.substring(141)=${actual.substring(141)}`);
      expect(actual.substring(141)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0256 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0257
     * @tc.name      RequestAddForm_WantJsonOf_0257
     * @tc.desc      wantJsonOf(formName=" ", dimension=88.57) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0257 begin`);
      const actual: string = wantJsonOf(' ', 88.57);
      logInfo(`wantJsonOf(formName=" ", dimension=88.57): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`wantJsonOf(formName=" ", dimension=88.57): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" ", dimension=88.57): actual.substring(141)=${actual.substring(141)}`);
      expect(actual.substring(141)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0257 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0258
     * @tc.name      RequestAddForm_WantJsonOf_0258
     * @tc.desc      wantJsonOf(formName="A", dimension=0) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0258 begin`);
      const actual: string = wantJsonOf('A', 0);
      logInfo(`wantJsonOf(formName="A", dimension=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="A", dimension=0): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="A", dimension=0): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0258 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0259
     * @tc.name      RequestAddForm_WantJsonOf_0259
     * @tc.desc      wantJsonOf(formName="A", dimension=1) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0259 begin`);
      const actual: string = wantJsonOf('A', 1);
      logInfo(`wantJsonOf(formName="A", dimension=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="A", dimension=1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="A", dimension=1): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0259 end`);
    });
  });
}
