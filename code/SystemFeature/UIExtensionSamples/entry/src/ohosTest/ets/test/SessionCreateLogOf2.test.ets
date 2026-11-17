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
import { sessionCreateLogOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for sessionCreateLogOf (77 cases). */
export default function sessionCreateLogOf2Test(): void {
  describe('SessionCreateLogOf2Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0078
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0078
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="   ") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0078 begin`);
      const actual: string = sessionCreateLogOf('hello world', '   ');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(149);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(117)=${actual.substring(117)}`);
      expect(actual.substring(117)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0078 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0079
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0079
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="  ") returns "uiExtensionType?":?"sys/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0079 begin`);
      const actual: string = sessionCreateLogOf('hello world', '  ');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(148);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(116)=${actual.substring(116)}`);
      expect(actual.substring(116)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0079 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0080
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0080
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName=" _1") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0080 begin`);
      const actual: string = sessionCreateLogOf('hello world', ' _1');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(149);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(117)=${actual.substring(117)}`);
      expect(actual.substring(117)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0080 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0081
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0081
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="x ") returns "uiExtensionType?":?"sys/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0081 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'x ');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(148);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(116)=${actual.substring(116)}`);
      expect(actual.substring(116)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0081 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0082
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0082
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName=" A ") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0082 begin`);
      const actual: string = sessionCreateLogOf('hello world', ' A ');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(149);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(117)=${actual.substring(117)}`);
      expect(actual.substring(117)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0082 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0083
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0083
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="hello world") returns "uiExtensionType?":?"sys/co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0083 begin`);
      const actual: string = sessionCreateLogOf('', 'hello world');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(135);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(103)=${actual.substring(103)}`);
      expect(actual.substring(103)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0083 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0084
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0084
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="A") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0084 begin`);
      const actual: string = sessionCreateLogOf('', 'A');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(125);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(93)=${actual.substring(93)}`);
      expect(actual.substring(93)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0084 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0085
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0085
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="Sample Title 123") returns "uiExtensionType?":?"s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0085 begin`);
      const actual: string = sessionCreateLogOf('', 'Sample Title 123');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(140);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(108)=${actual.substring(108)}`);
      expect(actual.substring(108)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0085 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0086
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0086
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="a") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0086 begin`);
      const actual: string = sessionCreateLogOf('', 'a');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(125);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(93)=${actual.substring(93)}`);
      expect(actual.substring(93)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0086 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0087
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0087
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="Hello World") returns "uiExtensionType?":?"sys/co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0087 begin`);
      const actual: string = sessionCreateLogOf('', 'Hello World');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(135);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(103)=${actual.substring(103)}`);
      expect(actual.substring(103)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0087 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0088
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0088
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="123") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0088 begin`);
      const actual: string = sessionCreateLogOf('', '123');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0088 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0089
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0089
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="HelloHello") returns "uiExtensionType?":?"sys/com...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0089 begin`);
      const actual: string = sessionCreateLogOf('', 'HelloHello');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(134);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(102)=${actual.substring(102)}`);
      expect(actual.substring(102)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0089 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0090
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0090
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="Hello_1") returns "uiExtensionType?":?"sys/common...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0090 begin`);
      const actual: string = sessionCreateLogOf('', 'Hello_1');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0090 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0091
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0091
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName=" hello world ") returns "uiExtensionType?":?"sys/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0091 begin`);
      const actual: string = sessionCreateLogOf('', ' hello world ');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0091 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0092
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0092
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="hello worldhello world") returns "uiExtensionType...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0092 begin`);
      const actual: string = sessionCreateLogOf('', 'hello worldhello world');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(146);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(114)=${actual.substring(114)}`);
      expect(actual.substring(114)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0092 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0093
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0093
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="hello world_1") returns "uiExtensionType?":?"sys/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0093 begin`);
      const actual: string = sessionCreateLogOf('', 'hello world_1');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0093 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0094
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0094
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="xhello world") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0094 begin`);
      const actual: string = sessionCreateLogOf('', 'xhello world');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(136);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(104)=${actual.substring(104)}`);
      expect(actual.substring(104)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0094 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0095
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0095
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="   ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0095 begin`);
      const actual: string = sessionCreateLogOf('', '   ');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0095 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0096
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0096
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="  ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0096 begin`);
      const actual: string = sessionCreateLogOf('', '  ');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(126);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(94)=${actual.substring(94)}`);
      expect(actual.substring(94)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0096 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0097
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0097
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName=" _1") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0097 begin`);
      const actual: string = sessionCreateLogOf('', ' _1');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0097 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0098
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0098
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="x ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0098 begin`);
      const actual: string = sessionCreateLogOf('', 'x ');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(126);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(94)=${actual.substring(94)}`);
      expect(actual.substring(94)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0098 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0099
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0099
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName=" A ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0099 begin`);
      const actual: string = sessionCreateLogOf('', ' A ');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0099 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0100
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0100
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="Hello") returns "uiExtensionType?":?"sys/commonU...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0100 begin`);
      const actual: string = sessionCreateLogOf(' ', 'Hello');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0100 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0101
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0101
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="hello world") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0101 begin`);
      const actual: string = sessionCreateLogOf(' ', 'hello world');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0101 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0102
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0102
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0102 begin`);
      const actual: string = sessionCreateLogOf(' ', '');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(126);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(94)=${actual.substring(94)}`);
      expect(actual.substring(94)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0102 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0103
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0103
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName=" ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0103 begin`);
      const actual: string = sessionCreateLogOf(' ', ' ');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0103 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0104
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0104
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="A") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0104 begin`);
      const actual: string = sessionCreateLogOf(' ', 'A');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0104 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0105
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0105
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="a") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0105 begin`);
      const actual: string = sessionCreateLogOf(' ', 'a');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0105 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0106
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0106
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="abc") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0106 begin`);
      const actual: string = sessionCreateLogOf(' ', 'abc');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0106 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0107
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0107
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="Hello World") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0107 begin`);
      const actual: string = sessionCreateLogOf(' ', 'Hello World');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0107 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0108
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0108
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="123") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0108 begin`);
      const actual: string = sessionCreateLogOf(' ', '123');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0108 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0109
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0109
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="HelloHello") returns "uiExtensionType?":?"sys/co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0109 begin`);
      const actual: string = sessionCreateLogOf(' ', 'HelloHello');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(136);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(104)=${actual.substring(104)}`);
      expect(actual.substring(104)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0109 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0110
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0110
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="Hello_1") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0110 begin`);
      const actual: string = sessionCreateLogOf(' ', 'Hello_1');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(133);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(101)=${actual.substring(101)}`);
      expect(actual.substring(101)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0110 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0111
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0111
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName=" hello world ") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0111 begin`);
      const actual: string = sessionCreateLogOf(' ', ' hello world ');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(139);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(107)=${actual.substring(107)}`);
      expect(actual.substring(107)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0111 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0112
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0112
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="hello worldhello world") returns "uiExtensionTyp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0112 begin`);
      const actual: string = sessionCreateLogOf(' ', 'hello worldhello world');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(148);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(116)=${actual.substring(116)}`);
      expect(actual.substring(116)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0112 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0113
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0113
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="hello world_1") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0113 begin`);
      const actual: string = sessionCreateLogOf(' ', 'hello world_1');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(139);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(107)=${actual.substring(107)}`);
      expect(actual.substring(107)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0113 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0114
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0114
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="   ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0114 begin`);
      const actual: string = sessionCreateLogOf(' ', '   ');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0114 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0115
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0115
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="  ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0115 begin`);
      const actual: string = sessionCreateLogOf(' ', '  ');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(128);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(96)=${actual.substring(96)}`);
      expect(actual.substring(96)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0115 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0116
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0116
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName=" _1") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0116 begin`);
      const actual: string = sessionCreateLogOf(' ', ' _1');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0116 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0117
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0117
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="x ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0117 begin`);
      const actual: string = sessionCreateLogOf(' ', 'x ');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(128);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(96)=${actual.substring(96)}`);
      expect(actual.substring(96)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0117 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0118
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0118
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName=" A ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0118 begin`);
      const actual: string = sessionCreateLogOf(' ', ' A ');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0118 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0119
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0119
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="Hello") returns "uiExtensionType?":?"sys/commonU...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0119 begin`);
      const actual: string = sessionCreateLogOf('A', 'Hello');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0119 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0120
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0120
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="hello world") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0120 begin`);
      const actual: string = sessionCreateLogOf('A', 'hello world');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0120 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0121
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0121
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0121 begin`);
      const actual: string = sessionCreateLogOf('A', '');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(126);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(94)=${actual.substring(94)}`);
      expect(actual.substring(94)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0121 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0122
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0122
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName=" ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0122 begin`);
      const actual: string = sessionCreateLogOf('A', ' ');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0122 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0123
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0123
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="A") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0123 begin`);
      const actual: string = sessionCreateLogOf('A', 'A');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0123 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0124
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0124
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="Sample Title 123") returns "uiExtensionType?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0124 begin`);
      const actual: string = sessionCreateLogOf('A', 'Sample Title 123');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(142);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(110)=${actual.substring(110)}`);
      expect(actual.substring(110)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0124 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0125
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0125
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="??") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0125 begin`);
      const actual: string = sessionCreateLogOf('A', '\u4e2d\u6587');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(128);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(96)=${actual.substring(96)}`);
      expect(actual.substring(96)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0125 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0126
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0126
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="a") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0126 begin`);
      const actual: string = sessionCreateLogOf('A', 'a');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0126 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0127
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0127
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="abc") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0127 begin`);
      const actual: string = sessionCreateLogOf('A', 'abc');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0127 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0128
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0128
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="Hello World") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0128 begin`);
      const actual: string = sessionCreateLogOf('A', 'Hello World');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0128 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0129
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0129
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="123") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0129 begin`);
      const actual: string = sessionCreateLogOf('A', '123');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0129 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0130
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0130
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName=" Hello ") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0130 begin`);
      const actual: string = sessionCreateLogOf('A', ' Hello ');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(133);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(101)=${actual.substring(101)}`);
      expect(actual.substring(101)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0130 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0131
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0131
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="HelloHello") returns "uiExtensionType?":?"sys/co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0131 begin`);
      const actual: string = sessionCreateLogOf('A', 'HelloHello');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(136);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(104)=${actual.substring(104)}`);
      expect(actual.substring(104)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0131 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0132
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0132
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="Hello_1") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0132 begin`);
      const actual: string = sessionCreateLogOf('A', 'Hello_1');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(133);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(101)=${actual.substring(101)}`);
      expect(actual.substring(101)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0132 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0133
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0133
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="xHello") returns "uiExtensionType?":?"sys/common...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0133 begin`);
      const actual: string = sessionCreateLogOf('A', 'xHello');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(132);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(100)=${actual.substring(100)}`);
      expect(actual.substring(100)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0133 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0134
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0134
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName=" hello world ") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0134 begin`);
      const actual: string = sessionCreateLogOf('A', ' hello world ');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(139);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(107)=${actual.substring(107)}`);
      expect(actual.substring(107)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0134 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0135
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0135
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="hello worldhello world") returns "uiExtensionTyp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0135 begin`);
      const actual: string = sessionCreateLogOf('A', 'hello worldhello world');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(148);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(116)=${actual.substring(116)}`);
      expect(actual.substring(116)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0135 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0136
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0136
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="hello world_1") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0136 begin`);
      const actual: string = sessionCreateLogOf('A', 'hello world_1');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(139);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(107)=${actual.substring(107)}`);
      expect(actual.substring(107)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0136 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0137
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0137
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="xhello world") returns "uiExtensionType?":?"sys/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0137 begin`);
      const actual: string = sessionCreateLogOf('A', 'xhello world');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(138);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(106)=${actual.substring(106)}`);
      expect(actual.substring(106)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0137 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0138
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0138
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="   ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0138 begin`);
      const actual: string = sessionCreateLogOf('A', '   ');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0138 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0139
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0139
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="  ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0139 begin`);
      const actual: string = sessionCreateLogOf('A', '  ');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(128);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(96)=${actual.substring(96)}`);
      expect(actual.substring(96)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0139 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0140
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0140
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName=" _1") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0140 begin`);
      const actual: string = sessionCreateLogOf('A', ' _1');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0140 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0141
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0141
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName="x ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0141 begin`);
      const actual: string = sessionCreateLogOf('A', 'x ');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(128);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(96)=${actual.substring(96)}`);
      expect(actual.substring(96)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0141 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0142
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0142
     * @tc.desc      sessionCreateLogOf(bundleName="A", abilityName=" A ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0142 begin`);
      const actual: string = sessionCreateLogOf('A', ' A ');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="A", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0142 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0143
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0143
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="") returns "uiExtensionType?":?"s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0143 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', '');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(156);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(124)=${actual.substring(124)}`);
      expect(actual.substring(124)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0143 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0144
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0144
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName=" ") returns "uiExtensionType?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0144 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', ' ');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(157);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(125)=${actual.substring(125)}`);
      expect(actual.substring(125)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0144 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0145
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0145
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="A") returns "uiExtensionType?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0145 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'A');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(157);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(125)=${actual.substring(125)}`);
      expect(actual.substring(125)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0145 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0146
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0146
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="??") returns "uiExtensionType?":?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0146 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', '\u4e2d\u6587');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(158);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(126)=${actual.substring(126)}`);
      expect(actual.substring(126)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0146 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0147
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0147
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="a") returns "uiExtensionType?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0147 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'a');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(157);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(125)=${actual.substring(125)}`);
      expect(actual.substring(125)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0147 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0148
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0148
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="abc") returns "uiExtensionType?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0148 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'abc');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(159);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(127)=${actual.substring(127)}`);
      expect(actual.substring(127)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0148 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0149
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0149
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="Hello World") returns "uiExtensio...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0149 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'Hello World');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(167);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(135)=${actual.substring(135)}`);
      expect(actual.substring(135)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0149 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0150
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0150
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="123") returns "uiExtensionType?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0150 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', '123');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(159);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(127)=${actual.substring(127)}`);
      expect(actual.substring(127)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0150 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0151
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0151
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="Hello_1") returns "uiExtensionTyp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0151 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'Hello_1');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(163);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(131)=${actual.substring(131)}`);
      expect(actual.substring(131)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0151 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0152
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0152
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="xHello") returns "uiExtensionType...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0152 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'xHello');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(162);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(130)=${actual.substring(130)}`);
      expect(actual.substring(130)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0152 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0153
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0153
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="hello world_1") returns "uiExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0153 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'hello world_1');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0153 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0154
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0154
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="xhello world") returns "uiExtensi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0154 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'xhello world');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(168);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(136)=${actual.substring(136)}`);
      expect(actual.substring(136)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0154 end`);
    });
  });
}
