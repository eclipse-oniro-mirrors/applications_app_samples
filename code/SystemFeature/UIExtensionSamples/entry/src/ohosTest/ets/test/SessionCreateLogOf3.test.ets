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

/** Logic checks for sessionCreateLogOf (68 cases). */
export default function sessionCreateLogOf3Test(): void {
  describe('SessionCreateLogOf3Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0155
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0155
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="   ") returns "uiExtensionType?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0155 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', '   ');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(159);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(127)=${actual.substring(127)}`);
      expect(actual.substring(127)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0155 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0156
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0156
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="  ") returns "uiExtensionType?":?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0156 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', '  ');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(158);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(126)=${actual.substring(126)}`);
      expect(actual.substring(126)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0156 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0157
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0157
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName=" _1") returns "uiExtensionType?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0157 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', ' _1');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(159);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(127)=${actual.substring(127)}`);
      expect(actual.substring(127)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0157 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0158
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0158
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName="x ") returns "uiExtensionType?":?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0158 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', 'x ');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(158);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(126)=${actual.substring(126)}`);
      expect(actual.substring(126)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0158 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0159
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0159
     * @tc.desc      sessionCreateLogOf(bundleName="Sample Title 123", abilityName=" A ") returns "uiExtensionType?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0159 begin`);
      const actual: string = sessionCreateLogOf('Sample Title 123', ' A ');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(159);
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="Sample Tit...: actual.substring(127)=${actual.substring(127)}`);
      expect(actual.substring(127)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0159 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0160
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0160
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="Hello") returns "uiExtensionType?":?"sys/common...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0160 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'Hello');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(133);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(101)=${actual.substring(101)}`);
      expect(actual.substring(101)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0160 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0161
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0161
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="hello world") returns "uiExtensionType?":?"sys/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0161 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'hello world');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(139);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(107)=${actual.substring(107)}`);
      expect(actual.substring(107)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0161 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0162
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0162
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0162 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', '');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(128);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(96)=${actual.substring(96)}`);
      expect(actual.substring(96)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0162 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0163
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0163
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName=" ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0163 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', ' ');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0163 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0164
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0164
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="A") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0164 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'A');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0164 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0165
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0165
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="Sample Title 123") returns "uiExtensionType?":?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0165 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'Sample Title 123');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(144);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(112)=${actual.substring(112)}`);
      expect(actual.substring(112)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0165 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0166
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0166
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="??") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0166 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', '\u4e2d\u6587');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(130);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(98)=${actual.substring(98)}`);
      expect(actual.substring(98)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0166 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0167
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0167
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="a") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0167 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'a');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0167 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0168
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0168
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="abc") returns "uiExtensionType?":?"sys/commonUI...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0168 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'abc');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0168 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0169
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0169
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="Hello World") returns "uiExtensionType?":?"sys/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0169 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'Hello World');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(139);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(107)=${actual.substring(107)}`);
      expect(actual.substring(107)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0169 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0170
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0170
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="123") returns "uiExtensionType?":?"sys/commonUI...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0170 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', '123');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0170 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0171
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0171
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName=" Hello ") returns "uiExtensionType?":?"sys/comm...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0171 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', ' Hello ');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(135);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(103)=${actual.substring(103)}`);
      expect(actual.substring(103)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0171 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0172
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0172
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="HelloHello") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0172 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'HelloHello');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(138);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(106)=${actual.substring(106)}`);
      expect(actual.substring(106)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0172 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0173
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0173
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="Hello_1") returns "uiExtensionType?":?"sys/comm...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0173 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'Hello_1');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(135);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(103)=${actual.substring(103)}`);
      expect(actual.substring(103)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0173 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0174
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0174
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="xHello") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0174 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'xHello');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(134);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(102)=${actual.substring(102)}`);
      expect(actual.substring(102)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0174 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0175
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0175
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName=" hello world ") returns "uiExtensionType?":?"sy...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0175 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', ' hello world ');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(141);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(109)=${actual.substring(109)}`);
      expect(actual.substring(109)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0175 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0176
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0176
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="hello worldhello world") returns "uiExtensionTy...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0176 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'hello worldhello world');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(150);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(118)=${actual.substring(118)}`);
      expect(actual.substring(118)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0176 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0177
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0177
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="hello world_1") returns "uiExtensionType?":?"sy...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0177 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'hello world_1');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(141);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(109)=${actual.substring(109)}`);
      expect(actual.substring(109)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0177 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0178
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0178
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="xhello world") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0178 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'xhello world');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(140);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(108)=${actual.substring(108)}`);
      expect(actual.substring(108)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0178 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0179
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0179
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="   ") returns "uiExtensionType?":?"sys/commonUI...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0179 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', '   ');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0179 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0180
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0180
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="  ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0180 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', '  ');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(130);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(98)=${actual.substring(98)}`);
      expect(actual.substring(98)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0180 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0181
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0181
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName=" _1") returns "uiExtensionType?":?"sys/commonUI...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0181 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', ' _1');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0181 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0182
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0182
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName="x ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0182 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', 'x ');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(130);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(98)=${actual.substring(98)}`);
      expect(actual.substring(98)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0182 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0183
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0183
     * @tc.desc      sessionCreateLogOf(bundleName="??", abilityName=" A ") returns "uiExtensionType?":?"sys/commonUI...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0183 begin`);
      const actual: string = sessionCreateLogOf('\u4e2d\u6587', ' A ');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="??", abili...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0183 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0184
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0184
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="Hello") returns "uiExtensionType?":?"sys/commonU...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0184 begin`);
      const actual: string = sessionCreateLogOf('a', 'Hello');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0184 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0185
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0185
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="hello world") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0185 begin`);
      const actual: string = sessionCreateLogOf('a', 'hello world');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0185 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0186
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0186
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0186 begin`);
      const actual: string = sessionCreateLogOf('a', '');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(126);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(94)=${actual.substring(94)}`);
      expect(actual.substring(94)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0186 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0187
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0187
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName=" ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0187 begin`);
      const actual: string = sessionCreateLogOf('a', ' ');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0187 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0188
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0188
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="A") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0188 begin`);
      const actual: string = sessionCreateLogOf('a', 'A');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0188 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0189
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0189
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="Sample Title 123") returns "uiExtensionType?":?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0189 begin`);
      const actual: string = sessionCreateLogOf('a', 'Sample Title 123');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(142);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(110)=${actual.substring(110)}`);
      expect(actual.substring(110)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0189 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0190
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0190
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="??") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0190 begin`);
      const actual: string = sessionCreateLogOf('a', '\u4e2d\u6587');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(128);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(96)=${actual.substring(96)}`);
      expect(actual.substring(96)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0190 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0191
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0191
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="a") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0191 begin`);
      const actual: string = sessionCreateLogOf('a', 'a');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(127);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(95)=${actual.substring(95)}`);
      expect(actual.substring(95)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0191 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0192
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0192
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="abc") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0192 begin`);
      const actual: string = sessionCreateLogOf('a', 'abc');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0192 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0193
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0193
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="Hello World") returns "uiExtensionType?":?"sys/c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0193 begin`);
      const actual: string = sessionCreateLogOf('a', 'Hello World');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0193 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0194
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0194
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="123") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0194 begin`);
      const actual: string = sessionCreateLogOf('a', '123');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0194 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0195
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0195
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName=" Hello ") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0195 begin`);
      const actual: string = sessionCreateLogOf('a', ' Hello ');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(133);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(101)=${actual.substring(101)}`);
      expect(actual.substring(101)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0195 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0196
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0196
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="HelloHello") returns "uiExtensionType?":?"sys/co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0196 begin`);
      const actual: string = sessionCreateLogOf('a', 'HelloHello');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(136);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(104)=${actual.substring(104)}`);
      expect(actual.substring(104)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0196 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0197
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0197
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="Hello_1") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0197 begin`);
      const actual: string = sessionCreateLogOf('a', 'Hello_1');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(133);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(101)=${actual.substring(101)}`);
      expect(actual.substring(101)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0197 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0198
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0198
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="xHello") returns "uiExtensionType?":?"sys/common...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0198 begin`);
      const actual: string = sessionCreateLogOf('a', 'xHello');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(132);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(100)=${actual.substring(100)}`);
      expect(actual.substring(100)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0198 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0199
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0199
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName=" hello world ") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0199 begin`);
      const actual: string = sessionCreateLogOf('a', ' hello world ');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(139);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(107)=${actual.substring(107)}`);
      expect(actual.substring(107)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0199 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0200
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0200
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="hello worldhello world") returns "uiExtensionTyp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0200 begin`);
      const actual: string = sessionCreateLogOf('a', 'hello worldhello world');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(148);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(116)=${actual.substring(116)}`);
      expect(actual.substring(116)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0200 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0201
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0201
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="hello world_1") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0201 begin`);
      const actual: string = sessionCreateLogOf('a', 'hello world_1');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(139);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(107)=${actual.substring(107)}`);
      expect(actual.substring(107)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0201 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0202
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0202
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="xhello world") returns "uiExtensionType?":?"sys/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0202 begin`);
      const actual: string = sessionCreateLogOf('a', 'xhello world');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(138);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(106)=${actual.substring(106)}`);
      expect(actual.substring(106)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0202 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0203
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0203
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="   ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0203 begin`);
      const actual: string = sessionCreateLogOf('a', '   ');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0203 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0204
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0204
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="  ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0204 begin`);
      const actual: string = sessionCreateLogOf('a', '  ');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(128);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(96)=${actual.substring(96)}`);
      expect(actual.substring(96)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0204 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0205
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0205
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName=" _1") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0205 begin`);
      const actual: string = sessionCreateLogOf('a', ' _1');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0205 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0206
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0206
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName="x ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0206 begin`);
      const actual: string = sessionCreateLogOf('a', 'x ');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(128);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(96)=${actual.substring(96)}`);
      expect(actual.substring(96)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0206 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0207
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0207
     * @tc.desc      sessionCreateLogOf(bundleName="a", abilityName=" A ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0207 begin`);
      const actual: string = sessionCreateLogOf('a', ' A ');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(129);
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="a", abilit...: actual.substring(97)=${actual.substring(97)}`);
      expect(actual.substring(97)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0207 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0208
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0208
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="Hello") returns "uiExtensionType?":?"sys/commo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0208 begin`);
      const actual: string = sessionCreateLogOf('abc', 'Hello');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(135);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(103)=${actual.substring(103)}`);
      expect(actual.substring(103)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0208 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0209
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0209
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="hello world") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0209 begin`);
      const actual: string = sessionCreateLogOf('abc', 'hello world');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(141);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(109)=${actual.substring(109)}`);
      expect(actual.substring(109)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0209 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0210
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0210
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0210 begin`);
      const actual: string = sessionCreateLogOf('abc', '');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(130);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(98)=${actual.substring(98)}`);
      expect(actual.substring(98)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0210 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0211
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0211
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName=" ") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0211 begin`);
      const actual: string = sessionCreateLogOf('abc', ' ');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0211 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0212
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0212
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="A") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0212 begin`);
      const actual: string = sessionCreateLogOf('abc', 'A');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0212 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0213
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0213
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="Sample Title 123") returns "uiExtensionType?":...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0213 begin`);
      const actual: string = sessionCreateLogOf('abc', 'Sample Title 123');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(146);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(114)=${actual.substring(114)}`);
      expect(actual.substring(114)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0213 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0214
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0214
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="??") returns "uiExtensionType?":?"sys/commonUI...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0214 begin`);
      const actual: string = sessionCreateLogOf('abc', '\u4e2d\u6587');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(132);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(100)=${actual.substring(100)}`);
      expect(actual.substring(100)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0214 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0215
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0215
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="a") returns "uiExtensionType?":?"sys/commonUI?"}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0215 begin`);
      const actual: string = sessionCreateLogOf('abc', 'a');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(131);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(99)=${actual.substring(99)}`);
      expect(actual.substring(99)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0215 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0216
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0216
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="abc") returns "uiExtensionType?":?"sys/commonU...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0216 begin`);
      const actual: string = sessionCreateLogOf('abc', 'abc');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(133);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(101)=${actual.substring(101)}`);
      expect(actual.substring(101)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0216 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0217
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0217
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="Hello World") returns "uiExtensionType?":?"sys...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0217 begin`);
      const actual: string = sessionCreateLogOf('abc', 'Hello World');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(141);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(109)=${actual.substring(109)}`);
      expect(actual.substring(109)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0217 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0218
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0218
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="123") returns "uiExtensionType?":?"sys/commonU...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0218 begin`);
      const actual: string = sessionCreateLogOf('abc', '123');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(133);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(101)=${actual.substring(101)}`);
      expect(actual.substring(101)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0218 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0219
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0219
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName=" Hello ") returns "uiExtensionType?":?"sys/com...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0219 begin`);
      const actual: string = sessionCreateLogOf('abc', ' Hello ');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0219 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0220
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0220
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="HelloHello") returns "uiExtensionType?":?"sys/...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0220 begin`);
      const actual: string = sessionCreateLogOf('abc', 'HelloHello');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(140);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(108)=${actual.substring(108)}`);
      expect(actual.substring(108)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0220 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0221
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0221
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="Hello_1") returns "uiExtensionType?":?"sys/com...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_SessionCreateLogOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0221 begin`);
      const actual: string = sessionCreateLogOf('abc', 'Hello_1');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(137);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(105)=${actual.substring(105)}`);
      expect(actual.substring(105)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0221 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_SESSION_CREATE_LOG_OF_0222
     * @tc.name      UIExtensionSamples_SessionCreateLogOf_0222
     * @tc.desc      sessionCreateLogOf(bundleName="abc", abilityName="xHello") returns "uiExtensionType?":?"sys/comm...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_SessionCreateLogOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SessionCreateLogOf_0222 begin`);
      const actual: string = sessionCreateLogOf('abc', 'xHello');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(136);
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtAbility onSessionCreate, wa');
      logInfo(`sessionCreateLogOf(bundleName="abc", abil...: actual.substring(104)=${actual.substring(104)}`);
      expect(actual.substring(104)).assertEqual('uiExtensionType":"sys/commonUI"}');
      logInfo(`${BUNDLE}SessionCreateLogOf_0222 end`);
    });
  });
}
