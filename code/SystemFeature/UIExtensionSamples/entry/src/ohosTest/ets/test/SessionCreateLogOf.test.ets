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
export default function sessionCreateLogOfTest(): void {
  describe('SessionCreateLogOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0001
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0001
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="Hello") returns "uiExtensionType?":?"sys/com...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_SessionCreateLogOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0001 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'Hello');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(139);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(107)=${actual.substring(107)}`);
      expect(actual.substring(107)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0002
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0002
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="hello world") returns "uiExtensionType?":?"s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_SessionCreateLogOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0002 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'hello world');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(145);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(113)=${actual.substring(113)}`);
      expect(actual.substring(113)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0003
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0003
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="") returns "uiExtensionType?":?"sys/commonUI...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0003 begin`);
      const actual: string = sessionCreateLogOf('Hello', '');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(134);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(102)=${actual.substring(102)}`);
      expect(actual.substring(102)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0004
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0004
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName=" ") returns "uiExtensionType?":?"sys/commonU...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0004 begin`);
      const actual: string = sessionCreateLogOf('Hello', ' ');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(135);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(103)=${actual.substring(103)}`);
      expect(actual.substring(103)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0005
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0005
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="Sample Title 123") returns "uiExtensionType?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0005 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'Sample Title 123');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(150);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(118)=${actual.substring(118)}`);
      expect(actual.substring(118)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0006
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0006
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="??") returns "uiExtensionType?":?"sys/common...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0006 begin`);
      const actual: string = sessionCreateLogOf('Hello', '\u4e2d\u6587');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(136);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(104)=${actual.substring(104)}`);
      expect(actual.substring(104)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0007
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0007
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="abc") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0007 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'abc');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0008
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0008
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName=" Hello ") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0008 begin`);
      const actual: string = sessionCreateLogOf('Hello', ' Hello ');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(141);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(109)=${actual.substring(109)}`);
      expect(actual.substring(109)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0009
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0009
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="HelloHello") returns "uiExtensionType?":?"sy...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0009 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'HelloHello');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(144);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(112)=${actual.substring(112)}`);
      expect(actual.substring(112)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0010
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0010
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="xHello") returns "uiExtensionType?":?"sys/co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0010 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'xHello');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(140);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(108)=${actual.substring(108)}`);
      expect(actual.substring(108)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0011
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0011
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName=" hello world ") returns "uiExtensionType?":?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0011 begin`);
      const actual: string = sessionCreateLogOf('Hello', ' hello world ');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(147);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(115)=${actual.substring(115)}`);
      expect(actual.substring(115)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0012
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0012
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="hello worldhello world") returns "uiExtensio...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0012 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'hello worldhello world');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(156);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(124)=${actual.substring(124)}`);
      expect(actual.substring(124)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0013
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0013
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="xhello world") returns "uiExtensionType?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0013 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'xhello world');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(146);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(114)=${actual.substring(114)}`);
      expect(actual.substring(114)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0014
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0014
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="Hello") returns "uiExtensionType?":?"s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0014 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'Hello');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(151);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(119)=${actual.substring(119)}`);
      expect(actual.substring(119)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0015
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0015
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="hello world") returns "uiExtensionType...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0015 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'hello world');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(157);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(125)=${actual.substring(125)}`);
      expect(actual.substring(125)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0016
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0016
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="Sample Title 123") returns "uiExtensio...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0016 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'Sample Title 123');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(162);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(130)=${actual.substring(130)}`);
      expect(actual.substring(130)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0017
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0017
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="??") returns "uiExtensionType?":?"sys/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0017 begin`);
      const actual: string = sessionCreateLogOf('hello world', '\u4e2d\u6587');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(148);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(116)=${actual.substring(116)}`);
      expect(actual.substring(116)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0018
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0018
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="abc") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0018 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'abc');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(149);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(117)=${actual.substring(117)}`);
      expect(actual.substring(117)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0019
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0019
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName=" Hello ") returns "uiExtensionType?":?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0019 begin`);
      const actual: string = sessionCreateLogOf('hello world', ' Hello ');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(153);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(121)=${actual.substring(121)}`);
      expect(actual.substring(121)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0020
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0020
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="xHello") returns "uiExtensionType?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0020 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'xHello');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(152);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(120)=${actual.substring(120)}`);
      expect(actual.substring(120)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0021
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0021
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName=" hello world ") returns "uiExtensionTy...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0021 begin`);
      const actual: string = sessionCreateLogOf('hello world', ' hello world ');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(159);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(127)=${actual.substring(127)}`);
      expect(actual.substring(127)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0022
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0022
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="hello worldhello world") returns "uiEx...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0022 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'hello worldhello world');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(168);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(136)=${actual.substring(136)}`);
      expect(actual.substring(136)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0023
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0023
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="xhello world") returns "uiExtensionTyp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0023 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'xhello world');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(158);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(126)=${actual.substring(126)}`);
      expect(actual.substring(126)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0024
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0024
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="Hello") returns "uiExtensionType?":?"sys/commonUI...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0024 begin`);
      const actual: string = sessionCreateLogOf('', 'Hello');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0025
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0025
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0025 begin`);
      const actual: string = sessionCreateLogOf('', '');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(124);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(92)=${actual.substring(92)}`);
      expect(actual.substring(92)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0026
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0026
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName=" ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0026 begin`);
      const actual: string = sessionCreateLogOf('', ' ');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(125);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(93)=${actual.substring(93)}`);
      expect(actual.substring(93)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0027
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0027
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="??") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0027 begin`);
      const actual: string = sessionCreateLogOf('', '\u4e2d\u6587');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(126);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(94)=${actual.substring(94)}`);
      expect(actual.substring(94)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0028
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0028
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="abc") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0028 begin`);
      const actual: string = sessionCreateLogOf('', 'abc');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0029
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0029
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName=" Hello ") returns "uiExtensionType?":?"sys/common...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0029 begin`);
      const actual: string = sessionCreateLogOf('', ' Hello ');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0030
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0030
     * @tc.desc      sessionCreateLogOf(bundleName="", abilityName="xHello") returns "uiExtensionType?":?"sys/commonU...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0030 begin`);
      const actual: string = sessionCreateLogOf('', 'xHello');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(130);
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="", ability...: actual.substring(98)=${actual.substring(98)}`);
      expect(actual.substring(98)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0031
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0031
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="Sample Title 123") returns "uiExtensionType?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0031 begin`);
      const actual: string = sessionCreateLogOf(' ', 'Sample Title 123');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(142);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(110)=${actual.substring(110)}`);
      expect(actual.substring(110)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0032
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0032
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="??") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0032 begin`);
      const actual: string = sessionCreateLogOf(' ', '\u4e2d\u6587');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(128);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(96)=${actual.substring(96)}`);
      expect(actual.substring(96)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0033
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0033
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName=" Hello ") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0033 begin`);
      const actual: string = sessionCreateLogOf(' ', ' Hello ');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(133);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(101)=${actual.substring(101)}`);
      expect(actual.substring(101)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0034
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0034
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="xHello") returns "uiExtensionType?":?"sys/common...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0034 begin`);
      const actual: string = sessionCreateLogOf(' ', 'xHello');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(132);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(100)=${actual.substring(100)}`);
      expect(actual.substring(100)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0035
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0035
     * @tc.desc      sessionCreateLogOf(bundleName=" ", abilityName="xhello world") returns "uiExtensionType?":?"sys/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0035 begin`);
      const actual: string = sessionCreateLogOf(' ', 'xhello world');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(138);
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" ", abilit...: actual.substring(106)=${actual.substring(106)}`);
      expect(actual.substring(106)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0036
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0036
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="Hello") returns "uiExtensionType?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0036 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'Hello');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(161);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(129)=${actual.substring(129)}`);
      expect(actual.substring(129)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0036 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0037
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0037
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="hello world") returns "uiExtensio...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0037 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'hello world');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(167);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(135)=${actual.substring(135)}`);
      expect(actual.substring(135)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0037 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0038
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0038
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="Sample Title 123") returns "uiExt...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0038 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'Sample Title 123');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(172);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(140)=${actual.substring(140)}`);
      expect(actual.substring(140)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0038 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0039
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0039
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName=" Hello ") returns "uiExtensionTyp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0039 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', ' Hello ');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(163);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(131)=${actual.substring(131)}`);
      expect(actual.substring(131)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0039 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0040
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0040
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="HelloHello") returns "uiExtension...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0040 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'HelloHello');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(166);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(134)=${actual.substring(134)}`);
      expect(actual.substring(134)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0040 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0041
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0041
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName=" hello world ") returns "uiExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0041 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', ' hello world ');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(169);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(137)=${actual.substring(137)}`);
      expect(actual.substring(137)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0041 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0042
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0042
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="hello worldhello world") returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0042 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'hello worldhello world');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(178);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(146)=${actual.substring(146)}`);
      expect(actual.substring(146)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0042 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0043
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0043
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName=" hello world ") returns "uiExtensionType?":?"s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0043 begin`);
      const actual: string = sessionCreateLogOf('abc', ' hello world ');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(143);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(111)=${actual.substring(111)}`);
      expect(actual.substring(111)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0043 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0044
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0044
     * @tc.desc      sessionCreateLogOf(bundleName=" Hello ", abilityName="Sample Title 123") returns "uiExtensionTyp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0044 begin`);
      const actual: string = sessionCreateLogOf(' Hello ', 'Sample Title 123');
      logInfo(`sessionCreateLogOf(bundleName=" Hello ", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(154);
      logInfo(`sessionCreateLogOf(bundleName=" Hello ", ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" Hello ", ...: actual.substring(122)=${actual.substring(122)}`);
      expect(actual.substring(122)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0044 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0045
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0045
     * @tc.desc      sessionCreateLogOf(bundleName=" Hello ", abilityName="hello worldhello world") returns "uiExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0045 begin`);
      const actual: string = sessionCreateLogOf(' Hello ', 'hello worldhello world');
      logInfo(`sessionCreateLogOf(bundleName=" Hello ", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(160);
      logInfo(`sessionCreateLogOf(bundleName=" Hello ", ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName=" Hello ", ...: actual.substring(128)=${actual.substring(128)}`);
      expect(actual.substring(128)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0045 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0046
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0046
     * @tc.desc      sessionCreateLogOf(bundleName="HelloHello", abilityName="hello world") returns "uiExtensionType?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0046 begin`);
      const actual: string = sessionCreateLogOf('HelloHello', 'hello world');
      logInfo(`sessionCreateLogOf(bundleName="HelloHello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(155);
      logInfo(`sessionCreateLogOf(bundleName="HelloHello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="HelloHello...: actual.substring(123)=${actual.substring(123)}`);
      expect(actual.substring(123)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0046 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0047
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0047
     * @tc.desc      sessionCreateLogOf(bundleName="hello worldhello world", abilityName="Hello") returns "uiExtensio...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0047 begin`);
      const actual: string = sessionCreateLogOf('hello worldhello world', 'Hello');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(173);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(141)=${actual.substring(141)}`);
      expect(actual.substring(141)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0047 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0048
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0048
     * @tc.desc      sessionCreateLogOf(bundleName="hello worldhello world", abilityName="hello world") returns "uiEx...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0048 begin`);
      const actual: string = sessionCreateLogOf('hello worldhello world', 'hello world');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(179);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(147)=${actual.substring(147)}`);
      expect(actual.substring(147)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0048 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0049
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0049
     * @tc.desc      sessionCreateLogOf(bundleName="hello worldhello world", abilityName="Sample Title 123") returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0049 begin`);
      const actual: string = sessionCreateLogOf('hello worldhello world', 'Sample Title 123');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(184);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(152)=${actual.substring(152)}`);
      expect(actual.substring(152)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0049 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0050
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0050
     * @tc.desc      sessionCreateLogOf(bundleName="hello worldhello world", abilityName="??") returns "uiExtensionTy...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0050 begin`);
      const actual: string = sessionCreateLogOf('hello worldhello world', '\u4e2d\u6587');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(170);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(138)=${actual.substring(138)}`);
      expect(actual.substring(138)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0050 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0051
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0051
     * @tc.desc      sessionCreateLogOf(bundleName="hello worldhello world", abilityName="abc") returns "uiExtensionT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0051 begin`);
      const actual: string = sessionCreateLogOf('hello worldhello world', 'abc');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(171);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(139)=${actual.substring(139)}`);
      expect(actual.substring(139)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0051 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0052
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0052
     * @tc.desc      sessionCreateLogOf(bundleName="hello worldhello world", abilityName=" Hello ") returns "uiExtens...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0052 begin`);
      const actual: string = sessionCreateLogOf('hello worldhello world', ' Hello ');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(175);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(143)=${actual.substring(143)}`);
      expect(actual.substring(143)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0052 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0053
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0053
     * @tc.desc      sessionCreateLogOf(bundleName="hello worldhello world", abilityName="xHello") returns "uiExtensi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0053 begin`);
      const actual: string = sessionCreateLogOf('hello worldhello world', 'xHello');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(174);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(142)=${actual.substring(142)}`);
      expect(actual.substring(142)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0053 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0054
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0054
     * @tc.desc      sessionCreateLogOf(bundleName="hello worldhello world", abilityName=" hello world ") returns "ui...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0054 begin`);
      const actual: string = sessionCreateLogOf('hello worldhello world', ' hello world ');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(181);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(149)=${actual.substring(149)}`);
      expect(actual.substring(149)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0054 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0055
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0055
     * @tc.desc      sessionCreateLogOf(bundleName="hello worldhello world", abilityName="hello worldhello world") re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0055 begin`);
      const actual: string = sessionCreateLogOf('hello worldhello world', 'hello worldhello world');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(190);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(158)=${actual.substring(158)}`);
      expect(actual.substring(158)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0055 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0056
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0056
     * @tc.desc      sessionCreateLogOf(bundleName="hello worldhello world", abilityName="xhello world") returns "uiE...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0056 begin`);
      const actual: string = sessionCreateLogOf('hello worldhello world', 'xhello world');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(180);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(148)=${actual.substring(148)}`);
      expect(actual.substring(148)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0056 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0057
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0057
     * @tc.desc      sessionCreateLogOf(bundleName="xhello world", abilityName="Sample Title 123") returns "uiExtensi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0057 begin`);
      const actual: string = sessionCreateLogOf('xhello world', 'Sample Title 123');
      logInfo(`sessionCreateLogOf(bundleName="xhello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(164);
      logInfo(`sessionCreateLogOf(bundleName="xhello wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="xhello wor...: actual.substring(132)=${actual.substring(132)}`);
      expect(actual.substring(132)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0057 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0058
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0058
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="A") returns "uiExtensionType?":?"sys/commonU...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0058 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'A');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(135);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(103)=${actual.substring(103)}`);
      expect(actual.substring(103)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0058 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0059
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0059
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="a") returns "uiExtensionType?":?"sys/commonU...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0059 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'a');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(135);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(103)=${actual.substring(103)}`);
      expect(actual.substring(103)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0059 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0060
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0060
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="Hello World") returns "uiExtensionType?":?"s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0060 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'Hello World');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(145);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(113)=${actual.substring(113)}`);
      expect(actual.substring(113)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0060 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0061
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0061
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="123") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0061 begin`);
      const actual: string = sessionCreateLogOf('Hello', '123');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0061 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0062
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0062
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="Hello_1") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0062 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'Hello_1');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(141);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(109)=${actual.substring(109)}`);
      expect(actual.substring(109)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0062 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0063
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0063
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="hello world_1") returns "uiExtensionType?":?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0063 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'hello world_1');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(147);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(115)=${actual.substring(115)}`);
      expect(actual.substring(115)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0063 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0064
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0064
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="   ") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0064 begin`);
      const actual: string = sessionCreateLogOf('Hello', '   ');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0064 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0065
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0065
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="  ") returns "uiExtensionType?":?"sys/common...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0065 begin`);
      const actual: string = sessionCreateLogOf('Hello', '  ');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(136);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(104)=${actual.substring(104)}`);
      expect(actual.substring(104)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0065 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0066
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0066
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName=" _1") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0066 begin`);
      const actual: string = sessionCreateLogOf('Hello', ' _1');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0066 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0067
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0067
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName="x ") returns "uiExtensionType?":?"sys/common...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0067 begin`);
      const actual: string = sessionCreateLogOf('Hello', 'x ');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(136);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(104)=${actual.substring(104)}`);
      expect(actual.substring(104)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0067 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0068
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0068
     * @tc.desc      sessionCreateLogOf(bundleName="Hello", abilityName=" A ") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0068 begin`);
      const actual: string = sessionCreateLogOf('Hello', ' A ');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Hello", ab...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0068 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0069
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0069
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="") returns "uiExtensionType?":?"sys/co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0069 begin`);
      const actual: string = sessionCreateLogOf('hello world', '');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(146);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(114)=${actual.substring(114)}`);
      expect(actual.substring(114)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0069 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0070
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0070
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName=" ") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0070 begin`);
      const actual: string = sessionCreateLogOf('hello world', ' ');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(147);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(115)=${actual.substring(115)}`);
      expect(actual.substring(115)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0070 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0071
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0071
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="A") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0071 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'A');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(147);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(115)=${actual.substring(115)}`);
      expect(actual.substring(115)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0071 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0072
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0072
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="a") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0072 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'a');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(147);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(115)=${actual.substring(115)}`);
      expect(actual.substring(115)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0072 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0073
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0073
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="Hello World") returns "uiExtensionType...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0073 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'Hello World');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(157);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(125)=${actual.substring(125)}`);
      expect(actual.substring(125)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0073 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0074
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0074
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="123") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0074 begin`);
      const actual: string = sessionCreateLogOf('hello world', '123');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(149);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(117)=${actual.substring(117)}`);
      expect(actual.substring(117)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0074 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0075
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0075
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="HelloHello") returns "uiExtensionType?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0075 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'HelloHello');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(156);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(124)=${actual.substring(124)}`);
      expect(actual.substring(124)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0075 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0076
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0076
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="Hello_1") returns "uiExtensionType?":?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0076 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'Hello_1');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(153);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(121)=${actual.substring(121)}`);
      expect(actual.substring(121)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0076 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0077
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0077
     * @tc.desc      sessionCreateLogOf(bundleName="hello world", abilityName="hello world_1") returns "uiExtensionTy...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0077 begin`);
      const actual: string = sessionCreateLogOf('hello world', 'hello world_1');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(159);
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="hello worl...: actual.substring(127)=${actual.substring(127)}`);
      expect(actual.substring(127)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0077 end`);
    });
  });
}
