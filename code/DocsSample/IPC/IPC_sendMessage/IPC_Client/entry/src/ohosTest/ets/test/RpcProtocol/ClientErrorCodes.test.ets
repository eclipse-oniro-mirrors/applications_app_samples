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
 * Error-code classification for the IPC client.
 *
 * SharedDriver documents six numeric outcomes: 0 for success and five
 * 160000xx faults covering connect, disconnect, send, invalid proxy and death
 * registration. The production client branches on `errCode != 0` when it
 * decides whether to log a failure. This suite checks the constants, the
 * non-zero predicate, success flags on RequestResult, the client paths that
 * produce each code, and the toast, event and metric consequences.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import {
  ERROR_NONE,
  ERROR_CONNECT,
  ERROR_DISCONNECT,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  ERROR_DEATH_REGISTER,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  SEND_FAIL_TOAST,
  SEND_SUCCESS_TOAST,
  CONNECT_FAIL_TOAST,
  DISCONNECT_FAIL_TOAST,
  STATE_FAILED,
  MessageSequenceModel,
  MessageOptionModel,
  RequestResultModel,
  RemoteProxyModel,
  RemoteStubModel,
  ConnectionModel,
  createConnectedSession,
  isNonZeroError,
  ClientMetrics,
  ClientSnapshot,
  expectedToastFor,
  UNKNOWN_CODE_ZERO
} from '../Shared/SharedDriver';

/** Arms a one-shot send failure on the session proxy. */
function armFailure(session: ConnectionModel, code: number): boolean {
  const proxy = session.proxy;
  if (proxy === undefined) {
    return false;
  }
  proxy.failNextSend = code;
  return true;
}

/** Maps an error code to the client component that reports it. */
function sourceOf(code: number): string {
  if (code === ERROR_NONE) {
    return 'none';
  }
  if (code === ERROR_CONNECT) {
    return 'connect';
  }
  if (code === ERROR_DISCONNECT) {
    return 'disconnect';
  }
  if (code === ERROR_SEND) {
    return 'send';
  }
  if (code === ERROR_PROXY_INVALID) {
    return 'proxy';
  }
  if (code === ERROR_DEATH_REGISTER) {
    return 'death';
  }
  return 'unknown';
}

/** Counts codes classified as faults by the exported predicate. */
function faultCount(codes: number[]): number {
  let total = 0;
  for (let index = 0; index < codes.length; index++) {
    if (isNonZeroError(codes[index])) {
      total = total + 1;
    }
  }
  return total;
}

