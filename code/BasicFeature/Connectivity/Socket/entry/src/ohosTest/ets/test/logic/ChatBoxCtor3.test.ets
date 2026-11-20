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

/** Logic checks for new ChatBox (2 cases). */
export default function chatBoxCtor3Test(): void {
  describe('ChatBoxCtor3Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0155
     * @tc.name      Socket_ChatBoxCtor_0155
     * @tc.desc      new ChatBox(true, "hello world", "invalid") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0155 begin`);
      const subject: ChatBox = new ChatBox(true, 'hello world', 'invalid');
      logInfo(`new ChatBox(true, "hello world", "invalid"): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, "hello world", "invalid"): subject.message=${subject.message}`);
      expect(subject.message).assertEqual('hello world');
      logInfo(`new ChatBox(true, "hello world", "invalid"): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('invalid');
      logInfo(`${BUNDLE}ChatBoxCtor_0155 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CHAT_BOX_CTOR_0156
     * @tc.name      Socket_ChatBoxCtor_0156
     * @tc.desc      new ChatBox(true, " a ", "x ") initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ChatBoxCtor_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ChatBoxCtor_0156 begin`);
      const subject: ChatBox = new ChatBox(true, ' a ', 'x ');
      logInfo(`new ChatBox(true, " a ", "x "): subject.isSend=${subject.isSend}`);
      expect(subject.isSend).assertTrue();
      logInfo(`new ChatBox(true, " a ", "x "): subject.message=${subject.message}`);
      expect(subject.message).assertEqual(' a ');
      logInfo(`new ChatBox(true, " a ", "x "): subject.date=${subject.date}`);
      expect(subject.date).assertEqual('x ');
      logInfo(`${BUNDLE}ChatBoxCtor_0156 end`);
    });
  });
}
