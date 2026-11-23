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
export default function chatBoxCtorTest(): void {
  describe('ChatBoxCtorTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0001
     * @tc.name      Socket_ChatBoxCtor_0001
     * @tc.desc      new ChatBox(true, "Hello", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Socket_ChatBoxCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0001 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', '2024-02-29');
      logInfo(`new ChatBox(true, "Hello", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0002
     * @tc.name      Socket_ChatBoxCtor_0002
     * @tc.desc      new ChatBox(false, "Hello", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Socket_ChatBoxCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0002 begin`);
      const subject: ChatBox = new ChatBox(false, 'Hello', '2024-02-29');
      logInfo(`new ChatBox(false, "Hello", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertFalse();
      logInfo(`new ChatBox(false, "Hello", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(false, "Hello", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0003
     * @tc.name      Socket_ChatBoxCtor_0003
     * @tc.desc      new ChatBox(true, "hello world", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0003 begin`);
      const subject: ChatBox = new ChatBox(true, 'hello world', '2024-02-29');
      logInfo(`new ChatBox(true, "hello world", "2024-02...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "hello world", "2024-02...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('hello world');
      logInfo(`new ChatBox(true, "hello world", "2024-02...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0004
     * @tc.name      Socket_ChatBoxCtor_0004
     * @tc.desc      new ChatBox(true, "", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0004 begin`);
      const subject: ChatBox = new ChatBox(true, '', '2024-02-29');
      logInfo(`new ChatBox(true, "", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('');
      logInfo(`new ChatBox(true, "", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0005
     * @tc.name      Socket_ChatBoxCtor_0005
     * @tc.desc      new ChatBox(true, " ", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0005 begin`);
      const subject: ChatBox = new ChatBox(true, ' ', '2024-02-29');
      logInfo(`new ChatBox(true, " ", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " ", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' ');
      logInfo(`new ChatBox(true, " ", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0006
     * @tc.name      Socket_ChatBoxCtor_0006
     * @tc.desc      new ChatBox(true, "A", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0006 begin`);
      const subject: ChatBox = new ChatBox(true, 'A', '2024-02-29');
      logInfo(`new ChatBox(true, "A", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "A", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('A');
      logInfo(`new ChatBox(true, "A", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0007
     * @tc.name      Socket_ChatBoxCtor_0007
     * @tc.desc      new ChatBox(true, "Sample Title 123", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0007 begin`);
      const subject: ChatBox = new ChatBox(true, 'Sample Title 123', '2024-02-29');
      logInfo(`new ChatBox(true, "Sample Title 123", "20...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Sample Title 123", "20...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Sample Title 123');
      logInfo(`new ChatBox(true, "Sample Title 123", "20...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0008
     * @tc.name      Socket_ChatBoxCtor_0008
     * @tc.desc      new ChatBox(true, "??", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0008 begin`);
      const subject: ChatBox = new ChatBox(true, '\u4e2d\u6587', '2024-02-29');
      logInfo(`new ChatBox(true, "??", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "??", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('\u4e2d\u6587');
      logInfo(`new ChatBox(true, "??", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0009
     * @tc.name      Socket_ChatBoxCtor_0009
     * @tc.desc      new ChatBox(true, "a", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0009 begin`);
      const subject: ChatBox = new ChatBox(true, 'a', '2024-02-29');
      logInfo(`new ChatBox(true, "a", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "a", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('a');
      logInfo(`new ChatBox(true, "a", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0010
     * @tc.name      Socket_ChatBoxCtor_0010
     * @tc.desc      new ChatBox(true, "abc", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0010 begin`);
      const subject: ChatBox = new ChatBox(true, 'abc', '2024-02-29');
      logInfo(`new ChatBox(true, "abc", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "abc", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('abc');
      logInfo(`new ChatBox(true, "abc", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0011
     * @tc.name      Socket_ChatBoxCtor_0011
     * @tc.desc      new ChatBox(true, "Hello World", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0011 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello World', '2024-02-29');
      logInfo(`new ChatBox(true, "Hello World", "2024-02...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello World", "2024-02...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello World');
      logInfo(`new ChatBox(true, "Hello World", "2024-02...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0012
     * @tc.name      Socket_ChatBoxCtor_0012
     * @tc.desc      new ChatBox(true, "123", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0012 begin`);
      const subject: ChatBox = new ChatBox(true, '123', '2024-02-29');
      logInfo(`new ChatBox(true, "123", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "123", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('123');
      logInfo(`new ChatBox(true, "123", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0013
     * @tc.name      Socket_ChatBoxCtor_0013
     * @tc.desc      new ChatBox(true, " Hello ", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0013 begin`);
      const subject: ChatBox = new ChatBox(true, ' Hello ', '2024-02-29');
      logInfo(`new ChatBox(true, " Hello ", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " Hello ", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' Hello ');
      logInfo(`new ChatBox(true, " Hello ", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0014
     * @tc.name      Socket_ChatBoxCtor_0014
     * @tc.desc      new ChatBox(true, "HelloHello", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0014 begin`);
      const subject: ChatBox = new ChatBox(true, 'HelloHello', '2024-02-29');
      logInfo(`new ChatBox(true, "HelloHello", "2024-02-...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "HelloHello", "2024-02-...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('HelloHello');
      logInfo(`new ChatBox(true, "HelloHello", "2024-02-...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0015
     * @tc.name      Socket_ChatBoxCtor_0015
     * @tc.desc      new ChatBox(true, "Hello_1", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0015 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello_1', '2024-02-29');
      logInfo(`new ChatBox(true, "Hello_1", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello_1", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello_1');
      logInfo(`new ChatBox(true, "Hello_1", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0016
     * @tc.name      Socket_ChatBoxCtor_0016
     * @tc.desc      new ChatBox(true, "xHello", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0016 begin`);
      const subject: ChatBox = new ChatBox(true, 'xHello', '2024-02-29');
      logInfo(`new ChatBox(true, "xHello", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "xHello", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('xHello');
      logInfo(`new ChatBox(true, "xHello", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0017
     * @tc.name      Socket_ChatBoxCtor_0017
     * @tc.desc      new ChatBox(true, " hello world ", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0017 begin`);
      const subject: ChatBox = new ChatBox(true, ' hello world ', '2024-02-29');
      logInfo(`new ChatBox(true, " hello world ", "2024-...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " hello world ", "2024-...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' hello world ');
      logInfo(`new ChatBox(true, " hello world ", "2024-...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0018
     * @tc.name      Socket_ChatBoxCtor_0018
     * @tc.desc      new ChatBox(true, "hello worldhello world", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0018 begin`);
      const subject: ChatBox = new ChatBox(true, 'hello worldhello world', '2024-02-29');
      logInfo(`new ChatBox(true, "hello worldhello world...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "hello worldhello world...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('hello worldhello world');
      logInfo(`new ChatBox(true, "hello worldhello world...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0019
     * @tc.name      Socket_ChatBoxCtor_0019
     * @tc.desc      new ChatBox(true, "hello world_1", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0019 begin`);
      const subject: ChatBox = new ChatBox(true, 'hello world_1', '2024-02-29');
      logInfo(`new ChatBox(true, "hello world_1", "2024-...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "hello world_1", "2024-...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('hello world_1');
      logInfo(`new ChatBox(true, "hello world_1", "2024-...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0020
     * @tc.name      Socket_ChatBoxCtor_0020
     * @tc.desc      new ChatBox(true, "xhello world", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0020 begin`);
      const subject: ChatBox = new ChatBox(true, 'xhello world', '2024-02-29');
      logInfo(`new ChatBox(true, "xhello world", "2024-0...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "xhello world", "2024-0...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('xhello world');
      logInfo(`new ChatBox(true, "xhello world", "2024-0...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0021
     * @tc.name      Socket_ChatBoxCtor_0021
     * @tc.desc      new ChatBox(true, "   ", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0021 begin`);
      const subject: ChatBox = new ChatBox(true, '   ', '2024-02-29');
      logInfo(`new ChatBox(true, "   ", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "   ", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('   ');
      logInfo(`new ChatBox(true, "   ", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0022
     * @tc.name      Socket_ChatBoxCtor_0022
     * @tc.desc      new ChatBox(true, "  ", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0022 begin`);
      const subject: ChatBox = new ChatBox(true, '  ', '2024-02-29');
      logInfo(`new ChatBox(true, "  ", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "  ", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('  ');
      logInfo(`new ChatBox(true, "  ", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0023
     * @tc.name      Socket_ChatBoxCtor_0023
     * @tc.desc      new ChatBox(true, " _1", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0023 begin`);
      const subject: ChatBox = new ChatBox(true, ' _1', '2024-02-29');
      logInfo(`new ChatBox(true, " _1", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " _1", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' _1');
      logInfo(`new ChatBox(true, " _1", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0024
     * @tc.name      Socket_ChatBoxCtor_0024
     * @tc.desc      new ChatBox(true, "x ", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0024 begin`);
      const subject: ChatBox = new ChatBox(true, 'x ', '2024-02-29');
      logInfo(`new ChatBox(true, "x ", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "x ", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('x ');
      logInfo(`new ChatBox(true, "x ", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0025
     * @tc.name      Socket_ChatBoxCtor_0025
     * @tc.desc      new ChatBox(true, " A ", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0025 begin`);
      const subject: ChatBox = new ChatBox(true, ' A ', '2024-02-29');
      logInfo(`new ChatBox(true, " A ", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " A ", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' A ');
      logInfo(`new ChatBox(true, " A ", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0026
     * @tc.name      Socket_ChatBoxCtor_0026
     * @tc.desc      new ChatBox(true, "AA", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0026 begin`);
      const subject: ChatBox = new ChatBox(true, 'AA', '2024-02-29');
      logInfo(`new ChatBox(true, "AA", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "AA", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('AA');
      logInfo(`new ChatBox(true, "AA", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0027
     * @tc.name      Socket_ChatBoxCtor_0027
     * @tc.desc      new ChatBox(true, "A_1", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0027 begin`);
      const subject: ChatBox = new ChatBox(true, 'A_1', '2024-02-29');
      logInfo(`new ChatBox(true, "A_1", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "A_1", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('A_1');
      logInfo(`new ChatBox(true, "A_1", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0028
     * @tc.name      Socket_ChatBoxCtor_0028
     * @tc.desc      new ChatBox(true, "xA", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0028 begin`);
      const subject: ChatBox = new ChatBox(true, 'xA', '2024-02-29');
      logInfo(`new ChatBox(true, "xA", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "xA", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('xA');
      logInfo(`new ChatBox(true, "xA", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0029
     * @tc.name      Socket_ChatBoxCtor_0029
     * @tc.desc      new ChatBox(true, " Sample Title 123 ", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0029 begin`);
      const subject: ChatBox = new ChatBox(true, ' Sample Title 123 ', '2024-02-29');
      logInfo(`new ChatBox(true, " Sample Title 123 ", "...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " Sample Title 123 ", "...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' Sample Title 123 ');
      logInfo(`new ChatBox(true, " Sample Title 123 ", "...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0030
     * @tc.name      Socket_ChatBoxCtor_0030
     * @tc.desc      new ChatBox(true, "Sample Title 123Sample Title 123", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0030 begin`);
      const subject: ChatBox = new ChatBox(true, 'Sample Title 123Sample Title 123', '2024-02-29');
      logInfo(`new ChatBox(true, "Sample Title 123Sample...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Sample Title 123Sample...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`new ChatBox(true, "Sample Title 123Sample...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0031
     * @tc.name      Socket_ChatBoxCtor_0031
     * @tc.desc      new ChatBox(true, "Sample Title 123_1", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0031 begin`);
      const subject: ChatBox = new ChatBox(true, 'Sample Title 123_1', '2024-02-29');
      logInfo(`new ChatBox(true, "Sample Title 123_1", "...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Sample Title 123_1", "...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Sample Title 123_1');
      logInfo(`new ChatBox(true, "Sample Title 123_1", "...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0032
     * @tc.name      Socket_ChatBoxCtor_0032
     * @tc.desc      new ChatBox(true, "xSample Title 123", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0032 begin`);
      const subject: ChatBox = new ChatBox(true, 'xSample Title 123', '2024-02-29');
      logInfo(`new ChatBox(true, "xSample Title 123", "2...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "xSample Title 123", "2...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('xSample Title 123');
      logInfo(`new ChatBox(true, "xSample Title 123", "2...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0033
     * @tc.name      Socket_ChatBoxCtor_0033
     * @tc.desc      new ChatBox(true, " ?? ", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0033 begin`);
      const subject: ChatBox = new ChatBox(true, ' \u4e2d\u6587 ', '2024-02-29');
      logInfo(`new ChatBox(true, " ?? ", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " ?? ", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' \u4e2d\u6587 ');
      logInfo(`new ChatBox(true, " ?? ", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0034
     * @tc.name      Socket_ChatBoxCtor_0034
     * @tc.desc      new ChatBox(true, "????", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0034 begin`);
      const subject: ChatBox = new ChatBox(true, '\u4e2d\u6587\u4e2d\u6587', '2024-02-29');
      logInfo(`new ChatBox(true, "????", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "????", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`new ChatBox(true, "????", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0035
     * @tc.name      Socket_ChatBoxCtor_0035
     * @tc.desc      new ChatBox(true, "??_1", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0035 begin`);
      const subject: ChatBox = new ChatBox(true, '\u4e2d\u6587_1', '2024-02-29');
      logInfo(`new ChatBox(true, "??_1", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "??_1", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('\u4e2d\u6587_1');
      logInfo(`new ChatBox(true, "??_1", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0036
     * @tc.name      Socket_ChatBoxCtor_0036
     * @tc.desc      new ChatBox(true, "x??", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0036 begin`);
      const subject: ChatBox = new ChatBox(true, 'x\u4e2d\u6587', '2024-02-29');
      logInfo(`new ChatBox(true, "x??", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "x??", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('x\u4e2d\u6587');
      logInfo(`new ChatBox(true, "x??", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0037
     * @tc.name      Socket_ChatBoxCtor_0037
     * @tc.desc      new ChatBox(true, " a ", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0037 begin`);
      const subject: ChatBox = new ChatBox(true, ' a ', '2024-02-29');
      logInfo(`new ChatBox(true, " a ", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " a ", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' a ');
      logInfo(`new ChatBox(true, " a ", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0038
     * @tc.name      Socket_ChatBoxCtor_0038
     * @tc.desc      new ChatBox(true, "aa", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0038 begin`);
      const subject: ChatBox = new ChatBox(true, 'aa', '2024-02-29');
      logInfo(`new ChatBox(true, "aa", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "aa", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('aa');
      logInfo(`new ChatBox(true, "aa", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0039
     * @tc.name      Socket_ChatBoxCtor_0039
     * @tc.desc      new ChatBox(true, "a_1", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0039 begin`);
      const subject: ChatBox = new ChatBox(true, 'a_1', '2024-02-29');
      logInfo(`new ChatBox(true, "a_1", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "a_1", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('a_1');
      logInfo(`new ChatBox(true, "a_1", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0040
     * @tc.name      Socket_ChatBoxCtor_0040
     * @tc.desc      new ChatBox(true, "xa", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0040 begin`);
      const subject: ChatBox = new ChatBox(true, 'xa', '2024-02-29');
      logInfo(`new ChatBox(true, "xa", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "xa", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('xa');
      logInfo(`new ChatBox(true, "xa", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0041
     * @tc.name      Socket_ChatBoxCtor_0041
     * @tc.desc      new ChatBox(true, " abc ", "2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0041 begin`);
      const subject: ChatBox = new ChatBox(true, ' abc ', '2024-02-29');
      logInfo(`new ChatBox(true, " abc ", "2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " abc ", "2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' abc ');
      logInfo(`new ChatBox(true, " abc ", "2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0042
     * @tc.name      Socket_ChatBoxCtor_0042
     * @tc.desc      new ChatBox(true, "Hello", "2023-12-31") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0042 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', '2023-12-31');
      logInfo(`new ChatBox(true, "Hello", "2023-12-31"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "2023-12-31"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "2023-12-31"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2023-12-31');
      logInfo(`${BUNDLE}ChatBoxCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0043
     * @tc.name      Socket_ChatBoxCtor_0043
     * @tc.desc      new ChatBox(true, "Hello", "") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0043 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', '');
      logInfo(`new ChatBox(true, "Hello", ""): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", ""): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", ""): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('');
      logInfo(`${BUNDLE}ChatBoxCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0044
     * @tc.name      Socket_ChatBoxCtor_0044
     * @tc.desc      new ChatBox(true, "Hello", "invalid") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0044 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'invalid');
      logInfo(`new ChatBox(true, "Hello", "invalid"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "invalid"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "invalid"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('invalid');
      logInfo(`${BUNDLE}ChatBoxCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0045
     * @tc.name      Socket_ChatBoxCtor_0045
     * @tc.desc      new ChatBox(true, "Hello", "a") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0045 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'a');
      logInfo(`new ChatBox(true, "Hello", "a"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "a"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "a"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('a');
      logInfo(`${BUNDLE}ChatBoxCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0046
     * @tc.name      Socket_ChatBoxCtor_0046
     * @tc.desc      new ChatBox(true, "Hello", "abc") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0046 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'abc');
      logInfo(`new ChatBox(true, "Hello", "abc"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "abc"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "abc"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('abc');
      logInfo(`${BUNDLE}ChatBoxCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0047
     * @tc.name      Socket_ChatBoxCtor_0047
     * @tc.desc      new ChatBox(true, "Hello", "Hello World") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0047 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'Hello World');
      logInfo(`new ChatBox(true, "Hello", "Hello World"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "Hello World"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "Hello World"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('Hello World');
      logInfo(`${BUNDLE}ChatBoxCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0048
     * @tc.name      Socket_ChatBoxCtor_0048
     * @tc.desc      new ChatBox(true, "Hello", " ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0048 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', ' ');
      logInfo(`new ChatBox(true, "Hello", " "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", " "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", " "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' ');
      logInfo(`${BUNDLE}ChatBoxCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0049
     * @tc.name      Socket_ChatBoxCtor_0049
     * @tc.desc      new ChatBox(true, "Hello", "123") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0049 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', '123');
      logInfo(`new ChatBox(true, "Hello", "123"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "123"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "123"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('123');
      logInfo(`${BUNDLE}ChatBoxCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0050
     * @tc.name      Socket_ChatBoxCtor_0050
     * @tc.desc      new ChatBox(true, "Hello", " 2024-02-29 ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0050 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', ' 2024-02-29 ');
      logInfo(`new ChatBox(true, "Hello", " 2024-02-29 "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", " 2024-02-29 "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", " 2024-02-29 "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' 2024-02-29 ');
      logInfo(`${BUNDLE}ChatBoxCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0051
     * @tc.name      Socket_ChatBoxCtor_0051
     * @tc.desc      new ChatBox(true, "Hello", "2024-02-292024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0051 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', '2024-02-292024-02-29');
      logInfo(`new ChatBox(true, "Hello", "2024-02-29202...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "2024-02-29202...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "2024-02-29202...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-292024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0052
     * @tc.name      Socket_ChatBoxCtor_0052
     * @tc.desc      new ChatBox(true, "Hello", "2024-02-29_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0052 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', '2024-02-29_1');
      logInfo(`new ChatBox(true, "Hello", "2024-02-29_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "2024-02-29_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "2024-02-29_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2024-02-29_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0053
     * @tc.name      Socket_ChatBoxCtor_0053
     * @tc.desc      new ChatBox(true, "Hello", "x2024-02-29") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0053 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'x2024-02-29');
      logInfo(`new ChatBox(true, "Hello", "x2024-02-29"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "x2024-02-29"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "x2024-02-29"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('x2024-02-29');
      logInfo(`${BUNDLE}ChatBoxCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0054
     * @tc.name      Socket_ChatBoxCtor_0054
     * @tc.desc      new ChatBox(true, "Hello", " 2023-12-31 ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0054 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', ' 2023-12-31 ');
      logInfo(`new ChatBox(true, "Hello", " 2023-12-31 "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", " 2023-12-31 "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", " 2023-12-31 "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' 2023-12-31 ');
      logInfo(`${BUNDLE}ChatBoxCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0055
     * @tc.name      Socket_ChatBoxCtor_0055
     * @tc.desc      new ChatBox(true, "Hello", "2023-12-312023-12-31") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0055 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', '2023-12-312023-12-31');
      logInfo(`new ChatBox(true, "Hello", "2023-12-31202...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "2023-12-31202...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "2023-12-31202...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2023-12-312023-12-31');
      logInfo(`${BUNDLE}ChatBoxCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0056
     * @tc.name      Socket_ChatBoxCtor_0056
     * @tc.desc      new ChatBox(true, "Hello", "2023-12-31_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0056 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', '2023-12-31_1');
      logInfo(`new ChatBox(true, "Hello", "2023-12-31_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "2023-12-31_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "2023-12-31_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('2023-12-31_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0057
     * @tc.name      Socket_ChatBoxCtor_0057
     * @tc.desc      new ChatBox(true, "Hello", "x2023-12-31") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0057 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'x2023-12-31');
      logInfo(`new ChatBox(true, "Hello", "x2023-12-31"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "x2023-12-31"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "x2023-12-31"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('x2023-12-31');
      logInfo(`${BUNDLE}ChatBoxCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0058
     * @tc.name      Socket_ChatBoxCtor_0058
     * @tc.desc      new ChatBox(true, "Hello", " invalid ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0058 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', ' invalid ');
      logInfo(`new ChatBox(true, "Hello", " invalid "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", " invalid "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", " invalid "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' invalid ');
      logInfo(`${BUNDLE}ChatBoxCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0059
     * @tc.name      Socket_ChatBoxCtor_0059
     * @tc.desc      new ChatBox(true, "Hello", "invalidinvalid") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0059 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'invalidinvalid');
      logInfo(`new ChatBox(true, "Hello", "invalidinvalid"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "invalidinvalid"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "invalidinvalid"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('invalidinvalid');
      logInfo(`${BUNDLE}ChatBoxCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0060
     * @tc.name      Socket_ChatBoxCtor_0060
     * @tc.desc      new ChatBox(true, "Hello", "invalid_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0060 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'invalid_1');
      logInfo(`new ChatBox(true, "Hello", "invalid_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "invalid_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "invalid_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('invalid_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0061
     * @tc.name      Socket_ChatBoxCtor_0061
     * @tc.desc      new ChatBox(true, "Hello", "xinvalid") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0061 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'xinvalid');
      logInfo(`new ChatBox(true, "Hello", "xinvalid"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "xinvalid"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "xinvalid"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xinvalid');
      logInfo(`${BUNDLE}ChatBoxCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0062
     * @tc.name      Socket_ChatBoxCtor_0062
     * @tc.desc      new ChatBox(true, "Hello", " a ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0062 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', ' a ');
      logInfo(`new ChatBox(true, "Hello", " a "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", " a "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", " a "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' a ');
      logInfo(`${BUNDLE}ChatBoxCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0063
     * @tc.name      Socket_ChatBoxCtor_0063
     * @tc.desc      new ChatBox(true, "Hello", "aa") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0063 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'aa');
      logInfo(`new ChatBox(true, "Hello", "aa"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "aa"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "aa"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('aa');
      logInfo(`${BUNDLE}ChatBoxCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0064
     * @tc.name      Socket_ChatBoxCtor_0064
     * @tc.desc      new ChatBox(true, "Hello", "a_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0064 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'a_1');
      logInfo(`new ChatBox(true, "Hello", "a_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "a_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "a_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('a_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0065
     * @tc.name      Socket_ChatBoxCtor_0065
     * @tc.desc      new ChatBox(true, "Hello", "xa") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0065 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'xa');
      logInfo(`new ChatBox(true, "Hello", "xa"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "xa"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "xa"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xa');
      logInfo(`${BUNDLE}ChatBoxCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0066
     * @tc.name      Socket_ChatBoxCtor_0066
     * @tc.desc      new ChatBox(true, "Hello", " abc ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0066 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', ' abc ');
      logInfo(`new ChatBox(true, "Hello", " abc "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", " abc "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", " abc "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' abc ');
      logInfo(`${BUNDLE}ChatBoxCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0067
     * @tc.name      Socket_ChatBoxCtor_0067
     * @tc.desc      new ChatBox(true, "Hello", "abcabc") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0067 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'abcabc');
      logInfo(`new ChatBox(true, "Hello", "abcabc"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "abcabc"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "abcabc"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('abcabc');
      logInfo(`${BUNDLE}ChatBoxCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0068
     * @tc.name      Socket_ChatBoxCtor_0068
     * @tc.desc      new ChatBox(true, "Hello", "abc_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0068 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'abc_1');
      logInfo(`new ChatBox(true, "Hello", "abc_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "abc_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "abc_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('abc_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0069
     * @tc.name      Socket_ChatBoxCtor_0069
     * @tc.desc      new ChatBox(true, "Hello", "xabc") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0069 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'xabc');
      logInfo(`new ChatBox(true, "Hello", "xabc"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "xabc"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "xabc"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xabc');
      logInfo(`${BUNDLE}ChatBoxCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0070
     * @tc.name      Socket_ChatBoxCtor_0070
     * @tc.desc      new ChatBox(true, "Hello", " Hello World ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0070 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', ' Hello World ');
      logInfo(`new ChatBox(true, "Hello", " Hello World "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", " Hello World "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", " Hello World "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}ChatBoxCtor_0070 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0071
     * @tc.name      Socket_ChatBoxCtor_0071
     * @tc.desc      new ChatBox(true, "Hello", "Hello WorldHello World") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0071 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'Hello WorldHello World');
      logInfo(`new ChatBox(true, "Hello", "Hello WorldHe...: subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "Hello WorldHe...: subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "Hello WorldHe...: subject.date=${subject.date}`);
      expect(subject.date).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}ChatBoxCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0072
     * @tc.name      Socket_ChatBoxCtor_0072
     * @tc.desc      new ChatBox(true, "Hello", "Hello World_1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0072 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'Hello World_1');
      logInfo(`new ChatBox(true, "Hello", "Hello World_1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "Hello World_1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "Hello World_1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}ChatBoxCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0073
     * @tc.name      Socket_ChatBoxCtor_0073
     * @tc.desc      new ChatBox(true, "Hello", "xHello World") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0073 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'xHello World');
      logInfo(`new ChatBox(true, "Hello", "xHello World"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "xHello World"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "xHello World"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('xHello World');
      logInfo(`${BUNDLE}ChatBoxCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0074
     * @tc.name      Socket_ChatBoxCtor_0074
     * @tc.desc      new ChatBox(true, "Hello", "   ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0074 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', '   ');
      logInfo(`new ChatBox(true, "Hello", "   "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "   "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "   "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('   ');
      logInfo(`${BUNDLE}ChatBoxCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0075
     * @tc.name      Socket_ChatBoxCtor_0075
     * @tc.desc      new ChatBox(true, "Hello", "  ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0075 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', '  ');
      logInfo(`new ChatBox(true, "Hello", "  "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "  "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "  "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('  ');
      logInfo(`${BUNDLE}ChatBoxCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0076
     * @tc.name      Socket_ChatBoxCtor_0076
     * @tc.desc      new ChatBox(true, "Hello", " _1") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0076 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', ' _1');
      logInfo(`new ChatBox(true, "Hello", " _1"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", " _1"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", " _1"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(' _1');
      logInfo(`${BUNDLE}ChatBoxCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0077
     * @tc.name      Socket_ChatBoxCtor_0077
     * @tc.desc      new ChatBox(true, "Hello", "x ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0077 begin`);
      const subject: ChatBox = new ChatBox(true, 'Hello', 'x ');
      logInfo(`new ChatBox(true, "Hello", "x "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "Hello", "x "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('Hello');
      logInfo(`new ChatBox(true, "Hello", "x "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('x ');
      logInfo(`${BUNDLE}ChatBoxCtor_0077 end`);
    });
  });
}
