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

/** Logic checks for proxyJsonOf (84 cases). */
export default function proxyJsonOf2Test(): void {
  describe('ProxyJsonOf2Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0097
     * @tc.name      RequestAddForm_ProxyJsonOf_0097
     * @tc.desc      proxyJsonOf(subscriberId="ClOS2q") returns "[{?"key?":?"weather?",?"subscriberid?":?"ClOS2q?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0097 begin`);
      const actual: string = proxyJsonOf('ClOS2q');
      logInfo(`proxyJsonOf(subscriberId="ClOS2q"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"ClOS2q"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0097 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0098
     * @tc.name      RequestAddForm_ProxyJsonOf_0098
     * @tc.desc      proxyJsonOf(subscriberId="bTYMdeYBQQ1") returns "[{?"key?":?"weather?",?"subscriberid?":?"bTYMde...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0098 begin`);
      const actual: string = proxyJsonOf('bTYMdeYBQQ1');
      logInfo(`proxyJsonOf(subscriberId="bTYMdeYBQQ1"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"bTYMdeYBQQ1"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0098 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0099
     * @tc.name      RequestAddForm_ProxyJsonOf_0099
     * @tc.desc      proxyJsonOf(subscriberId="Vm") returns "[{?"key?":?"weather?",?"subscriberid?":?"Vm?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0099 begin`);
      const actual: string = proxyJsonOf('Vm');
      logInfo(`proxyJsonOf(subscriberId="Vm"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Vm"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0099 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0100
     * @tc.name      RequestAddForm_ProxyJsonOf_0100
     * @tc.desc      proxyJsonOf(subscriberId="quRAJPu") returns "[{?"key?":?"weather?",?"subscriberid?":?"quRAJPu?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0100 begin`);
      const actual: string = proxyJsonOf('quRAJPu');
      logInfo(`proxyJsonOf(subscriberId="quRAJPu"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"quRAJPu"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0100 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0101
     * @tc.name      RequestAddForm_ProxyJsonOf_0101
     * @tc.desc      proxyJsonOf(subscriberId="2umDjDmBOIP") returns "[{?"key?":?"weather?",?"subscriberid?":?"2umDjD...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0101 begin`);
      const actual: string = proxyJsonOf('2umDjDmBOIP');
      logInfo(`proxyJsonOf(subscriberId="2umDjDmBOIP"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"2umDjDmBOIP"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0101 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0102
     * @tc.name      RequestAddForm_ProxyJsonOf_0102
     * @tc.desc      proxyJsonOf(subscriberId="3HBm4cqLl") returns "[{?"key?":?"weather?",?"subscriberid?":?"3HBm4cqL...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0102 begin`);
      const actual: string = proxyJsonOf('3HBm4cqLl');
      logInfo(`proxyJsonOf(subscriberId="3HBm4cqLl"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"3HBm4cqLl"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0102 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0103
     * @tc.name      RequestAddForm_ProxyJsonOf_0103
     * @tc.desc      proxyJsonOf(subscriberId="IyzDvSrh") returns "[{?"key?":?"weather?",?"subscriberid?":?"IyzDvSrh?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0103 begin`);
      const actual: string = proxyJsonOf('IyzDvSrh');
      logInfo(`proxyJsonOf(subscriberId="IyzDvSrh"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"IyzDvSrh"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0103 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0104
     * @tc.name      RequestAddForm_ProxyJsonOf_0104
     * @tc.desc      proxyJsonOf(subscriberId="h4A") returns "[{?"key?":?"weather?",?"subscriberid?":?"h4A?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0104 begin`);
      const actual: string = proxyJsonOf('h4A');
      logInfo(`proxyJsonOf(subscriberId="h4A"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"h4A"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0104 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0105
     * @tc.name      RequestAddForm_ProxyJsonOf_0105
     * @tc.desc      proxyJsonOf(subscriberId="lO6KI") returns "[{?"key?":?"weather?",?"subscriberid?":?"lO6KI?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0105 begin`);
      const actual: string = proxyJsonOf('lO6KI');
      logInfo(`proxyJsonOf(subscriberId="lO6KI"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"lO6KI"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0105 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0106
     * @tc.name      RequestAddForm_ProxyJsonOf_0106
     * @tc.desc      proxyJsonOf(subscriberId="0KqIb") returns "[{?"key?":?"weather?",?"subscriberid?":?"0KqIb?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0106 begin`);
      const actual: string = proxyJsonOf('0KqIb');
      logInfo(`proxyJsonOf(subscriberId="0KqIb"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"0KqIb"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0106 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0107
     * @tc.name      RequestAddForm_ProxyJsonOf_0107
     * @tc.desc      proxyJsonOf(subscriberId="0H0i") returns "[{?"key?":?"weather?",?"subscriberid?":?"0H0i?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0107 begin`);
      const actual: string = proxyJsonOf('0H0i');
      logInfo(`proxyJsonOf(subscriberId="0H0i"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"0H0i"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0107 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0108
     * @tc.name      RequestAddForm_ProxyJsonOf_0108
     * @tc.desc      proxyJsonOf(subscriberId="9551aEP") returns "[{?"key?":?"weather?",?"subscriberid?":?"9551aEP?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0108 begin`);
      const actual: string = proxyJsonOf('9551aEP');
      logInfo(`proxyJsonOf(subscriberId="9551aEP"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"9551aEP"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0108 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0109
     * @tc.name      RequestAddForm_ProxyJsonOf_0109
     * @tc.desc      proxyJsonOf(subscriberId="c8Caa") returns "[{?"key?":?"weather?",?"subscriberid?":?"c8Caa?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0109 begin`);
      const actual: string = proxyJsonOf('c8Caa');
      logInfo(`proxyJsonOf(subscriberId="c8Caa"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"c8Caa"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0109 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0110
     * @tc.name      RequestAddForm_ProxyJsonOf_0110
     * @tc.desc      proxyJsonOf(subscriberId="K") returns "[{?"key?":?"weather?",?"subscriberid?":?"K?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0110 begin`);
      const actual: string = proxyJsonOf('K');
      logInfo(`proxyJsonOf(subscriberId="K"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"K"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0110 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0111
     * @tc.name      RequestAddForm_ProxyJsonOf_0111
     * @tc.desc      proxyJsonOf(subscriberId="Mbm") returns "[{?"key?":?"weather?",?"subscriberid?":?"Mbm?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0111 begin`);
      const actual: string = proxyJsonOf('Mbm');
      logInfo(`proxyJsonOf(subscriberId="Mbm"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Mbm"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0111 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0112
     * @tc.name      RequestAddForm_ProxyJsonOf_0112
     * @tc.desc      proxyJsonOf(subscriberId="zsQgLc5g") returns "[{?"key?":?"weather?",?"subscriberid?":?"zsQgLc5g?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0112 begin`);
      const actual: string = proxyJsonOf('zsQgLc5g');
      logInfo(`proxyJsonOf(subscriberId="zsQgLc5g"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"zsQgLc5g"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0112 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0113
     * @tc.name      RequestAddForm_ProxyJsonOf_0113
     * @tc.desc      proxyJsonOf(subscriberId="RtfwPgylRt") returns "[{?"key?":?"weather?",?"subscriberid?":?"RtfwPgy...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0113 begin`);
      const actual: string = proxyJsonOf('RtfwPgylRt');
      logInfo(`proxyJsonOf(subscriberId="RtfwPgylRt"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"RtfwPgylRt"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0113 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0114
     * @tc.name      RequestAddForm_ProxyJsonOf_0114
     * @tc.desc      proxyJsonOf(subscriberId="DUY2Gjt") returns "[{?"key?":?"weather?",?"subscriberid?":?"DUY2Gjt?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0114 begin`);
      const actual: string = proxyJsonOf('DUY2Gjt');
      logInfo(`proxyJsonOf(subscriberId="DUY2Gjt"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"DUY2Gjt"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0114 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0115
     * @tc.name      RequestAddForm_ProxyJsonOf_0115
     * @tc.desc      proxyJsonOf(subscriberId="ybIOq") returns "[{?"key?":?"weather?",?"subscriberid?":?"ybIOq?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0115 begin`);
      const actual: string = proxyJsonOf('ybIOq');
      logInfo(`proxyJsonOf(subscriberId="ybIOq"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"ybIOq"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0115 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0116
     * @tc.name      RequestAddForm_ProxyJsonOf_0116
     * @tc.desc      proxyJsonOf(subscriberId="IKw6vt5vsGkz") returns "[{?"key?":?"weather?",?"subscriberid?":?"IKw6v...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0116 begin`);
      const actual: string = proxyJsonOf('IKw6vt5vsGkz');
      logInfo(`proxyJsonOf(subscriberId="IKw6vt5vsGkz"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"IKw6vt5vsGkz"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0116 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0117
     * @tc.name      RequestAddForm_ProxyJsonOf_0117
     * @tc.desc      proxyJsonOf(subscriberId="ZKZ") returns "[{?"key?":?"weather?",?"subscriberid?":?"ZKZ?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0117 begin`);
      const actual: string = proxyJsonOf('ZKZ');
      logInfo(`proxyJsonOf(subscriberId="ZKZ"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"ZKZ"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0117 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0118
     * @tc.name      RequestAddForm_ProxyJsonOf_0118
     * @tc.desc      proxyJsonOf(subscriberId="2Fau") returns "[{?"key?":?"weather?",?"subscriberid?":?"2Fau?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0118 begin`);
      const actual: string = proxyJsonOf('2Fau');
      logInfo(`proxyJsonOf(subscriberId="2Fau"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"2Fau"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0118 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0119
     * @tc.name      RequestAddForm_ProxyJsonOf_0119
     * @tc.desc      proxyJsonOf(subscriberId="DhS") returns "[{?"key?":?"weather?",?"subscriberid?":?"DhS?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0119 begin`);
      const actual: string = proxyJsonOf('DhS');
      logInfo(`proxyJsonOf(subscriberId="DhS"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"DhS"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0119 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0120
     * @tc.name      RequestAddForm_ProxyJsonOf_0120
     * @tc.desc      proxyJsonOf(subscriberId="T") returns "[{?"key?":?"weather?",?"subscriberid?":?"T?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0120 begin`);
      const actual: string = proxyJsonOf('T');
      logInfo(`proxyJsonOf(subscriberId="T"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"T"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0120 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0121
     * @tc.name      RequestAddForm_ProxyJsonOf_0121
     * @tc.desc      proxyJsonOf(subscriberId="gRjo1R") returns "[{?"key?":?"weather?",?"subscriberid?":?"gRjo1R?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0121 begin`);
      const actual: string = proxyJsonOf('gRjo1R');
      logInfo(`proxyJsonOf(subscriberId="gRjo1R"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"gRjo1R"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0121 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0122
     * @tc.name      RequestAddForm_ProxyJsonOf_0122
     * @tc.desc      proxyJsonOf(subscriberId="Tq") returns "[{?"key?":?"weather?",?"subscriberid?":?"Tq?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0122 begin`);
      const actual: string = proxyJsonOf('Tq');
      logInfo(`proxyJsonOf(subscriberId="Tq"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Tq"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0122 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0123
     * @tc.name      RequestAddForm_ProxyJsonOf_0123
     * @tc.desc      proxyJsonOf(subscriberId="U4lixkll1f0h") returns "[{?"key?":?"weather?",?"subscriberid?":?"U4lix...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0123 begin`);
      const actual: string = proxyJsonOf('U4lixkll1f0h');
      logInfo(`proxyJsonOf(subscriberId="U4lixkll1f0h"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"U4lixkll1f0h"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0123 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0124
     * @tc.name      RequestAddForm_ProxyJsonOf_0124
     * @tc.desc      proxyJsonOf(subscriberId="oQ3") returns "[{?"key?":?"weather?",?"subscriberid?":?"oQ3?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0124 begin`);
      const actual: string = proxyJsonOf('oQ3');
      logInfo(`proxyJsonOf(subscriberId="oQ3"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"oQ3"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0124 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0125
     * @tc.name      RequestAddForm_ProxyJsonOf_0125
     * @tc.desc      proxyJsonOf(subscriberId="C") returns "[{?"key?":?"weather?",?"subscriberid?":?"C?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0125 begin`);
      const actual: string = proxyJsonOf('C');
      logInfo(`proxyJsonOf(subscriberId="C"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"C"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0125 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0126
     * @tc.name      RequestAddForm_ProxyJsonOf_0126
     * @tc.desc      proxyJsonOf(subscriberId="o2") returns "[{?"key?":?"weather?",?"subscriberid?":?"o2?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0126 begin`);
      const actual: string = proxyJsonOf('o2');
      logInfo(`proxyJsonOf(subscriberId="o2"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"o2"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0126 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0127
     * @tc.name      RequestAddForm_ProxyJsonOf_0127
     * @tc.desc      proxyJsonOf(subscriberId="gHAzzZgJ4") returns "[{?"key?":?"weather?",?"subscriberid?":?"gHAzzZgJ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0127 begin`);
      const actual: string = proxyJsonOf('gHAzzZgJ4');
      logInfo(`proxyJsonOf(subscriberId="gHAzzZgJ4"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"gHAzzZgJ4"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0127 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0128
     * @tc.name      RequestAddForm_ProxyJsonOf_0128
     * @tc.desc      proxyJsonOf(subscriberId="MX2zpptl") returns "[{?"key?":?"weather?",?"subscriberid?":?"MX2zpptl?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0128 begin`);
      const actual: string = proxyJsonOf('MX2zpptl');
      logInfo(`proxyJsonOf(subscriberId="MX2zpptl"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"MX2zpptl"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0128 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0129
     * @tc.name      RequestAddForm_ProxyJsonOf_0129
     * @tc.desc      proxyJsonOf(subscriberId="M816QVdqc6r") returns "[{?"key?":?"weather?",?"subscriberid?":?"M816QV...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0129 begin`);
      const actual: string = proxyJsonOf('M816QVdqc6r');
      logInfo(`proxyJsonOf(subscriberId="M816QVdqc6r"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"M816QVdqc6r"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0129 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0130
     * @tc.name      RequestAddForm_ProxyJsonOf_0130
     * @tc.desc      proxyJsonOf(subscriberId="umH9") returns "[{?"key?":?"weather?",?"subscriberid?":?"umH9?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0130 begin`);
      const actual: string = proxyJsonOf('umH9');
      logInfo(`proxyJsonOf(subscriberId="umH9"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"umH9"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0130 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0131
     * @tc.name      RequestAddForm_ProxyJsonOf_0131
     * @tc.desc      proxyJsonOf(subscriberId="vLAb") returns "[{?"key?":?"weather?",?"subscriberid?":?"vLAb?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0131 begin`);
      const actual: string = proxyJsonOf('vLAb');
      logInfo(`proxyJsonOf(subscriberId="vLAb"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"vLAb"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0131 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0132
     * @tc.name      RequestAddForm_ProxyJsonOf_0132
     * @tc.desc      proxyJsonOf(subscriberId="dPTP") returns "[{?"key?":?"weather?",?"subscriberid?":?"dPTP?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0132 begin`);
      const actual: string = proxyJsonOf('dPTP');
      logInfo(`proxyJsonOf(subscriberId="dPTP"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"dPTP"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0132 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0133
     * @tc.name      RequestAddForm_ProxyJsonOf_0133
     * @tc.desc      proxyJsonOf(subscriberId="Leo") returns "[{?"key?":?"weather?",?"subscriberid?":?"Leo?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0133 begin`);
      const actual: string = proxyJsonOf('Leo');
      logInfo(`proxyJsonOf(subscriberId="Leo"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Leo"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0133 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0134
     * @tc.name      RequestAddForm_ProxyJsonOf_0134
     * @tc.desc      proxyJsonOf(subscriberId="bwJk8k5bV") returns "[{?"key?":?"weather?",?"subscriberid?":?"bwJk8k5b...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0134 begin`);
      const actual: string = proxyJsonOf('bwJk8k5bV');
      logInfo(`proxyJsonOf(subscriberId="bwJk8k5bV"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"bwJk8k5bV"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0134 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0135
     * @tc.name      RequestAddForm_ProxyJsonOf_0135
     * @tc.desc      proxyJsonOf(subscriberId="Wm3t1") returns "[{?"key?":?"weather?",?"subscriberid?":?"Wm3t1?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0135 begin`);
      const actual: string = proxyJsonOf('Wm3t1');
      logInfo(`proxyJsonOf(subscriberId="Wm3t1"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Wm3t1"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0135 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0136
     * @tc.name      RequestAddForm_ProxyJsonOf_0136
     * @tc.desc      proxyJsonOf(subscriberId="8hPwqdkpUd3e") returns "[{?"key?":?"weather?",?"subscriberid?":?"8hPwq...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0136 begin`);
      const actual: string = proxyJsonOf('8hPwqdkpUd3e');
      logInfo(`proxyJsonOf(subscriberId="8hPwqdkpUd3e"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"8hPwqdkpUd3e"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0136 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0137
     * @tc.name      RequestAddForm_ProxyJsonOf_0137
     * @tc.desc      proxyJsonOf(subscriberId="KLx") returns "[{?"key?":?"weather?",?"subscriberid?":?"KLx?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0137 begin`);
      const actual: string = proxyJsonOf('KLx');
      logInfo(`proxyJsonOf(subscriberId="KLx"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"KLx"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0137 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0138
     * @tc.name      RequestAddForm_ProxyJsonOf_0138
     * @tc.desc      proxyJsonOf(subscriberId="nuFpW34Nq0") returns "[{?"key?":?"weather?",?"subscriberid?":?"nuFpW34...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0138 begin`);
      const actual: string = proxyJsonOf('nuFpW34Nq0');
      logInfo(`proxyJsonOf(subscriberId="nuFpW34Nq0"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"nuFpW34Nq0"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0138 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0139
     * @tc.name      RequestAddForm_ProxyJsonOf_0139
     * @tc.desc      proxyJsonOf(subscriberId="UQJiatuwT") returns "[{?"key?":?"weather?",?"subscriberid?":?"UQJiatuw...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0139 begin`);
      const actual: string = proxyJsonOf('UQJiatuwT');
      logInfo(`proxyJsonOf(subscriberId="UQJiatuwT"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"UQJiatuwT"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0139 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0140
     * @tc.name      RequestAddForm_ProxyJsonOf_0140
     * @tc.desc      proxyJsonOf(subscriberId="k") returns "[{?"key?":?"weather?",?"subscriberid?":?"k?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0140 begin`);
      const actual: string = proxyJsonOf('k');
      logInfo(`proxyJsonOf(subscriberId="k"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"k"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0140 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0141
     * @tc.name      RequestAddForm_ProxyJsonOf_0141
     * @tc.desc      proxyJsonOf(subscriberId="RbE5rtNRt") returns "[{?"key?":?"weather?",?"subscriberid?":?"RbE5rtNR...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0141 begin`);
      const actual: string = proxyJsonOf('RbE5rtNRt');
      logInfo(`proxyJsonOf(subscriberId="RbE5rtNRt"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"RbE5rtNRt"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0141 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0142
     * @tc.name      RequestAddForm_ProxyJsonOf_0142
     * @tc.desc      proxyJsonOf(subscriberId="tM2aRNeOvzt") returns "[{?"key?":?"weather?",?"subscriberid?":?"tM2aRN...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0142 begin`);
      const actual: string = proxyJsonOf('tM2aRNeOvzt');
      logInfo(`proxyJsonOf(subscriberId="tM2aRNeOvzt"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"tM2aRNeOvzt"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0142 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0143
     * @tc.name      RequestAddForm_ProxyJsonOf_0143
     * @tc.desc      proxyJsonOf(subscriberId="IWidntncn") returns "[{?"key?":?"weather?",?"subscriberid?":?"IWidntnc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0143 begin`);
      const actual: string = proxyJsonOf('IWidntncn');
      logInfo(`proxyJsonOf(subscriberId="IWidntncn"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"IWidntncn"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0143 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0144
     * @tc.name      RequestAddForm_ProxyJsonOf_0144
     * @tc.desc      proxyJsonOf(subscriberId="pokJrjl") returns "[{?"key?":?"weather?",?"subscriberid?":?"pokJrjl?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0144 begin`);
      const actual: string = proxyJsonOf('pokJrjl');
      logInfo(`proxyJsonOf(subscriberId="pokJrjl"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"pokJrjl"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0144 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0145
     * @tc.name      RequestAddForm_ProxyJsonOf_0145
     * @tc.desc      proxyJsonOf(subscriberId="1o5A3myT") returns "[{?"key?":?"weather?",?"subscriberid?":?"1o5A3myT?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0145 begin`);
      const actual: string = proxyJsonOf('1o5A3myT');
      logInfo(`proxyJsonOf(subscriberId="1o5A3myT"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"1o5A3myT"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0145 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0146
     * @tc.name      RequestAddForm_ProxyJsonOf_0146
     * @tc.desc      proxyJsonOf(subscriberId="LENEgjx") returns "[{?"key?":?"weather?",?"subscriberid?":?"LENEgjx?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0146 begin`);
      const actual: string = proxyJsonOf('LENEgjx');
      logInfo(`proxyJsonOf(subscriberId="LENEgjx"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"LENEgjx"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0146 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0147
     * @tc.name      RequestAddForm_ProxyJsonOf_0147
     * @tc.desc      proxyJsonOf(subscriberId="GJKfD") returns "[{?"key?":?"weather?",?"subscriberid?":?"GJKfD?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0147 begin`);
      const actual: string = proxyJsonOf('GJKfD');
      logInfo(`proxyJsonOf(subscriberId="GJKfD"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"GJKfD"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0147 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0148
     * @tc.name      RequestAddForm_ProxyJsonOf_0148
     * @tc.desc      proxyJsonOf(subscriberId="k791k1iLKR") returns "[{?"key?":?"weather?",?"subscriberid?":?"k791k1i...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0148 begin`);
      const actual: string = proxyJsonOf('k791k1iLKR');
      logInfo(`proxyJsonOf(subscriberId="k791k1iLKR"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"k791k1iLKR"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0148 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0149
     * @tc.name      RequestAddForm_ProxyJsonOf_0149
     * @tc.desc      proxyJsonOf(subscriberId="gg") returns "[{?"key?":?"weather?",?"subscriberid?":?"gg?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0149 begin`);
      const actual: string = proxyJsonOf('gg');
      logInfo(`proxyJsonOf(subscriberId="gg"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"gg"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0149 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0150
     * @tc.name      RequestAddForm_ProxyJsonOf_0150
     * @tc.desc      proxyJsonOf(subscriberId="j") returns "[{?"key?":?"weather?",?"subscriberid?":?"j?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0150 begin`);
      const actual: string = proxyJsonOf('j');
      logInfo(`proxyJsonOf(subscriberId="j"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"j"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0150 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0151
     * @tc.name      RequestAddForm_ProxyJsonOf_0151
     * @tc.desc      proxyJsonOf(subscriberId="QvDXaSaA") returns "[{?"key?":?"weather?",?"subscriberid?":?"QvDXaSaA?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0151 begin`);
      const actual: string = proxyJsonOf('QvDXaSaA');
      logInfo(`proxyJsonOf(subscriberId="QvDXaSaA"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"QvDXaSaA"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0151 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0152
     * @tc.name      RequestAddForm_ProxyJsonOf_0152
     * @tc.desc      proxyJsonOf(subscriberId="a2Be6iGF1T") returns "[{?"key?":?"weather?",?"subscriberid?":?"a2Be6iG...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0152 begin`);
      const actual: string = proxyJsonOf('a2Be6iGF1T');
      logInfo(`proxyJsonOf(subscriberId="a2Be6iGF1T"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"a2Be6iGF1T"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0152 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0153
     * @tc.name      RequestAddForm_ProxyJsonOf_0153
     * @tc.desc      proxyJsonOf(subscriberId="GeszNUMbO") returns "[{?"key?":?"weather?",?"subscriberid?":?"GeszNUMb...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0153 begin`);
      const actual: string = proxyJsonOf('GeszNUMbO');
      logInfo(`proxyJsonOf(subscriberId="GeszNUMbO"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"GeszNUMbO"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0153 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0154
     * @tc.name      RequestAddForm_ProxyJsonOf_0154
     * @tc.desc      proxyJsonOf(subscriberId="Y") returns "[{?"key?":?"weather?",?"subscriberid?":?"Y?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0154 begin`);
      const actual: string = proxyJsonOf('Y');
      logInfo(`proxyJsonOf(subscriberId="Y"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Y"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0154 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0155
     * @tc.name      RequestAddForm_ProxyJsonOf_0155
     * @tc.desc      proxyJsonOf(subscriberId="9") returns "[{?"key?":?"weather?",?"subscriberid?":?"9?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0155 begin`);
      const actual: string = proxyJsonOf('9');
      logInfo(`proxyJsonOf(subscriberId="9"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"9"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0155 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0156
     * @tc.name      RequestAddForm_ProxyJsonOf_0156
     * @tc.desc      proxyJsonOf(subscriberId="aW") returns "[{?"key?":?"weather?",?"subscriberid?":?"aW?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0156 begin`);
      const actual: string = proxyJsonOf('aW');
      logInfo(`proxyJsonOf(subscriberId="aW"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"aW"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0156 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0157
     * @tc.name      RequestAddForm_ProxyJsonOf_0157
     * @tc.desc      proxyJsonOf(subscriberId="IPo2VloWhGoV") returns "[{?"key?":?"weather?",?"subscriberid?":?"IPo2V...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0157 begin`);
      const actual: string = proxyJsonOf('IPo2VloWhGoV');
      logInfo(`proxyJsonOf(subscriberId="IPo2VloWhGoV"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"IPo2VloWhGoV"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0157 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0158
     * @tc.name      RequestAddForm_ProxyJsonOf_0158
     * @tc.desc      proxyJsonOf(subscriberId="1WlMh8") returns "[{?"key?":?"weather?",?"subscriberid?":?"1WlMh8?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0158 begin`);
      const actual: string = proxyJsonOf('1WlMh8');
      logInfo(`proxyJsonOf(subscriberId="1WlMh8"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"1WlMh8"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0158 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0159
     * @tc.name      RequestAddForm_ProxyJsonOf_0159
     * @tc.desc      proxyJsonOf(subscriberId="KzSfHemGhy0") returns "[{?"key?":?"weather?",?"subscriberid?":?"KzSfHe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0159 begin`);
      const actual: string = proxyJsonOf('KzSfHemGhy0');
      logInfo(`proxyJsonOf(subscriberId="KzSfHemGhy0"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"KzSfHemGhy0"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0159 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0160
     * @tc.name      RequestAddForm_ProxyJsonOf_0160
     * @tc.desc      proxyJsonOf(subscriberId="rmRsr") returns "[{?"key?":?"weather?",?"subscriberid?":?"rmRsr?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0160 begin`);
      const actual: string = proxyJsonOf('rmRsr');
      logInfo(`proxyJsonOf(subscriberId="rmRsr"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"rmRsr"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0160 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0161
     * @tc.name      RequestAddForm_ProxyJsonOf_0161
     * @tc.desc      proxyJsonOf(subscriberId="4viqggA") returns "[{?"key?":?"weather?",?"subscriberid?":?"4viqggA?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0161 begin`);
      const actual: string = proxyJsonOf('4viqggA');
      logInfo(`proxyJsonOf(subscriberId="4viqggA"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"4viqggA"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0161 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0162
     * @tc.name      RequestAddForm_ProxyJsonOf_0162
     * @tc.desc      proxyJsonOf(subscriberId="L4iq45Z3amgK") returns "[{?"key?":?"weather?",?"subscriberid?":?"L4iq4...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0162 begin`);
      const actual: string = proxyJsonOf('L4iq45Z3amgK');
      logInfo(`proxyJsonOf(subscriberId="L4iq45Z3amgK"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"L4iq45Z3amgK"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0162 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0163
     * @tc.name      RequestAddForm_ProxyJsonOf_0163
     * @tc.desc      proxyJsonOf(subscriberId="xYpT5xpP") returns "[{?"key?":?"weather?",?"subscriberid?":?"xYpT5xpP?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0163 begin`);
      const actual: string = proxyJsonOf('xYpT5xpP');
      logInfo(`proxyJsonOf(subscriberId="xYpT5xpP"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"xYpT5xpP"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0163 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0164
     * @tc.name      RequestAddForm_ProxyJsonOf_0164
     * @tc.desc      proxyJsonOf(subscriberId="ErCLAxA") returns "[{?"key?":?"weather?",?"subscriberid?":?"ErCLAxA?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0164 begin`);
      const actual: string = proxyJsonOf('ErCLAxA');
      logInfo(`proxyJsonOf(subscriberId="ErCLAxA"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"ErCLAxA"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0164 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0165
     * @tc.name      RequestAddForm_ProxyJsonOf_0165
     * @tc.desc      proxyJsonOf(subscriberId="UseY8x4ZBoHg") returns "[{?"key?":?"weather?",?"subscriberid?":?"UseY8...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0165 begin`);
      const actual: string = proxyJsonOf('UseY8x4ZBoHg');
      logInfo(`proxyJsonOf(subscriberId="UseY8x4ZBoHg"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"UseY8x4ZBoHg"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0165 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0166
     * @tc.name      RequestAddForm_ProxyJsonOf_0166
     * @tc.desc      proxyJsonOf(subscriberId="Z8YsUZf") returns "[{?"key?":?"weather?",?"subscriberid?":?"Z8YsUZf?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0166 begin`);
      const actual: string = proxyJsonOf('Z8YsUZf');
      logInfo(`proxyJsonOf(subscriberId="Z8YsUZf"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Z8YsUZf"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0166 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0167
     * @tc.name      RequestAddForm_ProxyJsonOf_0167
     * @tc.desc      proxyJsonOf(subscriberId="pzmKHS") returns "[{?"key?":?"weather?",?"subscriberid?":?"pzmKHS?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0167 begin`);
      const actual: string = proxyJsonOf('pzmKHS');
      logInfo(`proxyJsonOf(subscriberId="pzmKHS"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"pzmKHS"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0167 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0168
     * @tc.name      RequestAddForm_ProxyJsonOf_0168
     * @tc.desc      proxyJsonOf(subscriberId="3C") returns "[{?"key?":?"weather?",?"subscriberid?":?"3C?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0168 begin`);
      const actual: string = proxyJsonOf('3C');
      logInfo(`proxyJsonOf(subscriberId="3C"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"3C"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0168 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0169
     * @tc.name      RequestAddForm_ProxyJsonOf_0169
     * @tc.desc      proxyJsonOf(subscriberId="BdkYE8bEl") returns "[{?"key?":?"weather?",?"subscriberid?":?"BdkYE8bE...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0169 begin`);
      const actual: string = proxyJsonOf('BdkYE8bEl');
      logInfo(`proxyJsonOf(subscriberId="BdkYE8bEl"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"BdkYE8bEl"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0169 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0170
     * @tc.name      RequestAddForm_ProxyJsonOf_0170
     * @tc.desc      proxyJsonOf(subscriberId="CqP26yO") returns "[{?"key?":?"weather?",?"subscriberid?":?"CqP26yO?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0170 begin`);
      const actual: string = proxyJsonOf('CqP26yO');
      logInfo(`proxyJsonOf(subscriberId="CqP26yO"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"CqP26yO"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0170 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0171
     * @tc.name      RequestAddForm_ProxyJsonOf_0171
     * @tc.desc      proxyJsonOf(subscriberId="j3E") returns "[{?"key?":?"weather?",?"subscriberid?":?"j3E?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0171 begin`);
      const actual: string = proxyJsonOf('j3E');
      logInfo(`proxyJsonOf(subscriberId="j3E"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"j3E"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0171 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0172
     * @tc.name      RequestAddForm_ProxyJsonOf_0172
     * @tc.desc      proxyJsonOf(subscriberId="L2lUeeZgAPnt") returns "[{?"key?":?"weather?",?"subscriberid?":?"L2lUe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0172 begin`);
      const actual: string = proxyJsonOf('L2lUeeZgAPnt');
      logInfo(`proxyJsonOf(subscriberId="L2lUeeZgAPnt"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"L2lUeeZgAPnt"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0172 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0173
     * @tc.name      RequestAddForm_ProxyJsonOf_0173
     * @tc.desc      proxyJsonOf(subscriberId="i9zOtIZdw") returns "[{?"key?":?"weather?",?"subscriberid?":?"i9zOtIZd...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0173 begin`);
      const actual: string = proxyJsonOf('i9zOtIZdw');
      logInfo(`proxyJsonOf(subscriberId="i9zOtIZdw"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"i9zOtIZdw"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0173 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0174
     * @tc.name      RequestAddForm_ProxyJsonOf_0174
     * @tc.desc      proxyJsonOf(subscriberId="Jmvo") returns "[{?"key?":?"weather?",?"subscriberid?":?"Jmvo?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0174 begin`);
      const actual: string = proxyJsonOf('Jmvo');
      logInfo(`proxyJsonOf(subscriberId="Jmvo"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Jmvo"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0174 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0175
     * @tc.name      RequestAddForm_ProxyJsonOf_0175
     * @tc.desc      proxyJsonOf(subscriberId="A1e1t") returns "[{?"key?":?"weather?",?"subscriberid?":?"A1e1t?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0175 begin`);
      const actual: string = proxyJsonOf('A1e1t');
      logInfo(`proxyJsonOf(subscriberId="A1e1t"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"A1e1t"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0175 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0176
     * @tc.name      RequestAddForm_ProxyJsonOf_0176
     * @tc.desc      proxyJsonOf(subscriberId="EUX") returns "[{?"key?":?"weather?",?"subscriberid?":?"EUX?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0176 begin`);
      const actual: string = proxyJsonOf('EUX');
      logInfo(`proxyJsonOf(subscriberId="EUX"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"EUX"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0176 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0177
     * @tc.name      RequestAddForm_ProxyJsonOf_0177
     * @tc.desc      proxyJsonOf(subscriberId="lWgYt5ml5Q2") returns "[{?"key?":?"weather?",?"subscriberid?":?"lWgYt5...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0177 begin`);
      const actual: string = proxyJsonOf('lWgYt5ml5Q2');
      logInfo(`proxyJsonOf(subscriberId="lWgYt5ml5Q2"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"lWgYt5ml5Q2"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0177 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0178
     * @tc.name      RequestAddForm_ProxyJsonOf_0178
     * @tc.desc      proxyJsonOf(subscriberId="dmnA") returns "[{?"key?":?"weather?",?"subscriberid?":?"dmnA?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0178 begin`);
      const actual: string = proxyJsonOf('dmnA');
      logInfo(`proxyJsonOf(subscriberId="dmnA"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"dmnA"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0178 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0179
     * @tc.name      RequestAddForm_ProxyJsonOf_0179
     * @tc.desc      proxyJsonOf(subscriberId="c") returns "[{?"key?":?"weather?",?"subscriberid?":?"c?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0179 begin`);
      const actual: string = proxyJsonOf('c');
      logInfo(`proxyJsonOf(subscriberId="c"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"c"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0179 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_PROXY_JSON_OF_0180
     * @tc.name      RequestAddForm_ProxyJsonOf_0180
     * @tc.desc      proxyJsonOf(subscriberId="Prxf") returns "[{?"key?":?"weather?",?"subscriberid?":?"Prxf?"}]"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_ProxyJsonOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ProxyJsonOf_0180 begin`);
      const actual: string = proxyJsonOf('Prxf');
      logInfo(`proxyJsonOf(subscriberId="Prxf"): actual=${actual}`);
      expect(actual).assertEqual('[{"key":"weather","subscriberid":"Prxf"}]');
      logInfo(`${BUNDLE}ProxyJsonOf_0180 end`);
    });
  });
}
