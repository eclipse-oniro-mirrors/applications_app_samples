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
 * Reply contract of the IPC client protocol.
 *
 * For request code 1 the stub replies with the fixed string 'hello rpc'
 * (SharedDriver REPLY_PAYLOAD). The client reads that value from the
 * RequestResult and logs it. This suite covers the default reply, custom
 * reply payloads injected for testing, cursor consumption, reclaim
 * independence, empty replies and the coupling between reply text and the
 * send-success decision.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  REPLY_PAYLOAD,
  REQUEST_PAYLOAD,
  REQUEST_CODE,
  ERROR_NONE,
  ERROR_SEND,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  CONNECT_SUCCESS_TOAST,
  MessageSequenceModel,
  MessageOptionModel,
  RequestResultModel,
  RemoteStubModel,
  RemoteProxyModel,
  ConnectionModel,
  createConnectedSession,
  expectedReplyFor,
  textFingerprint,
  ClientMetrics
} from '../Shared/SharedDriver';

/** Builds a connected session whose stub answers with the supplied text. */
function sessionWithReply(reply: string): ConnectionModel {
  return createConnectedSession(reply);
}

/** Arms a one-shot send failure on the session proxy. */
function armSendFailure(session: ConnectionModel, code: number): boolean {
  const proxy = session.proxy;
  if (proxy === undefined) {
    return false;
  }
  proxy.failNextSend = code;
  return true;
}

/** Drains a sequence through readString until it reports the end. */
function drain(model: MessageSequenceModel): string[] {
  const values: string[] = [];
  let guard = 0;
  while (guard < 8) {
    const value = model.readString();
    if (value === '' && model.cursor >= model.size()) {
      break;
    }
    values.push(value);
    guard = guard + 1;
  }
  return values;
}

