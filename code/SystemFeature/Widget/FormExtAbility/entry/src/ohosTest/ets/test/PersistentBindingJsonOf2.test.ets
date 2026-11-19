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

/** Logic checks for persistentBindingJsonOf (13 cases). */
export default function persistentBindingJsonOf2Test(): void {
  describe('PersistentBindingJsonOf2Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0078
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0078
     * @tc.desc      persistentBindingJsonOf(subscriberId="KnISI") returns "/test?",?"subscriberId?":?"KnISI?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0078 begin`);
      const actual: string = persistentBindingJsonOf('KnISI');
      logInfo(`persistentBindingJsonOf(subscriberId="KnI...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(108);
      logInfo(`persistentBindingJsonOf(subscriberId="KnI...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="KnI...: actual.substring(76)=${actual.substring(76)}`);
      expect(actual.substring(76)).assertEqual('/test","subscriberId":"KnISI"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0079
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0079
     * @tc.desc      persistentBindingJsonOf(subscriberId="K") returns "lity/test?",?"subscriberId?":?"K?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0079 begin`);
      const actual: string = persistentBindingJsonOf('K');
      logInfo(`persistentBindingJsonOf(subscriberId="K"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(104);
      logInfo(`persistentBindingJsonOf(subscriberId="K"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="K"): actual.substring(72)=${actual.substring(72)}`);
      expect(actual.substring(72)).assertEqual('lity/test","subscriberId":"K"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0080
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0080
     * @tc.desc      persistentBindingJsonOf(subscriberId="Ljrxwj") returns "test?",?"subscriberId?":?"Ljrxwj?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0080 begin`);
      const actual: string = persistentBindingJsonOf('Ljrxwj');
      logInfo(`persistentBindingJsonOf(subscriberId="Ljr...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(109);
      logInfo(`persistentBindingJsonOf(subscriberId="Ljr...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="Ljr...: actual.substring(77)=${actual.substring(77)}`);
      expect(actual.substring(77)).assertEqual('test","subscriberId":"Ljrxwj"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0081
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0081
     * @tc.desc      persistentBindingJsonOf(subscriberId="ZDTZJlxBWQ6d") returns "?"subscriberId?":?"ZDTZJlxBWQ6d?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0081 begin`);
      const actual: string = persistentBindingJsonOf('ZDTZJlxBWQ6d');
      logInfo(`persistentBindingJsonOf(subscriberId="ZDT...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(115);
      logInfo(`persistentBindingJsonOf(subscriberId="ZDT...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="ZDT...: actual.substring(83)=${actual.substring(83)}`);
      expect(actual.substring(83)).assertEqual('"subscriberId":"ZDTZJlxBWQ6d"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0082
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0082
     * @tc.desc      persistentBindingJsonOf(subscriberId="5NcktP") returns "test?",?"subscriberId?":?"5NcktP?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0082 begin`);
      const actual: string = persistentBindingJsonOf('5NcktP');
      logInfo(`persistentBindingJsonOf(subscriberId="5Nc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(109);
      logInfo(`persistentBindingJsonOf(subscriberId="5Nc...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="5Nc...: actual.substring(77)=${actual.substring(77)}`);
      expect(actual.substring(77)).assertEqual('test","subscriberId":"5NcktP"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0083
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0083
     * @tc.desc      persistentBindingJsonOf(subscriberId="LtxNw1n") returns "est?",?"subscriberId?":?"LtxNw1n?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0083 begin`);
      const actual: string = persistentBindingJsonOf('LtxNw1n');
      logInfo(`persistentBindingJsonOf(subscriberId="Ltx...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(110);
      logInfo(`persistentBindingJsonOf(subscriberId="Ltx...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="Ltx...: actual.substring(78)=${actual.substring(78)}`);
      expect(actual.substring(78)).assertEqual('est","subscriberId":"LtxNw1n"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0084
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0084
     * @tc.desc      persistentBindingJsonOf(subscriberId="bu4ISu") returns "test?",?"subscriberId?":?"bu4ISu?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0084 begin`);
      const actual: string = persistentBindingJsonOf('bu4ISu');
      logInfo(`persistentBindingJsonOf(subscriberId="bu4...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(109);
      logInfo(`persistentBindingJsonOf(subscriberId="bu4...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="bu4...: actual.substring(77)=${actual.substring(77)}`);
      expect(actual.substring(77)).assertEqual('test","subscriberId":"bu4ISu"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0085
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0085
     * @tc.desc      persistentBindingJsonOf(subscriberId="h8l8F") returns "/test?",?"subscriberId?":?"h8l8F?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0085 begin`);
      const actual: string = persistentBindingJsonOf('h8l8F');
      logInfo(`persistentBindingJsonOf(subscriberId="h8l...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(108);
      logInfo(`persistentBindingJsonOf(subscriberId="h8l...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="h8l...: actual.substring(76)=${actual.substring(76)}`);
      expect(actual.substring(76)).assertEqual('/test","subscriberId":"h8l8F"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0086
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0086
     * @tc.desc      persistentBindingJsonOf(subscriberId="ckS5I") returns "/test?",?"subscriberId?":?"ckS5I?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0086 begin`);
      const actual: string = persistentBindingJsonOf('ckS5I');
      logInfo(`persistentBindingJsonOf(subscriberId="ckS...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(108);
      logInfo(`persistentBindingJsonOf(subscriberId="ckS...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="ckS...: actual.substring(76)=${actual.substring(76)}`);
      expect(actual.substring(76)).assertEqual('/test","subscriberId":"ckS5I"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0087
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0087
     * @tc.desc      persistentBindingJsonOf(subscriberId="k") returns "lity/test?",?"subscriberId?":?"k?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0087 begin`);
      const actual: string = persistentBindingJsonOf('k');
      logInfo(`persistentBindingJsonOf(subscriberId="k"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(104);
      logInfo(`persistentBindingJsonOf(subscriberId="k"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="k"): actual.substring(72)=${actual.substring(72)}`);
      expect(actual.substring(72)).assertEqual('lity/test","subscriberId":"k"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0088
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0088
     * @tc.desc      persistentBindingJsonOf(subscriberId="9cs") returns "ty/test?",?"subscriberId?":?"9cs?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0088 begin`);
      const actual: string = persistentBindingJsonOf('9cs');
      logInfo(`persistentBindingJsonOf(subscriberId="9cs"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(106);
      logInfo(`persistentBindingJsonOf(subscriberId="9cs"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="9cs"): actual.substring(74)=${actual.substring(74)}`);
      expect(actual.substring(74)).assertEqual('ty/test","subscriberId":"9cs"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0089
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0089
     * @tc.desc      persistentBindingJsonOf(subscriberId="nAv4DRka") returns "st?",?"subscriberId?":?"nAv4DRka?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0089 begin`);
      const actual: string = persistentBindingJsonOf('nAv4DRka');
      logInfo(`persistentBindingJsonOf(subscriberId="nAv...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(111);
      logInfo(`persistentBindingJsonOf(subscriberId="nAv...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="nAv...: actual.substring(79)=${actual.substring(79)}`);
      expect(actual.substring(79)).assertEqual('st","subscriberId":"nAv4DRka"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PERSISTENT_BINDING_JSON_OF_0090
     * @tc.name      FormExtAbility_PersistentBindingJsonOf_0090
     * @tc.desc      persistentBindingJsonOf(subscriberId="H") returns "lity/test?",?"subscriberId?":?"H?"}]}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PersistentBindingJsonOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0090 begin`);
      const actual: string = persistentBindingJsonOf('H');
      logInfo(`persistentBindingJsonOf(subscriberId="H"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(104);
      logInfo(`persistentBindingJsonOf(subscriberId="H"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"data":"{}","proxies":[{"key":"');
      logInfo(`persistentBindingJsonOf(subscriberId="H"): actual.substring(72)=${actual.substring(72)}`);
      expect(actual.substring(72)).assertEqual('lity/test","subscriberId":"H"}]}');
      logInfo(`${BUNDLE}PersistentBindingJsonOf_0090 end`);
    });
  });
}
