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
import { modalMessageOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for modalMessageOf (51 cases). */
export default function modalMessageOf3Test(): void {
  describe('ModalMessageOf3Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0172
     * @tc.name      UIExtensionSamples_ModalMessageOf_0172
     * @tc.desc      modalMessageOf(code=75, message=" ") returns "requestModalUIExtension failed, code is 75, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0172 begin`);
      const actual: string = modalMessageOf(75, ' ');
      logInfo(`modalMessageOf(code=75, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 75, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0172 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0173
     * @tc.name      UIExtensionSamples_ModalMessageOf_0173
     * @tc.desc      modalMessageOf(code=75, message="A") returns "requestModalUIExtension failed, code is 75, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0173 begin`);
      const actual: string = modalMessageOf(75, 'A');
      logInfo(`modalMessageOf(code=75, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 75, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0173 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0174
     * @tc.name      UIExtensionSamples_ModalMessageOf_0174
     * @tc.desc      modalMessageOf(code=75, message="Sample Title 123") returns " 75, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0174 begin`);
      const actual: string = modalMessageOf(75, 'Sample Title 123');
      logInfo(`modalMessageOf(code=75, message="Sample T...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`modalMessageOf(code=75, message="Sample T...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=75, message="Sample T...: actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' 75, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0174 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0175
     * @tc.name      UIExtensionSamples_ModalMessageOf_0175
     * @tc.desc      modalMessageOf(code=75, message="??") returns "d, code is 75, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0175 begin`);
      const actual: string = modalMessageOf(75, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=75, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(57);
      logInfo(`modalMessageOf(code=75, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=75, message="??"): actual.substring(29)=${actual.substring(29)}`);
      expect(actual.substring(29)).assertEqual('d, code is 75, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0175 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0176
     * @tc.name      UIExtensionSamples_ModalMessageOf_0176
     * @tc.desc      modalMessageOf(code=75, message="a") returns "requestModalUIExtension failed, code is 75, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0176 begin`);
      const actual: string = modalMessageOf(75, 'a');
      logInfo(`modalMessageOf(code=75, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 75, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0176 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0177
     * @tc.name      UIExtensionSamples_ModalMessageOf_0177
     * @tc.desc      modalMessageOf(code=75, message="abc") returns "requestModalUIExtension failed, code is 75, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0177 begin`);
      const actual: string = modalMessageOf(75, 'abc');
      logInfo(`modalMessageOf(code=75, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 75, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0177 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0178
     * @tc.name      UIExtensionSamples_ModalMessageOf_0178
     * @tc.desc      modalMessageOf(code=75, message="Hello World") returns "de is 75, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0178 begin`);
      const actual: string = modalMessageOf(75, 'Hello World');
      logInfo(`modalMessageOf(code=75, message="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`modalMessageOf(code=75, message="Hello Wo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=75, message="Hello Wo...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual('de is 75, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0178 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0179
     * @tc.name      UIExtensionSamples_ModalMessageOf_0179
     * @tc.desc      modalMessageOf(code=75, message="123") returns "requestModalUIExtension failed, code is 75, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0179 begin`);
      const actual: string = modalMessageOf(75, '123');
      logInfo(`modalMessageOf(code=75, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 75, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0179 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0180
     * @tc.name      UIExtensionSamples_ModalMessageOf_0180
     * @tc.desc      modalMessageOf(code=125, message="Hello") returns "requestModalUIExtension failed, code is 125, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0180 begin`);
      const actual: string = modalMessageOf(125, 'Hello');
      logInfo(`modalMessageOf(code=125, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 125, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0180 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0181
     * @tc.name      UIExtensionSamples_ModalMessageOf_0181
     * @tc.desc      modalMessageOf(code=125, message="hello world") returns "e is 125, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0181 begin`);
      const actual: string = modalMessageOf(125, 'hello world');
      logInfo(`modalMessageOf(code=125, message="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=125, message="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=125, message="hello w...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 125, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0181 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0182
     * @tc.name      UIExtensionSamples_ModalMessageOf_0182
     * @tc.desc      modalMessageOf(code=125, message="") returns "requestModalUIExtension failed, code is 125, messa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0182 begin`);
      const actual: string = modalMessageOf(125, '');
      logInfo(`modalMessageOf(code=125, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 125, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0182 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0183
     * @tc.name      UIExtensionSamples_ModalMessageOf_0183
     * @tc.desc      modalMessageOf(code=125, message=" ") returns "requestModalUIExtension failed, code is 125, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0183 begin`);
      const actual: string = modalMessageOf(125, ' ');
      logInfo(`modalMessageOf(code=125, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 125, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0183 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0184
     * @tc.name      UIExtensionSamples_ModalMessageOf_0184
     * @tc.desc      modalMessageOf(code=125, message="A") returns "requestModalUIExtension failed, code is 125, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0184 begin`);
      const actual: string = modalMessageOf(125, 'A');
      logInfo(`modalMessageOf(code=125, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 125, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0184 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0185
     * @tc.name      UIExtensionSamples_ModalMessageOf_0185
     * @tc.desc      modalMessageOf(code=125, message="Sample Title 123") returns "125, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0185 begin`);
      const actual: string = modalMessageOf(125, 'Sample Title 123');
      logInfo(`modalMessageOf(code=125, message="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`modalMessageOf(code=125, message="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=125, message="Sample ...: actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('125, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0185 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0186
     * @tc.name      UIExtensionSamples_ModalMessageOf_0186
     * @tc.desc      modalMessageOf(code=125, message="??") returns ", code is 125, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0186 begin`);
      const actual: string = modalMessageOf(125, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=125, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(58);
      logInfo(`modalMessageOf(code=125, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=125, message="??"): actual.substring(30)=${actual.substring(30)}`);
      expect(actual.substring(30)).assertEqual(', code is 125, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0186 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0187
     * @tc.name      UIExtensionSamples_ModalMessageOf_0187
     * @tc.desc      modalMessageOf(code=125, message="a") returns "requestModalUIExtension failed, code is 125, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0187 begin`);
      const actual: string = modalMessageOf(125, 'a');
      logInfo(`modalMessageOf(code=125, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 125, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0187 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0188
     * @tc.name      UIExtensionSamples_ModalMessageOf_0188
     * @tc.desc      modalMessageOf(code=125, message="abc") returns "requestModalUIExtension failed, code is 125, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0188 begin`);
      const actual: string = modalMessageOf(125, 'abc');
      logInfo(`modalMessageOf(code=125, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 125, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0188 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0189
     * @tc.name      UIExtensionSamples_ModalMessageOf_0189
     * @tc.desc      modalMessageOf(code=125, message="Hello World") returns "e is 125, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0189 begin`);
      const actual: string = modalMessageOf(125, 'Hello World');
      logInfo(`modalMessageOf(code=125, message="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=125, message="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=125, message="Hello W...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 125, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0189 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0190
     * @tc.name      UIExtensionSamples_ModalMessageOf_0190
     * @tc.desc      modalMessageOf(code=125, message="123") returns "requestModalUIExtension failed, code is 125, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0190 begin`);
      const actual: string = modalMessageOf(125, '123');
      logInfo(`modalMessageOf(code=125, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 125, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0190 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0191
     * @tc.name      UIExtensionSamples_ModalMessageOf_0191
     * @tc.desc      modalMessageOf(code=150, message="Hello") returns "requestModalUIExtension failed, code is 150, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0191 begin`);
      const actual: string = modalMessageOf(150, 'Hello');
      logInfo(`modalMessageOf(code=150, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 150, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0191 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0192
     * @tc.name      UIExtensionSamples_ModalMessageOf_0192
     * @tc.desc      modalMessageOf(code=150, message="hello world") returns "e is 150, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0192 begin`);
      const actual: string = modalMessageOf(150, 'hello world');
      logInfo(`modalMessageOf(code=150, message="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=150, message="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=150, message="hello w...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 150, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0192 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0193
     * @tc.name      UIExtensionSamples_ModalMessageOf_0193
     * @tc.desc      modalMessageOf(code=150, message="") returns "requestModalUIExtension failed, code is 150, messa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0193 begin`);
      const actual: string = modalMessageOf(150, '');
      logInfo(`modalMessageOf(code=150, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 150, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0193 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0194
     * @tc.name      UIExtensionSamples_ModalMessageOf_0194
     * @tc.desc      modalMessageOf(code=150, message=" ") returns "requestModalUIExtension failed, code is 150, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0194 begin`);
      const actual: string = modalMessageOf(150, ' ');
      logInfo(`modalMessageOf(code=150, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 150, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0194 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0195
     * @tc.name      UIExtensionSamples_ModalMessageOf_0195
     * @tc.desc      modalMessageOf(code=150, message="A") returns "requestModalUIExtension failed, code is 150, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0195 begin`);
      const actual: string = modalMessageOf(150, 'A');
      logInfo(`modalMessageOf(code=150, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 150, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0195 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0196
     * @tc.name      UIExtensionSamples_ModalMessageOf_0196
     * @tc.desc      modalMessageOf(code=150, message="Sample Title 123") returns "150, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0196 begin`);
      const actual: string = modalMessageOf(150, 'Sample Title 123');
      logInfo(`modalMessageOf(code=150, message="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`modalMessageOf(code=150, message="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=150, message="Sample ...: actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('150, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0196 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0197
     * @tc.name      UIExtensionSamples_ModalMessageOf_0197
     * @tc.desc      modalMessageOf(code=150, message="??") returns ", code is 150, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0197 begin`);
      const actual: string = modalMessageOf(150, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=150, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(58);
      logInfo(`modalMessageOf(code=150, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=150, message="??"): actual.substring(30)=${actual.substring(30)}`);
      expect(actual.substring(30)).assertEqual(', code is 150, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0197 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0198
     * @tc.name      UIExtensionSamples_ModalMessageOf_0198
     * @tc.desc      modalMessageOf(code=150, message="a") returns "requestModalUIExtension failed, code is 150, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0198 begin`);
      const actual: string = modalMessageOf(150, 'a');
      logInfo(`modalMessageOf(code=150, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 150, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0198 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0199
     * @tc.name      UIExtensionSamples_ModalMessageOf_0199
     * @tc.desc      modalMessageOf(code=150, message="abc") returns "requestModalUIExtension failed, code is 150, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0199 begin`);
      const actual: string = modalMessageOf(150, 'abc');
      logInfo(`modalMessageOf(code=150, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 150, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0199 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0200
     * @tc.name      UIExtensionSamples_ModalMessageOf_0200
     * @tc.desc      modalMessageOf(code=150, message="Hello World") returns "e is 150, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0200 begin`);
      const actual: string = modalMessageOf(150, 'Hello World');
      logInfo(`modalMessageOf(code=150, message="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=150, message="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=150, message="Hello W...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 150, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0200 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0201
     * @tc.name      UIExtensionSamples_ModalMessageOf_0201
     * @tc.desc      modalMessageOf(code=150, message="123") returns "requestModalUIExtension failed, code is 150, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0201 begin`);
      const actual: string = modalMessageOf(150, '123');
      logInfo(`modalMessageOf(code=150, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 150, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0201 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0202
     * @tc.name      UIExtensionSamples_ModalMessageOf_0202
     * @tc.desc      modalMessageOf(code=175, message="Hello") returns "requestModalUIExtension failed, code is 175, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0202 begin`);
      const actual: string = modalMessageOf(175, 'Hello');
      logInfo(`modalMessageOf(code=175, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 175, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0202 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0203
     * @tc.name      UIExtensionSamples_ModalMessageOf_0203
     * @tc.desc      modalMessageOf(code=175, message="hello world") returns "e is 175, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0203 begin`);
      const actual: string = modalMessageOf(175, 'hello world');
      logInfo(`modalMessageOf(code=175, message="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=175, message="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=175, message="hello w...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 175, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0203 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0204
     * @tc.name      UIExtensionSamples_ModalMessageOf_0204
     * @tc.desc      modalMessageOf(code=175, message="") returns "requestModalUIExtension failed, code is 175, messa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0204 begin`);
      const actual: string = modalMessageOf(175, '');
      logInfo(`modalMessageOf(code=175, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 175, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0204 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0205
     * @tc.name      UIExtensionSamples_ModalMessageOf_0205
     * @tc.desc      modalMessageOf(code=175, message=" ") returns "requestModalUIExtension failed, code is 175, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0205 begin`);
      const actual: string = modalMessageOf(175, ' ');
      logInfo(`modalMessageOf(code=175, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 175, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0205 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0206
     * @tc.name      UIExtensionSamples_ModalMessageOf_0206
     * @tc.desc      modalMessageOf(code=175, message="A") returns "requestModalUIExtension failed, code is 175, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0206 begin`);
      const actual: string = modalMessageOf(175, 'A');
      logInfo(`modalMessageOf(code=175, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 175, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0206 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0207
     * @tc.name      UIExtensionSamples_ModalMessageOf_0207
     * @tc.desc      modalMessageOf(code=175, message="Sample Title 123") returns "175, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0207 begin`);
      const actual: string = modalMessageOf(175, 'Sample Title 123');
      logInfo(`modalMessageOf(code=175, message="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`modalMessageOf(code=175, message="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=175, message="Sample ...: actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('175, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0207 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0208
     * @tc.name      UIExtensionSamples_ModalMessageOf_0208
     * @tc.desc      modalMessageOf(code=175, message="??") returns ", code is 175, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0208 begin`);
      const actual: string = modalMessageOf(175, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=175, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(58);
      logInfo(`modalMessageOf(code=175, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=175, message="??"): actual.substring(30)=${actual.substring(30)}`);
      expect(actual.substring(30)).assertEqual(', code is 175, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0208 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0209
     * @tc.name      UIExtensionSamples_ModalMessageOf_0209
     * @tc.desc      modalMessageOf(code=175, message="a") returns "requestModalUIExtension failed, code is 175, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0209 begin`);
      const actual: string = modalMessageOf(175, 'a');
      logInfo(`modalMessageOf(code=175, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 175, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0209 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0210
     * @tc.name      UIExtensionSamples_ModalMessageOf_0210
     * @tc.desc      modalMessageOf(code=175, message="abc") returns "requestModalUIExtension failed, code is 175, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0210 begin`);
      const actual: string = modalMessageOf(175, 'abc');
      logInfo(`modalMessageOf(code=175, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 175, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0210 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0211
     * @tc.name      UIExtensionSamples_ModalMessageOf_0211
     * @tc.desc      modalMessageOf(code=175, message="Hello World") returns "e is 175, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0211 begin`);
      const actual: string = modalMessageOf(175, 'Hello World');
      logInfo(`modalMessageOf(code=175, message="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=175, message="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=175, message="Hello W...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 175, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0211 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0212
     * @tc.name      UIExtensionSamples_ModalMessageOf_0212
     * @tc.desc      modalMessageOf(code=175, message="123") returns "requestModalUIExtension failed, code is 175, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0212 begin`);
      const actual: string = modalMessageOf(175, '123');
      logInfo(`modalMessageOf(code=175, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 175, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0212 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0213
     * @tc.name      UIExtensionSamples_ModalMessageOf_0213
     * @tc.desc      modalMessageOf(code=225, message="Hello") returns "requestModalUIExtension failed, code is 225, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0213 begin`);
      const actual: string = modalMessageOf(225, 'Hello');
      logInfo(`modalMessageOf(code=225, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 225, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0213 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0214
     * @tc.name      UIExtensionSamples_ModalMessageOf_0214
     * @tc.desc      modalMessageOf(code=225, message="hello world") returns "e is 225, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0214 begin`);
      const actual: string = modalMessageOf(225, 'hello world');
      logInfo(`modalMessageOf(code=225, message="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=225, message="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=225, message="hello w...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 225, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0214 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0215
     * @tc.name      UIExtensionSamples_ModalMessageOf_0215
     * @tc.desc      modalMessageOf(code=225, message="") returns "requestModalUIExtension failed, code is 225, messa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0215 begin`);
      const actual: string = modalMessageOf(225, '');
      logInfo(`modalMessageOf(code=225, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 225, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0215 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0216
     * @tc.name      UIExtensionSamples_ModalMessageOf_0216
     * @tc.desc      modalMessageOf(code=225, message=" ") returns "requestModalUIExtension failed, code is 225, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0216 begin`);
      const actual: string = modalMessageOf(225, ' ');
      logInfo(`modalMessageOf(code=225, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 225, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0216 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0217
     * @tc.name      UIExtensionSamples_ModalMessageOf_0217
     * @tc.desc      modalMessageOf(code=225, message="A") returns "requestModalUIExtension failed, code is 225, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0217 begin`);
      const actual: string = modalMessageOf(225, 'A');
      logInfo(`modalMessageOf(code=225, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 225, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0217 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0218
     * @tc.name      UIExtensionSamples_ModalMessageOf_0218
     * @tc.desc      modalMessageOf(code=225, message="Sample Title 123") returns "225, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0218 begin`);
      const actual: string = modalMessageOf(225, 'Sample Title 123');
      logInfo(`modalMessageOf(code=225, message="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`modalMessageOf(code=225, message="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=225, message="Sample ...: actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('225, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0218 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0219
     * @tc.name      UIExtensionSamples_ModalMessageOf_0219
     * @tc.desc      modalMessageOf(code=225, message="??") returns ", code is 225, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0219 begin`);
      const actual: string = modalMessageOf(225, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=225, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(58);
      logInfo(`modalMessageOf(code=225, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=225, message="??"): actual.substring(30)=${actual.substring(30)}`);
      expect(actual.substring(30)).assertEqual(', code is 225, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0219 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0220
     * @tc.name      UIExtensionSamples_ModalMessageOf_0220
     * @tc.desc      modalMessageOf(code=225, message="a") returns "requestModalUIExtension failed, code is 225, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0220 begin`);
      const actual: string = modalMessageOf(225, 'a');
      logInfo(`modalMessageOf(code=225, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 225, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0220 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0221
     * @tc.name      UIExtensionSamples_ModalMessageOf_0221
     * @tc.desc      modalMessageOf(code=225, message="abc") returns "requestModalUIExtension failed, code is 225, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0221 begin`);
      const actual: string = modalMessageOf(225, 'abc');
      logInfo(`modalMessageOf(code=225, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 225, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0221 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0222
     * @tc.name      UIExtensionSamples_ModalMessageOf_0222
     * @tc.desc      modalMessageOf(code=225, message="Hello World") returns "e is 225, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0222 begin`);
      const actual: string = modalMessageOf(225, 'Hello World');
      logInfo(`modalMessageOf(code=225, message="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=225, message="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=225, message="Hello W...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 225, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0222 end`);
    });
  });
}