export default function clientReply(): void {
  describe('ClientReplyContract', () => {
    beforeAll(() => {
      logSuite('ClientReplyContract', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ClientReplyContract', 'end');
    });
    /**
     * @tc.name          clientReplyConstantIsHelloRpc
     * @tc.desc          The documented stub reply is exactly 'hello rpc'.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read REPLY_PAYLOAD. 2. Compare with the literal.
     *                   3. Confirm the oracle returns the same value.
     * @tc.expected      The reply constant is 'hello rpc' and is non-empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientReplyConstantIsHelloRpc', 0, () => {
      expect(REPLY_PAYLOAD).assertEqual('hello rpc');
      expect(REPLY_PAYLOAD.length).assertEqual(9);
      expect(REPLY_PAYLOAD.length > 0).assertTrue();
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual(REPLY_PAYLOAD);
      expect(REPLY_PAYLOAD === REQUEST_PAYLOAD).assertFalse();
      expect(REPLY_PAYLOAD.startsWith('hello')).assertTrue();
    });

    /**
     * @tc.name          clientReplyDefaultSessionAnswers
     * @tc.desc          A default connected session answers with 'hello rpc'.
     * @tc.precondition  createConnectedSession defaults to the reply payload.
     * @tc.steps         1. Build the default session. 2. Send 'hello world'.
     *                   3. Read the reply value.
     * @tc.expected      The result succeeds and the reply equals REPLY_PAYLOAD.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientReplyDefaultSessionAnswers', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.readReply()).assertEqual('hello rpc');
      expect(session.proxy?.stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          clientReplyExpectedOracleMatchesConstant
     * @tc.desc          The independent reply oracle agrees with the constant.
     * @tc.precondition  expectedReplyFor is exported.
     * @tc.steps         1. Ask the oracle for code 1 twice.
     *                   2. Compare both answers with REPLY_PAYLOAD.
     *                   3. Ask for an unknown code.
     * @tc.expected      Code 1 maps to 'hello rpc' and code 0 maps to ''.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientReplyExpectedOracleMatchesConstant', 0, () => {
      const first = expectedReplyFor(1);
      const second = expectedReplyFor(REQUEST_CODE);
      expect(first).assertEqual(REPLY_PAYLOAD);
      expect(second).assertEqual(REPLY_PAYLOAD);
      expect(first).assertEqual(second);
      expect(expectedReplyFor(0)).assertEqual('');
      expect(expectedReplyFor(99)).assertEqual('');
      expect(textFingerprint(first)).assertEqual(textFingerprint(second));
    });

    /**
     * @tc.name          clientReplyCustomPayloadIsReturned
     * @tc.desc          A custom stub reply is surfaced unchanged by the client.
     * @tc.precondition  sessionWithReply accepts any string.
     * @tc.steps         1. Build a session with 'custom reply payload'.
     *                   2. Send the default request. 3. Read the reply.
     * @tc.expected      The reply equals the injected custom value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientReplyCustomPayloadIsReturned', 0, () => {
      const custom = 'custom reply payload';
      const session = sessionWithReply(custom);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.readReply()).assertEqual(custom);
      expect(result.replyText).assertEqual(custom);
      expect(session.proxy?.stub.replyText).assertEqual(custom);
      expect(session.events.last()).assertEqual('send-ok:' + custom);
      expect(session.logs.contains('reply ' + custom)).assertTrue();
    });

    /**
     * @tc.name          clientReplyRequestTextDoesNotAlterReply
     * @tc.desc          Changing the request text leaves the fixed reply alone.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send 'alpha'. 2. Send 'beta'.
     *                   3. Compare both replies.
     * @tc.expected      Both replies are 'hello rpc' regardless of request text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientReplyRequestTextDoesNotAlterReply', 0, () => {
      const session = createConnectedSession();
      const alpha = session.sendString('alpha');
      const beta = session.sendString('beta');
      expect(alpha.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(beta.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual('alpha');
      expect(session.proxy?.stub.receivedTexts[1]).assertEqual('beta');
      expect(session.events.countOf('send-ok')).assertEqual(2);
    });

    /**
     * @tc.name          clientReplyIndependentOfRequestSequence
     * @tc.desc          The reply sequence is separate from the request sequence.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send a request. 2. Compare the reply with the request.
     *                   3. Confirm the request buffer was reclaimed.
     * @tc.expected      The reply holds 'hello rpc' while the request is reclaimed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyIndependentOfRequestSequence', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.values[0] === REQUEST_PAYLOAD).assertFalse();
      expect(result.reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.readCount).assertEqual(1);
    });

    /**
     * @tc.name          clientReplyEmptyCustomPayloadStaysSuccessful
     * @tc.desc          An empty stub reply still yields errCode 0.
     * @tc.precondition  A session built with an empty reply string.
     * @tc.steps         1. Build the session. 2. Send the request.
     *                   3. Read errCode and the reply sequence.
     * @tc.expected      errCode is 0 while the reply text and sequence are empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyEmptyCustomPayloadStaysSuccessful', 0, () => {
      const session = sessionWithReply('');
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual('');
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.readReply()).assertEqual('');
      expect(session.events.last()).assertEqual('send-ok:');
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
    });

    /**
     * @tc.name          clientReplyCursorConsumesOnce
     * @tc.desc          Reading the reply advances the cursor by one.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send and read the reply.
     *                   2. Inspect the cursor and read count.
     *                   3. Compare with the sequence size.
     * @tc.expected      The cursor and read count are both one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientReplyCursorConsumesOnce', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.reply.cursor).assertEqual(0);
      const text = result.readReply();
      expect(text).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.cursor).assertEqual(1);
      expect(result.reply.readCount).assertEqual(1);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.trace()).assertEqual(REPLY_PAYLOAD + '#1');
    });

    /**
     * @tc.name          clientReplySecondReadIsEmpty
     * @tc.desc          A second read past the only value returns an empty string.
     * @tc.precondition  A default connected session with one reply value.
     * @tc.steps         1. Read the reply twice.
     *                   2. Compare the two values.
     *                   3. Inspect the cursor.
     * @tc.expected      The first read is 'hello rpc', the second is ''.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientReplySecondReadIsEmpty', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      const first = result.readReply();
      const second = result.readReply();
      expect(first).assertEqual(REPLY_PAYLOAD);
      expect(second).assertEqual('');
      expect(first === second).assertFalse();
      expect(result.reply.cursor).assertEqual(1);
      expect(result.reply.readCount).assertEqual(1);
      expect(result.reply.cursor < result.reply.size()).assertFalse();
    });

    /**
     * @tc.name          clientReplyRewindAllowsSecondRead
     * @tc.desc          Rewinding the reply sequence restores the value.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Read the reply. 2. Rewind the sequence.
     *                   3. Read again.
     * @tc.expected      The second read returns 'hello rpc' again.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyRewindAllowsSecondRead', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.readReply()).assertEqual('');
      expect(result.reply.cursor).assertEqual(1);
      result.reply.rewind();
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.readCount).assertEqual(2);
    });

    /**
     * @tc.name          clientReplyWrapperOwnsItsSequence
     * @tc.desc          The RequestResult reply is independent of the send buffers.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Capture the stub reply text.
     *                   2. Send and take the result.
     *                   3. Compare reply identity and values.
     * @tc.expected      The wrapper reply contains the same text in its own sequence.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyWrapperOwnsItsSequence', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      const proxyReply = session.proxy?.stub.replyText;
      expect(proxyReply).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText).assertEqual(proxyReply);
      expect(result.reply.writeCount).assertEqual(1);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.isSuccess()).assertTrue();
    });

    /**
     * @tc.name          clientReplySurvivesSourceReclaim
     * @tc.desc          Reclaiming the transport sequences does not clear the result.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send and capture the result.
     *                   2. Confirm the send path reclaimed its buffers.
     *                   3. Read the result reply.
     * @tc.expected      The result reply is still readable after reclaim.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplySurvivesSourceReclaim', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('scratch');
      reply.writeString('scratch');
      data.reclaim();
      reply.reclaim();
      expect(data.isReclaimed()).assertTrue();
      expect(reply.isReclaimed()).assertTrue();
      expect(result.reply.isReclaimed()).assertFalse();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.size()).assertEqual(1);
    });

    /**
     * @tc.name          clientReplyEventCarriesReplyText
     * @tc.desc          A successful reply is recorded verbatim in the event trace.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send once. 2. Read the last event.
     *                   3. Split the marker and payload.
     * @tc.expected      The marker is send-ok and the payload is 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientReplyEventCarriesReplyText', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      const last = session.events.last();
      const parts = last.split(':');
      expect(parts[0]).assertEqual('send-ok');
      expect(parts[1]).assertEqual(REPLY_PAYLOAD);
      expect(last).assertEqual('send-ok:hello rpc');
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.events.trace().indexOf(REPLY_PAYLOAD)).assertLarger(-1);
    });

    /**
     * @tc.name          clientReplyLogCarriesReplyText
     * @tc.desc          The info log records the reply string.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send once. 2. Search for the reply prefix.
     *                   3. Compare the log count of INFO entries.
     * @tc.expected      The log contains 'reply hello rpc' exactly once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientReplyLogCarriesReplyText', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      expect(session.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
      expect(session.logs.contains('ERROR')).assertFalse();
      expect(session.logs.countLevel('INFO')).assertEqual(3);
      let hits = 0;
      for (let index = 0; index < session.logs.lines.length; index++) {
        if (session.logs.lines[index].indexOf('reply hello rpc') >= 0) {
          hits = hits + 1;
        }
      }
      expect(hits).assertEqual(1);
      expect(session.logs.size()).assertEqual(3);
    });

    /**
     * @tc.name          clientReplyToastOnReplySuccess
     * @tc.desc          Any readable reply is accompanied by the success toast.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send the request. 2. Read the last toast.
     *                   3. Compare it with the connect toast.
     * @tc.expected      The last toast is sendRequest success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientReplyToastOnReplySuccess', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.lastToast() === SEND_FAIL_TOAST).assertFalse();
      expect(session.toasts.length).assertEqual(2);
      expect(session.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.toasts[1]).assertEqual('sendRequest success');
    });

    /**
     * @tc.name          clientReplyMetricsRepliesMatchReplyCount
     * @tc.desc          The metrics reply counter tracks successful replies.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send three requests. 2. Build metrics.
     *                   3. Compare replies and ratio.
     * @tc.expected      Replies equal three, failures zero and ratio one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyMetricsRepliesMatchReplyCount', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.sendString('second');
      session.sendString('third');
      const metrics = ClientMetrics.from(session);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.sends).assertEqual(3);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(3);
    });

    /**
     * @tc.name          clientReplyFingerprintChangesWithReplyText
     * @tc.desc          Different reply texts hash to different fingerprints.
     * @tc.precondition  Two sessions with different stub replies.
     * @tc.steps         1. Send on both sessions.
     *                   2. Compute event fingerprints.
     *                   3. Compare the hashes.
     * @tc.expected      The fingerprints differ and each is positive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyFingerprintChangesWithReplyText', 0, () => {
      const alpha = createConnectedSession();
      alpha.sendString(REQUEST_PAYLOAD);
      const beta = sessionWithReply('beta reply');
      beta.sendString(REQUEST_PAYLOAD);
      const alphaHash = alpha.events.fingerprint();
      const betaHash = beta.events.fingerprint();
      expect(alphaHash === betaHash).assertFalse();
      expect(alphaHash).assertLarger(0);
      expect(betaHash).assertLarger(0);
      expect(alpha.events.trace()).assertEqual('connect:com.example.ipc_stub/ServiceAbility|' +
        'death-register:IPCStubTest|connected:IPCStubTest|send-ok:' + REPLY_PAYLOAD);
      expect(beta.events.last()).assertEqual('send-ok:beta reply');
    });

    /**
     * @tc.name          clientReplyErrorResultHasNoReply
     * @tc.desc          A failed send returns an empty reply sequence.
     * @tc.precondition  A connected session with an armed failure.
     * @tc.steps         1. Arm ERROR_SEND. 2. Send the request.
     *                   3. Inspect the returned result reply.
     * @tc.expected      errCode is ERROR_SEND and the reply is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientReplyErrorResultHasNoReply', 0, () => {
      const session = createConnectedSession();
      armSendFailure(session, ERROR_SEND);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.readReply()).assertEqual('');
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.logs.contains('reply hello rpc')).assertFalse();
    });

    /**
     * @tc.name          clientReplyMissingValueReadsEmpty
     * @tc.desc          Reading an empty reply mirrors the out-of-range read result.
     * @tc.precondition  One empty result and one exhausted result.
     * @tc.steps         1. Read from an empty RequestResultModel.
     *                   2. Exhaust a normal reply and read again.
     *                   3. Compare both values.
     * @tc.expected      Both reads return '' with no cursor movement.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyMissingValueReadsEmpty', 0, () => {
      const empty = new RequestResultModel(ERROR_NONE, '');
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(empty.readReply()).assertEqual('');
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.readReply()).assertEqual('');
      expect(empty.reply.cursor).assertEqual(0);
      expect(result.reply.cursor).assertEqual(1);
      expect(empty.reply.readCount).assertEqual(0);
    });

    /**
     * @tc.name          clientReplySequenceCanHoldSeveralValues
     * @tc.desc          A reply sequence is a cursor, not a single slot.
     * @tc.precondition  A result whose reply sequence was extended.
     * @tc.steps         1. Create a result with 'hello rpc'.
     *                   2. Append 'second value'. 3. Read both values.
     * @tc.expected      The two reads return the values in insertion order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplySequenceCanHoldSeveralValues', 0, () => {
      const result = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD);
      result.reply.writeString('second value');
      expect(result.reply.size()).assertEqual(2);
      expect(result.reply.writeCount).assertEqual(2);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.readReply()).assertEqual('second value');
      expect(result.reply.cursor).assertEqual(2);
      expect(result.readReply()).assertEqual('');
      expect(result.reply.readCount).assertEqual(2);
    });

    /**
     * @tc.name          clientReplyTraceShowsValuesAndCursor
     * @tc.desc          The reply trace joins values with pipes and appends the cursor.
     * @tc.precondition  A two-value reply sequence.
     * @tc.steps         1. Extend a result reply to two values.
     *                   2. Read one value. 3. Inspect the trace.
     * @tc.expected      The trace is 'hello rpc|second#1'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyTraceShowsValuesAndCursor', 0, () => {
      const result = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD);
      result.reply.writeString('second');
      expect(result.reply.trace()).assertEqual('hello rpc|second#0');
      result.readReply();
      expect(result.reply.trace()).assertEqual('hello rpc|second#1');
      expect(result.reply.trace().indexOf('|')).assertLarger(-1);
      expect(result.reply.trace().endsWith('#1')).assertTrue();
      expect(result.reply.values.length).assertEqual(2);
    });

    /**
     * @tc.name          clientReplyDrainReadsEveryValue
     * @tc.desc          The drain helper returns all reply values in order.
     * @tc.precondition  A result with three reply values.
     * @tc.steps         1. Append two values to the default reply.
     *                   2. Drain the sequence. 3. Compare the collected list.
     * @tc.expected      The drain returns three values and the cursor reaches the end.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyDrainReadsEveryValue', 0, () => {
      const result = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD);
      result.reply.writeString('bravo');
      result.reply.writeString('charlie');
      const values = drain(result.reply);
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(REPLY_PAYLOAD);
      expect(values[1]).assertEqual('bravo');
      expect(values[2]).assertEqual('charlie');
      expect(result.reply.cursor).assertEqual(3);
      expect(result.reply.readCount).assertEqual(3);
      expect(drain(result.reply).length).assertEqual(0);
    });

    /**
     * @tc.name          clientReplyDrainEmptySequenceReturnsNothing
     * @tc.desc          Draining an empty reply sequence yields an empty list.
     * @tc.precondition  A result with no reply values.
     * @tc.steps         1. Create an empty result. 2. Drain it.
     *                   3. Inspect cursor and read count.
     * @tc.expected      The drain list is empty and no cursor movement occurs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyDrainEmptySequenceReturnsNothing', 0, () => {
      const result = new RequestResultModel(ERROR_NONE);
      const values = drain(result.reply);
      expect(values.length).assertEqual(0);
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.reply.cursor).assertEqual(0);
      expect(result.reply.readCount).assertEqual(0);
      expect(result.reply.size()).assertEqual(0);
      expect(result.reply.trace()).assertEqual('#0');
    });

    /**
     * @tc.name          clientReplyFingerprintDistinguishesValues
     * @tc.desc          Text fingerprints separate different reply payloads.
     * @tc.precondition  textFingerprint is exported.
     * @tc.steps         1. Hash the default reply.
     *                   2. Hash two variants. 3. Compare all three.
     * @tc.expected      The hashes differ and repeated hashing is stable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyFingerprintDistinguishesValues', 0, () => {
      const base = textFingerprint(REPLY_PAYLOAD);
      const other = textFingerprint('hello rpc ');
      const third = textFingerprint('HELLO RPC');
      expect(base === other).assertFalse();
      expect(base === third).assertFalse();
      expect(other === third).assertFalse();
      expect(base).assertEqual(textFingerprint(REPLY_PAYLOAD));
      expect(other).assertEqual(textFingerprint('hello rpc '));
      expect(base > 0).assertTrue();
    });

    /**
     * @tc.name          clientReplyOnePerRequestSequence
     * @tc.desc          Each request gets its own single-value reply.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send two requests and capture both results.
     *                   2. Compare reply sizes and identities.
     *                   3. Read both replies.
     * @tc.expected      Both results hold one value and are distinct objects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyOnePerRequestSequence', 0, () => {
      const session = createConnectedSession();
      const first = session.sendString(REQUEST_PAYLOAD);
      const second = session.sendString(REQUEST_PAYLOAD);
      expect(first.reply.size()).assertEqual(1);
      expect(second.reply.size()).assertEqual(1);
      expect(first.reply === second.reply).assertFalse();
      expect(first.reply.values === second.reply.values).assertFalse();
      expect(first.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(second.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(first.reply.isReclaimed()).assertFalse();
    });

    /**
     * @tc.name          clientReplyAfterReconnectIsFresh
     * @tc.desc          Reconnecting creates a new proxy with a fresh reply.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send once. 2. Disconnect and reconnect.
     *                   3. Send again and read the reply.
     * @tc.expected      The new proxy answers 'hello rpc' on a new request list.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyAfterReconnectIsFresh', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      session.connect(11);
      const stub = new RemoteStubModel();
      const proxy = new RemoteProxyModel(stub);
      session.onConnect(proxy);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.requests.length).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.state).assertEqual('connected');
      expect(session.events.countOf('connected')).assertEqual(2);
    });

    /**
     * @tc.name          clientReplyAfterStubRevive
     * @tc.desc          A revived stub answers again with the same reply.
     * @tc.precondition  A connected session whose stub was killed.
     * @tc.steps         1. Kill the stub behind the proxy.
     *                   2. Send and observe the failure.
     *                   3. Revive and send again.
     * @tc.expected      The first send fails, the second replies 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyAfterStubRevive', 0, () => {
      const session = createConnectedSession();
      session.proxy?.stub.kill();
      const failed = session.sendString(REQUEST_PAYLOAD);
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(failed.reply.isEmpty()).assertTrue();
      session.proxy?.stub.revive();
      const revived = session.sendString(REQUEST_PAYLOAD);
      expect(revived.errCode).assertEqual(ERROR_NONE);
      expect(revived.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          clientReplyTextStableAcrossSessions
     * @tc.desc          Two independent default sessions produce the same reply.
     * @tc.precondition  Two default connected sessions.
     * @tc.steps         1. Send on both. 2. Compare replies.
     *                   3. Compare reply fingerprints.
     * @tc.expected      Both replies and hashes are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyTextStableAcrossSessions', 0, () => {
      const alpha = createConnectedSession();
      const beta = createConnectedSession();
      const alphaReply = alpha.sendString(REQUEST_PAYLOAD).readReply();
      const betaReply = beta.sendString(REQUEST_PAYLOAD).readReply();
      expect(alphaReply).assertEqual(betaReply);
      expect(alphaReply).assertEqual(REPLY_PAYLOAD);
      expect(textFingerprint(alphaReply)).assertEqual(textFingerprint(betaReply));
      expect(alpha.proxy?.stub.requestCount()).assertEqual(beta.proxy?.stub.requestCount());
      expect(alpha.events.size()).assertEqual(beta.events.size());
    });

    /**
     * @tc.name          clientReplyLongPayloadIsReturnedWhole
     * @tc.desc          A long custom reply is not truncated by the transport model.
     * @tc.precondition  A session with a 96-character reply.
     * @tc.steps         1. Build the long reply string.
     *                   2. Create the session and send.
     *                   3. Compare length and content.
     * @tc.expected      The reply length is 96 and the text matches exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyLongPayloadIsReturnedWhole', 0, () => {
      let custom = '';
      for (let index = 0; index < 96; index++) {
        custom = custom + 'x';
      }
      const session = sessionWithReply(custom);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.readReply().length).assertEqual(96);
      expect(result.readReply()).assertEqual('');
      expect(result.reply.values[0]).assertEqual(custom);
      expect(session.logs.contains('reply ' + custom)).assertTrue();
      expect(session.events.last()).assertEqual('send-ok:' + custom);
    });

    /**
     * @tc.name          clientReplyUnicodePayloadIsReturnedWhole
     * @tc.desc          Non-ASCII reply text survives the reply contract.
     * @tc.precondition  A session with a Chinese reply payload.
     * @tc.steps         1. Build the session with '你好 rpc'.
     *                   2. Send the request. 3. Read the reply.
     * @tc.expected      The reply equals the injected Unicode string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyUnicodePayloadIsReturnedWhole', 0, () => {
      const custom = '你好 rpc';
      const session = sessionWithReply(custom);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.readReply()).assertEqual(custom);
      expect(result.reply.values[0]).assertEqual('你好 rpc');
      expect(result.reply.values.length).assertEqual(1);
      expect(session.events.last()).assertEqual('send-ok:你好 rpc');
      expect(result.isSuccess()).assertTrue();
    });

    /**
     * @tc.name          clientReplyEmptyRequestStillGetsReply
     * @tc.desc          An empty request string is still answered with the fixed reply.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send an empty payload. 2. Read the reply.
     *                   3. Inspect the stored request text.
     * @tc.expected      The reply is 'hello rpc' and the stored request is ''.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyEmptyRequestStillGetsReply', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString('');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual('');
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
    });

    /**
     * @tc.name          clientReplyDoesNotEchoRequest
     * @tc.desc          The reply is a constant, not an echo of the request text.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send a distinctive request string.
     *                   2. Read the reply.
     *                   3. Compare with the request text.
     * @tc.expected      The reply equals 'hello rpc' and not the request text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientReplyDoesNotEchoRequest', 0, () => {
      const session = createConnectedSession();
      const request = 'please echo me';
      const result = session.sendString(request);
      const reply = result.readReply();
      expect(reply).assertEqual(REPLY_PAYLOAD);
      expect(reply === request).assertFalse();
      expect(reply.indexOf('echo')).assertEqual(-1);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(request);
      expect(result.reply.values.length).assertEqual(1);
      expect(result.reply.values[0]).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          clientReplyReadCountTracksReads
     * @tc.desc          The read counter only advances for successful reads.
     * @tc.precondition  A two-value reply sequence.
     * @tc.steps         1. Read one value. 2. Read beyond the end twice.
     *                   3. Inspect the read counter.
     * @tc.expected      The read counter is one after all three calls.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyReadCountTracksReads', 0, () => {
      const result = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD);
      result.reply.writeString('tail');
      expect(result.reply.readCount).assertEqual(0);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.readCount).assertEqual(1);
      expect(result.readReply()).assertEqual('tail');
      expect(result.readReply()).assertEqual('');
      expect(result.readReply()).assertEqual('');
      expect(result.reply.readCount).assertEqual(2);
    });

    /**
     * @tc.name          clientReplyWriteCountTracksWrites
     * @tc.desc          The write counter tracks every accepted write.
     * @tc.precondition  An empty result.
     * @tc.steps         1. Write three values.
     *                   2. Reclaim the sequence and attempt another write.
     *                   3. Inspect the counters.
     * @tc.expected      Three writes are counted and the reclaim write is refused.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyWriteCountTracksWrites', 0, () => {
      const result = new RequestResultModel(ERROR_NONE);
      expect(result.reply.writeCount).assertEqual(0);
      expect(result.reply.writeString('a')).assertTrue();
      expect(result.reply.writeString('b')).assertTrue();
      expect(result.reply.writeString('c')).assertTrue();
      expect(result.reply.writeCount).assertEqual(3);
      result.reply.reclaim();
      expect(result.reply.writeString('d')).assertFalse();
      expect(result.reply.writeCount).assertEqual(3);
    });

    /**
     * @tc.name          clientReplyReclaimClearsReadability
     * @tc.desc          Reclaiming a result reply makes further reads return ''.
     * @tc.precondition  A result with one reply value.
     * @tc.steps         1. Read the reply once. 2. Reclaim the sequence.
     *                   3. Read again and inspect the reclaimed flag.
     * @tc.expected      The post-reclaim read is '' and the flag is true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyReclaimClearsReadability', 0, () => {
      const result = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.isReclaimed()).assertFalse();
      result.reply.reclaim();
      expect(result.reply.isReclaimed()).assertTrue();
      expect(result.readReply()).assertEqual('');
      expect(result.reply.cursor).assertEqual(0);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.values[0]).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          clientReplyTwoCustomRepliesStaySeparate
     * @tc.desc          Sessions with different replies never share reply text.
     * @tc.precondition  Two sessions built with distinct replies.
     * @tc.steps         1. Send on both. 2. Read both replies.
     *                   3. Compare the stub reply fields.
     * @tc.expected      Each reply matches its own injected text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyTwoCustomRepliesStaySeparate', 0, () => {
      const alpha = sessionWithReply('alpha reply');
      const beta = sessionWithReply('beta reply');
      const alphaResult = alpha.sendString(REQUEST_PAYLOAD);
      const betaResult = beta.sendString(REQUEST_PAYLOAD);
      expect(alphaResult.readReply()).assertEqual('alpha reply');
      expect(betaResult.readReply()).assertEqual('beta reply');
      expect(alphaResult.replyText === betaResult.replyText).assertFalse();
      expect(alpha.proxy?.stub.replyText).assertEqual('alpha reply');
      expect(beta.proxy?.stub.replyText).assertEqual('beta reply');
      expect(alpha.events.last()).assertEqual('send-ok:alpha reply');
    });

    /**
     * @tc.name          clientReplySuccessFlagIgnoresReplyText
     * @tc.desc          Success depends on errCode, not on the presence of reply text.
     * @tc.precondition  Two synthetic results.
     * @tc.steps         1. Build a zero-code result with text.
     *                   2. Build a non-zero result with text.
     *                   3. Compare the success flags.
     * @tc.expected      Only the zero-code result reports success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplySuccessFlagIgnoresReplyText', 0, () => {
      const ok = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD);
      const bad = new RequestResultModel(ERROR_SEND, REPLY_PAYLOAD);
      expect(ok.isSuccess()).assertTrue();
      expect(bad.isSuccess()).assertFalse();
      expect(ok.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(bad.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(ok.replyText).assertEqual(bad.replyText);
      expect(ok.errCode === bad.errCode).assertFalse();
    });

    /**
     * @tc.name          clientReplyForcedErrorKeepsInjectedText
     * @tc.desc          A synthetic error result can still hold reply text.
     * @tc.precondition  A non-zero result with 'boom'.
     * @tc.steps         1. Read the reply text. 2. Inspect the errCode.
     *                   3. Confirm the cursor consumption.
     * @tc.expected      The text 'boom' is readable while errCode is 16000003.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyForcedErrorKeepsInjectedText', 0, () => {
      const forced = new RequestResultModel(ERROR_SEND, 'boom');
      expect(forced.errCode).assertEqual(16000003);
      expect(forced.isSuccess()).assertFalse();
      expect(forced.reply.size()).assertEqual(1);
      expect(forced.readReply()).assertEqual('boom');
      expect(forced.readReply()).assertEqual('');
      expect(forced.replyText).assertEqual('boom');
      expect(forced.reply.cursor).assertEqual(1);
    });

    /**
     * @tc.name          clientReplyResultsKeepOwnCursors
     * @tc.desc          Reading one result does not advance another result cursor.
     * @tc.precondition  Two synthetic results with distinct texts.
     * @tc.steps         1. Read the first result twice.
     *                   2. Read the second once.
     *                   3. Compare both cursors.
     * @tc.expected      The first cursor is one and the second is one, independently.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyResultsKeepOwnCursors', 0, () => {
      const first = new RequestResultModel(ERROR_NONE, 'first');
      const second = new RequestResultModel(ERROR_NONE, 'second');
      expect(first.readReply()).assertEqual('first');
      expect(first.readReply()).assertEqual('');
      expect(first.reply.cursor).assertEqual(1);
      expect(second.reply.cursor).assertEqual(0);
      expect(second.readReply()).assertEqual('second');
      expect(second.reply.cursor).assertEqual(1);
      expect(second.reply.readCount).assertEqual(1);
    });

    /**
     * @tc.name          clientReplySequenceIsNotSharedWithStub
     * @tc.desc          The stub writes to the transport reply, not to the result reply.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send a request. 2. Read the result reply.
     *                   3. Re-read the stub reply text.
     * @tc.expected      The result reply has one value and the stub text is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplySequenceIsNotSharedWithStub', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.reply.values.length).assertEqual(1);
      expect(result.reply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          clientReplyResultWithoutTextIsEmpty
     * @tc.desc          A zero-code result can legitimately carry no reply text.
     * @tc.precondition  A synthetic result with no text.
     * @tc.steps         1. Inspect replyText and reply.size.
     *                   2. Read the reply. 3. Check the success flag.
     * @tc.expected      The result succeeds with an empty, readable-as-'' reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyResultWithoutTextIsEmpty', 0, () => {
      const empty = new RequestResultModel(ERROR_NONE);
      expect(empty.errCode).assertEqual(0);
      expect(empty.isSuccess()).assertTrue();
      expect(empty.replyText).assertEqual('');
      expect(empty.reply.size()).assertEqual(0);
      expect(empty.reply.writeCount).assertEqual(0);
      expect(empty.readReply()).assertEqual('');
      expect(empty.reply.isEmpty()).assertTrue();
    });

    /**
     * @tc.name          clientReplyCursorAtEndIsDetectable
     * @tc.desc          The cursor reaching the size marks the reply as exhausted.
     * @tc.precondition  A single-value reply sequence.
     * @tc.steps         1. Compare cursor and size before reading.
     *                   2. Read the value. 3. Compare again.
     * @tc.expected      Before reading the cursor is below the size; afterwards equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyCursorAtEndIsDetectable', 0, () => {
      const result = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD);
      expect(result.reply.cursor < result.reply.size()).assertTrue();
      expect(result.reply.cursor).assertEqual(0);
      expect(result.reply.size()).assertEqual(1);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.cursor).assertEqual(result.reply.size());
      expect(result.reply.cursor < result.reply.size()).assertFalse();
      expect(result.reply.cursor >= result.reply.size()).assertTrue();
    });

    /**
     * @tc.name          clientReplyValuesAccessibleBeforeRead
     * @tc.desc          Reply values are stored before any read takes place.
     * @tc.precondition  A result built with 'hello rpc'.
     * @tc.steps         1. Inspect the values array without reading.
     *                   2. Read the reply.
     *                   3. Inspect the array again.
     * @tc.expected      The array already holds the reply and is unchanged by reading.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyValuesAccessibleBeforeRead', 0, () => {
      const result = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD);
      expect(result.reply.values.length).assertEqual(1);
      expect(result.reply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.readCount).assertEqual(0);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.values.length).assertEqual(1);
      expect(result.reply.values[0]).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.cursor).assertEqual(1);
    });

    /**
     * @tc.name          clientReplyLogRecordsEveryReply
     * @tc.desc          Two successful sends produce two reply log lines.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send twice with different requests.
     *                   2. Count reply log fragments.
     *                   3. Confirm the request texts were stored.
     * @tc.expected      Two reply log lines exist for the same fixed reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyLogRecordsEveryReply', 0, () => {
      const session = createConnectedSession();
      session.sendString('one');
      session.sendString('two');
      let hits = 0;
      for (let index = 0; index < session.logs.lines.length; index++) {
        if (session.logs.lines[index].indexOf('reply ' + REPLY_PAYLOAD) >= 0) {
          hits = hits + 1;
        }
      }
      expect(hits).assertEqual(2);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual('one');
      expect(session.proxy?.stub.receivedTexts[1]).assertEqual('two');
      expect(session.events.countOf('send-ok')).assertEqual(2);
      expect(session.logs.countLevel('INFO')).assertEqual(4);
    });

    /**
     * @tc.name          clientReplyMetricsAfterMixedReplyTexts
     * @tc.desc          Metrics count replies regardless of their text.
     * @tc.precondition  A session with a custom reply string.
     * @tc.steps         1. Send once successfully.
     *                   2. Force one failure. 3. Build metrics.
     * @tc.expected      Two sends, one reply, one failure.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyMetricsAfterMixedReplyTexts', 0, () => {
      const session = sessionWithReply('metric reply');
      session.sendString(REQUEST_PAYLOAD);
      armSendFailure(session, ERROR_SEND);
      const failed = session.sendString(REQUEST_PAYLOAD);
      expect(failed.replyText).assertEqual('');
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          clientReplyInvalidProxyNeverWritesReply
     * @tc.desc          The no-proxy branch leaves the reply unwritten and empty.
     * @tc.precondition  A connected session whose proxy is cleared.
     * @tc.steps         1. Clear the proxy. 2. Send the request.
     *                   3. Inspect errCode and reply.
     * @tc.expected      errCode is 16000004 with an empty reply sequence.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyInvalidProxyNeverWritesReply', 0, () => {
      const session = createConnectedSession();
      session.proxy = undefined;
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(16000004);
      expect(result.isSuccess()).assertFalse();
      expect(result.replyText).assertEqual('');
      expect(result.reply.size()).assertEqual(0);
      expect(result.reply.writeCount).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(session.logs.contains('proxy is invalid')).assertTrue();
    });

    /**
     * @tc.name          clientReplyIndependentOfOptionFlags
     * @tc.desc          Reply contents do not depend on MessageOption flags.
     * @tc.precondition  A connected session and direct proxy access.
     * @tc.steps         1. Send with a sync option. 2. Send with an async option.
     *                   3. Compare both replies.
     * @tc.expected      Both replies equal 'hello rpc' and the stub stored both.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyIndependentOfOptionFlags', 0, () => {
      const session = createConnectedSession();
      const proxy = session.proxy;
      expect(proxy === undefined).assertFalse();
      const syncData = MessageSequenceModel.create();
      const syncReply = MessageSequenceModel.create();
      syncData.writeString('sync call');
      const syncResult = proxy?.sendMessageRequest(REQUEST_CODE, syncData, syncReply,
        new MessageOptionModel(0));
      syncData.reclaim();
      syncReply.reclaim();
      const asyncData = MessageSequenceModel.create();
      const asyncReply = MessageSequenceModel.create();
      asyncData.writeString('async call');
      const asyncResult = proxy?.sendMessageRequest(REQUEST_CODE, asyncData, asyncReply,
        new MessageOptionModel(1));
      asyncData.reclaim();
      asyncReply.reclaim();
      expect(syncResult?.errCode).assertEqual(ERROR_NONE);
      expect(asyncResult?.errCode).assertEqual(ERROR_NONE);
      expect(syncResult?.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(asyncResult?.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(2);
    });

    /**
     * @tc.name          clientReplyAfterFailedThenSuccess
     * @tc.desc          A success after an injected failure carries the full reply.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Force one failure. 2. Send again without arming.
     *                   3. Read the second reply.
     * @tc.expected      The failure consumes the arm and the next send replies normally.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyAfterFailedThenSuccess', 0, () => {
      const session = createConnectedSession();
      armSendFailure(session, ERROR_SEND);
      const failed = session.sendString(REQUEST_PAYLOAD);
      const recovered = session.sendString(REQUEST_PAYLOAD);
      expect(failed.isSuccess()).assertFalse();
      expect(failed.reply.isEmpty()).assertTrue();
      expect(recovered.isSuccess()).assertTrue();
      expect(recovered.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.failNextSend).assertEqual(ERROR_NONE);
      expect(session.proxy?.sendCalls).assertEqual(2);
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          clientReplyCustomReplyUsedRepeatedly
     * @tc.desc          The custom reply is stable across repeated requests.
     * @tc.precondition  A session with 'repeatable reply'.
     * @tc.steps         1. Send three requests. 2. Read all three replies.
     *                   3. Compare the reply log count.
     * @tc.expected      All three replies equal the custom text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyCustomReplyUsedRepeatedly', 0, () => {
      const session = sessionWithReply('repeatable reply');
      const first = session.sendString('one');
      const second = session.sendString('two');
      const third = session.sendString('three');
      expect(first.readReply()).assertEqual('repeatable reply');
      expect(second.readReply()).assertEqual('repeatable reply');
      expect(third.readReply()).assertEqual('repeatable reply');
      expect(session.events.countOf('send-ok')).assertEqual(3);
      expect(session.proxy?.stub.requestCount()).assertEqual(3);
      expect(session.logs.contains('reply repeatable reply')).assertTrue();
    });

    /**
     * @tc.name          clientReplyDefaultSessionUnaffectedByCustom
     * @tc.desc          A custom session does not mutate the default reply constant.
     * @tc.precondition  One custom session and one default session.
     * @tc.steps         1. Send on the custom session.
     *                   2. Create and use a default session.
     *                   3. Compare both replies.
     * @tc.expected      The default session still replies 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyDefaultSessionUnaffectedByCustom', 0, () => {
      const custom = sessionWithReply('mutated?');
      custom.sendString(REQUEST_PAYLOAD);
      const standard = createConnectedSession();
      const result = standard.sendString(REQUEST_PAYLOAD);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.readReply()).assertEqual('');
      expect(custom.proxy?.stub.replyText).assertEqual('mutated?');
      expect(standard.proxy?.stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(REPLY_PAYLOAD).assertEqual('hello rpc');
      expect(custom.events.last() === standard.events.last()).assertFalse();
    });

    /**
     * @tc.name          clientReplyEmptyReplyStillToastsSuccess
     * @tc.desc          An empty reply text still produces the success toast.
     * @tc.precondition  A session with an empty stub reply.
     * @tc.steps         1. Send once. 2. Read the toast list.
     *                   3. Confirm the success event text.
     * @tc.expected      The last toast is the success toast and the event is send-ok:.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyEmptyReplyStillToastsSuccess', 0, () => {
      const session = sessionWithReply('');
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.toasts.indexOf(SEND_FAIL_TOAST)).assertEqual(-1);
      expect(session.events.last()).assertEqual('send-ok:');
      expect(session.events.countOf('send-failed')).assertEqual(0);
      expect(session.logs.contains('reply ')).assertTrue();
    });

    /**
     * @tc.name          clientReplyTwoSessionsKeepOwnCursors
     * @tc.desc          Reply cursors belong to their own result objects.
     * @tc.precondition  Two default connected sessions.
     * @tc.steps         1. Send on both. 2. Read the first result twice.
     *                   3. Read the second result once.
     * @tc.expected      The first result is exhausted while the second still replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyTwoSessionsKeepOwnCursors', 0, () => {
      const alpha = createConnectedSession();
      const beta = createConnectedSession();
      const first = alpha.sendString(REQUEST_PAYLOAD);
      const second = beta.sendString(REQUEST_PAYLOAD);
      expect(first.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(first.readReply()).assertEqual('');
      expect(first.reply.cursor).assertEqual(1);
      expect(second.reply.cursor).assertEqual(0);
      expect(second.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(second.readReply()).assertEqual('');
      expect(second.reply.cursor).assertEqual(1);
    });

    /**
     * @tc.name          clientReplyStubReplyChangeBeforeSend
     * @tc.desc          Changing the stub reply before sending changes the result.
     * @tc.precondition  A default connected session with mutable stub text.
     * @tc.steps         1. Send once. 2. Replace the stub reply text.
     *                   3. Send again and read the reply.
     * @tc.expected      The first reply is 'hello rpc', the second is the new text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyStubReplyChangeBeforeSend', 0, () => {
      const session = createConnectedSession();
      const first = session.sendString(REQUEST_PAYLOAD);
      expect(first.readReply()).assertEqual(REPLY_PAYLOAD);
      const stub = session.proxy?.stub;
      if (stub !== undefined) {
        stub.replyText = 'edited reply';
      }
      const second = session.sendString(REQUEST_PAYLOAD);
      expect(second.readReply()).assertEqual('edited reply');
      expect(second.replyText).assertEqual('edited reply');
      expect(session.events.last()).assertEqual('send-ok:edited reply');
      expect(session.logs.contains('reply edited reply')).assertTrue();
    });

    /**
     * @tc.name          clientReplyExactLengthBoundary
     * @tc.desc          The default reply has a stable nine-character length.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send the request. 2. Measure the reply length.
     *                   3. Compare with the constant length.
     * @tc.expected      The received length equals the constant length, nine.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientReplyExactLengthBoundary', 0, () => {
      const session = createConnectedSession();
      const reply = session.sendString(REQUEST_PAYLOAD).readReply();
      expect(reply.length).assertEqual(REPLY_PAYLOAD.length);
      expect(reply.length).assertEqual(9);
      expect(reply.charCodeAt(0)).assertEqual('h'.charCodeAt(0));
      expect(reply.charAt(8)).assertEqual('c');
      expect(reply.indexOf(' ')).assertEqual(5);
      expect(reply.substring(0, 5)).assertEqual('hello');
      expect(reply.substring(6)).assertEqual('rpc');
    });

    /**
     * @tc.name          clientReplyConstructorCopiesText
     * @tc.desc          The result wrapper writes the supplied text into its sequence.
     * @tc.precondition  A manually constructed result.
     * @tc.steps         1. Build a result with 'payload'.
     *                   2. Compare replyText and the sequence value.
     *                   3. Retain the original string variable.
     * @tc.expected      Both representations equal 'payload'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyConstructorCopiesText', 0, () => {
      const source = 'payload';
      const result = new RequestResultModel(ERROR_NONE, source);
      expect(result.replyText).assertEqual(source);
      expect(result.reply.values[0]).assertEqual(source);
      expect(result.reply.size()).assertEqual(1);
      expect(result.reply.writeCount).assertEqual(1);
      expect(result.reply.cursor).assertEqual(0);
      expect(result.reply.values[0] === source).assertTrue();
      expect(result.isSuccess()).assertTrue();
    });

    /**
     * @tc.name          clientReplyRewindAfterReclaimStaysUnreadable
     * @tc.desc          Rewinding a reclaimed reply does not restore readability.
     * @tc.precondition  A reclaimed reply sequence.
     * @tc.steps         1. Reclaim a result reply.
     *                   2. Rewind it and read.
     *                   3. Inspect the reclaimed flag.
     * @tc.expected      The read is still '' and the reclaimed flag stays true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyRewindAfterReclaimStaysUnreadable', 0, () => {
      const result = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD);
      result.reply.reclaim();
      expect(result.reply.isReclaimed()).assertTrue();
      result.reply.rewind();
      expect(result.reply.cursor).assertEqual(0);
      expect(result.readReply()).assertEqual('');
      expect(result.reply.readCount).assertEqual(0);
      expect(result.reply.isReclaimed()).assertTrue();
      expect(result.reply.values[0]).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          clientReplyEventCountAfterEmptyReply
     * @tc.desc          Empty replies still add exactly one event entry.
     * @tc.precondition  A session with an empty stub reply.
     * @tc.steps         1. Send once. 2. Compare the event count.
     *                   3. Count send-ok and send-failed entries.
     * @tc.expected      The trace has four entries with one send-ok and no failure.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyEventCountAfterEmptyReply', 0, () => {
      const session = sessionWithReply('');
      const before = session.events.size();
      session.sendString(REQUEST_PAYLOAD);
      expect(session.events.size()).assertEqual(before + 1);
      expect(session.events.size()).assertEqual(4);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(0);
      expect(session.events.last()).assertEqual('send-ok:');
      expect(session.events.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          clientReplyWorkflowWithDisconnect
     * @tc.desc          A reply is readable before disconnect but no proxy remains after.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send and capture the result.
     *                   2. Disconnect the client.
     *                   3. Read the captured reply and send again.
     * @tc.expected      The captured reply survives while the new send fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyWorkflowWithDisconnect', 0, () => {
      const session = createConnectedSession();
      const captured = session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      expect(session.proxy === undefined).assertTrue();
      expect(captured.readReply()).assertEqual(REPLY_PAYLOAD);
      const after = session.sendString(REQUEST_PAYLOAD);
      expect(after.errCode).assertEqual(16000004);
      expect(after.reply.isEmpty()).assertTrue();
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          clientReplyLogBufferKeepsReplyHistory
     * @tc.desc          The bounded log retains recent reply lines within its limit.
     * @tc.precondition  A default connected session with a 128-line log limit.
     * @tc.steps         1. Send five requests. 2. Check the log size and limit.
     *                   3. Count reply fragments.
     * @tc.expected      The log stays under the limit and keeps all five replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyLogBufferKeepsReplyHistory', 0, () => {
      const session = createConnectedSession();
      for (let index = 0; index < 5; index++) {
        session.sendString('round ' + String(index));
      }
      expect(session.logs.limit).assertEqual(128);
      expect(session.logs.size()).assertLess(128);
      expect(session.logs.size()).assertEqual(7);
      expect(session.logs.countLevel('INFO')).assertEqual(7);
      expect(session.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(5);
      expect(session.events.countOf('send-ok')).assertEqual(5);
    });

    /**
     * @tc.name          clientReplyTextWithSpacesPreserved
     * @tc.desc          Leading and inner spaces in a custom reply are preserved.
     * @tc.precondition  A session with '  hello rpc  ' as reply.
     * @tc.steps         1. Build the padded reply. 2. Send and read.
     *                   3. Compare length and exact text.
     * @tc.expected      The padded reply round-trips without trimming.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyTextWithSpacesPreserved', 0, () => {
      const padded = '  hello rpc  ';
      const session = sessionWithReply(padded);
      const result = session.sendString(REQUEST_PAYLOAD);
      const reply = result.readReply();
      expect(reply).assertEqual(padded);
      expect(reply.length).assertEqual(13);
      expect(reply.startsWith(' ')).assertTrue();
      expect(reply.endsWith('  ')).assertTrue();
      expect(reply.indexOf('hello')).assertEqual(2);
      expect(session.events.last()).assertEqual('send-ok:' + padded);
    });

    /**
     * @tc.name          clientReplyReadableAfterManySends
     * @tc.desc          A late reply is still complete after several earlier sends.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send four requests. 2. Read the last reply.
     *                   3. Read the last reply a second time.
     * @tc.expected      The last reply is complete and then exhausted.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientReplyReadableAfterManySends', 0, () => {
      const session = createConnectedSession();
      session.sendString('one');
      session.sendString('two');
      session.sendString('three');
      const last = session.sendString('four');
      expect(last.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(last.readReply()).assertEqual('');
      expect(last.reply.cursor).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(4);
      expect(session.proxy?.stub.receivedTexts[3]).assertEqual('four');
      expect(session.events.countOf('send-ok')).assertEqual(4);
    });

    /**
     * @tc.name          clientReplyDefaultContractEndToEnd
     * @tc.desc          The full default reply contract holds in one observation.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Send the sample payload.
     *                   2. Read the reply, toast, event, log and metrics.
     *                   3. Cross-check every observable.
     * @tc.expected      All observables agree on the single 'hello rpc' reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientReplyDefaultContractEndToEnd', 0, () => {
      const session = createConnectedSession();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.events.last()).assertEqual('send-ok:' + REPLY_PAYLOAD);
      expect(session.logs.contains('reply ' + REPLY_PAYLOAD)).assertTrue();
      expect(ClientMetrics.from(session).replies).assertEqual(1);
      expect(session.proxy?.stub.requestCount()).assertEqual(1);
      expect(session.isConnected()).assertTrue();
    });

  });
}
