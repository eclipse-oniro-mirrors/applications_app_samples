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

/** Logic checks for modalMessageOf (88 cases). */
export default function modalMessageOf2Test(): void {
  describe('ModalMessageOf2Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0084
     * @tc.name      UIExtensionSamples_ModalMessageOf_0084
     * @tc.desc      modalMessageOf(code=404, message=" ") returns "requestModalUIExtension failed, code is 404, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0084 begin`);
      const actual: string = modalMessageOf(404, ' ');
      logInfo(`modalMessageOf(code=404, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 404, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0084 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0085
     * @tc.name      UIExtensionSamples_ModalMessageOf_0085
     * @tc.desc      modalMessageOf(code=404, message="A") returns "requestModalUIExtension failed, code is 404, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0085 begin`);
      const actual: string = modalMessageOf(404, 'A');
      logInfo(`modalMessageOf(code=404, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 404, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0085 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0086
     * @tc.name      UIExtensionSamples_ModalMessageOf_0086
     * @tc.desc      modalMessageOf(code=404, message="Sample Title 123") returns "404, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0086 begin`);
      const actual: string = modalMessageOf(404, 'Sample Title 123');
      logInfo(`modalMessageOf(code=404, message="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`modalMessageOf(code=404, message="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=404, message="Sample ...: actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('404, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0086 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0087
     * @tc.name      UIExtensionSamples_ModalMessageOf_0087
     * @tc.desc      modalMessageOf(code=404, message="??") returns ", code is 404, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0087 begin`);
      const actual: string = modalMessageOf(404, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=404, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(58);
      logInfo(`modalMessageOf(code=404, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=404, message="??"): actual.substring(30)=${actual.substring(30)}`);
      expect(actual.substring(30)).assertEqual(', code is 404, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0087 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0088
     * @tc.name      UIExtensionSamples_ModalMessageOf_0088
     * @tc.desc      modalMessageOf(code=404, message="a") returns "requestModalUIExtension failed, code is 404, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0088 begin`);
      const actual: string = modalMessageOf(404, 'a');
      logInfo(`modalMessageOf(code=404, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 404, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0088 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0089
     * @tc.name      UIExtensionSamples_ModalMessageOf_0089
     * @tc.desc      modalMessageOf(code=404, message="abc") returns "requestModalUIExtension failed, code is 404, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0089 begin`);
      const actual: string = modalMessageOf(404, 'abc');
      logInfo(`modalMessageOf(code=404, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 404, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0089 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0090
     * @tc.name      UIExtensionSamples_ModalMessageOf_0090
     * @tc.desc      modalMessageOf(code=404, message="Hello World") returns "e is 404, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0090 begin`);
      const actual: string = modalMessageOf(404, 'Hello World');
      logInfo(`modalMessageOf(code=404, message="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=404, message="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=404, message="Hello W...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 404, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0090 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0091
     * @tc.name      UIExtensionSamples_ModalMessageOf_0091
     * @tc.desc      modalMessageOf(code=404, message="123") returns "requestModalUIExtension failed, code is 404, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0091 begin`);
      const actual: string = modalMessageOf(404, '123');
      logInfo(`modalMessageOf(code=404, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 404, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0091 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0092
     * @tc.name      UIExtensionSamples_ModalMessageOf_0092
     * @tc.desc      modalMessageOf(code=500, message="Hello") returns "requestModalUIExtension failed, code is 500, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0092 begin`);
      const actual: string = modalMessageOf(500, 'Hello');
      logInfo(`modalMessageOf(code=500, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 500, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0092 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0093
     * @tc.name      UIExtensionSamples_ModalMessageOf_0093
     * @tc.desc      modalMessageOf(code=500, message="hello world") returns "e is 500, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0093 begin`);
      const actual: string = modalMessageOf(500, 'hello world');
      logInfo(`modalMessageOf(code=500, message="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=500, message="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=500, message="hello w...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 500, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0093 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0094
     * @tc.name      UIExtensionSamples_ModalMessageOf_0094
     * @tc.desc      modalMessageOf(code=500, message="") returns "requestModalUIExtension failed, code is 500, messa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0094 begin`);
      const actual: string = modalMessageOf(500, '');
      logInfo(`modalMessageOf(code=500, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 500, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0094 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0095
     * @tc.name      UIExtensionSamples_ModalMessageOf_0095
     * @tc.desc      modalMessageOf(code=500, message=" ") returns "requestModalUIExtension failed, code is 500, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0095 begin`);
      const actual: string = modalMessageOf(500, ' ');
      logInfo(`modalMessageOf(code=500, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 500, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0095 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0096
     * @tc.name      UIExtensionSamples_ModalMessageOf_0096
     * @tc.desc      modalMessageOf(code=500, message="A") returns "requestModalUIExtension failed, code is 500, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0096 begin`);
      const actual: string = modalMessageOf(500, 'A');
      logInfo(`modalMessageOf(code=500, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 500, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0096 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0097
     * @tc.name      UIExtensionSamples_ModalMessageOf_0097
     * @tc.desc      modalMessageOf(code=500, message="Sample Title 123") returns "500, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0097 begin`);
      const actual: string = modalMessageOf(500, 'Sample Title 123');
      logInfo(`modalMessageOf(code=500, message="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`modalMessageOf(code=500, message="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=500, message="Sample ...: actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('500, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0097 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0098
     * @tc.name      UIExtensionSamples_ModalMessageOf_0098
     * @tc.desc      modalMessageOf(code=500, message="??") returns ", code is 500, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0098 begin`);
      const actual: string = modalMessageOf(500, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=500, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(58);
      logInfo(`modalMessageOf(code=500, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=500, message="??"): actual.substring(30)=${actual.substring(30)}`);
      expect(actual.substring(30)).assertEqual(', code is 500, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0098 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0099
     * @tc.name      UIExtensionSamples_ModalMessageOf_0099
     * @tc.desc      modalMessageOf(code=500, message="a") returns "requestModalUIExtension failed, code is 500, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0099 begin`);
      const actual: string = modalMessageOf(500, 'a');
      logInfo(`modalMessageOf(code=500, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 500, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0099 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0100
     * @tc.name      UIExtensionSamples_ModalMessageOf_0100
     * @tc.desc      modalMessageOf(code=500, message="abc") returns "requestModalUIExtension failed, code is 500, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0100 begin`);
      const actual: string = modalMessageOf(500, 'abc');
      logInfo(`modalMessageOf(code=500, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 500, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0100 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0101
     * @tc.name      UIExtensionSamples_ModalMessageOf_0101
     * @tc.desc      modalMessageOf(code=500, message="Hello World") returns "e is 500, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0101 begin`);
      const actual: string = modalMessageOf(500, 'Hello World');
      logInfo(`modalMessageOf(code=500, message="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=500, message="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=500, message="Hello W...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 500, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0101 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0102
     * @tc.name      UIExtensionSamples_ModalMessageOf_0102
     * @tc.desc      modalMessageOf(code=500, message="123") returns "requestModalUIExtension failed, code is 500, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0102 begin`);
      const actual: string = modalMessageOf(500, '123');
      logInfo(`modalMessageOf(code=500, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 500, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0102 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0103
     * @tc.name      UIExtensionSamples_ModalMessageOf_0103
     * @tc.desc      modalMessageOf(code=2, message="Hello") returns "requestModalUIExtension failed, code is 2, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0103 begin`);
      const actual: string = modalMessageOf(2, 'Hello');
      logInfo(`modalMessageOf(code=2, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 2, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0103 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0104
     * @tc.name      UIExtensionSamples_ModalMessageOf_0104
     * @tc.desc      modalMessageOf(code=2, message="hello world") returns "ode is 2, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0104 begin`);
      const actual: string = modalMessageOf(2, 'hello world');
      logInfo(`modalMessageOf(code=2, message="hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`modalMessageOf(code=2, message="hello wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=2, message="hello wor...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('ode is 2, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0104 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0105
     * @tc.name      UIExtensionSamples_ModalMessageOf_0105
     * @tc.desc      modalMessageOf(code=2, message="") returns "requestModalUIExtension failed, code is 2, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0105 begin`);
      const actual: string = modalMessageOf(2, '');
      logInfo(`modalMessageOf(code=2, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 2, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0105 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0106
     * @tc.name      UIExtensionSamples_ModalMessageOf_0106
     * @tc.desc      modalMessageOf(code=2, message=" ") returns "requestModalUIExtension failed, code is 2, message ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0106 begin`);
      const actual: string = modalMessageOf(2, ' ');
      logInfo(`modalMessageOf(code=2, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 2, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0106 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0107
     * @tc.name      UIExtensionSamples_ModalMessageOf_0107
     * @tc.desc      modalMessageOf(code=2, message="A") returns "requestModalUIExtension failed, code is 2, message ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0107 begin`);
      const actual: string = modalMessageOf(2, 'A');
      logInfo(`modalMessageOf(code=2, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 2, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0107 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0108
     * @tc.name      UIExtensionSamples_ModalMessageOf_0108
     * @tc.desc      modalMessageOf(code=2, message="Sample Title 123") returns "s 2, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0108 begin`);
      const actual: string = modalMessageOf(2, 'Sample Title 123');
      logInfo(`modalMessageOf(code=2, message="Sample Ti...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`modalMessageOf(code=2, message="Sample Ti...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=2, message="Sample Ti...: actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('s 2, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0108 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0109
     * @tc.name      UIExtensionSamples_ModalMessageOf_0109
     * @tc.desc      modalMessageOf(code=2, message="??") returns "ed, code is 2, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0109 begin`);
      const actual: string = modalMessageOf(2, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=2, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(56);
      logInfo(`modalMessageOf(code=2, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=2, message="??"): actual.substring(28)=${actual.substring(28)}`);
      expect(actual.substring(28)).assertEqual('ed, code is 2, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0109 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0110
     * @tc.name      UIExtensionSamples_ModalMessageOf_0110
     * @tc.desc      modalMessageOf(code=2, message="a") returns "requestModalUIExtension failed, code is 2, message ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0110 begin`);
      const actual: string = modalMessageOf(2, 'a');
      logInfo(`modalMessageOf(code=2, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 2, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0110 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0111
     * @tc.name      UIExtensionSamples_ModalMessageOf_0111
     * @tc.desc      modalMessageOf(code=2, message="abc") returns "requestModalUIExtension failed, code is 2, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0111 begin`);
      const actual: string = modalMessageOf(2, 'abc');
      logInfo(`modalMessageOf(code=2, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 2, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0111 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0112
     * @tc.name      UIExtensionSamples_ModalMessageOf_0112
     * @tc.desc      modalMessageOf(code=2, message="Hello World") returns "ode is 2, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0112 begin`);
      const actual: string = modalMessageOf(2, 'Hello World');
      logInfo(`modalMessageOf(code=2, message="Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`modalMessageOf(code=2, message="Hello Wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=2, message="Hello Wor...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('ode is 2, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0112 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0113
     * @tc.name      UIExtensionSamples_ModalMessageOf_0113
     * @tc.desc      modalMessageOf(code=2, message="123") returns "requestModalUIExtension failed, code is 2, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0113 begin`);
      const actual: string = modalMessageOf(2, '123');
      logInfo(`modalMessageOf(code=2, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 2, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0113 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0114
     * @tc.name      UIExtensionSamples_ModalMessageOf_0114
     * @tc.desc      modalMessageOf(code=3, message="Hello") returns "requestModalUIExtension failed, code is 3, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0114 begin`);
      const actual: string = modalMessageOf(3, 'Hello');
      logInfo(`modalMessageOf(code=3, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 3, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0114 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0115
     * @tc.name      UIExtensionSamples_ModalMessageOf_0115
     * @tc.desc      modalMessageOf(code=3, message="hello world") returns "ode is 3, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0115 begin`);
      const actual: string = modalMessageOf(3, 'hello world');
      logInfo(`modalMessageOf(code=3, message="hello wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`modalMessageOf(code=3, message="hello wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=3, message="hello wor...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('ode is 3, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0115 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0116
     * @tc.name      UIExtensionSamples_ModalMessageOf_0116
     * @tc.desc      modalMessageOf(code=3, message="") returns "requestModalUIExtension failed, code is 3, message is "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0116 begin`);
      const actual: string = modalMessageOf(3, '');
      logInfo(`modalMessageOf(code=3, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 3, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0116 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0117
     * @tc.name      UIExtensionSamples_ModalMessageOf_0117
     * @tc.desc      modalMessageOf(code=3, message=" ") returns "requestModalUIExtension failed, code is 3, message ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0117 begin`);
      const actual: string = modalMessageOf(3, ' ');
      logInfo(`modalMessageOf(code=3, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 3, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0117 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0118
     * @tc.name      UIExtensionSamples_ModalMessageOf_0118
     * @tc.desc      modalMessageOf(code=3, message="A") returns "requestModalUIExtension failed, code is 3, message ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0118 begin`);
      const actual: string = modalMessageOf(3, 'A');
      logInfo(`modalMessageOf(code=3, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 3, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0118 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0119
     * @tc.name      UIExtensionSamples_ModalMessageOf_0119
     * @tc.desc      modalMessageOf(code=3, message="Sample Title 123") returns "s 3, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0119 begin`);
      const actual: string = modalMessageOf(3, 'Sample Title 123');
      logInfo(`modalMessageOf(code=3, message="Sample Ti...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`modalMessageOf(code=3, message="Sample Ti...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=3, message="Sample Ti...: actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('s 3, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0119 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0120
     * @tc.name      UIExtensionSamples_ModalMessageOf_0120
     * @tc.desc      modalMessageOf(code=3, message="??") returns "ed, code is 3, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0120 begin`);
      const actual: string = modalMessageOf(3, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=3, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(56);
      logInfo(`modalMessageOf(code=3, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=3, message="??"): actual.substring(28)=${actual.substring(28)}`);
      expect(actual.substring(28)).assertEqual('ed, code is 3, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0120 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0121
     * @tc.name      UIExtensionSamples_ModalMessageOf_0121
     * @tc.desc      modalMessageOf(code=3, message="a") returns "requestModalUIExtension failed, code is 3, message ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0121 begin`);
      const actual: string = modalMessageOf(3, 'a');
      logInfo(`modalMessageOf(code=3, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 3, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0121 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0122
     * @tc.name      UIExtensionSamples_ModalMessageOf_0122
     * @tc.desc      modalMessageOf(code=3, message="abc") returns "requestModalUIExtension failed, code is 3, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0122 begin`);
      const actual: string = modalMessageOf(3, 'abc');
      logInfo(`modalMessageOf(code=3, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 3, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0122 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0123
     * @tc.name      UIExtensionSamples_ModalMessageOf_0123
     * @tc.desc      modalMessageOf(code=3, message="Hello World") returns "ode is 3, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0123 begin`);
      const actual: string = modalMessageOf(3, 'Hello World');
      logInfo(`modalMessageOf(code=3, message="Hello Wor...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`modalMessageOf(code=3, message="Hello Wor...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=3, message="Hello Wor...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('ode is 3, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0123 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0124
     * @tc.name      UIExtensionSamples_ModalMessageOf_0124
     * @tc.desc      modalMessageOf(code=3, message="123") returns "requestModalUIExtension failed, code is 3, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0124 begin`);
      const actual: string = modalMessageOf(3, '123');
      logInfo(`modalMessageOf(code=3, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 3, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0124 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0125
     * @tc.name      UIExtensionSamples_ModalMessageOf_0125
     * @tc.desc      modalMessageOf(code=10, message="Hello") returns "requestModalUIExtension failed, code is 10, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0125 begin`);
      const actual: string = modalMessageOf(10, 'Hello');
      logInfo(`modalMessageOf(code=10, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 10, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0125 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0126
     * @tc.name      UIExtensionSamples_ModalMessageOf_0126
     * @tc.desc      modalMessageOf(code=10, message="hello world") returns "de is 10, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0126 begin`);
      const actual: string = modalMessageOf(10, 'hello world');
      logInfo(`modalMessageOf(code=10, message="hello wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`modalMessageOf(code=10, message="hello wo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=10, message="hello wo...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual('de is 10, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0126 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0127
     * @tc.name      UIExtensionSamples_ModalMessageOf_0127
     * @tc.desc      modalMessageOf(code=10, message="") returns "requestModalUIExtension failed, code is 10, message...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0127 begin`);
      const actual: string = modalMessageOf(10, '');
      logInfo(`modalMessageOf(code=10, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 10, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0127 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0128
     * @tc.name      UIExtensionSamples_ModalMessageOf_0128
     * @tc.desc      modalMessageOf(code=10, message=" ") returns "requestModalUIExtension failed, code is 10, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0128 begin`);
      const actual: string = modalMessageOf(10, ' ');
      logInfo(`modalMessageOf(code=10, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 10, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0128 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0129
     * @tc.name      UIExtensionSamples_ModalMessageOf_0129
     * @tc.desc      modalMessageOf(code=10, message="A") returns "requestModalUIExtension failed, code is 10, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0129 begin`);
      const actual: string = modalMessageOf(10, 'A');
      logInfo(`modalMessageOf(code=10, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 10, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0129 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0130
     * @tc.name      UIExtensionSamples_ModalMessageOf_0130
     * @tc.desc      modalMessageOf(code=10, message="Sample Title 123") returns " 10, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0130 begin`);
      const actual: string = modalMessageOf(10, 'Sample Title 123');
      logInfo(`modalMessageOf(code=10, message="Sample T...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`modalMessageOf(code=10, message="Sample T...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=10, message="Sample T...: actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' 10, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0130 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0131
     * @tc.name      UIExtensionSamples_ModalMessageOf_0131
     * @tc.desc      modalMessageOf(code=10, message="??") returns "d, code is 10, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0131 begin`);
      const actual: string = modalMessageOf(10, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=10, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(57);
      logInfo(`modalMessageOf(code=10, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=10, message="??"): actual.substring(29)=${actual.substring(29)}`);
      expect(actual.substring(29)).assertEqual('d, code is 10, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0131 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0132
     * @tc.name      UIExtensionSamples_ModalMessageOf_0132
     * @tc.desc      modalMessageOf(code=10, message="a") returns "requestModalUIExtension failed, code is 10, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0132 begin`);
      const actual: string = modalMessageOf(10, 'a');
      logInfo(`modalMessageOf(code=10, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 10, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0132 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0133
     * @tc.name      UIExtensionSamples_ModalMessageOf_0133
     * @tc.desc      modalMessageOf(code=10, message="abc") returns "requestModalUIExtension failed, code is 10, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0133 begin`);
      const actual: string = modalMessageOf(10, 'abc');
      logInfo(`modalMessageOf(code=10, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 10, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0133 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0134
     * @tc.name      UIExtensionSamples_ModalMessageOf_0134
     * @tc.desc      modalMessageOf(code=10, message="Hello World") returns "de is 10, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0134 begin`);
      const actual: string = modalMessageOf(10, 'Hello World');
      logInfo(`modalMessageOf(code=10, message="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`modalMessageOf(code=10, message="Hello Wo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=10, message="Hello Wo...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual('de is 10, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0134 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0135
     * @tc.name      UIExtensionSamples_ModalMessageOf_0135
     * @tc.desc      modalMessageOf(code=10, message="123") returns "requestModalUIExtension failed, code is 10, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0135 begin`);
      const actual: string = modalMessageOf(10, '123');
      logInfo(`modalMessageOf(code=10, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 10, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0135 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0136
     * @tc.name      UIExtensionSamples_ModalMessageOf_0136
     * @tc.desc      modalMessageOf(code=100, message="Hello") returns "requestModalUIExtension failed, code is 100, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0136 begin`);
      const actual: string = modalMessageOf(100, 'Hello');
      logInfo(`modalMessageOf(code=100, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 100, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0136 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0137
     * @tc.name      UIExtensionSamples_ModalMessageOf_0137
     * @tc.desc      modalMessageOf(code=100, message="hello world") returns "e is 100, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0137 begin`);
      const actual: string = modalMessageOf(100, 'hello world');
      logInfo(`modalMessageOf(code=100, message="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=100, message="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=100, message="hello w...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 100, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0137 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0138
     * @tc.name      UIExtensionSamples_ModalMessageOf_0138
     * @tc.desc      modalMessageOf(code=100, message="") returns "requestModalUIExtension failed, code is 100, messa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0138 begin`);
      const actual: string = modalMessageOf(100, '');
      logInfo(`modalMessageOf(code=100, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 100, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0138 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0139
     * @tc.name      UIExtensionSamples_ModalMessageOf_0139
     * @tc.desc      modalMessageOf(code=100, message=" ") returns "requestModalUIExtension failed, code is 100, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0139 begin`);
      const actual: string = modalMessageOf(100, ' ');
      logInfo(`modalMessageOf(code=100, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 100, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0139 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0140
     * @tc.name      UIExtensionSamples_ModalMessageOf_0140
     * @tc.desc      modalMessageOf(code=100, message="A") returns "requestModalUIExtension failed, code is 100, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0140 begin`);
      const actual: string = modalMessageOf(100, 'A');
      logInfo(`modalMessageOf(code=100, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 100, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0140 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0141
     * @tc.name      UIExtensionSamples_ModalMessageOf_0141
     * @tc.desc      modalMessageOf(code=100, message="Sample Title 123") returns "100, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0141 begin`);
      const actual: string = modalMessageOf(100, 'Sample Title 123');
      logInfo(`modalMessageOf(code=100, message="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`modalMessageOf(code=100, message="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=100, message="Sample ...: actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('100, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0141 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0142
     * @tc.name      UIExtensionSamples_ModalMessageOf_0142
     * @tc.desc      modalMessageOf(code=100, message="??") returns ", code is 100, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0142 begin`);
      const actual: string = modalMessageOf(100, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=100, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(58);
      logInfo(`modalMessageOf(code=100, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=100, message="??"): actual.substring(30)=${actual.substring(30)}`);
      expect(actual.substring(30)).assertEqual(', code is 100, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0142 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0143
     * @tc.name      UIExtensionSamples_ModalMessageOf_0143
     * @tc.desc      modalMessageOf(code=100, message="a") returns "requestModalUIExtension failed, code is 100, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0143 begin`);
      const actual: string = modalMessageOf(100, 'a');
      logInfo(`modalMessageOf(code=100, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 100, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0143 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0144
     * @tc.name      UIExtensionSamples_ModalMessageOf_0144
     * @tc.desc      modalMessageOf(code=100, message="abc") returns "requestModalUIExtension failed, code is 100, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0144 begin`);
      const actual: string = modalMessageOf(100, 'abc');
      logInfo(`modalMessageOf(code=100, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 100, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0144 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0145
     * @tc.name      UIExtensionSamples_ModalMessageOf_0145
     * @tc.desc      modalMessageOf(code=100, message="Hello World") returns "e is 100, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0145 begin`);
      const actual: string = modalMessageOf(100, 'Hello World');
      logInfo(`modalMessageOf(code=100, message="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`modalMessageOf(code=100, message="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=100, message="Hello W...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('e is 100, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0145 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0146
     * @tc.name      UIExtensionSamples_ModalMessageOf_0146
     * @tc.desc      modalMessageOf(code=100, message="123") returns "requestModalUIExtension failed, code is 100, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0146 begin`);
      const actual: string = modalMessageOf(100, '123');
      logInfo(`modalMessageOf(code=100, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 100, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0146 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0147
     * @tc.name      UIExtensionSamples_ModalMessageOf_0147
     * @tc.desc      modalMessageOf(code=25, message="Hello") returns "requestModalUIExtension failed, code is 25, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0147 begin`);
      const actual: string = modalMessageOf(25, 'Hello');
      logInfo(`modalMessageOf(code=25, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 25, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0147 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0148
     * @tc.name      UIExtensionSamples_ModalMessageOf_0148
     * @tc.desc      modalMessageOf(code=25, message="hello world") returns "de is 25, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0148 begin`);
      const actual: string = modalMessageOf(25, 'hello world');
      logInfo(`modalMessageOf(code=25, message="hello wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`modalMessageOf(code=25, message="hello wo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=25, message="hello wo...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual('de is 25, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0148 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0149
     * @tc.name      UIExtensionSamples_ModalMessageOf_0149
     * @tc.desc      modalMessageOf(code=25, message="") returns "requestModalUIExtension failed, code is 25, message...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0149 begin`);
      const actual: string = modalMessageOf(25, '');
      logInfo(`modalMessageOf(code=25, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 25, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0149 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0150
     * @tc.name      UIExtensionSamples_ModalMessageOf_0150
     * @tc.desc      modalMessageOf(code=25, message=" ") returns "requestModalUIExtension failed, code is 25, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0150 begin`);
      const actual: string = modalMessageOf(25, ' ');
      logInfo(`modalMessageOf(code=25, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 25, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0150 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0151
     * @tc.name      UIExtensionSamples_ModalMessageOf_0151
     * @tc.desc      modalMessageOf(code=25, message="A") returns "requestModalUIExtension failed, code is 25, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0151 begin`);
      const actual: string = modalMessageOf(25, 'A');
      logInfo(`modalMessageOf(code=25, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 25, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0151 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0152
     * @tc.name      UIExtensionSamples_ModalMessageOf_0152
     * @tc.desc      modalMessageOf(code=25, message="Sample Title 123") returns " 25, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0152 begin`);
      const actual: string = modalMessageOf(25, 'Sample Title 123');
      logInfo(`modalMessageOf(code=25, message="Sample T...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`modalMessageOf(code=25, message="Sample T...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=25, message="Sample T...: actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' 25, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0152 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0153
     * @tc.name      UIExtensionSamples_ModalMessageOf_0153
     * @tc.desc      modalMessageOf(code=25, message="??") returns "d, code is 25, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0153 begin`);
      const actual: string = modalMessageOf(25, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=25, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(57);
      logInfo(`modalMessageOf(code=25, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=25, message="??"): actual.substring(29)=${actual.substring(29)}`);
      expect(actual.substring(29)).assertEqual('d, code is 25, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0153 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0154
     * @tc.name      UIExtensionSamples_ModalMessageOf_0154
     * @tc.desc      modalMessageOf(code=25, message="a") returns "requestModalUIExtension failed, code is 25, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0154 begin`);
      const actual: string = modalMessageOf(25, 'a');
      logInfo(`modalMessageOf(code=25, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 25, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0154 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0155
     * @tc.name      UIExtensionSamples_ModalMessageOf_0155
     * @tc.desc      modalMessageOf(code=25, message="abc") returns "requestModalUIExtension failed, code is 25, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0155 begin`);
      const actual: string = modalMessageOf(25, 'abc');
      logInfo(`modalMessageOf(code=25, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 25, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0155 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0156
     * @tc.name      UIExtensionSamples_ModalMessageOf_0156
     * @tc.desc      modalMessageOf(code=25, message="Hello World") returns "de is 25, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0156 begin`);
      const actual: string = modalMessageOf(25, 'Hello World');
      logInfo(`modalMessageOf(code=25, message="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`modalMessageOf(code=25, message="Hello Wo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=25, message="Hello Wo...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual('de is 25, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0156 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0157
     * @tc.name      UIExtensionSamples_ModalMessageOf_0157
     * @tc.desc      modalMessageOf(code=25, message="123") returns "requestModalUIExtension failed, code is 25, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0157 begin`);
      const actual: string = modalMessageOf(25, '123');
      logInfo(`modalMessageOf(code=25, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 25, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0157 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0158
     * @tc.name      UIExtensionSamples_ModalMessageOf_0158
     * @tc.desc      modalMessageOf(code=50, message="Hello") returns "requestModalUIExtension failed, code is 50, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0158 begin`);
      const actual: string = modalMessageOf(50, 'Hello');
      logInfo(`modalMessageOf(code=50, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 50, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0158 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0159
     * @tc.name      UIExtensionSamples_ModalMessageOf_0159
     * @tc.desc      modalMessageOf(code=50, message="hello world") returns "de is 50, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0159 begin`);
      const actual: string = modalMessageOf(50, 'hello world');
      logInfo(`modalMessageOf(code=50, message="hello wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`modalMessageOf(code=50, message="hello wo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=50, message="hello wo...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual('de is 50, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0159 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0160
     * @tc.name      UIExtensionSamples_ModalMessageOf_0160
     * @tc.desc      modalMessageOf(code=50, message="") returns "requestModalUIExtension failed, code is 50, message...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0160 begin`);
      const actual: string = modalMessageOf(50, '');
      logInfo(`modalMessageOf(code=50, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 50, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0160 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0161
     * @tc.name      UIExtensionSamples_ModalMessageOf_0161
     * @tc.desc      modalMessageOf(code=50, message=" ") returns "requestModalUIExtension failed, code is 50, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0161 begin`);
      const actual: string = modalMessageOf(50, ' ');
      logInfo(`modalMessageOf(code=50, message=" "): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 50, message is  ');
      logInfo(`${BUNDLE}ModalMessageOf_0161 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0162
     * @tc.name      UIExtensionSamples_ModalMessageOf_0162
     * @tc.desc      modalMessageOf(code=50, message="A") returns "requestModalUIExtension failed, code is 50, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0162 begin`);
      const actual: string = modalMessageOf(50, 'A');
      logInfo(`modalMessageOf(code=50, message="A"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 50, message is A');
      logInfo(`${BUNDLE}ModalMessageOf_0162 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0163
     * @tc.name      UIExtensionSamples_ModalMessageOf_0163
     * @tc.desc      modalMessageOf(code=50, message="Sample Title 123") returns " 50, message is Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0163 begin`);
      const actual: string = modalMessageOf(50, 'Sample Title 123');
      logInfo(`modalMessageOf(code=50, message="Sample T...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`modalMessageOf(code=50, message="Sample T...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=50, message="Sample T...: actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' 50, message is Sample Title 123');
      logInfo(`${BUNDLE}ModalMessageOf_0163 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0164
     * @tc.name      UIExtensionSamples_ModalMessageOf_0164
     * @tc.desc      modalMessageOf(code=50, message="??") returns "d, code is 50, message is ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0164 begin`);
      const actual: string = modalMessageOf(50, '\u4e2d\u6587');
      logInfo(`modalMessageOf(code=50, message="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(57);
      logInfo(`modalMessageOf(code=50, message="??"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=50, message="??"): actual.substring(29)=${actual.substring(29)}`);
      expect(actual.substring(29)).assertEqual('d, code is 50, message is \u4e2d\u6587');
      logInfo(`${BUNDLE}ModalMessageOf_0164 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0165
     * @tc.name      UIExtensionSamples_ModalMessageOf_0165
     * @tc.desc      modalMessageOf(code=50, message="a") returns "requestModalUIExtension failed, code is 50, messag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0165 begin`);
      const actual: string = modalMessageOf(50, 'a');
      logInfo(`modalMessageOf(code=50, message="a"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 50, message is a');
      logInfo(`${BUNDLE}ModalMessageOf_0165 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0166
     * @tc.name      UIExtensionSamples_ModalMessageOf_0166
     * @tc.desc      modalMessageOf(code=50, message="abc") returns "requestModalUIExtension failed, code is 50, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0166 begin`);
      const actual: string = modalMessageOf(50, 'abc');
      logInfo(`modalMessageOf(code=50, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 50, message is abc');
      logInfo(`${BUNDLE}ModalMessageOf_0166 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0167
     * @tc.name      UIExtensionSamples_ModalMessageOf_0167
     * @tc.desc      modalMessageOf(code=50, message="Hello World") returns "de is 50, message is Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0167 begin`);
      const actual: string = modalMessageOf(50, 'Hello World');
      logInfo(`modalMessageOf(code=50, message="Hello Wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`modalMessageOf(code=50, message="Hello Wo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=50, message="Hello Wo...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual('de is 50, message is Hello World');
      logInfo(`${BUNDLE}ModalMessageOf_0167 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0168
     * @tc.name      UIExtensionSamples_ModalMessageOf_0168
     * @tc.desc      modalMessageOf(code=50, message="123") returns "requestModalUIExtension failed, code is 50, mess...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0168 begin`);
      const actual: string = modalMessageOf(50, '123');
      logInfo(`modalMessageOf(code=50, message="123"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 50, message is 123');
      logInfo(`${BUNDLE}ModalMessageOf_0168 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0169
     * @tc.name      UIExtensionSamples_ModalMessageOf_0169
     * @tc.desc      modalMessageOf(code=75, message="Hello") returns "requestModalUIExtension failed, code is 75, me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0169 begin`);
      const actual: string = modalMessageOf(75, 'Hello');
      logInfo(`modalMessageOf(code=75, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 75, message is Hello');
      logInfo(`${BUNDLE}ModalMessageOf_0169 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0170
     * @tc.name      UIExtensionSamples_ModalMessageOf_0170
     * @tc.desc      modalMessageOf(code=75, message="hello world") returns "de is 75, message is hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_ModalMessageOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0170 begin`);
      const actual: string = modalMessageOf(75, 'hello world');
      logInfo(`modalMessageOf(code=75, message="hello wo...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`modalMessageOf(code=75, message="hello wo...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('requestModalUIExtension failed, ');
      logInfo(`modalMessageOf(code=75, message="hello wo...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual('de is 75, message is hello world');
      logInfo(`${BUNDLE}ModalMessageOf_0170 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_MODAL_MESSAGE_OF_0171
     * @tc.name      UIExtensionSamples_ModalMessageOf_0171
     * @tc.desc      modalMessageOf(code=75, message="") returns "requestModalUIExtension failed, code is 75, message...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_ModalMessageOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ModalMessageOf_0171 begin`);
      const actual: string = modalMessageOf(75, '');
      logInfo(`modalMessageOf(code=75, message=""): actual=${actual}`);
      expect(actual).assertEqual('requestModalUIExtension failed, code is 75, message is ');
      logInfo(`${BUNDLE}ModalMessageOf_0171 end`);
    });
  });
}
