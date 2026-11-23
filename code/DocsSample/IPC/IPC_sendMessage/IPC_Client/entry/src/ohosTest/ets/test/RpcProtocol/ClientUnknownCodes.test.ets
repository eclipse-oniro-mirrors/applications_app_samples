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
 * Unknown request codes for the IPC client.
 *
 * Only code 1 is documented. The sample exercises four strangers that a
 * reviewer or a fuzzer might try: 0 (falsy), 2 (off by one), -1 (signed) and
 * 99 (far away). Each must be rejected with ERROR_SEND, must not produce a
 * reply value and must not be counted as a successful request. This suite
 * checks the constants, the oracles, the stub handler, the request history
 * and every observable client effect for those four codes.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  ERROR_NONE,
  ERROR_SEND,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  CONNECT_SUCCESS_TOAST,
  MessageSequenceModel,
  MessageOptionModel,
  RequestResultModel,
  RemoteProxyModel,
  RemoteStubModel,
  ConnectionModel,
  ClientSnapshot,
  createConnectedSession,
  expectedHandled,
  expectedReplyFor,
  isKnownRequestCode,
  ClientMetrics,
  textFingerprint
} from '../Shared/SharedDriver';

/** The four unknown codes under test. */
function unknownCodes(): number[] {
  return [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE, UNKNOWN_CODE_LARGE];
}

/** Sends an arbitrary code through the attached proxy. */
function probe(session: ConnectionModel, code: number): RequestResultModel {
  const data = MessageSequenceModel.create();
  const reply = MessageSequenceModel.create();
  data.writeString(REQUEST_PAYLOAD);
  const proxy = session.proxy;
  if (proxy === undefined) {
    data.reclaim();
    reply.reclaim();
    return new RequestResultModel(ERROR_NONE, '');
  }
  const result = proxy.sendMessageRequest(code, data, reply, new MessageOptionModel());
  data.reclaim();
  reply.reclaim();
  return result;
}

/** Counts probes that fail for the supplied codes. */
function failuresFor(session: ConnectionModel, codes: number[]): number {
  let total = 0;
  for (let index = 0; index < codes.length; index++) {
    if (!probe(session, codes[index]).isSuccess()) {
      total = total + 1;
    }
  }
  return total;
}

/** Joins numbers for compact order assertions. */
function numberTrace(values: number[]): string {
  let text = '';
  for (let index = 0; index < values.length; index++) {
    if (index > 0) {
      text = text + ',';
    }
    text = text + String(values[index]);
  }
  return text;
}

