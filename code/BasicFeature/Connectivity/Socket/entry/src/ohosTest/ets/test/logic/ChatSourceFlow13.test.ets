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

/** Logic checks for ChatSource flow (51 cases). */
export default function chatSourceFlow13Test(): void {
  describe('ChatSourceFlow13Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0635
     * @tc.name      Socket_ChatSourceFlow_0635
     * @tc.desc      ChatSource call flow totalCount > getData > addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0635', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0635 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(88.8);
      logInfo(`step2 getData(88.8): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(140, new ChatBox(true, 'hello world', '2024-02-29'));
      const step4: ChatBox = subject.getData(16.46);
      logInfo(`step4 getData(16.46): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`totalCount>getData>addData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>getData>addData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>addData>getData final: subject.chatsArray[0].mes...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0635 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0636
     * @tc.name      Socket_ChatSourceFlow_0636
     * @tc.desc      ChatSource call flow pushData > totalCount > addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0636', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0636 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.addData(62.8, new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: ChatBox = subject.getData(57);
      logInfo(`step4 getData(57): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`pushData>totalCount>addData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>totalCount>addData>getData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>totalCount>addData>getData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0636 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0637
     * @tc.name      Socket_ChatSourceFlow_0637
     * @tc.desc      ChatSource call flow getData > getData > totalCount > pushData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0637', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0637 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(49.58);
      logInfo(`step1 getData(49.58): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(-69);
      logInfo(`step2 getData(-69): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>getData>totalCount>pushData>pushD...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>getData>totalCount>pushData>pushD...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>getData>totalCount>pushData>pushD...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0637 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0638
     * @tc.name      Socket_ChatSourceFlow_0638
     * @tc.desc      ChatSource call flow totalCount > addData > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0638', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0638 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(95, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(120);
      logInfo(`step3 getData(120): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: ChatBox = subject.getData(82);
      logInfo(`step5 getData(82): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`totalCount>addData>getData>totalCount>get...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>addData>getData>totalCount>get...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>getData>totalCount>get...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0638 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0639
     * @tc.name      Socket_ChatSourceFlow_0639
     * @tc.desc      ChatSource call flow pushData > totalCount > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0639', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0639 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`pushData>totalCount>totalCount>totalCount...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`pushData>totalCount>totalCount>totalCount...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>totalCount>totalCount>totalCount...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0639 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0640
     * @tc.name      Socket_ChatSourceFlow_0640
     * @tc.desc      ChatSource call flow pushData > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0640', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0640 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: ChatBox = subject.getData(101);
      logInfo(`step3 getData(101): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`pushData>totalCount>getData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`pushData>totalCount>getData>totalCount final: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`pushData>totalCount>getData>totalCount final: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0640 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0641
     * @tc.name      Socket_ChatSourceFlow_0641
     * @tc.desc      ChatSource call flow totalCount > getData > pushData > totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0641', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0641 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(92);
      logInfo(`step2 getData(92): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.addData(86.25, new ChatBox(true, '', '2024-02-29'));
      logInfo(`totalCount>getData>pushData>totalCount>ad...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>getData>pushData>totalCount>ad...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>getData>pushData>totalCount>ad...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0641 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0642
     * @tc.name      Socket_ChatSourceFlow_0642
     * @tc.desc      ChatSource call flow getData > addData > addData > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0642', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0642 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(29.17);
      logInfo(`step1 getData(29.17): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(90, new ChatBox(true, '', '2024-02-29'));
      subject.addData(49, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step5: ChatBox = subject.getData(-40);
      logInfo(`step5 getData(-40): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`getData>addData>addData>pushData>getData ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`getData>addData>addData>pushData>getData ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData>addData>pushData>getData ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0642 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0643
     * @tc.name      Socket_ChatSourceFlow_0643
     * @tc.desc      ChatSource call flow totalCount > pushData > totalCount > totalCount > totalCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0643', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0643 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`totalCount>pushData>totalCount>totalCount...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>pushData>totalCount>totalCount...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData>totalCount>totalCount...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0643 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0644
     * @tc.name      Socket_ChatSourceFlow_0644
     * @tc.desc      ChatSource call flow totalCount > pushData > getData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0644', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0644 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(0);
      logInfo(`step3 getData(0): step3.isSend=${step3.isSend}`);
      expect(step3.isSend).assertFalse();
      logInfo(`step3 getData(0): step3.message=${step3.message}`);
      expect(step3.message).assertEqual('Hello');
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`totalCount>pushData>getData>pushData>tota...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>pushData>getData>pushData>tota...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>pushData>getData>pushData>tota...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0644 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0645
     * @tc.name      Socket_ChatSourceFlow_0645
     * @tc.desc      ChatSource call flow totalCount > pushData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0645', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0645 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`totalCount>pushData>totalCount>pushData f...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>pushData>totalCount>pushData f...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>pushData>totalCount>pushData f...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0645 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0646
     * @tc.name      Socket_ChatSourceFlow_0646
     * @tc.desc      ChatSource call flow totalCount > pushData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0646', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0646 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`totalCount>pushData>totalCount>pushData f...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>pushData>totalCount>pushData f...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData>totalCount>pushData f...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0646 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0647
     * @tc.name      Socket_ChatSourceFlow_0647
     * @tc.desc      ChatSource call flow totalCount > getData > addData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0647', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0647 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(196);
      logInfo(`step2 getData(196): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(65, new ChatBox(true, '', '2024-02-29'));
      const step4: ChatBox = subject.getData(80);
      logInfo(`step4 getData(80): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(31.65);
      logInfo(`step5 getData(31.65): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`totalCount>getData>addData>getData>getDat...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>getData>addData>getData>getDat...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>addData>getData>getDat...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0647 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0648
     * @tc.name      Socket_ChatSourceFlow_0648
     * @tc.desc      ChatSource call flow addData > pushData > pushData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0648', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0648 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(40, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`addData>pushData>pushData>totalCount>tota...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`addData>pushData>pushData>totalCount>tota...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>pushData>pushData>totalCount>tota...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0648 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0649
     * @tc.name      Socket_ChatSourceFlow_0649
     * @tc.desc      ChatSource call flow pushData > getData > getData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0649', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0649 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: ChatBox = subject.getData(122);
      logInfo(`step2 getData(122): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(80.48);
      logInfo(`step3 getData(80.48): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(24.07);
      logInfo(`step4 getData(24.07): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.addData(20, new ChatBox(true, '', '2024-02-29'));
      logInfo(`pushData>getData>getData>getData>addData ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>getData>getData>getData>addData ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>getData>getData>getData>addData ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0649 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0650
     * @tc.name      Socket_ChatSourceFlow_0650
     * @tc.desc      ChatSource call flow pushData > addData > addData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0650', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0650 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(135, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(157, new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: ChatBox = subject.getData(105);
      logInfo(`step5 getData(105): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`pushData>addData>addData>totalCount>getDa...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`pushData>addData>addData>totalCount>getDa...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>addData>addData>totalCount>getDa...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0650 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0651
     * @tc.name      Socket_ChatSourceFlow_0651
     * @tc.desc      ChatSource call flow totalCount > addData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0651', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0651 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(20, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(-38);
      logInfo(`step3 getData(-38): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(-39, new ChatBox(true, '', '2024-02-29'));
      logInfo(`totalCount>addData>getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>addData>getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>getData>addData final: subject.chatsArray[0].mes...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0651 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0652
     * @tc.name      Socket_ChatSourceFlow_0652
     * @tc.desc      ChatSource call flow addData > pushData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0652', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0652 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(157, new ChatBox(false, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`addData>pushData>totalCount>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>pushData>totalCount>totalCount final: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData>pushData>totalCount>totalCount final: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0652 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0653
     * @tc.name      Socket_ChatSourceFlow_0653
     * @tc.desc      ChatSource call flow pushData > addData > addData > addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0653', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0653 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(100, new ChatBox(true, '', '2024-02-29'));
      subject.addData(86.11, new ChatBox(true, '', '2024-02-29'));
      subject.addData(73, new ChatBox(true, 'Hello', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`pushData>addData>addData>addData>totalCou...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(4);
      logInfo(`pushData>addData>addData>addData>totalCou...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>addData>addData>addData>totalCou...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0653 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0654
     * @tc.name      Socket_ChatSourceFlow_0654
     * @tc.desc      ChatSource call flow addData > totalCount > addData > totalCount > totalCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0654', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0654 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(125, new ChatBox(true, 'hello world', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.addData(98.06, new ChatBox(true, '', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`addData>totalCount>addData>totalCount>tot...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>totalCount>addData>totalCount>tot...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>totalCount>addData>totalCount>tot...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0654 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0655
     * @tc.name      Socket_ChatSourceFlow_0655
     * @tc.desc      ChatSource call flow getData > pushData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0655', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0655 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(50.45);
      logInfo(`step1 getData(50.45): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(-56);
      logInfo(`step3 getData(-56): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`getData>pushData>getData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>pushData>getData>totalCount final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData>getData>totalCount final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0655 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0656
     * @tc.name      Socket_ChatSourceFlow_0656
     * @tc.desc      ChatSource call flow addData > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0656', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0656 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(20, new ChatBox(true, '', '2024-02-29'));
      const step2: ChatBox = subject.getData(33.67);
      logInfo(`step2 getData(33.67): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`addData>getData>totalCount>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>getData>totalCount>totalCount final: subject.chatsArray[0].i...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>getData>totalCount>totalCount final: subject.chatsArray[0]....${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0656 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0657
     * @tc.name      Socket_ChatSourceFlow_0657
     * @tc.desc      ChatSource call flow addData > getData > addData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0657', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0657 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-35, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(54.08);
      logInfo(`step2 getData(54.08): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(35.17, new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: ChatBox = subject.getData(14);
      logInfo(`step5 getData(14): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`addData>getData>addData>totalCount>getDat...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>getData>addData>totalCount>getDat...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>getData>addData>totalCount>getDat...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0657 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0658
     * @tc.name      Socket_ChatSourceFlow_0658
     * @tc.desc      ChatSource call flow pushData > addData > pushData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0658', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0658 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.addData(86.11, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step4: ChatBox = subject.getData(57.1);
      logInfo(`step4 getData(57.1): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(-88);
      logInfo(`step5 getData(-88): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`pushData>addData>pushData>getData>getData...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`pushData>addData>pushData>getData>getData...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>addData>pushData>getData>getData...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0658 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0659
     * @tc.name      Socket_ChatSourceFlow_0659
     * @tc.desc      ChatSource call flow totalCount > totalCount > getData > addData > totalCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0659', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0659 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: ChatBox = subject.getData(90);
      logInfo(`step3 getData(90): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(40, new ChatBox(true, 'hello world', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`totalCount>totalCount>getData>addData>tot...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>totalCount>getData>addData>tot...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>totalCount>getData>addData>tot...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0659 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0660
     * @tc.name      Socket_ChatSourceFlow_0660
     * @tc.desc      ChatSource call flow addData > getData > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0660', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0660 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-35, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(49.74);
      logInfo(`step2 getData(49.74): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: ChatBox = subject.getData(65);
      logInfo(`step4 getData(65): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(23.63);
      logInfo(`step5 getData(23.63): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`addData>getData>totalCount>getData>getDat...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>getData>totalCount>getData>getDat...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>getData>totalCount>getData>getDat...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0660 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0661
     * @tc.name      Socket_ChatSourceFlow_0661
     * @tc.desc      ChatSource call flow getData > totalCount > totalCount > getData > totalCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0661', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0661 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-82);
      logInfo(`step1 getData(-82): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: ChatBox = subject.getData(24.07);
      logInfo(`step4 getData(24.07): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_0661 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0662
     * @tc.name      Socket_ChatSourceFlow_0662
     * @tc.desc      ChatSource call flow totalCount > addData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0662', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0662 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(90, new ChatBox(true, '', '2024-02-29'));
      const step3: ChatBox = subject.getData(57.1);
      logInfo(`step3 getData(57.1): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(198);
      logInfo(`step4 getData(198): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(-77);
      logInfo(`step5 getData(-77): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`totalCount>addData>getData>getData>getDat...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>addData>getData>getData>getDat...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>getData>getData>getDat...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0662 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0663
     * @tc.name      Socket_ChatSourceFlow_0663
     * @tc.desc      ChatSource call flow totalCount > addData > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0663', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0663 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(1, new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step4: ChatBox = subject.getData(87);
      logInfo(`step4 getData(87): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`totalCount>addData>pushData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>addData>pushData>getData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>pushData>getData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0663 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0664
     * @tc.name      Socket_ChatSourceFlow_0664
     * @tc.desc      ChatSource call flow getData > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0664', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0664 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(48);
      logInfo(`step1 getData(48): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(-41);
      logInfo(`step2 getData(-41): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_0664 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0665
     * @tc.name      Socket_ChatSourceFlow_0665
     * @tc.desc      ChatSource call flow pushData > getData > addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0665', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0665 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: ChatBox = subject.getData(197);
      logInfo(`step2 getData(197): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(74, new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: ChatBox = subject.getData(72);
      logInfo(`step4 getData(72): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`pushData>getData>addData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>getData>addData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>getData>addData>getData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0665 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0666
     * @tc.name      Socket_ChatSourceFlow_0666
     * @tc.desc      ChatSource call flow totalCount > getData > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0666', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0666 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(-53);
      logInfo(`step2 getData(-53): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(78);
      logInfo(`step3 getData(78): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: ChatBox = subject.getData(-41);
      logInfo(`step5 getData(-41): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_0666 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0667
     * @tc.name      Socket_ChatSourceFlow_0667
     * @tc.desc      ChatSource call flow totalCount > getData > getData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0667', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0667 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(189);
      logInfo(`step2 getData(189): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(61.92);
      logInfo(`step3 getData(61.92): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`totalCount>getData>getData>pushData>total...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>getData>getData>pushData>total...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>getData>pushData>total...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0667 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0668
     * @tc.name      Socket_ChatSourceFlow_0668
     * @tc.desc      ChatSource call flow totalCount > addData > totalCount > totalCount > totalCount keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0668', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0668 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(140, new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`totalCount>addData>totalCount>totalCount>...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>addData>totalCount>totalCount>...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>addData>totalCount>totalCount>...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0668 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0669
     * @tc.name      Socket_ChatSourceFlow_0669
     * @tc.desc      ChatSource call flow totalCount > totalCount > getData > totalCount > getData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0669', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0669 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: ChatBox = subject.getData(37.67);
      logInfo(`step3 getData(37.67): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: ChatBox = subject.getData(70.16);
      logInfo(`step5 getData(70.16): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_0669 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0670
     * @tc.name      Socket_ChatSourceFlow_0670
     * @tc.desc      ChatSource call flow pushData > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0670', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0670 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: ChatBox = subject.getData(49.74);
      logInfo(`step2 getData(49.74): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: ChatBox = subject.getData(52.83);
      logInfo(`step4 getData(52.83): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`pushData>getData>totalCount>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`pushData>getData>totalCount>getData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>getData>totalCount>getData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0670 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0671
     * @tc.name      Socket_ChatSourceFlow_0671
     * @tc.desc      ChatSource call flow totalCount > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0671', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0671 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`totalCount>pushData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>pushData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData>totalCount final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0671 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0672
     * @tc.name      Socket_ChatSourceFlow_0672
     * @tc.desc      ChatSource call flow pushData > getData > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0672', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0672 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: ChatBox = subject.getData(122);
      logInfo(`step2 getData(122): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: ChatBox = subject.getData(-76);
      logInfo(`step4 getData(-76): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`pushData>getData>totalCount>getData>total...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`pushData>getData>totalCount>getData>total...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>getData>totalCount>getData>total...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0672 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0673
     * @tc.name      Socket_ChatSourceFlow_0673
     * @tc.desc      ChatSource call flow totalCount > pushData > totalCount > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0673', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0673 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step5: ChatBox = subject.getData(112);
      logInfo(`step5 getData(112): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`totalCount>pushData>totalCount>pushData>g...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>pushData>totalCount>pushData>g...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData>totalCount>pushData>g...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0673 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0674
     * @tc.name      Socket_ChatSourceFlow_0674
     * @tc.desc      ChatSource call flow pushData > getData > addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0674', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0674 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: ChatBox = subject.getData(194);
      logInfo(`step2 getData(194): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(74.9, new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`pushData>getData>addData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>getData>addData>totalCount final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>getData>addData>totalCount final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0674 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0675
     * @tc.name      Socket_ChatSourceFlow_0675
     * @tc.desc      ChatSource call flow totalCount > totalCount > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0675', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0675 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: ChatBox = subject.getData(14);
      logInfo(`step3 getData(14): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(-22);
      logInfo(`step4 getData(-22): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(185);
      logInfo(`step5 getData(185): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_0675 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0676
     * @tc.name      Socket_ChatSourceFlow_0676
     * @tc.desc      ChatSource call flow totalCount > pushData > totalCount > pushData > pushData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0676', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0676 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`totalCount>pushData>totalCount>pushData>p...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`totalCount>pushData>totalCount>pushData>p...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData>totalCount>pushData>p...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0676 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0677
     * @tc.name      Socket_ChatSourceFlow_0677
     * @tc.desc      ChatSource call flow getData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0677', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0677 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(93);
      logInfo(`step1 getData(93): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`getData>totalCount>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>totalCount>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0677 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0678
     * @tc.name      Socket_ChatSourceFlow_0678
     * @tc.desc      ChatSource call flow totalCount > addData > pushData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0678', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0678 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(200, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: ChatBox = subject.getData(-55);
      logInfo(`step4 getData(-55): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.addData(-39, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`totalCount>addData>pushData>getData>addDa...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`totalCount>addData>pushData>getData>addDa...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>pushData>getData>addDa...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0678 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0679
     * @tc.name      Socket_ChatSourceFlow_0679
     * @tc.desc      ChatSource call flow getData > getData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0679', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0679 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-81);
      logInfo(`step1 getData(-81): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(28.96);
      logInfo(`step2 getData(28.96): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(94);
      logInfo(`step3 getData(94): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(-72, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`getData>getData>getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>getData>getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`getData>getData>getData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0679 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0680
     * @tc.name      Socket_ChatSourceFlow_0680
     * @tc.desc      ChatSource call flow totalCount > totalCount > getData > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0680', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0680 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: ChatBox = subject.getData(93);
      logInfo(`step3 getData(93): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(107);
      logInfo(`step4 getData(107): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`totalCount>totalCount>getData>getData>pus...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>totalCount>getData>getData>pus...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>totalCount>getData>getData>pus...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0680 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0681
     * @tc.name      Socket_ChatSourceFlow_0681
     * @tc.desc      ChatSource call flow totalCount > addData > totalCount > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0681', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0681 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(3, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: ChatBox = subject.getData(65);
      logInfo(`step4 getData(65): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.addData(5, new ChatBox(true, '', '2024-02-29'));
      logInfo(`totalCount>addData>totalCount>getData>add...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>addData>totalCount>getData>add...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>totalCount>getData>add...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0681 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0682
     * @tc.name      Socket_ChatSourceFlow_0682
     * @tc.desc      ChatSource call flow getData > totalCount > totalCount > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0682', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0682 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-81);
      logInfo(`step1 getData(-81): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: ChatBox = subject.getData(58.65);
      logInfo(`step4 getData(58.65): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`getData>totalCount>totalCount>getData>pus...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>totalCount>totalCount>getData>pus...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`getData>totalCount>totalCount>getData>pus...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0682 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0683
     * @tc.name      Socket_ChatSourceFlow_0683
     * @tc.desc      ChatSource call flow getData > getData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0683', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0683 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(43.2);
      logInfo(`step1 getData(43.2): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(91.81);
      logInfo(`step2 getData(91.81): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`getData>getData>pushData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>getData>pushData>totalCount final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>getData>pushData>totalCount final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0683 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0684
     * @tc.name      Socket_ChatSourceFlow_0684
     * @tc.desc      ChatSource call flow getData > totalCount > getData > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0684', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0684 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(168);
      logInfo(`step1 getData(168): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: ChatBox = subject.getData(9.41);
      logInfo(`step3 getData(9.41): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(158);
      logInfo(`step4 getData(158): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`getData>totalCount>getData>getData>pushDa...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>totalCount>getData>getData>pushDa...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>getData>getData>pushDa...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0684 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0685
     * @tc.name      Socket_ChatSourceFlow_0685
     * @tc.desc      ChatSource call flow getData > getData > addData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0685', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0685 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(55.59);
      logInfo(`step1 getData(55.59): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(68);
      logInfo(`step2 getData(68): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(26.26, new ChatBox(true, '', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`getData>getData>addData>totalCount>pushDa...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>getData>addData>totalCount>pushDa...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>getData>addData>totalCount>pushDa...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0685 end`);
    });
  });
}
