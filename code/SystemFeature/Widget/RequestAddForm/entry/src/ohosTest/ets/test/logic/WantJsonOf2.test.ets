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
export default function wantJsonOf2Test(): void {
  describe('WantJsonOf2Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0078
     * @tc.name      RequestAddForm_WantJsonOf_0078
     * @tc.desc      wantJsonOf(formName="Hello", dimension=86) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0078 begin`);
      const actual: string = wantJsonOf('Hello', 86);
      logInfo(`wantJsonOf(formName="Hello", dimension=86): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=86): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=86): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0078 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0079
     * @tc.name      RequestAddForm_WantJsonOf_0079
     * @tc.desc      wantJsonOf(formName="Hello", dimension=-12) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0079 begin`);
      const actual: string = wantJsonOf('Hello', -12);
      logInfo(`wantJsonOf(formName="Hello", dimension=-12): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=-12): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=-12): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0079 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0080
     * @tc.name      RequestAddForm_WantJsonOf_0080
     * @tc.desc      wantJsonOf(formName="Hello", dimension=139) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0080 begin`);
      const actual: string = wantJsonOf('Hello', 139);
      logInfo(`wantJsonOf(formName="Hello", dimension=139): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=139): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=139): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0080 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0081
     * @tc.name      RequestAddForm_WantJsonOf_0081
     * @tc.desc      wantJsonOf(formName="Hello", dimension=152) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0081 begin`);
      const actual: string = wantJsonOf('Hello', 152);
      logInfo(`wantJsonOf(formName="Hello", dimension=152): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=152): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=152): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0081 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0082
     * @tc.name      RequestAddForm_WantJsonOf_0082
     * @tc.desc      wantJsonOf(formName="Hello", dimension=4) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0082 begin`);
      const actual: string = wantJsonOf('Hello', 4);
      logInfo(`wantJsonOf(formName="Hello", dimension=4): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`wantJsonOf(formName="Hello", dimension=4): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=4): actual.substring(141)=${actual.substring(141)}`);
      expect(actual.substring(141)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0082 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0083
     * @tc.name      RequestAddForm_WantJsonOf_0083
     * @tc.desc      wantJsonOf(formName="Hello", dimension=-99) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0083 begin`);
      const actual: string = wantJsonOf('Hello', -99);
      logInfo(`wantJsonOf(formName="Hello", dimension=-99): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=-99): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=-99): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0083 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0084
     * @tc.name      RequestAddForm_WantJsonOf_0084
     * @tc.desc      wantJsonOf(formName="Hello", dimension=16.17) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0084 begin`);
      const actual: string = wantJsonOf('Hello', 16.17);
      logInfo(`wantJsonOf(formName="Hello", dimension=16...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(177);
      logInfo(`wantJsonOf(formName="Hello", dimension=16...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=16...: actual.substring(145)=${actual.substring(145)}`);
      expect(actual.substring(145)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0084 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0085
     * @tc.name      RequestAddForm_WantJsonOf_0085
     * @tc.desc      wantJsonOf(formName="Hello", dimension=46.73) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0085 begin`);
      const actual: string = wantJsonOf('Hello', 46.73);
      logInfo(`wantJsonOf(formName="Hello", dimension=46...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(177);
      logInfo(`wantJsonOf(formName="Hello", dimension=46...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=46...: actual.substring(145)=${actual.substring(145)}`);
      expect(actual.substring(145)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0085 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0086
     * @tc.name      RequestAddForm_WantJsonOf_0086
     * @tc.desc      wantJsonOf(formName="Hello", dimension=37.79) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0086 begin`);
      const actual: string = wantJsonOf('Hello', 37.79);
      logInfo(`wantJsonOf(formName="Hello", dimension=37...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(177);
      logInfo(`wantJsonOf(formName="Hello", dimension=37...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=37...: actual.substring(145)=${actual.substring(145)}`);
      expect(actual.substring(145)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0086 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0087
     * @tc.name      RequestAddForm_WantJsonOf_0087
     * @tc.desc      wantJsonOf(formName="Hello", dimension=88.57) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0087 begin`);
      const actual: string = wantJsonOf('Hello', 88.57);
      logInfo(`wantJsonOf(formName="Hello", dimension=88...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(177);
      logInfo(`wantJsonOf(formName="Hello", dimension=88...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=88...: actual.substring(145)=${actual.substring(145)}`);
      expect(actual.substring(145)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0087 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0088
     * @tc.name      RequestAddForm_WantJsonOf_0088
     * @tc.desc      wantJsonOf(formName="hello world", dimension=1) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0088 begin`);
      const actual: string = wantJsonOf('hello world', 1);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(179);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(147)=${actual.substring(147)}`);
      expect(actual.substring(147)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0088 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0089
     * @tc.name      RequestAddForm_WantJsonOf_0089
     * @tc.desc      wantJsonOf(formName="hello world", dimension=2) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0089 begin`);
      const actual: string = wantJsonOf('hello world', 2);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(179);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(147)=${actual.substring(147)}`);
      expect(actual.substring(147)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0089 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0090
     * @tc.name      RequestAddForm_WantJsonOf_0090
     * @tc.desc      wantJsonOf(formName="hello world", dimension=3) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0090 begin`);
      const actual: string = wantJsonOf('hello world', 3);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(179);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(147)=${actual.substring(147)}`);
      expect(actual.substring(147)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0090 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0091
     * @tc.name      RequestAddForm_WantJsonOf_0091
     * @tc.desc      wantJsonOf(formName="hello world", dimension=10) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0091 begin`);
      const actual: string = wantJsonOf('hello world', 10);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0091 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0092
     * @tc.name      RequestAddForm_WantJsonOf_0092
     * @tc.desc      wantJsonOf(formName="hello world", dimension=5) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0092 begin`);
      const actual: string = wantJsonOf('hello world', 5);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(179);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(147)=${actual.substring(147)}`);
      expect(actual.substring(147)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0092 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0093
     * @tc.name      RequestAddForm_WantJsonOf_0093
     * @tc.desc      wantJsonOf(formName="hello world", dimension=15) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0093 begin`);
      const actual: string = wantJsonOf('hello world', 15);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0093 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0094
     * @tc.name      RequestAddForm_WantJsonOf_0094
     * @tc.desc      wantJsonOf(formName="hello world", dimension=20) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0094 begin`);
      const actual: string = wantJsonOf('hello world', 20);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0094 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0095
     * @tc.name      RequestAddForm_WantJsonOf_0095
     * @tc.desc      wantJsonOf(formName="hello world", dimension=25) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0095 begin`);
      const actual: string = wantJsonOf('hello world', 25);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0095 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0096
     * @tc.name      RequestAddForm_WantJsonOf_0096
     * @tc.desc      wantJsonOf(formName="hello world", dimension=30) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0096 begin`);
      const actual: string = wantJsonOf('hello world', 30);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0096 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0097
     * @tc.name      RequestAddForm_WantJsonOf_0097
     * @tc.desc      wantJsonOf(formName="hello world", dimension=35) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0097 begin`);
      const actual: string = wantJsonOf('hello world', 35);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0097 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0098
     * @tc.name      RequestAddForm_WantJsonOf_0098
     * @tc.desc      wantJsonOf(formName="hello world", dimension=40) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0098 begin`);
      const actual: string = wantJsonOf('hello world', 40);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0098 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0099
     * @tc.name      RequestAddForm_WantJsonOf_0099
     * @tc.desc      wantJsonOf(formName="hello world", dimension=45) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0099 begin`);
      const actual: string = wantJsonOf('hello world', 45);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0099 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0100
     * @tc.name      RequestAddForm_WantJsonOf_0100
     * @tc.desc      wantJsonOf(formName="hello world", dimension=50) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0100 begin`);
      const actual: string = wantJsonOf('hello world', 50);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0100 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0101
     * @tc.name      RequestAddForm_WantJsonOf_0101
     * @tc.desc      wantJsonOf(formName="hello world", dimension=55) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0101 begin`);
      const actual: string = wantJsonOf('hello world', 55);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0101 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0102
     * @tc.name      RequestAddForm_WantJsonOf_0102
     * @tc.desc      wantJsonOf(formName="hello world", dimension=60) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0102 begin`);
      const actual: string = wantJsonOf('hello world', 60);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0102 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0103
     * @tc.name      RequestAddForm_WantJsonOf_0103
     * @tc.desc      wantJsonOf(formName="hello world", dimension=65) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0103 begin`);
      const actual: string = wantJsonOf('hello world', 65);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0103 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0104
     * @tc.name      RequestAddForm_WantJsonOf_0104
     * @tc.desc      wantJsonOf(formName="hello world", dimension=70) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0104 begin`);
      const actual: string = wantJsonOf('hello world', 70);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0104 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0105
     * @tc.name      RequestAddForm_WantJsonOf_0105
     * @tc.desc      wantJsonOf(formName="hello world", dimension=75) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0105 begin`);
      const actual: string = wantJsonOf('hello world', 75);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0105 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0106
     * @tc.name      RequestAddForm_WantJsonOf_0106
     * @tc.desc      wantJsonOf(formName="hello world", dimension=80) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0106 begin`);
      const actual: string = wantJsonOf('hello world', 80);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0106 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0107
     * @tc.name      RequestAddForm_WantJsonOf_0107
     * @tc.desc      wantJsonOf(formName="hello world", dimension=85) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0107 begin`);
      const actual: string = wantJsonOf('hello world', 85);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0107 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0108
     * @tc.name      RequestAddForm_WantJsonOf_0108
     * @tc.desc      wantJsonOf(formName="hello world", dimension=90) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0108 begin`);
      const actual: string = wantJsonOf('hello world', 90);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0108 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0109
     * @tc.name      RequestAddForm_WantJsonOf_0109
     * @tc.desc      wantJsonOf(formName="hello world", dimension=95) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0109 begin`);
      const actual: string = wantJsonOf('hello world', 95);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0109 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0110
     * @tc.name      RequestAddForm_WantJsonOf_0110
     * @tc.desc      wantJsonOf(formName="hello world", dimension=105) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0110 begin`);
      const actual: string = wantJsonOf('hello world', 105);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0110 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0111
     * @tc.name      RequestAddForm_WantJsonOf_0111
     * @tc.desc      wantJsonOf(formName="hello world", dimension=110) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0111 begin`);
      const actual: string = wantJsonOf('hello world', 110);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0111 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0112
     * @tc.name      RequestAddForm_WantJsonOf_0112
     * @tc.desc      wantJsonOf(formName="hello world", dimension=115) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0112 begin`);
      const actual: string = wantJsonOf('hello world', 115);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0112 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0113
     * @tc.name      RequestAddForm_WantJsonOf_0113
     * @tc.desc      wantJsonOf(formName="hello world", dimension=120) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0113 begin`);
      const actual: string = wantJsonOf('hello world', 120);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0113 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0114
     * @tc.name      RequestAddForm_WantJsonOf_0114
     * @tc.desc      wantJsonOf(formName="hello world", dimension=125) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0114 begin`);
      const actual: string = wantJsonOf('hello world', 125);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0114 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0115
     * @tc.name      RequestAddForm_WantJsonOf_0115
     * @tc.desc      wantJsonOf(formName="hello world", dimension=130) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0115 begin`);
      const actual: string = wantJsonOf('hello world', 130);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0115 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0116
     * @tc.name      RequestAddForm_WantJsonOf_0116
     * @tc.desc      wantJsonOf(formName="hello world", dimension=135) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0116 begin`);
      const actual: string = wantJsonOf('hello world', 135);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0116 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0117
     * @tc.name      RequestAddForm_WantJsonOf_0117
     * @tc.desc      wantJsonOf(formName="hello world", dimension=140) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0117 begin`);
      const actual: string = wantJsonOf('hello world', 140);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0117 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0118
     * @tc.name      RequestAddForm_WantJsonOf_0118
     * @tc.desc      wantJsonOf(formName="hello world", dimension=145) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0118 begin`);
      const actual: string = wantJsonOf('hello world', 145);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0118 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0119
     * @tc.name      RequestAddForm_WantJsonOf_0119
     * @tc.desc      wantJsonOf(formName="hello world", dimension=150) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0119 begin`);
      const actual: string = wantJsonOf('hello world', 150);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0119 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0120
     * @tc.name      RequestAddForm_WantJsonOf_0120
     * @tc.desc      wantJsonOf(formName="hello world", dimension=155) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0120 begin`);
      const actual: string = wantJsonOf('hello world', 155);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0120 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0121
     * @tc.name      RequestAddForm_WantJsonOf_0121
     * @tc.desc      wantJsonOf(formName="hello world", dimension=160) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0121 begin`);
      const actual: string = wantJsonOf('hello world', 160);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0121 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0122
     * @tc.name      RequestAddForm_WantJsonOf_0122
     * @tc.desc      wantJsonOf(formName="hello world", dimension=165) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0122 begin`);
      const actual: string = wantJsonOf('hello world', 165);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0122 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0123
     * @tc.name      RequestAddForm_WantJsonOf_0123
     * @tc.desc      wantJsonOf(formName="hello world", dimension=170) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0123 begin`);
      const actual: string = wantJsonOf('hello world', 170);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0123 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0124
     * @tc.name      RequestAddForm_WantJsonOf_0124
     * @tc.desc      wantJsonOf(formName="hello world", dimension=175) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0124 begin`);
      const actual: string = wantJsonOf('hello world', 175);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0124 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0125
     * @tc.name      RequestAddForm_WantJsonOf_0125
     * @tc.desc      wantJsonOf(formName="hello world", dimension=180) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0125 begin`);
      const actual: string = wantJsonOf('hello world', 180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0125 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0126
     * @tc.name      RequestAddForm_WantJsonOf_0126
     * @tc.desc      wantJsonOf(formName="hello world", dimension=185) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0126 begin`);
      const actual: string = wantJsonOf('hello world', 185);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0126 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0127
     * @tc.name      RequestAddForm_WantJsonOf_0127
     * @tc.desc      wantJsonOf(formName="hello world", dimension=190) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0127 begin`);
      const actual: string = wantJsonOf('hello world', 190);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0127 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0128
     * @tc.name      RequestAddForm_WantJsonOf_0128
     * @tc.desc      wantJsonOf(formName="hello world", dimension=195) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0128 begin`);
      const actual: string = wantJsonOf('hello world', 195);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0128 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0129
     * @tc.name      RequestAddForm_WantJsonOf_0129
     * @tc.desc      wantJsonOf(formName="hello world", dimension=200) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0129 begin`);
      const actual: string = wantJsonOf('hello world', 200);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0129 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0130
     * @tc.name      RequestAddForm_WantJsonOf_0130
     * @tc.desc      wantJsonOf(formName="hello world", dimension=186) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0130 begin`);
      const actual: string = wantJsonOf('hello world', 186);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0130 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0131
     * @tc.name      RequestAddForm_WantJsonOf_0131
     * @tc.desc      wantJsonOf(formName="hello world", dimension=158) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0131 begin`);
      const actual: string = wantJsonOf('hello world', 158);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0131 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0132
     * @tc.name      RequestAddForm_WantJsonOf_0132
     * @tc.desc      wantJsonOf(formName="hello world", dimension=99.4) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0132 begin`);
      const actual: string = wantJsonOf('hello world', 99.4);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(182);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(150)=${actual.substring(150)}`);
      expect(actual.substring(150)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0132 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0133
     * @tc.name      RequestAddForm_WantJsonOf_0133
     * @tc.desc      wantJsonOf(formName="hello world", dimension=86) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0133 begin`);
      const actual: string = wantJsonOf('hello world', 86);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0133 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0134
     * @tc.name      RequestAddForm_WantJsonOf_0134
     * @tc.desc      wantJsonOf(formName="hello world", dimension=-12) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0134 begin`);
      const actual: string = wantJsonOf('hello world', -12);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0134 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0135
     * @tc.name      RequestAddForm_WantJsonOf_0135
     * @tc.desc      wantJsonOf(formName="hello world", dimension=139) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0135 begin`);
      const actual: string = wantJsonOf('hello world', 139);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0135 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0136
     * @tc.name      RequestAddForm_WantJsonOf_0136
     * @tc.desc      wantJsonOf(formName="hello world", dimension=152) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0136 begin`);
      const actual: string = wantJsonOf('hello world', 152);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0136 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0137
     * @tc.name      RequestAddForm_WantJsonOf_0137
     * @tc.desc      wantJsonOf(formName="hello world", dimension=4) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0137 begin`);
      const actual: string = wantJsonOf('hello world', 4);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(179);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(147)=${actual.substring(147)}`);
      expect(actual.substring(147)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0137 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0138
     * @tc.name      RequestAddForm_WantJsonOf_0138
     * @tc.desc      wantJsonOf(formName="hello world", dimension=-99) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0138 begin`);
      const actual: string = wantJsonOf('hello world', -99);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0138 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0139
     * @tc.name      RequestAddForm_WantJsonOf_0139
     * @tc.desc      wantJsonOf(formName="hello world", dimension=16.17) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0139 begin`);
      const actual: string = wantJsonOf('hello world', 16.17);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(183);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(151)=${actual.substring(151)}`);
      expect(actual.substring(151)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0139 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0140
     * @tc.name      RequestAddForm_WantJsonOf_0140
     * @tc.desc      wantJsonOf(formName="hello world", dimension=46.73) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0140 begin`);
      const actual: string = wantJsonOf('hello world', 46.73);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(183);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(151)=${actual.substring(151)}`);
      expect(actual.substring(151)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0140 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0141
     * @tc.name      RequestAddForm_WantJsonOf_0141
     * @tc.desc      wantJsonOf(formName="hello world", dimension=37.79) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0141 begin`);
      const actual: string = wantJsonOf('hello world', 37.79);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(183);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(151)=${actual.substring(151)}`);
      expect(actual.substring(151)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0141 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0142
     * @tc.name      RequestAddForm_WantJsonOf_0142
     * @tc.desc      wantJsonOf(formName="hello world", dimension=88.57) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0142 begin`);
      const actual: string = wantJsonOf('hello world', 88.57);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(183);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(151)=${actual.substring(151)}`);
      expect(actual.substring(151)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0142 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0143
     * @tc.name      RequestAddForm_WantJsonOf_0143
     * @tc.desc      wantJsonOf(formName="", dimension=1) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0143 begin`);
      const actual: string = wantJsonOf('', 1);
      logInfo(`wantJsonOf(formName="", dimension=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(168);
      logInfo(`wantJsonOf(formName="", dimension=1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=1): actual.substring(136)=${actual.substring(136)}`);
      expect(actual.substring(136)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0143 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0144
     * @tc.name      RequestAddForm_WantJsonOf_0144
     * @tc.desc      wantJsonOf(formName="", dimension=2) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0144 begin`);
      const actual: string = wantJsonOf('', 2);
      logInfo(`wantJsonOf(formName="", dimension=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(168);
      logInfo(`wantJsonOf(formName="", dimension=2): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=2): actual.substring(136)=${actual.substring(136)}`);
      expect(actual.substring(136)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0144 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0145
     * @tc.name      RequestAddForm_WantJsonOf_0145
     * @tc.desc      wantJsonOf(formName="", dimension=3) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0145 begin`);
      const actual: string = wantJsonOf('', 3);
      logInfo(`wantJsonOf(formName="", dimension=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(168);
      logInfo(`wantJsonOf(formName="", dimension=3): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=3): actual.substring(136)=${actual.substring(136)}`);
      expect(actual.substring(136)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0145 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0146
     * @tc.name      RequestAddForm_WantJsonOf_0146
     * @tc.desc      wantJsonOf(formName="", dimension=10) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0146 begin`);
      const actual: string = wantJsonOf('', 10);
      logInfo(`wantJsonOf(formName="", dimension=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=10): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=10): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0146 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0147
     * @tc.name      RequestAddForm_WantJsonOf_0147
     * @tc.desc      wantJsonOf(formName="", dimension=5) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0147 begin`);
      const actual: string = wantJsonOf('', 5);
      logInfo(`wantJsonOf(formName="", dimension=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(168);
      logInfo(`wantJsonOf(formName="", dimension=5): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=5): actual.substring(136)=${actual.substring(136)}`);
      expect(actual.substring(136)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0147 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0148
     * @tc.name      RequestAddForm_WantJsonOf_0148
     * @tc.desc      wantJsonOf(formName="", dimension=15) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0148 begin`);
      const actual: string = wantJsonOf('', 15);
      logInfo(`wantJsonOf(formName="", dimension=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=15): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=15): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0148 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0149
     * @tc.name      RequestAddForm_WantJsonOf_0149
     * @tc.desc      wantJsonOf(formName="", dimension=20) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0149 begin`);
      const actual: string = wantJsonOf('', 20);
      logInfo(`wantJsonOf(formName="", dimension=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=20): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=20): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0149 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0150
     * @tc.name      RequestAddForm_WantJsonOf_0150
     * @tc.desc      wantJsonOf(formName="", dimension=25) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0150 begin`);
      const actual: string = wantJsonOf('', 25);
      logInfo(`wantJsonOf(formName="", dimension=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=25): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=25): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0150 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0151
     * @tc.name      RequestAddForm_WantJsonOf_0151
     * @tc.desc      wantJsonOf(formName="", dimension=30) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0151 begin`);
      const actual: string = wantJsonOf('', 30);
      logInfo(`wantJsonOf(formName="", dimension=30): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=30): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=30): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0151 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0152
     * @tc.name      RequestAddForm_WantJsonOf_0152
     * @tc.desc      wantJsonOf(formName="", dimension=35) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0152 begin`);
      const actual: string = wantJsonOf('', 35);
      logInfo(`wantJsonOf(formName="", dimension=35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=35): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=35): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0152 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0153
     * @tc.name      RequestAddForm_WantJsonOf_0153
     * @tc.desc      wantJsonOf(formName="", dimension=40) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0153 begin`);
      const actual: string = wantJsonOf('', 40);
      logInfo(`wantJsonOf(formName="", dimension=40): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=40): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=40): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0153 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0154
     * @tc.name      RequestAddForm_WantJsonOf_0154
     * @tc.desc      wantJsonOf(formName="", dimension=45) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0154 begin`);
      const actual: string = wantJsonOf('', 45);
      logInfo(`wantJsonOf(formName="", dimension=45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=45): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=45): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0154 end`);
    });
  });
}
