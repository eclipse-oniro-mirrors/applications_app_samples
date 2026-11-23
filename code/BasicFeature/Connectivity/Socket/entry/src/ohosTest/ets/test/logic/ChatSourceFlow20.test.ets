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

/** Logic checks for ChatSource flow (63 cases). */
export default function chatSourceFlow20Test(): void {
  describe('ChatSourceFlow20Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1011
     * @tc.name      Socket_ChatSourceFlow_1011
     * @tc.desc      ChatSource call flow pushData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1011 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(-72, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`pushData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`pushData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1011 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1012
     * @tc.name      Socket_ChatSourceFlow_1012
     * @tc.desc      ChatSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1012 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_1012 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1013
     * @tc.name      Socket_ChatSourceFlow_1013
     * @tc.desc      ChatSource call flow getData > getData > addData > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1013 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(50.28);
      logInfo(`step1 getData(50.28): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(161);
      logInfo(`step2 getData(161): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(1, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step5: ChatBox = subject.getData(25);
      logInfo(`step5 getData(25): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`getData>getData>addData>pushData>getData ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>getData>addData>pushData>getData ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>getData>addData>pushData>getData ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1013 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1014
     * @tc.name      Socket_ChatSourceFlow_1014
     * @tc.desc      ChatSource call flow getData > pushData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1014 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(7.22);
      logInfo(`step1 getData(7.22): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>pushData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>pushData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1014 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1015
     * @tc.name      Socket_ChatSourceFlow_1015
     * @tc.desc      ChatSource call flow pushData > totalCount > pushData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1015 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`pushData>totalCount>pushData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`pushData>totalCount>pushData>pushData final: subject.chatsArray[0].i...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`pushData>totalCount>pushData>pushData final: subject.chatsArray[0]....${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1015 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1016
     * @tc.name      Socket_ChatSourceFlow_1016
     * @tc.desc      ChatSource call flow addData > addData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1016 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(148, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(150, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(36.31, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData>addData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`addData>addData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>addData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1016 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1017
     * @tc.name      Socket_ChatSourceFlow_1017
     * @tc.desc      ChatSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1017 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(166);
      logInfo(`step1 getData(166): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(-42);
      logInfo(`step2 getData(-42): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_1017 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1018
     * @tc.name      Socket_ChatSourceFlow_1018
     * @tc.desc      ChatSource call flow addData > addData > totalCount > addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1018 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(199, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(150, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.addData(99, new ChatBox(true, 'Hello', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`addData>addData>totalCount>addData>totalC...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`addData>addData>totalCount>addData>totalC...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>addData>totalCount>addData>totalC...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1018 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1019
     * @tc.name      Socket_ChatSourceFlow_1019
     * @tc.desc      ChatSource call flow addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1019 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(90, new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_1019 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1020
     * @tc.name      Socket_ChatSourceFlow_1020
     * @tc.desc      ChatSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1020 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_1020 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1021
     * @tc.name      Socket_ChatSourceFlow_1021
     * @tc.desc      ChatSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1021 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(70.16);
      logInfo(`step1 getData(70.16): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_1021 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1022
     * @tc.name      Socket_ChatSourceFlow_1022
     * @tc.desc      ChatSource call flow getData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1022 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(34.75);
      logInfo(`step1 getData(34.75): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>totalCount>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>totalCount>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1022 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1023
     * @tc.name      Socket_ChatSourceFlow_1023
     * @tc.desc      ChatSource call flow addData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1023 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(3.03, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`addData>totalCount>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>totalCount>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>totalCount>totalCount final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1023 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1024
     * @tc.name      Socket_ChatSourceFlow_1024
     * @tc.desc      ChatSource call flow getData > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1024 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(9.68);
      logInfo(`step1 getData(9.68): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: ChatBox = subject.getData(179);
      logInfo(`step3 getData(179): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`getData>pushData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>pushData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData>getData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1024 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1025
     * @tc.name      Socket_ChatSourceFlow_1025
     * @tc.desc      ChatSource call flow pushData > addData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1025 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.addData(170, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(40.04);
      logInfo(`step3 getData(40.04): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`pushData>addData>getData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>addData>getData>totalCount final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>addData>getData>totalCount final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_1025 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1026
     * @tc.name      Socket_ChatSourceFlow_1026
     * @tc.desc      ChatSource call flow getData > totalCount > pushData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1026 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(43.2);
      logInfo(`step1 getData(43.2): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`getData>totalCount>pushData>pushData>tota...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>totalCount>pushData>pushData>tota...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>pushData>pushData>tota...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1026 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1027
     * @tc.name      Socket_ChatSourceFlow_1027
     * @tc.desc      ChatSource call flow addData > pushData > addData > addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1027 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(36.31, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(26.26, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(61.1, new ChatBox(false, 'Hello', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`addData>pushData>addData>addData>totalCou...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(4);
      logInfo(`addData>pushData>addData>addData>totalCou...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>pushData>addData>addData>totalCou...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1027 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1028
     * @tc.name      Socket_ChatSourceFlow_1028
     * @tc.desc      ChatSource call flow getData > totalCount > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1028 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(143);
      logInfo(`step1 getData(143): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`getData>totalCount>pushData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>totalCount>pushData>totalCount final: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>pushData>totalCount final: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_1028 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1029
     * @tc.name      Socket_ChatSourceFlow_1029
     * @tc.desc      ChatSource call flow totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1029 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(34, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`totalCount>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1029 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1030
     * @tc.name      Socket_ChatSourceFlow_1030
     * @tc.desc      ChatSource call flow totalCount > addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1030 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(-90, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`totalCount>addData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>addData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>totalCount final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1030 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1031
     * @tc.name      Socket_ChatSourceFlow_1031
     * @tc.desc      ChatSource call flow pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1031 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`pushData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`pushData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>totalCount final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_1031 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1032
     * @tc.name      Socket_ChatSourceFlow_1032
     * @tc.desc      ChatSource call flow addData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1032 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(37.52, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(86.11, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1032 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1033
     * @tc.name      Socket_ChatSourceFlow_1033
     * @tc.desc      ChatSource call flow getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1033 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(73.7);
      logInfo(`step1 getData(73.7): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`getData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_1033 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1034
     * @tc.name      Socket_ChatSourceFlow_1034
     * @tc.desc      ChatSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1034 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(9);
      logInfo(`step1 getData(9): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(-4);
      logInfo(`step2 getData(-4): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_1034 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1035
     * @tc.name      Socket_ChatSourceFlow_1035
     * @tc.desc      ChatSource call flow addData > pushData > totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1035 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(49, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      subject.addData(57.67, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData>pushData>totalCount>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`addData>pushData>totalCount>addData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>pushData>totalCount>addData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1035 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1036
     * @tc.name      Socket_ChatSourceFlow_1036
     * @tc.desc      ChatSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1036 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(49.31);
      logInfo(`step2 getData(49.31): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_1036 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1037
     * @tc.name      Socket_ChatSourceFlow_1037
     * @tc.desc      ChatSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1037 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_1037 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1038
     * @tc.name      Socket_ChatSourceFlow_1038
     * @tc.desc      ChatSource call flow addData > totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1038 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(164, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.addData(-1, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData>totalCount>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>totalCount>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>totalCount>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_1038 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1039
     * @tc.name      Socket_ChatSourceFlow_1039
     * @tc.desc      ChatSource call flow addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1039 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(175, new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(8);
      logInfo(`step2 getData(8): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`addData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData>getData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1039 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1040
     * @tc.name      Socket_ChatSourceFlow_1040
     * @tc.desc      ChatSource call flow addData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1040 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(4, new ChatBox(true, '', '2024-02-29'));
      subject.addData(140, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_1040 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1041
     * @tc.name      Socket_ChatSourceFlow_1041
     * @tc.desc      ChatSource call flow getData > pushData > pushData > addData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1041 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-39);
      logInfo(`step1 getData(-39): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.addData(-15, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(85, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>pushData>pushData>addData>addData...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(4);
      logInfo(`getData>pushData>pushData>addData>addData...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData>pushData>addData>addData...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1041 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1042
     * @tc.name      Socket_ChatSourceFlow_1042
     * @tc.desc      ChatSource call flow totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1042 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(-23);
      logInfo(`step2 getData(-23): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_1042 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1043
     * @tc.name      Socket_ChatSourceFlow_1043
     * @tc.desc      ChatSource call flow getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1043 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(46);
      logInfo(`step1 getData(46): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`getData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1043 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1044
     * @tc.name      Socket_ChatSourceFlow_1044
     * @tc.desc      ChatSource call flow totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1044 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`totalCount>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1044 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1045
     * @tc.name      Socket_ChatSourceFlow_1045
     * @tc.desc      ChatSource call flow totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1045 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_1045 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1046
     * @tc.name      Socket_ChatSourceFlow_1046
     * @tc.desc      ChatSource call flow addData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1046 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(0, new ChatBox(false, 'Hello', '2024-02-29'));
      subject.addData(-88, new ChatBox(true, '', '2024-02-29'));
      logInfo(`addData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_1046 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1047
     * @tc.name      Socket_ChatSourceFlow_1047
     * @tc.desc      ChatSource call flow getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1047 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(43.2);
      logInfo(`step1 getData(43.2): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(0, new ChatBox(true, '', '2024-02-29'));
      logInfo(`getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_1047 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1048
     * @tc.name      Socket_ChatSourceFlow_1048
     * @tc.desc      ChatSource call flow addData > pushData > addData > totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1048 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(61.1, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(140, new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      subject.addData(175, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData>pushData>addData>totalCount>addDa...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(4);
      logInfo(`addData>pushData>addData>totalCount>addDa...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>pushData>addData>totalCount>addDa...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1048 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1049
     * @tc.name      Socket_ChatSourceFlow_1049
     * @tc.desc      ChatSource call flow getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1049 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-66);
      logInfo(`step1 getData(-66): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(19, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1049 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1050
     * @tc.name      Socket_ChatSourceFlow_1050
     * @tc.desc      ChatSource call flow getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1050 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-8);
      logInfo(`step1 getData(-8): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(-30, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1050 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1051
     * @tc.name      Socket_ChatSourceFlow_1051
     * @tc.desc      ChatSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1051 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(112);
      logInfo(`step2 getData(112): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_1051 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1052
     * @tc.name      Socket_ChatSourceFlow_1052
     * @tc.desc      ChatSource call flow addData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1052 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-39, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`addData>totalCount>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>totalCount>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>totalCount>totalCount final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1052 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1053
     * @tc.name      Socket_ChatSourceFlow_1053
     * @tc.desc      ChatSource call flow addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1053 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(36.31, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1053 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1054
     * @tc.name      Socket_ChatSourceFlow_1054
     * @tc.desc      ChatSource call flow getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1054 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-3);
      logInfo(`step1 getData(-3): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_1054 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1055
     * @tc.name      Socket_ChatSourceFlow_1055
     * @tc.desc      ChatSource call flow getData > pushData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1055 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-79);
      logInfo(`step1 getData(-79): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`getData>pushData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>pushData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1055 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1056
     * @tc.name      Socket_ChatSourceFlow_1056
     * @tc.desc      ChatSource call flow addData > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1056 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(61, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(49);
      logInfo(`step2 getData(49): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData>getData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>getData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>getData>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1056 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1057
     * @tc.name      Socket_ChatSourceFlow_1057
     * @tc.desc      ChatSource call flow getData > totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1057 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(50.17);
      logInfo(`step1 getData(50.17): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_1057 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1058
     * @tc.name      Socket_ChatSourceFlow_1058
     * @tc.desc      ChatSource call flow pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1058 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step2: ChatBox = subject.getData(55.59);
      logInfo(`step2 getData(55.59): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`pushData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`pushData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>getData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1058 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1059
     * @tc.name      Socket_ChatSourceFlow_1059
     * @tc.desc      ChatSource call flow totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1059 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(79);
      logInfo(`step2 getData(79): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_1059 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1060
     * @tc.name      Socket_ChatSourceFlow_1060
     * @tc.desc      ChatSource call flow pushData > addData > addData > addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1060 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(165, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(10, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(36.31, new ChatBox(false, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`pushData>addData>addData>addData>pushData...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(5);
      logInfo(`pushData>addData>addData>addData>pushData...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>addData>addData>addData>pushData...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1060 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1061
     * @tc.name      Socket_ChatSourceFlow_1061
     * @tc.desc      ChatSource call flow getData > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1061 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-89);
      logInfo(`step1 getData(-89): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: ChatBox = subject.getData(85.81);
      logInfo(`step3 getData(85.81): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`getData>pushData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>pushData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData>getData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1061 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1062
     * @tc.name      Socket_ChatSourceFlow_1062
     * @tc.desc      ChatSource call flow getData > addData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1062 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(0);
      logInfo(`step1 getData(0): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(85, new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(2);
      logInfo(`step3 getData(2): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(0, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>addData>getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>addData>getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData>getData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1062 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1063
     * @tc.name      Socket_ChatSourceFlow_1063
     * @tc.desc      ChatSource call flow getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1063 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(62);
      logInfo(`step1 getData(62): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(65.72);
      logInfo(`step2 getData(65.72): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_1063 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1064
     * @tc.name      Socket_ChatSourceFlow_1064
     * @tc.desc      ChatSource call flow addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1064 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(72, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(143);
      logInfo(`step2 getData(143): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`addData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>getData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1064 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1065
     * @tc.name      Socket_ChatSourceFlow_1065
     * @tc.desc      ChatSource call flow pushData > totalCount > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1065 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: ChatBox = subject.getData(60);
      logInfo(`step3 getData(60): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(-90, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`pushData>totalCount>getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>totalCount>getData>addData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>totalCount>getData>addData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1065 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1066
     * @tc.name      Socket_ChatSourceFlow_1066
     * @tc.desc      ChatSource call flow pushData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1066 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(80.94, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`pushData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1066 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1067
     * @tc.name      Socket_ChatSourceFlow_1067
     * @tc.desc      ChatSource call flow totalCount > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1067 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`totalCount>totalCount>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>totalCount>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>totalCount>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_1067 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1068
     * @tc.name      Socket_ChatSourceFlow_1068
     * @tc.desc      ChatSource call flow totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1068 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(160, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`totalCount>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1068 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1069
     * @tc.name      Socket_ChatSourceFlow_1069
     * @tc.desc      ChatSource call flow addData > totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1069 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(110, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: ChatBox = subject.getData(-43);
      logInfo(`step4 getData(-43): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`addData>totalCount>totalCount>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>totalCount>totalCount>getData final: subject.chatsArray[0].i...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>totalCount>totalCount>getData final: subject.chatsArray[0]....${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1069 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1070
     * @tc.name      Socket_ChatSourceFlow_1070
     * @tc.desc      ChatSource call flow addData > addData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1070 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(10, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(164, new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: ChatBox = subject.getData(99.78);
      logInfo(`step3 getData(99.78): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`addData>addData>getData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>addData>getData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>addData>getData>totalCount final: subject.chatsArray[0].mes...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_1070 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1071
     * @tc.name      Socket_ChatSourceFlow_1071
     * @tc.desc      ChatSource call flow addData > addData > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1071 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(152, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(-16, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step4: ChatBox = subject.getData(81);
      logInfo(`step4 getData(81): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`addData>addData>pushData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`addData>addData>pushData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>addData>pushData>getData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1071 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1072
     * @tc.name      Socket_ChatSourceFlow_1072
     * @tc.desc      ChatSource call flow addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1072 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(1, new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_1072 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_1073
     * @tc.name      Socket_ChatSourceFlow_1073
     * @tc.desc      ChatSource call flow totalCount > pushData > pushData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_1073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_1073 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(26.26, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`totalCount>pushData>pushData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`totalCount>pushData>pushData>addData final: subject.chatsArray[0].is...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData>pushData>addData final: subject.chatsArray[0].m...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_1073 end`);
    });
  });
}
