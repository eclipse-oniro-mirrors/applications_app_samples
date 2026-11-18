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
import { expect } from '@ohos/hypium';
import { ContinuousCalleeFixture } from './ContinuousCalleeFixture';
import { MessageSequenceView, ExternalMessage, drain } from './ContinuousExternal';
import { rpc } from '@kit.IPCKit';



/**
 * @tc.number EXP_BG_CALLEE_005
 * @tc.name 真实Callee消息协议分派与后台启动取消 BG_CALLEE_005
 * @tc.desc Catalog oracle: {"operation":null,"startMode":null,"replyWrites":[["writeInt",10],["writeString","Callee test"]],"handledBackgroundReject":false}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = new ContinuousCalleeFixture();
    let primaryFailed: boolean = false;
    try {
      f.register();
      expect(f.callee.calls.join('|')).assertEqual('CallSendMsg');
      const input = new ExternalMessage(7, 'unknown');
      const reply = f.callee.callback(input as MessageSequenceView as rpc.MessageSequence);
      expect(input.calls.join('|')).assertEqual('readParcelable|readInt|readString');
      const output = new ExternalMessage(0, '');
      expect(reply.marshalling(output as MessageSequenceView as rpc.MessageSequence)).assertTrue();
      expect(output.calls.join('|')).assertEqual('writeInt|writeString');
      expect(output.writtenInt).assertEqual(10);
      expect(output.writtenText).assertEqual('Callee test');
      await drain();
      expect(f.calls.length).assertEqual(0);
      expect(f.wantInfo).assertNull();
      await drain();
      expect(f.errors.length).assertEqual(0);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