export default function clientErrors(): void {
  describe('ClientErrorCodes', () => {
    beforeAll(() => {
      logSuite('ClientErrorCodes', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ClientErrorCodes', 'end');
    });
    /**
     * @tc.name          clientErrorsNoneIsZero
     * @tc.desc          Success is represented by the numeric value zero.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read ERROR_NONE. 2. Compare with 0.
     *                   3. Check the non-zero predicate.
     * @tc.expected      ERROR_NONE is 0 and is not a fault.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientErrorsNoneIsZero', 0, () => {
      expect(ERROR_NONE).assertEqual(0);
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      expect(sourceOf(ERROR_NONE)).assertEqual('none');
      expect(ERROR_NONE === 0).assertTrue();
      expect(ERROR_NONE < 1).assertTrue();
    });

    /**
     * @tc.name          clientErrorsConnectCode
     * @tc.desc          The connect failure code is 16000001.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read ERROR_CONNECT. 2. Compare with the literal.
     *                   3. Check the fault predicate.
     * @tc.expected      The code is 16000001 and counts as a fault.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientErrorsConnectCode', 0, () => {
      expect(ERROR_CONNECT).assertEqual(16000001);
      expect(isNonZeroError(ERROR_CONNECT)).assertTrue();
      expect(sourceOf(ERROR_CONNECT)).assertEqual('connect');
      expect(ERROR_CONNECT).assertLarger(0);
      expect(ERROR_CONNECT === ERROR_NONE).assertFalse();
      expect(ERROR_CONNECT).assertEqual(16000000 + 1);
    });

    /**
     * @tc.name          clientErrorsDisconnectCode
     * @tc.desc          The disconnect failure code is 16000002.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read ERROR_DISCONNECT. 2. Compare with the literal.
     *                   3. Check the fault predicate.
     * @tc.expected      The code is 16000002 and counts as a fault.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientErrorsDisconnectCode', 0, () => {
      expect(ERROR_DISCONNECT).assertEqual(16000002);
      expect(isNonZeroError(ERROR_DISCONNECT)).assertTrue();
      expect(sourceOf(ERROR_DISCONNECT)).assertEqual('disconnect');
      expect(ERROR_DISCONNECT).assertLarger(ERROR_CONNECT);
      expect(ERROR_DISCONNECT).assertEqual(ERROR_CONNECT + 1);
      expect(ERROR_DISCONNECT === ERROR_SEND).assertFalse();
    });

    /**
     * @tc.name          clientErrorsSendCode
     * @tc.desc          The send failure code is 16000003.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read ERROR_SEND. 2. Compare with the literal.
     *                   3. Check the fault predicate.
     * @tc.expected      The code is 16000003 and counts as a fault.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientErrorsSendCode', 0, () => {
      expect(ERROR_SEND).assertEqual(16000003);
      expect(isNonZeroError(ERROR_SEND)).assertTrue();
      expect(sourceOf(ERROR_SEND)).assertEqual('send');
      expect(ERROR_SEND).assertLarger(ERROR_DISCONNECT);
      expect(ERROR_SEND).assertEqual(16000000 + 3);
      expect(ERROR_SEND === 0).assertFalse();
    });

    /**
     * @tc.name          clientErrorsProxyInvalidCode
     * @tc.desc          The invalid proxy code is 16000004.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read ERROR_PROXY_INVALID. 2. Compare with the literal.
     *                   3. Check the fault predicate.
     * @tc.expected      The code is 16000004 and counts as a fault.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientErrorsProxyInvalidCode', 0, () => {
      expect(ERROR_PROXY_INVALID).assertEqual(16000004);
      expect(isNonZeroError(ERROR_PROXY_INVALID)).assertTrue();
      expect(sourceOf(ERROR_PROXY_INVALID)).assertEqual('proxy');
      expect(ERROR_PROXY_INVALID).assertLarger(ERROR_SEND);
      expect(ERROR_PROXY_INVALID).assertEqual(ERROR_SEND + 1);
      expect(ERROR_PROXY_INVALID === ERROR_NONE).assertFalse();
    });

    /**
     * @tc.name          clientErrorsDeathRegisterCode
     * @tc.desc          The death registration code is 16000005.
     * @tc.precondition  SharedDriver constants are loaded.
     * @tc.steps         1. Read ERROR_DEATH_REGISTER. 2. Compare with the literal.
     *                   3. Check the fault predicate and sequence.
     * @tc.expected      The code is 16000005, the last of the five faults.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientErrorsDeathRegisterCode', 0, () => {
      expect(ERROR_DEATH_REGISTER).assertEqual(16000005);
      expect(isNonZeroError(ERROR_DEATH_REGISTER)).assertTrue();
      expect(sourceOf(ERROR_DEATH_REGISTER)).assertEqual('death');
      expect(ERROR_DEATH_REGISTER).assertEqual(ERROR_PROXY_INVALID + 1);
      expect(ERROR_DEATH_REGISTER).assertEqual(16000000 + 5);
      expect(faultCount([ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND,
        ERROR_PROXY_INVALID, ERROR_DEATH_REGISTER])).assertEqual(5);
    });

    /**
     * @tc.name          clientErrorsFaultCodesAreContiguous
     * @tc.desc          The five fault codes form a contiguous run.
     * @tc.precondition  Error constants are loaded.
     * @tc.steps         1. Build the fault list in order.
     *                   2. Check each adjacent difference.
     *                   3. Count the faults.
     * @tc.expected      Every adjacent difference is one and five faults exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsFaultCodesAreContiguous', 0, () => {
      const codes: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND,
        ERROR_PROXY_INVALID, ERROR_DEATH_REGISTER];
      expect(codes.length).assertEqual(5);
      expect(codes[1] - codes[0]).assertEqual(1);
      expect(codes[2] - codes[1]).assertEqual(1);
      expect(codes[3] - codes[2]).assertEqual(1);
      expect(codes[4] - codes[3]).assertEqual(1);
      expect(faultCount(codes)).assertEqual(5);
      expect(codes.indexOf(ERROR_NONE)).assertEqual(-1);
    });

    /**
     * @tc.name          clientErrorsFaultCodesSharePrefix
     * @tc.desc          Every fault code shares the 1600000x prefix.
     * @tc.precondition  Error constants are loaded.
     * @tc.steps         1. Divide each code by ten.
     *                   2. Compare the quotients.
     *                   3. Compare the remainders.
     * @tc.expected      All quotients are 1600000 and remainders run one to five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsFaultCodesSharePrefix', 0, () => {
      const codes: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND,
        ERROR_PROXY_INVALID, ERROR_DEATH_REGISTER];
      for (let index = 0; index < codes.length; index++) {
        expect(Math.floor(codes[index] / 10)).assertEqual(1600000);
      }
      expect(codes[0] % 10).assertEqual(1);
      expect(codes[1] % 10).assertEqual(2);
      expect(codes[2] % 10).assertEqual(3);
      expect(codes[3] % 10).assertEqual(4);
      expect(codes[4] % 10).assertEqual(5);
    });

    /**
     * @tc.name          clientErrorsPredicateRejectsZeroOnly
     * @tc.desc          Zero is the only value the fault predicate rejects.
     * @tc.precondition  isNonZeroError is exported.
     * @tc.steps         1. Test -1, 0 and 1.
     *                   2. Test the five fault codes.
     *                   3. Compare the verdicts.
     * @tc.expected      Only zero returns false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsPredicateRejectsZeroOnly', 0, () => {
      expect(isNonZeroError(-1)).assertTrue();
      expect(isNonZeroError(0)).assertFalse();
      expect(isNonZeroError(1)).assertTrue();
      expect(isNonZeroError(ERROR_CONNECT)).assertTrue();
      expect(isNonZeroError(ERROR_DEATH_REGISTER)).assertTrue();
      expect(isNonZeroError(ERROR_NONE + 0)).assertFalse();
      expect(isNonZeroError(ERROR_NONE + 1)).assertTrue();
    });

    /**
     * @tc.name          clientErrorsResultSuccessFlag
     * @tc.desc          A zero-code result reports success.
     * @tc.precondition  RequestResultModel is exported.
     * @tc.steps         1. Build a zero-code result.
     *                   2. Read isSuccess and errCode.
     *                   3. Compare with the predicate.
     * @tc.expected      The result is successful and the predicate is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientErrorsResultSuccessFlag', 0, () => {
      const result = new RequestResultModel(ERROR_NONE, REPLY_PAYLOAD);
      expect(result.errCode).assertEqual(0);
      expect(result.isSuccess()).assertTrue();
      expect(isNonZeroError(result.errCode)).assertFalse();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(sourceOf(result.errCode)).assertEqual('none');
      expect(result.errCode === ERROR_SEND).assertFalse();
    });

    /**
     * @tc.name          clientErrorsResultFailureFlag
     * @tc.desc          A non-zero result reports failure and keeps its reply.
     * @tc.precondition  RequestResultModel is exported.
     * @tc.steps         1. Build a send-fault result with text.
     *                   2. Read isSuccess and errCode.
     *                   3. Read the reply.
     * @tc.expected      The result fails while the attached text remains readable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsResultFailureFlag', 0, () => {
      const result = new RequestResultModel(ERROR_SEND, 'fault text');
      expect(result.errCode).assertEqual(16000003);
      expect(result.isSuccess()).assertFalse();
      expect(isNonZeroError(result.errCode)).assertTrue();
      expect(result.replyText).assertEqual('fault text');
      expect(result.readReply()).assertEqual('fault text');
      expect(sourceOf(result.errCode)).assertEqual('send');
    });

    /**
     * @tc.name          clientErrorsResultEachFaultCode
     * @tc.desc          Every fault code yields a failing result object.
     * @tc.precondition  RequestResultModel is exported.
     * @tc.steps         1. Build a result for each fault code.
     *                   2. Check isSuccess for all five.
     *                   3. Count the failures.
     * @tc.expected      All five results fail.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsResultEachFaultCode', 0, () => {
      const codes: number[] = [ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND,
        ERROR_PROXY_INVALID, ERROR_DEATH_REGISTER];
      let failures = 0;
      for (let index = 0; index < codes.length; index++) {
        const result = new RequestResultModel(codes[index], '');
        if (!result.isSuccess()) {
          failures = failures + 1;
        }
        expect(result.errCode).assertEqual(codes[index]);
        expect(result.reply.isEmpty()).assertTrue();
      }
      expect(failures).assertEqual(5);
      expect(failures).assertEqual(codes.length);
      expect(codes.length).assertEqual(5);
      expect(faultCount(codes)).assertEqual(5);
    });

    /**
     * @tc.name          clientErrorsNoProxyCode
     * @tc.desc          Sending without a proxy reports ERROR_PROXY_INVALID.
     * @tc.precondition  A connected session with a cleared proxy.
     * @tc.steps         1. Clear the proxy. 2. Send the payload.
     *                   3. Read the result errCode.
     * @tc.expected      The errCode is 16000004 and success is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsNoProxyCode', 0, () => {
      const session = createConnectedSession();
      session.proxy = undefined;
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.errCode).assertEqual(16000004);
      expect(result.isSuccess()).assertFalse();
      expect(result.reply.isEmpty()).assertTrue();
      expect(result.readReply()).assertEqual('');
      expect(sourceOf(result.errCode)).assertEqual('proxy');
    });

    /**
     * @tc.name          clientErrorsNoProxyToast
     * @tc.desc          The no-proxy path appends the send-fail toast.
     * @tc.precondition  A connected session with a cleared proxy.
     * @tc.steps         1. Clear the proxy. 2. Send once.
     *                   3. Read the toast list.
     * @tc.expected      The last toast is the connect-first message.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsNoProxyToast', 0, () => {
      const session = createConnectedSession();
      session.proxy = undefined;
      session.sendString(REQUEST_PAYLOAD);
      expect(session.toasts.length).assertEqual(2);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts[1]).assertEqual('sendRequest failed, please connect to the server first');
      expect(session.toasts.indexOf(SEND_SUCCESS_TOAST)).assertEqual(-1);
      expect(session.lastToast().indexOf('connect to the server first')).assertLarger(-1);
    });

    /**
     * @tc.name          clientErrorsNoProxyLog
     * @tc.desc          The no-proxy path logs an invalid proxy error.
     * @tc.precondition  A connected session with a cleared proxy.
     * @tc.steps         1. Clear the proxy. 2. Send once.
     *                   3. Search the logs.
     * @tc.expected      The log contains 'proxy is invalid' and one ERROR line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsNoProxyLog', 0, () => {
      const session = createConnectedSession();
      session.proxy = undefined;
      session.sendString(REQUEST_PAYLOAD);
      expect(session.logs.contains('proxy is invalid')).assertTrue();
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(session.logs.countLevel('INFO')).assertEqual(2);
      expect(session.logs.contains('16000004')).assertFalse();
      expect(session.logs.lines[2]).assertEqual('ERROR proxy is invalid');
      expect(session.events.last()).assertEqual('send-no-proxy:' + REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          clientErrorsDeadProxyCode
     * @tc.desc          A dead proxy produces ERROR_SEND rather than 16000004.
     * @tc.precondition  A connected session whose proxy was killed.
     * @tc.steps         1. Kill the proxy. 2. Send the payload.
     *                   3. Compare the code with the proxy-invalid constant.
     * @tc.expected      The errCode is 16000003, not 16000004.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsDeadProxyCode', 0, () => {
      const session = createConnectedSession();
      session.proxy?.kill();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.errCode === ERROR_PROXY_INVALID).assertFalse();
      expect(result.isSuccess()).assertFalse();
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.logs.contains('16000003')).assertTrue();
      expect(sourceOf(result.errCode)).assertEqual('send');
    });

    /**
     * @tc.name          clientErrorsInjectedProxyCode
     * @tc.desc          An injected 16000004 result is reported verbatim.
     * @tc.precondition  A connected session with an armed failure.
     * @tc.steps         1. Arm ERROR_PROXY_INVALID. 2. Send.
     *                   3. Read errCode and log.
     * @tc.expected      The client reports 16000004 even though a proxy exists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsInjectedProxyCode', 0, () => {
      const session = createConnectedSession();
      expect(armFailure(session, ERROR_PROXY_INVALID)).assertTrue();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(16000004);
      expect(session.logs.contains('16000004')).assertTrue();
      expect(session.events.last()).assertEqual('send-failed:16000004');
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.proxy?.failNextSend).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name          clientErrorsInjectedConnectCode
     * @tc.desc          An injected 16000001 result reaches the client log.
     * @tc.precondition  A connected session with an armed failure.
     * @tc.steps         1. Arm ERROR_CONNECT. 2. Send.
     *                   3. Inspect the failure event.
     * @tc.expected      The failure is recorded as send-failed:16000001.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsInjectedConnectCode', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_CONNECT);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_CONNECT);
      expect(result.errCode).assertEqual(16000001);
      expect(session.events.last()).assertEqual('send-failed:16000001');
      expect(session.logs.contains('16000001')).assertTrue();
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
    });

    /**
     * @tc.name          clientErrorsOnFailedRecordsCode
     * @tc.desc          The onFailed callback stores the failure code.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Connect. 2. Deliver onFailed with 16000001.
     *                   3. Read failedCode and the event.
     * @tc.expected      The stored code equals the delivered code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsOnFailedRecordsCode', 0, () => {
      const client = new ConnectionModel();
      client.connect(2);
      client.onFailed(ERROR_CONNECT);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.events.last()).assertEqual('failed:16000001');
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(isNonZeroError(client.failedCode)).assertTrue();
    });

    /**
     * @tc.name          clientErrorsOnFailedState
     * @tc.desc          onFailed moves the client into the failed state.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Connect. 2. Deliver onFailed.
     *                   3. Inspect state, proxy and registration.
     * @tc.expected      The state is failed with no proxy and no registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsOnFailedState', 0, () => {
      const client = new ConnectionModel();
      client.connect(2);
      client.onFailed(ERROR_DISCONNECT);
      expect(client.state).assertEqual('failed');
      expect(client.state === STATE_FAILED).assertTrue();
      expect(client.proxy === undefined).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.isDisconnect).assertFalse();
      expect(new ClientSnapshot(client).hasProxy).assertFalse();
      expect(new ClientSnapshot(client).state).assertEqual('failed');
    });

    /**
     * @tc.name          clientErrorsOnFailedToast
     * @tc.desc          onFailed shows the connect-failure toast.
     * @tc.precondition  A client in the connecting state.
     * @tc.steps         1. Deliver onFailed with 16000003.
     *                   2. Read the toast list.
     *                   3. Compare with the oracle.
     * @tc.expected      The last toast is the connect-failure message.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsOnFailedToast', 0, () => {
      const client = new ConnectionModel();
      client.onFailed(ERROR_SEND);
      expect(client.toasts.length).assertEqual(1);
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.lastToast()).assertEqual(expectedToastFor('connect-fail'));
      expect(client.toasts.indexOf(SEND_FAIL_TOAST)).assertEqual(-1);
      expect(client.logs.contains('onFailed code 16000003')).assertTrue();
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
    });

    /**
     * @tc.name          clientErrorsDisconnectFailToastOracle
     * @tc.desc          The disconnect-failure toast matches the action oracle.
     * @tc.precondition  expectedToastFor is exported.
     * @tc.steps         1. Ask the oracle for the disconnect-fail action.
     *                   2. Compare with the constant.
     *                   3. Compare the success variant too.
     * @tc.expected      The oracle returns the documented disconnect-fail text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsDisconnectFailToastOracle', 0, () => {
      const failText = expectedToastFor('disconnect-fail');
      expect(failText).assertEqual(DISCONNECT_FAIL_TOAST);
      expect(failText.indexOf('disConnect failed')).assertEqual(0);
      expect(failText.indexOf('connect to the service first')).assertLarger(-1);
      expect(expectedToastFor('disconnect-success')).assertEqual('disconnectAbility success');
      expect(failText === SEND_FAIL_TOAST).assertFalse();
      expect(failText.length).assertLarger(10);
    });

    /**
     * @tc.name          clientErrorsToastOracleAllActions
     * @tc.desc          Every toast action maps to a distinct documented message.
     * @tc.precondition  expectedToastFor is exported.
     * @tc.steps         1. Ask for all six actions.
     *                   2. Count distinct messages.
     *                   3. Compare two known values.
     * @tc.expected      Six actions produce six distinct messages.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsToastOracleAllActions', 0, () => {
      const actions: string[] = ['connect-success', 'connect-fail', 'send-success',
        'send-fail', 'disconnect-fail', 'disconnect-success'];
      const messages: string[] = [];
      for (let index = 0; index < actions.length; index++) {
        messages.push(expectedToastFor(actions[index]));
      }
      expect(messages.length).assertEqual(6);
      expect(messages[0]).assertEqual('connectAbility success');
      expect(messages[2]).assertEqual('sendRequest success');
      const unique = messages.filter((value: string, index: number) => messages.indexOf(value) === index);
      expect(unique.length).assertEqual(6);
      expect(messages.indexOf('')).assertEqual(-1);
    });

    /**
     * @tc.name          clientErrorsFailureCodePreservedAfterSuccess
     * @tc.desc          A later success does not clear a previously stored failure code.
     * @tc.precondition  A client that failed once then reconnected.
     * @tc.steps         1. Deliver onFailed with 16000001.
     *                   2. Connect and deliver onConnect.
     *                   3. Read failedCode and state.
     * @tc.expected      The failedCode stays 16000001 while the state becomes connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsFailureCodePreservedAfterSuccess', 0, () => {
      const client = new ConnectionModel();
      client.onFailed(ERROR_CONNECT);
      expect(client.failedCode).assertEqual(16000001);
      client.connect(12);
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      expect(client.state).assertEqual('connected');
      expect(client.failedCode).assertEqual(16000001);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.failedCode).assertEqual(ERROR_CONNECT);
      expect(isNonZeroError(client.failedCode)).assertTrue();
    });

    /**
     * @tc.name          clientErrorsMetricsAfterInjectedFault
     * @tc.desc          Metrics count an injected fault as a failure.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Arm ERROR_SEND and send.
     *                   2. Build metrics. 3. Compare all counters.
     * @tc.expected      Sends is one, replies zero and failures one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsMetricsAfterInjectedFault', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(1);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          clientErrorsMetricsSuccessRatioZero
     * @tc.desc          A run made only of faults has a zero success ratio.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Trigger two injected faults.
     *                   2. Build metrics.
     *                   3. Compare sends, failures and ratio.
     * @tc.expected      Two sends, two failures and a zero ratio.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsMetricsSuccessRatioZero', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_PROXY_INVALID);
      session.sendString(REQUEST_PAYLOAD);
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(2);
      expect(metrics.successRatio()).assertEqual(0);
      expect(session.events.countOf('send-failed')).assertEqual(2);
      expect(session.events.countOf('send-ok')).assertEqual(0);
    });

    /**
     * @tc.name          clientErrorsMetricsFingerprintDiffersFromSuccess
     * @tc.desc          Fault-only and success-only runs hash differently.
     * @tc.precondition  Two connected sessions.
     * @tc.steps         1. Build a success run.
     *                   2. Build a fault run. 3. Compare fingerprints.
     * @tc.expected      The two fingerprints differ.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsMetricsFingerprintDiffersFromSuccess', 0, () => {
      const success = createConnectedSession();
      success.sendString(REQUEST_PAYLOAD);
      const fault = createConnectedSession();
      armFailure(fault, ERROR_SEND);
      fault.sendString(REQUEST_PAYLOAD);
      const successHash = ClientMetrics.from(success).fingerprint();
      const faultHash = ClientMetrics.from(fault).fingerprint();
      expect(successHash === faultHash).assertFalse();
      expect(successHash).assertLarger(0);
      expect(faultHash).assertLarger(0);
      expect(ClientMetrics.from(success).replies).assertEqual(1);
      expect(ClientMetrics.from(fault).replies).assertEqual(0);
    });

    /**
     * @tc.name          clientErrorsLogCountsTwoFaults
     * @tc.desc          Two injected faults produce two ERROR log lines.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Trigger two faults with different codes.
     *                   2. Count ERROR lines.
     *                   3. Confirm both codes appear.
     * @tc.expected      Two ERROR lines mention 16000003 and 16000004.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsLogCountsTwoFaults', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_PROXY_INVALID);
      session.sendString(REQUEST_PAYLOAD);
      expect(session.logs.countLevel('ERROR')).assertEqual(2);
      expect(session.logs.contains('16000003')).assertTrue();
      expect(session.logs.contains('16000004')).assertTrue();
      expect(session.logs.size()).assertEqual(4);
      expect(session.logs.lines[2].startsWith('ERROR')).assertTrue();
      expect(session.logs.lines[3].startsWith('ERROR')).assertTrue();
    });

    /**
     * @tc.name          clientErrorsEventTraceTwoFaults
     * @tc.desc          The event trace records each fault with its code.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Trigger two faults.
     *                   2. Compare the last two entries.
     *                   3. Count fault events.
     * @tc.expected      The entries are send-failed:16000003 then send-failed:16000004.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsEventTraceTwoFaults', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_PROXY_INVALID);
      session.sendString(REQUEST_PAYLOAD);
      expect(session.events.size()).assertEqual(5);
      expect(session.events.entries[3]).assertEqual('send-failed:16000003');
      expect(session.events.entries[4]).assertEqual('send-failed:16000004');
      expect(session.events.countOf('send-failed')).assertEqual(2);
      expect(session.events.last()).assertEqual('send-failed:16000004');
      expect(session.events.trace().indexOf('16000003')).assertLarger(-1);
    });

    /**
     * @tc.name          clientErrorsFaultThenSuccessRatio
     * @tc.desc          A mixed fault/success run reports a half ratio.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send successfully, then trigger one fault.
     *                   2. Build metrics. 3. Compare the ratio.
     * @tc.expected      The ratio is 0.5 with one reply and one failure.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsFaultThenSuccessRatio', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(metrics.successRatio() > 0).assertTrue();
      expect(metrics.successRatio() < 1).assertTrue();
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
    });

    /**
     * @tc.name          clientErrorsDisconnectRequestWithoutId
     * @tc.desc          A disconnect request without a connect id is refused.
     * @tc.precondition  A fresh client with the initial connect id.
     * @tc.steps         1. Call disconnectRequested.
     *                   2. Read the returned flag.
     *                   3. Inspect the error log and event count.
     * @tc.expected      The call returns false with an error log and no event.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsDisconnectRequestWithoutId', 0, () => {
      const client = new ConnectionModel();
      expect(client.connectId).assertEqual(-1);
      expect(client.disconnectRequested()).assertFalse();
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.logs.contains('disconnect without connectId')).assertTrue();
      expect(client.events.countOf('disconnect-request')).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          clientErrorsDisconnectRequestWithId
     * @tc.desc          A disconnect request with a connect id is accepted.
     * @tc.precondition  A client connected with id 77.
     * @tc.steps         1. Connect with id 77.
     *                   2. Call disconnectRequested.
     *                   3. Inspect the event and logs.
     * @tc.expected      The call returns true and records disconnect-request:77.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsDisconnectRequestWithId', 0, () => {
      const client = new ConnectionModel();
      client.connect(77);
      expect(client.disconnectRequested()).assertTrue();
      expect(client.events.last()).assertEqual('disconnect-request:77');
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.connectId).assertEqual(77);
      expect(client.isDisconnect).assertFalse();
    });

    /**
     * @tc.name          clientErrorsDisconnectCallbackClearsId
     * @tc.desc          The disconnect callback clears the connect id and proxy.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Call onDisconnect.
     *                   2. Read the connect id and proxy.
     *                   3. Confirm the success toast.
     * @tc.expected      The id returns to -1 with no proxy and a success toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsDisconnectCallbackClearsId', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      expect(session.connectId).assertEqual(-1);
      expect(session.proxy === undefined).assertTrue();
      expect(session.state).assertEqual('disconnected');
      expect(session.isDisconnect).assertTrue();
      expect(session.lastToast()).assertEqual('disconnectAbility success');
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
      expect(session.events.countOf('disconnected')).assertEqual(1);
    });

    /**
     * @tc.name          clientErrorsDeathRegisterFailureLog
     * @tc.desc          A failed death registration logs an error without a code.
     * @tc.precondition  A dead proxy delivered through onConnect.
     * @tc.steps         1. Kill a proxy and connect to it.
     *                   2. Read the client logs.
     *                   3. Inspect the registration flags.
     * @tc.expected      The log has one ERROR line and registration stays false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsDeathRegisterFailureLog', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      proxy.kill();
      const client = new ConnectionModel();
      client.connect(1);
      client.onConnect(proxy);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.logs.contains('register failed')).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxy.deathRegistered).assertFalse();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
    });

    /**
     * @tc.name          clientErrorsDeathRecipientAbsent
     * @tc.desc          A proxy without a recipient has no registration code path.
     * @tc.precondition  A fresh proxy.
     * @tc.steps         1. Inspect the recipient.
     *                   2. Notify death. 3. Read the flags.
     * @tc.expected      The recipient is undefined and death leaves no registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsDeathRecipientAbsent', 0, () => {
      const proxy = new RemoteProxyModel(new RemoteStubModel());
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      proxy.notifyDeath();
      expect(proxy.alive).assertFalse();
      expect(proxy.deathRecipient === undefined).assertTrue();
      expect(proxy.deathRegistered).assertFalse();
      expect(proxy.descriptor).assertEqual('IPCStubTest');
    });

    /**
     * @tc.name          clientErrorsResetClearsFailedCode
     * @tc.desc          Resetting the client restores failedCode to zero.
     * @tc.precondition  A client with a recorded failure.
     * @tc.steps         1. Deliver onFailed with 16000001.
     *                   2. Reset. 3. Read failedCode and state.
     * @tc.expected      The code returns to 0 and the state to disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsResetClearsFailedCode', 0, () => {
      const client = new ConnectionModel();
      client.onFailed(ERROR_CONNECT);
      expect(client.failedCode).assertEqual(16000001);
      client.reset();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.failedCode).assertEqual(0);
      expect(client.state).assertEqual('disconnected');
      expect(client.toasts.length).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
      expect(isNonZeroError(client.failedCode)).assertFalse();
    });

    /**
     * @tc.name          clientErrorsUnknownProbeReportsSendCode
     * @tc.desc          A rejected request code surfaces ERROR_SEND at the proxy.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send code 0 directly through the proxy.
     *                   2. Read the result errCode.
     *                   3. Compare with ERROR_SEND.
     * @tc.expected      The errCode is 16000003.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsUnknownProbeReportsSendCode', 0, () => {
      const session = createConnectedSession();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      const result = session.proxy?.sendMessageRequest(UNKNOWN_CODE_ZERO, data, reply,
        new MessageOptionModel());
      expect(result?.errCode).assertEqual(ERROR_SEND);
      expect(result?.errCode).assertEqual(16000003);
      expect(sourceOf(result === undefined ? -2 : result.errCode)).assertEqual('send');
      expect(isNonZeroError(result?.errCode === undefined ? ERROR_NONE : result.errCode)).assertTrue();
      expect(result?.isSuccess()).assertFalse();
      data.reclaim();
      reply.reclaim();
    });

    /**
     * @tc.name          clientErrorsUnknownProbeSkipsClientLog
     * @tc.desc          Proxy-level rejections do not add client error lines.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Record the log size.
     *                   2. Reject two unknown codes.
     *                   3. Compare the log size.
     * @tc.expected      The client log is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsUnknownProbeSkipsClientLog', 0, () => {
      const session = createConnectedSession();
      const before = session.logs.size();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString(REQUEST_PAYLOAD);
      session.proxy?.sendMessageRequest(UNKNOWN_CODE_ZERO, data, reply, new MessageOptionModel());
      session.proxy?.sendMessageRequest(UNKNOWN_CODE_ZERO, data, reply, new MessageOptionModel());
      expect(session.logs.size()).assertEqual(before);
      expect(session.logs.countLevel('ERROR')).assertEqual(0);
      expect(session.logs.contains('16000003')).assertFalse();
      expect(session.events.countOf('send-failed')).assertEqual(0);
      expect(session.proxy?.sendCalls).assertEqual(2);
      data.reclaim();
      reply.reclaim();
    });

    /**
     * @tc.name          clientErrorsSourceOfAllCodes
     * @tc.desc          The source oracle maps all six codes to their owners.
     * @tc.precondition  sourceOf helper and the constants.
     * @tc.steps         1. Map each code.
     *                   2. Count distinct owners.
     *                   3. Check two mappings.
     * @tc.expected      Six owners are produced with no unknown fallthrough.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsSourceOfAllCodes', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_CONNECT, ERROR_DISCONNECT, ERROR_SEND,
        ERROR_PROXY_INVALID, ERROR_DEATH_REGISTER];
      const owners: string[] = [];
      for (let index = 0; index < codes.length; index++) {
        owners.push(sourceOf(codes[index]));
      }
      expect(owners.length).assertEqual(6);
      expect(owners[0]).assertEqual('none');
      expect(owners[5]).assertEqual('death');
      expect(owners.indexOf('unknown')).assertEqual(-1);
      const unique = owners.filter((value: string, index: number) => owners.indexOf(value) === index);
      expect(unique.length).assertEqual(6);
      expect(sourceOf(12345)).assertEqual('unknown');
    });

    /**
     * @tc.name          clientErrorsFaultCountMixed
     * @tc.desc          The fault counter ignores zero in a mixed list.
     * @tc.precondition  faultCount helper.
     * @tc.steps         1. Count a list with two zeros.
     *                   2. Count a list of only zeros.
     *                   3. Compare both totals.
     * @tc.expected      The mixed list has three faults and the zero list none.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsFaultCountMixed', 0, () => {
      const mixed: number[] = [0, ERROR_SEND, 0, ERROR_CONNECT, ERROR_DEATH_REGISTER];
      expect(faultCount(mixed)).assertEqual(3);
      expect(faultCount([0, 0, 0])).assertEqual(0);
      expect(faultCount([])).assertEqual(0);
      expect(mixed.length).assertEqual(5);
      expect(mixed[0]).assertEqual(ERROR_NONE);
      expect(faultCount([ERROR_NONE])).assertEqual(0);
    });

    /**
     * @tc.name          clientErrorsToastAfterTwoFaults
     * @tc.desc          Each fault appends one fail toast.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Trigger two faults.
     *                   2. Read the toast count.
     *                   3. Compare the last toast.
     * @tc.expected      Four toasts exist: connect plus three failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsToastAfterTwoFaults', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_PROXY_INVALID);
      session.sendString(REQUEST_PAYLOAD);
      expect(session.toasts.length).assertEqual(3);
      expect(session.toasts[0]).assertEqual('connectAbility success');
      expect(session.toasts[1]).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts[2]).assertEqual(SEND_FAIL_TOAST);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts.indexOf(SEND_SUCCESS_TOAST)).assertEqual(-1);
    });

    /**
     * @tc.name          clientErrorsSnapshotAfterFault
     * @tc.desc          A failed send changes only the toast count in the snapshot.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Snapshot the session.
     *                   2. Trigger a fault. 3. Snapshot again.
     * @tc.expected      The flags match while the toast count grows by one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsSnapshotAfterFault', 0, () => {
      const session = createConnectedSession();
      const before = new ClientSnapshot(session);
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      const after = new ClientSnapshot(session);
      expect(before.state).assertEqual(after.state);
      expect(before.hasProxy).assertEqual(after.hasProxy);
      expect(before.deathRegistered).assertEqual(after.deathRegistered);
      expect(after.toastCount).assertEqual(before.toastCount + 1);
      expect(before.sameAs(after)).assertFalse();
      expect(after.toastCount).assertEqual(2);
    });

    /**
     * @tc.name          clientErrorsOnFailedTwiceUpdatesCode
     * @tc.desc          A second onFailed replaces the stored code.
     * @tc.precondition  A client that already failed once.
     * @tc.steps         1. Fail with 16000001.
     *                   2. Fail with 16000005.
     *                   3. Read failedCode and the event count.
     * @tc.expected      The stored code becomes 16000005 with two failure events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsOnFailedTwiceUpdatesCode', 0, () => {
      const client = new ConnectionModel();
      client.onFailed(ERROR_CONNECT);
      client.onFailed(ERROR_DEATH_REGISTER);
      expect(client.failedCode).assertEqual(ERROR_DEATH_REGISTER);
      expect(client.failedCode).assertEqual(16000005);
      expect(client.events.countOf('failed')).assertEqual(2);
      expect(client.events.entries[0]).assertEqual('failed:16000001');
      expect(client.events.entries[1]).assertEqual('failed:16000005');
      expect(client.toasts.length).assertEqual(2);
      expect(client.logs.countLevel('ERROR')).assertEqual(2);
    });

    /**
     * @tc.name          clientErrorsRepeatedConnectWarns
     * @tc.desc          A repeated connect in the connected state logs a warning.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Call connect twice more.
     *                   2. Count WARN lines.
     *                   3. Compare the connect call counter.
     * @tc.expected      Two warnings are logged and the call counter reaches three.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsRepeatedConnectWarns', 0, () => {
      const session = createConnectedSession();
      expect(session.connectCalls).assertEqual(1);
      expect(session.connect(1)).assertFalse();
      expect(session.connect(2)).assertFalse();
      expect(session.connectCalls).assertEqual(3);
      expect(session.logs.countLevel('WARN')).assertEqual(2);
      expect(session.events.countOf('connect')).assertEqual(1);
      expect(session.state).assertEqual('connected');
    });

    /**
     * @tc.name          clientErrorsStateAfterFaultAndDisconnect
     * @tc.desc          Disconnect after a fault leaves a clean disconnected state.
     * @tc.precondition  A connected session after one injected fault.
     * @tc.steps         1. Trigger a fault.
     *                   2. Disconnect. 3. Read state and flags.
     * @tc.expected      The state is disconnected with no proxy and no delivery errors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsStateAfterFaultAndDisconnect', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      expect(session.state).assertEqual('disconnected');
      expect(session.proxy === undefined).assertTrue();
      expect(session.connectId).assertEqual(-1);
      expect(session.deathRecipient.registered).assertFalse();
      expect(session.events.countOf('disconnected')).assertEqual(1);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.isDisconnect).assertTrue();
    });

    /**
     * @tc.name          clientErrorsMetricsConnectCount
     * @tc.desc          The metrics connect counter tracks successful connect events.
     * @tc.precondition  A default connected session.
     * @tc.steps         1. Build metrics. 2. Disconnect and reconnect.
     *                   3. Build metrics again.
     * @tc.expected      The connect count grows to two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsMetricsConnectCount', 0, () => {
      const session = createConnectedSession();
      expect(ClientMetrics.from(session).connects).assertEqual(1);
      session.onDisconnect();
      session.connect(20);
      session.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      const metrics = ClientMetrics.from(session);
      expect(metrics.connects).assertEqual(2);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(session.events.countOf('connect')).assertEqual(2);
      expect(session.events.countOf('connected')).assertEqual(2);
    });

    /**
     * @tc.name          clientErrorsAllToastsSummary
     * @tc.desc          A scripted run accumulates the expected toast sequence.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send successfully.
     *                   2. Trigger a fault. 3. Disconnect.
     * @tc.expected      The toasts are connect, success, fail and disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsAllToastsSummary', 0, () => {
      const session = createConnectedSession();
      session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      session.onDisconnect();
      expect(session.toasts.length).assertEqual(4);
      expect(session.toasts[0]).assertEqual('connectAbility success');
      expect(session.toasts[1]).assertEqual('sendRequest success');
      expect(session.toasts[2]).assertEqual(SEND_FAIL_TOAST);
      expect(session.toasts[3]).assertEqual('disconnectAbility success');
      expect(session.toasts.indexOf(CONNECT_FAIL_TOAST)).assertEqual(-1);
    });

    /**
     * @tc.name          clientErrorsResultCodeBoundaries
     * @tc.desc          Codes just outside the fault range remain non-zero faults.
     * @tc.precondition  isNonZeroError is exported.
     * @tc.steps         1. Test 16000000 and 16000006.
     *                   2. Test -16000001. 3. Compare the predicate.
     * @tc.expected      All three count as faults while zero does not.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsResultCodeBoundaries', 0, () => {
      expect(isNonZeroError(16000000)).assertTrue();
      expect(isNonZeroError(16000006)).assertTrue();
      expect(isNonZeroError(-16000001)).assertTrue();
      expect(sourceOf(16000000)).assertEqual('unknown');
      expect(sourceOf(16000006)).assertEqual('unknown');
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      expect(isNonZeroError(16000001)).assertTrue();
    });

    /**
     * @tc.name          clientErrorsErrorSummary
     * @tc.desc          The error contract holds across one end-to-end run.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Send successfully and fail once.
     *                   2. Read result, toast, log and metrics.
     *                   3. Cross-check all observables.
     * @tc.expected      Success and fault reporting agree on the same codes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsErrorSummary', 0, () => {
      const session = createConnectedSession();
      const ok = session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_SEND);
      const bad = session.sendString(REQUEST_PAYLOAD);
      expect(ok.errCode).assertEqual(ERROR_NONE);
      expect(bad.errCode).assertEqual(ERROR_SEND);
      expect(sourceOf(ok.errCode)).assertEqual('none');
      expect(sourceOf(bad.errCode)).assertEqual('send');
      expect(session.logs.contains('16000003')).assertTrue();
      expect(ClientMetrics.from(session).failures).assertEqual(1);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
    });

    /**
     * @tc.name          clientErrorsFaultAfterDisconnect
     * @tc.desc          A send after disconnect reports the invalid proxy code.
     * @tc.precondition  A disconnected session.
     * @tc.steps         1. Disconnect.
     *                   2. Send the payload. 3. Inspect code and toast.
     * @tc.expected      The code is 16000004 with the fail toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsFaultAfterDisconnect', 0, () => {
      const session = createConnectedSession();
      session.onDisconnect();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(session.events.last()).assertEqual('send-no-proxy:' + REQUEST_PAYLOAD);
      expect(session.logs.contains('proxy is invalid')).assertTrue();
      expect(session.toasts.length).assertEqual(3);
      expect(session.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          clientErrorsNoProxySnapshot
     * @tc.desc          The no-proxy failure appears in the snapshot toast count.
     * @tc.precondition  A connected session with a cleared proxy.
     * @tc.steps         1. Clear the proxy and send.
     *                   2. Snapshot. 3. Compare the toast count.
     * @tc.expected      The snapshot has no proxy and two toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsNoProxySnapshot', 0, () => {
      const session = createConnectedSession();
      session.proxy = undefined;
      session.sendString(REQUEST_PAYLOAD);
      const snapshot = new ClientSnapshot(session);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(2);
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.connectId).assertEqual(7);
      expect(snapshot.describe()).assertEqual('connected/7/false/true/2');
    });

    /**
     * @tc.name          clientErrorsPredicateTable
     * @tc.desc          The fault predicate agrees with a numeric table.
     * @tc.precondition  isNonZeroError is exported.
     * @tc.steps         1. Walk values from -2 to 2.
     *                   2. Compare each verdict with value !== 0.
     *                   3. Count agreements.
     * @tc.expected      All five verdicts agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsPredicateTable', 0, () => {
      let agreements = 0;
      for (let value = -2; value <= 2; value++) {
        if (isNonZeroError(value) === (value !== 0)) {
          agreements = agreements + 1;
        }
      }
      expect(agreements).assertEqual(5);
      expect(isNonZeroError(-2)).assertTrue();
      expect(isNonZeroError(-1)).assertTrue();
      expect(isNonZeroError(0)).assertFalse();
      expect(isNonZeroError(1)).assertTrue();
      expect(isNonZeroError(2)).assertTrue();
    });

    /**
     * @tc.name          clientErrorsFaultLogMessageFormat
     * @tc.desc          The fault log line embeds the numeric code.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Trigger a fault with 16000003.
     *                   2. Read the last log line.
     *                   3. Compare its prefix and content.
     * @tc.expected      The line is 'ERROR sendMessageRequest failed, errCode is 16000003'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsFaultLogMessageFormat', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      const lastLine = session.logs.lines[session.logs.lines.length - 1];
      expect(lastLine).assertEqual('ERROR sendMessageRequest failed, errCode is 16000003');
      expect(lastLine.startsWith('ERROR')).assertTrue();
      expect(lastLine.indexOf('errCode is 16000003')).assertLarger(-1);
      expect(session.logs.lines.length).assertEqual(3);
      expect(session.logs.countLevel('ERROR')).assertEqual(1);
      expect(session.logs.contains('sendMessageRequest failed')).assertTrue();
    });

    /**
     * @tc.name          clientErrorsDeathRegisterInjectedCode
     * @tc.desc          An injected death-register code is reported as a send fault.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Arm ERROR_DEATH_REGISTER. 2. Send.
     *                   3. Read result and log.
     * @tc.expected      The errCode is 16000005 and the log records it.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsDeathRegisterInjectedCode', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_DEATH_REGISTER);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(16000005);
      expect(result.errCode).assertEqual(ERROR_DEATH_REGISTER);
      expect(session.logs.contains('16000005')).assertTrue();
      expect(session.events.last()).assertEqual('send-failed:16000005');
      expect(sourceOf(result.errCode)).assertEqual('death');
      expect(session.lastToast()).assertEqual(SEND_FAIL_TOAST);
    });

    /**
     * @tc.name          clientErrorsEachFaultAppearsInLog
     * @tc.desc          Every injected code appears in the log when triggered.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Trigger codes 16000001, 16000002 and 16000005.
     *                   2. Search the log for each.
     *                   3. Count ERROR lines.
     * @tc.expected      All three codes are present with three ERROR lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsEachFaultAppearsInLog', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_CONNECT);
      session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_DISCONNECT);
      session.sendString(REQUEST_PAYLOAD);
      armFailure(session, ERROR_DEATH_REGISTER);
      session.sendString(REQUEST_PAYLOAD);
      expect(session.logs.contains('16000001')).assertTrue();
      expect(session.logs.contains('16000002')).assertTrue();
      expect(session.logs.contains('16000005')).assertTrue();
      expect(session.logs.countLevel('ERROR')).assertEqual(3);
      expect(session.events.countOf('send-failed')).assertEqual(3);
      expect(ClientMetrics.from(session).failures).assertEqual(3);
    });

    /**
     * @tc.name          clientErrorsNoSuccessEventOnFault
     * @tc.desc          A fault never produces a success event or reply read.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Arm a fault and send.
     *                   2. Count success events.
     *                   3. Confirm no reply text exists.
     * @tc.expected      The success count is zero and the reply is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsNoSuccessEventOnFault', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(session.events.countOf('send-ok')).assertEqual(0);
      expect(session.events.countOf('send-failed')).assertEqual(1);
      expect(session.events.last()).assertEqual('send-failed:16000003');
      expect(result.replyText).assertEqual('');
      expect(result.reply.isEmpty()).assertTrue();
      expect(session.logs.contains('reply ')).assertFalse();
      expect(session.toasts.indexOf(SEND_SUCCESS_TOAST)).assertEqual(-1);
    });

    /**
     * @tc.name          clientErrorsResetAfterFaultThenSend
     * @tc.desc          After a fault and reset, a send reports the invalid proxy.
     * @tc.precondition  A connected session after a fault.
     * @tc.steps         1. Trigger a fault. 2. Reset.
     *                   3. Send and read the result.
     * @tc.expected      The reset client returns 16000004 for the next send.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsResetAfterFaultThenSend', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      session.sendString(REQUEST_PAYLOAD);
      session.reset();
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(session.events.countOf('send-no-proxy')).assertEqual(1);
      expect(session.logs.contains('proxy is invalid')).assertTrue();
      expect(session.toasts.length).assertEqual(1);
      expect(session.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          clientErrorsZeroRatioWithoutSends
     * @tc.desc          Metrics with no sends report a zero ratio.
     * @tc.precondition  A connected session with no sends.
     * @tc.steps         1. Build metrics immediately.
     *                   2. Check sends and replies.
     *                   3. Compare the ratio.
     * @tc.expected      Sends, replies, failures are zero and the ratio is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsZeroRatioWithoutSends', 0, () => {
      const session = createConnectedSession();
      const metrics = ClientMetrics.from(session);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          clientErrorsTwoSessionsIndependent
     * @tc.desc          A fault in one session does not affect another.
     * @tc.precondition  Two connected sessions.
     * @tc.steps         1. Fault the first session.
     *                   2. Send on the second.
     *                   3. Compare both results.
     * @tc.expected      The first fails while the second replies normally.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('clientErrorsTwoSessionsIndependent', 0, () => {
      const first = createConnectedSession();
      const second = createConnectedSession();
      armFailure(first, ERROR_SEND);
      const failed = first.sendString(REQUEST_PAYLOAD);
      const succeeded = second.sendString(REQUEST_PAYLOAD);
      expect(failed.errCode).assertEqual(ERROR_SEND);
      expect(succeeded.errCode).assertEqual(ERROR_NONE);
      expect(succeeded.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(first.logs.contains('16000003')).assertTrue();
      expect(second.logs.contains('16000003')).assertFalse();
      expect(first.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(second.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
    });

    /**
     * @tc.name          clientErrorsFinalContract
     * @tc.desc          Final consistency check across codes, results and toasts.
     * @tc.precondition  A connected session.
     * @tc.steps         1. Verify the code ladder.
     *                   2. Trigger one fault. 3. Check every observable.
     * @tc.expected      The ladder is contiguous and the fault is fully reported.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('clientErrorsFinalContract', 0, () => {
      const session = createConnectedSession();
      armFailure(session, ERROR_SEND);
      const result = session.sendString(REQUEST_PAYLOAD);
      expect(ERROR_CONNECT + 1).assertEqual(ERROR_DISCONNECT);
      expect(ERROR_DISCONNECT + 1).assertEqual(ERROR_SEND);
      expect(ERROR_SEND + 1).assertEqual(ERROR_PROXY_INVALID);
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(result.isSuccess()).assertFalse();
      expect(session.logs.contains('16000003')).assertTrue();
      expect(session.events.last()).assertEqual('send-failed:16000003');
    });

    /**
     * @tc.name          clientErrorsZeroConstantStable
     * @tc.desc          The success constant stays zero across comparisons.
     * @tc.precondition  ERROR_NONE is loaded.
     * @tc.steps         1. Compare ERROR_NONE with zero twice.
     *                   2. Build a zero result.
     *                   3. Confirm success.
     * @tc.expected      The constant and a zero result agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('clientErrorsZeroConstantStable', 0, () => {
      expect(ERROR_NONE).assertEqual(0);
      expect(ERROR_NONE).assertEqual(ERROR_NONE + 0);
      expect(new RequestResultModel(ERROR_NONE).isSuccess()).assertTrue();
      expect(isNonZeroError(ERROR_NONE)).assertFalse();
      expect(faultCount([ERROR_NONE, ERROR_NONE])).assertEqual(0);
      expect(sourceOf(0)).assertEqual('none');
    });

  });
}
