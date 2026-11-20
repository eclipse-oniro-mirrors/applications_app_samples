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
import {
  MessageSequenceView,
  ExternalMessage,
  ExternalContext,
  ExternalResources,
  Deferred,
  drain
} from './ContinuousExternal';
import { rpc } from '@kit.IPCKit';
import { WantAgent } from '@kit.AbilityKit';
/**
 * @tc.number EXP_V2_CT_CALLEE_070
 * @tc.name CALLEE explicit contract sequence 70
 * @tc.desc CALLEE:{"commands":["start_bgtask ","stop_bgtask"],"contextSwitchBeforeSecond":true,"firstNum":7,"rejectOperations":true,"secondNum":-7,"sequence":"register-message-reregister-new-context-message-strict-ignored-command"}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = new ContinuousCalleeFixture();
    let primaryFailed: boolean = false;
    try {
      f.register();
      expect(f.callee.calls.join('|')).assertEqual('CallSendMsg');
      const registeredCallback = f.callee.callback;
      const firstContext = f.context;
      expect(f.calls.length).assertEqual(0);
      expect(f.errors.length).assertEqual(0);
      const input0 = new ExternalMessage(7, 'start_bgtask ');
      const reply0 = registeredCallback(input0 as MessageSequenceView as rpc.MessageSequence);
      expect(input0.calls.join('|')).assertEqual('readParcelable|readInt|readString');
      expect(input0.num).assertEqual(7);
      expect(input0.text).assertEqual('start_bgtask ');
      const output0 = new ExternalMessage(-1, 'before');
      expect(reply0.marshalling(output0 as MessageSequenceView as rpc.MessageSequence)).assertTrue();
      expect(output0.calls.join('|')).assertEqual('writeInt|writeString');
      expect(output0.writtenInt).assertEqual(10);
      expect(output0.writtenText).assertEqual('Callee test');
      await drain();
      expect(f.calls.join('|')).assertEqual('');
      await drain();
      expect(f.errors.length).assertEqual(0);
      expect(f.callee.callback === registeredCallback).assertTrue();
      expect(input0.calls.join('|')).assertEqual('readParcelable|readInt|readString');
      expect(output0.calls.join('|')).assertEqual('writeInt|writeString');
      if (!f.wantGate.settled) {
        f.wantGate.resolve(f.token);
      }
      if (!f.operationGate.settled) {
        f.operationGate.resolve();
      }
      await drain();
      f.wantGate = new Deferred<WantAgent>();
      f.operationGate = new Deferred<void>();
      f.context = new ExternalContext(new ExternalResources([])).asSdk();
      f.ability.context = f.context;
      f.register();
      expect(f.callee.calls.join('|')).assertEqual('CallSendMsg|CallSendMsg');
      expect(f.callee.callback === registeredCallback).assertTrue();
      expect(f.context === firstContext).assertFalse();
      const input1 = new ExternalMessage(-7, 'stop_bgtask');
      const reply1 = registeredCallback(input1 as MessageSequenceView as rpc.MessageSequence);
      expect(input1.calls.join('|')).assertEqual('readParcelable|readInt|readString');
      expect(input1.num).assertEqual(-7);
      expect(input1.text).assertEqual('stop_bgtask');
      const output1 = new ExternalMessage(-1, 'before');
      expect(reply1.marshalling(output1 as MessageSequenceView as rpc.MessageSequence)).assertTrue();
      expect(output1.calls.join('|')).assertEqual('writeInt|writeString');
      expect(output1.writtenInt).assertEqual(10);
      expect(output1.writtenText).assertEqual('Callee test');
      expect(f.calls.join('|')).assertEqual('stop');
      expect(f.stopContext === f.context).assertTrue();
      f.operationGate.reject(new Error('controlled operation 1 rejected'));
      await drain();
      expect(f.errors.length).assertEqual(1);
      expect(f.callee.callback === registeredCallback).assertTrue();
      expect(input1.calls.join('|')).assertEqual('readParcelable|readInt|readString');
      expect(output1.calls.join('|')).assertEqual('writeInt|writeString');
      expect(f.errors[0].includes('controlled operation 1 rejected')).assertTrue();
      const ignored = new ExternalMessage(99, 'Start_bgtask');
      const ignoredReply = registeredCallback(ignored as MessageSequenceView as rpc.MessageSequence);
      const ignoredOutput = new ExternalMessage(0, '');
      expect(ignoredReply.marshalling(ignoredOutput as MessageSequenceView as rpc.MessageSequence)).assertTrue();
      expect(ignored.calls.join('|')).assertEqual('readParcelable|readInt|readString');
      expect(ignoredOutput.writtenInt).assertEqual(10);
      expect(ignoredOutput.writtenText).assertEqual('Callee test');
      await drain();
      expect(f.calls.join('|')).assertEqual('stop');
      expect(f.errors.length).assertEqual(1);
      expect(f.callee.calls.join('|')).assertEqual('CallSendMsg|CallSendMsg');
      expect(f.callee.callback === registeredCallback).assertTrue();
      expect(f.ability.context === f.context).assertTrue();
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
