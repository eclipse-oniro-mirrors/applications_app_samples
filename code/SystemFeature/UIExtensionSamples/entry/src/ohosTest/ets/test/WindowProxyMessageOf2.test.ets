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
import { windowProxyMessageOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for windowProxyMessageOf (13 cases). */
export default function windowProxyMessageOf2Test(): void {
  describe('WindowProxyMessageOf2Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0078
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0078
     * @tc.desc      windowProxyMessageOf(proxyType="ckLAAF") returns "indowProxy called. proxy: ckLAAF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0078 begin`);
      const actual: string = windowProxyMessageOf('ckLAAF');
      logInfo(`windowProxyMessageOf(proxyType="ckLAAF"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`windowProxyMessageOf(proxyType="ckLAAF"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="ckLAAF"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('indowProxy called. proxy: ckLAAF');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0078 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0079
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0079
     * @tc.desc      windowProxyMessageOf(proxyType="X7") returns "ionWindowProxy called. proxy: X7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0079 begin`);
      const actual: string = windowProxyMessageOf('X7');
      logInfo(`windowProxyMessageOf(proxyType="X7"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`windowProxyMessageOf(proxyType="X7"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="X7"): actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('ionWindowProxy called. proxy: X7');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0079 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0080
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0080
     * @tc.desc      windowProxyMessageOf(proxyType="ZKyNb") returns "WindowProxy called. proxy: ZKyNb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0080 begin`);
      const actual: string = windowProxyMessageOf('ZKyNb');
      logInfo(`windowProxyMessageOf(proxyType="ZKyNb"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`windowProxyMessageOf(proxyType="ZKyNb"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="ZKyNb"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('WindowProxy called. proxy: ZKyNb');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0080 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0081
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0081
     * @tc.desc      windowProxyMessageOf(proxyType="KLrEclKpkxc") returns "Proxy called. proxy: KLrEclKpkxc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0081 begin`);
      const actual: string = windowProxyMessageOf('KLrEclKpkxc');
      logInfo(`windowProxyMessageOf(proxyType="KLrEclKpk...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`windowProxyMessageOf(proxyType="KLrEclKpk...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="KLrEclKpk...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual('Proxy called. proxy: KLrEclKpkxc');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0081 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0082
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0082
     * @tc.desc      windowProxyMessageOf(proxyType="NA") returns "ionWindowProxy called. proxy: NA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0082 begin`);
      const actual: string = windowProxyMessageOf('NA');
      logInfo(`windowProxyMessageOf(proxyType="NA"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`windowProxyMessageOf(proxyType="NA"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="NA"): actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('ionWindowProxy called. proxy: NA');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0082 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0083
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0083
     * @tc.desc      windowProxyMessageOf(proxyType="pP") returns "ionWindowProxy called. proxy: pP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0083 begin`);
      const actual: string = windowProxyMessageOf('pP');
      logInfo(`windowProxyMessageOf(proxyType="pP"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`windowProxyMessageOf(proxyType="pP"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="pP"): actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('ionWindowProxy called. proxy: pP');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0083 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0084
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0084
     * @tc.desc      windowProxyMessageOf(proxyType="5a3UdGT") returns "ndowProxy called. proxy: 5a3UdGT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0084 begin`);
      const actual: string = windowProxyMessageOf('5a3UdGT');
      logInfo(`windowProxyMessageOf(proxyType="5a3UdGT"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`windowProxyMessageOf(proxyType="5a3UdGT"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="5a3UdGT"): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('ndowProxy called. proxy: 5a3UdGT');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0084 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0085
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0085
     * @tc.desc      windowProxyMessageOf(proxyType="9") returns "sionWindowProxy called. proxy: 9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0085 begin`);
      const actual: string = windowProxyMessageOf('9');
      logInfo(`windowProxyMessageOf(proxyType="9"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`windowProxyMessageOf(proxyType="9"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="9"): actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual('sionWindowProxy called. proxy: 9');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0085 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0086
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0086
     * @tc.desc      windowProxyMessageOf(proxyType="kSvc5xQNYa1") returns "Proxy called. proxy: kSvc5xQNYa1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0086 begin`);
      const actual: string = windowProxyMessageOf('kSvc5xQNYa1');
      logInfo(`windowProxyMessageOf(proxyType="kSvc5xQNY...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`windowProxyMessageOf(proxyType="kSvc5xQNY...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="kSvc5xQNY...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual('Proxy called. proxy: kSvc5xQNYa1');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0086 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0087
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0087
     * @tc.desc      windowProxyMessageOf(proxyType="MDAYbRw") returns "ndowProxy called. proxy: MDAYbRw"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0087 begin`);
      const actual: string = windowProxyMessageOf('MDAYbRw');
      logInfo(`windowProxyMessageOf(proxyType="MDAYbRw"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`windowProxyMessageOf(proxyType="MDAYbRw"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="MDAYbRw"): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('ndowProxy called. proxy: MDAYbRw');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0087 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0088
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0088
     * @tc.desc      windowProxyMessageOf(proxyType="GKeliAgQ3MLF") returns "roxy called. proxy: GKeliAgQ3MLF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0088 begin`);
      const actual: string = windowProxyMessageOf('GKeliAgQ3MLF');
      logInfo(`windowProxyMessageOf(proxyType="GKeliAgQ3...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`windowProxyMessageOf(proxyType="GKeliAgQ3...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="GKeliAgQ3...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('roxy called. proxy: GKeliAgQ3MLF');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0088 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0089
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0089
     * @tc.desc      windowProxyMessageOf(proxyType="09AdVk") returns "indowProxy called. proxy: 09AdVk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0089 begin`);
      const actual: string = windowProxyMessageOf('09AdVk');
      logInfo(`windowProxyMessageOf(proxyType="09AdVk"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`windowProxyMessageOf(proxyType="09AdVk"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="09AdVk"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('indowProxy called. proxy: 09AdVk');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0089 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0090
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0090
     * @tc.desc      windowProxyMessageOf(proxyType="FzCW3KKv63") returns "wProxy called. proxy: FzCW3KKv63"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0090 begin`);
      const actual: string = windowProxyMessageOf('FzCW3KKv63');
      logInfo(`windowProxyMessageOf(proxyType="FzCW3KKv63"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`windowProxyMessageOf(proxyType="FzCW3KKv63"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="FzCW3KKv63"): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('wProxy called. proxy: FzCW3KKv63');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0090 end`);
    });
  });
}
