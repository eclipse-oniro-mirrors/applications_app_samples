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

/** Logic checks for ChatSource flow (52 cases). */
export default function chatSourceFlow8Test(): void {
  describe('ChatSourceFlow8Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0379
     * @tc.name      Socket_ChatSourceFlow_0379
     * @tc.desc      ChatSource call flow getData > addData > addData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0379 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(83);
      logInfo(`step1 getData(83): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(12, new ChatBox(true, '', '2024-02-29'));
      subject.addData(60, new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`getData>addData>addData>totalCount>totalC...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>addData>addData>totalCount>totalC...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData>addData>totalCount>totalC...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0379 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0380
     * @tc.name      Socket_ChatSourceFlow_0380
     * @tc.desc      ChatSource call flow getData > totalCount > pushData > totalCount > totalCount keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0380 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-41);
      logInfo(`step1 getData(-41): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
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
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0380 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0381
     * @tc.name      Socket_ChatSourceFlow_0381
     * @tc.desc      ChatSource call flow totalCount > totalCount > getData > addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0381 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: ChatBox = subject.getData(90.58);
      logInfo(`step3 getData(90.58): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(199, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`totalCount>totalCount>getData>addData>pus...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>totalCount>getData>addData>pus...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>totalCount>getData>addData>pus...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0381 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0382
     * @tc.name      Socket_ChatSourceFlow_0382
     * @tc.desc      ChatSource call flow totalCount > getData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0382 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(74);
      logInfo(`step2 getData(74): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_0382 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0383
     * @tc.name      Socket_ChatSourceFlow_0383
     * @tc.desc      ChatSource call flow getData > getData > totalCount > totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0383 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(15);
      logInfo(`step1 getData(15): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(95.68);
      logInfo(`step2 getData(95.68): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      subject.addData(35.17, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>getData>totalCount>totalCount>add...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>getData>totalCount>totalCount>add...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>getData>totalCount>totalCount>add...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0383 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0384
     * @tc.name      Socket_ChatSourceFlow_0384
     * @tc.desc      ChatSource call flow totalCount > totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0384 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.addData(160, new ChatBox(false, 'Hello', '2024-02-29'));
      logInfo(`totalCount>totalCount>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>totalCount>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>totalCount>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0384 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0385
     * @tc.name      Socket_ChatSourceFlow_0385
     * @tc.desc      ChatSource call flow totalCount > addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0385 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(4, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(79.88);
      logInfo(`step3 getData(79.88): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`totalCount>addData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>addData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>getData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0385 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0386
     * @tc.name      Socket_ChatSourceFlow_0386
     * @tc.desc      ChatSource call flow addData > getData > totalCount > totalCount > totalCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0386 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(57.67, new ChatBox(true, '', '2024-02-29'));
      const step2: ChatBox = subject.getData(12.55);
      logInfo(`step2 getData(12.55): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`addData>getData>totalCount>totalCount>tot...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>getData>totalCount>totalCount>tot...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>getData>totalCount>totalCount>tot...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0386 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0387
     * @tc.name      Socket_ChatSourceFlow_0387
     * @tc.desc      ChatSource call flow addData > getData > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0387 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(22.79, new ChatBox(true, '', '2024-02-29'));
      const step2: ChatBox = subject.getData(161);
      logInfo(`step2 getData(161): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: ChatBox = subject.getData(-14);
      logInfo(`step4 getData(-14): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(155);
      logInfo(`step5 getData(155): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`addData>getData>totalCount>getData>getDat...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>getData>totalCount>getData>getDat...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>getData>totalCount>getData>getDat...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0387 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0388
     * @tc.name      Socket_ChatSourceFlow_0388
     * @tc.desc      ChatSource call flow pushData > totalCount > addData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0388 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.addData(73, new ChatBox(true, '', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: ChatBox = subject.getData(173);
      logInfo(`step5 getData(173): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`pushData>totalCount>addData>totalCount>ge...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>totalCount>addData>totalCount>ge...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>totalCount>addData>totalCount>ge...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0388 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0389
     * @tc.name      Socket_ChatSourceFlow_0389
     * @tc.desc      ChatSource call flow totalCount > addData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0389 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(-32, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(-38);
      logInfo(`step3 getData(-38): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(188);
      logInfo(`step4 getData(188): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(63.11);
      logInfo(`step5 getData(63.11): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`totalCount>addData>getData>getData>getDat...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>addData>getData>getData>getDat...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>getData>getData>getDat...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0389 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0390
     * @tc.name      Socket_ChatSourceFlow_0390
     * @tc.desc      ChatSource call flow totalCount > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0390 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(-12);
      logInfo(`step2 getData(-12): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(20);
      logInfo(`step3 getData(20): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(1.9);
      logInfo(`step4 getData(1.9): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_0390 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0391
     * @tc.name      Socket_ChatSourceFlow_0391
     * @tc.desc      ChatSource call flow pushData > addData > getData > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0391 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(1, new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(9.49);
      logInfo(`step3 getData(9.49): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: ChatBox = subject.getData(-56);
      logInfo(`step5 getData(-56): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`pushData>addData>getData>totalCount>getDa...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>addData>getData>totalCount>getDa...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>addData>getData>totalCount>getDa...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0391 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0392
     * @tc.name      Socket_ChatSourceFlow_0392
     * @tc.desc      ChatSource call flow getData > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0392 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-25);
      logInfo(`step1 getData(-25): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(71.48);
      logInfo(`step2 getData(71.48): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`getData>getData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>getData>pushData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>getData>pushData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0392 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0393
     * @tc.name      Socket_ChatSourceFlow_0393
     * @tc.desc      ChatSource call flow getData > totalCount > pushData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0393 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(53.37);
      logInfo(`step1 getData(53.37): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`getData>totalCount>pushData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>totalCount>pushData>pushData final: subject.chatsArray[0].is...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`getData>totalCount>pushData>pushData final: subject.chatsArray[0].m...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0393 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0394
     * @tc.name      Socket_ChatSourceFlow_0394
     * @tc.desc      ChatSource call flow totalCount > getData > pushData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0394 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(113);
      logInfo(`step2 getData(113): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step4: ChatBox = subject.getData(62);
      logInfo(`step4 getData(62): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.addData(175, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`totalCount>getData>pushData>getData>addDa...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>getData>pushData>getData>addDa...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>pushData>getData>addDa...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0394 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0395
     * @tc.name      Socket_ChatSourceFlow_0395
     * @tc.desc      ChatSource call flow totalCount > getData > pushData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0395 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(78);
      logInfo(`step2 getData(78): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: ChatBox = subject.getData(42.37);
      logInfo(`step4 getData(42.37): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(93);
      logInfo(`step5 getData(93): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`totalCount>getData>pushData>getData>getDa...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>getData>pushData>getData>getDa...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>pushData>getData>getDa...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0395 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0396
     * @tc.name      Socket_ChatSourceFlow_0396
     * @tc.desc      ChatSource call flow getData > pushData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0396 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-88);
      logInfo(`step1 getData(-88): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step3: ChatBox = subject.getData(8);
      logInfo(`step3 getData(8): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`getData>pushData>getData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>pushData>getData>totalCount final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData>getData>totalCount final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0396 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0397
     * @tc.name      Socket_ChatSourceFlow_0397
     * @tc.desc      ChatSource call flow getData > getData > totalCount > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0397 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-5);
      logInfo(`step1 getData(-5): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(29.17);
      logInfo(`step2 getData(29.17): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`getData>getData>totalCount>pushData>total...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>getData>totalCount>pushData>total...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>getData>totalCount>pushData>total...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0397 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0398
     * @tc.name      Socket_ChatSourceFlow_0398
     * @tc.desc      ChatSource call flow pushData > totalCount > addData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0398 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.addData(-72, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(3);
      logInfo(`pushData>totalCount>addData>pushData>tota...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`pushData>totalCount>addData>pushData>tota...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>totalCount>addData>pushData>tota...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0398 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0399
     * @tc.name      Socket_ChatSourceFlow_0399
     * @tc.desc      ChatSource call flow totalCount > pushData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0399 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(23.68);
      logInfo(`step3 getData(23.68): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(61.1, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`totalCount>pushData>getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>pushData>getData>addData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>pushData>getData>addData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0399 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0400
     * @tc.name      Socket_ChatSourceFlow_0400
     * @tc.desc      ChatSource call flow getData > addData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0400 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(89.77);
      logInfo(`step1 getData(89.77): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(36.31, new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: ChatBox = subject.getData(157);
      logInfo(`step3 getData(157): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`getData>addData>getData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>addData>getData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData>getData>totalCount final: subject.chatsArray[0].mes...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0400 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0401
     * @tc.name      Socket_ChatSourceFlow_0401
     * @tc.desc      ChatSource call flow totalCount > addData > totalCount > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0401 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(65, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: ChatBox = subject.getData(115);
      logInfo(`step4 getData(115): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: ChatBox = subject.getData(49.58);
      logInfo(`step5 getData(49.58): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`totalCount>addData>totalCount>getData>get...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>addData>totalCount>getData>get...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>totalCount>getData>get...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0401 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0402
     * @tc.name      Socket_ChatSourceFlow_0402
     * @tc.desc      ChatSource call flow totalCount > getData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0402 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(28.96);
      logInfo(`step2 getData(28.96): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(79);
      logInfo(`step3 getData(79): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(55, new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`totalCount>getData>getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>getData>getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>getData>addData final: subject.chatsArray[0].mes...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0402 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0403
     * @tc.name      Socket_ChatSourceFlow_0403
     * @tc.desc      ChatSource call flow totalCount > pushData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0403 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`totalCount>pushData>pushData>totalCount f...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>pushData>pushData>totalCount f...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`totalCount>pushData>pushData>totalCount f...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0403 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0404
     * @tc.name      Socket_ChatSourceFlow_0404
     * @tc.desc      ChatSource call flow getData > addData > getData > pushData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0404 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(133);
      logInfo(`step1 getData(133): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(5, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: ChatBox = subject.getData(28);
      logInfo(`step3 getData(28): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      logInfo(`getData>addData>getData>pushData>pushData...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`getData>addData>getData>pushData>pushData...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData>getData>pushData>pushData...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0404 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0405
     * @tc.name      Socket_ChatSourceFlow_0405
     * @tc.desc      ChatSource call flow addData > pushData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0405 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-72, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: ChatBox = subject.getData(55);
      logInfo(`step3 getData(55): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(73);
      logInfo(`step4 getData(73): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`addData>pushData>getData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>pushData>getData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>pushData>getData>getData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0405 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0406
     * @tc.name      Socket_ChatSourceFlow_0406
     * @tc.desc      ChatSource call flow pushData > pushData > getData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0406 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step3: ChatBox = subject.getData(-4);
      logInfo(`step3 getData(-4): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(97);
      logInfo(`step4 getData(97): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.addData(3.03, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`pushData>pushData>getData>getData>addData...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`pushData>pushData>getData>getData>addData...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>pushData>getData>getData>addData...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0406 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0407
     * @tc.name      Socket_ChatSourceFlow_0407
     * @tc.desc      ChatSource call flow pushData > getData > getData > totalCount > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0407 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(52.83);
      logInfo(`step2 getData(52.83): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(4.77);
      logInfo(`step3 getData(4.77): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      subject.addData(73, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`pushData>getData>getData>totalCount>addDa...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>getData>getData>totalCount>addDa...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`pushData>getData>getData>totalCount>addDa...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0407 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0408
     * @tc.name      Socket_ChatSourceFlow_0408
     * @tc.desc      ChatSource call flow getData > pushData > addData > addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0408 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(150);
      logInfo(`step1 getData(150): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      subject.addData(0, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.addData(100, new ChatBox(true, '', '2024-02-29'));
      const step5: ChatBox = subject.getData(-12);
      logInfo(`step5 getData(-12): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`getData>pushData>addData>addData>getData ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`getData>pushData>addData>addData>getData ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData>addData>addData>getData ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0408 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0409
     * @tc.name      Socket_ChatSourceFlow_0409
     * @tc.desc      ChatSource call flow getData > addData > addData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0409 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(89.77);
      logInfo(`step1 getData(89.77): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.addData(140, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(86.73, new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`getData>addData>addData>totalCount>totalC...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>addData>addData>totalCount>totalC...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>addData>addData>totalCount>totalC...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0409 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0410
     * @tc.name      Socket_ChatSourceFlow_0410
     * @tc.desc      ChatSource call flow addData > totalCount > totalCount > getData > totalCount keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0410 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(62.8, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: ChatBox = subject.getData(166);
      logInfo(`step4 getData(166): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`addData>totalCount>totalCount>getData>tot...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>totalCount>totalCount>getData>tot...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>totalCount>totalCount>getData>tot...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0410 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0411
     * @tc.name      Socket_ChatSourceFlow_0411
     * @tc.desc      ChatSource call flow pushData > getData > getData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0411 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(58);
      logInfo(`step2 getData(58): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(25.48);
      logInfo(`step3 getData(25.48): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`pushData>getData>getData>pushData>totalCo...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>getData>getData>pushData>totalCo...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`pushData>getData>getData>pushData>totalCo...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0411 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0412
     * @tc.name      Socket_ChatSourceFlow_0412
     * @tc.desc      ChatSource call flow totalCount > addData > totalCount > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0412 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.addData(75, new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`totalCount>addData>totalCount>totalCount ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>addData>totalCount>totalCount ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>addData>totalCount>totalCount ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0412 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0413
     * @tc.name      Socket_ChatSourceFlow_0413
     * @tc.desc      ChatSource call flow addData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0413 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(85, new ChatBox(false, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(110);
      logInfo(`step2 getData(110): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`addData>getData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`addData>getData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData>getData>totalCount final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0413 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0414
     * @tc.name      Socket_ChatSourceFlow_0414
     * @tc.desc      ChatSource call flow getData > totalCount > totalCount > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0414 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(55);
      logInfo(`step1 getData(55): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`getData>totalCount>totalCount>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>totalCount>totalCount>pushData final: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>totalCount>pushData final: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0414 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0415
     * @tc.name      Socket_ChatSourceFlow_0415
     * @tc.desc      ChatSource call flow getData > totalCount > pushData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0415 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(83);
      logInfo(`step1 getData(83): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`getData>totalCount>pushData>pushData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>totalCount>pushData>pushData final: subject.chatsArray[0].is...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>totalCount>pushData>pushData final: subject.chatsArray[0].m...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0415 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0416
     * @tc.name      Socket_ChatSourceFlow_0416
     * @tc.desc      ChatSource call flow pushData > getData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0416 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      const step2: ChatBox = subject.getData(57.49);
      logInfo(`step2 getData(57.49): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`pushData>getData>pushData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>getData>pushData>totalCount final: subject.chatsArray[0].is...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`pushData>getData>pushData>totalCount final: subject.chatsArray[0].m...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('hello world');
      logInfo(`${BUNDLE}ChatSourceFlow_0416 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0417
     * @tc.name      Socket_ChatSourceFlow_0417
     * @tc.desc      ChatSource call flow addData > totalCount > addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0417 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(-39, new ChatBox(true, '', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.addData(0, new ChatBox(false, 'Hello', '2024-02-29'));
      const step4: ChatBox = subject.getData(40);
      logInfo(`step4 getData(40): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`addData>totalCount>addData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>totalCount>addData>getData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`addData>totalCount>addData>getData final: subject.chatsArray[0].mes...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0417 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0418
     * @tc.name      Socket_ChatSourceFlow_0418
     * @tc.desc      ChatSource call flow addData > pushData > totalCount > getData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0418 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(55, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: ChatBox = subject.getData(40);
      logInfo(`step4 getData(40): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`addData>pushData>totalCount>getData>pushD...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`addData>pushData>totalCount>getData>pushD...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>pushData>totalCount>getData>pushD...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0418 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0419
     * @tc.name      Socket_ChatSourceFlow_0419
     * @tc.desc      ChatSource call flow addData > getData > pushData > addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0419 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(10, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: ChatBox = subject.getData(4.29);
      logInfo(`step2 getData(4.29): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(12, new ChatBox(true, '', '2024-02-29'));
      const step5: ChatBox = subject.getData(46);
      logInfo(`step5 getData(46): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`addData>getData>pushData>addData>getData ...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`addData>getData>pushData>addData>getData ...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>getData>pushData>addData>getData ...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0419 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0420
     * @tc.name      Socket_ChatSourceFlow_0420
     * @tc.desc      ChatSource call flow totalCount > totalCount > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0420 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: ChatBox = subject.getData(33.46);
      logInfo(`step3 getData(33.46): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ChatSourceFlow_0420 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0421
     * @tc.name      Socket_ChatSourceFlow_0421
     * @tc.desc      ChatSource call flow totalCount > getData > pushData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0421 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(-53);
      logInfo(`step2 getData(-53): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      const step4: ChatBox = subject.getData(72.65);
      logInfo(`step4 getData(72.65): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`totalCount>getData>pushData>getData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`totalCount>getData>pushData>getData final: subject.chatsArray[0].isS...${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>pushData>getData final: subject.chatsArray[0].me...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0421 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0422
     * @tc.name      Socket_ChatSourceFlow_0422
     * @tc.desc      ChatSource call flow getData > pushData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0422 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(-70);
      logInfo(`step1 getData(-70): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`getData>pushData>totalCount final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>pushData>totalCount final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`getData>pushData>totalCount final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0422 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0423
     * @tc.name      Socket_ChatSourceFlow_0423
     * @tc.desc      ChatSource call flow totalCount > getData > getData > addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0423 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: number = subject.totalCount();
      logInfo(`step1 totalCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: ChatBox = subject.getData(24.07);
      logInfo(`step2 getData(24.07): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(71.56);
      logInfo(`step3 getData(71.56): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(-27, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`totalCount>getData>getData>addData>pushDa...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`totalCount>getData>getData>addData>pushDa...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`totalCount>getData>getData>addData>pushDa...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0423 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0424
     * @tc.name      Socket_ChatSourceFlow_0424
     * @tc.desc      ChatSource call flow addData > addData > getData > addData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0424 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(164, new ChatBox(true, 'hello world', '2024-02-29'));
      subject.addData(-39, new ChatBox(true, '', '2024-02-29'));
      const step3: ChatBox = subject.getData(160);
      logInfo(`step3 getData(160): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.addData(55, new ChatBox(true, 'Hello', '2024-02-29'));
      const step5: ChatBox = subject.getData(133);
      logInfo(`step5 getData(133): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`addData>addData>getData>addData>getData f...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(3);
      logInfo(`addData>addData>getData>addData>getData f...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>addData>getData>addData>getData f...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0424 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0425
     * @tc.name      Socket_ChatSourceFlow_0425
     * @tc.desc      ChatSource call flow pushData > pushData > totalCount > totalCount > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0425 begin`);
      const subject: ChatSource = new ChatSource();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, 'Hello', '2024-02-29'));
      const step3: number = subject.totalCount();
      logInfo(`step3 totalCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.totalCount();
      logInfo(`step4 totalCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: ChatBox = subject.getData(35.26);
      logInfo(`step5 getData(35.26): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`pushData>pushData>totalCount>totalCount>g...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`pushData>pushData>totalCount>totalCount>g...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`pushData>pushData>totalCount>totalCount>g...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0425 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0426
     * @tc.name      Socket_ChatSourceFlow_0426
     * @tc.desc      ChatSource call flow getData > pushData > pushData > addData > pushData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0426 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(16);
      logInfo(`step1 getData(16): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      subject.addData(72, new ChatBox(true, 'Hello', '2024-02-29'));
      subject.pushData(new ChatBox(true, '', '2024-02-29'));
      logInfo(`getData>pushData>pushData>addData>pushDat...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(4);
      logInfo(`getData>pushData>pushData>addData>pushDat...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>pushData>pushData>addData>pushDat...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0426 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0427
     * @tc.name      Socket_ChatSourceFlow_0427
     * @tc.desc      ChatSource call flow getData > getData > pushData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0427 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(82.54);
      logInfo(`step1 getData(82.54): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(-70);
      logInfo(`step2 getData(-70): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.pushData(new ChatBox(false, 'Hello', '2024-02-29'));
      subject.addData(180, new ChatBox(true, 'Hello', '2024-02-29'));
      logInfo(`getData>getData>pushData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`getData>getData>pushData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertFalse();
      logInfo(`getData>getData>pushData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0427 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0428
     * @tc.name      Socket_ChatSourceFlow_0428
     * @tc.desc      ChatSource call flow getData > getData > getData > getData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0428 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(37.67);
      logInfo(`step1 getData(37.67): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(110);
      logInfo(`step2 getData(110): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: ChatBox = subject.getData(-31);
      logInfo(`step3 getData(-31): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: ChatBox = subject.getData(152);
      logInfo(`step4 getData(152): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ChatSourceFlow_0428 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0429
     * @tc.name      Socket_ChatSourceFlow_0429
     * @tc.desc      ChatSource call flow getData > getData > addData keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0429 begin`);
      const subject: ChatSource = new ChatSource();
      const step1: ChatBox = subject.getData(72.65);
      logInfo(`step1 getData(72.65): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: ChatBox = subject.getData(-66);
      logInfo(`step2 getData(-66): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.addData(-88, new ChatBox(true, '', '2024-02-29'));
      logInfo(`getData>getData>addData final: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(1);
      logInfo(`getData>getData>addData final: subject.chatsArray[0].isSend=${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`getData>getData>addData final: subject.chatsArray[0].message=${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('');
      logInfo(`${BUNDLE}ChatSourceFlow_0429 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_SOURCE_FLOW_0430
     * @tc.name      Socket_ChatSourceFlow_0430
     * @tc.desc      ChatSource call flow addData > totalCount > addData > getData > totalCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatSourceFlow_0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatSourceFlow_0430 begin`);
      const subject: ChatSource = new ChatSource();
      subject.addData(55, new ChatBox(true, 'Hello', '2024-02-29'));
      const step2: number = subject.totalCount();
      logInfo(`step2 totalCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      subject.addData(5, new ChatBox(true, 'Hello', '2024-02-29'));
      const step4: ChatBox = subject.getData(-82);
      logInfo(`step4 getData(-82): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: number = subject.totalCount();
      logInfo(`step5 totalCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`addData>totalCount>addData>getData>totalC...: subject.chatsArray.length=${subject.chatsArray.length}`);
      expect(subject.chatsArray.length).assertEqual(2);
      logInfo(`addData>totalCount>addData>getData>totalC...: subject.chatsArray[0]....${subject.chatsArray[0].isSend}`);
      expect(subject.chatsArray[0].isSend).assertTrue();
      logInfo(`addData>totalCount>addData>getData>totalC...: subject.chatsArray[0]...${subject.chatsArray[0].message}`);
      expect(subject.chatsArray[0].message).assertEqual('Hello');
      logInfo(`${BUNDLE}ChatSourceFlow_0430 end`);
    });
  });
}
