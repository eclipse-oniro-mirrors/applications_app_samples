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

/** Logic checks for ChatSource.addData (73 cases). */
export default function chatSourceAddDataTest(): void {
  describe('ChatSourceAddDataTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0001
     * @tc.name      Socket_ChatSourceAddData_0001
     * @tc.desc      ChatSource.addData(index=0, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Socket_ChatSourceAddData_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0001 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(0, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=0, data=ChatBox(true, "Hell...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=0, data=ChatBox(true, "Hell...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=0, data=ChatBox(true, "Hell...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0001 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0002
     * @tc.name      Socket_ChatSourceAddData_0002
     * @tc.desc      ChatSource.addData(index=0, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Socket_ChatSourceAddData_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0002 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(0, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=0, data=ChatBox(false, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=0, data=ChatBox(false, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=0, data=ChatBox(false, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0002 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0003
     * @tc.name      Socket_ChatSourceAddData_0003
     * @tc.desc      ChatSource.addData(index=0, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0003 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(0, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=0, data=ChatBox(true, "hell...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=0, data=ChatBox(true, "hell...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=0, data=ChatBox(true, "hell...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0003 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0004
     * @tc.name      Socket_ChatSourceAddData_0004
     * @tc.desc      ChatSource.addData(index=0, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0004 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(0, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=0, data=ChatBox(true, "", "...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=0, data=ChatBox(true, "", "...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=0, data=ChatBox(true, "", "...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0004 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0005
     * @tc.name      Socket_ChatSourceAddData_0005
     * @tc.desc      ChatSource.addData(index=1, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0005 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(1, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=1, data=ChatBox(true, "Hell...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=1, data=ChatBox(true, "Hell...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=1, data=ChatBox(true, "Hell...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0005 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0006
     * @tc.name      Socket_ChatSourceAddData_0006
     * @tc.desc      ChatSource.addData(index=1, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0006 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(1, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=1, data=ChatBox(false, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=1, data=ChatBox(false, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=1, data=ChatBox(false, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0006 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0007
     * @tc.name      Socket_ChatSourceAddData_0007
     * @tc.desc      ChatSource.addData(index=1, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0007 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(1, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=1, data=ChatBox(true, "hell...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=1, data=ChatBox(true, "hell...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=1, data=ChatBox(true, "hell...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0007 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0008
     * @tc.name      Socket_ChatSourceAddData_0008
     * @tc.desc      ChatSource.addData(index=1, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0008 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(1, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=1, data=ChatBox(true, "", "...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=1, data=ChatBox(true, "", "...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=1, data=ChatBox(true, "", "...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0008 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0009
     * @tc.name      Socket_ChatSourceAddData_0009
     * @tc.desc      ChatSource.addData(index=-1, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ChatSourceAddData_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0009 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-1, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=-1, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=-1, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=-1, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0009 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0010
     * @tc.name      Socket_ChatSourceAddData_0010
     * @tc.desc      ChatSource.addData(index=-1, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ChatSourceAddData_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0010 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-1, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=-1, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=-1, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=-1, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0010 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0011
     * @tc.name      Socket_ChatSourceAddData_0011
     * @tc.desc      ChatSource.addData(index=-1, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ChatSourceAddData_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0011 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-1, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=-1, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=-1, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=-1, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0011 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0012
     * @tc.name      Socket_ChatSourceAddData_0012
     * @tc.desc      ChatSource.addData(index=-1, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ChatSourceAddData_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0012 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-1, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=-1, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=-1, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=-1, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0012 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0013
     * @tc.name      Socket_ChatSourceAddData_0013
     * @tc.desc      ChatSource.addData(index=2, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ChatSourceAddData_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0013 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(2, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=2, data=ChatBox(true, "Hell...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=2, data=ChatBox(true, "Hell...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=2, data=ChatBox(true, "Hell...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0013 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0014
     * @tc.name      Socket_ChatSourceAddData_0014
     * @tc.desc      ChatSource.addData(index=2, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ChatSourceAddData_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0014 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(2, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=2, data=ChatBox(false, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=2, data=ChatBox(false, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=2, data=ChatBox(false, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0014 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0015
     * @tc.name      Socket_ChatSourceAddData_0015
     * @tc.desc      ChatSource.addData(index=2, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ChatSourceAddData_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0015 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(2, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=2, data=ChatBox(true, "hell...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=2, data=ChatBox(true, "hell...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=2, data=ChatBox(true, "hell...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0015 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0016
     * @tc.name      Socket_ChatSourceAddData_0016
     * @tc.desc      ChatSource.addData(index=2, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ChatSourceAddData_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0016 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(2, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=2, data=ChatBox(true, "", "...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=2, data=ChatBox(true, "", "...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=2, data=ChatBox(true, "", "...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0016 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0017
     * @tc.name      Socket_ChatSourceAddData_0017
     * @tc.desc      ChatSource.addData(index=5, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0017 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(5, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=5, data=ChatBox(true, "Hell...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=5, data=ChatBox(true, "Hell...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=5, data=ChatBox(true, "Hell...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0017 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0018
     * @tc.name      Socket_ChatSourceAddData_0018
     * @tc.desc      ChatSource.addData(index=5, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0018 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(5, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=5, data=ChatBox(false, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=5, data=ChatBox(false, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=5, data=ChatBox(false, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0018 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0019
     * @tc.name      Socket_ChatSourceAddData_0019
     * @tc.desc      ChatSource.addData(index=5, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0019 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(5, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=5, data=ChatBox(true, "hell...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=5, data=ChatBox(true, "hell...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=5, data=ChatBox(true, "hell...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0019 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0020
     * @tc.name      Socket_ChatSourceAddData_0020
     * @tc.desc      ChatSource.addData(index=5, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0020 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(5, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=5, data=ChatBox(true, "", "...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=5, data=ChatBox(true, "", "...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=5, data=ChatBox(true, "", "...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0020 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0021
     * @tc.name      Socket_ChatSourceAddData_0021
     * @tc.desc      ChatSource.addData(index=10, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0021 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(10, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=10, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=10, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=10, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0021 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0022
     * @tc.name      Socket_ChatSourceAddData_0022
     * @tc.desc      ChatSource.addData(index=10, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0022 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(10, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=10, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=10, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=10, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0022 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0023
     * @tc.name      Socket_ChatSourceAddData_0023
     * @tc.desc      ChatSource.addData(index=10, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0023 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(10, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=10, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=10, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=10, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0023 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0024
     * @tc.name      Socket_ChatSourceAddData_0024
     * @tc.desc      ChatSource.addData(index=10, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0024 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(10, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=10, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=10, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=10, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0024 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0025
     * @tc.name      Socket_ChatSourceAddData_0025
     * @tc.desc      ChatSource.addData(index=3, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0025 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(3, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=3, data=ChatBox(true, "Hell...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=3, data=ChatBox(true, "Hell...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=3, data=ChatBox(true, "Hell...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0025 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0026
     * @tc.name      Socket_ChatSourceAddData_0026
     * @tc.desc      ChatSource.addData(index=3, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0026 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(3, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=3, data=ChatBox(false, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=3, data=ChatBox(false, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=3, data=ChatBox(false, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0026 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0027
     * @tc.name      Socket_ChatSourceAddData_0027
     * @tc.desc      ChatSource.addData(index=3, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0027 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(3, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=3, data=ChatBox(true, "hell...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=3, data=ChatBox(true, "hell...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=3, data=ChatBox(true, "hell...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0027 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0028
     * @tc.name      Socket_ChatSourceAddData_0028
     * @tc.desc      ChatSource.addData(index=3, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0028 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(3, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=3, data=ChatBox(true, "", "...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=3, data=ChatBox(true, "", "...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=3, data=ChatBox(true, "", "...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0028 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0029
     * @tc.name      Socket_ChatSourceAddData_0029
     * @tc.desc      ChatSource.addData(index=100, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0029 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(100, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=100, data=ChatBox(true, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=100, data=ChatBox(true, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=100, data=ChatBox(true, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0029 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0030
     * @tc.name      Socket_ChatSourceAddData_0030
     * @tc.desc      ChatSource.addData(index=100, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0030 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(100, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=100, data=ChatBox(false, "H...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=100, data=ChatBox(false, "H...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=100, data=ChatBox(false, "H...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0030 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0031
     * @tc.name      Socket_ChatSourceAddData_0031
     * @tc.desc      ChatSource.addData(index=100, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0031 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(100, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=100, data=ChatBox(true, "he...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=100, data=ChatBox(true, "he...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=100, data=ChatBox(true, "he...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0031 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0032
     * @tc.name      Socket_ChatSourceAddData_0032
     * @tc.desc      ChatSource.addData(index=100, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0032 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(100, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=100, data=ChatBox(true, "",...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=100, data=ChatBox(true, "",...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=100, data=ChatBox(true, "",...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0032 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0033
     * @tc.name      Socket_ChatSourceAddData_0033
     * @tc.desc      ChatSource.addData(index=15, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0033 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(15, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=15, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=15, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=15, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0033 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0034
     * @tc.name      Socket_ChatSourceAddData_0034
     * @tc.desc      ChatSource.addData(index=15, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0034 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(15, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=15, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=15, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=15, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0034 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0035
     * @tc.name      Socket_ChatSourceAddData_0035
     * @tc.desc      ChatSource.addData(index=15, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0035 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(15, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=15, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=15, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=15, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0035 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0036
     * @tc.name      Socket_ChatSourceAddData_0036
     * @tc.desc      ChatSource.addData(index=15, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0036 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(15, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=15, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=15, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=15, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0036 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0037
     * @tc.name      Socket_ChatSourceAddData_0037
     * @tc.desc      ChatSource.addData(index=20, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0037 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(20, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=20, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=20, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=20, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0037 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0038
     * @tc.name      Socket_ChatSourceAddData_0038
     * @tc.desc      ChatSource.addData(index=20, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0038 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(20, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=20, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=20, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=20, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0038 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0039
     * @tc.name      Socket_ChatSourceAddData_0039
     * @tc.desc      ChatSource.addData(index=20, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0039 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(20, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=20, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=20, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=20, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0039 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0040
     * @tc.name      Socket_ChatSourceAddData_0040
     * @tc.desc      ChatSource.addData(index=20, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0040 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(20, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=20, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=20, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=20, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0040 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0041
     * @tc.name      Socket_ChatSourceAddData_0041
     * @tc.desc      ChatSource.addData(index=25, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0041 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(25, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=25, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=25, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=25, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0041 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0042
     * @tc.name      Socket_ChatSourceAddData_0042
     * @tc.desc      ChatSource.addData(index=25, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0042 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(25, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=25, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=25, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=25, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0042 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0043
     * @tc.name      Socket_ChatSourceAddData_0043
     * @tc.desc      ChatSource.addData(index=25, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0043 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(25, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=25, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=25, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=25, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0043 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0044
     * @tc.name      Socket_ChatSourceAddData_0044
     * @tc.desc      ChatSource.addData(index=25, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0044 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(25, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=25, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=25, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=25, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0044 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0045
     * @tc.name      Socket_ChatSourceAddData_0045
     * @tc.desc      ChatSource.addData(index=30, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0045 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(30, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=30, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=30, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=30, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0045 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0046
     * @tc.name      Socket_ChatSourceAddData_0046
     * @tc.desc      ChatSource.addData(index=30, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0046 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(30, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=30, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=30, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=30, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0046 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0047
     * @tc.name      Socket_ChatSourceAddData_0047
     * @tc.desc      ChatSource.addData(index=30, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0047 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(30, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=30, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=30, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=30, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0047 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0048
     * @tc.name      Socket_ChatSourceAddData_0048
     * @tc.desc      ChatSource.addData(index=30, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0048 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(30, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=30, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=30, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=30, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0048 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0049
     * @tc.name      Socket_ChatSourceAddData_0049
     * @tc.desc      ChatSource.addData(index=35, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0049 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(35, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=35, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=35, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=35, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0049 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0050
     * @tc.name      Socket_ChatSourceAddData_0050
     * @tc.desc      ChatSource.addData(index=35, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0050 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(35, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=35, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=35, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=35, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0050 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0051
     * @tc.name      Socket_ChatSourceAddData_0051
     * @tc.desc      ChatSource.addData(index=35, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0051 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(35, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=35, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=35, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=35, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0051 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0052
     * @tc.name      Socket_ChatSourceAddData_0052
     * @tc.desc      ChatSource.addData(index=35, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0052 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(35, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=35, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=35, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=35, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0052 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0053
     * @tc.name      Socket_ChatSourceAddData_0053
     * @tc.desc      ChatSource.addData(index=40, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0053 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(40, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=40, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=40, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=40, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0053 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0054
     * @tc.name      Socket_ChatSourceAddData_0054
     * @tc.desc      ChatSource.addData(index=40, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0054 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(40, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=40, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=40, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=40, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0054 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0055
     * @tc.name      Socket_ChatSourceAddData_0055
     * @tc.desc      ChatSource.addData(index=40, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0055 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(40, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=40, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=40, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=40, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0055 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0056
     * @tc.name      Socket_ChatSourceAddData_0056
     * @tc.desc      ChatSource.addData(index=40, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0056 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(40, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=40, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=40, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=40, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0056 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0057
     * @tc.name      Socket_ChatSourceAddData_0057
     * @tc.desc      ChatSource.addData(index=45, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0057 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(45, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=45, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=45, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=45, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0057 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0058
     * @tc.name      Socket_ChatSourceAddData_0058
     * @tc.desc      ChatSource.addData(index=45, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0058 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(45, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=45, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=45, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=45, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0058 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0059
     * @tc.name      Socket_ChatSourceAddData_0059
     * @tc.desc      ChatSource.addData(index=45, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0059 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(45, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=45, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=45, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=45, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0059 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0060
     * @tc.name      Socket_ChatSourceAddData_0060
     * @tc.desc      ChatSource.addData(index=45, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0060 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(45, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=45, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=45, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=45, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0060 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0061
     * @tc.name      Socket_ChatSourceAddData_0061
     * @tc.desc      ChatSource.addData(index=50, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0061 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(50, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=50, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=50, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=50, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0061 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0062
     * @tc.name      Socket_ChatSourceAddData_0062
     * @tc.desc      ChatSource.addData(index=50, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0062 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(50, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=50, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=50, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=50, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0062 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0063
     * @tc.name      Socket_ChatSourceAddData_0063
     * @tc.desc      ChatSource.addData(index=50, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0063 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(50, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=50, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=50, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=50, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0063 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0064
     * @tc.name      Socket_ChatSourceAddData_0064
     * @tc.desc      ChatSource.addData(index=50, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0064 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(50, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=50, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=50, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=50, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0064 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0065
     * @tc.name      Socket_ChatSourceAddData_0065
     * @tc.desc      ChatSource.addData(index=55, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0065 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(55, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=55, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=55, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=55, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0065 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0066
     * @tc.name      Socket_ChatSourceAddData_0066
     * @tc.desc      ChatSource.addData(index=55, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0066 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(55, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=55, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=55, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=55, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0066 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0067
     * @tc.name      Socket_ChatSourceAddData_0067
     * @tc.desc      ChatSource.addData(index=55, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0067 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(55, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=55, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=55, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=55, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0067 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0068
     * @tc.name      Socket_ChatSourceAddData_0068
     * @tc.desc      ChatSource.addData(index=55, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0068 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(55, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=55, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=55, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=55, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0068 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0069
     * @tc.name      Socket_ChatSourceAddData_0069
     * @tc.desc      ChatSource.addData(index=60, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0069 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(60, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=60, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=60, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=60, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0069 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0070
     * @tc.name      Socket_ChatSourceAddData_0070
     * @tc.desc      ChatSource.addData(index=60, data=ChatBox(false, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0070 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(60, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData(index=60, data=ChatBox(false, "He...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=60, data=ChatBox(false, "He...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData(index=60, data=ChatBox(false, "He...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0070 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0071
     * @tc.name      Socket_ChatSourceAddData_0071
     * @tc.desc      ChatSource.addData(index=60, data=ChatBox(true, "hello world", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0071 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(60, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData(index=60, data=ChatBox(true, "hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=60, data=ChatBox(true, "hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=60, data=ChatBox(true, "hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceAddData_0071 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0072
     * @tc.name      Socket_ChatSourceAddData_0072
     * @tc.desc      ChatSource.addData(index=60, data=ChatBox(true, "", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0072 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(60, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData(index=60, data=ChatBox(true, "", ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=60, data=ChatBox(true, "", ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=60, data=ChatBox(true, "", ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceAddData_0072 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_ADD_DATA_0073
     * @tc.name      Socket_ChatSourceAddData_0073
     * @tc.desc      ChatSource.addData(index=65, data=ChatBox(true, "Hello", "2024-02-29")) yields len1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceAddData_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceAddData_0073 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(65, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData(index=65, data=ChatBox(true, "Hel...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData(index=65, data=ChatBox(true, "Hel...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData(index=65, data=ChatBox(true, "Hel...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceAddData_0073 end`);
    });
  });
}
