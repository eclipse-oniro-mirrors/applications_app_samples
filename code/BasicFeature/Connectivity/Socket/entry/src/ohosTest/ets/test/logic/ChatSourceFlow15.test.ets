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

/** Logic checks for ChatSource flow (50 cases). */
export default function chatSourceFlow15Test(): void {
  describe('ChatSourceFlow15Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0737
     * @tc.name      Socket_ChatSourceFlow_0737
     * @tc.desc      ChatSource call flow totalCount > addData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0737', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0737 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(5, new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`totalCount>addData>totalCount>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>addData>totalCount>pushData final: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>totalCount>pushData final: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0737 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0738
     * @tc.name      Socket_ChatSourceFlow_0738
     * @tc.desc      ChatSource call flow totalCount > pushData > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0738', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0738 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: ChatBox = subject.getData(16.46);
      logInfo(`step4 getData(16.46): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(57.92);
      logInfo(`step5 getData(57.92): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`totalCount>pushData>totalCount>getData>ge...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>pushData>totalCount>getData>ge...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData>totalCount>getData>ge...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0738 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0739
     * @tc.name      Socket_ChatSourceFlow_0739
     * @tc.desc      ChatSource call flow addData > totalCount > totalCount > pushData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0739', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0739 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(185, new ChatBox(true, '', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(-27, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData>totalCount>totalCount>pushData>ad...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`addData>totalCount>totalCount>pushData>ad...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData>totalCount>totalCount>pushData>ad...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0739 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0740
     * @tc.name      Socket_ChatSourceFlow_0740
     * @tc.desc      ChatSource call flow getData > getData > pushData > addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0740', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0740 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(68);
      logInfo(`step1 getData(68): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(65);
      logInfo(`step2 getData(65): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(37.52, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`getData>getData>pushData>addData>pushData...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`getData>getData>pushData>addData>pushData...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>getData>pushData>addData>pushData...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0740 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0741
     * @tc.name      Socket_ChatSourceFlow_0741
     * @tc.desc      ChatSource call flow getData > totalCount > pushData > totalCount > totalCount keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0741', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0741 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(38.23);
      logInfo(`step1 getData(38.23): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`getData>totalCount>pushData>totalCount>to...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>totalCount>pushData>totalCount>to...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`getData>totalCount>pushData>totalCount>to...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0741 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0742
     * @tc.name      Socket_ChatSourceFlow_0742
     * @tc.desc      ChatSource call flow totalCount > getData > totalCount > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0742', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0742 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(-88);
      logInfo(`step2 getData(-88): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: ChatBox = subject.getData(-99);
      logInfo(`step4 getData(-99): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`totalCount>getData>totalCount>getData>pus...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>getData>totalCount>getData>pus...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>totalCount>getData>pus...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0742 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0743
     * @tc.name      Socket_ChatSourceFlow_0743
     * @tc.desc      ChatSource call flow addData > totalCount > getData > pushData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0743', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0743 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-11, new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: ChatBox = subject.getData(66);
      logInfo(`step3 getData(66): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData>totalCount>getData>pushData>pushD...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`addData>totalCount>getData>pushData>pushD...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData>totalCount>getData>pushData>pushD...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0743 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0744
     * @tc.name      Socket_ChatSourceFlow_0744
     * @tc.desc      ChatSource call flow totalCount > getData > addData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0744', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0744 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(-50);
      logInfo(`step2 getData(-50): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(57.67, new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: ChatBox = subject.getData(-11);
      logInfo(`step5 getData(-11): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`totalCount>getData>addData>totalCount>get...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>getData>addData>totalCount>get...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>addData>totalCount>get...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0744 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0745
     * @tc.name      Socket_ChatSourceFlow_0745
     * @tc.desc      ChatSource call flow totalCount > getData > pushData > addData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0745', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0745 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(44.36);
      logInfo(`step2 getData(44.36): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      subject.addData(-1, new ChatBox(true, '', '2024-02-29'));
      subject.addData(40, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`totalCount>getData>pushData>addData>addDa...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`totalCount>getData>pushData>addData>addDa...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>pushData>addData>addDa...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0745 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0746
     * @tc.name      Socket_ChatSourceFlow_0746
     * @tc.desc      ChatSource call flow totalCount > pushData > getData > pushData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0746', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0746 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(14.95);
      logInfo(`step3 getData(14.95): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      subject.addData(120, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`totalCount>pushData>getData>pushData>addD...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`totalCount>pushData>getData>pushData>addD...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>pushData>getData>pushData>addD...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0746 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0747
     * @tc.name      Socket_ChatSourceFlow_0747
     * @tc.desc      ChatSource call flow addData > pushData > totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0747', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0747 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-11, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: ChatBox = subject.getData(55.59);
      logInfo(`step5 getData(55.59): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`addData>pushData>totalCount>totalCount>ge...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>pushData>totalCount>totalCount>ge...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>pushData>totalCount>totalCount>ge...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0747 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0748
     * @tc.name      Socket_ChatSourceFlow_0748
     * @tc.desc      ChatSource call flow totalCount > pushData > pushData > addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0748', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0748 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.addData(180, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`totalCount>pushData>pushData>addData>push...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(4);
      logInfo(`totalCount>pushData>pushData>addData>push...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>pushData>pushData>addData>push...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0748 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0749
     * @tc.name      Socket_ChatSourceFlow_0749
     * @tc.desc      ChatSource call flow pushData > getData > pushData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0749', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0749 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: ChatBox = subject.getData(-80);
      logInfo(`step2 getData(-80): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`pushData>getData>pushData>pushData>totalC...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`pushData>getData>pushData>pushData>totalC...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>getData>pushData>pushData>totalC...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0749 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0750
     * @tc.name      Socket_ChatSourceFlow_0750
     * @tc.desc      ChatSource call flow pushData > totalCount > totalCount > totalCount > getData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0750', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0750 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: ChatBox = subject.getData(119);
      logInfo(`step5 getData(119): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`pushData>totalCount>totalCount>totalCount...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`pushData>totalCount>totalCount>totalCount...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>totalCount>totalCount>totalCount...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0750 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0751
     * @tc.name      Socket_ChatSourceFlow_0751
     * @tc.desc      ChatSource call flow totalCount > totalCount > totalCount > addData > addData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0751', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0751 begin`);
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
      subject.addData(35, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(-72, new ChatBox(true, '', '2024-02-29'));
      logInfo(`totalCount>totalCount>totalCount>addData>...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>totalCount>totalCount>addData>...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>totalCount>totalCount>addData>...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0751 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0752
     * @tc.name      Socket_ChatSourceFlow_0752
     * @tc.desc      ChatSource call flow pushData > pushData > getData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0752', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0752 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(194);
      logInfo(`step3 getData(194): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`pushData>pushData>getData>totalCount>push...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`pushData>pushData>getData>totalCount>push...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>pushData>getData>totalCount>push...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0752 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0753
     * @tc.name      Socket_ChatSourceFlow_0753
     * @tc.desc      ChatSource call flow addData > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0753', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0753 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(40, new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(95);
      logInfo(`step2 getData(95): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(90.58);
      logInfo(`step3 getData(90.58): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`addData>getData>getData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>getData>getData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData>getData>getData>totalCount final: subject.chatsArray[0].mes...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0753 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0754
     * @tc.name      Socket_ChatSourceFlow_0754
     * @tc.desc      ChatSource call flow totalCount > pushData > addData > totalCount > totalCount keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0754', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0754 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      subject.addData(35.17, new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`totalCount>pushData>addData>totalCount>to...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>pushData>addData>totalCount>to...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>pushData>addData>totalCount>to...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0754 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0755
     * @tc.name      Socket_ChatSourceFlow_0755
     * @tc.desc      ChatSource call flow totalCount > totalCount > totalCount > getData > addData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0755', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0755 begin`);
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
      const step4: ChatBox = subject.getData(53.01);
      logInfo(`step4 getData(53.01): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.addData(100, new ChatBox(true, '', '2024-02-29'));
      logInfo(`totalCount>totalCount>totalCount>getData>...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>totalCount>totalCount>getData>...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>totalCount>totalCount>getData>...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0755 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0756
     * @tc.name      Socket_ChatSourceFlow_0756
     * @tc.desc      ChatSource call flow totalCount > totalCount > addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0756', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0756 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.addData(135, new ChatBox(true, 'hello world', '2024-02-29'));
      const step4: ChatBox = subject.getData(-92);
      logInfo(`step4 getData(-92): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`totalCount>totalCount>addData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>totalCount>addData>getData final: subject.chatsArray[0].i...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>totalCount>addData>getData final: subject.chatsArray[0]....${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0756 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0757
     * @tc.name      Socket_ChatSourceFlow_0757
     * @tc.desc      ChatSource call flow addData > totalCount > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0757', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0757 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(199, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: ChatBox = subject.getData(55);
      logInfo(`step4 getData(55): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(9.66);
      logInfo(`step5 getData(9.66): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`addData>totalCount>totalCount>getData>get...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>totalCount>totalCount>getData>get...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>totalCount>totalCount>getData>get...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0757 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0758
     * @tc.name      Socket_ChatSourceFlow_0758
     * @tc.desc      ChatSource call flow pushData > pushData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0758', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0758 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: ChatBox = subject.getData(180);
      logInfo(`step3 getData(180): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(66.32);
      logInfo(`step4 getData(66.32): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(33.07);
      logInfo(`step5 getData(33.07): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`pushData>pushData>getData>getData>getData...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>pushData>getData>getData>getData...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>pushData>getData>getData>getData...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0758 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0759
     * @tc.name      Socket_ChatSourceFlow_0759
     * @tc.desc      ChatSource call flow addData > pushData > pushData > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0759', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0759 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-27, new ChatBox(false, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step4: ChatBox = subject.getData(-18);
      logInfo(`step4 getData(-18): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`addData>pushData>pushData>getData>pushDat...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(4);
      logInfo(`addData>pushData>pushData>getData>pushDat...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData>pushData>pushData>getData>pushDat...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0759 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0760
     * @tc.name      Socket_ChatSourceFlow_0760
     * @tc.desc      ChatSource call flow totalCount > totalCount > getData > totalCount > pushData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0760', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0760 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: ChatBox = subject.getData(164);
      logInfo(`step3 getData(164): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`totalCount>totalCount>getData>totalCount>...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>totalCount>getData>totalCount>...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>totalCount>getData>totalCount>...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0760 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0761
     * @tc.name      Socket_ChatSourceFlow_0761
     * @tc.desc      ChatSource call flow getData > totalCount > pushData > totalCount > totalCount keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0761', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0761 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(69.16);
      logInfo(`step1 getData(69.16): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`getData>totalCount>pushData>totalCount>to...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>totalCount>pushData>totalCount>to...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>pushData>totalCount>to...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0761 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0762
     * @tc.name      Socket_ChatSourceFlow_0762
     * @tc.desc      ChatSource call flow pushData > getData > totalCount > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0762', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0762 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: ChatBox = subject.getData(75);
      logInfo(`step2 getData(75): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`pushData>getData>totalCount>totalCount>pu...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>getData>totalCount>totalCount>pu...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>getData>totalCount>totalCount>pu...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0762 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0763
     * @tc.name      Socket_ChatSourceFlow_0763
     * @tc.desc      ChatSource call flow pushData > pushData > getData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0763', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0763 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(-91);
      logInfo(`step3 getData(-91): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(15.44);
      logInfo(`step4 getData(15.44): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`pushData>pushData>getData>getData>totalCo...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>pushData>getData>getData>totalCo...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>pushData>getData>getData>totalCo...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0763 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0764
     * @tc.name      Socket_ChatSourceFlow_0764
     * @tc.desc      ChatSource call flow pushData > pushData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0764', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0764 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(0);
      logInfo(`step3 getData(0): step3.isSend=${step3.isSend}`);
      expect(step3.isSend).assertTrue();
      logInfo(`step3 getData(0): step3.message=${step3.message}`);
      expect(step3.message).assertEqual('');
      subject.addData(12, new ChatBox(true, '', '2024-02-29'));
      logInfo(`pushData>pushData>getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`pushData>pushData>getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>pushData>getData>addData final: subject.chatsArray[0].mess...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0764 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0765
     * @tc.name      Socket_ChatSourceFlow_0765
     * @tc.desc      ChatSource call flow totalCount > totalCount > addData > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0765', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0765 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.addData(5, new ChatBox(false, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step5: ChatBox = subject.getData(150);
      logInfo(`step5 getData(150): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`totalCount>totalCount>addData>pushData>ge...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>totalCount>addData>pushData>ge...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>totalCount>addData>pushData>ge...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0765 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0766
     * @tc.name      Socket_ChatSourceFlow_0766
     * @tc.desc      ChatSource call flow totalCount > totalCount > totalCount > getData > pushData keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0766', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0766 begin`);
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
      const step4: ChatBox = subject.getData(5.55);
      logInfo(`step4 getData(5.55): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`totalCount>totalCount>totalCount>getData>...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>totalCount>totalCount>getData>...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>totalCount>totalCount>getData>...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0766 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0767
     * @tc.name      Socket_ChatSourceFlow_0767
     * @tc.desc      ChatSource call flow totalCount > pushData > getData > addData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0767', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0767 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(-54);
      logInfo(`step3 getData(-54): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(-39, new ChatBox(true, '', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`totalCount>pushData>getData>addData>total...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>pushData>getData>addData>total...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>pushData>getData>addData>total...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0767 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0768
     * @tc.name      Socket_ChatSourceFlow_0768
     * @tc.desc      ChatSource call flow totalCount > addData > pushData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0768', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0768 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(22.79, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`totalCount>addData>pushData>totalCount>pu...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`totalCount>addData>pushData>totalCount>pu...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>pushData>totalCount>pu...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0768 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0769
     * @tc.name      Socket_ChatSourceFlow_0769
     * @tc.desc      ChatSource call flow getData > getData > addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0769', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0769 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(117);
      logInfo(`step1 getData(117): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(79.88);
      logInfo(`step2 getData(79.88): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(-16, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`getData>getData>addData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>getData>addData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>getData>addData>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0769 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0770
     * @tc.name      Socket_ChatSourceFlow_0770
     * @tc.desc      ChatSource call flow getData > totalCount > addData > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0770', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0770 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(15);
      logInfo(`step1 getData(15): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.addData(86.11, new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>totalCount>addData>totalCount>pus...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>totalCount>addData>totalCount>pus...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`getData>totalCount>addData>totalCount>pus...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0770 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0771
     * @tc.name      Socket_ChatSourceFlow_0771
     * @tc.desc      ChatSource call flow totalCount > totalCount > totalCount > totalCount > addData keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0771', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0771 begin`);
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
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.addData(115, new ChatBox(true, '', '2024-02-29'));
      logInfo(`totalCount>totalCount>totalCount>totalCou...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>totalCount>totalCount>totalCou...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>totalCount>totalCount>totalCou...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0771 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0772
     * @tc.name      Socket_ChatSourceFlow_0772
     * @tc.desc      ChatSource call flow addData > getData > addData > totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0772', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0772 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(80.94, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(-82);
      logInfo(`step2 getData(-82): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(1, new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.addData(-39, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData>getData>addData>totalCount>addDat...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`addData>getData>addData>totalCount>addDat...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>getData>addData>totalCount>addDat...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0772 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0773
     * @tc.name      Socket_ChatSourceFlow_0773
     * @tc.desc      ChatSource call flow pushData > addData > addData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0773', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0773 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(164, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(174, new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(3);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`pushData>addData>addData>totalCount>total...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`pushData>addData>addData>totalCount>total...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>addData>addData>totalCount>total...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0773 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0774
     * @tc.name      Socket_ChatSourceFlow_0774
     * @tc.desc      ChatSource call flow totalCount > addData > totalCount > totalCount > getData keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0774', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0774 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(22.79, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: ChatBox = subject.getData(42.73);
      logInfo(`step5 getData(42.73): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`totalCount>addData>totalCount>totalCount>...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>addData>totalCount>totalCount>...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>totalCount>totalCount>...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0774 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0775
     * @tc.name      Socket_ChatSourceFlow_0775
     * @tc.desc      ChatSource call flow pushData > totalCount > totalCount > addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0775', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0775 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.addData(90, new ChatBox(true, 'Hello', '2024-02-29'));
      const step5: ChatBox = subject.getData(87);
      logInfo(`step5 getData(87): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`pushData>totalCount>totalCount>addData>ge...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>totalCount>totalCount>addData>ge...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`pushData>totalCount>totalCount>addData>ge...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0775 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0776
     * @tc.name      Socket_ChatSourceFlow_0776
     * @tc.desc      ChatSource call flow getData > totalCount > totalCount > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0776', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0776 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(27);
      logInfo(`step1 getData(27): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step5: ChatBox = subject.getData(-3);
      logInfo(`step5 getData(-3): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`getData>totalCount>totalCount>pushData>ge...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>totalCount>totalCount>pushData>ge...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>totalCount>pushData>ge...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0776 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0777
     * @tc.name      Socket_ChatSourceFlow_0777
     * @tc.desc      ChatSource call flow totalCount > getData > addData > totalCount > totalCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0777', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0777 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(4.29);
      logInfo(`step2 getData(4.29): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(-90, new ChatBox(true, 'hello world', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`totalCount>getData>addData>totalCount>tot...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>getData>addData>totalCount>tot...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>addData>totalCount>tot...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0777 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0778
     * @tc.name      Socket_ChatSourceFlow_0778
     * @tc.desc      ChatSource call flow getData > totalCount > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0778', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0778 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(161);
      logInfo(`step1 getData(161): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: ChatBox = subject.getData(120);
      logInfo(`step3 getData(120): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(37.52, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`getData>totalCount>getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>totalCount>getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>getData>addData final: subject.chatsArray[0].mes...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0778 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0779
     * @tc.name      Socket_ChatSourceFlow_0779
     * @tc.desc      ChatSource call flow getData > totalCount > totalCount > addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0779', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0779 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(5.55);
      logInfo(`step1 getData(5.55): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.addData(49, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>totalCount>totalCount>addData>pus...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>totalCount>totalCount>addData>pus...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>totalCount>addData>pus...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0779 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0780
     * @tc.name      Socket_ChatSourceFlow_0780
     * @tc.desc      ChatSource call flow totalCount > totalCount > totalCount > totalCount > totalCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0780', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0780 begin`);
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
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_0780 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0781
     * @tc.name      Socket_ChatSourceFlow_0781
     * @tc.desc      ChatSource call flow totalCount > pushData > totalCount > pushData > totalCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0781', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0781 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`totalCount>pushData>totalCount>pushData>t...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>pushData>totalCount>pushData>t...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>pushData>totalCount>pushData>t...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0781 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0782
     * @tc.name      Socket_ChatSourceFlow_0782
     * @tc.desc      ChatSource call flow getData > addData > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0782', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0782 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(82);
      logInfo(`step1 getData(82): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(-90, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(122);
      logInfo(`step3 getData(122): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`getData>addData>getData>totalCount>totalC...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>addData>getData>totalCount>totalC...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData>getData>totalCount>totalC...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0782 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0783
     * @tc.name      Socket_ChatSourceFlow_0783
     * @tc.desc      ChatSource call flow getData > pushData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0783', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0783 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(95.95);
      logInfo(`step1 getData(95.95): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(-59);
      logInfo(`step3 getData(-59): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(175);
      logInfo(`step4 getData(175): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(90.83);
      logInfo(`step5 getData(90.83): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`getData>pushData>getData>getData>getData ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>pushData>getData>getData>getData ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`getData>pushData>getData>getData>getData ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0783 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0784
     * @tc.name      Socket_ChatSourceFlow_0784
     * @tc.desc      ChatSource call flow addData > getData > addData > addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0784', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0784 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(62.8, new ChatBox(true, 'hello world', '2024-02-29'));
      const step2: ChatBox = subject.getData(101);
      logInfo(`step2 getData(101): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(3, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(40, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`addData>getData>addData>addData>pushData ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(4);
      logInfo(`addData>getData>addData>addData>pushData ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>getData>addData>addData>pushData ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0784 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0785
     * @tc.name      Socket_ChatSourceFlow_0785
     * @tc.desc      ChatSource call flow pushData > totalCount > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0785', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0785 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: ChatBox = subject.getData(172);
      logInfo(`step4 getData(172): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(138);
      logInfo(`step5 getData(138): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`pushData>totalCount>totalCount>getData>ge...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`pushData>totalCount>totalCount>getData>ge...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`pushData>totalCount>totalCount>getData>ge...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0785 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0786
     * @tc.name      Socket_ChatSourceFlow_0786
     * @tc.desc      ChatSource call flow getData > getData > pushData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0786', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0786 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-11);
      logInfo(`step1 getData(-11): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(-98);
      logInfo(`step2 getData(-98): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(80, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>getData>pushData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>getData>pushData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>getData>pushData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0786 end`);
    });
  });
}
