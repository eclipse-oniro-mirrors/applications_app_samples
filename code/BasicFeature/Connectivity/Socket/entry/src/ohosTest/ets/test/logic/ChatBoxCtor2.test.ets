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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ChatBox } from '../../../../main/ets/model/ChatBox';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';
const BUNDLE: string = 'Socket_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new ChatBox (77 cases). */
export default function chatBoxCtor2Test(): void {
  describe('ChatBoxCtor2Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0078
     * @tc.name      Socket_ChatBoxCtor_0078
     * @tc.desc      new ChatBox(true, "Hello", " 123 ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0078 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', ' 123 ');
      logInfo(`new ChatBox(true, "Hello", " 123 "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", " 123 "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", " 123 "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' 123 ');
      logInfo(`${BUNDLE}ChatBoxCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0079
     * @tc.name      Socket_ChatBoxCtor_0079
     * @tc.desc      new ChatBox(true, "Hello", "123123") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0079 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', '123123');
      logInfo(`new ChatBox(true, "Hello", "123123"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "123123"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "123123"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('123123');
      logInfo(`${BUNDLE}ChatBoxCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0080
     * @tc.name      Socket_ChatBoxCtor_0080
     * @tc.desc      new ChatBox(true, "Hello", "123_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0080 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', '123_1');
      logInfo(`new ChatBox(true, "Hello", "123_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "123_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "123_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('123_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0081
     * @tc.name      Socket_ChatBoxCtor_0081
     * @tc.desc      new ChatBox(false, "aa", "a_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0081 begin`);
      const subject: ChatBox = new ChatBox(false, 'aa', 'a_1');
      logInfo(`new ChatBox(false, "aa", "a_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "aa", "a_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('aa');
      logInfo(`new ChatBox(false, "aa", "a_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('a_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0082
     * @tc.name      Socket_ChatBoxCtor_0082
     * @tc.desc      new ChatBox(false, " a ", "123") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0082 begin`);
      const subject: ChatBox = new ChatBox(false, ' a ', '123');
      logInfo(`new ChatBox(false, " a ", "123"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, " a ", "123"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' a ');
      logInfo(`new ChatBox(false, " a ", "123"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('123');
      logInfo(`${BUNDLE}ChatBoxCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0083
     * @tc.name      Socket_ChatBoxCtor_0083
     * @tc.desc      new ChatBox(false, "123", "") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0083 begin`);
      const subject: ChatBox = new ChatBox(false, '123', '');
      logInfo(`new ChatBox(false, "123", ""): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "123", ""): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('123');
      logInfo(`new ChatBox(false, "123", ""): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('');
      logInfo(`${BUNDLE}ChatBoxCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0084
     * @tc.name      Socket_ChatBoxCtor_0084
     * @tc.desc      new ChatBox(true, " Hello ", "invalid") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0084 begin`);
      const subject: ChatBox = new ChatBox(true, ' Hello ', 'invalid');
      logInfo(`new ChatBox(true, " Hello ", "invalid"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " Hello ", "invalid"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' Hello ');
      logInfo(`new ChatBox(true, " Hello ", "invalid"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('invalid');
      logInfo(`${BUNDLE}ChatBoxCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0085
     * @tc.name      Socket_ChatBoxCtor_0085
     * @tc.desc      new ChatBox(true, " ", "2023-12-312023-12-31") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0085 begin`);
      const subject: ChatBox = new ChatBox(true, ' ', '2023-12-312023-12-31');
      logInfo(`new ChatBox(true, " ", "2023-12-312023-12...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " ", "2023-12-312023-12...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' ');
      logInfo(`new ChatBox(true, " ", "2023-12-312023-12...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2023-12-312023-12-31');
      logInfo(`${BUNDLE}ChatBoxCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0086
     * @tc.name      Socket_ChatBoxCtor_0086
     * @tc.desc      new ChatBox(true, "xHello", "Hello WorldHello World") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0086 begin`);
      const subject: ChatBox = new ChatBox(true, 'xHello', 'Hello WorldHello World');
      logInfo(`new ChatBox(true, "xHello", "Hello WorldH...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "xHello", "Hello WorldH...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('xHello');
      logInfo(`new ChatBox(true, "xHello", "Hello WorldH...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}ChatBoxCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0087
     * @tc.name      Socket_ChatBoxCtor_0087
     * @tc.desc      new ChatBox(false, "a_1", "123") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0087 begin`);
      const subject: ChatBox = new ChatBox(false, 'a_1', '123');
      logInfo(`new ChatBox(false, "a_1", "123"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "a_1", "123"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('a_1');
      logInfo(`new ChatBox(false, "a_1", "123"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('123');
      logInfo(`${BUNDLE}ChatBoxCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0088
     * @tc.name      Socket_ChatBoxCtor_0088
     * @tc.desc      new ChatBox(false, " a ", " a ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0088 begin`);
      const subject: ChatBox = new ChatBox(false, ' a ', ' a ');
      logInfo(`new ChatBox(false, " a ", " a "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, " a ", " a "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' a ');
      logInfo(`new ChatBox(false, " a ", " a "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' a ');
      logInfo(`${BUNDLE}ChatBoxCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0089
     * @tc.name      Socket_ChatBoxCtor_0089
     * @tc.desc      new ChatBox(false, "Hello_1", "123123") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0089 begin`);
      const subject: ChatBox = new ChatBox(false, 'Hello_1', '123123');
      logInfo(`new ChatBox(false, "Hello_1", "123123"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "Hello_1", "123123"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello_1');
      logInfo(`new ChatBox(false, "Hello_1", "123123"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('123123');
      logInfo(`${BUNDLE}ChatBoxCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0090
     * @tc.name      Socket_ChatBoxCtor_0090
     * @tc.desc      new ChatBox(false, "Sample Title 123_1", " ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0090 begin`);
      const subject: ChatBox = new ChatBox(false, 'Sample Title 123_1', ' ');
      logInfo(`new ChatBox(false, "Sample Title 123_1", ...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "Sample Title 123_1", ...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Sample Title 123_1');
      logInfo(`new ChatBox(false, "Sample Title 123_1", ...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' ');
      logInfo(`${BUNDLE}ChatBoxCtor_0090 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0091
     * @tc.name      Socket_ChatBoxCtor_0091
     * @tc.desc      new ChatBox(true, "   ", "abc") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0091 begin`);
      const subject: ChatBox = new ChatBox(true, '   ', 'abc');
      logInfo(`new ChatBox(true, "   ", "abc"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "   ", "abc"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('   ');
      logInfo(`new ChatBox(true, "   ", "abc"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('abc');
      logInfo(`${BUNDLE}ChatBoxCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0092
     * @tc.name      Socket_ChatBoxCtor_0092
     * @tc.desc      new ChatBox(true, "HelloHello", " ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0092 begin`);
      const subject: ChatBox = new ChatBox(true, 'HelloHello', ' ');
      logInfo(`new ChatBox(true, "HelloHello", " "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "HelloHello", " "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('HelloHello');
      logInfo(`new ChatBox(true, "HelloHello", " "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' ');
      logInfo(`${BUNDLE}ChatBoxCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0093
     * @tc.name      Socket_ChatBoxCtor_0093
     * @tc.desc      new ChatBox(true, "abc", "x ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0093 begin`);
      const subject: ChatBox = new ChatBox(true, 'abc', 'x ');
      logInfo(`new ChatBox(true, "abc", "x "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "abc", "x "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('abc');
      logInfo(`new ChatBox(true, "abc", "x "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('x ');
      logInfo(`${BUNDLE}ChatBoxCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0094
     * @tc.name      Socket_ChatBoxCtor_0094
     * @tc.desc      new ChatBox(false, "Hello", " 2023-12-31 ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0094 begin`);
      const subject: ChatBox = new ChatBox(false, 'Hello', ' 2023-12-31 ');
      logInfo(`new ChatBox(false, "Hello", " 2023-12-31 "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "Hello", " 2023-12-31 "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(false, "Hello", " 2023-12-31 "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' 2023-12-31 ');
      logInfo(`${BUNDLE}ChatBoxCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0095
     * @tc.name      Socket_ChatBoxCtor_0095
     * @tc.desc      new ChatBox(true, "Sample Title 123_1", "invalid_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0095 begin`);
      const subject: ChatBox = new ChatBox(true, 'Sample Title 123_1', 'invalid_1');
      logInfo(`new ChatBox(true, "Sample Title 123_1", "...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Sample Title 123_1", "...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Sample Title 123_1');
      logInfo(`new ChatBox(true, "Sample Title 123_1", "...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('invalid_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0096
     * @tc.name      Socket_ChatBoxCtor_0096
     * @tc.desc      new ChatBox(true, "abc", " ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0096 begin`);
      const subject: ChatBox = new ChatBox(true, 'abc', ' ');
      logInfo(`new ChatBox(true, "abc", " "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "abc", " "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('abc');
      logInfo(`new ChatBox(true, "abc", " "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' ');
      logInfo(`${BUNDLE}ChatBoxCtor_0096 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0097
     * @tc.name      Socket_ChatBoxCtor_0097
     * @tc.desc      new ChatBox(false, "??", "123") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0097 begin`);
      const subject: ChatBox = new ChatBox(false, '\u4e2d\u6587', '123');
      logInfo(`new ChatBox(false, "??", "123"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "??", "123"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('\u4e2d\u6587');
      logInfo(`new ChatBox(false, "??", "123"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('123');
      logInfo(`${BUNDLE}ChatBoxCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0098
     * @tc.name      Socket_ChatBoxCtor_0098
     * @tc.desc      new ChatBox(true, "AA", "123") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0098 begin`);
      const subject: ChatBox = new ChatBox(true, 'AA', '123');
      logInfo(`new ChatBox(true, "AA", "123"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "AA", "123"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('AA');
      logInfo(`new ChatBox(true, "AA", "123"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('123');
      logInfo(`${BUNDLE}ChatBoxCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0099
     * @tc.name      Socket_ChatBoxCtor_0099
     * @tc.desc      new ChatBox(false, "????", "xabc") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0099 begin`);
      const subject: ChatBox = new ChatBox(false, '\u4e2d\u6587\u4e2d\u6587', 'xabc');
      logInfo(`new ChatBox(false, "????", "xabc"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "????", "xabc"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`new ChatBox(false, "????", "xabc"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xabc');
      logInfo(`${BUNDLE}ChatBoxCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0100
     * @tc.name      Socket_ChatBoxCtor_0100
     * @tc.desc      new ChatBox(false, "hello world", "xa") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0100 begin`);
      const subject: ChatBox = new ChatBox(false, 'hello world', 'xa');
      logInfo(`new ChatBox(false, "hello world", "xa"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "hello world", "xa"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('hello world');
      logInfo(`new ChatBox(false, "hello world", "xa"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xa');
      logInfo(`${BUNDLE}ChatBoxCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0101
     * @tc.name      Socket_ChatBoxCtor_0101
     * @tc.desc      new ChatBox(true, " Sample Title 123 ", "2023-12-312023-12-31") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0101 begin`);
      const subject: ChatBox = new ChatBox(true, ' Sample Title 123 ', '2023-12-312023-12-31');
      logInfo(`new ChatBox(true, " Sample Title 123 ", "...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " Sample Title 123 ", "...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' Sample Title 123 ');
      logInfo(`new ChatBox(true, " Sample Title 123 ", "...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2023-12-312023-12-31');
      logInfo(`${BUNDLE}ChatBoxCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0102
     * @tc.name      Socket_ChatBoxCtor_0102
     * @tc.desc      new ChatBox(false, " Sample Title 123 ", "2023-12-31_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0102 begin`);
      const subject: ChatBox = new ChatBox(false, ' Sample Title 123 ', '2023-12-31_1');
      logInfo(`new ChatBox(false, " Sample Title 123 ", ...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, " Sample Title 123 ", ...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' Sample Title 123 ');
      logInfo(`new ChatBox(false, " Sample Title 123 ", ...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2023-12-31_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0102 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0103
     * @tc.name      Socket_ChatBoxCtor_0103
     * @tc.desc      new ChatBox(true, "hello world", "invalidinvalid") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0103 begin`);
      const subject: ChatBox = new ChatBox(true, 'hello world', 'invalidinvalid');
      logInfo(`new ChatBox(true, "hello world", "invalid...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "hello world", "invalid...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('hello world');
      logInfo(`new ChatBox(true, "hello world", "invalid...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('invalidinvalid');
      logInfo(`${BUNDLE}ChatBoxCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0104
     * @tc.name      Socket_ChatBoxCtor_0104
     * @tc.desc      new ChatBox(true, "", "a") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0104 begin`);
      const subject: ChatBox = new ChatBox(true, '', 'a');
      logInfo(`new ChatBox(true, "", "a"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "", "a"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('');
      logInfo(`new ChatBox(true, "", "a"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('a');
      logInfo(`${BUNDLE}ChatBoxCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0105
     * @tc.name      Socket_ChatBoxCtor_0105
     * @tc.desc      new ChatBox(false, "xA", " abc ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0105 begin`);
      const subject: ChatBox = new ChatBox(false, 'xA', ' abc ');
      logInfo(`new ChatBox(false, "xA", " abc "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "xA", " abc "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('xA');
      logInfo(`new ChatBox(false, "xA", " abc "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' abc ');
      logInfo(`${BUNDLE}ChatBoxCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0106
     * @tc.name      Socket_ChatBoxCtor_0106
     * @tc.desc      new ChatBox(false, "A", "2023-12-31") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0106 begin`);
      const subject: ChatBox = new ChatBox(false, 'A', '2023-12-31');
      logInfo(`new ChatBox(false, "A", "2023-12-31"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "A", "2023-12-31"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('A');
      logInfo(`new ChatBox(false, "A", "2023-12-31"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2023-12-31');
      logInfo(`${BUNDLE}ChatBoxCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0107
     * @tc.name      Socket_ChatBoxCtor_0107
     * @tc.desc      new ChatBox(true, " _1", "x2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0107 begin`);
      const subject: ChatBox = new ChatBox(true, ' _1', 'x2024-02-29');
      logInfo(`new ChatBox(true, " _1", "x2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " _1", "x2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' _1');
      logInfo(`new ChatBox(true, " _1", "x2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('x2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0108
     * @tc.name      Socket_ChatBoxCtor_0108
     * @tc.desc      new ChatBox(false, "hello worldhello world", "xa") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0108 begin`);
      const subject: ChatBox = new ChatBox(false, 'hello worldhello world', 'xa');
      logInfo(`new ChatBox(false, "hello worldhello worl...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "hello worldhello worl...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('hello worldhello world');
      logInfo(`new ChatBox(false, "hello worldhello worl...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xa');
      logInfo(`${BUNDLE}ChatBoxCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0109
     * @tc.name      Socket_ChatBoxCtor_0109
     * @tc.desc      new ChatBox(true, " a ", "123") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0109 begin`);
      const subject: ChatBox = new ChatBox(true, ' a ', '123');
      logInfo(`new ChatBox(true, " a ", "123"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " a ", "123"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' a ');
      logInfo(`new ChatBox(true, " a ", "123"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('123');
      logInfo(`${BUNDLE}ChatBoxCtor_0109 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0110
     * @tc.name      Socket_ChatBoxCtor_0110
     * @tc.desc      new ChatBox(true, "x ", "x2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0110 begin`);
      const subject: ChatBox = new ChatBox(true, 'x ', 'x2024-02-29');
      logInfo(`new ChatBox(true, "x ", "x2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "x ", "x2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('x ');
      logInfo(`new ChatBox(true, "x ", "x2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('x2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0110 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0111
     * @tc.name      Socket_ChatBoxCtor_0111
     * @tc.desc      new ChatBox(false, "123", "invalid") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0111 begin`);
      const subject: ChatBox = new ChatBox(false, '123', 'invalid');
      logInfo(`new ChatBox(false, "123", "invalid"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "123", "invalid"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('123');
      logInfo(`new ChatBox(false, "123", "invalid"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('invalid');
      logInfo(`${BUNDLE}ChatBoxCtor_0111 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0112
     * @tc.name      Socket_ChatBoxCtor_0112
     * @tc.desc      new ChatBox(false, "Hello World", "   ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0112 begin`);
      const subject: ChatBox = new ChatBox(false, 'Hello World', '   ');
      logInfo(`new ChatBox(false, "Hello World", "   "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "Hello World", "   "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello World');
      logInfo(`new ChatBox(false, "Hello World", "   "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('   ');
      logInfo(`${BUNDLE}ChatBoxCtor_0112 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0113
     * @tc.name      Socket_ChatBoxCtor_0113
     * @tc.desc      new ChatBox(false, " A ", "xa") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0113 begin`);
      const subject: ChatBox = new ChatBox(false, ' A ', 'xa');
      logInfo(`new ChatBox(false, " A ", "xa"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, " A ", "xa"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' A ');
      logInfo(`new ChatBox(false, " A ", "xa"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xa');
      logInfo(`${BUNDLE}ChatBoxCtor_0113 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0114
     * @tc.name      Socket_ChatBoxCtor_0114
     * @tc.desc      new ChatBox(true, "Hello_1", " invalid ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0114 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello_1', ' invalid ');
      logInfo(`new ChatBox(true, "Hello_1", " invalid "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello_1", " invalid "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello_1');
      logInfo(`new ChatBox(true, "Hello_1", " invalid "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' invalid ');
      logInfo(`${BUNDLE}ChatBoxCtor_0114 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0115
     * @tc.name      Socket_ChatBoxCtor_0115
     * @tc.desc      new ChatBox(false, "abc", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0115 begin`);
      const subject: ChatBox = new ChatBox(false, 'abc', '2024-02-29');
      logInfo(`new ChatBox(false, "abc", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "abc", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('abc');
      logInfo(`new ChatBox(false, "abc", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0115 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0116
     * @tc.name      Socket_ChatBoxCtor_0116
     * @tc.desc      new ChatBox(true, "  ", "invalid") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0116 begin`);
      const subject: ChatBox = new ChatBox(true, '  ', 'invalid');
      logInfo(`new ChatBox(true, "  ", "invalid"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "  ", "invalid"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('  ');
      logInfo(`new ChatBox(true, "  ", "invalid"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('invalid');
      logInfo(`${BUNDLE}ChatBoxCtor_0116 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0117
     * @tc.name      Socket_ChatBoxCtor_0117
     * @tc.desc      new ChatBox(true, "????", " ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0117 begin`);
      const subject: ChatBox = new ChatBox(true, '\u4e2d\u6587\u4e2d\u6587', ' ');
      logInfo(`new ChatBox(true, "????", " "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "????", " "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`new ChatBox(true, "????", " "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' ');
      logInfo(`${BUNDLE}ChatBoxCtor_0117 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0118
     * @tc.name      Socket_ChatBoxCtor_0118
     * @tc.desc      new ChatBox(true, " hello world ", "   ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0118 begin`);
      const subject: ChatBox = new ChatBox(true, ' hello world ', '   ');
      logInfo(`new ChatBox(true, " hello world ", "   "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " hello world ", "   "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' hello world ');
      logInfo(`new ChatBox(true, " hello world ", "   "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('   ');
      logInfo(`${BUNDLE}ChatBoxCtor_0118 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0119
     * @tc.name      Socket_ChatBoxCtor_0119
     * @tc.desc      new ChatBox(false, "xA", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0119 begin`);
      const subject: ChatBox = new ChatBox(false, 'xA', '2024-02-29');
      logInfo(`new ChatBox(false, "xA", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "xA", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('xA');
      logInfo(`new ChatBox(false, "xA", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0119 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0120
     * @tc.name      Socket_ChatBoxCtor_0120
     * @tc.desc      new ChatBox(true, "A", " invalid ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0120 begin`);
      const subject: ChatBox = new ChatBox(true, 'A', ' invalid ');
      logInfo(`new ChatBox(true, "A", " invalid "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "A", " invalid "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('A');
      logInfo(`new ChatBox(true, "A", " invalid "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' invalid ');
      logInfo(`${BUNDLE}ChatBoxCtor_0120 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0121
     * @tc.name      Socket_ChatBoxCtor_0121
     * @tc.desc      new ChatBox(true, " Sample Title 123 ", " ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0121 begin`);
      const subject: ChatBox = new ChatBox(true, ' Sample Title 123 ', ' ');
      logInfo(`new ChatBox(true, " Sample Title 123 ", " "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " Sample Title 123 ", " "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' Sample Title 123 ');
      logInfo(`new ChatBox(true, " Sample Title 123 ", " "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' ');
      logInfo(`${BUNDLE}ChatBoxCtor_0121 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0122
     * @tc.name      Socket_ChatBoxCtor_0122
     * @tc.desc      new ChatBox(false, " ?? ", "aa") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0122 begin`);
      const subject: ChatBox = new ChatBox(false, ' \u4e2d\u6587 ', 'aa');
      logInfo(`new ChatBox(false, " ?? ", "aa"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, " ?? ", "aa"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' \u4e2d\u6587 ');
      logInfo(`new ChatBox(false, " ?? ", "aa"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('aa');
      logInfo(`${BUNDLE}ChatBoxCtor_0122 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0123
     * @tc.name      Socket_ChatBoxCtor_0123
     * @tc.desc      new ChatBox(true, "aa", "invalid") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0123 begin`);
      const subject: ChatBox = new ChatBox(true, 'aa', 'invalid');
      logInfo(`new ChatBox(true, "aa", "invalid"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "aa", "invalid"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('aa');
      logInfo(`new ChatBox(true, "aa", "invalid"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('invalid');
      logInfo(`${BUNDLE}ChatBoxCtor_0123 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0124
     * @tc.name      Socket_ChatBoxCtor_0124
     * @tc.desc      new ChatBox(false, "a", " ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0124 begin`);
      const subject: ChatBox = new ChatBox(false, 'a', ' ');
      logInfo(`new ChatBox(false, "a", " "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "a", " "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('a');
      logInfo(`new ChatBox(false, "a", " "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' ');
      logInfo(`${BUNDLE}ChatBoxCtor_0124 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0125
     * @tc.name      Socket_ChatBoxCtor_0125
     * @tc.desc      new ChatBox(false, "  ", "abcabc") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0125 begin`);
      const subject: ChatBox = new ChatBox(false, '  ', 'abcabc');
      logInfo(`new ChatBox(false, "  ", "abcabc"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "  ", "abcabc"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('  ');
      logInfo(`new ChatBox(false, "  ", "abcabc"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('abcabc');
      logInfo(`${BUNDLE}ChatBoxCtor_0125 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0126
     * @tc.name      Socket_ChatBoxCtor_0126
     * @tc.desc      new ChatBox(true, " Hello ", " invalid ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0126 begin`);
      const subject: ChatBox = new ChatBox(true, ' Hello ', ' invalid ');
      logInfo(`new ChatBox(true, " Hello ", " invalid "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " Hello ", " invalid "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' Hello ');
      logInfo(`new ChatBox(true, " Hello ", " invalid "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' invalid ');
      logInfo(`${BUNDLE}ChatBoxCtor_0126 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0127
     * @tc.name      Socket_ChatBoxCtor_0127
     * @tc.desc      new ChatBox(false, "xHello", "2023-12-31_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0127 begin`);
      const subject: ChatBox = new ChatBox(false, 'xHello', '2023-12-31_1');
      logInfo(`new ChatBox(false, "xHello", "2023-12-31_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "xHello", "2023-12-31_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('xHello');
      logInfo(`new ChatBox(false, "xHello", "2023-12-31_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2023-12-31_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0127 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0128
     * @tc.name      Socket_ChatBoxCtor_0128
     * @tc.desc      new ChatBox(true, " A ", "") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0128 begin`);
      const subject: ChatBox = new ChatBox(true, ' A ', '');
      logInfo(`new ChatBox(true, " A ", ""): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " A ", ""): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' A ');
      logInfo(`new ChatBox(true, " A ", ""): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('');
      logInfo(`${BUNDLE}ChatBoxCtor_0128 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0129
     * @tc.name      Socket_ChatBoxCtor_0129
     * @tc.desc      new ChatBox(false, " abc ", "x2023-12-31") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0129 begin`);
      const subject: ChatBox = new ChatBox(false, ' abc ', 'x2023-12-31');
      logInfo(`new ChatBox(false, " abc ", "x2023-12-31"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, " abc ", "x2023-12-31"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' abc ');
      logInfo(`new ChatBox(false, " abc ", "x2023-12-31"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('x2023-12-31');
      logInfo(`${BUNDLE}ChatBoxCtor_0129 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0130
     * @tc.name      Socket_ChatBoxCtor_0130
     * @tc.desc      new ChatBox(false, "  ", "xabc") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0130 begin`);
      const subject: ChatBox = new ChatBox(false, '  ', 'xabc');
      logInfo(`new ChatBox(false, "  ", "xabc"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "  ", "xabc"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('  ');
      logInfo(`new ChatBox(false, "  ", "xabc"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xabc');
      logInfo(`${BUNDLE}ChatBoxCtor_0130 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0131
     * @tc.name      Socket_ChatBoxCtor_0131
     * @tc.desc      new ChatBox(false, "????", "abcabc") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0131 begin`);
      const subject: ChatBox = new ChatBox(false, '\u4e2d\u6587\u4e2d\u6587', 'abcabc');
      logInfo(`new ChatBox(false, "????", "abcabc"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "????", "abcabc"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`new ChatBox(false, "????", "abcabc"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('abcabc');
      logInfo(`${BUNDLE}ChatBoxCtor_0131 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0132
     * @tc.name      Socket_ChatBoxCtor_0132
     * @tc.desc      new ChatBox(false, "xa", "x ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0132 begin`);
      const subject: ChatBox = new ChatBox(false, 'xa', 'x ');
      logInfo(`new ChatBox(false, "xa", "x "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "xa", "x "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('xa');
      logInfo(`new ChatBox(false, "xa", "x "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('x ');
      logInfo(`${BUNDLE}ChatBoxCtor_0132 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0133
     * @tc.name      Socket_ChatBoxCtor_0133
     * @tc.desc      new ChatBox(false, "Hello_1", "   ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0133 begin`);
      const subject: ChatBox = new ChatBox(false, 'Hello_1', '   ');
      logInfo(`new ChatBox(false, "Hello_1", "   "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "Hello_1", "   "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello_1');
      logInfo(`new ChatBox(false, "Hello_1", "   "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('   ');
      logInfo(`${BUNDLE}ChatBoxCtor_0133 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0134
     * @tc.name      Socket_ChatBoxCtor_0134
     * @tc.desc      new ChatBox(false, " ", "2024-02-29_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0134 begin`);
      const subject: ChatBox = new ChatBox(false, ' ', '2024-02-29_1');
      logInfo(`new ChatBox(false, " ", "2024-02-29_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, " ", "2024-02-29_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' ');
      logInfo(`new ChatBox(false, " ", "2024-02-29_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0134 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0135
     * @tc.name      Socket_ChatBoxCtor_0135
     * @tc.desc      new ChatBox(true, "??_1", "Hello WorldHello World") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0135 begin`);
      const subject: ChatBox = new ChatBox(true, '\u4e2d\u6587_1', 'Hello WorldHello World');
      logInfo(`new ChatBox(true, "??_1", "Hello WorldHel...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "??_1", "Hello WorldHel...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('\u4e2d\u6587_1');
      logInfo(`new ChatBox(true, "??_1", "Hello WorldHel...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}ChatBoxCtor_0135 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0136
     * @tc.name      Socket_ChatBoxCtor_0136
     * @tc.desc      new ChatBox(true, "abc", " Hello World ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0136 begin`);
      const subject: ChatBox = new ChatBox(true, 'abc', ' Hello World ');
      logInfo(`new ChatBox(true, "abc", " Hello World "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "abc", " Hello World "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('abc');
      logInfo(`new ChatBox(true, "abc", " Hello World "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}ChatBoxCtor_0136 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0137
     * @tc.name      Socket_ChatBoxCtor_0137
     * @tc.desc      new ChatBox(true, "hello world_1", "xinvalid") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0137 begin`);
      const subject: ChatBox = new ChatBox(true, 'hello world_1', 'xinvalid');
      logInfo(`new ChatBox(true, "hello world_1", "xinva...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "hello world_1", "xinva...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('hello world_1');
      logInfo(`new ChatBox(true, "hello world_1", "xinva...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xinvalid');
      logInfo(`${BUNDLE}ChatBoxCtor_0137 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0138
     * @tc.name      Socket_ChatBoxCtor_0138
     * @tc.desc      new ChatBox(true, "x??", "  ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0138 begin`);
      const subject: ChatBox = new ChatBox(true, 'x\u4e2d\u6587', '  ');
      logInfo(`new ChatBox(true, "x??", "  "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "x??", "  "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('x\u4e2d\u6587');
      logInfo(`new ChatBox(true, "x??", "  "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('  ');
      logInfo(`${BUNDLE}ChatBoxCtor_0138 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0139
     * @tc.name      Socket_ChatBoxCtor_0139
     * @tc.desc      new ChatBox(false, "Sample Title 123", " 2023-12-31 ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0139 begin`);
      const subject: ChatBox = new ChatBox(false, 'Sample Title 123', ' 2023-12-31 ');
      logInfo(`new ChatBox(false, "Sample Title 123", " ...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "Sample Title 123", " ...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Sample Title 123');
      logInfo(`new ChatBox(false, "Sample Title 123", " ...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' 2023-12-31 ');
      logInfo(`${BUNDLE}ChatBoxCtor_0139 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0140
     * @tc.name      Socket_ChatBoxCtor_0140
     * @tc.desc      new ChatBox(false, " Sample Title 123 ", "xabc") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0140 begin`);
      const subject: ChatBox = new ChatBox(false, ' Sample Title 123 ', 'xabc');
      logInfo(`new ChatBox(false, " Sample Title 123 ", ...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, " Sample Title 123 ", ...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' Sample Title 123 ');
      logInfo(`new ChatBox(false, " Sample Title 123 ", ...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xabc');
      logInfo(`${BUNDLE}ChatBoxCtor_0140 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0141
     * @tc.name      Socket_ChatBoxCtor_0141
     * @tc.desc      new ChatBox(true, "xSample Title 123", "123_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0141 begin`);
      const subject: ChatBox = new ChatBox(true, 'xSample Title 123', '123_1');
      logInfo(`new ChatBox(true, "xSample Title 123", "1...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "xSample Title 123", "1...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('xSample Title 123');
      logInfo(`new ChatBox(true, "xSample Title 123", "1...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('123_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0141 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0142
     * @tc.name      Socket_ChatBoxCtor_0142
     * @tc.desc      new ChatBox(false, "????", "123_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0142 begin`);
      const subject: ChatBox = new ChatBox(false, '\u4e2d\u6587\u4e2d\u6587', '123_1');
      logInfo(`new ChatBox(false, "????", "123_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "????", "123_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`new ChatBox(false, "????", "123_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('123_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0142 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0143
     * @tc.name      Socket_ChatBoxCtor_0143
     * @tc.desc      new ChatBox(true, " ?? ", "xa") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0143 begin`);
      const subject: ChatBox = new ChatBox(true, ' \u4e2d\u6587 ', 'xa');
      logInfo(`new ChatBox(true, " ?? ", "xa"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " ?? ", "xa"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' \u4e2d\u6587 ');
      logInfo(`new ChatBox(true, " ?? ", "xa"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xa');
      logInfo(`${BUNDLE}ChatBoxCtor_0143 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0144
     * @tc.name      Socket_ChatBoxCtor_0144
     * @tc.desc      new ChatBox(false, "x ", "xabc") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0144 begin`);
      const subject: ChatBox = new ChatBox(false, 'x ', 'xabc');
      logInfo(`new ChatBox(false, "x ", "xabc"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "x ", "xabc"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('x ');
      logInfo(`new ChatBox(false, "x ", "xabc"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xabc');
      logInfo(`${BUNDLE}ChatBoxCtor_0144 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0145
     * @tc.name      Socket_ChatBoxCtor_0145
     * @tc.desc      new ChatBox(false, "a", "Hello World_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0145 begin`);
      const subject: ChatBox = new ChatBox(false, 'a', 'Hello World_1');
      logInfo(`new ChatBox(false, "a", "Hello World_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "a", "Hello World_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('a');
      logInfo(`new ChatBox(false, "a", "Hello World_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0145 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0146
     * @tc.name      Socket_ChatBoxCtor_0146
     * @tc.desc      new ChatBox(false, "a_1", "xinvalid") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0146 begin`);
      const subject: ChatBox = new ChatBox(false, 'a_1', 'xinvalid');
      logInfo(`new ChatBox(false, "a_1", "xinvalid"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "a_1", "xinvalid"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('a_1');
      logInfo(`new ChatBox(false, "a_1", "xinvalid"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xinvalid');
      logInfo(`${BUNDLE}ChatBoxCtor_0146 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0147
     * @tc.name      Socket_ChatBoxCtor_0147
     * @tc.desc      new ChatBox(false, "A", "xHello World") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0147 begin`);
      const subject: ChatBox = new ChatBox(false, 'A', 'xHello World');
      logInfo(`new ChatBox(false, "A", "xHello World"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "A", "xHello World"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('A');
      logInfo(`new ChatBox(false, "A", "xHello World"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xHello World');
      logInfo(`${BUNDLE}ChatBoxCtor_0147 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0148
     * @tc.name      Socket_ChatBoxCtor_0148
     * @tc.desc      new ChatBox(true, "a", "a") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0148 begin`);
      const subject: ChatBox = new ChatBox(true, 'a', 'a');
      logInfo(`new ChatBox(true, "a", "a"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "a", "a"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('a');
      logInfo(`new ChatBox(true, "a", "a"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('a');
      logInfo(`${BUNDLE}ChatBoxCtor_0148 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0149
     * @tc.name      Socket_ChatBoxCtor_0149
     * @tc.desc      new ChatBox(true, " hello world ", "2024-02-292024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0149 begin`);
      const subject: ChatBox = new ChatBox(true, ' hello world ', '2024-02-292024-02-29');
      logInfo(`new ChatBox(true, " hello world ", "2024-...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " hello world ", "2024-...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' hello world ');
      logInfo(`new ChatBox(true, " hello world ", "2024-...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-292024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0149 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0150
     * @tc.name      Socket_ChatBoxCtor_0150
     * @tc.desc      new ChatBox(true, "x??", " Hello World ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0150 begin`);
      const subject: ChatBox = new ChatBox(true, 'x\u4e2d\u6587', ' Hello World ');
      logInfo(`new ChatBox(true, "x??", " Hello World "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "x??", " Hello World "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('x\u4e2d\u6587');
      logInfo(`new ChatBox(true, "x??", " Hello World "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}ChatBoxCtor_0150 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0151
     * @tc.name      Socket_ChatBoxCtor_0151
     * @tc.desc      new ChatBox(true, "??_1", "x2023-12-31") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0151 begin`);
      const subject: ChatBox = new ChatBox(true, '\u4e2d\u6587_1', 'x2023-12-31');
      logInfo(`new ChatBox(true, "??_1", "x2023-12-31"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "??_1", "x2023-12-31"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('\u4e2d\u6587_1');
      logInfo(`new ChatBox(true, "??_1", "x2023-12-31"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('x2023-12-31');
      logInfo(`${BUNDLE}ChatBoxCtor_0151 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0152
     * @tc.name      Socket_ChatBoxCtor_0152
     * @tc.desc      new ChatBox(false, "  ", "Hello World_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0152 begin`);
      const subject: ChatBox = new ChatBox(false, '  ', 'Hello World_1');
      logInfo(`new ChatBox(false, "  ", "Hello World_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "  ", "Hello World_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('  ');
      logInfo(`new ChatBox(false, "  ", "Hello World_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0152 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0153
     * @tc.name      Socket_ChatBoxCtor_0153
     * @tc.desc      new ChatBox(true, "a", "x ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0153 begin`);
      const subject: ChatBox = new ChatBox(true, 'a', 'x ');
      logInfo(`new ChatBox(true, "a", "x "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "a", "x "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('a');
      logInfo(`new ChatBox(true, "a", "x "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('x ');
      logInfo(`${BUNDLE}ChatBoxCtor_0153 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0154
     * @tc.name      Socket_ChatBoxCtor_0154
     * @tc.desc      new ChatBox(true, " hello world ", "Hello World") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0154 begin`);
      const subject: ChatBox = new ChatBox(true, ' hello world ', 'Hello World');
      logInfo(`new ChatBox(true, " hello world ", "Hello...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " hello world ", "Hello...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' hello world ');
      logInfo(`new ChatBox(true, " hello world ", "Hello...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('Hello World');
      logInfo(`${BUNDLE}ChatBoxCtor_0154 end`);
    });
  });
}
