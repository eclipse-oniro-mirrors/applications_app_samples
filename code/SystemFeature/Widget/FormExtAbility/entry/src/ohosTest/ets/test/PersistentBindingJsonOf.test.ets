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
import { persistentBindingJsonOf } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for persistentBindingJsonOf (77 cases). */
export default function persistentBindingJsonOfTest(): void {
  describe('PersistentBindingJsonOfTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0001
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0001
     * @tc.desc      persistentBindingJsonOf(subscriberId="") returns "ility/test?",?"subscriberId?":?"?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_PersistentBindingJsonOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0001 begin`);
      const actual: string = persistentBindingJsonOf('');
      logInfo(`persistentBindingJsonOf(subscriberId=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(103);
      logInfo(`persistentBindingJsonOf(subscriberId=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId=""): actual.substring(71)=${actual.substring(71)}`);
      expect(actual.substring(71)).assertEqual('ility/test","subscriberId":""}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0002
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0002
     * @tc.desc      persistentBindingJsonOf(subscriberId="a") returns "lity/test?",?"subscriberId?":?"a?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_PersistentBindingJsonOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0002 begin`);
      const actual: string = persistentBindingJsonOf('a');
      logInfo(`persistentBindingJsonOf(subscriberId="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(104);
      logInfo(`persistentBindingJsonOf(subscriberId="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="a"): actual.substring(72)=${actual.substring(72)}`);
      expect(actual.substring(72)).assertEqual('lity/test","subscriberId":"a"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0003
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0003
     * @tc.desc      persistentBindingJsonOf(subscriberId="abc") returns "ty/test?",?"subscriberId?":?"abc?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0003 begin`);
      const actual: string = persistentBindingJsonOf('abc');
      logInfo(`persistentBindingJsonOf(subscriberId="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(106);
      logInfo(`persistentBindingJsonOf(subscriberId="abc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="abc"): actual.substring(74)=${actual.substring(74)}`);
      expect(actual.substring(74)).assertEqual('ty/test","subscriberId":"abc"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0004
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0004
     * @tc.desc      persistentBindingJsonOf(subscriberId="Hello World") returns ",?"subscriberId?":?"Hello World?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0004 begin`);
      const actual: string = persistentBindingJsonOf('Hello World');
      logInfo(`persistentBindingJsonOf(subscriberId="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(114);
      logInfo(`persistentBindingJsonOf(subscriberId="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="Hel...: actual.substring(82)=${actual.substring(82)}`);
      expect(actual.substring(82)).assertEqual(',"subscriberId":"Hello World"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0005
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0005
     * @tc.desc      persistentBindingJsonOf(subscriberId=" ") returns "lity/test?",?"subscriberId?":?" ?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0005 begin`);
      const actual: string = persistentBindingJsonOf(' ');
      logInfo(`persistentBindingJsonOf(subscriberId=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(104);
      logInfo(`persistentBindingJsonOf(subscriberId=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId=" "): actual.substring(72)=${actual.substring(72)}`);
      expect(actual.substring(72)).assertEqual('lity/test","subscriberId":" "}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0006
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0006
     * @tc.desc      persistentBindingJsonOf(subscriberId="123") returns "ty/test?",?"subscriberId?":?"123?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0006 begin`);
      const actual: string = persistentBindingJsonOf('123');
      logInfo(`persistentBindingJsonOf(subscriberId="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(106);
      logInfo(`persistentBindingJsonOf(subscriberId="123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="123"): actual.substring(74)=${actual.substring(74)}`);
      expect(actual.substring(74)).assertEqual('ty/test","subscriberId":"123"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0007
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0007
     * @tc.desc      persistentBindingJsonOf(subscriberId=" a ") returns "ty/test?",?"subscriberId?":?" a ?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistentBindingJsonOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0007 begin`);
      const actual: string = persistentBindingJsonOf(' a ');
      logInfo(`persistentBindingJsonOf(subscriberId=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(106);
      logInfo(`persistentBindingJsonOf(subscriberId=" a "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId=" a "): actual.substring(74)=${actual.substring(74)}`);
      expect(actual.substring(74)).assertEqual('ty/test","subscriberId":" a "}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0008
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0008
     * @tc.desc      persistentBindingJsonOf(subscriberId="aa") returns "ity/test?",?"subscriberId?":?"aa?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0008 begin`);
      const actual: string = persistentBindingJsonOf('aa');
      logInfo(`persistentBindingJsonOf(subscriberId="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(105);
      logInfo(`persistentBindingJsonOf(subscriberId="aa"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="aa"): actual.substring(73)=${actual.substring(73)}`);
      expect(actual.substring(73)).assertEqual('ity/test","subscriberId":"aa"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0009
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0009
     * @tc.desc      persistentBindingJsonOf(subscriberId="a_1") returns "ty/test?",?"subscriberId?":?"a_1?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0009 begin`);
      const actual: string = persistentBindingJsonOf('a_1');
      logInfo(`persistentBindingJsonOf(subscriberId="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(106);
      logInfo(`persistentBindingJsonOf(subscriberId="a_1"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="a_1"): actual.substring(74)=${actual.substring(74)}`);
      expect(actual.substring(74)).assertEqual('ty/test","subscriberId":"a_1"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0010
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0010
     * @tc.desc      persistentBindingJsonOf(subscriberId="xa") returns "ity/test?",?"subscriberId?":?"xa?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistentBindingJsonOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0010 begin`);
      const actual: string = persistentBindingJsonOf('xa');
      logInfo(`persistentBindingJsonOf(subscriberId="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(105);
      logInfo(`persistentBindingJsonOf(subscriberId="xa"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="xa"): actual.substring(73)=${actual.substring(73)}`);
      expect(actual.substring(73)).assertEqual('ity/test","subscriberId":"xa"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0011
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0011
     * @tc.desc      persistentBindingJsonOf(subscriberId=" abc ") returns "/test?",?"subscriberId?":?" abc ?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistentBindingJsonOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0011 begin`);
      const actual: string = persistentBindingJsonOf(' abc ');
      logInfo(`persistentBindingJsonOf(subscriberId=" ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(108);
      logInfo(`persistentBindingJsonOf(subscriberId=" ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId=" ab...: actual.substring(76)=${actual.substring(76)}`);
      expect(actual.substring(76)).assertEqual('/test","subscriberId":" abc "}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0012
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0012
     * @tc.desc      persistentBindingJsonOf(subscriberId="abcabc") returns "test?",?"subscriberId?":?"abcabc?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0012 begin`);
      const actual: string = persistentBindingJsonOf('abcabc');
      logInfo(`persistentBindingJsonOf(subscriberId="abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(109);
      logInfo(`persistentBindingJsonOf(subscriberId="abc...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="abc...: actual.substring(77)=${actual.substring(77)}`);
      expect(actual.substring(77)).assertEqual('test","subscriberId":"abcabc"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0013
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0013
     * @tc.desc      persistentBindingJsonOf(subscriberId="abc_1") returns "/test?",?"subscriberId?":?"abc_1?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0013 begin`);
      const actual: string = persistentBindingJsonOf('abc_1');
      logInfo(`persistentBindingJsonOf(subscriberId="abc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(108);
      logInfo(`persistentBindingJsonOf(subscriberId="abc...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="abc...: actual.substring(76)=${actual.substring(76)}`);
      expect(actual.substring(76)).assertEqual('/test","subscriberId":"abc_1"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0014
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0014
     * @tc.desc      persistentBindingJsonOf(subscriberId="xabc") returns "y/test?",?"subscriberId?":?"xabc?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistentBindingJsonOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0014 begin`);
      const actual: string = persistentBindingJsonOf('xabc');
      logInfo(`persistentBindingJsonOf(subscriberId="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(107);
      logInfo(`persistentBindingJsonOf(subscriberId="xabc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="xabc"): actual.substring(75)=${actual.substring(75)}`);
      expect(actual.substring(75)).assertEqual('y/test","subscriberId":"xabc"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0015
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0015
     * @tc.desc      persistentBindingJsonOf(subscriberId=" Hello World ") returns "subscriberId?":?" Hello World ?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistentBindingJsonOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0015 begin`);
      const actual: string = persistentBindingJsonOf(' Hello World ');
      logInfo(`persistentBindingJsonOf(subscriberId=" He...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(116);
      logInfo(`persistentBindingJsonOf(subscriberId=" He...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId=" He...: actual.substring(84)=${actual.substring(84)}`);
      expect(actual.substring(84)).assertEqual('subscriberId":" Hello World "}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0016
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0016
     * @tc.desc      persistentBindingJsonOf(subscriberId="Hello WorldHello World") returns "rId?":?"Hello WorldHello...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0016 begin`);
      const actual: string = persistentBindingJsonOf('Hello WorldHello World');
      logInfo(`persistentBindingJsonOf(subscriberId="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(125);
      logInfo(`persistentBindingJsonOf(subscriberId="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="Hel...: actual.substring(93)=${actual.substring(93)}`);
      expect(actual.substring(93)).assertEqual('rId":"Hello WorldHello World"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0017
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0017
     * @tc.desc      persistentBindingJsonOf(subscriberId="Hello World_1") returns "subscriberId?":?"Hello World_1?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0017 begin`);
      const actual: string = persistentBindingJsonOf('Hello World_1');
      logInfo(`persistentBindingJsonOf(subscriberId="Hel...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(116);
      logInfo(`persistentBindingJsonOf(subscriberId="Hel...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="Hel...: actual.substring(84)=${actual.substring(84)}`);
      expect(actual.substring(84)).assertEqual('subscriberId":"Hello World_1"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0018
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0018
     * @tc.desc      persistentBindingJsonOf(subscriberId="xHello World") returns "?"subscriberId?":?"xHello World?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistentBindingJsonOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0018 begin`);
      const actual: string = persistentBindingJsonOf('xHello World');
      logInfo(`persistentBindingJsonOf(subscriberId="xHe...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(115);
      logInfo(`persistentBindingJsonOf(subscriberId="xHe...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="xHe...: actual.substring(83)=${actual.substring(83)}`);
      expect(actual.substring(83)).assertEqual('"subscriberId":"xHello World"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0019
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0019
     * @tc.desc      persistentBindingJsonOf(subscriberId="   ") returns "ty/test?",?"subscriberId?":?"   ?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistentBindingJsonOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0019 begin`);
      const actual: string = persistentBindingJsonOf('   ');
      logInfo(`persistentBindingJsonOf(subscriberId="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(106);
      logInfo(`persistentBindingJsonOf(subscriberId="   "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="   "): actual.substring(74)=${actual.substring(74)}`);
      expect(actual.substring(74)).assertEqual('ty/test","subscriberId":"   "}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0020
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0020
     * @tc.desc      persistentBindingJsonOf(subscriberId="  ") returns "ity/test?",?"subscriberId?":?"  ?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0020 begin`);
      const actual: string = persistentBindingJsonOf('  ');
      logInfo(`persistentBindingJsonOf(subscriberId="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(105);
      logInfo(`persistentBindingJsonOf(subscriberId="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="  "): actual.substring(73)=${actual.substring(73)}`);
      expect(actual.substring(73)).assertEqual('ity/test","subscriberId":"  "}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0021
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0021
     * @tc.desc      persistentBindingJsonOf(subscriberId=" _1") returns "ty/test?",?"subscriberId?":?" _1?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0021 begin`);
      const actual: string = persistentBindingJsonOf(' _1');
      logInfo(`persistentBindingJsonOf(subscriberId=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(106);
      logInfo(`persistentBindingJsonOf(subscriberId=" _1"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId=" _1"): actual.substring(74)=${actual.substring(74)}`);
      expect(actual.substring(74)).assertEqual('ty/test","subscriberId":" _1"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0022
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0022
     * @tc.desc      persistentBindingJsonOf(subscriberId="x ") returns "ity/test?",?"subscriberId?":?"x ?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistentBindingJsonOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0022 begin`);
      const actual: string = persistentBindingJsonOf('x ');
      logInfo(`persistentBindingJsonOf(subscriberId="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(105);
      logInfo(`persistentBindingJsonOf(subscriberId="x "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="x "): actual.substring(73)=${actual.substring(73)}`);
      expect(actual.substring(73)).assertEqual('ity/test","subscriberId":"x "}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0023
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0023
     * @tc.desc      persistentBindingJsonOf(subscriberId=" 123 ") returns "/test?",?"subscriberId?":?" 123 ?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistentBindingJsonOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0023 begin`);
      const actual: string = persistentBindingJsonOf(' 123 ');
      logInfo(`persistentBindingJsonOf(subscriberId=" 12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(108);
      logInfo(`persistentBindingJsonOf(subscriberId=" 12...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId=" 12...: actual.substring(76)=${actual.substring(76)}`);
      expect(actual.substring(76)).assertEqual('/test","subscriberId":" 123 "}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0024
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0024
     * @tc.desc      persistentBindingJsonOf(subscriberId="123123") returns "test?",?"subscriberId?":?"123123?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0024 begin`);
      const actual: string = persistentBindingJsonOf('123123');
      logInfo(`persistentBindingJsonOf(subscriberId="123...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(109);
      logInfo(`persistentBindingJsonOf(subscriberId="123...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="123...: actual.substring(77)=${actual.substring(77)}`);
      expect(actual.substring(77)).assertEqual('test","subscriberId":"123123"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0025
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0025
     * @tc.desc      persistentBindingJsonOf(subscriberId="123_1") returns "/test?",?"subscriberId?":?"123_1?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0025 begin`);
      const actual: string = persistentBindingJsonOf('123_1');
      logInfo(`persistentBindingJsonOf(subscriberId="123...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(108);
      logInfo(`persistentBindingJsonOf(subscriberId="123...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="123...: actual.substring(76)=${actual.substring(76)}`);
      expect(actual.substring(76)).assertEqual('/test","subscriberId":"123_1"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0026
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0026
     * @tc.desc      persistentBindingJsonOf(subscriberId="x123") returns "y/test?",?"subscriberId?":?"x123?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PersistentBindingJsonOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0026 begin`);
      const actual: string = persistentBindingJsonOf('x123');
      logInfo(`persistentBindingJsonOf(subscriberId="x123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(107);
      logInfo(`persistentBindingJsonOf(subscriberId="x123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="x123"): actual.substring(75)=${actual.substring(75)}`);
      expect(actual.substring(75)).assertEqual('y/test","subscriberId":"x123"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0027
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0027
     * @tc.desc      persistentBindingJsonOf(subscriberId="la") returns "ity/test?",?"subscriberId?":?"la?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0027 begin`);
      const actual: string = persistentBindingJsonOf('la');
      logInfo(`persistentBindingJsonOf(subscriberId="la"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(105);
      logInfo(`persistentBindingJsonOf(subscriberId="la"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="la"): actual.substring(73)=${actual.substring(73)}`);
      expect(actual.substring(73)).assertEqual('ity/test","subscriberId":"la"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0028
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0028
     * @tc.desc      persistentBindingJsonOf(subscriberId="VODvJKfC") returns "st?",?"subscriberId?":?"VODvJKfC?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0028 begin`);
      const actual: string = persistentBindingJsonOf('VODvJKfC');
      logInfo(`persistentBindingJsonOf(subscriberId="VOD...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(111);
      logInfo(`persistentBindingJsonOf(subscriberId="VOD...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="VOD...: actual.substring(79)=${actual.substring(79)}`);
      expect(actual.substring(79)).assertEqual('st","subscriberId":"VODvJKfC"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0029
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0029
     * @tc.desc      persistentBindingJsonOf(subscriberId="Qv") returns "ity/test?",?"subscriberId?":?"Qv?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0029 begin`);
      const actual: string = persistentBindingJsonOf('Qv');
      logInfo(`persistentBindingJsonOf(subscriberId="Qv"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(105);
      logInfo(`persistentBindingJsonOf(subscriberId="Qv"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="Qv"): actual.substring(73)=${actual.substring(73)}`);
      expect(actual.substring(73)).assertEqual('ity/test","subscriberId":"Qv"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0030
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0030
     * @tc.desc      persistentBindingJsonOf(subscriberId="Q4GK51LQ") returns "st?",?"subscriberId?":?"Q4GK51LQ?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0030 begin`);
      const actual: string = persistentBindingJsonOf('Q4GK51LQ');
      logInfo(`persistentBindingJsonOf(subscriberId="Q4G...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(111);
      logInfo(`persistentBindingJsonOf(subscriberId="Q4G...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="Q4G...: actual.substring(79)=${actual.substring(79)}`);
      expect(actual.substring(79)).assertEqual('st","subscriberId":"Q4GK51LQ"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0031
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0031
     * @tc.desc      persistentBindingJsonOf(subscriberId="faFKgUAKpUy") returns ",?"subscriberId?":?"faFKgUAKpUy?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0031 begin`);
      const actual: string = persistentBindingJsonOf('faFKgUAKpUy');
      logInfo(`persistentBindingJsonOf(subscriberId="faF...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(114);
      logInfo(`persistentBindingJsonOf(subscriberId="faF...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="faF...: actual.substring(82)=${actual.substring(82)}`);
      expect(actual.substring(82)).assertEqual(',"subscriberId":"faFKgUAKpUy"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0032
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0032
     * @tc.desc      persistentBindingJsonOf(subscriberId="N5plX0RU") returns "st?",?"subscriberId?":?"N5plX0RU?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0032 begin`);
      const actual: string = persistentBindingJsonOf('N5plX0RU');
      logInfo(`persistentBindingJsonOf(subscriberId="N5p...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(111);
      logInfo(`persistentBindingJsonOf(subscriberId="N5p...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="N5p...: actual.substring(79)=${actual.substring(79)}`);
      expect(actual.substring(79)).assertEqual('st","subscriberId":"N5plX0RU"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0033
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0033
     * @tc.desc      persistentBindingJsonOf(subscriberId="J6foFYo1") returns "st?",?"subscriberId?":?"J6foFYo1?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0033 begin`);
      const actual: string = persistentBindingJsonOf('J6foFYo1');
      logInfo(`persistentBindingJsonOf(subscriberId="J6f...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(111);
      logInfo(`persistentBindingJsonOf(subscriberId="J6f...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="J6f...: actual.substring(79)=${actual.substring(79)}`);
      expect(actual.substring(79)).assertEqual('st","subscriberId":"J6foFYo1"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0034
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0034
     * @tc.desc      persistentBindingJsonOf(subscriberId="gjhZqPTPESp") returns ",?"subscriberId?":?"gjhZqPTPESp?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0034 begin`);
      const actual: string = persistentBindingJsonOf('gjhZqPTPESp');
      logInfo(`persistentBindingJsonOf(subscriberId="gjh...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(114);
      logInfo(`persistentBindingJsonOf(subscriberId="gjh...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="gjh...: actual.substring(82)=${actual.substring(82)}`);
      expect(actual.substring(82)).assertEqual(',"subscriberId":"gjhZqPTPESp"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0035
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0035
     * @tc.desc      persistentBindingJsonOf(subscriberId="7ShipLWfa") returns "t?",?"subscriberId?":?"7ShipLWfa?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0035 begin`);
      const actual: string = persistentBindingJsonOf('7ShipLWfa');
      logInfo(`persistentBindingJsonOf(subscriberId="7Sh...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(112);
      logInfo(`persistentBindingJsonOf(subscriberId="7Sh...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="7Sh...: actual.substring(80)=${actual.substring(80)}`);
      expect(actual.substring(80)).assertEqual('t","subscriberId":"7ShipLWfa"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0036
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0036
     * @tc.desc      persistentBindingJsonOf(subscriberId="GyyxHvqJ9gfd") returns "?"subscriberId?":?"GyyxHvqJ9gfd?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0036 begin`);
      const actual: string = persistentBindingJsonOf('GyyxHvqJ9gfd');
      logInfo(`persistentBindingJsonOf(subscriberId="Gyy...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(115);
      logInfo(`persistentBindingJsonOf(subscriberId="Gyy...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="Gyy...: actual.substring(83)=${actual.substring(83)}`);
      expect(actual.substring(83)).assertEqual('"subscriberId":"GyyxHvqJ9gfd"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0037
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0037
     * @tc.desc      persistentBindingJsonOf(subscriberId="q") returns "lity/test?",?"subscriberId?":?"q?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0037 begin`);
      const actual: string = persistentBindingJsonOf('q');
      logInfo(`persistentBindingJsonOf(subscriberId="q"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(104);
      logInfo(`persistentBindingJsonOf(subscriberId="q"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="q"): actual.substring(72)=${actual.substring(72)}`);
      expect(actual.substring(72)).assertEqual('lity/test","subscriberId":"q"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0038
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0038
     * @tc.desc      persistentBindingJsonOf(subscriberId="V") returns "lity/test?",?"subscriberId?":?"V?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0038 begin`);
      const actual: string = persistentBindingJsonOf('V');
      logInfo(`persistentBindingJsonOf(subscriberId="V"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(104);
      logInfo(`persistentBindingJsonOf(subscriberId="V"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="V"): actual.substring(72)=${actual.substring(72)}`);
      expect(actual.substring(72)).assertEqual('lity/test","subscriberId":"V"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0039
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0039
     * @tc.desc      persistentBindingJsonOf(subscriberId="YhVQIQw9ecE") returns ",?"subscriberId?":?"YhVQIQw9ecE?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0039 begin`);
      const actual: string = persistentBindingJsonOf('YhVQIQw9ecE');
      logInfo(`persistentBindingJsonOf(subscriberId="YhV...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(114);
      logInfo(`persistentBindingJsonOf(subscriberId="YhV...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="YhV...: actual.substring(82)=${actual.substring(82)}`);
      expect(actual.substring(82)).assertEqual(',"subscriberId":"YhVQIQw9ecE"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0040
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0040
     * @tc.desc      persistentBindingJsonOf(subscriberId="8kFMvNd") returns "est?",?"subscriberId?":?"8kFMvNd?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0040 begin`);
      const actual: string = persistentBindingJsonOf('8kFMvNd');
      logInfo(`persistentBindingJsonOf(subscriberId="8kF...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(110);
      logInfo(`persistentBindingJsonOf(subscriberId="8kF...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="8kF...: actual.substring(78)=${actual.substring(78)}`);
      expect(actual.substring(78)).assertEqual('est","subscriberId":"8kFMvNd"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0041
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0041
     * @tc.desc      persistentBindingJsonOf(subscriberId="N") returns "lity/test?",?"subscriberId?":?"N?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0041 begin`);
      const actual: string = persistentBindingJsonOf('N');
      logInfo(`persistentBindingJsonOf(subscriberId="N"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(104);
      logInfo(`persistentBindingJsonOf(subscriberId="N"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="N"): actual.substring(72)=${actual.substring(72)}`);
      expect(actual.substring(72)).assertEqual('lity/test","subscriberId":"N"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0042
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0042
     * @tc.desc      persistentBindingJsonOf(subscriberId="lpqpnlNDfeQW") returns "?"subscriberId?":?"lpqpnlNDfeQW?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0042 begin`);
      const actual: string = persistentBindingJsonOf('lpqpnlNDfeQW');
      logInfo(`persistentBindingJsonOf(subscriberId="lpq...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(115);
      logInfo(`persistentBindingJsonOf(subscriberId="lpq...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="lpq...: actual.substring(83)=${actual.substring(83)}`);
      expect(actual.substring(83)).assertEqual('"subscriberId":"lpqpnlNDfeQW"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0043
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0043
     * @tc.desc      persistentBindingJsonOf(subscriberId="Ik") returns "ity/test?",?"subscriberId?":?"Ik?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0043 begin`);
      const actual: string = persistentBindingJsonOf('Ik');
      logInfo(`persistentBindingJsonOf(subscriberId="Ik"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(105);
      logInfo(`persistentBindingJsonOf(subscriberId="Ik"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="Ik"): actual.substring(73)=${actual.substring(73)}`);
      expect(actual.substring(73)).assertEqual('ity/test","subscriberId":"Ik"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0044
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0044
     * @tc.desc      persistentBindingJsonOf(subscriberId="NPanIwfs") returns "st?",?"subscriberId?":?"NPanIwfs?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0044 begin`);
      const actual: string = persistentBindingJsonOf('NPanIwfs');
      logInfo(`persistentBindingJsonOf(subscriberId="NPa...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(111);
      logInfo(`persistentBindingJsonOf(subscriberId="NPa...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="NPa...: actual.substring(79)=${actual.substring(79)}`);
      expect(actual.substring(79)).assertEqual('st","subscriberId":"NPanIwfs"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0045
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0045
     * @tc.desc      persistentBindingJsonOf(subscriberId="wyidd4xxm") returns "t?",?"subscriberId?":?"wyidd4xxm?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0045 begin`);
      const actual: string = persistentBindingJsonOf('wyidd4xxm');
      logInfo(`persistentBindingJsonOf(subscriberId="wyi...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(112);
      logInfo(`persistentBindingJsonOf(subscriberId="wyi...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="wyi...: actual.substring(80)=${actual.substring(80)}`);
      expect(actual.substring(80)).assertEqual('t","subscriberId":"wyidd4xxm"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0046
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0046
     * @tc.desc      persistentBindingJsonOf(subscriberId="g9mIbzykbSP") returns ",?"subscriberId?":?"g9mIbzykbSP?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0046 begin`);
      const actual: string = persistentBindingJsonOf('g9mIbzykbSP');
      logInfo(`persistentBindingJsonOf(subscriberId="g9m...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(114);
      logInfo(`persistentBindingJsonOf(subscriberId="g9m...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="g9m...: actual.substring(82)=${actual.substring(82)}`);
      expect(actual.substring(82)).assertEqual(',"subscriberId":"g9mIbzykbSP"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0047
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0047
     * @tc.desc      persistentBindingJsonOf(subscriberId="zNEuYAnQu") returns "t?",?"subscriberId?":?"zNEuYAnQu?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0047 begin`);
      const actual: string = persistentBindingJsonOf('zNEuYAnQu');
      logInfo(`persistentBindingJsonOf(subscriberId="zNE...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(112);
      logInfo(`persistentBindingJsonOf(subscriberId="zNE...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="zNE...: actual.substring(80)=${actual.substring(80)}`);
      expect(actual.substring(80)).assertEqual('t","subscriberId":"zNEuYAnQu"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0048
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0048
     * @tc.desc      persistentBindingJsonOf(subscriberId="2") returns "lity/test?",?"subscriberId?":?"2?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0048 begin`);
      const actual: string = persistentBindingJsonOf('2');
      logInfo(`persistentBindingJsonOf(subscriberId="2"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(104);
      logInfo(`persistentBindingJsonOf(subscriberId="2"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="2"): actual.substring(72)=${actual.substring(72)}`);
      expect(actual.substring(72)).assertEqual('lity/test","subscriberId":"2"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0049
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0049
     * @tc.desc      persistentBindingJsonOf(subscriberId="OJ99B") returns "/test?",?"subscriberId?":?"OJ99B?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0049 begin`);
      const actual: string = persistentBindingJsonOf('OJ99B');
      logInfo(`persistentBindingJsonOf(subscriberId="OJ9...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(108);
      logInfo(`persistentBindingJsonOf(subscriberId="OJ9...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="OJ9...: actual.substring(76)=${actual.substring(76)}`);
      expect(actual.substring(76)).assertEqual('/test","subscriberId":"OJ99B"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0050
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0050
     * @tc.desc      persistentBindingJsonOf(subscriberId="9ZlM") returns "y/test?",?"subscriberId?":?"9ZlM?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0050 begin`);
      const actual: string = persistentBindingJsonOf('9ZlM');
      logInfo(`persistentBindingJsonOf(subscriberId="9ZlM"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(107);
      logInfo(`persistentBindingJsonOf(subscriberId="9ZlM"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="9ZlM"): actual.substring(75)=${actual.substring(75)}`);
      expect(actual.substring(75)).assertEqual('y/test","subscriberId":"9ZlM"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0051
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0051
     * @tc.desc      persistentBindingJsonOf(subscriberId="jamdzo3PTS") returns "?",?"subscriberId?":?"jamdzo3PTS?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0051 begin`);
      const actual: string = persistentBindingJsonOf('jamdzo3PTS');
      logInfo(`persistentBindingJsonOf(subscriberId="jam...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(113);
      logInfo(`persistentBindingJsonOf(subscriberId="jam...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="jam...: actual.substring(81)=${actual.substring(81)}`);
      expect(actual.substring(81)).assertEqual('","subscriberId":"jamdzo3PTS"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0052
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0052
     * @tc.desc      persistentBindingJsonOf(subscriberId="ZwTWF") returns "/test?",?"subscriberId?":?"ZwTWF?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0052 begin`);
      const actual: string = persistentBindingJsonOf('ZwTWF');
      logInfo(`persistentBindingJsonOf(subscriberId="ZwT...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(108);
      logInfo(`persistentBindingJsonOf(subscriberId="ZwT...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="ZwT...: actual.substring(76)=${actual.substring(76)}`);
      expect(actual.substring(76)).assertEqual('/test","subscriberId":"ZwTWF"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0053
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0053
     * @tc.desc      persistentBindingJsonOf(subscriberId="Ac79P8") returns "test?",?"subscriberId?":?"Ac79P8?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0053 begin`);
      const actual: string = persistentBindingJsonOf('Ac79P8');
      logInfo(`persistentBindingJsonOf(subscriberId="Ac7...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(109);
      logInfo(`persistentBindingJsonOf(subscriberId="Ac7...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="Ac7...: actual.substring(77)=${actual.substring(77)}`);
      expect(actual.substring(77)).assertEqual('test","subscriberId":"Ac79P8"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0054
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0054
     * @tc.desc      persistentBindingJsonOf(subscriberId="n") returns "lity/test?",?"subscriberId?":?"n?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0054 begin`);
      const actual: string = persistentBindingJsonOf('n');
      logInfo(`persistentBindingJsonOf(subscriberId="n"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(104);
      logInfo(`persistentBindingJsonOf(subscriberId="n"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="n"): actual.substring(72)=${actual.substring(72)}`);
      expect(actual.substring(72)).assertEqual('lity/test","subscriberId":"n"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0055
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0055
     * @tc.desc      persistentBindingJsonOf(subscriberId="1lGX4RFa") returns "st?",?"subscriberId?":?"1lGX4RFa?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0055 begin`);
      const actual: string = persistentBindingJsonOf('1lGX4RFa');
      logInfo(`persistentBindingJsonOf(subscriberId="1lG...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(111);
      logInfo(`persistentBindingJsonOf(subscriberId="1lG...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="1lG...: actual.substring(79)=${actual.substring(79)}`);
      expect(actual.substring(79)).assertEqual('st","subscriberId":"1lGX4RFa"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0056
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0056
     * @tc.desc      persistentBindingJsonOf(subscriberId="qjThTNkAru3W") returns "?"subscriberId?":?"qjThTNkAru3W?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0056 begin`);
      const actual: string = persistentBindingJsonOf('qjThTNkAru3W');
      logInfo(`persistentBindingJsonOf(subscriberId="qjT...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(115);
      logInfo(`persistentBindingJsonOf(subscriberId="qjT...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="qjT...: actual.substring(83)=${actual.substring(83)}`);
      expect(actual.substring(83)).assertEqual('"subscriberId":"qjThTNkAru3W"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0057
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0057
     * @tc.desc      persistentBindingJsonOf(subscriberId="YylI") returns "y/test?",?"subscriberId?":?"YylI?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0057 begin`);
      const actual: string = persistentBindingJsonOf('YylI');
      logInfo(`persistentBindingJsonOf(subscriberId="YylI"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(107);
      logInfo(`persistentBindingJsonOf(subscriberId="YylI"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="YylI"): actual.substring(75)=${actual.substring(75)}`);
      expect(actual.substring(75)).assertEqual('y/test","subscriberId":"YylI"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0058
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0058
     * @tc.desc      persistentBindingJsonOf(subscriberId="NHEH") returns "y/test?",?"subscriberId?":?"NHEH?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0058 begin`);
      const actual: string = persistentBindingJsonOf('NHEH');
      logInfo(`persistentBindingJsonOf(subscriberId="NHEH"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(107);
      logInfo(`persistentBindingJsonOf(subscriberId="NHEH"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="NHEH"): actual.substring(75)=${actual.substring(75)}`);
      expect(actual.substring(75)).assertEqual('y/test","subscriberId":"NHEH"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0059
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0059
     * @tc.desc      persistentBindingJsonOf(subscriberId="S0Rm") returns "y/test?",?"subscriberId?":?"S0Rm?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0059 begin`);
      const actual: string = persistentBindingJsonOf('S0Rm');
      logInfo(`persistentBindingJsonOf(subscriberId="S0Rm"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(107);
      logInfo(`persistentBindingJsonOf(subscriberId="S0Rm"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="S0Rm"): actual.substring(75)=${actual.substring(75)}`);
      expect(actual.substring(75)).assertEqual('y/test","subscriberId":"S0Rm"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0060
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0060
     * @tc.desc      persistentBindingJsonOf(subscriberId="ws") returns "ity/test?",?"subscriberId?":?"ws?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0060 begin`);
      const actual: string = persistentBindingJsonOf('ws');
      logInfo(`persistentBindingJsonOf(subscriberId="ws"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(105);
      logInfo(`persistentBindingJsonOf(subscriberId="ws"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="ws"): actual.substring(73)=${actual.substring(73)}`);
      expect(actual.substring(73)).assertEqual('ity/test","subscriberId":"ws"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0061
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0061
     * @tc.desc      persistentBindingJsonOf(subscriberId="JilV") returns "y/test?",?"subscriberId?":?"JilV?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0061 begin`);
      const actual: string = persistentBindingJsonOf('JilV');
      logInfo(`persistentBindingJsonOf(subscriberId="JilV"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(107);
      logInfo(`persistentBindingJsonOf(subscriberId="JilV"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="JilV"): actual.substring(75)=${actual.substring(75)}`);
      expect(actual.substring(75)).assertEqual('y/test","subscriberId":"JilV"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0062
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0062
     * @tc.desc      persistentBindingJsonOf(subscriberId="FhC") returns "ty/test?",?"subscriberId?":?"FhC?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0062 begin`);
      const actual: string = persistentBindingJsonOf('FhC');
      logInfo(`persistentBindingJsonOf(subscriberId="FhC"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(106);
      logInfo(`persistentBindingJsonOf(subscriberId="FhC"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="FhC"): actual.substring(74)=${actual.substring(74)}`);
      expect(actual.substring(74)).assertEqual('ty/test","subscriberId":"FhC"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0063
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0063
     * @tc.desc      persistentBindingJsonOf(subscriberId="APJwvlbDZOc") returns ",?"subscriberId?":?"APJwvlbDZOc?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0063 begin`);
      const actual: string = persistentBindingJsonOf('APJwvlbDZOc');
      logInfo(`persistentBindingJsonOf(subscriberId="APJ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(114);
      logInfo(`persistentBindingJsonOf(subscriberId="APJ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="APJ...: actual.substring(82)=${actual.substring(82)}`);
      expect(actual.substring(82)).assertEqual(',"subscriberId":"APJwvlbDZOc"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0064
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0064
     * @tc.desc      persistentBindingJsonOf(subscriberId="Ft") returns "ity/test?",?"subscriberId?":?"Ft?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0064 begin`);
      const actual: string = persistentBindingJsonOf('Ft');
      logInfo(`persistentBindingJsonOf(subscriberId="Ft"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(105);
      logInfo(`persistentBindingJsonOf(subscriberId="Ft"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="Ft"): actual.substring(73)=${actual.substring(73)}`);
      expect(actual.substring(73)).assertEqual('ity/test","subscriberId":"Ft"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0065
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0065
     * @tc.desc      persistentBindingJsonOf(subscriberId="dqRGbM") returns "test?",?"subscriberId?":?"dqRGbM?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0065 begin`);
      const actual: string = persistentBindingJsonOf('dqRGbM');
      logInfo(`persistentBindingJsonOf(subscriberId="dqR...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(109);
      logInfo(`persistentBindingJsonOf(subscriberId="dqR...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="dqR...: actual.substring(77)=${actual.substring(77)}`);
      expect(actual.substring(77)).assertEqual('test","subscriberId":"dqRGbM"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0066
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0066
     * @tc.desc      persistentBindingJsonOf(subscriberId="m1vwTeK2Ks") returns "?",?"subscriberId?":?"m1vwTeK2Ks?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0066 begin`);
      const actual: string = persistentBindingJsonOf('m1vwTeK2Ks');
      logInfo(`persistentBindingJsonOf(subscriberId="m1v...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(113);
      logInfo(`persistentBindingJsonOf(subscriberId="m1v...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="m1v...: actual.substring(81)=${actual.substring(81)}`);
      expect(actual.substring(81)).assertEqual('","subscriberId":"m1vwTeK2Ks"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0067
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0067
     * @tc.desc      persistentBindingJsonOf(subscriberId="iDZypJ") returns "test?",?"subscriberId?":?"iDZypJ?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0067 begin`);
      const actual: string = persistentBindingJsonOf('iDZypJ');
      logInfo(`persistentBindingJsonOf(subscriberId="iDZ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(109);
      logInfo(`persistentBindingJsonOf(subscriberId="iDZ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="iDZ...: actual.substring(77)=${actual.substring(77)}`);
      expect(actual.substring(77)).assertEqual('test","subscriberId":"iDZypJ"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0068
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0068
     * @tc.desc      persistentBindingJsonOf(subscriberId="RNfdc5UrHX") returns "?",?"subscriberId?":?"RNfdc5UrHX?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0068 begin`);
      const actual: string = persistentBindingJsonOf('RNfdc5UrHX');
      logInfo(`persistentBindingJsonOf(subscriberId="RNf...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(113);
      logInfo(`persistentBindingJsonOf(subscriberId="RNf...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="RNf...: actual.substring(81)=${actual.substring(81)}`);
      expect(actual.substring(81)).assertEqual('","subscriberId":"RNfdc5UrHX"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0069
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0069
     * @tc.desc      persistentBindingJsonOf(subscriberId="Cn") returns "ity/test?",?"subscriberId?":?"Cn?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0069 begin`);
      const actual: string = persistentBindingJsonOf('Cn');
      logInfo(`persistentBindingJsonOf(subscriberId="Cn"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(105);
      logInfo(`persistentBindingJsonOf(subscriberId="Cn"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="Cn"): actual.substring(73)=${actual.substring(73)}`);
      expect(actual.substring(73)).assertEqual('ity/test","subscriberId":"Cn"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0070
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0070
     * @tc.desc      persistentBindingJsonOf(subscriberId="u") returns "lity/test?",?"subscriberId?":?"u?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0070 begin`);
      const actual: string = persistentBindingJsonOf('u');
      logInfo(`persistentBindingJsonOf(subscriberId="u"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(104);
      logInfo(`persistentBindingJsonOf(subscriberId="u"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="u"): actual.substring(72)=${actual.substring(72)}`);
      expect(actual.substring(72)).assertEqual('lity/test","subscriberId":"u"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0071
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0071
     * @tc.desc      persistentBindingJsonOf(subscriberId="e") returns "lity/test?",?"subscriberId?":?"e?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0071 begin`);
      const actual: string = persistentBindingJsonOf('e');
      logInfo(`persistentBindingJsonOf(subscriberId="e"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(104);
      logInfo(`persistentBindingJsonOf(subscriberId="e"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="e"): actual.substring(72)=${actual.substring(72)}`);
      expect(actual.substring(72)).assertEqual('lity/test","subscriberId":"e"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0072
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0072
     * @tc.desc      persistentBindingJsonOf(subscriberId="cKU") returns "ty/test?",?"subscriberId?":?"cKU?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0072 begin`);
      const actual: string = persistentBindingJsonOf('cKU');
      logInfo(`persistentBindingJsonOf(subscriberId="cKU"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(106);
      logInfo(`persistentBindingJsonOf(subscriberId="cKU"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="cKU"): actual.substring(74)=${actual.substring(74)}`);
      expect(actual.substring(74)).assertEqual('ty/test","subscriberId":"cKU"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0073
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0073
     * @tc.desc      persistentBindingJsonOf(subscriberId="7MGBs790") returns "st?",?"subscriberId?":?"7MGBs790?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0073 begin`);
      const actual: string = persistentBindingJsonOf('7MGBs790');
      logInfo(`persistentBindingJsonOf(subscriberId="7MG...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(111);
      logInfo(`persistentBindingJsonOf(subscriberId="7MG...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="7MG...: actual.substring(79)=${actual.substring(79)}`);
      expect(actual.substring(79)).assertEqual('st","subscriberId":"7MGBs790"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0074
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0074
     * @tc.desc      persistentBindingJsonOf(subscriberId="EBm4UqwWJ") returns "t?",?"subscriberId?":?"EBm4UqwWJ?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0074 begin`);
      const actual: string = persistentBindingJsonOf('EBm4UqwWJ');
      logInfo(`persistentBindingJsonOf(subscriberId="EBm...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(112);
      logInfo(`persistentBindingJsonOf(subscriberId="EBm...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="EBm...: actual.substring(80)=${actual.substring(80)}`);
      expect(actual.substring(80)).assertEqual('t","subscriberId":"EBm4UqwWJ"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0075
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0075
     * @tc.desc      persistentBindingJsonOf(subscriberId="M3RT8fON") returns "st?",?"subscriberId?":?"M3RT8fON?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0075 begin`);
      const actual: string = persistentBindingJsonOf('M3RT8fON');
      logInfo(`persistentBindingJsonOf(subscriberId="M3R...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(111);
      logInfo(`persistentBindingJsonOf(subscriberId="M3R...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="M3R...: actual.substring(79)=${actual.substring(79)}`);
      expect(actual.substring(79)).assertEqual('st","subscriberId":"M3RT8fON"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0076
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0076
     * @tc.desc      persistentBindingJsonOf(subscriberId="knx") returns "ty/test?",?"subscriberId?":?"knx?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0076 begin`);
      const actual: string = persistentBindingJsonOf('knx');
      logInfo(`persistentBindingJsonOf(subscriberId="knx"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(106);
      logInfo(`persistentBindingJsonOf(subscriberId="knx"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="knx"): actual.substring(74)=${actual.substring(74)}`);
      expect(actual.substring(74)).assertEqual('ty/test","subscriberId":"knx"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0077
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0077
     * @tc.desc      persistentBindingJsonOf(subscriberId="lBn3i") returns "/test?",?"subscriberId?":?"lBn3i?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0077 begin`);
      const actual: string = persistentBindingJsonOf('lBn3i');
      logInfo(`persistentBindingJsonOf(subscriberId="lBn...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(108);
      logInfo(`persistentBindingJsonOf(subscriberId="lBn...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="lBn...: actual.substring(76)=${actual.substring(76)}`);
      expect(actual.substring(76)).assertEqual('/test","subscriberId":"lBn3i"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0077 end`);
    });
  });
}
