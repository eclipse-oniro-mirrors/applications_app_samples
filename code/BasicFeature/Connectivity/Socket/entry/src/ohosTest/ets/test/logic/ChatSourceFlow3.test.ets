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

/** Logic checks for ChatSource flow (55 cases). */
export default function chatSourceFlow3Test(): void {
  describe('ChatSourceFlow3Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0113
     * @tc.name      Socket_ChatSourceFlow_0113
     * @tc.desc      ChatSource call flow totalCount > addData > addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0113 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(36.31, new ChatBox(false, 'Hello', '2024-02-29'));
      subject.addData(-16, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`totalCount>addData>addData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`totalCount>addData>addData>pushData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>addData>pushData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0114
     * @tc.name      Socket_ChatSourceFlow_0114
     * @tc.desc      ChatSource call flow getData > addData > pushData > addData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0114 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(21.39);
      logInfo(`step1 getData(21.39): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(141, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(-30, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(113, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>addData>pushData>addData>addData ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(4);
      logInfo(`getData>addData>pushData>addData>addData ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData>pushData>addData>addData ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0115
     * @tc.name      Socket_ChatSourceFlow_0115
     * @tc.desc      ChatSource call flow getData > addData > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0115 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(74);
      logInfo(`step1 getData(74): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(36.31, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: ChatBox = subject.getData(53.37);
      logInfo(`step4 getData(53.37): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`getData>addData>pushData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>addData>pushData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData>pushData>getData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0116
     * @tc.name      Socket_ChatSourceFlow_0116
     * @tc.desc      ChatSource call flow addData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0116 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(4, new ChatBox(false, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`addData>pushData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>pushData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData>pushData>totalCount final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0117
     * @tc.name      Socket_ChatSourceFlow_0117
     * @tc.desc      ChatSource call flow totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0117 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: ChatBox = subject.getData(24.37);
      logInfo(`step3 getData(24.37): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0118
     * @tc.name      Socket_ChatSourceFlow_0118
     * @tc.desc      ChatSource call flow pushData > totalCount > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0118 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: ChatBox = subject.getData(-26);
      logInfo(`step3 getData(-26): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`pushData>totalCount>getData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>totalCount>getData>pushData final: subject.chatsArray[0].is...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`pushData>totalCount>getData>pushData final: subject.chatsArray[0].m...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0119
     * @tc.name      Socket_ChatSourceFlow_0119
     * @tc.desc      ChatSource call flow getData > totalCount > pushData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0119 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(9);
      logInfo(`step1 getData(9): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.addData(140, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`getData>totalCount>pushData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>totalCount>pushData>addData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>pushData>addData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0120
     * @tc.name      Socket_ChatSourceFlow_0120
     * @tc.desc      ChatSource call flow addData > getData > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0120 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(65, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(-19);
      logInfo(`step2 getData(-19): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(104);
      logInfo(`step3 getData(104): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: ChatBox = subject.getData(153);
      logInfo(`step5 getData(153): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`addData>getData>getData>totalCount>getDat...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>getData>getData>totalCount>getDat...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>getData>getData>totalCount>getDat...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0121
     * @tc.name      Socket_ChatSourceFlow_0121
     * @tc.desc      ChatSource call flow getData > pushData > totalCount > addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0121 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(15);
      logInfo(`step1 getData(15): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.addData(180, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`getData>pushData>totalCount>addData>pushD...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`getData>pushData>totalCount>addData>pushD...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData>totalCount>addData>pushD...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0122
     * @tc.name      Socket_ChatSourceFlow_0122
     * @tc.desc      ChatSource call flow getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0122 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(25.48);
      logInfo(`step1 getData(25.48): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(0, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0123
     * @tc.name      Socket_ChatSourceFlow_0123
     * @tc.desc      ChatSource call flow addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0123 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(4, new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0124
     * @tc.name      Socket_ChatSourceFlow_0124
     * @tc.desc      ChatSource call flow getData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0124 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(49.58);
      logInfo(`step1 getData(49.58): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`getData>totalCount>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>totalCount>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`getData>totalCount>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0125
     * @tc.name      Socket_ChatSourceFlow_0125
     * @tc.desc      ChatSource call flow pushData > getData > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0125 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(-65);
      logInfo(`step2 getData(-65): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(114);
      logInfo(`step3 getData(114): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`pushData>getData>getData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>getData>getData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`pushData>getData>getData>pushData final: subject.chatsArray[0].mess...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0126
     * @tc.name      Socket_ChatSourceFlow_0126
     * @tc.desc      ChatSource call flow pushData > totalCount > getData > pushData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0126 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: ChatBox = subject.getData(135);
      logInfo(`step3 getData(135): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(160, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`pushData>totalCount>getData>pushData>addD...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`pushData>totalCount>getData>pushData>addD...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>totalCount>getData>pushData>addD...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0127
     * @tc.name      Socket_ChatSourceFlow_0127
     * @tc.desc      ChatSource call flow getData > addData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0127 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-99);
      logInfo(`step1 getData(-99): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(180, new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`getData>addData>totalCount>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>addData>totalCount>pushData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData>totalCount>pushData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0128
     * @tc.name      Socket_ChatSourceFlow_0128
     * @tc.desc      ChatSource call flow totalCount > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0128 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`totalCount>pushData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>pushData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData>totalCount final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0129
     * @tc.name      Socket_ChatSourceFlow_0129
     * @tc.desc      ChatSource call flow totalCount > pushData > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0129 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: ChatBox = subject.getData(-78);
      logInfo(`step3 getData(-78): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`totalCount>pushData>getData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>pushData>getData>pushData final: subject.chatsArray[0].is...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData>getData>pushData final: subject.chatsArray[0].m...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0130
     * @tc.name      Socket_ChatSourceFlow_0130
     * @tc.desc      ChatSource call flow pushData > totalCount > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0130 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step4: ChatBox = subject.getData(38);
      logInfo(`step4 getData(38): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`pushData>totalCount>pushData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>totalCount>pushData>getData final: subject.chatsArray[0].is...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>totalCount>pushData>getData final: subject.chatsArray[0].m...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0131
     * @tc.name      Socket_ChatSourceFlow_0131
     * @tc.desc      ChatSource call flow addData > getData > addData > pushData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0131 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(157, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(-79);
      logInfo(`step2 getData(-79): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(86.11, new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData>getData>addData>pushData>pushData...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(4);
      logInfo(`addData>getData>addData>pushData>pushData...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>getData>addData>pushData>pushData...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0132
     * @tc.name      Socket_ChatSourceFlow_0132
     * @tc.desc      ChatSource call flow getData > totalCount > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0132 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(88);
      logInfo(`step1 getData(88): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: ChatBox = subject.getData(-88);
      logInfo(`step4 getData(-88): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(6.34);
      logInfo(`step5 getData(6.34): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0133
     * @tc.name      Socket_ChatSourceFlow_0133
     * @tc.desc      ChatSource call flow totalCount > getData > pushData > totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0133 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(191);
      logInfo(`step2 getData(191): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.addData(144, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`totalCount>getData>pushData>totalCount>ad...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>getData>pushData>totalCount>ad...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>pushData>totalCount>ad...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0134
     * @tc.name      Socket_ChatSourceFlow_0134
     * @tc.desc      ChatSource call flow pushData > totalCount > totalCount > addData > totalCount keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0134 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.addData(113, new ChatBox(true, 'Hello', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`pushData>totalCount>totalCount>addData>to...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>totalCount>totalCount>addData>to...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`pushData>totalCount>totalCount>addData>to...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0135
     * @tc.name      Socket_ChatSourceFlow_0135
     * @tc.desc      ChatSource call flow pushData > getData > getData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0135 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(33.58);
      logInfo(`step2 getData(33.58): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(48);
      logInfo(`step3 getData(48): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(76);
      logInfo(`step4 getData(76): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.addData(98.06, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`pushData>getData>getData>getData>addData ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>getData>getData>getData>addData ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`pushData>getData>getData>getData>addData ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0136
     * @tc.name      Socket_ChatSourceFlow_0136
     * @tc.desc      ChatSource call flow totalCount > totalCount > totalCount > addData > addData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0136 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.addData(105, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(45, new ChatBox(true, '', '2024-02-29'));
      logInfo(`totalCount>totalCount>totalCount>addData>...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>totalCount>totalCount>addData>...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>totalCount>totalCount>addData>...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0137
     * @tc.name      Socket_ChatSourceFlow_0137
     * @tc.desc      ChatSource call flow totalCount > pushData > addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0137 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(-39, new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`totalCount>pushData>addData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`totalCount>pushData>addData>pushData final: subject.chatsArray[0].is...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData>addData>pushData final: subject.chatsArray[0].m...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0138
     * @tc.name      Socket_ChatSourceFlow_0138
     * @tc.desc      ChatSource call flow addData > totalCount > addData > totalCount > totalCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0138 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-72, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.addData(0, new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`addData>totalCount>addData>totalCount>tot...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>totalCount>addData>totalCount>tot...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData>totalCount>addData>totalCount>tot...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0139
     * @tc.name      Socket_ChatSourceFlow_0139
     * @tc.desc      ChatSource call flow addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0139 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(175, new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`addData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData>totalCount final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0140
     * @tc.name      Socket_ChatSourceFlow_0140
     * @tc.desc      ChatSource call flow getData > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0140 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(160);
      logInfo(`step1 getData(160): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: ChatBox = subject.getData(27);
      logInfo(`step3 getData(27): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(100);
      logInfo(`step4 getData(100): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0141
     * @tc.name      Socket_ChatSourceFlow_0141
     * @tc.desc      ChatSource call flow pushData > getData > addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0141 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(63.37);
      logInfo(`step2 getData(63.37): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(3.03, new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`pushData>getData>addData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>getData>addData>totalCount final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>getData>addData>totalCount final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0142
     * @tc.name      Socket_ChatSourceFlow_0142
     * @tc.desc      ChatSource call flow getData > getData > pushData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0142 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-5);
      logInfo(`step1 getData(-5): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(5.55);
      logInfo(`step2 getData(5.55): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.addData(5, new ChatBox(true, '', '2024-02-29'));
      logInfo(`getData>getData>pushData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>getData>pushData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>getData>pushData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0143
     * @tc.name      Socket_ChatSourceFlow_0143
     * @tc.desc      ChatSource call flow totalCount > totalCount > addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0143 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.addData(50.1, new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`totalCount>totalCount>addData>totalCount ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>totalCount>addData>totalCount ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>totalCount>addData>totalCount ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0144
     * @tc.name      Socket_ChatSourceFlow_0144
     * @tc.desc      ChatSource call flow pushData > totalCount > pushData > pushData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0144 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`pushData>totalCount>pushData>pushData>pus...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(4);
      logInfo(`pushData>totalCount>pushData>pushData>pus...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>totalCount>pushData>pushData>pus...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0145
     * @tc.name      Socket_ChatSourceFlow_0145
     * @tc.desc      ChatSource call flow totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0145 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(160, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`totalCount>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0146
     * @tc.name      Socket_ChatSourceFlow_0146
     * @tc.desc      ChatSource call flow pushData > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0146 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(74.87);
      logInfo(`step3 getData(74.87): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`pushData>pushData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>pushData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>pushData>getData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0147
     * @tc.name      Socket_ChatSourceFlow_0147
     * @tc.desc      ChatSource call flow getData > totalCount > addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0147 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(13.12);
      logInfo(`step1 getData(13.12): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.addData(160, new ChatBox(true, 'hello world', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`getData>totalCount>addData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>totalCount>addData>totalCount final: subject.chatsArray[0].i...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>addData>totalCount final: subject.chatsArray[0]....${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0148
     * @tc.name      Socket_ChatSourceFlow_0148
     * @tc.desc      ChatSource call flow totalCount > totalCount > addData > addData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0148 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.addData(199, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(81, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(148, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`totalCount>totalCount>addData>addData>add...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`totalCount>totalCount>addData>addData>add...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>totalCount>addData>addData>add...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0149
     * @tc.name      Socket_ChatSourceFlow_0149
     * @tc.desc      ChatSource call flow getData > addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0149 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(12);
      logInfo(`step1 getData(12): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(-72, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`getData>addData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>addData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData>totalCount final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0150
     * @tc.name      Socket_ChatSourceFlow_0150
     * @tc.desc      ChatSource call flow pushData > totalCount > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0150 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: ChatBox = subject.getData(-94);
      logInfo(`step3 getData(-94): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(4, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`pushData>totalCount>getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>totalCount>getData>addData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>totalCount>getData>addData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0151
     * @tc.name      Socket_ChatSourceFlow_0151
     * @tc.desc      ChatSource call flow totalCount > addData > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0151 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(67, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(-85);
      logInfo(`step3 getData(-85): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`totalCount>addData>getData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>addData>getData>pushData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>getData>pushData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0152
     * @tc.name      Socket_ChatSourceFlow_0152
     * @tc.desc      ChatSource call flow totalCount > pushData > pushData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0152 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: ChatBox = subject.getData(82);
      logInfo(`step4 getData(82): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`totalCount>pushData>pushData>getData>tota...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>pushData>pushData>getData>tota...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData>pushData>getData>tota...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0153
     * @tc.name      Socket_ChatSourceFlow_0153
     * @tc.desc      ChatSource call flow getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0153 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(41);
      logInfo(`step1 getData(41): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`getData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`getData>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0154
     * @tc.name      Socket_ChatSourceFlow_0154
     * @tc.desc      ChatSource call flow totalCount > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0154 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`totalCount>pushData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>pushData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>pushData>totalCount final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0155
     * @tc.name      Socket_ChatSourceFlow_0155
     * @tc.desc      ChatSource call flow totalCount > addData > pushData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0155 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(15, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step4: ChatBox = subject.getData(69.16);
      logInfo(`step4 getData(69.16): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`totalCount>addData>pushData>getData>total...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>addData>pushData>getData>total...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>pushData>getData>total...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0156
     * @tc.name      Socket_ChatSourceFlow_0156
     * @tc.desc      ChatSource call flow addData > addData > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0156 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(155, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(0, new ChatBox(true, '', '2024-02-29'));
      const step3: ChatBox = subject.getData(94.4);
      logInfo(`step3 getData(94.4): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(37.67);
      logInfo(`step4 getData(37.67): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`addData>addData>getData>getData>totalCoun...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>addData>getData>getData>totalCoun...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>addData>getData>getData>totalCoun...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0157
     * @tc.name      Socket_ChatSourceFlow_0157
     * @tc.desc      ChatSource call flow totalCount > addData > totalCount > addData > totalCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0157 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(140, new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.addData(-16, new ChatBox(true, 'hello world', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`totalCount>addData>totalCount>addData>tot...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>addData>totalCount>addData>tot...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>totalCount>addData>tot...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0158
     * @tc.name      Socket_ChatSourceFlow_0158
     * @tc.desc      ChatSource call flow getData > pushData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0158 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-26);
      logInfo(`step1 getData(-26): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(-15);
      logInfo(`step3 getData(-15): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(26.26, new ChatBox(true, '', '2024-02-29'));
      logInfo(`getData>pushData>getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>pushData>getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData>getData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0159
     * @tc.name      Socket_ChatSourceFlow_0159
     * @tc.desc      ChatSource call flow pushData > pushData > addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0159 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(107, new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: ChatBox = subject.getData(85.81);
      logInfo(`step4 getData(85.81): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`pushData>pushData>addData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`pushData>pushData>addData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>pushData>addData>getData final: subject.chatsArray[0].mess...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0160
     * @tc.name      Socket_ChatSourceFlow_0160
     * @tc.desc      ChatSource call flow totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0160 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0161
     * @tc.name      Socket_ChatSourceFlow_0161
     * @tc.desc      ChatSource call flow pushData > getData > pushData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0161 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: ChatBox = subject.getData(24);
      logInfo(`step2 getData(24): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`pushData>getData>pushData>totalCount>tota...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>getData>pushData>totalCount>tota...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>getData>pushData>totalCount>tota...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0162
     * @tc.name      Socket_ChatSourceFlow_0162
     * @tc.desc      ChatSource call flow addData > pushData > pushData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0162 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(40, new ChatBox(false, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: ChatBox = subject.getData(36.2);
      logInfo(`step4 getData(36.2): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(16);
      logInfo(`step5 getData(16): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`addData>pushData>pushData>getData>getData...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`addData>pushData>pushData>getData>getData...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData>pushData>pushData>getData>getData...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0163
     * @tc.name      Socket_ChatSourceFlow_0163
     * @tc.desc      ChatSource call flow getData > addData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0163 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(90);
      logInfo(`step1 getData(90): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(50, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`getData>addData>totalCount>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>addData>totalCount>pushData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData>totalCount>pushData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0164
     * @tc.name      Socket_ChatSourceFlow_0164
     * @tc.desc      ChatSource call flow addData > pushData > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0164 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(135, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: ChatBox = subject.getData(31);
      logInfo(`step4 getData(31): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(-94);
      logInfo(`step5 getData(-94): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`addData>pushData>totalCount>getData>getDa...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>pushData>totalCount>getData>getDa...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>pushData>totalCount>getData>getDa...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0165
     * @tc.name      Socket_ChatSourceFlow_0165
     * @tc.desc      ChatSource call flow pushData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0165 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: ChatBox = subject.getData(20.07);
      logInfo(`step2 getData(20.07): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(120, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`pushData>getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>getData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0166
     * @tc.name      Socket_ChatSourceFlow_0166
     * @tc.desc      ChatSource call flow getData > addData > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0166 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(37.67);
      logInfo(`step1 getData(37.67): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(11, new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: ChatBox = subject.getData(137);
      logInfo(`step4 getData(137): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`getData>addData>totalCount>getData>totalC...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>addData>totalCount>getData>totalC...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`getData>addData>totalCount>getData>totalC...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0167
     * @tc.name      Socket_ChatSourceFlow_0167
     * @tc.desc      ChatSource call flow getData > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0167 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(181);
      logInfo(`step1 getData(181): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: ChatBox = subject.getData(49.31);
      logInfo(`step3 getData(49.31): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`getData>pushData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>pushData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData>getData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0167 end`);
    });
  });
}
