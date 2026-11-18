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

/** Logic checks for windowProxyMessageOf (77 cases). */
export default function windowProxyMessageOfTest(): void {
  describe('WindowProxyMessageOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0001
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0001
     * @tc.desc      windowProxyMessageOf(proxyType="") returns "nsionWindowProxy called. proxy: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0001 begin`);
      const actual: string = windowProxyMessageOf('');
      logInfo(`windowProxyMessageOf(proxyType=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`windowProxyMessageOf(proxyType=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType=""): actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('nsionWindowProxy called. proxy: ');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0002
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0002
     * @tc.desc      windowProxyMessageOf(proxyType="a") returns "sionWindowProxy called. proxy: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0002 begin`);
      const actual: string = windowProxyMessageOf('a');
      logInfo(`windowProxyMessageOf(proxyType="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`windowProxyMessageOf(proxyType="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="a"): actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual('sionWindowProxy called. proxy: a');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0003
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0003
     * @tc.desc      windowProxyMessageOf(proxyType="abc") returns "onWindowProxy called. proxy: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0003 begin`);
      const actual: string = windowProxyMessageOf('abc');
      logInfo(`windowProxyMessageOf(proxyType="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`windowProxyMessageOf(proxyType="abc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="abc"): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('onWindowProxy called. proxy: abc');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0004
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0004
     * @tc.desc      windowProxyMessageOf(proxyType="Hello World") returns "Proxy called. proxy: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0004 begin`);
      const actual: string = windowProxyMessageOf('Hello World');
      logInfo(`windowProxyMessageOf(proxyType="Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`windowProxyMessageOf(proxyType="Hello Wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="Hello Wor...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual('Proxy called. proxy: Hello World');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0005
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0005
     * @tc.desc      windowProxyMessageOf(proxyType=" ") returns "sionWindowProxy called. proxy:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0005 begin`);
      const actual: string = windowProxyMessageOf(' ');
      logInfo(`windowProxyMessageOf(proxyType=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`windowProxyMessageOf(proxyType=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType=" "): actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual('sionWindowProxy called. proxy:  ');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0006
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0006
     * @tc.desc      windowProxyMessageOf(proxyType="123") returns "onWindowProxy called. proxy: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0006 begin`);
      const actual: string = windowProxyMessageOf('123');
      logInfo(`windowProxyMessageOf(proxyType="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`windowProxyMessageOf(proxyType="123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="123"): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('onWindowProxy called. proxy: 123');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0007
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0007
     * @tc.desc      windowProxyMessageOf(proxyType=" a ") returns "onWindowProxy called. proxy:  a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0007 begin`);
      const actual: string = windowProxyMessageOf(' a ');
      logInfo(`windowProxyMessageOf(proxyType=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`windowProxyMessageOf(proxyType=" a "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType=" a "): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('onWindowProxy called. proxy:  a ');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0008
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0008
     * @tc.desc      windowProxyMessageOf(proxyType="aa") returns "ionWindowProxy called. proxy: aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0008 begin`);
      const actual: string = windowProxyMessageOf('aa');
      logInfo(`windowProxyMessageOf(proxyType="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`windowProxyMessageOf(proxyType="aa"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="aa"): actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('ionWindowProxy called. proxy: aa');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0009
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0009
     * @tc.desc      windowProxyMessageOf(proxyType="a_1") returns "onWindowProxy called. proxy: a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0009 begin`);
      const actual: string = windowProxyMessageOf('a_1');
      logInfo(`windowProxyMessageOf(proxyType="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`windowProxyMessageOf(proxyType="a_1"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="a_1"): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('onWindowProxy called. proxy: a_1');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0010
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0010
     * @tc.desc      windowProxyMessageOf(proxyType="xa") returns "ionWindowProxy called. proxy: xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0010 begin`);
      const actual: string = windowProxyMessageOf('xa');
      logInfo(`windowProxyMessageOf(proxyType="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`windowProxyMessageOf(proxyType="xa"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="xa"): actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('ionWindowProxy called. proxy: xa');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0011
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0011
     * @tc.desc      windowProxyMessageOf(proxyType=" abc ") returns "WindowProxy called. proxy:  abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0011 begin`);
      const actual: string = windowProxyMessageOf(' abc ');
      logInfo(`windowProxyMessageOf(proxyType=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`windowProxyMessageOf(proxyType=" abc "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType=" abc "): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('WindowProxy called. proxy:  abc ');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0012
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0012
     * @tc.desc      windowProxyMessageOf(proxyType="abcabc") returns "indowProxy called. proxy: abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0012 begin`);
      const actual: string = windowProxyMessageOf('abcabc');
      logInfo(`windowProxyMessageOf(proxyType="abcabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`windowProxyMessageOf(proxyType="abcabc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="abcabc"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('indowProxy called. proxy: abcabc');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0013
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0013
     * @tc.desc      windowProxyMessageOf(proxyType="abc_1") returns "WindowProxy called. proxy: abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0013 begin`);
      const actual: string = windowProxyMessageOf('abc_1');
      logInfo(`windowProxyMessageOf(proxyType="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`windowProxyMessageOf(proxyType="abc_1"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="abc_1"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('WindowProxy called. proxy: abc_1');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0014
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0014
     * @tc.desc      windowProxyMessageOf(proxyType="xabc") returns "nWindowProxy called. proxy: xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0014 begin`);
      const actual: string = windowProxyMessageOf('xabc');
      logInfo(`windowProxyMessageOf(proxyType="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`windowProxyMessageOf(proxyType="xabc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="xabc"): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual('nWindowProxy called. proxy: xabc');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0015
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0015
     * @tc.desc      windowProxyMessageOf(proxyType=" Hello World ") returns "oxy called. proxy:  Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0015 begin`);
      const actual: string = windowProxyMessageOf(' Hello World ');
      logInfo(`windowProxyMessageOf(proxyType=" Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`windowProxyMessageOf(proxyType=" Hello Wo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType=" Hello Wo...: actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('oxy called. proxy:  Hello World ');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0016
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0016
     * @tc.desc      windowProxyMessageOf(proxyType="Hello WorldHello World") returns "d. proxy: Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0016 begin`);
      const actual: string = windowProxyMessageOf('Hello WorldHello World');
      logInfo(`windowProxyMessageOf(proxyType="Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(89);
      logInfo(`windowProxyMessageOf(proxyType="Hello Wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="Hello Wor...: actual.substring(57)=${actual.substring(57)}`);
      expect(actual.substring(57)).assertEqual('d. proxy: Hello WorldHello World');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0017
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0017
     * @tc.desc      windowProxyMessageOf(proxyType="Hello World_1") returns "oxy called. proxy: Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0017 begin`);
      const actual: string = windowProxyMessageOf('Hello World_1');
      logInfo(`windowProxyMessageOf(proxyType="Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(80);
      logInfo(`windowProxyMessageOf(proxyType="Hello Wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="Hello Wor...: actual.substring(48)=${actual.substring(48)}`);
      expect(actual.substring(48)).assertEqual('oxy called. proxy: Hello World_1');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0018
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0018
     * @tc.desc      windowProxyMessageOf(proxyType="xHello World") returns "roxy called. proxy: xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0018 begin`);
      const actual: string = windowProxyMessageOf('xHello World');
      logInfo(`windowProxyMessageOf(proxyType="xHello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`windowProxyMessageOf(proxyType="xHello Wo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="xHello Wo...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('roxy called. proxy: xHello World');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0019
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0019
     * @tc.desc      windowProxyMessageOf(proxyType="   ") returns "onWindowProxy called. proxy:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0019 begin`);
      const actual: string = windowProxyMessageOf('   ');
      logInfo(`windowProxyMessageOf(proxyType="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`windowProxyMessageOf(proxyType="   "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="   "): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('onWindowProxy called. proxy:    ');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0020
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0020
     * @tc.desc      windowProxyMessageOf(proxyType="  ") returns "ionWindowProxy called. proxy:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0020 begin`);
      const actual: string = windowProxyMessageOf('  ');
      logInfo(`windowProxyMessageOf(proxyType="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`windowProxyMessageOf(proxyType="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="  "): actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('ionWindowProxy called. proxy:   ');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0021
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0021
     * @tc.desc      windowProxyMessageOf(proxyType=" _1") returns "onWindowProxy called. proxy:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0021 begin`);
      const actual: string = windowProxyMessageOf(' _1');
      logInfo(`windowProxyMessageOf(proxyType=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`windowProxyMessageOf(proxyType=" _1"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType=" _1"): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('onWindowProxy called. proxy:  _1');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0022
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0022
     * @tc.desc      windowProxyMessageOf(proxyType="x ") returns "ionWindowProxy called. proxy: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0022 begin`);
      const actual: string = windowProxyMessageOf('x ');
      logInfo(`windowProxyMessageOf(proxyType="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`windowProxyMessageOf(proxyType="x "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="x "): actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('ionWindowProxy called. proxy: x ');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0023
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0023
     * @tc.desc      windowProxyMessageOf(proxyType=" 123 ") returns "WindowProxy called. proxy:  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0023 begin`);
      const actual: string = windowProxyMessageOf(' 123 ');
      logInfo(`windowProxyMessageOf(proxyType=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`windowProxyMessageOf(proxyType=" 123 "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType=" 123 "): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('WindowProxy called. proxy:  123 ');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0024
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0024
     * @tc.desc      windowProxyMessageOf(proxyType="123123") returns "indowProxy called. proxy: 123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0024 begin`);
      const actual: string = windowProxyMessageOf('123123');
      logInfo(`windowProxyMessageOf(proxyType="123123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`windowProxyMessageOf(proxyType="123123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="123123"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('indowProxy called. proxy: 123123');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0025
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0025
     * @tc.desc      windowProxyMessageOf(proxyType="123_1") returns "WindowProxy called. proxy: 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0025 begin`);
      const actual: string = windowProxyMessageOf('123_1');
      logInfo(`windowProxyMessageOf(proxyType="123_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`windowProxyMessageOf(proxyType="123_1"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="123_1"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('WindowProxy called. proxy: 123_1');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0026
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0026
     * @tc.desc      windowProxyMessageOf(proxyType="x123") returns "nWindowProxy called. proxy: x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0026 begin`);
      const actual: string = windowProxyMessageOf('x123');
      logInfo(`windowProxyMessageOf(proxyType="x123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`windowProxyMessageOf(proxyType="x123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="x123"): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual('nWindowProxy called. proxy: x123');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0027
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0027
     * @tc.desc      windowProxyMessageOf(proxyType="KII") returns "onWindowProxy called. proxy: KII"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0027 begin`);
      const actual: string = windowProxyMessageOf('KII');
      logInfo(`windowProxyMessageOf(proxyType="KII"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`windowProxyMessageOf(proxyType="KII"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="KII"): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('onWindowProxy called. proxy: KII');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0028
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0028
     * @tc.desc      windowProxyMessageOf(proxyType="rY8tkB") returns "indowProxy called. proxy: rY8tkB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0028 begin`);
      const actual: string = windowProxyMessageOf('rY8tkB');
      logInfo(`windowProxyMessageOf(proxyType="rY8tkB"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`windowProxyMessageOf(proxyType="rY8tkB"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="rY8tkB"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('indowProxy called. proxy: rY8tkB');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0029
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0029
     * @tc.desc      windowProxyMessageOf(proxyType="2UK") returns "onWindowProxy called. proxy: 2UK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0029 begin`);
      const actual: string = windowProxyMessageOf('2UK');
      logInfo(`windowProxyMessageOf(proxyType="2UK"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`windowProxyMessageOf(proxyType="2UK"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="2UK"): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('onWindowProxy called. proxy: 2UK');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0030
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0030
     * @tc.desc      windowProxyMessageOf(proxyType="il7iPkMi") returns "dowProxy called. proxy: il7iPkMi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0030 begin`);
      const actual: string = windowProxyMessageOf('il7iPkMi');
      logInfo(`windowProxyMessageOf(proxyType="il7iPkMi"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`windowProxyMessageOf(proxyType="il7iPkMi"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="il7iPkMi"): actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('dowProxy called. proxy: il7iPkMi');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0031
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0031
     * @tc.desc      windowProxyMessageOf(proxyType="EA9JFJcR9") returns "owProxy called. proxy: EA9JFJcR9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0031 begin`);
      const actual: string = windowProxyMessageOf('EA9JFJcR9');
      logInfo(`windowProxyMessageOf(proxyType="EA9JFJcR9"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`windowProxyMessageOf(proxyType="EA9JFJcR9"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="EA9JFJcR9"): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('owProxy called. proxy: EA9JFJcR9');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0032
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0032
     * @tc.desc      windowProxyMessageOf(proxyType="jyGsXh6G") returns "dowProxy called. proxy: jyGsXh6G"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0032 begin`);
      const actual: string = windowProxyMessageOf('jyGsXh6G');
      logInfo(`windowProxyMessageOf(proxyType="jyGsXh6G"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`windowProxyMessageOf(proxyType="jyGsXh6G"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="jyGsXh6G"): actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('dowProxy called. proxy: jyGsXh6G');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0033
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0033
     * @tc.desc      windowProxyMessageOf(proxyType="gnWmu8KJXsR8") returns "roxy called. proxy: gnWmu8KJXsR8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0033 begin`);
      const actual: string = windowProxyMessageOf('gnWmu8KJXsR8');
      logInfo(`windowProxyMessageOf(proxyType="gnWmu8KJX...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`windowProxyMessageOf(proxyType="gnWmu8KJX...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="gnWmu8KJX...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('roxy called. proxy: gnWmu8KJXsR8');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0034
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0034
     * @tc.desc      windowProxyMessageOf(proxyType="nb") returns "ionWindowProxy called. proxy: nb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0034 begin`);
      const actual: string = windowProxyMessageOf('nb');
      logInfo(`windowProxyMessageOf(proxyType="nb"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`windowProxyMessageOf(proxyType="nb"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="nb"): actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('ionWindowProxy called. proxy: nb');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0035
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0035
     * @tc.desc      windowProxyMessageOf(proxyType="wXGTMXXCr") returns "owProxy called. proxy: wXGTMXXCr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0035 begin`);
      const actual: string = windowProxyMessageOf('wXGTMXXCr');
      logInfo(`windowProxyMessageOf(proxyType="wXGTMXXCr"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`windowProxyMessageOf(proxyType="wXGTMXXCr"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="wXGTMXXCr"): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('owProxy called. proxy: wXGTMXXCr');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0036
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0036
     * @tc.desc      windowProxyMessageOf(proxyType="LezOtU18") returns "dowProxy called. proxy: LezOtU18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0036 begin`);
      const actual: string = windowProxyMessageOf('LezOtU18');
      logInfo(`windowProxyMessageOf(proxyType="LezOtU18"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`windowProxyMessageOf(proxyType="LezOtU18"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="LezOtU18"): actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('dowProxy called. proxy: LezOtU18');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0036 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0037
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0037
     * @tc.desc      windowProxyMessageOf(proxyType="e") returns "sionWindowProxy called. proxy: e"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0037 begin`);
      const actual: string = windowProxyMessageOf('e');
      logInfo(`windowProxyMessageOf(proxyType="e"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`windowProxyMessageOf(proxyType="e"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="e"): actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual('sionWindowProxy called. proxy: e');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0037 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0038
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0038
     * @tc.desc      windowProxyMessageOf(proxyType="lmYOo") returns "WindowProxy called. proxy: lmYOo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0038 begin`);
      const actual: string = windowProxyMessageOf('lmYOo');
      logInfo(`windowProxyMessageOf(proxyType="lmYOo"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`windowProxyMessageOf(proxyType="lmYOo"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="lmYOo"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('WindowProxy called. proxy: lmYOo');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0038 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0039
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0039
     * @tc.desc      windowProxyMessageOf(proxyType="QjAxL545paPk") returns "roxy called. proxy: QjAxL545paPk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0039 begin`);
      const actual: string = windowProxyMessageOf('QjAxL545paPk');
      logInfo(`windowProxyMessageOf(proxyType="QjAxL545p...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`windowProxyMessageOf(proxyType="QjAxL545p...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="QjAxL545p...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('roxy called. proxy: QjAxL545paPk');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0039 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0040
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0040
     * @tc.desc      windowProxyMessageOf(proxyType="k6") returns "ionWindowProxy called. proxy: k6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0040 begin`);
      const actual: string = windowProxyMessageOf('k6');
      logInfo(`windowProxyMessageOf(proxyType="k6"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`windowProxyMessageOf(proxyType="k6"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="k6"): actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('ionWindowProxy called. proxy: k6');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0040 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0041
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0041
     * @tc.desc      windowProxyMessageOf(proxyType="GEUOI") returns "WindowProxy called. proxy: GEUOI"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0041 begin`);
      const actual: string = windowProxyMessageOf('GEUOI');
      logInfo(`windowProxyMessageOf(proxyType="GEUOI"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`windowProxyMessageOf(proxyType="GEUOI"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="GEUOI"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('WindowProxy called. proxy: GEUOI');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0041 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0042
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0042
     * @tc.desc      windowProxyMessageOf(proxyType="0") returns "sionWindowProxy called. proxy: 0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0042 begin`);
      const actual: string = windowProxyMessageOf('0');
      logInfo(`windowProxyMessageOf(proxyType="0"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`windowProxyMessageOf(proxyType="0"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="0"): actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual('sionWindowProxy called. proxy: 0');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0042 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0043
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0043
     * @tc.desc      windowProxyMessageOf(proxyType="eop") returns "onWindowProxy called. proxy: eop"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0043 begin`);
      const actual: string = windowProxyMessageOf('eop');
      logInfo(`windowProxyMessageOf(proxyType="eop"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`windowProxyMessageOf(proxyType="eop"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="eop"): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('onWindowProxy called. proxy: eop');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0043 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0044
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0044
     * @tc.desc      windowProxyMessageOf(proxyType="TC") returns "ionWindowProxy called. proxy: TC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0044 begin`);
      const actual: string = windowProxyMessageOf('TC');
      logInfo(`windowProxyMessageOf(proxyType="TC"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`windowProxyMessageOf(proxyType="TC"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="TC"): actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('ionWindowProxy called. proxy: TC');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0044 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0045
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0045
     * @tc.desc      windowProxyMessageOf(proxyType="dio4qa75") returns "dowProxy called. proxy: dio4qa75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0045 begin`);
      const actual: string = windowProxyMessageOf('dio4qa75');
      logInfo(`windowProxyMessageOf(proxyType="dio4qa75"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`windowProxyMessageOf(proxyType="dio4qa75"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="dio4qa75"): actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('dowProxy called. proxy: dio4qa75');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0045 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0046
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0046
     * @tc.desc      windowProxyMessageOf(proxyType="5E") returns "ionWindowProxy called. proxy: 5E"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0046 begin`);
      const actual: string = windowProxyMessageOf('5E');
      logInfo(`windowProxyMessageOf(proxyType="5E"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`windowProxyMessageOf(proxyType="5E"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="5E"): actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('ionWindowProxy called. proxy: 5E');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0046 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0047
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0047
     * @tc.desc      windowProxyMessageOf(proxyType="HzkiZA0C") returns "dowProxy called. proxy: HzkiZA0C"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0047 begin`);
      const actual: string = windowProxyMessageOf('HzkiZA0C');
      logInfo(`windowProxyMessageOf(proxyType="HzkiZA0C"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`windowProxyMessageOf(proxyType="HzkiZA0C"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="HzkiZA0C"): actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('dowProxy called. proxy: HzkiZA0C');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0047 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0048
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0048
     * @tc.desc      windowProxyMessageOf(proxyType="Xup5zb") returns "indowProxy called. proxy: Xup5zb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0048 begin`);
      const actual: string = windowProxyMessageOf('Xup5zb');
      logInfo(`windowProxyMessageOf(proxyType="Xup5zb"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`windowProxyMessageOf(proxyType="Xup5zb"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="Xup5zb"): actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual('indowProxy called. proxy: Xup5zb');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0048 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0049
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0049
     * @tc.desc      windowProxyMessageOf(proxyType="EN5ow") returns "WindowProxy called. proxy: EN5ow"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0049 begin`);
      const actual: string = windowProxyMessageOf('EN5ow');
      logInfo(`windowProxyMessageOf(proxyType="EN5ow"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`windowProxyMessageOf(proxyType="EN5ow"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="EN5ow"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('WindowProxy called. proxy: EN5ow');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0049 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0050
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0050
     * @tc.desc      windowProxyMessageOf(proxyType="K5oBLnS") returns "ndowProxy called. proxy: K5oBLnS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0050 begin`);
      const actual: string = windowProxyMessageOf('K5oBLnS');
      logInfo(`windowProxyMessageOf(proxyType="K5oBLnS"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`windowProxyMessageOf(proxyType="K5oBLnS"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="K5oBLnS"): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('ndowProxy called. proxy: K5oBLnS');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0050 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0051
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0051
     * @tc.desc      windowProxyMessageOf(proxyType="Z") returns "sionWindowProxy called. proxy: Z"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0051 begin`);
      const actual: string = windowProxyMessageOf('Z');
      logInfo(`windowProxyMessageOf(proxyType="Z"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`windowProxyMessageOf(proxyType="Z"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="Z"): actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual('sionWindowProxy called. proxy: Z');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0051 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0052
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0052
     * @tc.desc      windowProxyMessageOf(proxyType="8") returns "sionWindowProxy called. proxy: 8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0052 begin`);
      const actual: string = windowProxyMessageOf('8');
      logInfo(`windowProxyMessageOf(proxyType="8"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`windowProxyMessageOf(proxyType="8"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="8"): actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual('sionWindowProxy called. proxy: 8');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0052 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0053
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0053
     * @tc.desc      windowProxyMessageOf(proxyType="mp7oq") returns "WindowProxy called. proxy: mp7oq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0053 begin`);
      const actual: string = windowProxyMessageOf('mp7oq');
      logInfo(`windowProxyMessageOf(proxyType="mp7oq"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`windowProxyMessageOf(proxyType="mp7oq"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="mp7oq"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('WindowProxy called. proxy: mp7oq');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0053 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0054
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0054
     * @tc.desc      windowProxyMessageOf(proxyType="gyxenPfuXMl") returns "Proxy called. proxy: gyxenPfuXMl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0054 begin`);
      const actual: string = windowProxyMessageOf('gyxenPfuXMl');
      logInfo(`windowProxyMessageOf(proxyType="gyxenPfuX...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`windowProxyMessageOf(proxyType="gyxenPfuX...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="gyxenPfuX...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual('Proxy called. proxy: gyxenPfuXMl');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0054 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0055
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0055
     * @tc.desc      windowProxyMessageOf(proxyType="iyGJpnPG") returns "dowProxy called. proxy: iyGJpnPG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0055 begin`);
      const actual: string = windowProxyMessageOf('iyGJpnPG');
      logInfo(`windowProxyMessageOf(proxyType="iyGJpnPG"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`windowProxyMessageOf(proxyType="iyGJpnPG"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="iyGJpnPG"): actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('dowProxy called. proxy: iyGJpnPG');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0055 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0056
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0056
     * @tc.desc      windowProxyMessageOf(proxyType="CoqXC") returns "WindowProxy called. proxy: CoqXC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0056 begin`);
      const actual: string = windowProxyMessageOf('CoqXC');
      logInfo(`windowProxyMessageOf(proxyType="CoqXC"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`windowProxyMessageOf(proxyType="CoqXC"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="CoqXC"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('WindowProxy called. proxy: CoqXC');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0056 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0057
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0057
     * @tc.desc      windowProxyMessageOf(proxyType="TgS") returns "onWindowProxy called. proxy: TgS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0057 begin`);
      const actual: string = windowProxyMessageOf('TgS');
      logInfo(`windowProxyMessageOf(proxyType="TgS"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`windowProxyMessageOf(proxyType="TgS"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="TgS"): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('onWindowProxy called. proxy: TgS');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0057 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0058
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0058
     * @tc.desc      windowProxyMessageOf(proxyType="OnqbAFCaY") returns "owProxy called. proxy: OnqbAFCaY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0058 begin`);
      const actual: string = windowProxyMessageOf('OnqbAFCaY');
      logInfo(`windowProxyMessageOf(proxyType="OnqbAFCaY"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`windowProxyMessageOf(proxyType="OnqbAFCaY"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="OnqbAFCaY"): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('owProxy called. proxy: OnqbAFCaY');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0058 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0059
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0059
     * @tc.desc      windowProxyMessageOf(proxyType="drqn") returns "nWindowProxy called. proxy: drqn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0059 begin`);
      const actual: string = windowProxyMessageOf('drqn');
      logInfo(`windowProxyMessageOf(proxyType="drqn"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`windowProxyMessageOf(proxyType="drqn"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="drqn"): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual('nWindowProxy called. proxy: drqn');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0059 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0060
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0060
     * @tc.desc      windowProxyMessageOf(proxyType="ssyq8yCjFpyZ") returns "roxy called. proxy: ssyq8yCjFpyZ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0060 begin`);
      const actual: string = windowProxyMessageOf('ssyq8yCjFpyZ');
      logInfo(`windowProxyMessageOf(proxyType="ssyq8yCjF...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`windowProxyMessageOf(proxyType="ssyq8yCjF...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="ssyq8yCjF...: actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual('roxy called. proxy: ssyq8yCjFpyZ');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0060 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0061
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0061
     * @tc.desc      windowProxyMessageOf(proxyType="lO1k1CkP") returns "dowProxy called. proxy: lO1k1CkP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0061 begin`);
      const actual: string = windowProxyMessageOf('lO1k1CkP');
      logInfo(`windowProxyMessageOf(proxyType="lO1k1CkP"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`windowProxyMessageOf(proxyType="lO1k1CkP"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="lO1k1CkP"): actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual('dowProxy called. proxy: lO1k1CkP');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0061 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0062
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0062
     * @tc.desc      windowProxyMessageOf(proxyType="XT9ZG6u") returns "ndowProxy called. proxy: XT9ZG6u"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0062 begin`);
      const actual: string = windowProxyMessageOf('XT9ZG6u');
      logInfo(`windowProxyMessageOf(proxyType="XT9ZG6u"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(74);
      logInfo(`windowProxyMessageOf(proxyType="XT9ZG6u"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="XT9ZG6u"): actual.substring(42)=${actual.substring(42)}`);
      expect(actual.substring(42)).assertEqual('ndowProxy called. proxy: XT9ZG6u');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0062 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0063
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0063
     * @tc.desc      windowProxyMessageOf(proxyType="Egxao2vPqLR") returns "Proxy called. proxy: Egxao2vPqLR"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0063 begin`);
      const actual: string = windowProxyMessageOf('Egxao2vPqLR');
      logInfo(`windowProxyMessageOf(proxyType="Egxao2vPq...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`windowProxyMessageOf(proxyType="Egxao2vPq...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="Egxao2vPq...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual('Proxy called. proxy: Egxao2vPqLR');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0063 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0064
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0064
     * @tc.desc      windowProxyMessageOf(proxyType="irV") returns "onWindowProxy called. proxy: irV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0064 begin`);
      const actual: string = windowProxyMessageOf('irV');
      logInfo(`windowProxyMessageOf(proxyType="irV"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`windowProxyMessageOf(proxyType="irV"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="irV"): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('onWindowProxy called. proxy: irV');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0064 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0065
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0065
     * @tc.desc      windowProxyMessageOf(proxyType="lpucTiQWtkv") returns "Proxy called. proxy: lpucTiQWtkv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0065 begin`);
      const actual: string = windowProxyMessageOf('lpucTiQWtkv');
      logInfo(`windowProxyMessageOf(proxyType="lpucTiQWt...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`windowProxyMessageOf(proxyType="lpucTiQWt...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="lpucTiQWt...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual('Proxy called. proxy: lpucTiQWtkv');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0065 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0066
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0066
     * @tc.desc      windowProxyMessageOf(proxyType="EPP20") returns "WindowProxy called. proxy: EPP20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0066 begin`);
      const actual: string = windowProxyMessageOf('EPP20');
      logInfo(`windowProxyMessageOf(proxyType="EPP20"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`windowProxyMessageOf(proxyType="EPP20"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="EPP20"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('WindowProxy called. proxy: EPP20');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0066 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0067
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0067
     * @tc.desc      windowProxyMessageOf(proxyType="mFbXV") returns "WindowProxy called. proxy: mFbXV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0067 begin`);
      const actual: string = windowProxyMessageOf('mFbXV');
      logInfo(`windowProxyMessageOf(proxyType="mFbXV"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`windowProxyMessageOf(proxyType="mFbXV"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="mFbXV"): actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('WindowProxy called. proxy: mFbXV');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0067 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0068
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0068
     * @tc.desc      windowProxyMessageOf(proxyType="JPPi") returns "nWindowProxy called. proxy: JPPi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0068 begin`);
      const actual: string = windowProxyMessageOf('JPPi');
      logInfo(`windowProxyMessageOf(proxyType="JPPi"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`windowProxyMessageOf(proxyType="JPPi"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="JPPi"): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual('nWindowProxy called. proxy: JPPi');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0068 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0069
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0069
     * @tc.desc      windowProxyMessageOf(proxyType="s") returns "sionWindowProxy called. proxy: s"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0069 begin`);
      const actual: string = windowProxyMessageOf('s');
      logInfo(`windowProxyMessageOf(proxyType="s"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`windowProxyMessageOf(proxyType="s"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="s"): actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual('sionWindowProxy called. proxy: s');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0069 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0070
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0070
     * @tc.desc      windowProxyMessageOf(proxyType="uSfkGjqgPD") returns "wProxy called. proxy: uSfkGjqgPD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0070 begin`);
      const actual: string = windowProxyMessageOf('uSfkGjqgPD');
      logInfo(`windowProxyMessageOf(proxyType="uSfkGjqgPD"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`windowProxyMessageOf(proxyType="uSfkGjqgPD"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="uSfkGjqgPD"): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('wProxy called. proxy: uSfkGjqgPD');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0070 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0071
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0071
     * @tc.desc      windowProxyMessageOf(proxyType="wQLljeRYz") returns "owProxy called. proxy: wQLljeRYz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0071 begin`);
      const actual: string = windowProxyMessageOf('wQLljeRYz');
      logInfo(`windowProxyMessageOf(proxyType="wQLljeRYz"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`windowProxyMessageOf(proxyType="wQLljeRYz"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="wQLljeRYz"): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('owProxy called. proxy: wQLljeRYz');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0071 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0072
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0072
     * @tc.desc      windowProxyMessageOf(proxyType="LGcC5Lkbli") returns "wProxy called. proxy: LGcC5Lkbli"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0072 begin`);
      const actual: string = windowProxyMessageOf('LGcC5Lkbli');
      logInfo(`windowProxyMessageOf(proxyType="LGcC5Lkbli"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(77);
      logInfo(`windowProxyMessageOf(proxyType="LGcC5Lkbli"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="LGcC5Lkbli"): actual.substring(45)=${actual.substring(45)}`);
      expect(actual.substring(45)).assertEqual('wProxy called. proxy: LGcC5Lkbli');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0072 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0073
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0073
     * @tc.desc      windowProxyMessageOf(proxyType="5os0vpPAcf8") returns "Proxy called. proxy: 5os0vpPAcf8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0073 begin`);
      const actual: string = windowProxyMessageOf('5os0vpPAcf8');
      logInfo(`windowProxyMessageOf(proxyType="5os0vpPAc...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`windowProxyMessageOf(proxyType="5os0vpPAc...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="5os0vpPAc...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual('Proxy called. proxy: 5os0vpPAcf8');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0073 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0074
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0074
     * @tc.desc      windowProxyMessageOf(proxyType="BEHlHd7cP") returns "owProxy called. proxy: BEHlHd7cP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0074 begin`);
      const actual: string = windowProxyMessageOf('BEHlHd7cP');
      logInfo(`windowProxyMessageOf(proxyType="BEHlHd7cP"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`windowProxyMessageOf(proxyType="BEHlHd7cP"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="BEHlHd7cP"): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('owProxy called. proxy: BEHlHd7cP');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0074 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0075
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0075
     * @tc.desc      windowProxyMessageOf(proxyType="9JkK") returns "nWindowProxy called. proxy: 9JkK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0075 begin`);
      const actual: string = windowProxyMessageOf('9JkK');
      logInfo(`windowProxyMessageOf(proxyType="9JkK"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`windowProxyMessageOf(proxyType="9JkK"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="9JkK"): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual('nWindowProxy called. proxy: 9JkK');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0075 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0076
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0076
     * @tc.desc      windowProxyMessageOf(proxyType="eM5fgioA4") returns "owProxy called. proxy: eM5fgioA4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0076 begin`);
      const actual: string = windowProxyMessageOf('eM5fgioA4');
      logInfo(`windowProxyMessageOf(proxyType="eM5fgioA4"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`windowProxyMessageOf(proxyType="eM5fgioA4"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="eM5fgioA4"): actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('owProxy called. proxy: eM5fgioA4');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0076 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_WINDOW_PROXY_MESSAGE_OF_0077
     * @tc.name      UIExtensionSamples_WindowProxyMessageOf_0077
     * @tc.desc      windowProxyMessageOf(proxyType="1Tx") returns "onWindowProxy called. proxy: 1Tx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_WindowProxyMessageOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WindowProxyMessageOf_0077 begin`);
      const actual: string = windowProxyMessageOf('1Tx');
      logInfo(`windowProxyMessageOf(proxyType="1Tx"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`windowProxyMessageOf(proxyType="1Tx"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('UIExtensionContentSession.getUIE');
      logInfo(`windowProxyMessageOf(proxyType="1Tx"): actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('onWindowProxy called. proxy: 1Tx');
      logInfo(`${BUNDLE}WindowProxyMessageOf_0077 end`);
    });
  });
}
