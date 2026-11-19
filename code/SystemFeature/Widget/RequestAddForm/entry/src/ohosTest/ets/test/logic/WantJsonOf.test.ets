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
export default function wantJsonOfTest(): void {
  describe('WantJsonOfTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0001
     * @tc.name      RequestAddForm_WantJsonOf_0001
     * @tc.desc      wantJsonOf(formName="Hello", dimension=0) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_WantJsonOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0001 begin`);
      const actual: string = wantJsonOf('Hello', 0);
      logInfo(`wantJsonOf(formName="Hello", dimension=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`wantJsonOf(formName="Hello", dimension=0): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=0): actual.substring(141)=${actual.substring(141)}`);
      expect(actual.substring(141)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0002
     * @tc.name      RequestAddForm_WantJsonOf_0002
     * @tc.desc      wantJsonOf(formName="Hello", dimension=-1) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_WantJsonOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0002 begin`);
      const actual: string = wantJsonOf('Hello', -1);
      logInfo(`wantJsonOf(formName="Hello", dimension=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=-1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=-1): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0003
     * @tc.name      RequestAddForm_WantJsonOf_0003
     * @tc.desc      wantJsonOf(formName="Hello", dimension=100) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0003 begin`);
      const actual: string = wantJsonOf('Hello', 100);
      logInfo(`wantJsonOf(formName="Hello", dimension=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=100): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=100): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0004
     * @tc.name      RequestAddForm_WantJsonOf_0004
     * @tc.desc      wantJsonOf(formName="Hello", dimension=90.7) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0004 begin`);
      const actual: string = wantJsonOf('Hello', 90.7);
      logInfo(`wantJsonOf(formName="Hello", dimension=90.7): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(176);
      logInfo(`wantJsonOf(formName="Hello", dimension=90.7): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=90.7): actual.substring(144)=${actual.substring(144)}`);
      expect(actual.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0005
     * @tc.name      RequestAddForm_WantJsonOf_0005
     * @tc.desc      wantJsonOf(formName="Hello", dimension=87.21) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0005 begin`);
      const actual: string = wantJsonOf('Hello', 87.21);
      logInfo(`wantJsonOf(formName="Hello", dimension=87...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(177);
      logInfo(`wantJsonOf(formName="Hello", dimension=87...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=87...: actual.substring(145)=${actual.substring(145)}`);
      expect(actual.substring(145)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0006
     * @tc.name      RequestAddForm_WantJsonOf_0006
     * @tc.desc      wantJsonOf(formName="hello world", dimension=0) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0006 begin`);
      const actual: string = wantJsonOf('hello world', 0);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(179);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(147)=${actual.substring(147)}`);
      expect(actual.substring(147)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0007
     * @tc.name      RequestAddForm_WantJsonOf_0007
     * @tc.desc      wantJsonOf(formName="hello world", dimension=-1) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0007 begin`);
      const actual: string = wantJsonOf('hello world', -1);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0008
     * @tc.name      RequestAddForm_WantJsonOf_0008
     * @tc.desc      wantJsonOf(formName="hello world", dimension=100) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0008 begin`);
      const actual: string = wantJsonOf('hello world', 100);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0009
     * @tc.name      RequestAddForm_WantJsonOf_0009
     * @tc.desc      wantJsonOf(formName="hello world", dimension=90.7) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0009 begin`);
      const actual: string = wantJsonOf('hello world', 90.7);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(182);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(150)=${actual.substring(150)}`);
      expect(actual.substring(150)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0010
     * @tc.name      RequestAddForm_WantJsonOf_0010
     * @tc.desc      wantJsonOf(formName="hello world", dimension=87.21) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0010 begin`);
      const actual: string = wantJsonOf('hello world', 87.21);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(183);
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello world", dimens...: actual.substring(151)=${actual.substring(151)}`);
      expect(actual.substring(151)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0011
     * @tc.name      RequestAddForm_WantJsonOf_0011
     * @tc.desc      wantJsonOf(formName="", dimension=0) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0011 begin`);
      const actual: string = wantJsonOf('', 0);
      logInfo(`wantJsonOf(formName="", dimension=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(168);
      logInfo(`wantJsonOf(formName="", dimension=0): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=0): actual.substring(136)=${actual.substring(136)}`);
      expect(actual.substring(136)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0012
     * @tc.name      RequestAddForm_WantJsonOf_0012
     * @tc.desc      wantJsonOf(formName="", dimension=-1) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0012 begin`);
      const actual: string = wantJsonOf('', -1);
      logInfo(`wantJsonOf(formName="", dimension=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`wantJsonOf(formName="", dimension=-1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=-1): actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0013
     * @tc.name      RequestAddForm_WantJsonOf_0013
     * @tc.desc      wantJsonOf(formName="", dimension=100) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0013 begin`);
      const actual: string = wantJsonOf('', 100);
      logInfo(`wantJsonOf(formName="", dimension=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`wantJsonOf(formName="", dimension=100): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=100): actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0014
     * @tc.name      RequestAddForm_WantJsonOf_0014
     * @tc.desc      wantJsonOf(formName="", dimension=90.7) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0014 begin`);
      const actual: string = wantJsonOf('', 90.7);
      logInfo(`wantJsonOf(formName="", dimension=90.7): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`wantJsonOf(formName="", dimension=90.7): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=90.7): actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0015
     * @tc.name      RequestAddForm_WantJsonOf_0015
     * @tc.desc      wantJsonOf(formName="", dimension=87.21) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0015 begin`);
      const actual: string = wantJsonOf('', 87.21);
      logInfo(`wantJsonOf(formName="", dimension=87.21): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(172);
      logInfo(`wantJsonOf(formName="", dimension=87.21): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="", dimension=87.21): actual.substring(140)=${actual.substring(140)}`);
      expect(actual.substring(140)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0016
     * @tc.name      RequestAddForm_WantJsonOf_0016
     * @tc.desc      wantJsonOf(formName="Sample Title 123", dimension=0) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0016 begin`);
      const actual: string = wantJsonOf('Sample Title 123', 0);
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(184);
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.substring(152)=${actual.substring(152)}`);
      expect(actual.substring(152)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0017
     * @tc.name      RequestAddForm_WantJsonOf_0017
     * @tc.desc      wantJsonOf(formName="Sample Title 123", dimension=-1) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0017 begin`);
      const actual: string = wantJsonOf('Sample Title 123', -1);
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(185);
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.substring(153)=${actual.substring(153)}`);
      expect(actual.substring(153)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0018
     * @tc.name      RequestAddForm_WantJsonOf_0018
     * @tc.desc      wantJsonOf(formName="Sample Title 123", dimension=100) returns "param.key.module_name?":?"entry?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0018 begin`);
      const actual: string = wantJsonOf('Sample Title 123', 100);
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(186);
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.substring(154)=${actual.substring(154)}`);
      expect(actual.substring(154)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0019
     * @tc.name      RequestAddForm_WantJsonOf_0019
     * @tc.desc      wantJsonOf(formName="Sample Title 123", dimension=90.7) returns "param.key.module_name?":?"entry...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0019 begin`);
      const actual: string = wantJsonOf('Sample Title 123', 90.7);
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(187);
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.substring(155)=${actual.substring(155)}`);
      expect(actual.substring(155)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0020
     * @tc.name      RequestAddForm_WantJsonOf_0020
     * @tc.desc      wantJsonOf(formName="Sample Title 123", dimension=87.21) returns "param.key.module_name?":?"entr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0020 begin`);
      const actual: string = wantJsonOf('Sample Title 123', 87.21);
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(188);
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Sample Title 123", d...: actual.substring(156)=${actual.substring(156)}`);
      expect(actual.substring(156)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0021
     * @tc.name      RequestAddForm_WantJsonOf_0021
     * @tc.desc      wantJsonOf(formName=" Hello ", dimension=90.7) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0021 begin`);
      const actual: string = wantJsonOf(' Hello ', 90.7);
      logInfo(`wantJsonOf(formName=" Hello ", dimension=...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(178);
      logInfo(`wantJsonOf(formName=" Hello ", dimension=...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" Hello ", dimension=...: actual.substring(146)=${actual.substring(146)}`);
      expect(actual.substring(146)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0022
     * @tc.name      RequestAddForm_WantJsonOf_0022
     * @tc.desc      wantJsonOf(formName="hello worldhello world", dimension=0) returns "param.key.module_name?":?"en...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0022 begin`);
      const actual: string = wantJsonOf('hello worldhello world', 0);
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(190);
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.substring(158)=${actual.substring(158)}`);
      expect(actual.substring(158)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0023
     * @tc.name      RequestAddForm_WantJsonOf_0023
     * @tc.desc      wantJsonOf(formName="hello worldhello world", dimension=-1) returns "param.key.module_name?":?"e...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0023 begin`);
      const actual: string = wantJsonOf('hello worldhello world', -1);
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(191);
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.substring(159)=${actual.substring(159)}`);
      expect(actual.substring(159)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0024
     * @tc.name      RequestAddForm_WantJsonOf_0024
     * @tc.desc      wantJsonOf(formName="hello worldhello world", dimension=100) returns "param.key.module_name?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0024 begin`);
      const actual: string = wantJsonOf('hello worldhello world', 100);
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(192);
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.substring(160)=${actual.substring(160)}`);
      expect(actual.substring(160)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0025
     * @tc.name      RequestAddForm_WantJsonOf_0025
     * @tc.desc      wantJsonOf(formName="hello worldhello world", dimension=90.7) returns "param.key.module_name?":?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0025 begin`);
      const actual: string = wantJsonOf('hello worldhello world', 90.7);
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(193);
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.substring(161)=${actual.substring(161)}`);
      expect(actual.substring(161)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0026
     * @tc.name      RequestAddForm_WantJsonOf_0026
     * @tc.desc      wantJsonOf(formName="hello worldhello world", dimension=87.21) returns "param.key.module_name?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0026 begin`);
      const actual: string = wantJsonOf('hello worldhello world', 87.21);
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(194);
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="hello worldhello wor...: actual.substring(162)=${actual.substring(162)}`);
      expect(actual.substring(162)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0027
     * @tc.name      RequestAddForm_WantJsonOf_0027
     * @tc.desc      wantJsonOf(formName=" Sample Title 123 ", dimension=90.7) returns "param.key.module_name?":?"ent...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0027 begin`);
      const actual: string = wantJsonOf(' Sample Title 123 ', 90.7);
      logInfo(`wantJsonOf(formName=" Sample Title 123 ",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(189);
      logInfo(`wantJsonOf(formName=" Sample Title 123 ",...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName=" Sample Title 123 ",...: actual.substring(157)=${actual.substring(157)}`);
      expect(actual.substring(157)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0028
     * @tc.name      RequestAddForm_WantJsonOf_0028
     * @tc.desc      wantJsonOf(formName="Sample Title 123Sample Title 123", dimension=0) returns "param.key.module_n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0028 begin`);
      const actual: string = wantJsonOf('Sample Title 123Sample Title 123', 0);
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(200);
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.substring(168)=${actual.substring(168)}`);
      expect(actual.substring(168)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0029
     * @tc.name      RequestAddForm_WantJsonOf_0029
     * @tc.desc      wantJsonOf(formName="Sample Title 123Sample Title 123", dimension=-1) returns "param.key.module_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_WantJsonOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0029 begin`);
      const actual: string = wantJsonOf('Sample Title 123Sample Title 123', -1);
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(201);
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.substring(169)=${actual.substring(169)}`);
      expect(actual.substring(169)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0030
     * @tc.name      RequestAddForm_WantJsonOf_0030
     * @tc.desc      wantJsonOf(formName="Sample Title 123Sample Title 123", dimension=100) returns "param.key.module...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0030 begin`);
      const actual: string = wantJsonOf('Sample Title 123Sample Title 123', 100);
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(202);
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.substring(170)=${actual.substring(170)}`);
      expect(actual.substring(170)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0031
     * @tc.name      RequestAddForm_WantJsonOf_0031
     * @tc.desc      wantJsonOf(formName="Sample Title 123Sample Title 123", dimension=90.7) returns "param.key.modul...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0031 begin`);
      const actual: string = wantJsonOf('Sample Title 123Sample Title 123', 90.7);
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(203);
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.substring(171)=${actual.substring(171)}`);
      expect(actual.substring(171)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0032
     * @tc.name      RequestAddForm_WantJsonOf_0032
     * @tc.desc      wantJsonOf(formName="Sample Title 123Sample Title 123", dimension=87.21) returns "param.key.modu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0032 begin`);
      const actual: string = wantJsonOf('Sample Title 123Sample Title 123', 87.21);
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(204);
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Sample Title 123Samp...: actual.substring(172)=${actual.substring(172)}`);
      expect(actual.substring(172)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0033
     * @tc.name      RequestAddForm_WantJsonOf_0033
     * @tc.desc      wantJsonOf(formName="Hello", dimension=1) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0033 begin`);
      const actual: string = wantJsonOf('Hello', 1);
      logInfo(`wantJsonOf(formName="Hello", dimension=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`wantJsonOf(formName="Hello", dimension=1): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=1): actual.substring(141)=${actual.substring(141)}`);
      expect(actual.substring(141)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0034
     * @tc.name      RequestAddForm_WantJsonOf_0034
     * @tc.desc      wantJsonOf(formName="Hello", dimension=2) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0034 begin`);
      const actual: string = wantJsonOf('Hello', 2);
      logInfo(`wantJsonOf(formName="Hello", dimension=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`wantJsonOf(formName="Hello", dimension=2): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=2): actual.substring(141)=${actual.substring(141)}`);
      expect(actual.substring(141)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0035
     * @tc.name      RequestAddForm_WantJsonOf_0035
     * @tc.desc      wantJsonOf(formName="Hello", dimension=3) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0035 begin`);
      const actual: string = wantJsonOf('Hello', 3);
      logInfo(`wantJsonOf(formName="Hello", dimension=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`wantJsonOf(formName="Hello", dimension=3): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=3): actual.substring(141)=${actual.substring(141)}`);
      expect(actual.substring(141)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0036
     * @tc.name      RequestAddForm_WantJsonOf_0036
     * @tc.desc      wantJsonOf(formName="Hello", dimension=10) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0036 begin`);
      const actual: string = wantJsonOf('Hello', 10);
      logInfo(`wantJsonOf(formName="Hello", dimension=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=10): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=10): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0037
     * @tc.name      RequestAddForm_WantJsonOf_0037
     * @tc.desc      wantJsonOf(formName="Hello", dimension=5) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0037 begin`);
      const actual: string = wantJsonOf('Hello', 5);
      logInfo(`wantJsonOf(formName="Hello", dimension=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`wantJsonOf(formName="Hello", dimension=5): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=5): actual.substring(141)=${actual.substring(141)}`);
      expect(actual.substring(141)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0038
     * @tc.name      RequestAddForm_WantJsonOf_0038
     * @tc.desc      wantJsonOf(formName="Hello", dimension=15) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0038 begin`);
      const actual: string = wantJsonOf('Hello', 15);
      logInfo(`wantJsonOf(formName="Hello", dimension=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=15): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=15): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0039
     * @tc.name      RequestAddForm_WantJsonOf_0039
     * @tc.desc      wantJsonOf(formName="Hello", dimension=20) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0039 begin`);
      const actual: string = wantJsonOf('Hello', 20);
      logInfo(`wantJsonOf(formName="Hello", dimension=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=20): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=20): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0040
     * @tc.name      RequestAddForm_WantJsonOf_0040
     * @tc.desc      wantJsonOf(formName="Hello", dimension=25) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0040 begin`);
      const actual: string = wantJsonOf('Hello', 25);
      logInfo(`wantJsonOf(formName="Hello", dimension=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=25): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=25): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0041
     * @tc.name      RequestAddForm_WantJsonOf_0041
     * @tc.desc      wantJsonOf(formName="Hello", dimension=30) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0041 begin`);
      const actual: string = wantJsonOf('Hello', 30);
      logInfo(`wantJsonOf(formName="Hello", dimension=30): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=30): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=30): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0042
     * @tc.name      RequestAddForm_WantJsonOf_0042
     * @tc.desc      wantJsonOf(formName="Hello", dimension=35) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0042 begin`);
      const actual: string = wantJsonOf('Hello', 35);
      logInfo(`wantJsonOf(formName="Hello", dimension=35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=35): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=35): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0042 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0043
     * @tc.name      RequestAddForm_WantJsonOf_0043
     * @tc.desc      wantJsonOf(formName="Hello", dimension=40) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0043 begin`);
      const actual: string = wantJsonOf('Hello', 40);
      logInfo(`wantJsonOf(formName="Hello", dimension=40): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=40): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=40): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0044
     * @tc.name      RequestAddForm_WantJsonOf_0044
     * @tc.desc      wantJsonOf(formName="Hello", dimension=45) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0044 begin`);
      const actual: string = wantJsonOf('Hello', 45);
      logInfo(`wantJsonOf(formName="Hello", dimension=45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=45): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=45): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0045
     * @tc.name      RequestAddForm_WantJsonOf_0045
     * @tc.desc      wantJsonOf(formName="Hello", dimension=50) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0045 begin`);
      const actual: string = wantJsonOf('Hello', 50);
      logInfo(`wantJsonOf(formName="Hello", dimension=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=50): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=50): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0046
     * @tc.name      RequestAddForm_WantJsonOf_0046
     * @tc.desc      wantJsonOf(formName="Hello", dimension=55) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0046 begin`);
      const actual: string = wantJsonOf('Hello', 55);
      logInfo(`wantJsonOf(formName="Hello", dimension=55): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=55): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=55): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0047
     * @tc.name      RequestAddForm_WantJsonOf_0047
     * @tc.desc      wantJsonOf(formName="Hello", dimension=60) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0047 begin`);
      const actual: string = wantJsonOf('Hello', 60);
      logInfo(`wantJsonOf(formName="Hello", dimension=60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=60): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=60): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0048
     * @tc.name      RequestAddForm_WantJsonOf_0048
     * @tc.desc      wantJsonOf(formName="Hello", dimension=65) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0048 begin`);
      const actual: string = wantJsonOf('Hello', 65);
      logInfo(`wantJsonOf(formName="Hello", dimension=65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=65): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=65): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0049
     * @tc.name      RequestAddForm_WantJsonOf_0049
     * @tc.desc      wantJsonOf(formName="Hello", dimension=70) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0049 begin`);
      const actual: string = wantJsonOf('Hello', 70);
      logInfo(`wantJsonOf(formName="Hello", dimension=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=70): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=70): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0050
     * @tc.name      RequestAddForm_WantJsonOf_0050
     * @tc.desc      wantJsonOf(formName="Hello", dimension=75) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0050 begin`);
      const actual: string = wantJsonOf('Hello', 75);
      logInfo(`wantJsonOf(formName="Hello", dimension=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=75): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=75): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0050 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0051
     * @tc.name      RequestAddForm_WantJsonOf_0051
     * @tc.desc      wantJsonOf(formName="Hello", dimension=80) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0051 begin`);
      const actual: string = wantJsonOf('Hello', 80);
      logInfo(`wantJsonOf(formName="Hello", dimension=80): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=80): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=80): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0051 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0052
     * @tc.name      RequestAddForm_WantJsonOf_0052
     * @tc.desc      wantJsonOf(formName="Hello", dimension=85) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0052 begin`);
      const actual: string = wantJsonOf('Hello', 85);
      logInfo(`wantJsonOf(formName="Hello", dimension=85): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=85): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=85): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0052 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0053
     * @tc.name      RequestAddForm_WantJsonOf_0053
     * @tc.desc      wantJsonOf(formName="Hello", dimension=90) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0053 begin`);
      const actual: string = wantJsonOf('Hello', 90);
      logInfo(`wantJsonOf(formName="Hello", dimension=90): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=90): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=90): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0053 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0054
     * @tc.name      RequestAddForm_WantJsonOf_0054
     * @tc.desc      wantJsonOf(formName="Hello", dimension=95) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0054 begin`);
      const actual: string = wantJsonOf('Hello', 95);
      logInfo(`wantJsonOf(formName="Hello", dimension=95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`wantJsonOf(formName="Hello", dimension=95): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=95): actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0054 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0055
     * @tc.name      RequestAddForm_WantJsonOf_0055
     * @tc.desc      wantJsonOf(formName="Hello", dimension=105) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0055 begin`);
      const actual: string = wantJsonOf('Hello', 105);
      logInfo(`wantJsonOf(formName="Hello", dimension=105): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=105): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=105): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0055 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0056
     * @tc.name      RequestAddForm_WantJsonOf_0056
     * @tc.desc      wantJsonOf(formName="Hello", dimension=110) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0056 begin`);
      const actual: string = wantJsonOf('Hello', 110);
      logInfo(`wantJsonOf(formName="Hello", dimension=110): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=110): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=110): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0056 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0057
     * @tc.name      RequestAddForm_WantJsonOf_0057
     * @tc.desc      wantJsonOf(formName="Hello", dimension=115) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0057 begin`);
      const actual: string = wantJsonOf('Hello', 115);
      logInfo(`wantJsonOf(formName="Hello", dimension=115): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=115): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=115): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0057 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0058
     * @tc.name      RequestAddForm_WantJsonOf_0058
     * @tc.desc      wantJsonOf(formName="Hello", dimension=120) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0058 begin`);
      const actual: string = wantJsonOf('Hello', 120);
      logInfo(`wantJsonOf(formName="Hello", dimension=120): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=120): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=120): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0058 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0059
     * @tc.name      RequestAddForm_WantJsonOf_0059
     * @tc.desc      wantJsonOf(formName="Hello", dimension=125) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0059 begin`);
      const actual: string = wantJsonOf('Hello', 125);
      logInfo(`wantJsonOf(formName="Hello", dimension=125): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=125): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=125): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0059 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0060
     * @tc.name      RequestAddForm_WantJsonOf_0060
     * @tc.desc      wantJsonOf(formName="Hello", dimension=130) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0060 begin`);
      const actual: string = wantJsonOf('Hello', 130);
      logInfo(`wantJsonOf(formName="Hello", dimension=130): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=130): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=130): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0060 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0061
     * @tc.name      RequestAddForm_WantJsonOf_0061
     * @tc.desc      wantJsonOf(formName="Hello", dimension=135) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0061 begin`);
      const actual: string = wantJsonOf('Hello', 135);
      logInfo(`wantJsonOf(formName="Hello", dimension=135): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=135): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=135): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0061 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0062
     * @tc.name      RequestAddForm_WantJsonOf_0062
     * @tc.desc      wantJsonOf(formName="Hello", dimension=140) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0062 begin`);
      const actual: string = wantJsonOf('Hello', 140);
      logInfo(`wantJsonOf(formName="Hello", dimension=140): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=140): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=140): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0062 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0063
     * @tc.name      RequestAddForm_WantJsonOf_0063
     * @tc.desc      wantJsonOf(formName="Hello", dimension=145) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0063 begin`);
      const actual: string = wantJsonOf('Hello', 145);
      logInfo(`wantJsonOf(formName="Hello", dimension=145): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=145): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=145): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0063 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0064
     * @tc.name      RequestAddForm_WantJsonOf_0064
     * @tc.desc      wantJsonOf(formName="Hello", dimension=150) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0064 begin`);
      const actual: string = wantJsonOf('Hello', 150);
      logInfo(`wantJsonOf(formName="Hello", dimension=150): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=150): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=150): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0064 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0065
     * @tc.name      RequestAddForm_WantJsonOf_0065
     * @tc.desc      wantJsonOf(formName="Hello", dimension=155) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0065 begin`);
      const actual: string = wantJsonOf('Hello', 155);
      logInfo(`wantJsonOf(formName="Hello", dimension=155): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=155): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=155): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0065 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0066
     * @tc.name      RequestAddForm_WantJsonOf_0066
     * @tc.desc      wantJsonOf(formName="Hello", dimension=160) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0066 begin`);
      const actual: string = wantJsonOf('Hello', 160);
      logInfo(`wantJsonOf(formName="Hello", dimension=160): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=160): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=160): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0066 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0067
     * @tc.name      RequestAddForm_WantJsonOf_0067
     * @tc.desc      wantJsonOf(formName="Hello", dimension=165) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0067 begin`);
      const actual: string = wantJsonOf('Hello', 165);
      logInfo(`wantJsonOf(formName="Hello", dimension=165): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=165): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=165): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0067 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0068
     * @tc.name      RequestAddForm_WantJsonOf_0068
     * @tc.desc      wantJsonOf(formName="Hello", dimension=170) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0068 begin`);
      const actual: string = wantJsonOf('Hello', 170);
      logInfo(`wantJsonOf(formName="Hello", dimension=170): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=170): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=170): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0068 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0069
     * @tc.name      RequestAddForm_WantJsonOf_0069
     * @tc.desc      wantJsonOf(formName="Hello", dimension=175) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0069 begin`);
      const actual: string = wantJsonOf('Hello', 175);
      logInfo(`wantJsonOf(formName="Hello", dimension=175): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=175): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=175): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0069 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0070
     * @tc.name      RequestAddForm_WantJsonOf_0070
     * @tc.desc      wantJsonOf(formName="Hello", dimension=180) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0070 begin`);
      const actual: string = wantJsonOf('Hello', 180);
      logInfo(`wantJsonOf(formName="Hello", dimension=180): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=180): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=180): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0070 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0071
     * @tc.name      RequestAddForm_WantJsonOf_0071
     * @tc.desc      wantJsonOf(formName="Hello", dimension=185) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0071 begin`);
      const actual: string = wantJsonOf('Hello', 185);
      logInfo(`wantJsonOf(formName="Hello", dimension=185): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=185): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=185): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0071 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0072
     * @tc.name      RequestAddForm_WantJsonOf_0072
     * @tc.desc      wantJsonOf(formName="Hello", dimension=190) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0072 begin`);
      const actual: string = wantJsonOf('Hello', 190);
      logInfo(`wantJsonOf(formName="Hello", dimension=190): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=190): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=190): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0072 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0073
     * @tc.name      RequestAddForm_WantJsonOf_0073
     * @tc.desc      wantJsonOf(formName="Hello", dimension=195) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0073 begin`);
      const actual: string = wantJsonOf('Hello', 195);
      logInfo(`wantJsonOf(formName="Hello", dimension=195): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=195): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=195): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0073 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0074
     * @tc.name      RequestAddForm_WantJsonOf_0074
     * @tc.desc      wantJsonOf(formName="Hello", dimension=200) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0074 begin`);
      const actual: string = wantJsonOf('Hello', 200);
      logInfo(`wantJsonOf(formName="Hello", dimension=200): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=200): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=200): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0074 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0075
     * @tc.name      RequestAddForm_WantJsonOf_0075
     * @tc.desc      wantJsonOf(formName="Hello", dimension=186) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0075 begin`);
      const actual: string = wantJsonOf('Hello', 186);
      logInfo(`wantJsonOf(formName="Hello", dimension=186): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=186): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=186): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0075 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0076
     * @tc.name      RequestAddForm_WantJsonOf_0076
     * @tc.desc      wantJsonOf(formName="Hello", dimension=158) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0076 begin`);
      const actual: string = wantJsonOf('Hello', 158);
      logInfo(`wantJsonOf(formName="Hello", dimension=158): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`wantJsonOf(formName="Hello", dimension=158): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=158): actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0076 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANT_JSON_OF_0077
     * @tc.name      RequestAddForm_WantJsonOf_0077
     * @tc.desc      wantJsonOf(formName="Hello", dimension=99.4) returns "param.key.module_name?":?"entry?"}}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_WantJsonOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WantJsonOf_0077 begin`);
      const actual: string = wantJsonOf('Hello', 99.4);
      logInfo(`wantJsonOf(formName="Hello", dimension=99.4): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(176);
      logInfo(`wantJsonOf(formName="Hello", dimension=99.4): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"abilityName":"EntryFormAbility');
      logInfo(`wantJsonOf(formName="Hello", dimension=99.4): actual.substring(144)=${actual.substring(144)}`);
      expect(actual.substring(144)).assertEqual('param.key.module_name":"entry"}}');
      logInfo(`${BUNDLE}WantJsonOf_0077 end`);
    });
  });
}
