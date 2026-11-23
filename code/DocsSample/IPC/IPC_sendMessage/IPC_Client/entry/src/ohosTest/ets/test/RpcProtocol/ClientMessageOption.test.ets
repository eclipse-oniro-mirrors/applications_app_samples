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

/**
 * MessageOption contract for the IPC client.
 *
 * Index.ets creates `new rpc.MessageOption()` for every sendMessageRequest and
 * never inspects it afterwards. SharedDriver models the option with flags,
 * waitTime and a sync switch. This suite covers default construction, the
 * sync/async classification (flags 0 vs 1), explicit sync overrides, cloning,
 * description formatting, wait times, and the fact that the option has no
 * influence on the reply payload.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  OPTION_FLAG_SYNC,
  OPTION_FLAG_ASYNC,
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  ERROR_NONE,
  ERROR_SEND,
  UNKNOWN_CODE_ZERO,
  MessageOptionModel,
  MessageSequenceModel,
  RequestResultModel,
  ConnectionModel,
  createConnectedSession,
  textFingerprint
} from '../Shared/SharedDriver';

/** Builds an option with all three fields explicit. */
function optionOf(flags: number, waitTime: number, sync: boolean): MessageOptionModel {
  return new MessageOptionModel(flags, waitTime, sync);
}

/** Sends one request with the supplied option and reclaims both sequences. */
function sendWithOption(session: ConnectionModel, option: MessageOptionModel): RequestResultModel {
  const data = MessageSequenceModel.create();
  const reply = MessageSequenceModel.create();
  data.writeString(REQUEST_PAYLOAD);
  const proxy = session.proxy;
  if (proxy === undefined) {
    data.reclaim();
    reply.reclaim();
    return new RequestResultModel(ERROR_NONE, '');
  }
  const result = proxy.sendMessageRequest(REQUEST_CODE, data, reply, option);
  data.reclaim();
  reply.reclaim();
  return result;
}

/** Independent oracle for the sync classification. */
function expectedSync(flags: number, sync: boolean): boolean {
  return sync || flags === 0;
}

/** Counts options classified as async in a list. */
function asyncCount(options: MessageOptionModel[]): number {
  let total = 0;
  for (let index = 0; index < options.length; index++) {
    if (options[index].isAsync()) {
      total = total + 1;
    }
  }
  return total;
}

