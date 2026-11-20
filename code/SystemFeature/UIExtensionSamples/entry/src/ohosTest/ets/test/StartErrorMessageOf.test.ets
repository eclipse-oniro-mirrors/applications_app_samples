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

/** Logic checks for startErrorMessageOf (89 cases). */
export default function startErrorMessageOfTest(): void {
  describe('StartErrorMessageOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0001
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0001
     * @tc.desc      startErrorMessageOf(code=0, name="Hello", message="Hello") returns "startAbilityByType onError, ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_StartErrorMessageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0001 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello', 'Hello');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:Hello message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0002
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0002
     * @tc.desc      startErrorMessageOf(code=0, name="Hello", message="hello world") returns "0 name:Hello message:h...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_StartErrorMessageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0002 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello', 'hello world');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('0 name:Hello message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0003
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0003
     * @tc.desc      startErrorMessageOf(code=0, name="Hello", message="") returns "startAbilityByType onError, code:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0003 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello', '');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:Hello message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0004
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0004
     * @tc.desc      startErrorMessageOf(code=0, name="Hello", message=" ") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0004 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello', ' ');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:Hello message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0005
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0005
     * @tc.desc      startErrorMessageOf(code=0, name="Hello", message="A") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0005 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello', 'A');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:Hello message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0006
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0006
     * @tc.desc      startErrorMessageOf(code=0, name="Hello", message="Sample Title 123") returns "e:Hello message:S...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0006 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('e:Hello message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0007
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0007
     * @tc.desc      startErrorMessageOf(code=0, name="Hello", message="??") returns "code:0 name:Hello message:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0007 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(56);
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual.substring(28)=${actual.substring(28)}`);
      expect(actual.substring(28)).assertEqual('code:0 name:Hello message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0008
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0008
     * @tc.desc      startErrorMessageOf(code=0, name="Hello", message="a") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0008 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello', 'a');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:Hello message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0009
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0009
     * @tc.desc      startErrorMessageOf(code=0, name="Hello", message="abc") returns "startAbilityByType onError, co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0009 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello', 'abc');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:Hello message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0010
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0010
     * @tc.desc      startErrorMessageOf(code=0, name="Hello", message="Hello World") returns "0 name:Hello message:H...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0010 begin`);
      const actual: string = startErrorMessageOf(0, 'Hello', 'Hello World');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Hello",...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('0 name:Hello message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0011
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0011
     * @tc.desc      startErrorMessageOf(code=0, name="hello world", message="Hello") returns "0 name:hello world mes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0011 begin`);
      const actual: string = startErrorMessageOf(0, 'hello world', 'Hello');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('0 name:hello world message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0012
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0012
     * @tc.desc      startErrorMessageOf(code=0, name="hello world", message="hello world") returns ":hello world mes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0012 begin`);
      const actual: string = startErrorMessageOf(0, 'hello world', 'hello world');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(':hello world message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0013
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0013
     * @tc.desc      startErrorMessageOf(code=0, name="hello world", message="") returns "startAbilityByType onError,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0013 begin`);
      const actual: string = startErrorMessageOf(0, 'hello world', '');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:hello world message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0014
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0014
     * @tc.desc      startErrorMessageOf(code=0, name="hello world", message=" ") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0014 begin`);
      const actual: string = startErrorMessageOf(0, 'hello world', ' ');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:hello world message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0015
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0015
     * @tc.desc      startErrorMessageOf(code=0, name="hello world", message="A") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0015 begin`);
      const actual: string = startErrorMessageOf(0, 'hello world', 'A');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:hello world message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0016
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0016
     * @tc.desc      startErrorMessageOf(code=0, name="hello world", message="Sample Title 123") returns "o world mes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0016 begin`);
      const actual: string = startErrorMessageOf(0, 'hello world', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('o world message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0017
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0017
     * @tc.desc      startErrorMessageOf(code=0, name="hello world", message="??") returns " name:hello world message...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0017 begin`);
      const actual: string = startErrorMessageOf(0, 'hello world', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(62);
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual(' name:hello world message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0018
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0018
     * @tc.desc      startErrorMessageOf(code=0, name="hello world", message="a") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0018 begin`);
      const actual: string = startErrorMessageOf(0, 'hello world', 'a');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:hello world message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0019
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0019
     * @tc.desc      startErrorMessageOf(code=0, name="hello world", message="abc") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0019 begin`);
      const actual: string = startErrorMessageOf(0, 'hello world', 'abc');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:hello world message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0020
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0020
     * @tc.desc      startErrorMessageOf(code=0, name="hello world", message="Hello World") returns ":hello world mes...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0020 begin`);
      const actual: string = startErrorMessageOf(0, 'hello world', 'Hello World');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="hello w...: actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(':hello world message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0021
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0021
     * @tc.desc      startErrorMessageOf(code=0, name="", message="Hello") returns "startAbilityByType onError, code:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0021 begin`);
      const actual: string = startErrorMessageOf(0, '', 'Hello');
      logInfo(`startErrorMessageOf(code=0, name="", mess...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name: message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0022
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0022
     * @tc.desc      startErrorMessageOf(code=0, name="", message="hello world") returns "startAbilityByType onError,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0022 begin`);
      const actual: string = startErrorMessageOf(0, '', 'hello world');
      logInfo(`startErrorMessageOf(code=0, name="", mess...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name: message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0023
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0023
     * @tc.desc      startErrorMessageOf(code=0, name="", message="") returns "startAbilityByType onError, code:0 nam...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0023 begin`);
      const actual: string = startErrorMessageOf(0, '', '');
      logInfo(`startErrorMessageOf(code=0, name="", mess...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name: message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0024
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0024
     * @tc.desc      startErrorMessageOf(code=0, name="", message=" ") returns "startAbilityByType onError, code:0 na...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0024 begin`);
      const actual: string = startErrorMessageOf(0, '', ' ');
      logInfo(`startErrorMessageOf(code=0, name="", mess...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name: message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0025
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0025
     * @tc.desc      startErrorMessageOf(code=0, name="", message="A") returns "startAbilityByType onError, code:0 na...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0025 begin`);
      const actual: string = startErrorMessageOf(0, '', 'A');
      logInfo(`startErrorMessageOf(code=0, name="", mess...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name: message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0026
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0026
     * @tc.desc      startErrorMessageOf(code=0, name="", message="Sample Title 123") returns "0 name: message:Sample...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0026 begin`);
      const actual: string = startErrorMessageOf(0, '', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=0, name="", mess...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`startErrorMessageOf(code=0, name="", mess...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="", mess...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('0 name: message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0027
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0027
     * @tc.desc      startErrorMessageOf(code=0, name="", message="??") returns "startAbilityByType onError, code:0 n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0027 begin`);
      const actual: string = startErrorMessageOf(0, '', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=0, name="", mess...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name: message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0028
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0028
     * @tc.desc      startErrorMessageOf(code=0, name="", message="a") returns "startAbilityByType onError, code:0 na...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0028 begin`);
      const actual: string = startErrorMessageOf(0, '', 'a');
      logInfo(`startErrorMessageOf(code=0, name="", mess...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name: message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0029
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0029
     * @tc.desc      startErrorMessageOf(code=0, name="", message="abc") returns "startAbilityByType onError, code:0 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0029 begin`);
      const actual: string = startErrorMessageOf(0, '', 'abc');
      logInfo(`startErrorMessageOf(code=0, name="", mess...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name: message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0030
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0030
     * @tc.desc      startErrorMessageOf(code=0, name="", message="Hello World") returns "startAbilityByType onError,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0030 begin`);
      const actual: string = startErrorMessageOf(0, '', 'Hello World');
      logInfo(`startErrorMessageOf(code=0, name="", mess...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name: message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0031
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0031
     * @tc.desc      startErrorMessageOf(code=0, name=" ", message="Hello") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0031 begin`);
      const actual: string = startErrorMessageOf(0, ' ', 'Hello');
      logInfo(`startErrorMessageOf(code=0, name=" ", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:  message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0032
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0032
     * @tc.desc      startErrorMessageOf(code=0, name=" ", message="hello world") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0032 begin`);
      const actual: string = startErrorMessageOf(0, ' ', 'hello world');
      logInfo(`startErrorMessageOf(code=0, name=" ", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:  message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0033
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0033
     * @tc.desc      startErrorMessageOf(code=0, name=" ", message="") returns "startAbilityByType onError, code:0 na...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0033 begin`);
      const actual: string = startErrorMessageOf(0, ' ', '');
      logInfo(`startErrorMessageOf(code=0, name=" ", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:  message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0034
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0034
     * @tc.desc      startErrorMessageOf(code=0, name=" ", message=" ") returns "startAbilityByType onError, code:0 n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0034 begin`);
      const actual: string = startErrorMessageOf(0, ' ', ' ');
      logInfo(`startErrorMessageOf(code=0, name=" ", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:  message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0035
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0035
     * @tc.desc      startErrorMessageOf(code=0, name=" ", message="A") returns "startAbilityByType onError, code:0 n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0035 begin`);
      const actual: string = startErrorMessageOf(0, ' ', 'A');
      logInfo(`startErrorMessageOf(code=0, name=" ", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:  message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0036
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0036
     * @tc.desc      startErrorMessageOf(code=0, name=" ", message="Sample Title 123") returns " name:  message:Sampl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0036 begin`);
      const actual: string = startErrorMessageOf(0, ' ', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=0, name=" ", mes...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`startErrorMessageOf(code=0, name=" ", mes...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name=" ", mes...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual(' name:  message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0036 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0037
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0037
     * @tc.desc      startErrorMessageOf(code=0, name=" ", message="??") returns "startAbilityByType onError, code:0 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0037 begin`);
      const actual: string = startErrorMessageOf(0, ' ', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=0, name=" ", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:  message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0037 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0038
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0038
     * @tc.desc      startErrorMessageOf(code=0, name=" ", message="a") returns "startAbilityByType onError, code:0 n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0038 begin`);
      const actual: string = startErrorMessageOf(0, ' ', 'a');
      logInfo(`startErrorMessageOf(code=0, name=" ", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:  message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0038 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0039
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0039
     * @tc.desc      startErrorMessageOf(code=0, name=" ", message="abc") returns "startAbilityByType onError, code:0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0039 begin`);
      const actual: string = startErrorMessageOf(0, ' ', 'abc');
      logInfo(`startErrorMessageOf(code=0, name=" ", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:  message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0039 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0040
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0040
     * @tc.desc      startErrorMessageOf(code=0, name=" ", message="Hello World") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0040 begin`);
      const actual: string = startErrorMessageOf(0, ' ', 'Hello World');
      logInfo(`startErrorMessageOf(code=0, name=" ", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:  message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0040 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0041
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0041
     * @tc.desc      startErrorMessageOf(code=0, name="A", message="Hello") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0041 begin`);
      const actual: string = startErrorMessageOf(0, 'A', 'Hello');
      logInfo(`startErrorMessageOf(code=0, name="A", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:A message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0041 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0042
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0042
     * @tc.desc      startErrorMessageOf(code=0, name="A", message="hello world") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0042 begin`);
      const actual: string = startErrorMessageOf(0, 'A', 'hello world');
      logInfo(`startErrorMessageOf(code=0, name="A", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:A message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0042 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0043
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0043
     * @tc.desc      startErrorMessageOf(code=0, name="A", message="") returns "startAbilityByType onError, code:0 na...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0043 begin`);
      const actual: string = startErrorMessageOf(0, 'A', '');
      logInfo(`startErrorMessageOf(code=0, name="A", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:A message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0043 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0044
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0044
     * @tc.desc      startErrorMessageOf(code=0, name="A", message=" ") returns "startAbilityByType onError, code:0 n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0044 begin`);
      const actual: string = startErrorMessageOf(0, 'A', ' ');
      logInfo(`startErrorMessageOf(code=0, name="A", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:A message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0044 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0045
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0045
     * @tc.desc      startErrorMessageOf(code=0, name="A", message="A") returns "startAbilityByType onError, code:0 n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0045 begin`);
      const actual: string = startErrorMessageOf(0, 'A', 'A');
      logInfo(`startErrorMessageOf(code=0, name="A", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:A message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0045 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0046
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0046
     * @tc.desc      startErrorMessageOf(code=0, name="A", message="Sample Title 123") returns " name:A message:Sampl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0046 begin`);
      const actual: string = startErrorMessageOf(0, 'A', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=0, name="A", mes...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`startErrorMessageOf(code=0, name="A", mes...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="A", mes...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual(' name:A message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0046 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0047
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0047
     * @tc.desc      startErrorMessageOf(code=0, name="A", message="??") returns "startAbilityByType onError, code:0 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0047 begin`);
      const actual: string = startErrorMessageOf(0, 'A', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=0, name="A", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:A message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0047 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0048
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0048
     * @tc.desc      startErrorMessageOf(code=0, name="A", message="a") returns "startAbilityByType onError, code:0 n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0048 begin`);
      const actual: string = startErrorMessageOf(0, 'A', 'a');
      logInfo(`startErrorMessageOf(code=0, name="A", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:A message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0048 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0049
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0049
     * @tc.desc      startErrorMessageOf(code=0, name="A", message="abc") returns "startAbilityByType onError, code:0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0049 begin`);
      const actual: string = startErrorMessageOf(0, 'A', 'abc');
      logInfo(`startErrorMessageOf(code=0, name="A", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:A message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0049 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0050
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0050
     * @tc.desc      startErrorMessageOf(code=0, name="A", message="Hello World") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0050 begin`);
      const actual: string = startErrorMessageOf(0, 'A', 'Hello World');
      logInfo(`startErrorMessageOf(code=0, name="A", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:A message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0050 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0051
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0051
     * @tc.desc      startErrorMessageOf(code=0, name="Sample Title 123", message="Hello") returns "e:Sample Title 12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0051 begin`);
      const actual: string = startErrorMessageOf(0, 'Sample Title 123', 'Hello');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('e:Sample Title 123 message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0051 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0052
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0052
     * @tc.desc      startErrorMessageOf(code=0, name="Sample Title 123", message="hello world") returns "le Title 12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0052 begin`);
      const actual: string = startErrorMessageOf(0, 'Sample Title 123', 'hello world');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('le Title 123 message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0052 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0053
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0053
     * @tc.desc      startErrorMessageOf(code=0, name="Sample Title 123", message="") returns "0 name:Sample Title 12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0053 begin`);
      const actual: string = startErrorMessageOf(0, 'Sample Title 123', '');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(65);
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(33)=${actual.substring(33)}`);
      expect(actual.substring(33)).assertEqual('0 name:Sample Title 123 message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0053 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0054
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0054
     * @tc.desc      startErrorMessageOf(code=0, name="Sample Title 123", message=" ") returns " name:Sample Title 12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0054 begin`);
      const actual: string = startErrorMessageOf(0, 'Sample Title 123', ' ');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual(' name:Sample Title 123 message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0054 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0055
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0055
     * @tc.desc      startErrorMessageOf(code=0, name="Sample Title 123", message="A") returns " name:Sample Title 12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0055 begin`);
      const actual: string = startErrorMessageOf(0, 'Sample Title 123', 'A');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual(' name:Sample Title 123 message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0055 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0056
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0056
     * @tc.desc      startErrorMessageOf(code=0, name="Sample Title 123", message="Sample Title 123") returns "tle 12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0056 begin`);
      const actual: string = startErrorMessageOf(0, 'Sample Title 123', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(81);
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(49)=${actual.substring(49)}`);
      expect(actual.substring(49)).assertEqual('tle 123 message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0056 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0057
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0057
     * @tc.desc      startErrorMessageOf(code=0, name="Sample Title 123", message="??") returns ":Sample Title 123 me...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0057 begin`);
      const actual: string = startErrorMessageOf(0, 'Sample Title 123', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(':Sample Title 123 message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0057 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0058
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0058
     * @tc.desc      startErrorMessageOf(code=0, name="Sample Title 123", message="a") returns " name:Sample Title 12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0058 begin`);
      const actual: string = startErrorMessageOf(0, 'Sample Title 123', 'a');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual(' name:Sample Title 123 message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0058 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0059
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0059
     * @tc.desc      startErrorMessageOf(code=0, name="Sample Title 123", message="abc") returns "ame:Sample Title 12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0059 begin`);
      const actual: string = startErrorMessageOf(0, 'Sample Title 123', 'abc');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual('ame:Sample Title 123 message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0059 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0060
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0060
     * @tc.desc      startErrorMessageOf(code=0, name="Sample Title 123", message="Hello World") returns "le Title 12...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0060 begin`);
      const actual: string = startErrorMessageOf(0, 'Sample Title 123', 'Hello World');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(76);
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="Sample ...: actual.substring(44)=${actual.substring(44)}`);
      expect(actual.substring(44)).assertEqual('le Title 123 message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0060 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0061
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0061
     * @tc.desc      startErrorMessageOf(code=0, name="??", message="Hello") returns "code:0 name:?? message:Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0061 begin`);
      const actual: string = startErrorMessageOf(0, '\u4e2d\u6587', 'Hello');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(56);
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.substring(28)=${actual.substring(28)}`);
      expect(actual.substring(28)).assertEqual('code:0 name:\u4e2d\u6587 message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0061 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0062
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0062
     * @tc.desc      startErrorMessageOf(code=0, name="??", message="hello world") returns " name:?? message:hello wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0062 begin`);
      const actual: string = startErrorMessageOf(0, '\u4e2d\u6587', 'hello world');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(62);
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual(' name:\u4e2d\u6587 message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0062 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0063
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0063
     * @tc.desc      startErrorMessageOf(code=0, name="??", message="") returns "startAbilityByType onError, code:0 n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0063 begin`);
      const actual: string = startErrorMessageOf(0, '\u4e2d\u6587', '');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:\u4e2d\u6587 message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0063 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0064
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0064
     * @tc.desc      startErrorMessageOf(code=0, name="??", message=" ") returns "startAbilityByType onError, code:0 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0064 begin`);
      const actual: string = startErrorMessageOf(0, '\u4e2d\u6587', ' ');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:\u4e2d\u6587 message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0064 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0065
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0065
     * @tc.desc      startErrorMessageOf(code=0, name="??", message="A") returns "startAbilityByType onError, code:0 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0065 begin`);
      const actual: string = startErrorMessageOf(0, '\u4e2d\u6587', 'A');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:\u4e2d\u6587 message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0065 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0066
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0066
     * @tc.desc      startErrorMessageOf(code=0, name="??", message="Sample Title 123") returns ":?? message:Sample T...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0066 begin`);
      const actual: string = startErrorMessageOf(0, '\u4e2d\u6587', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(':\u4e2d\u6587 message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0066 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0067
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0067
     * @tc.desc      startErrorMessageOf(code=0, name="??", message="??") returns "name:?? message:??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0067 begin`);
      const actual: string = startErrorMessageOf(0, '\u4e2d\u6587', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(53);
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('name:\u4e2d\u6587 message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0067 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0068
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0068
     * @tc.desc      startErrorMessageOf(code=0, name="??", message="a") returns "startAbilityByType onError, code:0 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0068 begin`);
      const actual: string = startErrorMessageOf(0, '\u4e2d\u6587', 'a');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:\u4e2d\u6587 message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0068 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0069
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0069
     * @tc.desc      startErrorMessageOf(code=0, name="??", message="abc") returns "startAbilityByType onError, code:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0069 begin`);
      const actual: string = startErrorMessageOf(0, '\u4e2d\u6587', 'abc');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:\u4e2d\u6587 message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0069 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0070
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0070
     * @tc.desc      startErrorMessageOf(code=0, name="??", message="Hello World") returns " name:?? message:Hello Wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0070 begin`);
      const actual: string = startErrorMessageOf(0, '\u4e2d\u6587', 'Hello World');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(62);
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="??", me...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual(' name:\u4e2d\u6587 message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0070 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0071
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0071
     * @tc.desc      startErrorMessageOf(code=0, name="a", message="Hello") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0071 begin`);
      const actual: string = startErrorMessageOf(0, 'a', 'Hello');
      logInfo(`startErrorMessageOf(code=0, name="a", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:a message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0071 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0072
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0072
     * @tc.desc      startErrorMessageOf(code=0, name="a", message="hello world") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0072 begin`);
      const actual: string = startErrorMessageOf(0, 'a', 'hello world');
      logInfo(`startErrorMessageOf(code=0, name="a", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:a message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0072 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0073
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0073
     * @tc.desc      startErrorMessageOf(code=0, name="a", message="") returns "startAbilityByType onError, code:0 na...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0073 begin`);
      const actual: string = startErrorMessageOf(0, 'a', '');
      logInfo(`startErrorMessageOf(code=0, name="a", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:a message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0073 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0074
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0074
     * @tc.desc      startErrorMessageOf(code=0, name="a", message=" ") returns "startAbilityByType onError, code:0 n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0074 begin`);
      const actual: string = startErrorMessageOf(0, 'a', ' ');
      logInfo(`startErrorMessageOf(code=0, name="a", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:a message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0074 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0075
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0075
     * @tc.desc      startErrorMessageOf(code=0, name="a", message="A") returns "startAbilityByType onError, code:0 n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0075 begin`);
      const actual: string = startErrorMessageOf(0, 'a', 'A');
      logInfo(`startErrorMessageOf(code=0, name="a", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:a message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0075 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0076
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0076
     * @tc.desc      startErrorMessageOf(code=0, name="a", message="Sample Title 123") returns " name:a message:Sampl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0076 begin`);
      const actual: string = startErrorMessageOf(0, 'a', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=0, name="a", mes...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(66);
      logInfo(`startErrorMessageOf(code=0, name="a", mes...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="a", mes...: actual.substring(34)=${actual.substring(34)}`);
      expect(actual.substring(34)).assertEqual(' name:a message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0076 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0077
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0077
     * @tc.desc      startErrorMessageOf(code=0, name="a", message="??") returns "startAbilityByType onError, code:0 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0077 begin`);
      const actual: string = startErrorMessageOf(0, 'a', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=0, name="a", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:a message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0077 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0078
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0078
     * @tc.desc      startErrorMessageOf(code=0, name="a", message="a") returns "startAbilityByType onError, code:0 n...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0078 begin`);
      const actual: string = startErrorMessageOf(0, 'a', 'a');
      logInfo(`startErrorMessageOf(code=0, name="a", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:a message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0078 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0079
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0079
     * @tc.desc      startErrorMessageOf(code=0, name="a", message="abc") returns "startAbilityByType onError, code:0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0079 begin`);
      const actual: string = startErrorMessageOf(0, 'a', 'abc');
      logInfo(`startErrorMessageOf(code=0, name="a", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:a message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0079 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0080
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0080
     * @tc.desc      startErrorMessageOf(code=0, name="a", message="Hello World") returns "startAbilityByType onError...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0080 begin`);
      const actual: string = startErrorMessageOf(0, 'a', 'Hello World');
      logInfo(`startErrorMessageOf(code=0, name="a", mes...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:a message:Hello World');
      logInfo(`${BUNDLE}StartErrorMessageOf_0080 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0081
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0081
     * @tc.desc      startErrorMessageOf(code=0, name="abc", message="Hello") returns "startAbilityByType onError, co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0081 begin`);
      const actual: string = startErrorMessageOf(0, 'abc', 'Hello');
      logInfo(`startErrorMessageOf(code=0, name="abc", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:abc message:Hello');
      logInfo(`${BUNDLE}StartErrorMessageOf_0081 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0082
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0082
     * @tc.desc      startErrorMessageOf(code=0, name="abc", message="hello world") returns "startAbilityByType onErr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0082 begin`);
      const actual: string = startErrorMessageOf(0, 'abc', 'hello world');
      logInfo(`startErrorMessageOf(code=0, name="abc", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:abc message:hello world');
      logInfo(`${BUNDLE}StartErrorMessageOf_0082 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0083
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0083
     * @tc.desc      startErrorMessageOf(code=0, name="abc", message="") returns "startAbilityByType onError, code:0 ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_StartErrorMessageOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0083 begin`);
      const actual: string = startErrorMessageOf(0, 'abc', '');
      logInfo(`startErrorMessageOf(code=0, name="abc", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:abc message:');
      logInfo(`${BUNDLE}StartErrorMessageOf_0083 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0084
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0084
     * @tc.desc      startErrorMessageOf(code=0, name="abc", message=" ") returns "startAbilityByType onError, code:0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0084 begin`);
      const actual: string = startErrorMessageOf(0, 'abc', ' ');
      logInfo(`startErrorMessageOf(code=0, name="abc", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:abc message: ');
      logInfo(`${BUNDLE}StartErrorMessageOf_0084 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0085
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0085
     * @tc.desc      startErrorMessageOf(code=0, name="abc", message="A") returns "startAbilityByType onError, code:0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0085 begin`);
      const actual: string = startErrorMessageOf(0, 'abc', 'A');
      logInfo(`startErrorMessageOf(code=0, name="abc", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:abc message:A');
      logInfo(`${BUNDLE}StartErrorMessageOf_0085 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0086
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0086
     * @tc.desc      startErrorMessageOf(code=0, name="abc", message="Sample Title 123") returns "ame:abc message:Sam...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0086 begin`);
      const actual: string = startErrorMessageOf(0, 'abc', 'Sample Title 123');
      logInfo(`startErrorMessageOf(code=0, name="abc", m...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(68);
      logInfo(`startErrorMessageOf(code=0, name="abc", m...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('startAbilityByType onError, code');
      logInfo(`startErrorMessageOf(code=0, name="abc", m...: actual.substring(36)=${actual.substring(36)}`);
      expect(actual.substring(36)).assertEqual('ame:abc message:Sample Title 123');
      logInfo(`${BUNDLE}StartErrorMessageOf_0086 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0087
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0087
     * @tc.desc      startErrorMessageOf(code=0, name="abc", message="??") returns "startAbilityByType onError, code:...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0087 begin`);
      const actual: string = startErrorMessageOf(0, 'abc', '\u4e2d\u6587');
      logInfo(`startErrorMessageOf(code=0, name="abc", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:abc message:\u4e2d\u6587');
      logInfo(`${BUNDLE}StartErrorMessageOf_0087 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0088
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0088
     * @tc.desc      startErrorMessageOf(code=0, name="abc", message="a") returns "startAbilityByType onError, code:0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0088 begin`);
      const actual: string = startErrorMessageOf(0, 'abc', 'a');
      logInfo(`startErrorMessageOf(code=0, name="abc", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:abc message:a');
      logInfo(`${BUNDLE}StartErrorMessageOf_0088 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_START_ERROR_MESSAGE_OF_0089
     * @tc.name      UIExtensionSamples_StartErrorMessageOf_0089
     * @tc.desc      startErrorMessageOf(code=0, name="abc", message="abc") returns "startAbilityByType onError, code...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_StartErrorMessageOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StartErrorMessageOf_0089 begin`);
      const actual: string = startErrorMessageOf(0, 'abc', 'abc');
      logInfo(`startErrorMessageOf(code=0, name="abc", m...: actual=${actual}`);
      expect(actual).assertEqual('startAbilityByType onError, code:0 name:abc message:abc');
      logInfo(`${BUNDLE}StartErrorMessageOf_0089 end`);
    });
  });
}
