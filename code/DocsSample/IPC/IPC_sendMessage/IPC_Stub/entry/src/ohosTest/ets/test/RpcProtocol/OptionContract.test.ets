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

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  OPTION_FLAG_SYNC,
  OPTION_FLAG_ASYNC,
  StubRemoteObjectModel,
  InProcessClient,
  MessageSequenceModel,
  MessageOptionModel,
  countOf,
  joined,
  textFingerprint
} from '../Shared/SharedDriver';

/**
 * MessageOption contract of the IPC stub.
 *
 * Production anchor: ServiceExtAbility.ets 26-27 receives an
 * rpc.MessageOption for each request. The stub does not branch on it,
 * so the option must not change handling, replies or data reads.
 */

function syncOption(): MessageOptionModel {
  return new MessageOptionModel(OPTION_FLAG_SYNC, 0, false);
}

function asyncOption(waitTime: number = 0): MessageOptionModel {
  return new MessageOptionModel(OPTION_FLAG_ASYNC, waitTime, false);
}

function recordedOptionOf(code: number, option: MessageOptionModel): string {
  const stub = new StubRemoteObjectModel();
  const data = MessageSequenceModel.create();
  const reply = MessageSequenceModel.create();
  data.writeString(REQUEST_PAYLOAD);
  stub.onRemoteMessageRequest(code, data, reply, option);
  const record = stub.lastRequest();
  return record === undefined ? '' : record.option;
}

function replyWithOption(code: number, option: MessageOptionModel): string {
  const stub = new StubRemoteObjectModel();
  const data = MessageSequenceModel.create();
  const reply = MessageSequenceModel.create();
  data.writeString(REQUEST_PAYLOAD);
  stub.onRemoteMessageRequest(code, data, reply, option);
  return reply.readString();
}

function manualReply(option: MessageOptionModel): MessageSequenceModel {
  const stub = new StubRemoteObjectModel();
  const data = MessageSequenceModel.create();
  const reply = MessageSequenceModel.create();
  data.writeString(REQUEST_PAYLOAD);
  stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
  return reply;
}

function handledWithOption(code: number, option: MessageOptionModel): boolean {
  const stub = new StubRemoteObjectModel();
  const data = MessageSequenceModel.create();
  const reply = MessageSequenceModel.create();
  data.writeString(REQUEST_PAYLOAD);
  return stub.onRemoteMessageRequest(code, data, reply, option);
}

