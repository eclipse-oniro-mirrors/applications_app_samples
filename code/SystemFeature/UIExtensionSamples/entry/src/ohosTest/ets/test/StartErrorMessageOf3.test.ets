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

/** Logic checks for startErrorMessageOf (46 cases). */
export default function startErrorMessageOf3Test(): void {
  describe('StartErrorMessageOf3Test', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0177
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0177
     * @tc.desc      startErrorMessageOf(code=200, name="a", message="??") returns "startAbilityByType onError, code:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0177 begin`);
      const actual: string = startErrorMessageOf(200, 'a', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=200, name="a", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:a message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0177 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0178
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0178
     * @tc.desc      startErrorMessageOf(code=200, name="a", message="a") returns "startAbilityByType onError, code:2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0178 begin`);
      const actual: string = startErrorMessageOf(200, 'a', 'a');
      logInfo(`startErrorMessageOf(code=200, name="a", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:a message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0178 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0179
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0179
     * @tc.desc      startErrorMessageOf(code=200, name="a", message="abc") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0179 begin`);
      const actual: string = startErrorMessageOf(200, 'a', 'abc');
      logInfo(`startErrorMessageOf(code=200, name="a", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:a message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0179 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0180
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0180
     * @tc.desc      startErrorMessageOf(code=200, name="a", message="Hello World") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0180 begin`);
      const actual: string = startErrorMessageOf(200, 'a', 'Hello World');
      logInfo(`startErrorMessageOf(code=200, name="a", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:a message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0180 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0181
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0181
     * @tc.desc      startErrorMessageOf(code=200, name="abc", message="Hello") returns "startAbilityByType onError, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0181 begin`);
      const actual: string = startErrorMessageOf(200, 'abc', 'Hello');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:abc message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0181 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0182
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0182
     * @tc.desc      startErrorMessageOf(code=200, name="abc", message="hello world") returns "200 name:abc message:h...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0182 begin`);
      const actual: string = startErrorMessageOf(200, 'abc', 'hello world');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('200 name:abc message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0182 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0183
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0183
     * @tc.desc      startErrorMessageOf(code=200, name="abc", message="") returns "startAbilityByType onError, code:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0183 begin`);
      const actual: string = startErrorMessageOf(200, 'abc', '');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:abc message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0183 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0184
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0184
     * @tc.desc      startErrorMessageOf(code=200, name="abc", message=" ") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0184 begin`);
      const actual: string = startErrorMessageOf(200, 'abc', ' ');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:abc message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0184 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0185
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0185
     * @tc.desc      startErrorMessageOf(code=200, name="abc", message="A") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0185 begin`);
      const actual: string = startErrorMessageOf(200, 'abc', 'A');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:abc message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0185 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0186
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0186
     * @tc.desc      startErrorMessageOf(code=200, name="abc", message="Sample Title 123") returns "ame:abc message:S...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0186 begin`);
      const actual: string = startErrorMessageOf(200, 'abc', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('ame:abc message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0186 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0187
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0187
     * @tc.desc      startErrorMessageOf(code=200, name="abc", message="??") returns "code:200 name:abc message:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0187 begin`);
      const actual: string = startErrorMessageOf(200, 'abc', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(56);
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual.substring(28)=${actual.substring(28)}`);
      expect(actual.substring(28)).assertEqual('code:200 name:abc message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0187 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0188
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0188
     * @tc.desc      startErrorMessageOf(code=200, name="abc", message="a") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0188 begin`);
      const actual: string = startErrorMessageOf(200, 'abc', 'a');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:abc message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0188 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0189
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0189
     * @tc.desc      startErrorMessageOf(code=200, name="abc", message="abc") returns "startAbilityByType onError, co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0189 begin`);
      const actual: string = startErrorMessageOf(200, 'abc', 'abc');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:abc message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0189 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0190
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0190
     * @tc.desc      startErrorMessageOf(code=200, name="abc", message="Hello World") returns "200 name:abc message:H...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0190 begin`);
      const actual: string = startErrorMessageOf(200, 'abc', 'Hello World');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="abc",...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('200 name:abc message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0190 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0191
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0191
     * @tc.desc      startErrorMessageOf(code=200, name="Hello World", message="Hello") returns "0 name:Hello World m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0191 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello World', 'Hello');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('0 name:Hello World message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0191 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0192
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0192
     * @tc.desc      startErrorMessageOf(code=200, name="Hello World", message="hello world") returns ":Hello World m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0192 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello World', 'hello world');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual(':Hello World message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0192 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0193
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0193
     * @tc.desc      startErrorMessageOf(code=200, name="Hello World", message="") returns "startAbilityByType onErro...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0193 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello World', '');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:Hello World message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0193 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0194
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0194
     * @tc.desc      startErrorMessageOf(code=200, name="Hello World", message=" ") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0194 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello World', ' ');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:Hello World message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0194 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0195
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0195
     * @tc.desc      startErrorMessageOf(code=200, name="Hello World", message="A") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0195 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello World', 'A');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:Hello World message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0195 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0196
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0196
     * @tc.desc      startErrorMessageOf(code=200, name="Hello World", message="Sample Title 123") returns "o World m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0196 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello World', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(78);
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(46)=${actual.substring(46)}`);
      expect(actual.substring(46)).assertEqual('o World message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0196 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0197
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0197
     * @tc.desc      startErrorMessageOf(code=200, name="Hello World", message="??") returns " name:Hello World messa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0197 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello World', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(64);
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual(' name:Hello World message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0197 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0198
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0198
     * @tc.desc      startErrorMessageOf(code=200, name="Hello World", message="a") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0198 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello World', 'a');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:200 name:Hello World message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0198 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0199
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0199
     * @tc.desc      startErrorMessageOf(code=200, name="Hello World", message="abc") returns "200 name:Hello World m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0199 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello World', 'abc');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('200 name:Hello World message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0199 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0200
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0200
     * @tc.desc      startErrorMessageOf(code=200, name="Hello World", message="Hello World") returns ":Hello World m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0200 begin`);
      const actual: string = startErrorMessageOf(200, 'Hello World', 'Hello World');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(73);
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=200, name="Hello...: actual.substring(41)=${actual.substring(41)}`);
      expect(actual.substring(41)).assertEqual(':Hello World message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0200 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0201
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0201
     * @tc.desc      startErrorMessageOf(code=401, name="Hello", message="Hello") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0201 begin`);
      const actual: string = startErrorMessageOf(401, 'Hello', 'Hello');
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name:Hello message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0201 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0202
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0202
     * @tc.desc      startErrorMessageOf(code=401, name="Hello", message="hello world") returns "1 name:Hello message...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0202 begin`);
      const actual: string = startErrorMessageOf(401, 'Hello', 'hello world');
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('1 name:Hello message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0202 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0203
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0203
     * @tc.desc      startErrorMessageOf(code=401, name="Hello", message="") returns "startAbilityByType onError, cod...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0203 begin`);
      const actual: string = startErrorMessageOf(401, 'Hello', '');
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name:Hello message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0203 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0204
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0204
     * @tc.desc      startErrorMessageOf(code=401, name="Hello", message=" ") returns "startAbilityByType onError, co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0204 begin`);
      const actual: string = startErrorMessageOf(401, 'Hello', ' ');
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name:Hello message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0204 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0205
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0205
     * @tc.desc      startErrorMessageOf(code=401, name="Hello", message="A") returns "startAbilityByType onError, co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0205 begin`);
      const actual: string = startErrorMessageOf(401, 'Hello', 'A');
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name:Hello message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0205 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0206
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0206
     * @tc.desc      startErrorMessageOf(code=401, name="Hello", message="??") returns "de:401 name:Hello message:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0206 begin`);
      const actual: string = startErrorMessageOf(401, 'Hello', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(58);
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual.substring(30)=${actual.substring(30)}`);
      expect(actual.substring(30)).assertEqual('de:401 name:Hello message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0206 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0207
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0207
     * @tc.desc      startErrorMessageOf(code=401, name="Hello", message="a") returns "startAbilityByType onError, co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0207 begin`);
      const actual: string = startErrorMessageOf(401, 'Hello', 'a');
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name:Hello message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0207 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0208
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0208
     * @tc.desc      startErrorMessageOf(code=401, name="Hello", message="abc") returns "startAbilityByType onError, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0208 begin`);
      const actual: string = startErrorMessageOf(401, 'Hello', 'abc');
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name:Hello message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0208 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0209
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0209
     * @tc.desc      startErrorMessageOf(code=401, name="Hello", message="Hello World") returns "1 name:Hello message...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0209 begin`);
      const actual: string = startErrorMessageOf(401, 'Hello', 'Hello World');
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=401, name="Hello...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('1 name:Hello message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0209 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0210
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0210
     * @tc.desc      startErrorMessageOf(code=401, name="hello world", message="Hello") returns "1 name:hello world m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0210 begin`);
      const actual: string = startErrorMessageOf(401, 'hello world', 'Hello');
      logInfo(`startErrorMessageOf(code=401, name="hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`startErrorMessageOf(code=401, name="hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=401, name="hello...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('1 name:hello world message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0210 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0211
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0211
     * @tc.desc      startErrorMessageOf(code=401, name="hello world", message="") returns "startAbilityByType onErro...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0211 begin`);
      const actual: string = startErrorMessageOf(401, 'hello world', '');
      logInfo(`startErrorMessageOf(code=401, name="hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name:hello world message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0211 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0212
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0212
     * @tc.desc      startErrorMessageOf(code=401, name="hello world", message=" ") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0212 begin`);
      const actual: string = startErrorMessageOf(401, 'hello world', ' ');
      logInfo(`startErrorMessageOf(code=401, name="hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name:hello world message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0212 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0213
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0213
     * @tc.desc      startErrorMessageOf(code=401, name="hello world", message="A") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0213 begin`);
      const actual: string = startErrorMessageOf(401, 'hello world', 'A');
      logInfo(`startErrorMessageOf(code=401, name="hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name:hello world message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0213 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0214
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0214
     * @tc.desc      startErrorMessageOf(code=401, name="hello world", message="a") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0214 begin`);
      const actual: string = startErrorMessageOf(401, 'hello world', 'a');
      logInfo(`startErrorMessageOf(code=401, name="hello...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name:hello world message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0214 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0215
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0215
     * @tc.desc      startErrorMessageOf(code=401, name="hello world", message="abc") returns "401 name:hello world m...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0215 begin`);
      const actual: string = startErrorMessageOf(401, 'hello world', 'abc');
      logInfo(`startErrorMessageOf(code=401, name="hello...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`startErrorMessageOf(code=401, name="hello...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=401, name="hello...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('401 name:hello world message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0215 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0216
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0216
     * @tc.desc      startErrorMessageOf(code=401, name="", message="Hello") returns "startAbilityByType onError, cod...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0216 begin`);
      const actual: string = startErrorMessageOf(401, '', 'Hello');
      logInfo(`startErrorMessageOf(code=401, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name: message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0216 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0217
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0217
     * @tc.desc      startErrorMessageOf(code=401, name="", message="hello world") returns "startAbilityByType onErro...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0217 begin`);
      const actual: string = startErrorMessageOf(401, '', 'hello world');
      logInfo(`startErrorMessageOf(code=401, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name: message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0217 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0218
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0218
     * @tc.desc      startErrorMessageOf(code=401, name="", message="") returns "startAbilityByType onError, code:401...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0218 begin`);
      const actual: string = startErrorMessageOf(401, '', '');
      logInfo(`startErrorMessageOf(code=401, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name: message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0218 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0219
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0219
     * @tc.desc      startErrorMessageOf(code=401, name="", message=" ") returns "startAbilityByType onError, code:40...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0219 begin`);
      const actual: string = startErrorMessageOf(401, '', ' ');
      logInfo(`startErrorMessageOf(code=401, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name: message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0219 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0220
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0220
     * @tc.desc      startErrorMessageOf(code=401, name="", message="A") returns "startAbilityByType onError, code:40...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0220 begin`);
      const actual: string = startErrorMessageOf(401, '', 'A');
      logInfo(`startErrorMessageOf(code=401, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name: message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0220 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0221
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0221
     * @tc.desc      startErrorMessageOf(code=401, name="", message="Sample Title 123") returns "1 name: message:Samp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0221 begin`);
      const actual: string = startErrorMessageOf(401, '', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=401, name="", me...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`startErrorMessageOf(code=401, name="", me...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=401, name="", me...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('1 name: message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0221 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0222
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0222
     * @tc.desc      startErrorMessageOf(code=401, name="", message="??") returns "startAbilityByType onError, code:4...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0222 begin`);
      const actual: string = startErrorMessageOf(401, '', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=401, name="", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:401 name: message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0222 end`);
    });
  });
}
