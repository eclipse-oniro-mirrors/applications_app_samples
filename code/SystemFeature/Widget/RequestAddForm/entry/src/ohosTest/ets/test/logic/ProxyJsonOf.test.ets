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
import { proxyJsonOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for proxyJsonOf (96 cases). */
export default function proxyJsonOfTest(): void {
  describe('ProxyJsonOfTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0001
     * @tc.name      RequestAddForm_ProxyJsonOf_0001
     * @tc.desc      proxyJsonOf(subscriberId="") returns "[{?"key?":?"weather?",?"subscriberid?":?"?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_ProxyJsonOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0001 begin`);
      const actual: string = proxyJsonOf('');
      logInfo(`proxyJsonOf(subscriberId=""): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":""}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0002
     * @tc.name      RequestAddForm_ProxyJsonOf_0002
     * @tc.desc      proxyJsonOf(subscriberId="a") returns "[{?"key?":?"weather?",?"subscriberid?":?"a?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_ProxyJsonOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0002 begin`);
      const actual: string = proxyJsonOf('a');
      logInfo(`proxyJsonOf(subscriberId="a"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"a"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0003
     * @tc.name      RequestAddForm_ProxyJsonOf_0003
     * @tc.desc      proxyJsonOf(subscriberId="abc") returns "[{?"key?":?"weather?",?"subscriberid?":?"abc?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0003 begin`);
      const actual: string = proxyJsonOf('abc');
      logInfo(`proxyJsonOf(subscriberId="abc"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"abc"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0004
     * @tc.name      RequestAddForm_ProxyJsonOf_0004
     * @tc.desc      proxyJsonOf(subscriberId="Hello World") returns "[{?"key?":?"weather?",?"subscriberid?":?"Hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0004 begin`);
      const actual: string = proxyJsonOf('Hello World');
      logInfo(`proxyJsonOf(subscriberId="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Hello World"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0005
     * @tc.name      RequestAddForm_ProxyJsonOf_0005
     * @tc.desc      proxyJsonOf(subscriberId=" ") returns "[{?"key?":?"weather?",?"subscriberid?":?" ?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0005 begin`);
      const actual: string = proxyJsonOf(' ');
      logInfo(`proxyJsonOf(subscriberId=" "): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":" "}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0006
     * @tc.name      RequestAddForm_ProxyJsonOf_0006
     * @tc.desc      proxyJsonOf(subscriberId="123") returns "[{?"key?":?"weather?",?"subscriberid?":?"123?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0006 begin`);
      const actual: string = proxyJsonOf('123');
      logInfo(`proxyJsonOf(subscriberId="123"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"123"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0007
     * @tc.name      RequestAddForm_ProxyJsonOf_0007
     * @tc.desc      proxyJsonOf(subscriberId=" a ") returns "[{?"key?":?"weather?",?"subscriberid?":?" a ?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_ProxyJsonOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0007 begin`);
      const actual: string = proxyJsonOf(' a ');
      logInfo(`proxyJsonOf(subscriberId=" a "): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":" a "}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0008
     * @tc.name      RequestAddForm_ProxyJsonOf_0008
     * @tc.desc      proxyJsonOf(subscriberId="aa") returns "[{?"key?":?"weather?",?"subscriberid?":?"aa?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0008 begin`);
      const actual: string = proxyJsonOf('aa');
      logInfo(`proxyJsonOf(subscriberId="aa"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"aa"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0009
     * @tc.name      RequestAddForm_ProxyJsonOf_0009
     * @tc.desc      proxyJsonOf(subscriberId="a_1") returns "[{?"key?":?"weather?",?"subscriberid?":?"a_1?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0009 begin`);
      const actual: string = proxyJsonOf('a_1');
      logInfo(`proxyJsonOf(subscriberId="a_1"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"a_1"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0010
     * @tc.name      RequestAddForm_ProxyJsonOf_0010
     * @tc.desc      proxyJsonOf(subscriberId="xa") returns "[{?"key?":?"weather?",?"subscriberid?":?"xa?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_ProxyJsonOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0010 begin`);
      const actual: string = proxyJsonOf('xa');
      logInfo(`proxyJsonOf(subscriberId="xa"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"xa"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0011
     * @tc.name      RequestAddForm_ProxyJsonOf_0011
     * @tc.desc      proxyJsonOf(subscriberId=" abc ") returns "[{?"key?":?"weather?",?"subscriberid?":?" abc ?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_ProxyJsonOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0011 begin`);
      const actual: string = proxyJsonOf(' abc ');
      logInfo(`proxyJsonOf(subscriberId=" abc "): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":" abc "}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0012
     * @tc.name      RequestAddForm_ProxyJsonOf_0012
     * @tc.desc      proxyJsonOf(subscriberId="abcabc") returns "[{?"key?":?"weather?",?"subscriberid?":?"abcabc?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0012 begin`);
      const actual: string = proxyJsonOf('abcabc');
      logInfo(`proxyJsonOf(subscriberId="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"abcabc"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0013
     * @tc.name      RequestAddForm_ProxyJsonOf_0013
     * @tc.desc      proxyJsonOf(subscriberId="abc_1") returns "[{?"key?":?"weather?",?"subscriberid?":?"abc_1?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0013 begin`);
      const actual: string = proxyJsonOf('abc_1');
      logInfo(`proxyJsonOf(subscriberId="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"abc_1"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0014
     * @tc.name      RequestAddForm_ProxyJsonOf_0014
     * @tc.desc      proxyJsonOf(subscriberId="xabc") returns "[{?"key?":?"weather?",?"subscriberid?":?"xabc?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_ProxyJsonOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0014 begin`);
      const actual: string = proxyJsonOf('xabc');
      logInfo(`proxyJsonOf(subscriberId="xabc"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"xabc"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0015
     * @tc.name      RequestAddForm_ProxyJsonOf_0015
     * @tc.desc      proxyJsonOf(subscriberId=" Hello World ") returns "[{?"key?":?"weather?",?"subscriberid?":?" Hel...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_ProxyJsonOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0015 begin`);
      const actual: string = proxyJsonOf(' Hello World ');
      logInfo(`proxyJsonOf(subscriberId=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":" Hello World "}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0016
     * @tc.name      RequestAddForm_ProxyJsonOf_0016
     * @tc.desc      proxyJsonOf(subscriberId="Hello WorldHello World") returns "[{?"key?":?"weather?",?"subscriberid...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0016 begin`);
      const actual: string = proxyJsonOf('Hello WorldHello World');
      logInfo(`proxyJsonOf(subscriberId="Hello WorldHell...: actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Hello WorldHello World"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0017
     * @tc.name      RequestAddForm_ProxyJsonOf_0017
     * @tc.desc      proxyJsonOf(subscriberId="Hello World_1") returns "[{?"key?":?"weather?",?"subscriberid?":?"Hell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0017 begin`);
      const actual: string = proxyJsonOf('Hello World_1');
      logInfo(`proxyJsonOf(subscriberId="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Hello World_1"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0018
     * @tc.name      RequestAddForm_ProxyJsonOf_0018
     * @tc.desc      proxyJsonOf(subscriberId="xHello World") returns "[{?"key?":?"weather?",?"subscriberid?":?"xHell...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_ProxyJsonOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0018 begin`);
      const actual: string = proxyJsonOf('xHello World');
      logInfo(`proxyJsonOf(subscriberId="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"xHello World"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0019
     * @tc.name      RequestAddForm_ProxyJsonOf_0019
     * @tc.desc      proxyJsonOf(subscriberId="   ") returns "[{?"key?":?"weather?",?"subscriberid?":?"   ?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_ProxyJsonOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0019 begin`);
      const actual: string = proxyJsonOf('   ');
      logInfo(`proxyJsonOf(subscriberId="   "): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"   "}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0020
     * @tc.name      RequestAddForm_ProxyJsonOf_0020
     * @tc.desc      proxyJsonOf(subscriberId="  ") returns "[{?"key?":?"weather?",?"subscriberid?":?"  ?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0020 begin`);
      const actual: string = proxyJsonOf('  ');
      logInfo(`proxyJsonOf(subscriberId="  "): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"  "}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0021
     * @tc.name      RequestAddForm_ProxyJsonOf_0021
     * @tc.desc      proxyJsonOf(subscriberId=" _1") returns "[{?"key?":?"weather?",?"subscriberid?":?" _1?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0021 begin`);
      const actual: string = proxyJsonOf(' _1');
      logInfo(`proxyJsonOf(subscriberId=" _1"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":" _1"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0022
     * @tc.name      RequestAddForm_ProxyJsonOf_0022
     * @tc.desc      proxyJsonOf(subscriberId="x ") returns "[{?"key?":?"weather?",?"subscriberid?":?"x ?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_ProxyJsonOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0022 begin`);
      const actual: string = proxyJsonOf('x ');
      logInfo(`proxyJsonOf(subscriberId="x "): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"x "}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0023
     * @tc.name      RequestAddForm_ProxyJsonOf_0023
     * @tc.desc      proxyJsonOf(subscriberId=" 123 ") returns "[{?"key?":?"weather?",?"subscriberid?":?" 123 ?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_ProxyJsonOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0023 begin`);
      const actual: string = proxyJsonOf(' 123 ');
      logInfo(`proxyJsonOf(subscriberId=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":" 123 "}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0024
     * @tc.name      RequestAddForm_ProxyJsonOf_0024
     * @tc.desc      proxyJsonOf(subscriberId="123123") returns "[{?"key?":?"weather?",?"subscriberid?":?"123123?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0024 begin`);
      const actual: string = proxyJsonOf('123123');
      logInfo(`proxyJsonOf(subscriberId="123123"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"123123"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0025
     * @tc.name      RequestAddForm_ProxyJsonOf_0025
     * @tc.desc      proxyJsonOf(subscriberId="123_1") returns "[{?"key?":?"weather?",?"subscriberid?":?"123_1?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0025 begin`);
      const actual: string = proxyJsonOf('123_1');
      logInfo(`proxyJsonOf(subscriberId="123_1"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"123_1"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0026
     * @tc.name      RequestAddForm_ProxyJsonOf_0026
     * @tc.desc      proxyJsonOf(subscriberId="x123") returns "[{?"key?":?"weather?",?"subscriberid?":?"x123?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_ProxyJsonOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0026 begin`);
      const actual: string = proxyJsonOf('x123');
      logInfo(`proxyJsonOf(subscriberId="x123"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"x123"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0027
     * @tc.name      RequestAddForm_ProxyJsonOf_0027
     * @tc.desc      proxyJsonOf(subscriberId="Dclmavr") returns "[{?"key?":?"weather?",?"subscriberid?":?"Dclmavr?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0027 begin`);
      const actual: string = proxyJsonOf('Dclmavr');
      logInfo(`proxyJsonOf(subscriberId="Dclmavr"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Dclmavr"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0028
     * @tc.name      RequestAddForm_ProxyJsonOf_0028
     * @tc.desc      proxyJsonOf(subscriberId="f") returns "[{?"key?":?"weather?",?"subscriberid?":?"f?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0028 begin`);
      const actual: string = proxyJsonOf('f');
      logInfo(`proxyJsonOf(subscriberId="f"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"f"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0029
     * @tc.name      RequestAddForm_ProxyJsonOf_0029
     * @tc.desc      proxyJsonOf(subscriberId="3jAY7bPI") returns "[{?"key?":?"weather?",?"subscriberid?":?"3jAY7bPI?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0029 begin`);
      const actual: string = proxyJsonOf('3jAY7bPI');
      logInfo(`proxyJsonOf(subscriberId="3jAY7bPI"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"3jAY7bPI"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0030
     * @tc.name      RequestAddForm_ProxyJsonOf_0030
     * @tc.desc      proxyJsonOf(subscriberId="wECOQuVA") returns "[{?"key?":?"weather?",?"subscriberid?":?"wECOQuVA?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0030 begin`);
      const actual: string = proxyJsonOf('wECOQuVA');
      logInfo(`proxyJsonOf(subscriberId="wECOQuVA"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"wECOQuVA"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0031
     * @tc.name      RequestAddForm_ProxyJsonOf_0031
     * @tc.desc      proxyJsonOf(subscriberId="pu") returns "[{?"key?":?"weather?",?"subscriberid?":?"pu?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0031 begin`);
      const actual: string = proxyJsonOf('pu');
      logInfo(`proxyJsonOf(subscriberId="pu"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"pu"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0032
     * @tc.name      RequestAddForm_ProxyJsonOf_0032
     * @tc.desc      proxyJsonOf(subscriberId="iqSf9SXv6") returns "[{?"key?":?"weather?",?"subscriberid?":?"iqSf9SXv...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0032 begin`);
      const actual: string = proxyJsonOf('iqSf9SXv6');
      logInfo(`proxyJsonOf(subscriberId="iqSf9SXv6"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"iqSf9SXv6"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0033
     * @tc.name      RequestAddForm_ProxyJsonOf_0033
     * @tc.desc      proxyJsonOf(subscriberId="9S8OeGfjvNy2") returns "[{?"key?":?"weather?",?"subscriberid?":?"9S8Oe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0033 begin`);
      const actual: string = proxyJsonOf('9S8OeGfjvNy2');
      logInfo(`proxyJsonOf(subscriberId="9S8OeGfjvNy2"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"9S8OeGfjvNy2"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0034
     * @tc.name      RequestAddForm_ProxyJsonOf_0034
     * @tc.desc      proxyJsonOf(subscriberId="ot79m3w6zC5T") returns "[{?"key?":?"weather?",?"subscriberid?":?"ot79m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0034 begin`);
      const actual: string = proxyJsonOf('ot79m3w6zC5T');
      logInfo(`proxyJsonOf(subscriberId="ot79m3w6zC5T"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"ot79m3w6zC5T"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0035
     * @tc.name      RequestAddForm_ProxyJsonOf_0035
     * @tc.desc      proxyJsonOf(subscriberId="urjP0LrsCF") returns "[{?"key?":?"weather?",?"subscriberid?":?"urjP0Lr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0035 begin`);
      const actual: string = proxyJsonOf('urjP0LrsCF');
      logInfo(`proxyJsonOf(subscriberId="urjP0LrsCF"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"urjP0LrsCF"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0036
     * @tc.name      RequestAddForm_ProxyJsonOf_0036
     * @tc.desc      proxyJsonOf(subscriberId="LaWrwwa") returns "[{?"key?":?"weather?",?"subscriberid?":?"LaWrwwa?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0036 begin`);
      const actual: string = proxyJsonOf('LaWrwwa');
      logInfo(`proxyJsonOf(subscriberId="LaWrwwa"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"LaWrwwa"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0037
     * @tc.name      RequestAddForm_ProxyJsonOf_0037
     * @tc.desc      proxyJsonOf(subscriberId="38nBf") returns "[{?"key?":?"weather?",?"subscriberid?":?"38nBf?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0037 begin`);
      const actual: string = proxyJsonOf('38nBf');
      logInfo(`proxyJsonOf(subscriberId="38nBf"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"38nBf"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0038
     * @tc.name      RequestAddForm_ProxyJsonOf_0038
     * @tc.desc      proxyJsonOf(subscriberId="CpcIE320gHP") returns "[{?"key?":?"weather?",?"subscriberid?":?"CpcIE3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0038 begin`);
      const actual: string = proxyJsonOf('CpcIE320gHP');
      logInfo(`proxyJsonOf(subscriberId="CpcIE320gHP"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"CpcIE320gHP"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0039
     * @tc.name      RequestAddForm_ProxyJsonOf_0039
     * @tc.desc      proxyJsonOf(subscriberId="w") returns "[{?"key?":?"weather?",?"subscriberid?":?"w?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0039 begin`);
      const actual: string = proxyJsonOf('w');
      logInfo(`proxyJsonOf(subscriberId="w"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"w"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0040
     * @tc.name      RequestAddForm_ProxyJsonOf_0040
     * @tc.desc      proxyJsonOf(subscriberId="1ugQcq") returns "[{?"key?":?"weather?",?"subscriberid?":?"1ugQcq?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0040 begin`);
      const actual: string = proxyJsonOf('1ugQcq');
      logInfo(`proxyJsonOf(subscriberId="1ugQcq"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"1ugQcq"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0041
     * @tc.name      RequestAddForm_ProxyJsonOf_0041
     * @tc.desc      proxyJsonOf(subscriberId="zuyFNrBCsZd4") returns "[{?"key?":?"weather?",?"subscriberid?":?"zuyFN...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0041 begin`);
      const actual: string = proxyJsonOf('zuyFNrBCsZd4');
      logInfo(`proxyJsonOf(subscriberId="zuyFNrBCsZd4"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"zuyFNrBCsZd4"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0042
     * @tc.name      RequestAddForm_ProxyJsonOf_0042
     * @tc.desc      proxyJsonOf(subscriberId="ZlNnytpSu1RI") returns "[{?"key?":?"weather?",?"subscriberid?":?"ZlNny...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0042 begin`);
      const actual: string = proxyJsonOf('ZlNnytpSu1RI');
      logInfo(`proxyJsonOf(subscriberId="ZlNnytpSu1RI"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"ZlNnytpSu1RI"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0042 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0043
     * @tc.name      RequestAddForm_ProxyJsonOf_0043
     * @tc.desc      proxyJsonOf(subscriberId="ayFRX") returns "[{?"key?":?"weather?",?"subscriberid?":?"ayFRX?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0043 begin`);
      const actual: string = proxyJsonOf('ayFRX');
      logInfo(`proxyJsonOf(subscriberId="ayFRX"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"ayFRX"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0044
     * @tc.name      RequestAddForm_ProxyJsonOf_0044
     * @tc.desc      proxyJsonOf(subscriberId="QTnOxcXh6") returns "[{?"key?":?"weather?",?"subscriberid?":?"QTnOxcXh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0044 begin`);
      const actual: string = proxyJsonOf('QTnOxcXh6');
      logInfo(`proxyJsonOf(subscriberId="QTnOxcXh6"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"QTnOxcXh6"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0045
     * @tc.name      RequestAddForm_ProxyJsonOf_0045
     * @tc.desc      proxyJsonOf(subscriberId="pd") returns "[{?"key?":?"weather?",?"subscriberid?":?"pd?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0045 begin`);
      const actual: string = proxyJsonOf('pd');
      logInfo(`proxyJsonOf(subscriberId="pd"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"pd"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0046
     * @tc.name      RequestAddForm_ProxyJsonOf_0046
     * @tc.desc      proxyJsonOf(subscriberId="Dfo2a7") returns "[{?"key?":?"weather?",?"subscriberid?":?"Dfo2a7?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0046 begin`);
      const actual: string = proxyJsonOf('Dfo2a7');
      logInfo(`proxyJsonOf(subscriberId="Dfo2a7"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Dfo2a7"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0047
     * @tc.name      RequestAddForm_ProxyJsonOf_0047
     * @tc.desc      proxyJsonOf(subscriberId="Li33xzmv") returns "[{?"key?":?"weather?",?"subscriberid?":?"Li33xzmv?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0047 begin`);
      const actual: string = proxyJsonOf('Li33xzmv');
      logInfo(`proxyJsonOf(subscriberId="Li33xzmv"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Li33xzmv"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0048
     * @tc.name      RequestAddForm_ProxyJsonOf_0048
     * @tc.desc      proxyJsonOf(subscriberId="WVOdpgyy") returns "[{?"key?":?"weather?",?"subscriberid?":?"WVOdpgyy?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0048 begin`);
      const actual: string = proxyJsonOf('WVOdpgyy');
      logInfo(`proxyJsonOf(subscriberId="WVOdpgyy"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"WVOdpgyy"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0049
     * @tc.name      RequestAddForm_ProxyJsonOf_0049
     * @tc.desc      proxyJsonOf(subscriberId="s3QLlN55p") returns "[{?"key?":?"weather?",?"subscriberid?":?"s3QLlN55...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0049 begin`);
      const actual: string = proxyJsonOf('s3QLlN55p');
      logInfo(`proxyJsonOf(subscriberId="s3QLlN55p"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"s3QLlN55p"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0050
     * @tc.name      RequestAddForm_ProxyJsonOf_0050
     * @tc.desc      proxyJsonOf(subscriberId="UugG9YVT2PqY") returns "[{?"key?":?"weather?",?"subscriberid?":?"UugG9...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0050 begin`);
      const actual: string = proxyJsonOf('UugG9YVT2PqY');
      logInfo(`proxyJsonOf(subscriberId="UugG9YVT2PqY"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"UugG9YVT2PqY"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0050 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0051
     * @tc.name      RequestAddForm_ProxyJsonOf_0051
     * @tc.desc      proxyJsonOf(subscriberId="Ep") returns "[{?"key?":?"weather?",?"subscriberid?":?"Ep?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0051 begin`);
      const actual: string = proxyJsonOf('Ep');
      logInfo(`proxyJsonOf(subscriberId="Ep"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Ep"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0051 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0052
     * @tc.name      RequestAddForm_ProxyJsonOf_0052
     * @tc.desc      proxyJsonOf(subscriberId="SWaRMCS4") returns "[{?"key?":?"weather?",?"subscriberid?":?"SWaRMCS4?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0052 begin`);
      const actual: string = proxyJsonOf('SWaRMCS4');
      logInfo(`proxyJsonOf(subscriberId="SWaRMCS4"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"SWaRMCS4"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0052 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0053
     * @tc.name      RequestAddForm_ProxyJsonOf_0053
     * @tc.desc      proxyJsonOf(subscriberId="dVx") returns "[{?"key?":?"weather?",?"subscriberid?":?"dVx?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0053 begin`);
      const actual: string = proxyJsonOf('dVx');
      logInfo(`proxyJsonOf(subscriberId="dVx"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"dVx"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0053 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0054
     * @tc.name      RequestAddForm_ProxyJsonOf_0054
     * @tc.desc      proxyJsonOf(subscriberId="VN") returns "[{?"key?":?"weather?",?"subscriberid?":?"VN?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0054 begin`);
      const actual: string = proxyJsonOf('VN');
      logInfo(`proxyJsonOf(subscriberId="VN"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"VN"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0054 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0055
     * @tc.name      RequestAddForm_ProxyJsonOf_0055
     * @tc.desc      proxyJsonOf(subscriberId="380Lnq2sws7") returns "[{?"key?":?"weather?",?"subscriberid?":?"380Lnq...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0055 begin`);
      const actual: string = proxyJsonOf('380Lnq2sws7');
      logInfo(`proxyJsonOf(subscriberId="380Lnq2sws7"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"380Lnq2sws7"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0055 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0056
     * @tc.name      RequestAddForm_ProxyJsonOf_0056
     * @tc.desc      proxyJsonOf(subscriberId="XE6VcIeENyK") returns "[{?"key?":?"weather?",?"subscriberid?":?"XE6VcI...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0056 begin`);
      const actual: string = proxyJsonOf('XE6VcIeENyK');
      logInfo(`proxyJsonOf(subscriberId="XE6VcIeENyK"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"XE6VcIeENyK"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0056 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0057
     * @tc.name      RequestAddForm_ProxyJsonOf_0057
     * @tc.desc      proxyJsonOf(subscriberId="4Q4t1ul") returns "[{?"key?":?"weather?",?"subscriberid?":?"4Q4t1ul?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0057 begin`);
      const actual: string = proxyJsonOf('4Q4t1ul');
      logInfo(`proxyJsonOf(subscriberId="4Q4t1ul"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"4Q4t1ul"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0057 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0058
     * @tc.name      RequestAddForm_ProxyJsonOf_0058
     * @tc.desc      proxyJsonOf(subscriberId="U") returns "[{?"key?":?"weather?",?"subscriberid?":?"U?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0058 begin`);
      const actual: string = proxyJsonOf('U');
      logInfo(`proxyJsonOf(subscriberId="U"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"U"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0058 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0059
     * @tc.name      RequestAddForm_ProxyJsonOf_0059
     * @tc.desc      proxyJsonOf(subscriberId="pLulsLGR") returns "[{?"key?":?"weather?",?"subscriberid?":?"pLulsLGR?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0059 begin`);
      const actual: string = proxyJsonOf('pLulsLGR');
      logInfo(`proxyJsonOf(subscriberId="pLulsLGR"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"pLulsLGR"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0059 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0060
     * @tc.name      RequestAddForm_ProxyJsonOf_0060
     * @tc.desc      proxyJsonOf(subscriberId="963GLXCOuaQh") returns "[{?"key?":?"weather?",?"subscriberid?":?"963GL...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0060 begin`);
      const actual: string = proxyJsonOf('963GLXCOuaQh');
      logInfo(`proxyJsonOf(subscriberId="963GLXCOuaQh"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"963GLXCOuaQh"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0060 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0061
     * @tc.name      RequestAddForm_ProxyJsonOf_0061
     * @tc.desc      proxyJsonOf(subscriberId="YFKWlmG") returns "[{?"key?":?"weather?",?"subscriberid?":?"YFKWlmG?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0061 begin`);
      const actual: string = proxyJsonOf('YFKWlmG');
      logInfo(`proxyJsonOf(subscriberId="YFKWlmG"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"YFKWlmG"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0061 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0062
     * @tc.name      RequestAddForm_ProxyJsonOf_0062
     * @tc.desc      proxyJsonOf(subscriberId="8D3z5") returns "[{?"key?":?"weather?",?"subscriberid?":?"8D3z5?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0062 begin`);
      const actual: string = proxyJsonOf('8D3z5');
      logInfo(`proxyJsonOf(subscriberId="8D3z5"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"8D3z5"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0062 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0063
     * @tc.name      RequestAddForm_ProxyJsonOf_0063
     * @tc.desc      proxyJsonOf(subscriberId="wye5w") returns "[{?"key?":?"weather?",?"subscriberid?":?"wye5w?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0063 begin`);
      const actual: string = proxyJsonOf('wye5w');
      logInfo(`proxyJsonOf(subscriberId="wye5w"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"wye5w"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0063 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0064
     * @tc.name      RequestAddForm_ProxyJsonOf_0064
     * @tc.desc      proxyJsonOf(subscriberId="38ZQMHexIXbF") returns "[{?"key?":?"weather?",?"subscriberid?":?"38ZQM...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0064 begin`);
      const actual: string = proxyJsonOf('38ZQMHexIXbF');
      logInfo(`proxyJsonOf(subscriberId="38ZQMHexIXbF"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"38ZQMHexIXbF"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0064 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0065
     * @tc.name      RequestAddForm_ProxyJsonOf_0065
     * @tc.desc      proxyJsonOf(subscriberId="il8RM") returns "[{?"key?":?"weather?",?"subscriberid?":?"il8RM?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0065 begin`);
      const actual: string = proxyJsonOf('il8RM');
      logInfo(`proxyJsonOf(subscriberId="il8RM"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"il8RM"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0065 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0066
     * @tc.name      RequestAddForm_ProxyJsonOf_0066
     * @tc.desc      proxyJsonOf(subscriberId="8") returns "[{?"key?":?"weather?",?"subscriberid?":?"8?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0066 begin`);
      const actual: string = proxyJsonOf('8');
      logInfo(`proxyJsonOf(subscriberId="8"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"8"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0066 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0067
     * @tc.name      RequestAddForm_ProxyJsonOf_0067
     * @tc.desc      proxyJsonOf(subscriberId="xrEyQG") returns "[{?"key?":?"weather?",?"subscriberid?":?"xrEyQG?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0067 begin`);
      const actual: string = proxyJsonOf('xrEyQG');
      logInfo(`proxyJsonOf(subscriberId="xrEyQG"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"xrEyQG"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0067 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0068
     * @tc.name      RequestAddForm_ProxyJsonOf_0068
     * @tc.desc      proxyJsonOf(subscriberId="Rokbs") returns "[{?"key?":?"weather?",?"subscriberid?":?"Rokbs?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0068 begin`);
      const actual: string = proxyJsonOf('Rokbs');
      logInfo(`proxyJsonOf(subscriberId="Rokbs"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Rokbs"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0068 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0069
     * @tc.name      RequestAddForm_ProxyJsonOf_0069
     * @tc.desc      proxyJsonOf(subscriberId="Zj") returns "[{?"key?":?"weather?",?"subscriberid?":?"Zj?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0069 begin`);
      const actual: string = proxyJsonOf('Zj');
      logInfo(`proxyJsonOf(subscriberId="Zj"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Zj"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0069 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0070
     * @tc.name      RequestAddForm_ProxyJsonOf_0070
     * @tc.desc      proxyJsonOf(subscriberId="DKzgEK7uL") returns "[{?"key?":?"weather?",?"subscriberid?":?"DKzgEK7u...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0070 begin`);
      const actual: string = proxyJsonOf('DKzgEK7uL');
      logInfo(`proxyJsonOf(subscriberId="DKzgEK7uL"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"DKzgEK7uL"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0070 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0071
     * @tc.name      RequestAddForm_ProxyJsonOf_0071
     * @tc.desc      proxyJsonOf(subscriberId="fveRwMmS0Fq8") returns "[{?"key?":?"weather?",?"subscriberid?":?"fveRw...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0071 begin`);
      const actual: string = proxyJsonOf('fveRwMmS0Fq8');
      logInfo(`proxyJsonOf(subscriberId="fveRwMmS0Fq8"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"fveRwMmS0Fq8"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0071 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0072
     * @tc.name      RequestAddForm_ProxyJsonOf_0072
     * @tc.desc      proxyJsonOf(subscriberId="puhoRb") returns "[{?"key?":?"weather?",?"subscriberid?":?"puhoRb?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0072 begin`);
      const actual: string = proxyJsonOf('puhoRb');
      logInfo(`proxyJsonOf(subscriberId="puhoRb"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"puhoRb"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0072 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0073
     * @tc.name      RequestAddForm_ProxyJsonOf_0073
     * @tc.desc      proxyJsonOf(subscriberId="zZ76US") returns "[{?"key?":?"weather?",?"subscriberid?":?"zZ76US?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0073 begin`);
      const actual: string = proxyJsonOf('zZ76US');
      logInfo(`proxyJsonOf(subscriberId="zZ76US"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"zZ76US"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0073 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0074
     * @tc.name      RequestAddForm_ProxyJsonOf_0074
     * @tc.desc      proxyJsonOf(subscriberId="pnPC8cxaED") returns "[{?"key?":?"weather?",?"subscriberid?":?"pnPC8cx...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0074 begin`);
      const actual: string = proxyJsonOf('pnPC8cxaED');
      logInfo(`proxyJsonOf(subscriberId="pnPC8cxaED"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"pnPC8cxaED"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0074 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0075
     * @tc.name      RequestAddForm_ProxyJsonOf_0075
     * @tc.desc      proxyJsonOf(subscriberId="2JSRDBBsQ1") returns "[{?"key?":?"weather?",?"subscriberid?":?"2JSRDBB...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0075 begin`);
      const actual: string = proxyJsonOf('2JSRDBBsQ1');
      logInfo(`proxyJsonOf(subscriberId="2JSRDBBsQ1"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"2JSRDBBsQ1"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0075 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0076
     * @tc.name      RequestAddForm_ProxyJsonOf_0076
     * @tc.desc      proxyJsonOf(subscriberId="SbmmWHhIY41w") returns "[{?"key?":?"weather?",?"subscriberid?":?"SbmmW...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0076 begin`);
      const actual: string = proxyJsonOf('SbmmWHhIY41w');
      logInfo(`proxyJsonOf(subscriberId="SbmmWHhIY41w"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"SbmmWHhIY41w"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0076 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0077
     * @tc.name      RequestAddForm_ProxyJsonOf_0077
     * @tc.desc      proxyJsonOf(subscriberId="rENVy52o1aP8") returns "[{?"key?":?"weather?",?"subscriberid?":?"rENVy...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0077 begin`);
      const actual: string = proxyJsonOf('rENVy52o1aP8');
      logInfo(`proxyJsonOf(subscriberId="rENVy52o1aP8"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"rENVy52o1aP8"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0077 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0078
     * @tc.name      RequestAddForm_ProxyJsonOf_0078
     * @tc.desc      proxyJsonOf(subscriberId="Vxr9qOs") returns "[{?"key?":?"weather?",?"subscriberid?":?"Vxr9qOs?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0078 begin`);
      const actual: string = proxyJsonOf('Vxr9qOs');
      logInfo(`proxyJsonOf(subscriberId="Vxr9qOs"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Vxr9qOs"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0078 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0079
     * @tc.name      RequestAddForm_ProxyJsonOf_0079
     * @tc.desc      proxyJsonOf(subscriberId="Hve8t4B") returns "[{?"key?":?"weather?",?"subscriberid?":?"Hve8t4B?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0079 begin`);
      const actual: string = proxyJsonOf('Hve8t4B');
      logInfo(`proxyJsonOf(subscriberId="Hve8t4B"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Hve8t4B"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0079 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0080
     * @tc.name      RequestAddForm_ProxyJsonOf_0080
     * @tc.desc      proxyJsonOf(subscriberId="luNj9F799Ba") returns "[{?"key?":?"weather?",?"subscriberid?":?"luNj9F...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0080 begin`);
      const actual: string = proxyJsonOf('luNj9F799Ba');
      logInfo(`proxyJsonOf(subscriberId="luNj9F799Ba"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"luNj9F799Ba"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0080 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0081
     * @tc.name      RequestAddForm_ProxyJsonOf_0081
     * @tc.desc      proxyJsonOf(subscriberId="cqDxtv6LXB") returns "[{?"key?":?"weather?",?"subscriberid?":?"cqDxtv6...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0081 begin`);
      const actual: string = proxyJsonOf('cqDxtv6LXB');
      logInfo(`proxyJsonOf(subscriberId="cqDxtv6LXB"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"cqDxtv6LXB"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0081 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0082
     * @tc.name      RequestAddForm_ProxyJsonOf_0082
     * @tc.desc      proxyJsonOf(subscriberId="7aQYCFAhuR") returns "[{?"key?":?"weather?",?"subscriberid?":?"7aQYCFA...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0082 begin`);
      const actual: string = proxyJsonOf('7aQYCFAhuR');
      logInfo(`proxyJsonOf(subscriberId="7aQYCFAhuR"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"7aQYCFAhuR"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0082 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0083
     * @tc.name      RequestAddForm_ProxyJsonOf_0083
     * @tc.desc      proxyJsonOf(subscriberId="Kd") returns "[{?"key?":?"weather?",?"subscriberid?":?"Kd?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0083 begin`);
      const actual: string = proxyJsonOf('Kd');
      logInfo(`proxyJsonOf(subscriberId="Kd"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Kd"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0083 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0084
     * @tc.name      RequestAddForm_ProxyJsonOf_0084
     * @tc.desc      proxyJsonOf(subscriberId="CcaceeQ") returns "[{?"key?":?"weather?",?"subscriberid?":?"CcaceeQ?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0084 begin`);
      const actual: string = proxyJsonOf('CcaceeQ');
      logInfo(`proxyJsonOf(subscriberId="CcaceeQ"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"CcaceeQ"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0084 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0085
     * @tc.name      RequestAddForm_ProxyJsonOf_0085
     * @tc.desc      proxyJsonOf(subscriberId="FBJdA4") returns "[{?"key?":?"weather?",?"subscriberid?":?"FBJdA4?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0085 begin`);
      const actual: string = proxyJsonOf('FBJdA4');
      logInfo(`proxyJsonOf(subscriberId="FBJdA4"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"FBJdA4"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0085 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0086
     * @tc.name      RequestAddForm_ProxyJsonOf_0086
     * @tc.desc      proxyJsonOf(subscriberId="jH7dKMKd") returns "[{?"key?":?"weather?",?"subscriberid?":?"jH7dKMKd?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0086 begin`);
      const actual: string = proxyJsonOf('jH7dKMKd');
      logInfo(`proxyJsonOf(subscriberId="jH7dKMKd"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"jH7dKMKd"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0086 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0087
     * @tc.name      RequestAddForm_ProxyJsonOf_0087
     * @tc.desc      proxyJsonOf(subscriberId="INFaCTdyvD") returns "[{?"key?":?"weather?",?"subscriberid?":?"INFaCTd...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0087 begin`);
      const actual: string = proxyJsonOf('INFaCTdyvD');
      logInfo(`proxyJsonOf(subscriberId="INFaCTdyvD"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"INFaCTdyvD"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0087 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0088
     * @tc.name      RequestAddForm_ProxyJsonOf_0088
     * @tc.desc      proxyJsonOf(subscriberId="7yA881B") returns "[{?"key?":?"weather?",?"subscriberid?":?"7yA881B?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0088 begin`);
      const actual: string = proxyJsonOf('7yA881B');
      logInfo(`proxyJsonOf(subscriberId="7yA881B"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"7yA881B"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0088 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0089
     * @tc.name      RequestAddForm_ProxyJsonOf_0089
     * @tc.desc      proxyJsonOf(subscriberId="eWOU0MBU") returns "[{?"key?":?"weather?",?"subscriberid?":?"eWOU0MBU?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0089 begin`);
      const actual: string = proxyJsonOf('eWOU0MBU');
      logInfo(`proxyJsonOf(subscriberId="eWOU0MBU"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"eWOU0MBU"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0089 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0090
     * @tc.name      RequestAddForm_ProxyJsonOf_0090
     * @tc.desc      proxyJsonOf(subscriberId="9ZpsT") returns "[{?"key?":?"weather?",?"subscriberid?":?"9ZpsT?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0090 begin`);
      const actual: string = proxyJsonOf('9ZpsT');
      logInfo(`proxyJsonOf(subscriberId="9ZpsT"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"9ZpsT"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0090 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0091
     * @tc.name      RequestAddForm_ProxyJsonOf_0091
     * @tc.desc      proxyJsonOf(subscriberId="tv1bGhb0rD") returns "[{?"key?":?"weather?",?"subscriberid?":?"tv1bGhb...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0091 begin`);
      const actual: string = proxyJsonOf('tv1bGhb0rD');
      logInfo(`proxyJsonOf(subscriberId="tv1bGhb0rD"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"tv1bGhb0rD"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0091 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0092
     * @tc.name      RequestAddForm_ProxyJsonOf_0092
     * @tc.desc      proxyJsonOf(subscriberId="zhWvoS2E8wlh") returns "[{?"key?":?"weather?",?"subscriberid?":?"zhWvo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0092 begin`);
      const actual: string = proxyJsonOf('zhWvoS2E8wlh');
      logInfo(`proxyJsonOf(subscriberId="zhWvoS2E8wlh"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"zhWvoS2E8wlh"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0092 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0093
     * @tc.name      RequestAddForm_ProxyJsonOf_0093
     * @tc.desc      proxyJsonOf(subscriberId="lChb") returns "[{?"key?":?"weather?",?"subscriberid?":?"lChb?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0093 begin`);
      const actual: string = proxyJsonOf('lChb');
      logInfo(`proxyJsonOf(subscriberId="lChb"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"lChb"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0093 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0094
     * @tc.name      RequestAddForm_ProxyJsonOf_0094
     * @tc.desc      proxyJsonOf(subscriberId="qigp8AG") returns "[{?"key?":?"weather?",?"subscriberid?":?"qigp8AG?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0094 begin`);
      const actual: string = proxyJsonOf('qigp8AG');
      logInfo(`proxyJsonOf(subscriberId="qigp8AG"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"qigp8AG"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0094 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0095
     * @tc.name      RequestAddForm_ProxyJsonOf_0095
     * @tc.desc      proxyJsonOf(subscriberId="F0S") returns "[{?"key?":?"weather?",?"subscriberid?":?"F0S?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0095 begin`);
      const actual: string = proxyJsonOf('F0S');
      logInfo(`proxyJsonOf(subscriberId="F0S"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"F0S"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0095 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0096
     * @tc.name      RequestAddForm_ProxyJsonOf_0096
     * @tc.desc      proxyJsonOf(subscriberId="imoPXyDA") returns "[{?"key?":?"weather?",?"subscriberid?":?"imoPXyDA?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0096 begin`);
      const actual: string = proxyJsonOf('imoPXyDA');
      logInfo(`proxyJsonOf(subscriberId="imoPXyDA"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"imoPXyDA"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0096 end`);
    });
  });
}