export default function clientUnknown(): void {
  describe('ClientUnknownCodes', () => {
    beforeAll(() => {
      logSuite('ClientUnknownCodes', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ClientUnknownCodes', 'end');
    });
    /**
     * @tc.name          clientUnknownZeroConstant
     * @tc.desc          The first unknown constant is zero.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read UNKNOWN_CODE_ZERO.
     *                   2. Compare with the literal zero.
     *                   3. Check the known-code oracle.
     * @tc.expected      The constant is 0 and is not a known request code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientUnknownZeroConstant', 0, () => {
      expect(UNKNOWN_CODE_ZERO).assertEqual(0);
      expect(isKnownRequestCode(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(expectedReplyFor(UNKNOWN_CODE_ZERO)).assertEqual('');
      expect(UNKNOWN_CODE_ZERO === REQUEST_CODE).assertFalse();
      expect(UNKNOWN_CODE_ZERO < REQUEST_CODE).assertTrue();
    });

    /**
     * @tc.name          clientUnknownTwoConstant
     * @tc.desc          The second unknown constant is two.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read UNKNOWN_CODE_TWO.
     *                   2. Compare with the literal two.
     *                   3. Check the known-code oracle.
     * @tc.expected      The constant is 2 and is not handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientUnknownTwoConstant', 0, () => {
      expect(UNKNOWN_CODE_TWO).assertEqual(2);
      expect(isKnownRequestCode(UNKNOWN_CODE_TWO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_TWO)).assertFalse();
      expect(expectedReplyFor(UNKNOWN_CODE_TWO)).assertEqual('');
      expect(UNKNOWN_CODE_TWO).assertEqual(REQUEST_CODE + 1);
      expect(UNKNOWN_CODE_TWO > REQUEST_CODE).assertTrue();
    });

    /**
     * @tc.name          clientUnknownNegativeConstant
     * @tc.desc          The third unknown constant is minus one.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read UNKNOWN_CODE_NEGATIVE.
     *                   2. Compare with -1. 3. Check the oracle.
     * @tc.expected      The constant is -1 and is not handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientUnknownNegativeConstant', 0, () => {
      expect(UNKNOWN_CODE_NEGATIVE).assertEqual(-1);
      expect(isKnownRequestCode(UNKNOWN_CODE_NEGATIVE)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_NEGATIVE)).assertFalse();
      expect(expectedReplyFor(UNKNOWN_CODE_NEGATIVE)).assertEqual('');
      expect(UNKNOWN_CODE_NEGATIVE < 0).assertTrue();
      expect(UNKNOWN_CODE_NEGATIVE < UNKNOWN_CODE_ZERO).assertTrue();
    });

    /**
     * @tc.name          clientUnknownLargeConstant
     * @tc.desc          The fourth unknown constant is ninety-nine.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read UNKNOWN_CODE_LARGE.
     *                   2. Compare with 99. 3. Check the oracle.
     * @tc.expected      The constant is 99 and is not handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientUnknownLargeConstant', 0, () => {
      expect(UNKNOWN_CODE_LARGE).assertEqual(99);
      expect(isKnownRequestCode(UNKNOWN_CODE_LARGE)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_LARGE)).assertFalse();
      expect(expectedReplyFor(UNKNOWN_CODE_LARGE)).assertEqual('');
      expect(UNKNOWN_CODE_LARGE > 10).assertTrue();
      expect(UNKNOWN_CODE_LARGE === UNKNOWN_CODE_TWO).assertFalse();
    });

    /**
     * @tc.name          clientUnknownConstantsAreFour
     * @tc.desc          The helper collects the four unknown codes in order.
     * @tc.precondition  unknownCodes helper is defined.
     * @tc.steps         1. Call the helper. 2. Compare the length.
     *                   3. Compare the joined trace.
     * @tc.expected      The list is [0, 2, -1, 99].
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownConstantsAreFour', 0, () => {
      const codes = unknownCodes();
      expect(codes.length).assertEqual(4);
      expect(codes[0]).assertEqual(0);
      expect(codes[1]).assertEqual(2);
      expect(codes[2]).assertEqual(-1);
      expect(codes[3]).assertEqual(99);
      expect(numberTrace(codes)).assertEqual('0,2,-1,99');
      expect(codes.indexOf(REQUEST_CODE)).assertEqual(-1);
    });

    /**
     * @tc.name          clientUnknownOracleRejectsAll
     * @tc.desc          The handled oracle rejects every unknown code.
     * @tc.precondition  expectedHandled is exported.
     * @tc.steps         1. Walk the four codes.
     *                   2. Count rejections.
     *                   3. Compare with code 1.
     * @tc.expected      Four rejections and one acceptance for code 1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownOracleRejectsAll', 0, () => {
      const codes = unknownCodes();
      let rejections = 0;
      for (let index = 0; index < codes.length; index++) {
        if (!expectedHandled(codes[index])) {
          rejections = rejections + 1;
        }
      }
      expect(rejections).assertEqual(4);
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(expectedHandled(UNKNOWN_CODE_ZERO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_TWO)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_NEGATIVE)).assertFalse();
      expect(expectedHandled(UNKNOWN_CODE_LARGE)).assertFalse();
    });

    /**
     * @tc.name          clientUnknownZeroSendFails
     * @tc.desc          Sending code 0 through the proxy fails.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 0. 2. Read errCode and reply.
     *                   3. Inspect the recorded request.
     * @tc.expected      The errCode is ERROR_SEND with an empty reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownZeroSendFails', 0, () => {
      const session = createConnectedSession();
      const result = probe(session, UNKNOWN_CODE_ZERO);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.readReply()).assertEqual('');
      expect(session.proxy?.requests[0]).assertEqual(0);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          clientUnknownTwoSendFails
     * @tc.desc          Sending code 2 fails as off-by-one input.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 2. 2. Read errCode and reply size.
     *                   3. Inspect the stub handled codes.
     * @tc.expected      The errCode is ERROR_SEND and no text is stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownTwoSendFails', 0, () => {
      const session = createConnectedSession();
      const result = probe(session, UNKNOWN_CODE_TWO);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.reply.size()).assertEqual(0);
      expect(session.proxy?.stub.handledCodes[0]).assertEqual(2);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.requests[0]).assertEqual(2);
    });

    /**
     * @tc.name          clientUnknownNegativeSendFails
     * @tc.desc          Sending a negative code fails without a reply.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code -1. 2. Read errCode.
     *                   3. Confirm the stub did not read a payload.
     * @tc.expected      The errCode is ERROR_SEND with no stored text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownNegativeSendFails', 0, () => {
      const session = createConnectedSession();
      const result = probe(session, UNKNOWN_CODE_NEGATIVE);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.reply.readCount).assertEqual(0);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.stub.handledCodes[0]).assertEqual(-1);
      expect(session.proxy?.requests[0]).assertEqual(-1);
    });

    /**
     * @tc.name          clientUnknownLargeSendFails
     * @tc.desc          Sending code 99 fails as a far-away command.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 99. 2. Read errCode.
     *                   3. Compare the request list.
     * @tc.expected      The errCode is ERROR_SEND and 99 is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownLargeSendFails', 0, () => {
      const session = createConnectedSession();
      const result = probe(session, UNKNOWN_CODE_LARGE);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.errCode).assertEqual(16000003);
      expect(session.proxy?.requests[0]).assertEqual(99);
      expect(session.proxy?.sendCalls).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(1);
    });

    /**
     * @tc.name          clientUnknownAllSendFail
     * @tc.desc          All four unknown codes fail in one session.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe all four codes.
     *                   2. Count failures. 3. Compare the send counter.
     * @tc.expected      Four failures with four send calls.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownAllSendFail', 0, () => {
      const session = createConnectedSession();
      const codes = unknownCodes();
      const failures = failuresFor(session, codes);
      expect(failures).assertEqual(4);
      expect(session.proxy?.sendCalls).assertEqual(4);
      expect(session.proxy?.requests.length).assertEqual(4);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(4);
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.isConnected()).assertTrue();
    });

    /**
     * @tc.name          clientUnknownAllHaveNoReply
     * @tc.desc          No unknown code produces a readable reply value.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe each unknown code.
     *                   2. Collect reply sizes. 3. Compare with zero.
     * @tc.expected      Every reply sequence is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownAllHaveNoReply', 0, () => {
      const session = createConnectedSession();
      const codes = unknownCodes();
      for (let index = 0; index < codes.length; index++) {
        const result = probe(session, codes[index]);
        expect(result.reply.size()).assertEqual(0);
        expect(result.reply.isEmpty()).assertTrue();
        expect(result.replyText).assertEqual('');
        expect(result.readReply()).assertEqual('');
      }
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.sendCalls).assertEqual(4);
    });

    /**
     * @tc.name          clientUnknownReplyOracleEmpty
     * @tc.desc          The reply oracle returns '' for every unknown code.
     * @tc.precondition  expectedReplyFor is exported.
     * @tc.steps         1. Ask the oracle for all four codes.
     *                   2. Compare each answer with ''.
     *                   3. Compare with code 1.
     * @tc.expected      All four answers are empty while code 1 returns a value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownReplyOracleEmpty', 0, () => {
      const codes = unknownCodes();
      for (let index = 0; index < codes.length; index++) {
        expect(expectedReplyFor(codes[index])).assertEqual('');
      }
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual(REPLY_PAYLOAD);
      expect(expectedReplyFor(UNKNOWN_CODE_ZERO).length).assertEqual(0);
      expect(expectedReplyFor(UNKNOWN_CODE_LARGE).length).assertEqual(0);
      expect(expectedReplyFor(REQUEST_CODE).length).assertEqual(9);
    });

    /**
     * @tc.name          clientUnknownKnownAfterUnknown
     * @tc.desc          A valid request after an unknown one still succeeds.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 0. 2. Probe code 1.
     *                   3. Compare both results.
     * @tc.expected      The valid request replies while the unknown one fails.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownKnownAfterUnknown', 0, () => {
      const session = createConnectedSession();
      const failed = probe(session, UNKNOWN_CODE_ZERO);
      const succeeded = probe(session, REQUEST_CODE);
      expect(failed.isSuccess()).assertFalse();
      expect(succeeded.isSuccess()).assertTrue();
      expect(succeeded.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.requests.join(',')).assertEqual('0,1');
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.sendCalls).assertEqual(2);
    });

    /**
     * @tc.name          clientUnknownUnknownAfterKnown
     * @tc.desc          An unknown request after a valid one fails cleanly.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 1. 2. Probe code 2.
     *                   3. Compare errCodes and texts.
     * @tc.expected      The second errCode is ERROR_SEND and only one text is stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownUnknownAfterKnown', 0, () => {
      const session = createConnectedSession();
      const succeeded = probe(session, REQUEST_CODE);
      const failed = probe(session, UNKNOWN_CODE_TWO);
      expect(succeeded.errCode).assertEqual(ERROR_NONE);
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(failed.readReply()).assertEqual('');
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(session.proxy?.requests.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.name          clientUnknownOrderPreserved
     * @tc.desc          Unknown codes appear in the request history in order.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe 99, -1, 2, 0.
     *                   2. Read the recorded order.
     *                   3. Compare with the sent order.
     * @tc.expected      The recorded order equals the send order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownOrderPreserved', 0, () => {
      const session = createConnectedSession();
      probe(session, UNKNOWN_CODE_LARGE);
      probe(session, UNKNOWN_CODE_NEGATIVE);
      probe(session, UNKNOWN_CODE_TWO);
      probe(session, UNKNOWN_CODE_ZERO);
      const requests = session.proxy?.requests;
      expect(requests?.length).assertEqual(4);
      expect(numberTrace(requests === undefined ? [] : requests)).assertEqual('99,-1,2,0');
      expect(session.proxy?.sendCalls).assertEqual(4);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(4);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          clientUnknownDuplicateProbes
     * @tc.desc          Repeating an unknown code produces identical failures.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 2 three times.
     *                   2. Compare errCodes and reply sizes.
     *                   3. Compare the request history.
     * @tc.expected      All three results are identical failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownDuplicateProbes', 0, () => {
      const session = createConnectedSession();
      const first = probe(session, UNKNOWN_CODE_TWO);
      const second = probe(session, UNKNOWN_CODE_TWO);
      const third = probe(session, UNKNOWN_CODE_TWO);
      expect(first.errCode).assertEqual(ERROR_SEND);
      expect(second.errCode).assertEqual(first.errCode);
      expect(third.errCode).assertEqual(first.errCode);
      expect(second.reply.size()).assertEqual(first.reply.size());
      expect(third.reply.size()).assertEqual(0);
      expect(session.proxy?.requests.join(',')).assertEqual('2,2,2');
      expect(session.proxy?.sendCalls).assertEqual(3);
    });

    /**
     * @tc.name          clientUnknownHandlerCount
     * @tc.desc          The stub handler is still invoked for unknown codes.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe all four codes.
     *                   2. Read the handled code list.
     *                   3. Compare the count with the send count.
     * @tc.expected      Four handler entries are recorded, one per attempt.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownHandlerCount', 0, () => {
      const session = createConnectedSession();
      const codes = unknownCodes();
      failuresFor(session, codes);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(4);
      expect(session.proxy?.stub.requestCount()).assertEqual(4);
      expect(session.proxy?.sendCalls).assertEqual(4);
      expect(numberTrace(session.proxy?.stub.handledCodes === undefined ?
        [] : session.proxy.stub.handledCodes)).assertEqual('0,2,-1,99');
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          clientUnknownNoClientEvent
     * @tc.desc          Proxy-level unknown probes add no client events.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Record the event count.
     *                   2. Probe all four codes.
     *                   3. Compare the count.
     * @tc.expected      The event count is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownNoClientEvent', 0, () => {
      const session = createConnectedSession();
      const before = session.events.size();
      failuresFor(session, unknownCodes());
      expect(session.events.size()).assertEqual(before);
      expect(session.events.size()).assertEqual(3);
      expect(session.events.countOf('send-failed')).assertEqual(0);
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(0);
      expect(session.events.last()).assertEqual('connected:IPCStubTest');
    });

    /**
     * @tc.name          clientUnknownNoClientToast
     * @tc.desc          Unknown probes do not add toasts.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Record the toast count.
     *                   2. Probe all four codes.
     *                   3. Compare the list.
     * @tc.expected      Only the connect toast remains.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownNoClientToast', 0, () => {
      const session = createConnectedSession();
      failuresFor(session, unknownCodes());
      expect(session.toasts.length).assertEqual(1);
      expect(session.toasts[0]).assertEqual('connectAbility success');
      expect(session.lastToast() === SEND_FAIL_TOAST).assertFalse();
      expect(session.lastToast() === SEND_SUCCESS_TOAST).assertFalse();
      expect(session.lastToast()).assertEqual('connectAbility success');
      expect(session.toasts.indexOf(SEND_FAIL_TOAST)).assertEqual(-1);
    });

    /**
     * @tc.name          clientUnknownNoClientLog
     * @tc.desc          Unknown probes leave the client log untouched.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Record the log size.
     *                   2. Probe all four codes.
     *                   3. Compare the log.
     * @tc.expected      The log keeps its two INFO lines and no ERROR line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownNoClientLog', 0, () => {
      const session = createConnectedSession();
      const before = session.logs.size();
      failuresFor(session, unknownCodes());
      expect(session.logs.size()).assertEqual(before);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
      expect(session.logs.countLevel('INFO')).assertEqual(2);
      expect(session.logs.contains('16000003')).assertFalse();
      expect(session.logs.contains('proxy is invalid')).assertFalse();
      expect(session.logs.lines[1]).assertEqual('INFO onConnect');
    });

    /**
     * @tc.name          clientUnknownMetricsUnaffected
     * @tc.desc          Proxy-level failures are invisible to client metrics.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe all four codes.
     *                   2. Build metrics. 3. Compare all counters.
     * @tc.expected      Sends, replies and failures all remain zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownMetricsUnaffected', 0, () => {
      const session = createConnectedSession();
      failuresFor(session, unknownCodes());
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.connects).assertEqual(1);
      expect(session.proxy?.sendCalls).assertEqual(4);
      expect(session.proxy?.stub.requestCount()).assertEqual(4);
    });

    /**
     * @tc.name          clientUnknownSnapshotUnaffected
     * @tc.desc          The snapshot is unchanged after unknown probes.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Snapshot before.
     *                   2. Probe all four codes. 3. Snapshot after.
     * @tc.expected      Both snapshots are identical.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownSnapshotUnaffected', 0, () => {
      const session = createConnectedSession();
      const before = new ClientSnapshot(session);
      failuresFor(session, unknownCodes());
      const after = new ClientSnapshot(session);
      expect(before.sameAs(after)).assertTrue();
      expect(after.state).assertEqual('connected');
      expect(after.connectId).assertEqual(7);
      expect(after.hasProxy).assertTrue();
      expect(after.toastCount).assertEqual(1);
      expect(after.describe()).assertEqual(before.describe());
    });

    /**
     * @tc.name          clientUnknownProbeThenClientSend
     * @tc.desc          A client send after unknown probes still replies.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe two unknown codes.
     *                   2. Send through the client.
     *                   3. Compare the reply and toasts.
     * @tc.expected      The client send succeeds with one success toast added.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownProbeThenClientSend', 0, () => {
      const session = createConnectedSession();
      probe(session, UNKNOWN_CODE_ZERO);
      probe(session, UNKNOWN_CODE_LARGE);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.requests.join(',')).assertEqual('0,99,1');
    });

    /**
     * @tc.name          clientUnknownZeroBoundary
     * @tc.desc          Zero is the boundary below the supported code.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Compare 0 and 1.
     *                   2. Probe 0 then 1.
     *                   3. Compare both outcomes.
     * @tc.expected      Only code 1 succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownZeroBoundary', 0, () => {
      const session = createConnectedSession();
      const below = probe(session, REQUEST_CODE - 1);
      const known = probe(session, REQUEST_CODE);
      expect(below.errCode).assertEqual(ERROR_SEND);
      expect(known.errCode).assertEqual(ERROR_NONE);
      expect(below.isSuccess() === known.isSuccess()).assertFalse();
      expect(session.proxy?.requests[0]).assertEqual(UNKNOWN_CODE_ZERO);
      expect(session.proxy?.requests[1]).assertEqual(REQUEST_CODE);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          clientUnknownTwoBoundary
     * @tc.desc          Two is the boundary above the supported code.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe 1 then 2.
     *                   2. Compare both outcomes.
     *                   3. Compare the stub texts.
     * @tc.expected      Only code 1 is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownTwoBoundary', 0, () => {
      const session = createConnectedSession();
      const known = probe(session, REQUEST_CODE);
      const above = probe(session, REQUEST_CODE + 1);
      expect(known.isSuccess()).assertTrue();
      expect(above.isSuccess()).assertFalse();
      expect(above.errCode).assertEqual(ERROR_SEND);
      expect(above.reply.isEmpty()).assertTrue();
      expect(session.proxy?.requests.join(',')).assertEqual('1,2');
      expect(session.proxy?.stub.handledCodes.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.name          clientUnknownNegativeBoundary
     * @tc.desc          Minus one is the signed boundary far below code 1.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe -1. 2. Compare with the oracle.
     *                   3. Inspect the request list.
     * @tc.expected      The probe fails and no reply exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownNegativeBoundary', 0, () => {
      const session = createConnectedSession();
      const result = probe(session, UNKNOWN_CODE_NEGATIVE);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertEqual(expectedHandled(UNKNOWN_CODE_NEGATIVE));
      expect(result.reply.isEmpty()).assertTrue();
      expect(session.proxy?.requests[0]).assertEqual(-1);
      expect(session.proxy?.sendCalls).assertEqual(1);
      expect(session.proxy?.stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          clientUnknownLargeBoundary
     * @tc.desc          Ninety-nine is far above any supported command.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe 99. 2. Probe 100.
     *                   3. Compare both failures.
     * @tc.expected      Both far-away codes fail identically.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownLargeBoundary', 0, () => {
      const session = createConnectedSession();
      const first = probe(session, 99);
      const second = probe(session, 100);
      expect(first.errCode).assertEqual(ERROR_SEND);
      expect(second.errCode).assertEqual(ERROR_SEND);
      expect(first.errCode).assertEqual(second.errCode);
      expect(first.reply.isEmpty()).assertTrue();
      expect(second.reply.isEmpty()).assertTrue();
      expect(session.proxy?.requests.join(',')).assertEqual('99,100');
      expect(session.proxy?.stub.handledCodes.indexOf(99)).assertEqual(0);
    });

    /**
     * @tc.name          clientUnknownSetMembership
     * @tc.desc          None of the four values is the supported code.
     * @tc.precondition  Constants are loaded.
     * @tc.steps         1. Build the unknown list.
     *                   2. Search for the supported code.
     *                   3. Count known values in the list.
     * @tc.expected      The supported code is absent and no value is known.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownSetMembership', 0, () => {
      const codes = unknownCodes();
      expect(codes.indexOf(REQUEST_CODE)).assertEqual(-1);
      let known = 0;
      for (let index = 0; index < codes.length; index++) {
        if (isKnownRequestCode(codes[index])) {
          known = known + 1;
        }
      }
      expect(known).assertEqual(0);
      expect(codes.length).assertEqual(4);
      expect(codes.indexOf(0)).assertEqual(0);
      expect(codes.indexOf(99)).assertEqual(3);
      expect(numberTrace(codes)).assertEqual('0,2,-1,99');
    });

    /**
     * @tc.name          clientUnknownProbePayloadUnused
     * @tc.desc          Unknown codes never consume the request payload.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe each unknown code with a payload.
     *                   2. Confirm the stub text list is empty.
     *                   3. Confirm the request history is full.
     * @tc.expected      The payload is written but never read for unknown codes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownProbePayloadUnused', 0, () => {
      const session = createConnectedSession();
      failuresFor(session, unknownCodes());
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.stub.receivedTexts.indexOf(REQUEST_PAYLOAD)).assertEqual(-1);
      expect(session.proxy?.requests.length).assertEqual(4);
      expect(session.proxy?.sendCalls).assertEqual(4);
      expect(session.proxy?.stub.requestCount()).assertEqual(4);
      expect(session.events.countOf('send-ok')).assertEqual(0);
    });

    /**
     * @tc.name          clientUnknownMixedWithKnownCounts
     * @tc.desc          A mixed run counts replies only for code 1.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe 0, 1, 2, 1, -1, 1, 99.
     *                   2. Count successes and failures.
     *                   3. Compare the stub texts.
     * @tc.expected      Three successes, four failures and three texts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownMixedWithKnownCounts', 0, () => {
      const session = createConnectedSession();
      const codes: number[] = [0, 1, 2, 1, -1, 1, 99];
      let successes = 0;
      for (let index = 0; index < codes.length; index++) {
        if (probe(session, codes[index]).isSuccess()) {
          successes = successes + 1;
        }
      }
      expect(successes).assertEqual(3);
      expect(codes.length - successes).assertEqual(4);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(3);
      expect(session.proxy?.sendCalls).assertEqual(7);
      expect(session.proxy?.requests.join(',')).assertEqual('0,1,2,1,-1,1,99');
      expect(session.proxy?.stub.handledCodes.length).assertEqual(7);
    });

    /**
     * @tc.name          clientUnknownFingerprintsDiffer
     * @tc.desc          Unknown codes can be distinguished by request traces.
     * @tc.precondition  textFingerprint and numberTrace helpers.
     * @tc.steps         1. Hash the unknown list trace.
     *                   2. Hash a reordered trace.
     *                   3. Compare the hashes.
     * @tc.expected      The two orderings hash differently.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownFingerprintsDiffer', 0, () => {
      const ordered = textFingerprint(numberTrace([0, 2, -1, 99]));
      const reversed = textFingerprint(numberTrace([99, -1, 2, 0]));
      expect(ordered === reversed).assertFalse();
      expect(ordered).assertEqual(textFingerprint('0,2,-1,99'));
      expect(reversed).assertEqual(textFingerprint('99,-1,2,0'));
      expect(ordered).assertLarger(0);
      expect(reversed).assertLarger(0);
      expect(numberTrace([0, 2, -1, 99])).assertEqual('0,2,-1,99');
    });

    /**
     * @tc.name          clientUnknownZeroIsFalsyButNotSuccess
     * @tc.desc          Code zero must not be confused with a success code.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe code 0.
     *                   2. Compare with a zero errCode oracle.
     *                   3. Confirm the failure flag.
     * @tc.expected      The result errCode is not zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownZeroIsFalsyButNotSuccess', 0, () => {
      const session = createConnectedSession();
      const result = probe(session, UNKNOWN_CODE_ZERO);
      expect(UNKNOWN_CODE_ZERO).assertEqual(0);
      expect(result.errCode === ERROR_NONE).assertFalse();
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(result.errCode > 0).assertTrue();
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          clientUnknownAllFourSendCalls
     * @tc.desc          The send counter grows once per unknown probe.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe 0 and check the counter.
     *                   2. Probe 2 and check it again.
     *                   3. Probe the rest.
     * @tc.expected      The counter follows 1, 2, 4.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownAllFourSendCalls', 0, () => {
      const session = createConnectedSession();
      probe(session, UNKNOWN_CODE_ZERO);
      expect(session.proxy?.sendCalls).assertEqual(1);
      probe(session, UNKNOWN_CODE_TWO);
      expect(session.proxy?.sendCalls).assertEqual(2);
      probe(session, UNKNOWN_CODE_NEGATIVE);
      probe(session, UNKNOWN_CODE_LARGE);
      expect(session.proxy?.sendCalls).assertEqual(4);
      expect(session.proxy?.requests.length).assertEqual(4);
      expect(session.proxy?.stub.requestCount()).assertEqual(4);
    });

    /**
     * @tc.name          clientUnknownReplyTextNeverSet
     * @tc.desc          Unknown probes leave the stub reply text untouched.
     * @tc.precondition  A connected session with a custom reply.
     * @tc.steps         1. Read the stub reply text.
     *                   2. Probe all four codes.
     *                   3. Read the reply text again.
     * @tc.expected      The reply text stays 'hello rpc'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownReplyTextNeverSet', 0, () => {
      const session = createConnectedSession();
      const before = session.proxy?.stub.replyText;
      failuresFor(session, unknownCodes());
      expect(session.proxy?.stub.replyText).assertEqual(before);
      expect(session.proxy?.stub.replyText).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(4);
      expect(session.proxy?.stub.alive).assertTrue();
      expect(session.events.last()).assertEqual('connected:IPCStubTest');
    });

    /**
     * @tc.name          clientUnknownStubAliveUnchanged
     * @tc.desc          Unknown probes do not kill the stub or proxy.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe all four codes.
     *                   2. Check both alive flags.
     *                   3. Confirm the connection predicate.
     * @tc.expected      Both components stay alive and connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownStubAliveUnchanged', 0, () => {
      const session = createConnectedSession();
      failuresFor(session, unknownCodes());
      expect(session.proxy?.alive).assertTrue();
      expect(session.proxy?.stub.alive).assertTrue();
      expect(session.proxy?.isAlive()).assertTrue();
      expect(session.isConnected()).assertTrue();
      expect(session.deathRecipient.diedCount).assertEqual(0);
      expect(session.state).assertEqual('connected');
      expect(session.deathRecipient.registered).assertTrue();
    });

    /**
     * @tc.name          clientUnknownReconnectStillFails
     * @tc.desc          Unknown codes fail the same way after reconnecting.
     * @tc.precondition  A session that reconnected.
     * @tc.steps         1. Disconnect and reconnect.
     *                   2. Probe code 0 and code 2.
     *                   3. Compare both errCodes.
     * @tc.expected      Both still fail with ERROR_SEND.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownReconnectStillFails', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      session.connect(33);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const zero = probe(session, UNKNOWN_CODE_ZERO);
      const two = probe(session, UNKNOWN_CODE_TWO);
      expect(zero.errCode).assertEqual(ERROR_SEND);
      expect(two.errCode).assertEqual(ERROR_SEND);
      expect(zero.isSuccess() || two.isSuccess()).assertFalse();
      expect(session.proxy?.requests.join(',')).assertEqual('0,2');
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          clientUnknownDisconnectThenProbe
     * @tc.desc          A probe after disconnect reports the invalid proxy sentinel.
     * @tc.precondition  A disconnected session.
     * @tc.steps         1. Disconnect. 2. Probe code 0.
     *                   3. Read errCode and events.
     * @tc.expected      The probe returns the helper sentinel without a proxy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownDisconnectThenProbe', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      const result = probe(session, UNKNOWN_CODE_ZERO);
      expect(session.proxy === undefined).assertTrue();
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(result.reply.isEmpty()).assertTrue();
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.events.countOf('send-failed')).assertEqual(0);
      expect(session.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          clientUnknownCustomReplyStillFails
     * @tc.desc          A custom reply text does not make unknown codes succeed.
     * @tc.precondition  A session with a custom reply.
     * @tc.steps         1. Probe all four codes.
     *                   2. Confirm every result fails.
     *                   3. Confirm the custom reply is intact.
     * @tc.expected      All probes fail and the stub reply remains custom.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownCustomReplyStillFails', 0, () => {
      const session = createConnectedSession('custom answer');
      const failures = failuresFor(session, unknownCodes());
      expect(failures).assertEqual(4);
      expect(session.proxy?.stub.replyText).assertEqual('custom answer');
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.sendString(REQUEST_PAYLOAD).readReply()).assertEqual('custom answer');
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          clientUnknownAfterSuccessfulSends
     * @tc.desc          Unknown codes do not reset accumulated metrics.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send successfully twice.
     *                   2. Probe all four unknown codes.
     *                   3. Build metrics.
     * @tc.expected      The metrics still show two replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownAfterSuccessfulSends', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      session.sendString(REQUEST_PAYLOAD);
      failuresFor(session, unknownCodes());
      const metrics = ClientMetrics.from(session);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(2);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(2);
    });

    /**
     * @tc.name          clientUnknownOrderReversed
     * @tc.desc          A reversed probe order is preserved exactly.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe 99, -1, 2, 0.
     *                   2. Compare the recorded order.
     *                   3. Compare the handled codes.
     * @tc.expected      Both histories match the reversed order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownOrderReversed', 0, () => {
      const session = createConnectedSession();
      const codes: number[] = [99, -1, 2, 0];
      failuresFor(session, codes);
      expect(session.proxy?.requests.join(',')).assertEqual('99,-1,2,0');
      expect(numberTrace(session.proxy?.stub.handledCodes === undefined ?
        [] : session.proxy.stub.handledCodes)).assertEqual('99,-1,2,0');
      expect(session.proxy?.sendCalls).assertEqual(4);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.requests.length).assertEqual(4);
      expect(session.proxy?.requests[0]).assertEqual(99);
    });

    /**
     * @tc.name          clientUnknownStubReplyPreserved
     * @tc.desc          The stub reply text is unchanged after four failures.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Record the reply text.
     *                   2. Probe all four codes. 3. Compare the text.
     * @tc.expected      The reply text and the request count differ as expected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownStubReplyPreserved', 0, () => {
      const session = createConnectedSession();
      const reply = session.proxy?.stub.replyText;
      failuresFor(session, unknownCodes());
      expect(session.proxy?.stub.replyText).assertEqual(reply);
      expect(reply).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.requestCount()).assertEqual(4);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(4);
      expect(session.proxy?.stub.alive).assertTrue();
    });

    /**
     * @tc.name          clientUnknownFourDistinctCodes
     * @tc.desc          The four unknown constants are pairwise distinct.
     * @tc.precondition  Constants are loaded.
     * @tc.steps         1. Compare every pair.
     *                   2. Count distinct values.
     *                   3. Confirm the set size.
     * @tc.expected      All six pairs differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownFourDistinctCodes', 0, () => {
      const codes = unknownCodes();
      expect(codes[0] === codes[1]).assertFalse();
      expect(codes[0] === codes[2]).assertFalse();
      expect(codes[0] === codes[3]).assertFalse();
      expect(codes[1] === codes[2]).assertFalse();
      expect(codes[1] === codes[3]).assertFalse();
      expect(codes[2] === codes[3]).assertFalse();
      expect(codes.indexOf(codes[0])).assertEqual(0);
    });

    /**
     * @tc.name          clientUnknownClientFailureAfterProbe
     * @tc.desc          A client send fault after unknown probes is reported normally.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe two unknown codes.
     *                   2. Arm a send fault and send.
     *                   3. Inspect the toast and log.
     * @tc.expected      The client reports 16000003 and the fail toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownClientFailureAfterProbe', 0, () => {
      const session = createConnectedSession();
      probe(session, UNKNOWN_CODE_ZERO);
      probe(session, UNKNOWN_CODE_TWO);
      const proxy = session.proxy;
      if (proxy !== undefined) {
        proxy.failNextSend = ERROR_SEND;
      }
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.logs.contains('16000003')).assertTrue();
      expect(session.events.last()).assertEqual('send-failed:16000003');
      expect(session.proxy?.requests.join(',')).assertEqual('0,2,1');
      expect(session.events.countOf('send-ok')).assertEqual(0);
    });

    /**
     * @tc.name          clientUnknownZeroVersusNone
     * @tc.desc          Request code zero is not the success errCode zero.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Compare UNKNOWN_CODE_ZERO with ERROR_NONE.
     *                   2. Probe code zero.
     *                   3. Compare the result errCode with zero.
     * @tc.expected      The request code is zero while the errCode is 16000003.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownZeroVersusNone', 0, () => {
      const session = createConnectedSession();
      expect(UNKNOWN_CODE_ZERO === ERROR_NONE).assertTrue();
      const result = probe(session, UNKNOWN_CODE_ZERO);
      expect(result.errCode === UNKNOWN_CODE_ZERO).assertFalse();
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(session.proxy?.requests[0]).assertEqual(UNKNOWN_CODE_ZERO);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          clientUnknownSetFingerprint
     * @tc.desc          The unknown code set has a stable fingerprint.
     * @tc.precondition  unknownCodes and textFingerprint helpers.
     * @tc.steps         1. Hash the set trace.
     *                   2. Call unknownCodes again.
     *                   3. Compare the hashes.
     * @tc.expected      Both hashes match and are positive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownSetFingerprint', 0, () => {
      const first = textFingerprint(numberTrace(unknownCodes()));
      const second = textFingerprint(numberTrace(unknownCodes()));
      expect(first).assertEqual(second);
      expect(first).assertLarger(0);
      expect(numberTrace(unknownCodes())).assertEqual('0,2,-1,99');
      expect(unknownCodes().length).assertEqual(4);
      expect(textFingerprint('0,2,-1,99')).assertEqual(first);
      expect(first).assertEqual(textFingerprint('0,2,-1,99'));
    });

    /**
     * @tc.name          clientUnknownSummaryRejections
     * @tc.desc          A final summary of rejections for the four codes.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe each code once.
     *                   2. Count failures and successes.
     *                   3. Compare with the oracle totals.
     * @tc.expected      Four failures, zero successes and four send calls.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownSummaryRejections', 0, () => {
      const session = createConnectedSession();
      const codes = unknownCodes();
      let failures = 0;
      let successes = 0;
      for (let index = 0; index < codes.length; index++) {
        if (probe(session, codes[index]).isSuccess()) {
          successes = successes + 1;
        } else {
          failures = failures + 1;
        }
      }
      expect(failures).assertEqual(4);
      expect(successes).assertEqual(0);
      expect(session.proxy?.sendCalls).assertEqual(4);
      expect(session.proxy?.requests.length).assertEqual(4);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.events.countOf('send-ok')).assertEqual(0);
    });

    /**
     * @tc.name          clientUnknownRequestCodeOneContrast
     * @tc.desc          The supported code is the only one the stub answers.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe 0, 1, 2 and 99.
     *                   2. Compare the success flags.
     *                   3. Compare the stub text count.
     * @tc.expected      Only code 1 succeeds and only one text is stored.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownRequestCodeOneContrast', 0, () => {
      const session = createConnectedSession();
      const zero = probe(session, 0);
      const one = probe(session, 1);
      const two = probe(session, 2);
      const large = probe(session, 99);
      expect(zero.isSuccess()).assertFalse();
      expect(one.isSuccess()).assertTrue();
      expect(two.isSuccess()).assertFalse();
      expect(large.isSuccess()).assertFalse();
      expect(one.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.proxy?.requests.join(',')).assertEqual('0,1,2,99');
    });

    /**
     * @tc.name          clientUnknownBoundaryTwoVsThree
     * @tc.desc          Codes two and three are both unknown and fail alike.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe 2 and 3.
     *                   2. Compare both errCodes and replies.
     *                   3. Count the stored texts.
     * @tc.expected      Both fail with the same errCode and no texts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownBoundaryTwoVsThree', 0, () => {
      const session = createConnectedSession();
      const two = probe(session, 2);
      const three = probe(session, 3);
      expect(two.errCode).assertEqual(ERROR_SEND);
      expect(three.errCode).assertEqual(two.errCode);
      expect(two.reply.isEmpty()).assertTrue();
      expect(three.reply.isEmpty()).assertTrue();
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.requests.join(',')).assertEqual('2,3');
      expect(session.proxy?.sendCalls).assertEqual(2);
    });

    /**
     * @tc.name          clientUnknownNegativeVsZero
     * @tc.desc          Negative and zero codes fail without cross effects.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe -1 and 0.
     *                   2. Compare errCodes.
     *                   3. Confirm the request history.
     * @tc.expected      Both fail and the history is '-1,0'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownNegativeVsZero', 0, () => {
      const session = createConnectedSession();
      const negative = probe(session, -1);
      const zero = probe(session, 0);
      expect(negative.errCode).assertEqual(ERROR_SEND);
      expect(zero.errCode).assertEqual(ERROR_SEND);
      expect(negative.reply.size()).assertEqual(0);
      expect(zero.reply.size()).assertEqual(0);
      expect(session.proxy?.requests.join(',')).assertEqual('-1,0');
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          clientUnknownFinalMetrics
     * @tc.desc          Final metrics reflect only client sends, not probes.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe four unknown codes.
     *                   2. Send successfully once.
     *                   3. Build metrics.
     * @tc.expected      One send, one reply and zero failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownFinalMetrics', 0, () => {
      const session = createConnectedSession();
      failuresFor(session, unknownCodes());
      session.sendString(REQUEST_PAYLOAD);
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(1);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(session.proxy?.sendCalls).assertEqual(5);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          clientUnknownNoProxyHelperSentinel
     * @tc.desc          The probe helper returns a sentinel result without a proxy.
     * @tc.precondition  A session with a cleared proxy.
     * @tc.steps         1. Clear the proxy.
     *                   2. Probe code 0 and code 99.
     *                   3. Inspect both sentinels.
     * @tc.expected      Both sentinels report errCode 0 with empty replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownNoProxyHelperSentinel', 0, () => {
      const session = createConnectedSession();
      session.proxy = undefined;
      const first = probe(session, UNKNOWN_CODE_ZERO);
      const second = probe(session, UNKNOWN_CODE_LARGE);
      expect(first.errCode).assertEqual(ERROR_NONE);
      expect(second.errCode).assertEqual(ERROR_NONE);
      expect(first.reply.isEmpty()).assertTrue();
      expect(second.reply.isEmpty()).assertTrue();
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          clientUnknownContractClose
     * @tc.desc          Closing check that every unknown code is rejected end to end.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Validate constants and oracles.
     *                   2. Probe all four codes.
     *                   3. Confirm no state changed besides counters.
     * @tc.expected      The four codes are rejected with no reply and no toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownContractClose', 0, () => {
      const session = createConnectedSession();
      const beforeToasts = session.toasts.length;
      const beforeEvents = session.events.size();
      expect(expectedReplyFor(0)).assertEqual('');
      expect(expectedReplyFor(2)).assertEqual('');
      expect(expectedReplyFor(-1)).assertEqual('');
      expect(expectedReplyFor(99)).assertEqual('');
      failuresFor(session, unknownCodes());
      expect(session.toasts.length).assertEqual(beforeToasts);
      expect(session.events.size()).assertEqual(beforeEvents);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
    });

    /**
     * @tc.name          clientUnknownRepeatedZeroNoSideEffects
     * @tc.desc          Repeating code zero five times changes only counters.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe zero five times.
     *                   2. Compare events, toasts and logs.
     *                   3. Compare the request history.
     * @tc.expected      Five request entries with no client side effects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownRepeatedZeroNoSideEffects', 0, () => {
      const session = createConnectedSession();
      for (let index = 0; index < 5; index++) {
        probe(session, UNKNOWN_CODE_ZERO);
      }
      expect(session.proxy?.requests.length).assertEqual(5);
      expect(session.proxy?.requests.join(',')).assertEqual('0,0,0,0,0');
      expect(session.proxy?.sendCalls).assertEqual(5);
      expect(session.events.size()).assertEqual(3);
      expect(session.toasts.length).assertEqual(1);
      expect(session.logs.size()).assertEqual(2);
    });

    /**
     * @tc.name          clientUnknownAllReplyOracleEmpty
     * @tc.desc          The reply oracle is empty for all four values, including 0.
     * @tc.precondition  expectedReplyFor is exported.
     * @tc.steps         1. Collect the oracle answers.
     *                   2. Join them. 3. Compare with an empty blob.
     * @tc.expected      The joined answer contains no characters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownAllReplyOracleEmpty', 0, () => {
      const codes = unknownCodes();
      let text = '';
      for (let index = 0; index < codes.length; index++) {
        text = text + expectedReplyFor(codes[index]);
      }
      expect(text).assertEqual('');
      expect(text.length).assertEqual(0);
      expect(expectedReplyFor(0)).assertEqual('');
      expect(expectedReplyFor(99)).assertEqual('');
      expect(expectedReplyFor(REQUEST_CODE)).assertEqual('hello rpc');
      expect(expectedReplyFor(REQUEST_CODE).length).assertEqual(9);
    });

    /**
     * @tc.name          clientUnknownMixedMetricUntouched
     * @tc.desc          Probe traffic does not alter success-only metrics.
     * @tc.precondition  A connected session with one successful send.
     * @tc.steps         1. Send once.
     *                   2. Probe all four unknown codes.
     *                   3. Build metrics.
     * @tc.expected      The ratio stays one and failures stay zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownMixedMetricUntouched', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      const before = ClientMetrics.from(session);
      failuresFor(session, unknownCodes());
      const after = ClientMetrics.from(session);
      expect(after.sends).assertEqual(before.sends);
      expect(after.replies).assertEqual(before.replies);
      expect(after.failures).assertEqual(0);
      expect(after.successRatio()).assertEqual(1);
      expect(after.fingerprint()).assertEqual(before.fingerprint());
      expect(session.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          clientUnknownLargeRequestHistory
     * @tc.desc          The request history keeps every large-code probe.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe 99, 98, 97.
     *                   2. Read the history.
     *                   3. Compare the handled codes.
     * @tc.expected      All three large codes appear in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownLargeRequestHistory', 0, () => {
      const session = createConnectedSession();
      probe(session, 99);
      probe(session, 98);
      probe(session, 97);
      expect(session.proxy?.requests.join(',')).assertEqual('99,98,97');
      expect(numberTrace(session.proxy?.stub.handledCodes === undefined ?
        [] : session.proxy.stub.handledCodes)).assertEqual('99,98,97');
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.sendCalls).assertEqual(3);
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.proxy?.requests.length).assertEqual(3);
    });

    /**
     * @tc.name          clientUnknownBoundaryZeroNotHandled
     * @tc.desc          Zero is rejected by the handler even as the first call.
     * @tc.precondition  A freshly connected session.
     * @tc.steps         1. Probe zero as the first request.
     *                   2. Read the stub handler list.
     *                   3. Compare the reply count.
     * @tc.expected      The handler records zero and no reply is written.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientUnknownBoundaryZeroNotHandled', 0, () => {
      const session = createConnectedSession();
      expect(session.proxy?.stub.requestCount()).assertEqual(0);
      const result = probe(session, 0);
      expect(session.proxy?.stub.requestCount()).assertEqual(1);
      expect(session.proxy?.stub.handledCodes[0]).assertEqual(0);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(result.reply.writeCount).assertEqual(0);
      expect(result.reply.size()).assertEqual(0);
      expect(result.isSuccess()).assertFalse();
    });

    /**
     * @tc.name          clientUnknownFinalClose
     * @tc.desc          Final closure of the unknown-code suite.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Confirm the four constants.
     *                   2. Confirm the failure count.
     *                   3. Confirm the reply and toast state.
     * @tc.expected      Everything agrees with the unknown-code contract.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownFinalClose', 0, () => {
      const session = createConnectedSession();
      expect(unknownCodes().length).assertEqual(4);
      expect(failuresFor(session, unknownCodes())).assertEqual(4);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(0);
      expect(session.proxy?.stub.handledCodes.length).assertEqual(4);
      expect(session.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(session.events.countOf('send-failed')).assertEqual(0);
      expect(session.isConnected()).assertTrue();
    });

    /**
     * @tc.name          clientUnknownSingleKnownAnswerContrast
     * @tc.desc          One valid request contrasts with four unknown probes.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Probe four unknowns.
     *                   2. Send one valid request.
     *                   3. Compare texts, replies and events.
     * @tc.expected      The single valid request is the only reply-bearing call.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientUnknownSingleKnownAnswerContrast', 0, () => {
      const session = createConnectedSession();
      failuresFor(session, unknownCodes());
      const valid = session.sendString(REQUEST_PAYLOAD);
      expect(valid.isSuccess()).assertTrue();
      expect(valid.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(session.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(session.events.countOf('send-ok')).assertEqual(1);
      expect(session.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(session.proxy?.requests.length).assertEqual(5);
      expect(session.proxy?.sendCalls).assertEqual(5);
    });

  });
}