export default function clientOption(): void {
  describe('ClientMessageOption', () => {
    beforeAll(() => {
      logSuite('ClientMessageOption', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ClientMessageOption', 'end');
    });
    /**
     * @tc.name          clientOptionSyncFlagConstant
     * @tc.desc          The sync flag constant is zero.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read OPTION_FLAG_SYNC. 2. Compare with 0 and 1.
     *                   3. Confirm the async constant differs.
     * @tc.expected      Sync is 0 and async is 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientOptionSyncFlagConstant', 0, () => {
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_SYNC === OPTION_FLAG_ASYNC).assertFalse();
      expect(OPTION_FLAG_SYNC).assertLess(OPTION_FLAG_ASYNC);
      expect(OPTION_FLAG_SYNC + 1).assertEqual(OPTION_FLAG_ASYNC);
      expect(OPTION_FLAG_SYNC >= 0).assertTrue();
    });

    /**
     * @tc.name          clientOptionAsyncFlagConstant
     * @tc.desc          The async flag constant is one.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read OPTION_FLAG_ASYNC. 2. Compare with 1.
     *                   3. Confirm it is above sync.
     * @tc.expected      Async is 1 and greater than sync.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientOptionAsyncFlagConstant', 0, () => {
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      expect(OPTION_FLAG_ASYNC).assertLarger(OPTION_FLAG_SYNC);
      expect(OPTION_FLAG_ASYNC === 0).assertFalse();
      expect(OPTION_FLAG_ASYNC > 0).assertTrue();
      expect(OPTION_FLAG_ASYNC).assertEqual(2 - 1);
    });

    /**
     * @tc.name          clientOptionDefaultConstruction
     * @tc.desc          A default option uses sync flags, zero wait and no sync override.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Construct with no arguments.
     *                   2. Read all three fields.
     *                   3. Compare with the constants.
     * @tc.expected      flags is 0, waitTime is 0 and sync is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientOptionDefaultConstruction', 0, () => {
      const option = new MessageOptionModel();
      expect(option.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(option.waitTime).assertEqual(0);
      expect(option.sync).assertFalse();
      expect(option.flags).assertEqual(0);
      expect(option.describe()).assertEqual('0/0/false');
      expect(option.flags === OPTION_FLAG_ASYNC).assertFalse();
    });

    /**
     * @tc.name          clientOptionDefaultIsSync
     * @tc.desc          The default option classifies as synchronous.
     * @tc.precondition  A default option.
     * @tc.steps         1. Ask isSync. 2. Ask isAsync.
     *                   3. Compare both answers.
     * @tc.expected      isSync is true and isAsync is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientOptionDefaultIsSync', 0, () => {
      const option = new MessageOptionModel();
      expect(option.isSync()).assertTrue();
      expect(option.isAsync()).assertFalse();
      expect(option.isSync() === option.isAsync()).assertFalse();
      expect(option.isSync() || option.isAsync()).assertTrue();
      expect(option.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(option.sync).assertFalse();
    });

    /**
     * @tc.name          clientOptionAsyncFlagsIsAsync
     * @tc.desc          Flags value 1 without an override classifies as async.
     * @tc.precondition  An option built with async flags.
     * @tc.steps         1. Build the option. 2. Ask isAsync.
     *                   3. Ask isSync for contrast.
     * @tc.expected      The option is asynchronous.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionAsyncFlagsIsAsync', 0, () => {
      const option = optionOf(OPTION_FLAG_ASYNC, 0, false);
      expect(option.isAsync()).assertTrue();
      expect(option.isSync()).assertFalse();
      expect(option.flags).assertEqual(1);
      expect(option.sync).assertFalse();
      expect(option.describe()).assertEqual('1/0/false');
    });

    /**
     * @tc.name          clientOptionExplicitSyncOverridesAsyncFlag
     * @tc.desc          The sync switch wins over async flags.
     * @tc.precondition  An option with flags 1 but sync true.
     * @tc.steps         1. Build the option with a sync override.
     *                   2. Ask isSync and isAsync.
     *                   3. Compare the field values.
     * @tc.expected      The option is synchronous despite the async flag.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionExplicitSyncOverridesAsyncFlag', 0, () => {
      const option = optionOf(OPTION_FLAG_ASYNC, 0, true);
      expect(option.flags).assertEqual(OPTION_FLAG_ASYNC);
      expect(option.sync).assertTrue();
      expect(option.isSync()).assertTrue();
      expect(option.isAsync()).assertFalse();
      expect(option.describe()).assertEqual('1/0/true');
      expect(option.isSync() === option.isAsync()).assertFalse();
    });

    /**
     * @tc.name          clientOptionSyncFlagsWithSyncOverride
     * @tc.desc          Setting sync true with sync flags keeps the option synchronous.
     * @tc.precondition  An option with flags 0 and sync true.
     * @tc.steps         1. Build the option. 2. Ask both classifiers.
     *                   3. Inspect the fields.
     * @tc.expected      The option is synchronous with flags 0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionSyncFlagsWithSyncOverride', 0, () => {
      const option = optionOf(OPTION_FLAG_SYNC, 0, true);
      expect(option.isSync()).assertTrue();
      expect(option.isAsync()).assertFalse();
      expect(option.flags).assertEqual(0);
      expect(option.sync).assertTrue();
      expect(option.describe()).assertEqual('0/0/true');
      expect(option.waitTime).assertEqual(0);
    });

    /**
     * @tc.name          clientOptionUnknownFlagsAreAsync
     * @tc.desc          Any flag other than 0 is asynchronous without an override.
     * @tc.precondition  Options with flags 2, 3 and 99.
     * @tc.steps         1. Build all three.
     *                   2. Classify each.
     *                   3. Count the async options.
     * @tc.expected      All three are async.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionUnknownFlagsAreAsync', 0, () => {
      const options: MessageOptionModel[] = [optionOf(2, 0, false), optionOf(3, 0, false),
        optionOf(99, 0, false)];
      expect(options[0].isAsync()).assertTrue();
      expect(options[1].isAsync()).assertTrue();
      expect(options[2].isAsync()).assertTrue();
      expect(asyncCount(options)).assertEqual(3);
      expect(options[0].isSync()).assertFalse();
      expect(options[2].flags).assertEqual(99);
    });

    /**
     * @tc.name          clientOptionCloneCopiesFields
     * @tc.desc          A clone copies flags, wait time and sync state.
     * @tc.precondition  A fully specified option.
     * @tc.steps         1. Build the source. 2. Clone it.
     *                   3. Compare all fields.
     * @tc.expected      The clone matches the source field by field.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionCloneCopiesFields', 0, () => {
      const source = optionOf(OPTION_FLAG_ASYNC, 250, false);
      const clone = source.clone();
      expect(clone.flags).assertEqual(source.flags);
      expect(clone.waitTime).assertEqual(source.waitTime);
      expect(clone.sync).assertEqual(source.sync);
      expect(clone.describe()).assertEqual(source.describe());
      expect(clone.isAsync()).assertEqual(source.isAsync());
      expect(clone === source).assertFalse();
      expect(clone.waitTime).assertEqual(250);
    });

    /**
     * @tc.name          clientOptionCloneIsIndependent
     * @tc.desc          Mutating a clone does not change the source option.
     * @tc.precondition  A source option and its clone.
     * @tc.steps         1. Clone the source. 2. Change clone fields.
     *                   3. Compare with the source.
     * @tc.expected      The source keeps its original values while the clone changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionCloneIsIndependent', 0, () => {
      const source = optionOf(0, 100, false);
      const clone = source.clone();
      clone.flags = OPTION_FLAG_ASYNC;
      clone.waitTime = 900;
      clone.sync = true;
      expect(source.flags).assertEqual(0);
      expect(source.waitTime).assertEqual(100);
      expect(source.sync).assertFalse();
      expect(clone.flags).assertEqual(1);
      expect(clone.waitTime).assertEqual(900);
      expect(clone.sync).assertTrue();
      expect(source.describe()).assertEqual('0/100/false');
    });

    /**
     * @tc.name          clientOptionDescribeFormat
     * @tc.desc          describe joins flags, wait time and sync with slashes.
     * @tc.precondition  A fully specified option.
     * @tc.steps         1. Describe the option. 2. Split on slashes.
     *                   3. Compare each segment.
     * @tc.expected      The description is '1/300/true'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionDescribeFormat', 0, () => {
      const option = optionOf(1, 300, true);
      const parts = option.describe().split('/');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual('1');
      expect(parts[1]).assertEqual('300');
      expect(parts[2]).assertEqual('true');
      expect(option.describe()).assertEqual('1/300/true');
      expect(textFingerprint(option.describe())).assertEqual(textFingerprint('1/300/true'));
    });

    /**
     * @tc.name          clientOptionWaitTimeStored
     * @tc.desc          The waitTime field accepts millisecond values.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Build options with three wait times.
     *                   2. Read each field.
     *                   3. Compare ordering.
     * @tc.expected      Each wait time is stored exactly as supplied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionWaitTimeStored', 0, () => {
      const short = optionOf(0, 10, false);
      const medium = optionOf(0, 500, false);
      const long = optionOf(0, 5000, false);
      expect(short.waitTime).assertEqual(10);
      expect(medium.waitTime).assertEqual(500);
      expect(long.waitTime).assertEqual(5000);
      expect(short.waitTime).assertLess(medium.waitTime);
      expect(medium.waitTime).assertLess(long.waitTime);
      expect(long.describe()).assertEqual('0/5000/false');
    });

    /**
     * @tc.name          clientOptionNegativeWaitTimeStored
     * @tc.desc          A negative wait time is stored without validation.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Build an option with waitTime -1.
     *                   2. Read the field and description.
     *                   3. Classify the option.
     * @tc.expected      The negative value is preserved and the option stays sync.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionNegativeWaitTimeStored', 0, () => {
      const option = optionOf(0, -1, false);
      expect(option.waitTime).assertEqual(-1);
      expect(option.waitTime < 0).assertTrue();
      expect(option.describe()).assertEqual('0/-1/false');
      expect(option.isSync()).assertTrue();
      expect(option.flags).assertEqual(0);
      expect(option.sync).assertFalse();
    });

    /**
     * @tc.name          clientOptionZeroWaitTime
     * @tc.desc          A zero wait time means no explicit allocation.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Build options with zero wait under both flags.
     *                   2. Compare their descriptions.
     *                   3. Confirm the flag difference only.
     * @tc.expected      Both describe zero wait while the flag segment differs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionZeroWaitTime', 0, () => {
      const sync = optionOf(OPTION_FLAG_SYNC, 0, false);
      const async = optionOf(OPTION_FLAG_ASYNC, 0, false);
      expect(sync.waitTime).assertEqual(0);
      expect(async.waitTime).assertEqual(0);
      expect(sync.waitTime).assertEqual(async.waitTime);
      expect(sync.describe()).assertEqual('0/0/false');
      expect(async.describe()).assertEqual('1/0/false');
      expect(sync.isSync()).assertTrue();
      expect(async.isSync()).assertFalse();
    });

    /**
     * @tc.name          clientOptionLargeWaitTime
     * @tc.desc          A large wait time remains exact in the description.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Build an option with waitTime 3600000.
     *                   2. Describe it. 3. Compare the field.
     * @tc.expected      The description contains the full number.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionLargeWaitTime', 0, () => {
      const option = optionOf(1, 3600000, false);
      expect(option.waitTime).assertEqual(3600000);
      expect(option.describe()).assertEqual('1/3600000/false');
      expect(option.describe().indexOf('3600000')).assertLarger(-1);
      expect(option.isAsync()).assertTrue();
      expect(option.waitTime).assertLarger(1000);
      expect(option.flags).assertEqual(1);
    });

    /**
     * @tc.name          clientOptionNegativeFlagsAreAsync
     * @tc.desc          Negative flags count as non-zero and therefore async.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Build an option with flags -1.
     *                   2. Classify it. 3. Inspect the description.
     * @tc.expected      The option is async because the flags differ from zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionNegativeFlagsAreAsync', 0, () => {
      const option = optionOf(-1, 0, false);
      expect(option.flags).assertEqual(-1);
      expect(option.flags === OPTION_FLAG_SYNC).assertFalse();
      expect(option.isSync()).assertFalse();
      expect(option.isAsync()).assertTrue();
      expect(option.describe()).assertEqual('-1/0/false');
      expect(option.sync).assertFalse();
    });

    /**
     * @tc.name          clientOptionSendSyncReplies
     * @tc.desc          A sync option still delivers the stub reply.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send with a sync option.
     *                   2. Read errCode and reply.
     *                   3. Confirm the stub stored the request.
     * @tc.expected      The reply is 'hello rpc' with no error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionSendSyncReplies', 0, () => {
      const session = createConnectedSession();
      const option = optionOf(OPTION_FLAG_SYNC, 0, false);
      const result = sendWithOption(session, option);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
      expect(option.isSync()).assertTrue();
      expect(session.events.countOf('send-ok')).assertEqual(0);
    });

    /**
     * @tc.name          clientOptionSendAsyncReplies
     * @tc.desc          An async option delivers the same reply payload.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send with an async option.
     *                   2. Read errCode and reply.
     *                   3. Compare with the sync case.
     * @tc.expected      The async reply equals the sync reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionSendAsyncReplies', 0, () => {
      const session = createConnectedSession();
      const syncResult = sendWithOption(session, optionOf(0, 0, false));
      const asyncResult = sendWithOption(session, optionOf(1, 0, false));
      const syncReply = syncResult.readReply();
      const asyncReply = asyncResult.readReply();
      expect(syncReply).assertEqual(REPLY_PAYLOAD);
      expect(asyncReply).assertEqual(REPLY_PAYLOAD);
      expect(syncReply).assertEqual(asyncReply);
      expect(syncResult.errCode).assertEqual(asyncResult.errCode);
      expect(asyncResult.errCode).assertEqual(ERROR_NONE);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(2);
      expect(session.proxy?.sendCalls).assertEqual(2);
    });

    /**
     * @tc.name          clientOptionNotMutatedBySend
     * @tc.desc          Sending a request leaves the option unchanged.
     * @tc.precondition  A connected session and a custom option.
     * @tc.steps         1. Record the description before sending.
     *                   2. Send with the option. 3. Compare the description.
     * @tc.expected      The option description and fields are unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionNotMutatedBySend', 0, () => {
      const session = createConnectedSession();
      const option = optionOf(1, 750, false);
      const before = option.describe();
      const result = sendWithOption(session, option);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(option.describe()).assertEqual(before);
      expect(option.flags).assertEqual(1);
      expect(option.waitTime).assertEqual(750);
      expect(option.sync).assertFalse();
      expect(option.isAsync()).assertTrue();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          clientOptionSyncClassificationMatrix
     * @tc.desc          The classifier agrees with an independent oracle for six combos.
     * @tc.precondition  expectedSync oracle and MessageOptionModel.
     * @tc.steps         1. Build six flag/sync combinations.
     *                   2. Compare each classification with the oracle.
     *                   3. Count agreements.
     * @tc.expected      All six combinations agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionSyncClassificationMatrix', 0, () => {
      const flags: number[] = [0, 0, 1, 1, 2, 2];
      const overrides: boolean[] = [false, true, false, true, false, true];
      let agreements = 0;
      for (let index = 0; index < flags.length; index++) {
        const option = optionOf(flags[index], 0, overrides[index]);
        if (option.isSync() === expectedSync(flags[index], overrides[index])) {
          agreements = agreements + 1;
        }
      }
      expect(agreements).assertEqual(6);
      expect(expectedSync(0, false)).assertTrue();
      expect(expectedSync(1, false)).assertFalse();
      expect(expectedSync(1, true)).assertTrue();
      expect(expectedSync(2, false)).assertFalse();
      expect(expectedSync(99, false)).assertFalse();
    });

    /**
     * @tc.name          clientOptionSameInstanceReused
     * @tc.desc          Reusing one option for several sends is safe.
     * @tc.precondition  A connected session and one option.
     * @tc.steps         1. Send three times with the same option.
     *                   2. Read all replies.
     *                   3. Confirm the option fields.
     * @tc.expected      Every send replies and the option stays unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionSameInstanceReused', 0, () => {
      const session = createConnectedSession();
      const option = optionOf(0, 0, false);
      const first = sendWithOption(session, option);
      const second = sendWithOption(session, option);
      const third = sendWithOption(session, option);
      expect(first.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(second.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(third.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(option.describe()).assertEqual('0/0/false');
      expect(session.proxy?.sendCalls).assertEqual(3);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(3);
      expect(option.isAsync()).assertFalse();
    });

    /**
     * @tc.name          clientOptionMixedListCounts
     * @tc.desc          A mixed list of options counts the async members correctly.
     * @tc.precondition  asyncCount helper and MessageOptionModel.
     * @tc.steps         1. Build five options of mixed kinds.
     *                   2. Count async members.
     *                   3. Compare with the sync count.
     * @tc.expected      Exactly two members are async.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionMixedListCounts', 0, () => {
      const options: MessageOptionModel[] = [optionOf(0, 0, false), optionOf(1, 0, false),
        optionOf(0, 0, true), optionOf(2, 0, false), optionOf(1, 0, true)];
      expect(options.length).assertEqual(5);
      expect(asyncCount(options)).assertEqual(2);
      expect(options[0].isSync()).assertTrue();
      expect(options[1].isAsync()).assertTrue();
      expect(options[2].isSync()).assertTrue();
      expect(options[3].isAsync()).assertTrue();
      expect(options[4].isSync()).assertTrue();
    });

    /**
     * @tc.name          clientOptionDoesNotChangeRequestCode
     * @tc.desc          Option choice never changes the request code sent.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send with sync and async options.
     *                   2. Read the recorded request list.
     *                   3. Compare every entry.
     * @tc.expected      All recorded codes equal 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionDoesNotChangeRequestCode', 0, () => {
      const session = createConnectedSession();
      sendWithOption(session, optionOf(0, 0, false));
      sendWithOption(session, optionOf(1, 0, false));
      sendWithOption(session, optionOf(5, 100, true));
      expect(session.proxy?.requests.length).assertEqual(3);
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.requests[1]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.requests[2]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.stub.handledCodes.join(',')).assertEqual('1,1,1');
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(3);
    });

    /**
     * @tc.name          clientOptionAsyncOptionUsesUnknownCode
     * @tc.desc          Option flags do not rescue an unknown request code.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send code 0 with an async option.
     *                   2. Read the result. 3. Confirm the stub text list.
     * @tc.expected      The request fails regardless of the option classification.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionAsyncOptionUsesUnknownCode', 0, () => {
      const session = createConnectedSession();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      const proxy = session.proxy;
      const result = proxy === undefined ? new RequestResultModel(ERROR_SEND, '') :
        proxy.sendMessageRequest(UNKNOWN_CODE_ZERO, data, reply, optionOf(1, 0, false));
      data.reclaim();
      reply.reclaim();
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.reply.isEmpty()).assertTrue();
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.requests[0]).assertEqual(0);
      expect(session.proxy?.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          clientOptionCloneOfDefault
     * @tc.desc          Cloning the default option preserves sync classification.
     * @tc.precondition  A default option.
     * @tc.steps         1. Clone the default. 2. Compare every field.
     *                   3. Confirm both classify as sync.
     * @tc.expected      The clone equals the default description.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionCloneOfDefault', 0, () => {
      const source = new MessageOptionModel();
      const clone = source.clone();
      expect(clone.flags).assertEqual(OPTION_FLAG_SYNC);
      expect(clone.waitTime).assertEqual(0);
      expect(clone.sync).assertFalse();
      expect(clone.describe()).assertEqual(source.describe());
      expect(clone.isSync()).assertTrue();
      expect(clone.isAsync()).assertFalse();
      expect(clone === source).assertFalse();
    });

    /**
     * @tc.name          clientOptionCloneOfAsync
     * @tc.desc          Cloning an async option keeps it asynchronous.
     * @tc.precondition  An async option with a wait time.
     * @tc.steps         1. Clone the option. 2. Compare flags and wait time.
     *                   3. Confirm the clone is async.
     * @tc.expected      The clone remains asynchronous with the same wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionCloneOfAsync', 0, () => {
      const source = optionOf(OPTION_FLAG_ASYNC, 120, false);
      const clone = source.clone();
      expect(clone.flags).assertEqual(OPTION_FLAG_ASYNC);
      expect(clone.waitTime).assertEqual(120);
      expect(clone.isAsync()).assertTrue();
      expect(clone.isSync()).assertFalse();
      expect(clone.describe()).assertEqual('1/120/false');
      expect(source.describe()).assertEqual(clone.describe());
      expect(source.isAsync()).assertTrue();
    });

    /**
     * @tc.name          clientOptionCloneChainIndependent
     * @tc.desc          A clone of a clone stays independent of the original.
     * @tc.precondition  A source option.
     * @tc.steps         1. Clone twice. 2. Mutate the second clone.
     *                   3. Compare the source and first clone.
     * @tc.expected      Only the second clone changes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionCloneChainIndependent', 0, () => {
      const source = optionOf(0, 50, false);
      const first = source.clone();
      const second = first.clone();
      second.flags = 3;
      second.waitTime = 70;
      second.sync = true;
      expect(source.flags).assertEqual(0);
      expect(source.waitTime).assertEqual(50);
      expect(first.flags).assertEqual(0);
      expect(first.waitTime).assertEqual(50);
      expect(second.flags).assertEqual(3);
      expect(second.waitTime).assertEqual(70);
      expect(second.isSync()).assertTrue();
    });

    /**
     * @tc.name          clientOptionDescriptionsDifferPerCombo
     * @tc.desc          Distinct option settings produce distinct descriptions.
     * @tc.precondition  Four different option settings.
     * @tc.steps         1. Build the options. 2. Collect descriptions.
     *                   3. Count unique values.
     * @tc.expected      All four descriptions are unique.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionDescriptionsDifferPerCombo', 0, () => {
      const options: MessageOptionModel[] = [optionOf(0, 0, false), optionOf(1, 0, false),
        optionOf(0, 0, true), optionOf(1, 100, false)];
      const descriptions: string[] = [];
      for (let index = 0; index < options.length; index++) {
        descriptions.push(options[index].describe());
      }
      expect(descriptions[0]).assertEqual('0/0/false');
      expect(descriptions[1]).assertEqual('1/0/false');
      expect(descriptions[2]).assertEqual('0/0/true');
      expect(descriptions[3]).assertEqual('1/100/false');
      expect(descriptions[0] === descriptions[1]).assertFalse();
      expect(descriptions[1] === descriptions[3]).assertFalse();
      expect(textFingerprint(descriptions[3]) > 0).assertTrue();
    });

    /**
     * @tc.name          clientOptionFieldMutationAfterConstruction
     * @tc.desc          Public fields can be reassigned after construction.
     * @tc.precondition  A default option.
     * @tc.steps         1. Reassign all three fields.
     *                   2. Re-classify. 3. Read the description.
     * @tc.expected      The classification follows the new field values.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionFieldMutationAfterConstruction', 0, () => {
      const option = new MessageOptionModel();
      expect(option.isSync()).assertTrue();
      option.flags = 1;
      option.waitTime = 40;
      option.sync = false;
      expect(option.isAsync()).assertTrue();
      expect(option.waitTime).assertEqual(40);
      expect(option.describe()).assertEqual('1/40/false');
      option.flags = 0;
      expect(option.isSync()).assertTrue();
      expect(option.describe()).assertEqual('0/40/false');
    });

    /**
     * @tc.name          clientOptionSyncToggleChangesClassification
     * @tc.desc          Toggling the sync field flips the classification each time.
     * @tc.precondition  An async option without an override.
     * @tc.steps         1. Toggle sync to true. 2. Toggle back to false.
     *                   3. Compare classifications.
     * @tc.expected      The classification alternates with the field.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionSyncToggleChangesClassification', 0, () => {
      const option = optionOf(OPTION_FLAG_ASYNC, 0, false);
      expect(option.isAsync()).assertTrue();
      option.sync = true;
      expect(option.isSync()).assertTrue();
      expect(option.isAsync()).assertFalse();
      expect(option.flags).assertEqual(1);
      option.sync = false;
      expect(option.isAsync()).assertTrue();
      expect(option.isSync()).assertFalse();
      expect(option.flags).assertEqual(1);
    });

    /**
     * @tc.name          clientOptionWaitTimeIndependentOfFlag
     * @tc.desc          Wait time reflects only its own field, not the flags.
     * @tc.precondition  Two options with the same wait time and different flags.
     * @tc.steps         1. Build both. 2. Compare wait times.
     *                   3. Compare classifications.
     * @tc.expected      Wait times match while classifications differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionWaitTimeIndependentOfFlag', 0, () => {
      const sync = optionOf(OPTION_FLAG_SYNC, 250, false);
      const async = optionOf(OPTION_FLAG_ASYNC, 250, false);
      expect(sync.waitTime).assertEqual(async.waitTime);
      expect(sync.waitTime).assertEqual(250);
      expect(sync.isSync()).assertTrue();
      expect(async.isSync()).assertFalse();
      expect(sync.describe() === async.describe()).assertFalse();
      expect(sync.flags === async.flags).assertFalse();
    });

    /**
     * @tc.name          clientOptionAsyncWaitTimeCombination
     * @tc.desc          An async option with a wait time keeps both attributes.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Build flags 1 with waitTime 2000.
     *                   2. Send through a session.
     *                   3. Read the reply and the option.
     * @tc.expected      The option stays async with the wait time and the send replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionAsyncWaitTimeCombination', 0, () => {
      const session = createConnectedSession();
      const option = optionOf(OPTION_FLAG_ASYNC, 2000, false);
      const result = sendWithOption(session, option);
      expect(option.isAsync()).assertTrue();
      expect(option.waitTime).assertEqual(2000);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(option.describe()).assertEqual('1/2000/false');
      expect(session.proxy?.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          clientOptionClassificationIsPure
     * @tc.desc          Repeated classification calls do not mutate the option.
     * @tc.precondition  A mixed option.
     * @tc.steps         1. Call isSync five times.
     *                   2. Compare all answers and the description.
     *                   3. Call isAsync five times.
     * @tc.expected      Every call returns the same verdict with no state change.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionClassificationIsPure', 0, () => {
      const option = optionOf(1, 15, true);
      const before = option.describe();
      let syncVotes = 0;
      for (let index = 0; index < 5; index++) {
        if (option.isSync()) {
          syncVotes = syncVotes + 1;
        }
      }
      expect(syncVotes).assertEqual(5);
      expect(option.isAsync()).assertFalse();
      expect(option.describe()).assertEqual(before);
      expect(option.flags).assertEqual(1);
      expect(option.waitTime).assertEqual(15);
      expect(option.sync).assertTrue();
    });

    /**
     * @tc.name          clientOptionNegativeWaitTimeSend
     * @tc.desc          A negative wait time does not break the send path.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send with waitTime -5.
     *                   2. Read the result and option.
     *                   3. Confirm the request was stored.
     * @tc.expected      The request succeeds with the negative wait time retained.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionNegativeWaitTimeSend', 0, () => {
      const session = createConnectedSession();
      const option = optionOf(0, -5, false);
      const result = sendWithOption(session, option);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(option.waitTime).assertEqual(-5);
      expect(option.isSync()).assertTrue();
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
    });

    /**
     * @tc.name          clientOptionHugeFlagsSend
     * @tc.desc          A huge flags value is classified async and does not block sends.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send with flags 12345.
     *                   2. Read the reply. 3. Inspect the option.
     * @tc.expected      The send succeeds and the option remains async.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionHugeFlagsSend', 0, () => {
      const session = createConnectedSession();
      const option = optionOf(12345, 0, false);
      const result = sendWithOption(session, option);
      expect(option.flags).assertEqual(12345);
      expect(option.isAsync()).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(option.describe()).assertEqual('12345/0/false');
      expect(session.proxy?.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          clientOptionReplyIndependentOfWaitTime
     * @tc.desc          The reply text does not depend on the option wait time.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send with four different wait times.
     *                   2. Collect the replies. 3. Compare them.
     * @tc.expected      All replies equal 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionReplyIndependentOfWaitTime', 0, () => {
      const session = createConnectedSession();
      const waits: number[] = [0, 1, 999, 3600000];
      const replies: string[] = [];
      for (let index = 0; index < waits.length; index++) {
        const result = sendWithOption(session, optionOf(0, waits[index], false));
        replies.push(result.readReply());
      }
      expect(replies.length).assertEqual(4);
      expect(replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(replies[1]).assertEqual(REPLY_PAYLOAD);
      expect(replies[2]).assertEqual(REPLY_PAYLOAD);
      expect(replies[3]).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(4);
      expect(session.proxy?.requests.length).assertEqual(4);
    });

    /**
     * @tc.name          clientOptionClientSendUsesSyncDefault
     * @tc.desc          The client send path constructs a default synchronous option.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send through the client.
     *                   2. Confirm the send succeeded.
     *                   3. Compare with a default option description.
     * @tc.expected      The default option is sync and the send replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionClientSendUsesSyncDefault', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      const defaultOption = new MessageOptionModel();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(defaultOption.isSync()).assertTrue();
      expect(defaultOption.describe()).assertEqual('0/0/false');
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          clientOptionClientSendCountsRequests
     * @tc.desc          Every client send records a request regardless of option defaults.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send twice through the client.
     *                   2. Read the request list.
     *                   3. Compare the send counter.
     * @tc.expected      Two requests of code 1 are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionClientSendCountsRequests', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.sendString(REQUEST_PAYLOAD);
      expect(session.proxy?.requests.length).assertEqual(2);
      expect(session.proxy?.requests[0]).assertEqual(1);
      expect(session.proxy?.requests[1]).assertEqual(1);
      expect(session.proxy?.sendCalls).assertEqual(2);
      expect(session.proxy?.stub.requestCount()).assertEqual(2);
      expect(session.events.countOf('send-ok')).assertEqual(2);
    });

    /**
     * @tc.name          clientOptionCloneSyncFlagChange
     * @tc.desc          Changing only the clone sync flag flips its classification.
     * @tc.precondition  An async option.
     * @tc.steps         1. Clone the option. 2. Set clone.sync true.
     *                   3. Compare source and clone.
     * @tc.expected      The clone becomes sync while the source stays async.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionCloneSyncFlagChange', 0, () => {
      const source = optionOf(1, 10, false);
      const clone = source.clone();
      expect(clone.isAsync()).assertTrue();
      clone.sync = true;
      expect(clone.isSync()).assertTrue();
      expect(clone.isAsync()).assertFalse();
      expect(source.isAsync()).assertTrue();
      expect(source.sync).assertFalse();
      expect(clone.flags).assertEqual(source.flags);
      expect(clone.describe()).assertEqual('1/10/true');
    });

    /**
     * @tc.name          clientOptionManyOptionsFingerprint
     * @tc.desc          A generated option list has a stable combined description hash.
     * @tc.precondition  MessageOptionModel and textFingerprint.
     * @tc.steps         1. Build ten varied options.
     *                   2. Join their descriptions.
     *                   3. Hash the joined text twice.
     * @tc.expected      The joined text has a stable positive fingerprint.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionManyOptionsFingerprint', 0, () => {
      const options: MessageOptionModel[] = [];
      for (let index = 0; index < 10; index++) {
        options.push(optionOf(index % 2, index * 100, index % 3 === 0));
      }
      const descriptions: string[] = [];
      for (let index = 0; index < options.length; index++) {
        descriptions.push(options[index].describe());
      }
      const text = descriptions.join('|');
      expect(options.length).assertEqual(10);
      expect(text.indexOf('|')).assertLarger(-1);
      expect(text.split('|').length).assertEqual(10);
      expect(textFingerprint(text)).assertEqual(textFingerprint(text));
      expect(textFingerprint(text)).assertLarger(0);
      expect(options[3].waitTime).assertEqual(300);
    });

    /**
     * @tc.name          clientOptionOnlyZeroFlagsIsImplicitSync
     * @tc.desc          Among flags values, only zero is implicitly synchronous.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Test flags 0 through 4 without an override.
     *                   2. Collect the sync flags.
     *                   3. Compare the set.
     * @tc.expected      Only flags 0 classifies as sync.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionOnlyZeroFlagsIsImplicitSync', 0, () => {
      const syncFlags: number[] = [];
      for (let flags = 0; flags <= 4; flags++) {
        const option = optionOf(flags, 0, false);
        if (option.isSync()) {
          syncFlags.push(flags);
        }
      }
      expect(syncFlags.length).assertEqual(1);
      expect(syncFlags[0]).assertEqual(0);
      expect(syncFlags.indexOf(1)).assertEqual(-1);
      expect(syncFlags.indexOf(2)).assertEqual(-1);
      expect(optionOf(0, 0, false).isSync()).assertTrue();
      expect(optionOf(4, 0, false).isSync()).assertFalse();
    });

    /**
     * @tc.name          clientOptionOracleAgreementAcrossRange
     * @tc.desc          The classifier agrees with the oracle for flags 0 through 9.
     * @tc.precondition  expectedSync oracle.
     * @tc.steps         1. Walk flags 0 to 9 with sync false.
     *                   2. Walk the same range with sync true.
     *                   3. Count agreements.
     * @tc.expected      All twenty evaluations agree with the oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionOracleAgreementAcrossRange', 0, () => {
      let agreements = 0;
      for (let flags = 0; flags <= 9; flags++) {
        const plain = optionOf(flags, 0, false);
        if (plain.isSync() === expectedSync(flags, false)) {
          agreements = agreements + 1;
        }
        const forced = optionOf(flags, 0, true);
        if (forced.isSync() === expectedSync(flags, true)) {
          agreements = agreements + 1;
        }
      }
      expect(agreements).assertEqual(20);
      expect(optionOf(0, 0, true).isSync()).assertTrue();
      expect(optionOf(9, 0, false).isSync()).assertFalse();
      expect(asyncCount([optionOf(0, 0, false), optionOf(9, 0, false)])).assertEqual(1);
      expect(optionOf(0, 0, false).isSync()).assertTrue();
    });

    /**
     * @tc.name          clientOptionDescribeStableAfterSend
     * @tc.desc          The description of a reused option is stable across sends.
     * @tc.precondition  A connected session and a mixed option.
     * @tc.steps         1. Record the description.
     *                   2. Send three times with the option.
     *                   3. Compare the description again.
     * @tc.expected      The description is unchanged and all sends replied.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionDescribeStableAfterSend', 0, () => {
      const session = createConnectedSession();
      const option = optionOf(1, 60, false);
      const before = option.describe();
      sendWithOption(session, option);
      sendWithOption(session, option);
      sendWithOption(session, option);
      expect(option.describe()).assertEqual(before);
      expect(option.describe()).assertEqual('1/60/false');
      expect(option.isAsync()).assertTrue();
      expect(session.proxy?.sendCalls).assertEqual(3);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(3);
      expect(option.waitTime).assertEqual(60);
    });

    /**
     * @tc.name          clientOptionDefaultsEqualEachConstruction
     * @tc.desc          Every default construction produces the same description.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Construct three default options.
     *                   2. Compare their descriptions.
     *                   3. Confirm they are distinct objects.
     * @tc.expected      All three defaults describe '0/0/false'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionDefaultsEqualEachConstruction', 0, () => {
      const first = new MessageOptionModel();
      const second = new MessageOptionModel();
      const third = new MessageOptionModel();
      expect(first.describe()).assertEqual(second.describe());
      expect(second.describe()).assertEqual(third.describe());
      expect(third.describe()).assertEqual('0/0/false');
      expect(first === second).assertFalse();
      expect(second === third).assertFalse();
      expect(first.isSync() && second.isSync() && third.isSync()).assertTrue();
    });

    /**
     * @tc.name          clientOptionContractSummary
     * @tc.desc          The option contract holds end to end with a real send.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Build an async option with a wait time.
     *                   2. Send it through the proxy.
     *                   3. Cross-check every observable.
     * @tc.expected      The option classification, reply and counters all agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionContractSummary', 0, () => {
      const session = createConnectedSession();
      const option = optionOf(OPTION_FLAG_ASYNC, 1500, false);
      const result = sendWithOption(session, option);
      expect(option.isAsync()).assertTrue();
      expect(option.isSync()).assertFalse();
      expect(option.describe()).assertEqual('1/1500/false');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.requests[0]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          clientOptionSendEachSyncVariant
     * @tc.desc          Every sync variant reaches the stub and replies.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send with three sync variants.
     *                   2. Count successes and request entries.
     *                   3. Confirm all options stayed sync.
     * @tc.expected      Three successful requests with three stored texts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionSendEachSyncVariant', 0, () => {
      const session = createConnectedSession();
      const variants: MessageOptionModel[] = [optionOf(0, 0, false), optionOf(0, 0, true),
        optionOf(1, 0, true)];
      let successes = 0;
      for (let index = 0; index < variants.length; index++) {
        const result = sendWithOption(session, variants[index]);
        if (result.isSuccess()) {
          successes = successes + 1;
        }
        expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      }
      expect(successes).assertEqual(3);
      expect(session.proxy?.sendCalls).assertEqual(3);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(3);
      expect(variants[0].isSync()).assertTrue();
      expect(variants[1].isSync()).assertTrue();
      expect(variants[2].isSync()).assertTrue();
    });

    /**
     * @tc.name          clientOptionFlagsTableAgreement
     * @tc.desc          A flags table matches the oracle for ten values.
     * @tc.precondition  expectedSync oracle.
     * @tc.steps         1. Walk flags 0 through 9.
     *                   2. Compare each classification.
     *                   3. Count matches.
     * @tc.expected      Exactly ten evaluations agree with the oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionFlagsTableAgreement', 0, () => {
      let matches = 0;
      for (let flags = 0; flags <= 9; flags++) {
        const option = optionOf(flags, 20, false);
        if ((flags === 0) === option.isSync()) {
          matches = matches + 1;
        }
        expect(option.waitTime).assertEqual(20);
      }
      expect(matches).assertEqual(10);
      expect(optionOf(0, 20, false).isSync()).assertTrue();
      expect(optionOf(5, 20, false).isSync()).assertFalse();
      expect(optionOf(9, 20, false).describe()).assertEqual('9/20/false');
    });

    /**
     * @tc.name          clientOptionWaitTimeTable
     * @tc.desc          A wait-time table is preserved through construction and cloning.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Walk five wait times.
     *                   2. Clone each option.
     *                   3. Compare the wait times.
     * @tc.expected      Every clone preserves its wait time.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionWaitTimeTable', 0, () => {
      const waits: number[] = [0, 1, 999, 60000, 3600000];
      let preserved = 0;
      for (let index = 0; index < waits.length; index++) {
        const source = optionOf(0, waits[index], false);
        const clone = source.clone();
        if (clone.waitTime === waits[index]) {
          preserved = preserved + 1;
        }
        expect(clone.waitTime).assertEqual(source.waitTime);
      }
      expect(preserved).assertEqual(5);
      expect(waits[0]).assertEqual(0);
      expect(waits[4]).assertEqual(3600000);
      expect(optionOf(0, 60000, false).describe()).assertEqual('0/60000/false');
    });

    /**
     * @tc.name          clientOptionDescriptionPartsAlwaysThree
     * @tc.desc          Every description splits into exactly three segments.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Build six varied options.
     *                   2. Split each description.
     *                   3. Compare segment counts.
     * @tc.expected      Each description has three segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionDescriptionPartsAlwaysThree', 0, () => {
      const options: MessageOptionModel[] = [new MessageOptionModel(), optionOf(1, 5, true),
        optionOf(-2, -3, false), optionOf(99, 123456, true), optionOf(0, 7, true),
        optionOf(7, 0, false)];
      for (let index = 0; index < options.length; index++) {
        const parts = options[index].describe().split('/');
        expect(parts.length).assertEqual(3);
      }
      expect(options.length).assertEqual(6);
      expect(options[2].describe()).assertEqual('-2/-3/false');
      expect(options[3].describe()).assertEqual('99/123456/true');
      expect(options[5].describe()).assertEqual('7/0/false');
      expect(options[0].describe().split('/')[0]).assertEqual('0');
    });

    /**
     * @tc.name          clientOptionClonePreservesClassification
     * @tc.desc          Classification survives cloning for all flag variants.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Clone four options.
     *                   2. Compare source and clone classifications.
     *                   3. Count agreements.
     * @tc.expected      All four clones carry the same classification.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionClonePreservesClassification', 0, () => {
      const sources: MessageOptionModel[] = [optionOf(0, 0, false), optionOf(1, 0, false),
        optionOf(2, 0, true), optionOf(3, 0, false)];
      let agreements = 0;
      for (let index = 0; index < sources.length; index++) {
        const clone = sources[index].clone();
        if (clone.isSync() === sources[index].isSync()) {
          agreements = agreements + 1;
        }
      }
      expect(agreements).assertEqual(4);
      expect(sources[0].isSync()).assertTrue();
      expect(sources[1].isSync()).assertFalse();
      expect(sources[2].isSync()).assertTrue();
      expect(sources[3].isSync()).assertFalse();
      expect(sources[2].describe()).assertEqual('2/0/true');
    });

    /**
     * @tc.name          clientOptionRepeatedAsyncWithWait
     * @tc.desc          Repeating async sends with a wait time remains consistent.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send four times with the same async option.
     *                   2. Compare all replies.
     *                   3. Inspect the option and counters.
     * @tc.expected      Four replies arrive and the option is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionRepeatedAsyncWithWait', 0, () => {
      const session = createConnectedSession();
      const option = optionOf(1, 25, false);
      const replies: string[] = [];
      for (let index = 0; index < 4; index++) {
        replies.push(sendWithOption(session, option).readReply());
      }
      expect(replies.length).assertEqual(4);
      expect(replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(replies[3]).assertEqual(REPLY_PAYLOAD);
      expect(option.describe()).assertEqual('1/25/false');
      expect(option.isAsync()).assertTrue();
      expect(session.proxy?.requests.length).assertEqual(4);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(4);
    });

    /**
     * @tc.name          clientOptionNotExposedInResult
     * @tc.desc          RequestResult does not carry the option used.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send with a distinctive option.
     *                   2. Inspect the result fields.
     *                   3. Confirm only errCode and reply exist.
     * @tc.expected      The result reports the reply without echoing the option.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionNotExposedInResult', 0, () => {
      const session = createConnectedSession();
      const option = optionOf(1, 4321, false);
      const result = sendWithOption(session, option);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.size()).assertEqual(1);
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(option.waitTime).assertEqual(4321);
      expect(session.proxy?.requests[0]).assertEqual(1);
    });

    /**
     * @tc.name          clientOptionFlagsDoNotAffectThroughput
     * @tc.desc          Sync and async options both count as one send each.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Alternate sync and async sends.
     *                   2. Compare the send counter.
     *                   3. Count handled codes.
     * @tc.expected      Four sends are counted regardless of classification.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionFlagsDoNotAffectThroughput', 0, () => {
      const session = createConnectedSession();
      sendWithOption(session, optionOf(0, 0, false));
      sendWithOption(session, optionOf(1, 0, false));
      sendWithOption(session, optionOf(0, 0, false));
      sendWithOption(session, optionOf(1, 0, false));
      expect(session.proxy?.sendCalls).assertEqual(4);
      expect(session.proxy?.requests.length).assertEqual(4);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(4);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(4);
      expect(session.proxy?.stub.requestCount()).assertEqual(4);
      expect(session.proxy?.stub.handledCodes.join(',')).assertEqual('1,1,1,1');
    });

    /**
     * @tc.name          clientOptionBoundaryFlagsAndWait
     * @tc.desc          Boundary values for flags and wait time remain stored.
     * @tc.precondition  MessageOptionModel is exported.
     * @tc.steps         1. Build extreme options.
     *                   2. Describe each. 3. Compare the values.
     * @tc.expected      Extreme values round-trip through the description.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionBoundaryFlagsAndWait', 0, () => {
      const max = optionOf(2147483647, 2147483647, false);
      const min = optionOf(-2147483648, -2147483648, true);
      expect(max.flags).assertEqual(2147483647);
      expect(max.waitTime).assertEqual(2147483647);
      expect(max.describe()).assertEqual('2147483647/2147483647/false');
      expect(min.flags).assertEqual(-2147483648);
      expect(min.waitTime).assertEqual(-2147483648);
      expect(min.isSync()).assertTrue();
      expect(min.describe().indexOf('-2147483648')).assertEqual(0);
    });

    /**
     * @tc.name          clientOptionCountsAcrossVariants
     * @tc.desc          A mixed run of five variants counts sends and replies correctly.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send five variants.
     *                   2. Count successes and failures.
     *                   3. Compare the counters.
     * @tc.expected      Five successes with five stored requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionCountsAcrossVariants', 0, () => {
      const session = createConnectedSession();
      const variants: MessageOptionModel[] = [optionOf(0, 0, false), optionOf(1, 10, false),
        optionOf(0, 20, true), optionOf(2, 30, false), optionOf(3, 40, true)];
      let successes = 0;
      for (let index = 0; index < variants.length; index++) {
        if (sendWithOption(session, variants[index]).isSuccess()) {
          successes = successes + 1;
        }
      }
      expect(successes).assertEqual(5);
      expect(session.proxy?.sendCalls).assertEqual(5);
      expect(session.proxy?.requests.length).assertEqual(5);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(5);
      expect(variants[3].isAsync()).assertTrue();
      expect(variants[4].isSync()).assertTrue();
      expect(session.proxy?.stub.requestCount()).assertEqual(5);
    });

    /**
     * @tc.name          clientOptionSummaryOfDefaults
     * @tc.desc          Default options created at different times stay identical.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Create an option before and after a send.
     *                   2. Compare both defaults.
     *                   3. Confirm the client send used a sync option.
     * @tc.expected      Both defaults are identical and the send succeeded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionSummaryOfDefaults', 0, () => {
      const before = new MessageOptionModel();
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      const after = new MessageOptionModel();
      expect(before.describe()).assertEqual(after.describe());
      expect(before.isSync()).assertTrue();
      expect(after.isSync()).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          clientOptionUnchangedAfterFailedSend
     * @tc.desc          A failed send leaves the option fields intact.
     * @tc.precondition  A connected session with an armed failure.
     * @tc.steps         1. Arm ERROR_SEND. 2. Send with a custom option.
     *                   3. Compare the option before and after.
     * @tc.expected      The option keeps its values despite the failure.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionUnchangedAfterFailedSend', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy;
      if (proxy !== undefined) {
        proxy.failNextSend = ERROR_SEND;
      }
      const option = optionOf(1, 800, false);
      const before = option.describe();
      const result = sendWithOption(session, option);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.reply.isEmpty()).assertTrue();
      expect(option.describe()).assertEqual(before);
      expect(option.flags).assertEqual(1);
      expect(option.waitTime).assertEqual(800);
      expect(option.isAsync()).assertTrue();
      expect(session.proxy?.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          clientOptionNoProxyPathIgnoresOption
     * @tc.desc          The no-proxy branch returns before any option is used.
     * @tc.precondition  A connected session with a cleared proxy.
     * @tc.steps         1. Clear the proxy. 2. Reuse an option across sends.
     *                   3. Compare the option and results.
     * @tc.expected      Both sends return 16000004 and the option is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientOptionNoProxyPathIgnoresOption', 0, () => {
      const session = createConnectedSession();
      session.proxy = undefined;
      const option = optionOf(0, 99, false);
      const first = sendWithOption(session, option);
      const second = sendWithOption(session, option);
      expect(first.errCode).assertEqual(ERROR_NONE);
      expect(first.reply.isEmpty()).assertTrue();
      expect(second.errCode).assertEqual(ERROR_NONE);
      expect(option.describe()).assertEqual('0/99/false');
      expect(option.waitTime).assertEqual(99);
      expect(session.events.countOf('send-no-proxy')).assertEqual(0);
    });

    /**
     * @tc.name          clientOptionFinalConsistency
     * @tc.desc          Final cross-check of option defaults, oracle and sends.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Validate the flag constants.
     *                   2. Send with the default option.
     *                   3. Confirm every observable.
     * @tc.expected      Defaults, oracle and reply all agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientOptionFinalConsistency', 0, () => {
      const session = createConnectedSession();
      const option = new MessageOptionModel();
      const result = sendWithOption(session, option);
      expect(OPTION_FLAG_SYNC).assertEqual(0);
      expect(OPTION_FLAG_ASYNC).assertEqual(1);
      expect(option.isSync()).assertTrue();
      expect(option.describe()).assertEqual('0/0/false');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
    });

  });
}
