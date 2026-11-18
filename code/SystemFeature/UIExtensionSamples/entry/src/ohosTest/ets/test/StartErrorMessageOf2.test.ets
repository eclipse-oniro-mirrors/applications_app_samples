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
import { startErrorMessageOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for startErrorMessageOf (87 cases). */
export default function startErrorMessageOf2Test(): void {
  describe('StartErrorMessageOf2Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0090
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0090
     * @tc.desc      startErrorMessageOf(code=0, name="abc", message="Hello World") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0090 begin`);
      const actual: string = startErrorMessageOf(0, 'abc', 'Hello World');
      logInfo(`startErrorMessageOf(code=0, name="abc", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:abc message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0090 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0091
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0091
     * @tc.desc      startErrorMessageOf(code=0, name="Hello World", message="Hello") returns "0 name:Hello World mes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0091 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello World', 'Hello');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('0 name:Hello World message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0091 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0092
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0092
     * @tc.desc      startErrorMessageOf(code=0, name="Hello World", message="hello world") returns ":Hello World mes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0092 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello World', 'hello world');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(':Hello World message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0092 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0093
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0093
     * @tc.desc      startErrorMessageOf(code=0, name="Hello World", message="") returns "startAbilityByType onError,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0093 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello World', '');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:Hello World message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0093 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0094
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0094
     * @tc.desc      startErrorMessageOf(code=0, name="Hello World", message=" ") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0094 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello World', ' ');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:Hello World message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0094 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0095
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0095
     * @tc.desc      startErrorMessageOf(code=0, name="Hello World", message="A") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0095 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello World', 'A');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:Hello World message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0095 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0096
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0096
     * @tc.desc      startErrorMessageOf(code=0, name="Hello World", message="Sample Title 123") returns "o World mes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0096 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello World', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('o World message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0096 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0097
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0097
     * @tc.desc      startErrorMessageOf(code=0, name="Hello World", message="??") returns " name:Hello World message...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0097 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello World', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(62);
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual(' name:Hello World message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0097 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0098
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0098
     * @tc.desc      startErrorMessageOf(code=0, name="Hello World", message="a") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0098 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello World', 'a');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:Hello World message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0098 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0099
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0099
     * @tc.desc      startErrorMessageOf(code=0, name="Hello World", message="abc") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0099 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello World', 'abc');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:Hello World message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0099 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0100
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0100
     * @tc.desc      startErrorMessageOf(code=0, name="Hello World", message="Hello World") returns ":Hello World mes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0100 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello World', 'Hello World');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Hello W...: actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(':Hello World message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0100 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0101
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0101
     * @tc.desc      startErrorMessageOf(code=200, name="Hello", message="Hello") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0101 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello', 'Hello');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:Hello message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0101 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0102
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0102
     * @tc.desc      startErrorMessageOf(code=200, name="Hello", message="hello world") returns "0 name:Hello message...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0102 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello', 'hello world');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('0 name:Hello message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0102 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0103
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0103
     * @tc.desc      startErrorMessageOf(code=200, name="Hello", message="") returns "startAbilityByType onError, cod...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0103 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello', '');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:Hello message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0103 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0104
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0104
     * @tc.desc      startErrorMessageOf(code=200, name="Hello", message=" ") returns "startAbilityByType onError, co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0104 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello', ' ');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:Hello message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0104 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0105
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0105
     * @tc.desc      startErrorMessageOf(code=200, name="Hello", message="A") returns "startAbilityByType onError, co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0105 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello', 'A');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:Hello message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0105 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0106
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0106
     * @tc.desc      startErrorMessageOf(code=200, name="Hello", message="Sample Title 123") returns "e:Hello message...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0106 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('e:Hello message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0106 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0107
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0107
     * @tc.desc      startErrorMessageOf(code=200, name="Hello", message="??") returns "de:200 name:Hello message:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0107 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(58);
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(30)=${actual.substring(30)}`);
      expect(actual.substring(30)).assertEqual('de:200 name:Hello message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0107 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0108
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0108
     * @tc.desc      startErrorMessageOf(code=200, name="Hello", message="a") returns "startAbilityByType onError, co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0108 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello', 'a');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:Hello message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0108 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0109
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0109
     * @tc.desc      startErrorMessageOf(code=200, name="Hello", message="abc") returns "startAbilityByType onError, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0109 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello', 'abc');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:Hello message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0109 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0110
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0110
     * @tc.desc      startErrorMessageOf(code=200, name="Hello", message="Hello World") returns "0 name:Hello message...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0110 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello', 'Hello World');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('0 name:Hello message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0110 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0111
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0111
     * @tc.desc      startErrorMessageOf(code=200, name="hello world", message="Hello") returns "0 name:hello world m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0111 begin`);
      const actual: string = startErrorMessageOf(200, 'hello world', 'Hello');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('0 name:hello world message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0111 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0112
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0112
     * @tc.desc      startErrorMessageOf(code=200, name="hello world", message="hello world") returns ":hello world m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0112 begin`);
      const actual: string = startErrorMessageOf(200, 'hello world', 'hello world');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual(':hello world message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0112 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0113
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0113
     * @tc.desc      startErrorMessageOf(code=200, name="hello world", message="") returns "startAbilityByType onErro...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0113 begin`);
      const actual: string = startErrorMessageOf(200, 'hello world', '');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:hello world message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0113 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0114
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0114
     * @tc.desc      startErrorMessageOf(code=200, name="hello world", message=" ") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0114 begin`);
      const actual: string = startErrorMessageOf(200, 'hello world', ' ');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:hello world message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0114 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0115
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0115
     * @tc.desc      startErrorMessageOf(code=200, name="hello world", message="A") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0115 begin`);
      const actual: string = startErrorMessageOf(200, 'hello world', 'A');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:hello world message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0115 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0116
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0116
     * @tc.desc      startErrorMessageOf(code=200, name="hello world", message="Sample Title 123") returns "o world m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0116 begin`);
      const actual: string = startErrorMessageOf(200, 'hello world', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual('o world message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0116 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0117
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0117
     * @tc.desc      startErrorMessageOf(code=200, name="hello world", message="??") returns " name:hello world messa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0117 begin`);
      const actual: string = startErrorMessageOf(200, 'hello world', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(64);
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual(' name:hello world message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0117 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0118
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0118
     * @tc.desc      startErrorMessageOf(code=200, name="hello world", message="a") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0118 begin`);
      const actual: string = startErrorMessageOf(200, 'hello world', 'a');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:hello world message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0118 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0119
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0119
     * @tc.desc      startErrorMessageOf(code=200, name="hello world", message="abc") returns "200 name:hello world m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0119 begin`);
      const actual: string = startErrorMessageOf(200, 'hello world', 'abc');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('200 name:hello world message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0119 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0120
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0120
     * @tc.desc      startErrorMessageOf(code=200, name="hello world", message="Hello World") returns ":hello world m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0120 begin`);
      const actual: string = startErrorMessageOf(200, 'hello world', 'Hello World');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="hello...: actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual(':hello world message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0120 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0121
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0121
     * @tc.desc      startErrorMessageOf(code=200, name="", message="Hello") returns "startAbilityByType onError, cod...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0121 begin`);
      const actual: string = startErrorMessageOf(200, '', 'Hello');
      logInfo(`startErrorMessageOf(code=200, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name: message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0121 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0122
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0122
     * @tc.desc      startErrorMessageOf(code=200, name="", message="hello world") returns "startAbilityByType onErro...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0122 begin`);
      const actual: string = startErrorMessageOf(200, '', 'hello world');
      logInfo(`startErrorMessageOf(code=200, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name: message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0122 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0123
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0123
     * @tc.desc      startErrorMessageOf(code=200, name="", message="") returns "startAbilityByType onError, code:200...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0123 begin`);
      const actual: string = startErrorMessageOf(200, '', '');
      logInfo(`startErrorMessageOf(code=200, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name: message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0123 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0124
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0124
     * @tc.desc      startErrorMessageOf(code=200, name="", message=" ") returns "startAbilityByType onError, code:20...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0124 begin`);
      const actual: string = startErrorMessageOf(200, '', ' ');
      logInfo(`startErrorMessageOf(code=200, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name: message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0124 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0125
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0125
     * @tc.desc      startErrorMessageOf(code=200, name="", message="A") returns "startAbilityByType onError, code:20...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0125 begin`);
      const actual: string = startErrorMessageOf(200, '', 'A');
      logInfo(`startErrorMessageOf(code=200, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name: message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0125 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0126
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0126
     * @tc.desc      startErrorMessageOf(code=200, name="", message="Sample Title 123") returns "0 name: message:Samp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0126 begin`);
      const actual: string = startErrorMessageOf(200, '', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=200, name="", me...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`startErrorMessageOf(code=200, name="", me...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="", me...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('0 name: message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0126 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0127
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0127
     * @tc.desc      startErrorMessageOf(code=200, name="", message="??") returns "startAbilityByType onError, code:2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0127 begin`);
      const actual: string = startErrorMessageOf(200, '', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=200, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name: message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0127 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0128
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0128
     * @tc.desc      startErrorMessageOf(code=200, name="", message="a") returns "startAbilityByType onError, code:20...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0128 begin`);
      const actual: string = startErrorMessageOf(200, '', 'a');
      logInfo(`startErrorMessageOf(code=200, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name: message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0128 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0129
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0129
     * @tc.desc      startErrorMessageOf(code=200, name="", message="abc") returns "startAbilityByType onError, code:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0129 begin`);
      const actual: string = startErrorMessageOf(200, '', 'abc');
      logInfo(`startErrorMessageOf(code=200, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name: message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0129 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0130
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0130
     * @tc.desc      startErrorMessageOf(code=200, name="", message="Hello World") returns "startAbilityByType onErro...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0130 begin`);
      const actual: string = startErrorMessageOf(200, '', 'Hello World');
      logInfo(`startErrorMessageOf(code=200, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name: message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0130 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0131
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0131
     * @tc.desc      startErrorMessageOf(code=200, name=" ", message="Hello") returns "startAbilityByType onError, co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0131 begin`);
      const actual: string = startErrorMessageOf(200, ' ', 'Hello');
      logInfo(`startErrorMessageOf(code=200, name=" ", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:  message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0131 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0132
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0132
     * @tc.desc      startErrorMessageOf(code=200, name=" ", message="hello world") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0132 begin`);
      const actual: string = startErrorMessageOf(200, ' ', 'hello world');
      logInfo(`startErrorMessageOf(code=200, name=" ", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:  message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0132 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0133
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0133
     * @tc.desc      startErrorMessageOf(code=200, name=" ", message="") returns "startAbilityByType onError, code:20...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0133 begin`);
      const actual: string = startErrorMessageOf(200, ' ', '');
      logInfo(`startErrorMessageOf(code=200, name=" ", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:  message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0133 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0134
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0134
     * @tc.desc      startErrorMessageOf(code=200, name=" ", message=" ") returns "startAbilityByType onError, code:2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0134 begin`);
      const actual: string = startErrorMessageOf(200, ' ', ' ');
      logInfo(`startErrorMessageOf(code=200, name=" ", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:  message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0134 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0135
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0135
     * @tc.desc      startErrorMessageOf(code=200, name=" ", message="A") returns "startAbilityByType onError, code:2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0135 begin`);
      const actual: string = startErrorMessageOf(200, ' ', 'A');
      logInfo(`startErrorMessageOf(code=200, name=" ", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:  message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0135 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0136
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0136
     * @tc.desc      startErrorMessageOf(code=200, name=" ", message="Sample Title 123") returns " name:  message:Sam...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0136 begin`);
      const actual: string = startErrorMessageOf(200, ' ', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=200, name=" ", m...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`startErrorMessageOf(code=200, name=" ", m...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name=" ", m...: actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual(' name:  message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0136 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0137
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0137
     * @tc.desc      startErrorMessageOf(code=200, name=" ", message="??") returns "startAbilityByType onError, code:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0137 begin`);
      const actual: string = startErrorMessageOf(200, ' ', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=200, name=" ", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:  message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0137 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0138
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0138
     * @tc.desc      startErrorMessageOf(code=200, name=" ", message="a") returns "startAbilityByType onError, code:2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0138 begin`);
      const actual: string = startErrorMessageOf(200, ' ', 'a');
      logInfo(`startErrorMessageOf(code=200, name=" ", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:  message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0138 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0139
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0139
     * @tc.desc      startErrorMessageOf(code=200, name=" ", message="abc") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0139 begin`);
      const actual: string = startErrorMessageOf(200, ' ', 'abc');
      logInfo(`startErrorMessageOf(code=200, name=" ", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:  message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0139 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0140
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0140
     * @tc.desc      startErrorMessageOf(code=200, name=" ", message="Hello World") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0140 begin`);
      const actual: string = startErrorMessageOf(200, ' ', 'Hello World');
      logInfo(`startErrorMessageOf(code=200, name=" ", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:  message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0140 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0141
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0141
     * @tc.desc      startErrorMessageOf(code=200, name="A", message="Hello") returns "startAbilityByType onError, co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0141 begin`);
      const actual: string = startErrorMessageOf(200, 'A', 'Hello');
      logInfo(`startErrorMessageOf(code=200, name="A", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:A message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0141 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0142
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0142
     * @tc.desc      startErrorMessageOf(code=200, name="A", message="hello world") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0142 begin`);
      const actual: string = startErrorMessageOf(200, 'A', 'hello world');
      logInfo(`startErrorMessageOf(code=200, name="A", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:A message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0142 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0143
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0143
     * @tc.desc      startErrorMessageOf(code=200, name="A", message="") returns "startAbilityByType onError, code:20...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0143 begin`);
      const actual: string = startErrorMessageOf(200, 'A', '');
      logInfo(`startErrorMessageOf(code=200, name="A", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:A message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0143 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0144
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0144
     * @tc.desc      startErrorMessageOf(code=200, name="A", message=" ") returns "startAbilityByType onError, code:2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0144 begin`);
      const actual: string = startErrorMessageOf(200, 'A', ' ');
      logInfo(`startErrorMessageOf(code=200, name="A", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:A message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0144 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0145
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0145
     * @tc.desc      startErrorMessageOf(code=200, name="A", message="A") returns "startAbilityByType onError, code:2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0145 begin`);
      const actual: string = startErrorMessageOf(200, 'A', 'A');
      logInfo(`startErrorMessageOf(code=200, name="A", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:A message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0145 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0146
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0146
     * @tc.desc      startErrorMessageOf(code=200, name="A", message="Sample Title 123") returns " name:A message:Sam...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0146 begin`);
      const actual: string = startErrorMessageOf(200, 'A', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=200, name="A", m...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`startErrorMessageOf(code=200, name="A", m...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="A", m...: actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual(' name:A message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0146 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0147
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0147
     * @tc.desc      startErrorMessageOf(code=200, name="A", message="??") returns "startAbilityByType onError, code:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0147 begin`);
      const actual: string = startErrorMessageOf(200, 'A', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=200, name="A", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:A message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0147 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0148
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0148
     * @tc.desc      startErrorMessageOf(code=200, name="A", message="a") returns "startAbilityByType onError, code:2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0148 begin`);
      const actual: string = startErrorMessageOf(200, 'A', 'a');
      logInfo(`startErrorMessageOf(code=200, name="A", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:A message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0148 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0149
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0149
     * @tc.desc      startErrorMessageOf(code=200, name="A", message="abc") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0149 begin`);
      const actual: string = startErrorMessageOf(200, 'A', 'abc');
      logInfo(`startErrorMessageOf(code=200, name="A", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:A message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0149 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0150
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0150
     * @tc.desc      startErrorMessageOf(code=200, name="A", message="Hello World") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0150 begin`);
      const actual: string = startErrorMessageOf(200, 'A', 'Hello World');
      logInfo(`startErrorMessageOf(code=200, name="A", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:A message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0150 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0151
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0151
     * @tc.desc      startErrorMessageOf(code=200, name="Sample Title 123", message="Hello") returns "e:Sample Title ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0151 begin`);
      const actual: string = startErrorMessageOf(200, 'Sample Title 123', 'Hello');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(72);
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(40)=${actual.substring(40)}`);
      expect(actual.substring(40)).assertEqual('e:Sample Title 123 message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0151 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0152
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0152
     * @tc.desc      startErrorMessageOf(code=200, name="Sample Title 123", message="hello world") returns "le Title ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0152 begin`);
      const actual: string = startErrorMessageOf(200, 'Sample Title 123', 'hello world');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual('le Title 123 message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0152 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0153
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0153
     * @tc.desc      startErrorMessageOf(code=200, name="Sample Title 123", message="") returns "0 name:Sample Title ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0153 begin`);
      const actual: string = startErrorMessageOf(200, 'Sample Title 123', '');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('0 name:Sample Title 123 message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0153 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0154
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0154
     * @tc.desc      startErrorMessageOf(code=200, name="Sample Title 123", message=" ") returns " name:Sample Title ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0154 begin`);
      const actual: string = startErrorMessageOf(200, 'Sample Title 123', ' ');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual(' name:Sample Title 123 message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0154 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0155
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0155
     * @tc.desc      startErrorMessageOf(code=200, name="Sample Title 123", message="A") returns " name:Sample Title ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0155 begin`);
      const actual: string = startErrorMessageOf(200, 'Sample Title 123', 'A');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual(' name:Sample Title 123 message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0155 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0156
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0156
     * @tc.desc      startErrorMessageOf(code=200, name="Sample Title 123", message="Sample Title 123") returns "tle ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0156 begin`);
      const actual: string = startErrorMessageOf(200, 'Sample Title 123', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual('tle 123 message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0156 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0157
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0157
     * @tc.desc      startErrorMessageOf(code=200, name="Sample Title 123", message="??") returns ":Sample Title 123 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0157 begin`);
      const actual: string = startErrorMessageOf(200, 'Sample Title 123', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual(':Sample Title 123 message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0157 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0158
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0158
     * @tc.desc      startErrorMessageOf(code=200, name="Sample Title 123", message="a") returns " name:Sample Title ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0158 begin`);
      const actual: string = startErrorMessageOf(200, 'Sample Title 123', 'a');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual(' name:Sample Title 123 message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0158 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0159
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0159
     * @tc.desc      startErrorMessageOf(code=200, name="Sample Title 123", message="abc") returns "ame:Sample Title ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0159 begin`);
      const actual: string = startErrorMessageOf(200, 'Sample Title 123', 'abc');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('ame:Sample Title 123 message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0159 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0160
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0160
     * @tc.desc      startErrorMessageOf(code=200, name="Sample Title 123", message="Hello World") returns "le Title ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0160 begin`);
      const actual: string = startErrorMessageOf(200, 'Sample Title 123', 'Hello World');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Sampl...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual('le Title 123 message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0160 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0161
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0161
     * @tc.desc      startErrorMessageOf(code=200, name="??", message="Hello") returns "de:200 name:?? message:Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0161 begin`);
      const actual: string = startErrorMessageOf(200, '\u4e2d\u6587', 'Hello');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(58);
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.substring(30)=${actual.substring(30)}`);
      expect(actual.substring(30)).assertEqual('de:200 name:\u4e2d\u6587 message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0161 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0162
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0162
     * @tc.desc      startErrorMessageOf(code=200, name="??", message="hello world") returns " name:?? message:hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0162 begin`);
      const actual: string = startErrorMessageOf(200, '\u4e2d\u6587', 'hello world');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(64);
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual(' name:\u4e2d\u6587 message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0162 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0163
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0163
     * @tc.desc      startErrorMessageOf(code=200, name="??", message="") returns "startAbilityByType onError, code:2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0163 begin`);
      const actual: string = startErrorMessageOf(200, '\u4e2d\u6587', '');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:\u4e2d\u6587 message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0163 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0164
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0164
     * @tc.desc      startErrorMessageOf(code=200, name="??", message=" ") returns "startAbilityByType onError, code:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0164 begin`);
      const actual: string = startErrorMessageOf(200, '\u4e2d\u6587', ' ');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:\u4e2d\u6587 message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0164 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0165
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0165
     * @tc.desc      startErrorMessageOf(code=200, name="??", message="A") returns "startAbilityByType onError, code:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0165 begin`);
      const actual: string = startErrorMessageOf(200, '\u4e2d\u6587', 'A');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:\u4e2d\u6587 message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0165 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0166
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0166
     * @tc.desc      startErrorMessageOf(code=200, name="??", message="Sample Title 123") returns ":?? message:Sample...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0166 begin`);
      const actual: string = startErrorMessageOf(200, '\u4e2d\u6587', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual(':\u4e2d\u6587 message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0166 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0167
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0167
     * @tc.desc      startErrorMessageOf(code=200, name="??", message="??") returns "name:?? message:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0167 begin`);
      const actual: string = startErrorMessageOf(200, '\u4e2d\u6587', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(55);
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('name:\u4e2d\u6587 message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0167 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0168
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0168
     * @tc.desc      startErrorMessageOf(code=200, name="??", message="a") returns "startAbilityByType onError, code:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0168 begin`);
      const actual: string = startErrorMessageOf(200, '\u4e2d\u6587', 'a');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:\u4e2d\u6587 message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0168 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0169
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0169
     * @tc.desc      startErrorMessageOf(code=200, name="??", message="abc") returns "code:200 name:?? message:abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0169 begin`);
      const actual: string = startErrorMessageOf(200, '\u4e2d\u6587', 'abc');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(56);
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.substring(28)=${actual.substring(28)}`);
      expect(actual.substring(28)).assertEqual('code:200 name:\u4e2d\u6587 message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0169 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0170
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0170
     * @tc.desc      startErrorMessageOf(code=200, name="??", message="Hello World") returns " name:?? message:Hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0170 begin`);
      const actual: string = startErrorMessageOf(200, '\u4e2d\u6587', 'Hello World');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(64);
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="??", ...: actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual(' name:\u4e2d\u6587 message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0170 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0171
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0171
     * @tc.desc      startErrorMessageOf(code=200, name="a", message="Hello") returns "startAbilityByType onError, co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0171 begin`);
      const actual: string = startErrorMessageOf(200, 'a', 'Hello');
      logInfo(`startErrorMessageOf(code=200, name="a", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:a message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0171 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0172
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0172
     * @tc.desc      startErrorMessageOf(code=200, name="a", message="hello world") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0172 begin`);
      const actual: string = startErrorMessageOf(200, 'a', 'hello world');
      logInfo(`startErrorMessageOf(code=200, name="a", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:a message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0172 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0173
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0173
     * @tc.desc      startErrorMessageOf(code=200, name="a", message="") returns "startAbilityByType onError, code:20...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0173 begin`);
      const actual: string = startErrorMessageOf(200, 'a', '');
      logInfo(`startErrorMessageOf(code=200, name="a", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:a message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0173 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0174
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0174
     * @tc.desc      startErrorMessageOf(code=200, name="a", message=" ") returns "startAbilityByType onError, code:2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0174 begin`);
      const actual: string = startErrorMessageOf(200, 'a', ' ');
      logInfo(`startErrorMessageOf(code=200, name="a", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:a message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0174 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0175
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0175
     * @tc.desc      startErrorMessageOf(code=200, name="a", message="A") returns "startAbilityByType onError, code:2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0175 begin`);
      const actual: string = startErrorMessageOf(200, 'a', 'A');
      logInfo(`startErrorMessageOf(code=200, name="a", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:a message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0175 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0176
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0176
     * @tc.desc      startErrorMessageOf(code=200, name="a", message="Sample Title 123") returns " name:a message:Sam...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0176 begin`);
      const actual: string = startErrorMessageOf(200, 'a', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=200, name="a", m...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`startErrorMessageOf(code=200, name="a", m...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="a", m...: actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual(' name:a message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0176 end`);
    });
  });
}
