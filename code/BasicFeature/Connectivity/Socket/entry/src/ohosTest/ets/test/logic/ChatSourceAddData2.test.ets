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
import { ChatSource } from '../../../../main/ets/model/DataSource';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';
const BUNDLE: string = 'Socket_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ChatSource.addData (27 cases). */
export default function chatSourceAddData2Test(): void {
  describe('ChatSourceAddData2Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0074
     * @tc.name      Socket_ChatSourceAddData_0074
     * @tc.desc      ChatSource.addData(index=65, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0074 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(65, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=65, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=65, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=65, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0074 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0075
     * @tc.name      Socket_ChatSourceAddData_0075
     * @tc.desc      ChatSource.addData(index=65, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0075 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(65, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=65, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=65, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=65, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0075 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0076
     * @tc.name      Socket_ChatSourceAddData_0076
     * @tc.desc      ChatSource.addData(index=65, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0076 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(65, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=65, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=65, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=65, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0076 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0077
     * @tc.name      Socket_ChatSourceAddData_0077
     * @tc.desc      ChatSource.addData(index=70, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0077 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(70, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=70, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=70, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=70, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0077 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0078
     * @tc.name      Socket_ChatSourceAddData_0078
     * @tc.desc      ChatSource.addData(index=70, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0078 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(70, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=70, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=70, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=70, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0078 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0079
     * @tc.name      Socket_ChatSourceAddData_0079
     * @tc.desc      ChatSource.addData(index=70, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0079 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(70, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=70, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=70, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=70, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0079 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0080
     * @tc.name      Socket_ChatSourceAddData_0080
     * @tc.desc      ChatSource.addData(index=70, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0080 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(70, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=70, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=70, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=70, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0080 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0081
     * @tc.name      Socket_ChatSourceAddData_0081
     * @tc.desc      ChatSource.addData(index=75, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0081 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(75, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=75, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=75, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=75, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0081 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0082
     * @tc.name      Socket_ChatSourceAddData_0082
     * @tc.desc      ChatSource.addData(index=75, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0082 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(75, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=75, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=75, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=75, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0082 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0083
     * @tc.name      Socket_ChatSourceAddData_0083
     * @tc.desc      ChatSource.addData(index=75, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0083 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(75, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=75, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=75, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=75, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0083 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0084
     * @tc.name      Socket_ChatSourceAddData_0084
     * @tc.desc      ChatSource.addData(index=75, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0084 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(75, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=75, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=75, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=75, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0084 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0085
     * @tc.name      Socket_ChatSourceAddData_0085
     * @tc.desc      ChatSource.addData(index=80, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0085 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(80, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=80, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=80, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=80, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0085 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0086
     * @tc.name      Socket_ChatSourceAddData_0086
     * @tc.desc      ChatSource.addData(index=80, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0086 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(80, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=80, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=80, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=80, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0086 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0087
     * @tc.name      Socket_ChatSourceAddData_0087
     * @tc.desc      ChatSource.addData(index=80, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0087 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(80, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=80, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=80, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=80, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0087 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0088
     * @tc.name      Socket_ChatSourceAddData_0088
     * @tc.desc      ChatSource.addData(index=80, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0088 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(80, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=80, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=80, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=80, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0088 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0089
     * @tc.name      Socket_ChatSourceAddData_0089
     * @tc.desc      ChatSource.addData(index=85, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0089 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(85, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=85, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=85, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=85, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0089 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0090
     * @tc.name      Socket_ChatSourceAddData_0090
     * @tc.desc      ChatSource.addData(index=85, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0090 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(85, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=85, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=85, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=85, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0090 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0091
     * @tc.name      Socket_ChatSourceAddData_0091
     * @tc.desc      ChatSource.addData(index=85, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0091 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(85, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=85, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=85, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=85, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0091 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0092
     * @tc.name      Socket_ChatSourceAddData_0092
     * @tc.desc      ChatSource.addData(index=85, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0092 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(85, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=85, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=85, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=85, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0092 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0093
     * @tc.name      Socket_ChatSourceAddData_0093
     * @tc.desc      ChatSource.addData(index=90, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0093 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(90, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=90, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=90, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=90, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0093 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0094
     * @tc.name      Socket_ChatSourceAddData_0094
     * @tc.desc      ChatSource.addData(index=90, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0094 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(90, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=90, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=90, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=90, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0094 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0095
     * @tc.name      Socket_ChatSourceAddData_0095
     * @tc.desc      ChatSource.addData(index=90, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0095 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(90, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=90, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=90, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=90, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0095 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0096
     * @tc.name      Socket_ChatSourceAddData_0096
     * @tc.desc      ChatSource.addData(index=90, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0096 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(90, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=90, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=90, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=90, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0096 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0097
     * @tc.name      Socket_ChatSourceAddData_0097
     * @tc.desc      ChatSource.addData(index=95, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0097 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(95, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=95, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=95, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=95, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0097 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0098
     * @tc.name      Socket_ChatSourceAddData_0098
     * @tc.desc      ChatSource.addData(index=95, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0098 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(95, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=95, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=95, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=95, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0098 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0099
     * @tc.name      Socket_ChatSourceAddData_0099
     * @tc.desc      ChatSource.addData(index=95, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0099 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(95, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=95, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=95, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=95, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0099 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0100
     * @tc.name      Socket_ChatSourceAddData_0100
     * @tc.desc      ChatSource.addData(index=95, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0100 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(95, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=95, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=95, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=95, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0100 end`);
    });
  });
}