export default function optionContractTest(): void {
  describe('OptionContractTest', () => {
    beforeAll(() => {
      logSuite('OptionContractTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('OptionContractTest', 'end');
    });

    /**
     * @tc.name          optionContractDefaultOptionIsSync
     * @tc.desc          The default MessageOptionModel reports synchronous mode.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Construct a default option.
     *                   2. Query isSync.
     *                   3. Compare flags and sync fields.
     * @tc.expected      isSync is true for the default option.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('optionContractDefaultOptionIsSync', 0, () => {
      const option = new MessageOptionModel();
      expect(option.isSync()).assertTrue();
      expect(option.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(option.flags).assertEqual(0);
      expect(option.waitTime).assertEqual(0);
      expect(option.sync).assertFalse();
      expect(option.describe()).assertEqual('0/0/false');
      expect(option.isSync()).assertEqual(option.flags === OPTION_FLAG_SYNC);
    });

    /**
     * @tc.name          optionContractDefaultWaitTimeZero
     * @tc.desc          The default option carries a zero wait time.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Construct a default option.
     *                   2. Read waitTime.
     *                   3. Compare with explicit zero.
     * @tc.expected      The wait time is exactly zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('optionContractDefaultWaitTimeZero', 0, () => {
      const option = new MessageOptionModel();
      expect(option.waitTime).assertEqual(0);
      expect(option.waitTime).assertEqual(OPTION_FLAG_SYNC);
      expect(option.waitTime).assertLess(1);
      expect(option.describe().split('/')[1]).assertEqual('0');
      expect(option.describe().split('/').length).assertEqual(3);
      expect(option.describe().endsWith('/false')).assertTrue();
      expect(new MessageOptionModel(0, 0).waitTime).assertEqual(option.waitTime);
    });

    /**
     * @tc.name          optionContractDefaultSyncFlagIsFalse
     * @tc.desc          The explicit sync boolean defaults to false while isSync is true.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Construct a default option.
     *                   2. Read the sync property.
     *                   3. Compare describe with the raw fields.
     * @tc.expected      sync is false but isSync is true through the flag.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('optionContractDefaultSyncFlagIsFalse', 0, () => {
      const option = new MessageOptionModel();
      expect(option.sync).assertFalse();
      expect(option.isSync()).assertTrue();
      expect(option.sync === option.isSync()).assertFalse();
      expect(option.describe()).assertEqual(String(option.flags) + '/' + String(option.waitTime) + '/' +
        String(option.sync));
      expect(option.describe()).assertEqual('0/0/false');
      expect(option.describe()).assertContain('/false');
      expect(option.sync).assertEqual(false);
    });
    /**
     * @tc.name          optionContractAsyncFlagIsNotSync
     * @tc.desc          Flag value 1 marks the option asynchronous.
     * @tc.precondition  The async flag constant is available.
     * @tc.steps         1. Construct an option with flag 1.
     *                   2. Query isSync.
     *                   3. Read the description.
     * @tc.expected      isSync is false and the description starts with 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('optionContractAsyncFlagIsNotSync', 0, () => {
      const option = asyncOption();
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      expect(option.flags).assertEqual(1);
      expect(option.isSync()).assertFalse();
      expect(option.sync).assertFalse();
      expect(option.describe()).assertEqual('1/0/false');
      expect(option.describe().startsWith('1/')).assertTrue();
      expect(option.waitTime).assertEqual(0);
      expect(option.flags === OPTION_FLAG_SYNC).assertFalse();
    });

    /**
     * @tc.name          optionContractSyncFlagOverridesAsyncFlag
     * @tc.desc          An explicit sync boolean wins over an asynchronous flag.
     * @tc.precondition  The option model accepts a sync override.
     * @tc.steps         1. Construct flag 1 with sync true.
     *                   2. Query isSync.
     *                   3. Read the description.
     * @tc.expected      isSync is true while flags and sync are both reported.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractSyncFlagOverridesAsyncFlag', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, true);
      expect(option.flags).assertEqual(1);
      expect(option.sync).assertTrue();
      expect(option.isSync()).assertTrue();
      expect(option.isSync()).assertEqual(option.sync || option.flags === OPTION_FLAG_SYNC);
      expect(option.describe()).assertEqual('1/0/true');
      expect(option.describe().endsWith('/true')).assertTrue();
      expect(option.flags === OPTION_FLAG_SYNC).assertFalse();
      expect(option.isSync()).assertTrue();
    });

    /**
     * @tc.name          optionContractZeroFlagWithSyncTrue
     * @tc.desc          Flag 0 plus sync true remains synchronous.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Construct flag 0 with sync true.
     *                   2. Query isSync.
     *                   3. Check the description tail.
     * @tc.expected      The option is synchronous and describes '/true'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractZeroFlagWithSyncTrue', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_SYNC, 0, true);
      expect(option.isSync()).assertTrue();
      expect(option.sync).assertTrue();
      expect(option.flags).assertEqual(0);
      expect(option.describe()).assertEqual('0/0/true');
      expect(option.describe().startsWith('0/')).assertTrue();
      expect(option.describe().endsWith('/true')).assertTrue();
      expect(option.isSync()).assertEqual(new MessageOptionModel().isSync());
      expect(option.describe() === new MessageOptionModel().describe()).assertFalse();
    });

    /**
     * @tc.name          optionContractArbitraryFlagIsAsync
     * @tc.desc          Any non-zero flag without sync true is asynchronous.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Construct options with flags 2 and 99.
     *                   2. Query isSync for each.
     *                   3. Compare descriptions.
     * @tc.expected      Both arbitrary flags report asynchronous mode.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractArbitraryFlagIsAsync', 0, () => {
      const two = new MessageOptionModel(2, 0, false);
      const large = new MessageOptionModel(99, 0, false);
      expect(two.isSync()).assertFalse();
      expect(large.isSync()).assertFalse();
      expect(two.flags).assertEqual(2);
      expect(large.flags).assertEqual(99);
      expect(two.describe()).assertEqual('2/0/false');
      expect(large.describe()).assertEqual('99/0/false');
      expect(two.describe() === large.describe()).assertFalse();
      expect(OPTION_FLAG_ASYNC).assertLess(two.flags);
    });

    /**
     * @tc.name          optionContractNegativeFlagIsAsync
     * @tc.desc          A negative flag value is not the synchronous constant.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Construct flag -1.
     *                   2. Query isSync.
     *                   3. Compare flags with the sync constant.
     * @tc.expected      The negative flag reports asynchronous mode.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractNegativeFlagIsAsync', 0, () => {
      const option = new MessageOptionModel(UNKNOWN_CODE_NEGATIVE, 0, false);
      expect(option.flags).assertEqual(-1);
      expect(option.isSync()).assertFalse();
      expect(option.sync).assertFalse();
      expect(option.flags === OPTION_FLAG_SYNC).assertFalse();
      expect(option.describe()).assertEqual('-1/0/false');
      expect(option.describe().startsWith('-1/')).assertTrue();
      expect(option.isSync()).assertEqual(option.flags === 0);
      expect(option.waitTime).assertEqual(0);
    });

    /**
     * @tc.name          optionContractWaitTimeStored
     * @tc.desc          A positive wait time is preserved in the option description.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Construct an option with waitTime 250.
     *                   2. Read the field and description.
     *                   3. Compare the middle segment.
     * @tc.expected      The wait time is 250 and appears in the description.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractWaitTimeStored', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_SYNC, 250, false);
      expect(option.waitTime).assertEqual(250);
      expect(option.describe()).assertEqual('0/250/false');
      expect(option.describe().split('/')[1]).assertEqual('250');
      expect(option.describe().split('/').length).assertEqual(3);
      expect(option.isSync()).assertTrue();
      expect(option.waitTime).assertLarger(0);
      expect(option.describe().indexOf('250')).assertEqual(2);
      expect(option.describe()).assertContain('/250/');
    });

    /**
     * @tc.name          optionContractNegativeWaitTimeStored
     * @tc.desc          A negative wait time is stored without validation.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Construct an option with waitTime -5.
     *                   2. Read the field and description.
     *                   3. Verify isSync remains unaffected.
     * @tc.expected      The description carries the raw negative wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractNegativeWaitTimeStored', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, -5, false);
      expect(option.waitTime).assertEqual(-5);
      expect(option.describe()).assertEqual('1/-5/false');
      expect(option.describe().indexOf('-5')).assertEqual(2);
      expect(option.waitTime).assertLess(0);
      expect(option.isSync()).assertFalse();
      expect(option.flags).assertEqual(1);
      expect(option.describe().split('/')[1]).assertEqual('-5');
      expect(option.describe().length).assertEqual(10);
    });

    /**
     * @tc.name          optionContractLargeWaitTimeStored
     * @tc.desc          A large wait time is preserved exactly.
     * @tc.precondition  The option model is available.
     * @tc.steps         1. Construct an option with waitTime 1000000.
     *                   2. Read the description.
     *                   3. Compare the numeric field.
     * @tc.expected      The description contains the full large wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractLargeWaitTimeStored', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, 1000000, false);
      expect(option.waitTime).assertEqual(1000000);
      expect(option.describe()).assertEqual('1/1000000/false');
      expect(option.describe().split('/')[1]).assertEqual('1000000');
      expect(option.describe().length).assertEqual(15);
      expect(option.isSync()).assertFalse();
      expect(option.waitTime).assertLarger(250);
      expect(option.describe().endsWith('/false')).assertTrue();
      expect(String(option.waitTime)).assertEqual('1000000');
    });
    /**
     * @tc.name          optionContractDescribeFormatSync
     * @tc.desc          The sync description joins flags, wait time and sync with slashes.
     * @tc.precondition  A default option.
     * @tc.steps         1. Read the description.
     *                   2. Split on slashes.
     *                   3. Compare each segment.
     * @tc.expected      The three segments are '0', '0' and 'false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractDescribeFormatSync', 0, () => {
      const option = new MessageOptionModel();
      const parts = option.describe().split('/');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual('0');
      expect(parts[1]).assertEqual('0');
      expect(parts[2]).assertEqual('false');
      expect(option.describe()).assertEqual('0/0/false');
      expect(option.describe().length).assertEqual(9);
      expect(joined(parts, '/')).assertEqual(option.describe());
      expect(parts[2] === 'true').assertFalse();
    });

    /**
     * @tc.name          optionContractDescribeFormatAsync
     * @tc.desc          An async description carries flag 1 and the wait time.
     * @tc.precondition  An async option with waitTime 42.
     * @tc.steps         1. Build the option.
     *                   2. Split the description.
     *                   3. Compare segments and length.
     * @tc.expected      The description is '1/42/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractDescribeFormatAsync', 0, () => {
      const option = asyncOption(42);
      const parts = option.describe().split('/');
      expect(option.describe()).assertEqual('1/42/false');
      expect(parts[0]).assertEqual('1');
      expect(parts[1]).assertEqual('42');
      expect(parts[2]).assertEqual('false');
      expect(option.describe().length).assertEqual(10);
      expect(option.describe().startsWith('1/')).assertTrue();
      expect(option.isSync()).assertFalse();
      expect(joined(parts, '/')).assertEqual('1/42/false');
    });

    /**
     * @tc.name          optionContractDescribeChangesWithFlags
     * @tc.desc          Changing the flags field changes the description prefix.
     * @tc.precondition  A mutable option instance.
     * @tc.steps         1. Construct a sync option.
     *                   2. Set flags to 1.
     *                   3. Compare descriptions and isSync.
     * @tc.expected      The description moves from '0/...' to '1/...'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractDescribeChangesWithFlags', 0, () => {
      const option = syncOption();
      const before = option.describe();
      expect(before).assertEqual('0/0/false');
      option.flags = OPTION_FLAG_ASYNC;
      expect(option.flags).assertEqual(1);
      expect(option.describe()).assertEqual('1/0/false');
      expect(option.describe() === before).assertFalse();
      expect(option.isSync()).assertFalse();
      option.flags = OPTION_FLAG_SYNC;
      expect(option.describe()).assertEqual(before);
      expect(option.isSync()).assertTrue();
      expect(option.sync).assertFalse();
    });

    /**
     * @tc.name          optionContractDescribeChangesWithWaitTime
     * @tc.desc          Changing the wait time changes only the middle segment.
     * @tc.precondition  A mutable async option.
     * @tc.steps         1. Construct an async option with waitTime 0.
     *                   2. Set waitTime to 800.
     *                   3. Compare segments.
     * @tc.expected      The prefix and suffix stay fixed while the middle changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractDescribeChangesWithWaitTime', 0, () => {
      const option = asyncOption(0);
      const before = option.describe().split('/');
      option.waitTime = 800;
      const after = option.describe().split('/');
      expect(before[1]).assertEqual('0');
      expect(after[1]).assertEqual('800');
      expect(after[0]).assertEqual(before[0]);
      expect(after[2]).assertEqual(before[2]);
      expect(option.describe()).assertEqual('1/800/false');
      expect(option.isSync()).assertFalse();
      expect(option.waitTime).assertEqual(800);
      expect(after.length).assertEqual(3);
    });

    /**
     * @tc.name          optionContractDescribeHasTwoSeparators
     * @tc.desc          The description contains exactly two slash separators.
     * @tc.precondition  Several option instances.
     * @tc.steps         1. Describe sync and async options.
     *                   2. Count slashes in each.
     *                   3. Compare slash positions.
     * @tc.expected      Every description has two slashes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractDescribeHasTwoSeparators', 0, () => {
      const defaultOption = new MessageOptionModel();
      const async = asyncOption(7);
      const sync = syncOption();
      expect(countOf(['/'], '/') * 3).assertEqual(3);
      expect(defaultOption.describe().split('/').length - 1).assertEqual(2);
      expect(async.describe().split('/').length - 1).assertEqual(2);
      expect(sync.describe().indexOf('/')).assertEqual(1);
      expect(sync.describe().lastIndexOf('/')).assertEqual(3);
      expect(sync.describe().indexOf('/') < sync.describe().lastIndexOf('/')).assertTrue();
      expect(async.describe().split('/').length).assertEqual(3);
      expect(defaultOption.describe().split('/').length).assertEqual(3);
    });

    /**
     * @tc.name          optionContractSyncOptionRecordedOnHandled
     * @tc.desc          A sync option string is stored on a handled request.
     * @tc.precondition  A manual exchange with a sync option.
     * @tc.steps         1. Invoke the stub with code 1.
     *                   2. Read the ledger option.
     *                   3. Compare with the option description.
     * @tc.expected      The ledger stores '0/0/false' and the reply is written.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractSyncOptionRecordedOnHandled', 0, () => {
      const option = syncOption();
      const recorded = recordedOptionOf(REQUEST_CODE, option);
      expect(recorded).assertEqual('0/0/false');
      expect(recorded).assertEqual(option.describe());
      expect(option.isSync()).assertTrue();
      expect(handledWithOption(REQUEST_CODE, syncOption())).assertTrue();
      expect(replyWithOption(REQUEST_CODE, syncOption())).assertEqual(REPLY_PAYLOAD);
      expect(recorded.split('/')[0]).assertEqual('0');
      expect(recorded.endsWith('/false')).assertTrue();
    });

    /**
     * @tc.name          optionContractAsyncOptionRecordedOnHandled
     * @tc.desc          An async option string is stored on a handled request.
     * @tc.precondition  A manual exchange with an async option.
     * @tc.steps         1. Invoke the stub with code 1 and waitTime 250.
     *                   2. Read the ledger option.
     *                   3. Compare reply and option.
     * @tc.expected      The ledger stores '1/250/false' and handling succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractAsyncOptionRecordedOnHandled', 0, () => {
      const option = asyncOption(250);
      const recorded = recordedOptionOf(REQUEST_CODE, option);
      expect(recorded).assertEqual('1/250/false');
      expect(recorded).assertEqual(option.describe());
      expect(recorded).assertContain('250');
      expect(option.isSync()).assertFalse();
      expect(handledWithOption(REQUEST_CODE, option)).assertTrue();
      expect(replyWithOption(REQUEST_CODE, option)).assertEqual(REPLY_PAYLOAD);
      expect(recorded === syncOption().describe()).assertFalse();
      expect(recorded.split('/')[0]).assertEqual('1');
    });

    /**
     * @tc.name          optionContractSyncOptionRecordedOnRejected
     * @tc.desc          A sync option string is stored even when the code is refused.
     * @tc.precondition  A manual exchange with an unknown code.
     * @tc.steps         1. Invoke the stub with code 0.
     *                   2. Read the ledger option.
     *                   3. Check reply and handled flag.
     * @tc.expected      The rejected entry still stores '0/0/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractSyncOptionRecordedOnRejected', 0, () => {
      const option = syncOption();
      const recorded = recordedOptionOf(UNKNOWN_CODE_ZERO, option);
      expect(recorded).assertEqual('0/0/false');
      expect(recorded).assertEqual(option.describe());
      expect(handledWithOption(UNKNOWN_CODE_ZERO, option)).assertFalse();
      expect(replyWithOption(UNKNOWN_CODE_ZERO, option)).assertEqual('');
      expect(option.isSync()).assertTrue();
      expect(recorded.split('/')[2]).assertEqual('false');
      expect(recorded.length).assertEqual(9);
    });
    /**
     * @tc.name          optionContractAsyncOptionRecordedOnRejected
     * @tc.desc          An async option string is stored when the code is refused.
     * @tc.precondition  A manual exchange with code 99 and waitTime 60.
     * @tc.steps         1. Invoke the stub with code 99.
     *                   2. Read the ledger option.
     *                   3. Confirm no reply was produced.
     * @tc.expected      The rejected entry stores '1/60/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractAsyncOptionRecordedOnRejected', 0, () => {
      const option = asyncOption(60);
      const recorded = recordedOptionOf(UNKNOWN_CODE_LARGE, option);
      expect(recorded).assertEqual('1/60/false');
      expect(recorded).assertEqual(option.describe());
      expect(handledWithOption(UNKNOWN_CODE_LARGE, option)).assertFalse();
      expect(replyWithOption(UNKNOWN_CODE_LARGE, option)).assertEqual('');
      expect(recorded.split('/')[1]).assertEqual('60');
      expect(recorded.startsWith('1/')).assertTrue();
      expect(option.isSync()).assertFalse();
      expect(recorded === '0/0/false').assertFalse();
    });

    /**
     * @tc.name          optionContractKilledStubRecordsOption
     * @tc.desc          Requests against a dead stub still record their option string.
     * @tc.precondition  A stub killed before the manual exchange.
     * @tc.steps         1. Kill the stub.
     *                   2. Invoke it with an async option.
     *                   3. Read the ledger entry option.
     * @tc.expected      The failed entry stores the async option string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractKilledStubRecordsOption', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      const option = asyncOption(15);
      data.writeString(REQUEST_PAYLOAD);
      stub.kill();
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      expect(handled).assertFalse();
      expect(stub.requestCount()).assertEqual(1);
      const record = stub.lastRequest();
      expect(record !== undefined).assertTrue();
      if (record !== undefined) {
        expect(record.option).assertEqual('1/15/false');
        expect(record.handled).assertFalse();
        expect(record.code).assertEqual(REQUEST_CODE);
      }
      expect(data.readCount).assertEqual(0);
      expect(reply.writeCount).assertEqual(0);
    });

    /**
     * @tc.name          optionContractRejectListRecordsOption
     * @tc.desc          A reject-list refusal records the supplied option string.
     * @tc.precondition  A stub whose reject list holds code 1.
     * @tc.steps         1. Add code 1 to the reject list.
     *                   2. Invoke stub with a sync option.
     *                   3. Read the ledger option.
     * @tc.expected      The entry records '0/0/false' and no reply is written.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractRejectListRecordsOption', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      const option = syncOption();
      data.writeString(REQUEST_PAYLOAD);
      stub.rejectCodes.push(REQUEST_CODE);
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      expect(handled).assertFalse();
      expect(stub.requests[0].option).assertEqual('0/0/false');
      expect(stub.requests[0].handled).assertFalse();
      expect(reply.writeCount).assertEqual(0);
      expect(data.readCount).assertEqual(0);
      expect(option.isSync()).assertTrue();
      expect(stub.rejectCodes.length).assertEqual(1);
      expect(stub.requests[0].replyText).assertEqual('');
    });

    /**
     * @tc.name          optionContractOptionDoesNotChangeReply
     * @tc.desc          Sync and async options yield the same production reply.
     * @tc.precondition  Manual exchanges with both option modes.
     * @tc.steps         1. Exchange code 1 with a sync option.
     *                   2. Exchange code 1 with an async option.
     *                   3. Compare the replies.
     * @tc.expected      Both replies are 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractOptionDoesNotChangeReply', 0, () => {
      const syncReply = replyWithOption(REQUEST_CODE, syncOption());
      const asyncReply = replyWithOption(REQUEST_CODE, asyncOption(500));
      expect(syncReply).assertEqual(REPLY_PAYLOAD);
      expect(asyncReply).assertEqual(REPLY_PAYLOAD);
      expect(syncReply).assertEqual(asyncReply);
      expect(syncReply.length).assertEqual(9);
      expect(asyncReply.length).assertEqual(9);
      expect(syncReply).assertEqual('hello rpc');
      expect(syncOption().describe() === asyncOption(500).describe()).assertFalse();
      expect(syncReply === asyncReply).assertTrue();
    });

    /**
     * @tc.name          optionContractOptionDoesNotChangeHandledFlag
     * @tc.desc          The handled flag depends on the code, never on the option.
     * @tc.precondition  Manual exchanges with both option modes and codes.
     * @tc.steps         1. Evaluate code 1 with sync and async options.
     *                   2. Evaluate code 2 with sync and async options.
     *                   3. Compare the flags.
     * @tc.expected      Code 1 is handled and code 2 is refused in both modes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractOptionDoesNotChangeHandledFlag', 0, () => {
      expect(handledWithOption(REQUEST_CODE, syncOption())).assertTrue();
      expect(handledWithOption(REQUEST_CODE, asyncOption(30))).assertTrue();
      expect(handledWithOption(UNKNOWN_CODE_TWO, syncOption())).assertFalse();
      expect(handledWithOption(UNKNOWN_CODE_TWO, asyncOption(30))).assertFalse();
      expect(handledWithOption(REQUEST_CODE, syncOption())).assertEqual(
        handledWithOption(REQUEST_CODE, asyncOption(30)));
      expect(handledWithOption(UNKNOWN_CODE_TWO, syncOption())).assertEqual(
        handledWithOption(UNKNOWN_CODE_TWO, asyncOption(30)));
      expect(handledWithOption(UNKNOWN_CODE_ZERO, new MessageOptionModel(2, 9, true))).assertFalse();
      expect(handledWithOption(REQUEST_CODE, new MessageOptionModel(-7, -9, true))).assertTrue();
    });

    /**
     * @tc.name          optionContractClientDefaultOptionRecorded
     * @tc.desc          InProcessClient sends a default sync option for every request.
     * @tc.precondition  A client with one successful send.
     * @tc.steps         1. Send code 1 through the client.
     *                   2. Read the recorded option.
     *                   3. Compare with a default option.
     * @tc.expected      The client records the default '0/0/false' option.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractClientDefaultOptionRecorded', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(client.stub.requests[0].option).assertEqual('0/0/false');
      expect(client.stub.requests[0].option).assertEqual(new MessageOptionModel().describe());
      expect(client.stub.requests[0].option).assertEqual(syncOption().describe());
      expect(client.stub.requests[0].option).assertContain('0/0');
      expect(new MessageOptionModel().isSync()).assertTrue();
      expect(client.stub.requests[0].handled).assertTrue();
      expect(client.stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          optionContractClientSendManyDefaultOptions
     * @tc.desc          sendMany records the default option for every request.
     * @tc.precondition  A client sending four requests.
     * @tc.steps         1. Call sendMany with count 4.
     *                   2. Walk the ledger option strings.
     *                   3. Count matches with the default description.
     * @tc.expected      All four entries record '0/0/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractClientSendManyDefaultOptions', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.sendMany(4, REQUEST_CODE);
      expect(client.stub.requestCount()).assertEqual(4);
      let defaults = 0;
      for (let index = 0; index < client.stub.requests.length; index++) {
        if (client.stub.requests[index].option === '0/0/false') {
          defaults = defaults + 1;
        }
      }
      expect(defaults).assertEqual(4);
      const options: string[] = [];
      for (let index = 0; index < client.stub.requests.length; index++) {
        options.push(client.stub.requests[index].option);
      }
      expect(countOf(options, '0/0/false')).assertEqual(4);
      expect(options.length).assertEqual(4);
      expect(client.stub.requests[0].option).assertEqual(client.stub.requests[3].option);
      expect(client.results.length).assertEqual(4);
      expect(client.replies.length).assertEqual(4);
      expect(client.stub.requests[1].option.length).assertEqual(9);
    });

    /**
     * @tc.name          optionContractRecordedOptionSnapshotAfterMutation
     * @tc.desc          The ledger keeps the option string captured at request time.
     * @tc.precondition  A manual exchange followed by an option mutation.
     * @tc.steps         1. Invoke the stub with waitTime 10.
     *                   2. Mutate the option wait time.
     *                   3. Compare the ledger and live descriptions.
     * @tc.expected      The ledger keeps '1/10/false' while the option changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractRecordedOptionSnapshotAfterMutation', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      const option = asyncOption(10);
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, option);
      expect(stub.requests[0].option).assertEqual('1/10/false');
      option.waitTime = 20;
      option.flags = OPTION_FLAG_SYNC;
      expect(option.describe()).assertEqual('0/20/false');
      expect(stub.requests[0].option).assertEqual('1/10/false');
      expect(stub.requests[0].option === option.describe()).assertFalse();
      expect(stub.requests[0].option).assertContain('10');
      expect(option.isSync()).assertTrue();
    });
    /**
     * @tc.name          optionContractTwoOptionsIndependent
     * @tc.desc          Two option instances keep their own field values.
     * @tc.precondition  One sync and one async option.
     * @tc.steps         1. Construct both options.
     *                   2. Read fields from each.
     *                   3. Compare descriptions.
     * @tc.expected      Each option preserves its own flags and wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractTwoOptionsIndependent', 0, () => {
      const first = syncOption();
      const second = asyncOption(300);
      expect(first.flags).assertEqual(0);
      expect(second.flags).assertEqual(1);
      expect(first.waitTime).assertEqual(0);
      expect(second.waitTime).assertEqual(300);
      expect(first.describe()).assertEqual('0/0/false');
      expect(second.describe()).assertEqual('1/300/false');
      expect(first.describe() === second.describe()).assertFalse();
      expect(first.isSync()).assertEqual(!second.isSync());
    });

    /**
     * @tc.name          optionContractMutationDoesNotAffectOtherOption
     * @tc.desc          Mutating one option leaves a second instance unchanged.
     * @tc.precondition  Two default options.
     * @tc.steps         1. Construct two options.
     *                   2. Mutate the first aggressively.
     *                   3. Compare the second with its default.
     * @tc.expected      The second option still describes '0/0/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractMutationDoesNotAffectOtherOption', 0, () => {
      const first = new MessageOptionModel();
      const second = new MessageOptionModel();
      first.flags = 9;
      first.waitTime = 900;
      first.sync = true;
      expect(first.describe()).assertEqual('9/900/true');
      expect(second.describe()).assertEqual('0/0/false');
      expect(second.flags).assertEqual(0);
      expect(second.waitTime).assertEqual(0);
      expect(second.sync).assertFalse();
      expect(second.isSync()).assertTrue();
      expect(first.isSync()).assertTrue();
      expect(first === second).assertFalse();
    });

    /**
     * @tc.name          optionContractOptionDescribeStable
     * @tc.desc          Repeated description calls return the same string.
     * @tc.precondition  A sync option instance.
     * @tc.steps         1. Describe the option three times.
     *                   2. Compare the results.
     *                   3. Check fingerprint stability.
     * @tc.expected      All descriptions are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractOptionDescribeStable', 0, () => {
      const option = asyncOption(77);
      const first = option.describe();
      const second = option.describe();
      const third = option.describe();
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(first).assertEqual('1/77/false');
      expect(textFingerprint(first)).assertEqual(textFingerprint(third));
      expect(first.length).assertEqual(10);
      expect(option.waitTime).assertEqual(77);
      expect(option.isSync()).assertFalse();
    });

    /**
     * @tc.name          optionContractIsSyncFormulaMatrix
     * @tc.desc          isSync equals flags being zero or the sync boolean being set.
     * @tc.precondition  A list of representative flag values.
     * @tc.steps         1. For each flag build an option without sync.
     *                   2. Evaluate isSync.
     *                   3. Count formula mismatches.
     * @tc.expected      The model matches the formula for every flag.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractIsSyncFormulaMatrix', 0, () => {
      const flags: number[] = [-1, 0, 1, 2, 99];
      let mismatches = 0;
      for (let index = 0; index < flags.length; index++) {
        const option = new MessageOptionModel(flags[index], 0, false);
        const oracle = flags[index] === OPTION_FLAG_SYNC;
        if (option.isSync() !== oracle) {
          mismatches = mismatches + 1;
        }
      }
      expect(mismatches).assertEqual(0);
      expect(new MessageOptionModel(0, 0, false).isSync()).assertTrue();
      expect(new MessageOptionModel(1, 0, false).isSync()).assertFalse();
      expect(new MessageOptionModel(2, 0, false).isSync()).assertFalse();
      expect(new MessageOptionModel(99, 0, false).isSync()).assertFalse();
      expect(new MessageOptionModel(-1, 0, false).isSync()).assertFalse();
    });

    /**
     * @tc.name          optionContractSyncBoolTrueAlwaysSync
     * @tc.desc          With sync true every flag value reports synchronous mode.
     * @tc.precondition  A list of representative flag values.
     * @tc.steps         1. For each flag build an option with sync true.
     *                   2. Evaluate isSync.
     *                   3. Count synchronous results.
     * @tc.expected      Every option reports synchronous mode.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractSyncBoolTrueAlwaysSync', 0, () => {
      const flags: number[] = [-1, 0, 1, 2, 99];
      let synchronous = 0;
      for (let index = 0; index < flags.length; index++) {
        const option = new MessageOptionModel(flags[index], 0, true);
        if (option.isSync()) {
          synchronous = synchronous + 1;
        }
        expect(option.describe().endsWith('/true')).assertTrue();
      }
      expect(synchronous).assertEqual(5);
      expect(synchronous).assertEqual(flags.length);
      expect(new MessageOptionModel(99, 0, true).isSync()).assertTrue();
      expect(new MessageOptionModel(1, 0, true).isSync()).assertTrue();
      expect(new MessageOptionModel(0, 0, true).isSync()).assertTrue();
      expect(new MessageOptionModel(2, 5, true).describe()).assertEqual('2/5/true');
    });

    /**
     * @tc.name          optionContractZeroFlagWithSyncFalseIsSync
     * @tc.desc          Flag 0 without a sync boolean still reports synchronous mode.
     * @tc.precondition  A default and an explicit zero-flag option.
     * @tc.steps         1. Construct both options.
     *                   2. Compare isSync and fields.
     *                   3. Compare descriptions.
     * @tc.expected      Both options are synchronous with identical fields.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractZeroFlagWithSyncFalseIsSync', 0, () => {
      const implicit = new MessageOptionModel();
      const explicit = new MessageOptionModel(0, 0, false);
      expect(implicit.isSync()).assertTrue();
      expect(explicit.isSync()).assertTrue();
      expect(implicit.flags).assertEqual(explicit.flags);
      expect(implicit.waitTime).assertEqual(explicit.waitTime);
      expect(implicit.sync).assertEqual(explicit.sync);
      expect(implicit.describe()).assertEqual(explicit.describe());
      expect(implicit.describe()).assertEqual('0/0/false');
      expect(implicit === explicit).assertFalse();
    });

    /**
     * @tc.name          optionContractWaitTimeDoesNotAffectSync
     * @tc.desc          Varying the wait time never changes the sync classification.
     * @tc.precondition  A list of wait times.
     * @tc.steps         1. For each wait time build a sync option.
     *                   2. For each build an async option.
     *                   3. Count classification mismatches.
     * @tc.expected      Sync stays true and async stays false for every wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractWaitTimeDoesNotAffectSync', 0, () => {
      const waits: number[] = [0, 1, 250, 999, -3];
      let syncCount = 0;
      let asyncCount = 0;
      for (let index = 0; index < waits.length; index++) {
        const sync = new MessageOptionModel(OPTION_FLAG_SYNC, waits[index], false);
        const async = new MessageOptionModel(OPTION_FLAG_ASYNC, waits[index], false);
        if (sync.isSync()) {
          syncCount = syncCount + 1;
        }
        if (!async.isSync()) {
          asyncCount = asyncCount + 1;
        }
        expect(sync.waitTime).assertEqual(waits[index]);
        expect(async.waitTime).assertEqual(waits[index]);
      }
      expect(syncCount).assertEqual(5);
      expect(asyncCount).assertEqual(5);
      expect(syncCount).assertEqual(waits.length);
      expect(asyncCount).assertEqual(waits.length);
      expect(OPTION_FLAG_SYNC === 0).assertTrue();
    });

    /**
     * @tc.name          optionContractOptionRecordedPerRequestInSequence
     * @tc.desc          Consecutive requests record each distinct option string.
     * @tc.precondition  One stub receiving two differently configured options.
     * @tc.steps         1. Invoke with a sync option.
     *                   2. Invoke with an async option.
     *                   3. Compare both ledger entries.
     * @tc.expected      The entries store '0/0/false' then '1/250/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionRecordedPerRequestInSequence', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const firstReply = MessageSequenceModel.create();
      const secondReply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, firstReply, syncOption());
      stub.onRemoteMessageRequest(REQUEST_CODE, data, secondReply, asyncOption(250));
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].option).assertEqual('0/0/false');
      expect(stub.requests[1].option).assertEqual('1/250/false');
      expect(stub.requests[0].option === stub.requests[1].option).assertFalse();
      expect(stub.requests[0].handled).assertTrue();
      expect(stub.requests[1].handled).assertTrue();
      expect(firstReply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(secondReply.readString()).assertEqual(REPLY_PAYLOAD);
    });
    /**
     * @tc.name          optionContractOptionOnUnknownMatrixRecordsDefault
     * @tc.desc          The client default option is recorded for every unknown code.
     * @tc.precondition  A client and the four unknown codes.
     * @tc.steps         1. Send the four unknown codes through one client.
     *                   2. Walk the recorded options.
     *                   3. Count non-default entries.
     * @tc.expected      Every rejected entry records '0/0/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionOnUnknownMatrixRecordsDefault', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const codes: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], REQUEST_PAYLOAD);
      }
      let nonDefault = 0;
      for (let index = 0; index < client.stub.requests.length; index++) {
        if (client.stub.requests[index].option !== '0/0/false') {
          nonDefault = nonDefault + 1;
        }
      }
      expect(client.stub.requestCount()).assertEqual(4);
      expect(nonDefault).assertEqual(0);
      expect(client.stub.requests[0].option).assertEqual('0/0/false');
      expect(client.stub.requests[3].option).assertEqual('0/0/false');
      expect(client.replies.length).assertEqual(0);
      expect(client.results[0].isSuccess()).assertFalse();
      expect(client.results[3].isSuccess()).assertFalse();
    });

    /**
     * @tc.name          optionContractOptionAfterResetRecordsFresh
     * @tc.desc          Reset clears old option strings before new requests arrive.
     * @tc.precondition  A stub with two recorded requests that is reset.
     * @tc.steps         1. Record two different options.
     *                   2. Reset the stub.
     *                   3. Record one new option.
     * @tc.expected      Only the new option remains in the ledger.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionAfterResetRecordsFresh', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, syncOption());
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, asyncOption(9));
      expect(stub.requestCount()).assertEqual(2);
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, asyncOption(123));
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].option).assertEqual('1/123/false');
      expect(stub.requests[0].option === '0/0/false').assertFalse();
      expect(stub.requests[0].handled).assertTrue();
    });

    /**
     * @tc.name          optionContractOptionDoesNotAffectRequestText
     * @tc.desc          The request payload is recorded identically under both options.
     * @tc.precondition  Two manual exchanges with the same payload.
     * @tc.steps         1. Exchange with a sync option.
     *                   2. Exchange with an async option.
     *                   3. Compare recorded request texts.
     * @tc.expected      Both entries store the same payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractOptionDoesNotAffectRequestText', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      const firstData = MessageSequenceModel.create();
      const secondData = MessageSequenceModel.create();
      firstData.writeString(REQUEST_PAYLOAD);
      secondData.writeString(REQUEST_PAYLOAD);
      firstStub.onRemoteMessageRequest(REQUEST_CODE, firstData, MessageSequenceModel.create(), syncOption());
      secondStub.onRemoteMessageRequest(REQUEST_CODE, secondData, MessageSequenceModel.create(), asyncOption(70));
      expect(firstStub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(secondStub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(firstStub.requests[0].text).assertEqual(secondStub.requests[0].text);
      expect(firstData.readCount).assertEqual(1);
      expect(secondData.readCount).assertEqual(1);
      expect(firstStub.requests[0].text.length).assertEqual(11);
      expect(secondStub.requests[0].text.endsWith('world')).assertTrue();
    });

    /**
     * @tc.name          optionContractOptionDoesNotAffectDataReadCount
     * @tc.desc          Data reads are identical for sync and async requests.
     * @tc.precondition  Separate sequences for each mode.
     * @tc.steps         1. Exchange with a sync option.
     *                   2. Exchange with an async option.
     *                   3. Compare read counts and cursors.
     * @tc.expected      Both data sequences record one read and cursor 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionDoesNotAffectDataReadCount', 0, () => {
      const syncData = MessageSequenceModel.create();
      const asyncData = MessageSequenceModel.create();
      syncData.writeString(REQUEST_PAYLOAD);
      asyncData.writeString(REQUEST_PAYLOAD);
      const stub = new StubRemoteObjectModel();
      stub.onRemoteMessageRequest(REQUEST_CODE, syncData, MessageSequenceModel.create(), syncOption());
      stub.onRemoteMessageRequest(REQUEST_CODE, asyncData, MessageSequenceModel.create(), asyncOption(5));
      expect(syncData.readCount).assertEqual(1);
      expect(asyncData.readCount).assertEqual(1);
      expect(syncData.cursor).assertEqual(1);
      expect(asyncData.cursor).assertEqual(1);
      expect(syncData.readString()).assertEqual('');
      expect(asyncData.readString()).assertEqual('');
      expect(syncData.writeCount).assertEqual(1);
      expect(asyncData.writeCount).assertEqual(1);
    });

    /**
     * @tc.name          optionContractOptionDoesNotAffectReplyWriteCount
     * @tc.desc          Reply writes stay at one per handled request for both modes.
     * @tc.precondition  Separate reply sequences for each mode.
     * @tc.steps         1. Exchange with a sync option.
     *                   2. Exchange with an async option.
     *                   3. Compare write counts and sizes.
     * @tc.expected      Both reply sequences hold one write and one value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionDoesNotAffectReplyWriteCount', 0, () => {
      const syncReply = manualReply(syncOption());
      const asyncReply = manualReply(asyncOption(1000));
      expect(syncReply.writeCount).assertEqual(1);
      expect(asyncReply.writeCount).assertEqual(1);
      expect(syncReply.size()).assertEqual(1);
      expect(asyncReply.size()).assertEqual(1);
      expect(syncReply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(asyncReply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(syncReply.readString()).assertEqual(asyncReply.readString());
      expect(syncReply.trace()).assertEqual(asyncReply.trace());
    });

    /**
     * @tc.name          optionContractOptionClientResetClearsRecords
     * @tc.desc          Client reset removes every previously recorded option string.
     * @tc.precondition  A client with two recorded requests.
     * @tc.steps         1. Send code 1 twice.
     *                   2. Reset the client.
     *                   3. Read the stub ledger.
     * @tc.expected      The ledger is empty after the client reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractOptionClientResetClearsRecords', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      client.send(REQUEST_CODE, 'one');
      client.send(REQUEST_CODE, 'two');
      expect(client.stub.requestCount()).assertEqual(2);
      expect(client.stub.requests[0].option).assertEqual('0/0/false');
      client.reset();
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.stub.requests.length).assertEqual(0);
      expect(client.stub.lastRequest() === undefined).assertTrue();
      expect(client.results.length).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      expect(client.trace()).assertEqual('');
    });

    /**
     * @tc.name          optionContractDescribeUsesDecimalStrings
     * @tc.desc          Numeric segments use base-ten string conversion.
     * @tc.precondition  An option with flags 255 and waitTime 1024.
     * @tc.steps         1. Construct the option.
     *                   2. Compare each segment with String(value).
     *                   3. Verify there is no hexadecimal prefix.
     * @tc.expected      Segments read '255' and '1024'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractDescribeUsesDecimalStrings', 0, () => {
      const option = new MessageOptionModel(255, 1024, false);
      const parts = option.describe().split('/');
      expect(parts[0]).assertEqual(String(255));
      expect(parts[0]).assertEqual('255');
      expect(parts[1]).assertEqual(String(1024));
      expect(parts[1]).assertEqual('1024');
      expect(option.describe()).assertEqual('255/1024/false');
      expect(option.describe().indexOf('0xff')).assertEqual(-1);
      expect(option.describe().indexOf('0x400')).assertEqual(-1);
      expect(option.isSync()).assertFalse();
    });

    /**
     * @tc.name          optionContractSyncTrueWithZeroFlagDescribe
     * @tc.desc          A zero flag with sync true is described with the true tail.
     * @tc.precondition  An option with flag 0 and sync true.
     * @tc.steps         1. Construct the option.
     *                   2. Describe it.
     *                   3. Compare the tail and isSync.
     * @tc.expected      The description is '0/120/true'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractSyncTrueWithZeroFlagDescribe', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_SYNC, 120, true);
      expect(option.describe()).assertEqual('0/120/true');
      expect(option.describe().endsWith('/true')).assertTrue();
      expect(option.describe().split('/')[2]).assertEqual('true');
      expect(option.describe().split('/')[1]).assertEqual('120');
      expect(option.isSync()).assertTrue();
      expect(option.sync).assertTrue();
      expect(option.describe() === '0/120/false').assertFalse();
      expect(handledWithOption(REQUEST_CODE, option)).assertTrue();
    });

    /**
     * @tc.name          optionContractSyncTrueAndFalseDescribeDiff
     * @tc.desc          Toggling the sync boolean changes the description tail.
     * @tc.precondition  Two options differing only in the sync boolean.
     * @tc.steps         1. Construct both options.
     *                   2. Compare descriptions and isSync.
     *                   3. Verify shared prefix.
     * @tc.expected      Only the final segment differs between the two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractSyncTrueAndFalseDescribeDiff', 0, () => {
      const withoutSync = new MessageOptionModel(2, 40, false);
      const withSync = new MessageOptionModel(2, 40, true);
      expect(withoutSync.describe()).assertEqual('2/40/false');
      expect(withSync.describe()).assertEqual('2/40/true');
      expect(withoutSync.describe() === withSync.describe()).assertFalse();
      expect(withoutSync.describe().split('/')[0]).assertEqual(withSync.describe().split('/')[0]);
      expect(withoutSync.describe().split('/')[1]).assertEqual(withSync.describe().split('/')[1]);
      expect(withoutSync.describe().split('/')[2] === withSync.describe().split('/')[2]).assertFalse();
      expect(withoutSync.isSync()).assertFalse();
      expect(withSync.isSync()).assertTrue();
    });

    /**
     * @tc.name          optionContractWaitTimeIndependentInstances
     * @tc.desc          Wait times on separate instances do not interfere.
     * @tc.precondition  Two async options with different waits.
     * @tc.steps         1. Construct both options.
     *                   2. Mutate the first wait time.
     *                   3. Compare both descriptions.
     * @tc.expected      The second option keeps its original wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractWaitTimeIndependentInstances', 0, () => {
      const first = asyncOption(11);
      const second = asyncOption(22);
      expect(first.waitTime).assertEqual(11);
      expect(second.waitTime).assertEqual(22);
      first.waitTime = 99;
      expect(first.describe()).assertEqual('1/99/false');
      expect(second.describe()).assertEqual('1/22/false');
      expect(second.waitTime).assertEqual(22);
      expect(second.isSync()).assertFalse();
      expect(first.waitTime === second.waitTime).assertFalse();
      expect(second.describe()).assertContain('22');
    });

    /**
     * @tc.name          optionContractFlagConstantsRelationship
     * @tc.desc          The async flag constant is one greater than the sync constant.
     * @tc.precondition  The two flag constants are available.
     * @tc.steps         1. Read both constants.
     *                   2. Compare their numeric relationship.
     *                   3. Use them to build options.
     * @tc.expected      Sync is 0 and async is 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('optionContractFlagConstantsRelationship', 0, () => {
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      expect(OPTION_FLAG_ASYNC - OPTION_FLAG_SYNC).assertEqual(1);
      expect(OPTION_FLAG_ASYNC).assertLarger(OPTION_FLAG_SYNC);
      expect(new MessageOptionModel(OPTION_FLAG_SYNC).isSync()).assertTrue();
      expect(new MessageOptionModel(OPTION_FLAG_ASYNC).isSync()).assertFalse();
      expect(OPTION_FLAG_SYNC + OPTION_FLAG_ASYNC).assertEqual(1);
      expect(OPTION_FLAG_ASYNC * 2).assertEqual(2);
    });

    /**
     * @tc.name          optionContractDescribeReplayDeterministic
     * @tc.desc          Reconstructing the same option yields the same description.
     * @tc.precondition  No shared mutable state between options.
     * @tc.steps         1. Build three identical async options.
     *                   2. Compare descriptions pairwise.
     *                   3. Compare fingerprints.
     * @tc.expected      All descriptions and fingerprints match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractDescribeReplayDeterministic', 0, () => {
      const first = asyncOption(333);
      const second = asyncOption(333);
      const third = asyncOption(333);
      expect(first.describe()).assertEqual(second.describe());
      expect(second.describe()).assertEqual(third.describe());
      expect(first.describe()).assertEqual('1/333/false');
      expect(textFingerprint(first.describe())).assertEqual(textFingerprint(third.describe()));
      expect(first === second).assertFalse();
      expect(second === third).assertFalse();
      expect(first.describe().length).assertEqual(11);
    });

    /**
     * @tc.name          optionContractOptionRecordedOnRevivedStub
     * @tc.desc          A revived stub records the option of the accepted request.
     * @tc.precondition  A stub killed and then revived.
     * @tc.steps         1. Kill the stub.
     *                   2. Revive it.
     *                   3. Invoke with an async option.
     * @tc.expected      The new entry records the async option and is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionRecordedOnRevivedStub', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.kill();
      stub.revive();
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, asyncOption(88));
      expect(handled).assertTrue();
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].option).assertEqual('1/88/false');
      expect(stub.requests[0].handled).assertTrue();
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(stub.alive).assertTrue();
      expect(data.readCount).assertEqual(1);
    });

    /**
     * @tc.name          optionContractKilledThenRejectedRecordOptions
     * @tc.desc          Sequential dead-stub requests preserve each option string.
     * @tc.precondition  A stub killed before two requests.
     * @tc.steps         1. Kill the stub.
     *                   2. Send different options with codes 1 and 2.
     *                   3. Compare both ledger options.
     * @tc.expected      Both entries are rejected and keep their own options.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractKilledThenRejectedRecordOptions', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.kill();
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), syncOption());
      stub.onRemoteMessageRequest(UNKNOWN_CODE_TWO, data, MessageSequenceModel.create(), asyncOption(4));
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].option).assertEqual('0/0/false');
      expect(stub.requests[1].option).assertEqual('1/4/false');
      expect(stub.requests[0].handled).assertFalse();
      expect(stub.requests[1].handled).assertFalse();
      expect(stub.requests[0].code).assertEqual(REQUEST_CODE);
      expect(stub.requests[1].code).assertEqual(UNKNOWN_CODE_TWO);
      expect(stub.alive).assertFalse();
    });

    /**
     * @tc.name          optionContractOptionAcrossManyRequests
     * @tc.desc          Alternating options produce alternating recorded strings.
     * @tc.precondition  A stub accepting six requests.
     * @tc.steps         1. Send six requests with alternating options.
     *                   2. Walk the ledger options.
     *                   3. Count each option value.
     * @tc.expected      Three sync and three async option strings are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionAcrossManyRequests', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      for (let index = 0; index < 6; index++) {
        const option = index % 2 === 0 ? syncOption() : asyncOption(50);
        stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), option);
      }
      expect(stub.requestCount()).assertEqual(6);
      let syncs = 0;
      let asyncs = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        if (stub.requests[index].option === '0/0/false') {
          syncs = syncs + 1;
        }
        if (stub.requests[index].option === '1/50/false') {
          asyncs = asyncs + 1;
        }
      }
      expect(syncs).assertEqual(3);
      expect(asyncs).assertEqual(3);
      expect(stub.requests[0].option).assertEqual('0/0/false');
      expect(stub.requests[5].option).assertEqual('1/50/false');
      expect(syncs + asyncs).assertEqual(stub.requestCount());
    });
    /**
     * @tc.name          optionContractOptionDescriptionFingerprint
     * @tc.desc          Option descriptions of the same fields share a fingerprint.
     * @tc.precondition  Two options constructed with identical fields.
     * @tc.steps         1. Build both options.
     *                   2. Fingerprint both descriptions.
     *                   3. Compare with the literal fingerprint.
     * @tc.expected      All fingerprints are identical and positive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionDescriptionFingerprint', 0, () => {
      const first = new MessageOptionModel(1, 5, false);
      const second = new MessageOptionModel(1, 5, false);
      const fingerprint = textFingerprint(first.describe());
      expect(fingerprint).assertEqual(textFingerprint(second.describe()));
      expect(fingerprint).assertEqual(textFingerprint('1/5/false'));
      expect(fingerprint).assertLarger(0);
      expect(fingerprint).assertLess(1000003);
      expect(textFingerprint('1/5/true') === fingerprint).assertFalse();
      expect(first.describe()).assertEqual(second.describe());
      expect(first.isSync()).assertFalse();
    });

    /**
     * @tc.name          optionContractOptionClientResultsUnaffected
     * @tc.desc          Client success flags do not depend on option configuration.
     * @tc.precondition  A client using its default option.
     * @tc.steps         1. Send code 1 and code 2.
     *                   2. Compare result flags with the oracle.
     *                   3. Send again with a manual async option.
     * @tc.expected      Results always follow the code, not the option.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractOptionClientResultsUnaffected', 0, () => {
      const client = new InProcessClient(new StubRemoteObjectModel());
      const accepted = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      const refused = client.send(UNKNOWN_CODE_TWO, REQUEST_PAYLOAD);
      expect(accepted.isSuccess()).assertTrue();
      expect(refused.isSuccess()).assertFalse();
      expect(accepted.errCode).assertEqual(0);
      expect(refused.errCode).assertEqual(16000011);
      expect(handledWithOption(REQUEST_CODE, asyncOption())).assertTrue();
      expect(handledWithOption(UNKNOWN_CODE_TWO, asyncOption())).assertFalse();
      expect(client.stub.requests[0].option).assertEqual('0/0/false');
      expect(client.stub.requests[1].option).assertEqual('0/0/false');
    });

    /**
     * @tc.name          optionContractOptionAsyncZeroWaitTime
     * @tc.desc          An async option with zero wait time is still asynchronous.
     * @tc.precondition  The async flag constant is available.
     * @tc.steps         1. Construct async with waitTime 0.
     *                   2. Read the description.
     *                   3. Compare with a sync option.
     * @tc.expected      The option is asynchronous despite the zero wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('optionContractOptionAsyncZeroWaitTime', 0, () => {
      const option = asyncOption(0);
      expect(option.waitTime).assertEqual(0);
      expect(option.flags).assertEqual(OPTION_FLAG_ASYNC);
      expect(option.isSync()).assertFalse();
      expect(option.describe()).assertEqual('1/0/false');
      expect(option.describe() === new MessageOptionModel().describe()).assertFalse();
      expect(option.waitTime).assertEqual(new MessageOptionModel().waitTime);
      expect(option.flags === new MessageOptionModel().flags).assertFalse();
      expect(recordedOptionOf(REQUEST_CODE, option)).assertEqual('1/0/false');
    });

    /**
     * @tc.name          optionContractOptionDescribeAfterSyncFlip
     * @tc.desc          Flipping the sync boolean changes only the tail and isSync.
     * @tc.precondition  A mutable option with flags 3 and waitTime 8.
     * @tc.steps         1. Describe with sync false.
     *                   2. Flip sync to true.
     *                   3. Compare descriptions.
     * @tc.expected      The tail moves from false to true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionDescribeAfterSyncFlip', 0, () => {
      const option = new MessageOptionModel(3, 8, false);
      expect(option.isSync()).assertFalse();
      expect(option.describe()).assertEqual('3/8/false');
      option.sync = true;
      expect(option.isSync()).assertTrue();
      expect(option.describe()).assertEqual('3/8/true');
      expect(option.describe().startsWith('3/8/')).assertTrue();
      expect(option.describe() === '3/8/false').assertFalse();
      option.sync = false;
      expect(option.describe()).assertEqual('3/8/false');
      expect(option.isSync()).assertFalse();
    });

    /**
     * @tc.name          optionContractOptionRecordOptionCount
     * @tc.desc          Each request contributes exactly one option string to the ledger.
     * @tc.precondition  Three manual requests on one stub.
     * @tc.steps         1. Invoke the stub three times.
     *                   2. Count ledger entries and option strings.
     *                   3. Verify the option count equals the request count.
     * @tc.expected      The ledger holds three non-empty option strings.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionRecordOptionCount', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), syncOption());
      stub.onRemoteMessageRequest(UNKNOWN_CODE_ZERO, data, MessageSequenceModel.create(), asyncOption(1));
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), asyncOption(2));
      let nonEmpty = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        if (stub.requests[index].option.length > 0) {
          nonEmpty = nonEmpty + 1;
        }
      }
      expect(stub.requestCount()).assertEqual(3);
      expect(nonEmpty).assertEqual(3);
      expect(stub.requests[0].option).assertEqual('0/0/false');
      expect(stub.requests[1].option).assertEqual('1/1/false');
      expect(stub.requests[2].option).assertEqual('1/2/false');
      expect(stub.requests[2].handled).assertTrue();
      expect(stub.requests[1].handled).assertFalse();
    });

    /**
     * @tc.name          optionContractOptionNegativeWaitTimeAsync
     * @tc.desc          Negative wait times keep the async classification intact.
     * @tc.precondition  An async option with waitTime -250.
     * @tc.steps         1. Construct the option.
     *                   2. Read the description and fields.
     *                   3. Record it through a manual request.
     * @tc.expected      The description is '1/-250/false' and isSync is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionNegativeWaitTimeAsync', 0, () => {
      const option = new MessageOptionModel(OPTION_FLAG_ASYNC, -250, false);
      expect(option.waitTime).assertEqual(-250);
      expect(option.describe()).assertEqual('1/-250/false');
      expect(option.isSync()).assertFalse();
      expect(option.describe().split('/')[1]).assertEqual('-250');
      expect(option.describe().length).assertEqual(12);
      expect(recordedOptionOf(REQUEST_CODE, option)).assertEqual('1/-250/false');
      expect(handledWithOption(REQUEST_CODE, option)).assertTrue();
      expect(option.waitTime).assertLess(0);
    });

    /**
     * @tc.name          optionContractOptionDoesNotRejectKnownCode
     * @tc.desc          No option configuration makes code 1 fail by itself.
     * @tc.precondition  Five distinct option configurations.
     * @tc.steps         1. Evaluate code 1 under each option.
     *                   2. Count successful evaluations.
     *                   3. Count reply matches.
     * @tc.expected      All five configurations handle code 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionDoesNotRejectKnownCode', 0, () => {
      const options: MessageOptionModel[] = [
        new MessageOptionModel(),
        new MessageOptionModel(1, 0, false),
        new MessageOptionModel(1, 100, true),
        new MessageOptionModel(-1, -1, false),
        new MessageOptionModel(2147483647, 0, false)
      ];
      let handled = 0;
      let replies = 0;
      for (let index = 0; index < options.length; index++) {
        if (handledWithOption(REQUEST_CODE, options[index])) {
          handled = handled + 1;
        }
        if (replyWithOption(REQUEST_CODE, options[index]) === REPLY_PAYLOAD) {
          replies = replies + 1;
        }
      }
      expect(handled).assertEqual(5);
      expect(replies).assertEqual(5);
      expect(options.length).assertEqual(5);
      expect(handled).assertEqual(options.length);
      expect(replies).assertEqual(options.length);
      expect(options[4].flags).assertEqual(2147483647);
      expect(options[4].isSync()).assertFalse();
    });

    /**
     * @tc.name          optionContractOptionCombinedFlagsAndSync
     * @tc.desc          Combined flag and sync values follow the documented formula.
     * @tc.precondition  A matrix of flags and sync booleans.
     * @tc.steps         1. Build each combination.
     *                   2. Compare isSync with the formula.
     *                   3. Count mismatches and true results.
     * @tc.expected      The formula holds for all eight combinations.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('optionContractOptionCombinedFlagsAndSync', 0, () => {
      const flags: number[] = [0, 1];
      let mismatches = 0;
      let synchronous = 0;
      for (let flagIndex = 0; flagIndex < flags.length; flagIndex++) {
        for (let syncIndex = 0; syncIndex < 2; syncIndex++) {
          const sync = syncIndex === 1;
          const option = new MessageOptionModel(flags[flagIndex], flagIndex * 10, sync);
          const oracle = sync || flags[flagIndex] === OPTION_FLAG_SYNC;
          if (option.isSync() !== oracle) {
            mismatches = mismatches + 1;
          }
          if (option.isSync()) {
            synchronous = synchronous + 1;
          }
          expect(option.sync).assertEqual(sync);
          expect(option.flags).assertEqual(flags[flagIndex]);
        }
      }
      expect(mismatches).assertEqual(0);
      expect(synchronous).assertEqual(3);
      expect(new MessageOptionModel(0, 0, false).isSync()).assertTrue();
      expect(new MessageOptionModel(1, 0, false).isSync()).assertFalse();
      expect(new MessageOptionModel(1, 0, true).isSync()).assertTrue();
    });
  });
}




