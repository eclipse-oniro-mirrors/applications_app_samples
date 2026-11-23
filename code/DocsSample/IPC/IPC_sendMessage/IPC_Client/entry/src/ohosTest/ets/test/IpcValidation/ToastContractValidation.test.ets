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
import { logSuite, logStep } from '../Shared/Support';
import {
  ConnectionModel,
  RemoteStubModel,
  RemoteProxyModel,
  createConnectedSession,
  expectedToastFor,
  CONNECT_SUCCESS_TOAST,
  CONNECT_FAIL_TOAST,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  DISCONNECT_FAIL_TOAST,
  DISCONNECT_SUCCESS_TOAST,
  TOAST_DURATION_MS,
  ERROR_NONE,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

export default function toastValidation(): void {
  describe('ToastContractValidation', () => {
    beforeAll(() => {
      logSuite('ToastContractValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ToastContractValidation', 'end');
    });

    /**
     * @tc.name          toastValidationConnectSuccessLiteral
     * @tc.desc          The connect success toast matches the production literal.
     * @tc.precondition  A connected session is created.
     * @tc.steps         1. Read the toast constant.
     *                   2. Read the session last toast.
     *                   3. Compare both texts.
     * @tc.expected      The last toast is 'connectAbility success'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('toastValidationConnectSuccessLiteral', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      logStep('toastValidation', 'last=' + client.lastToast());
      expect(CONNECT_SUCCESS_TOAST).assertEqual('connectAbility success');
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts.length).assertEqual(1);
      expect(client.lastToast().length).assertEqual(22);
      expect(client.lastToast().indexOf('success')).assertLarger(0);
      expect(client.lastToast().indexOf(' ')).assertLarger(0);
    });

    /**
     * @tc.name          toastValidationConnectFailLiteral
     * @tc.desc          The connect failure toast carries the background service hint.
     * @tc.precondition  A client fails its connection.
     * @tc.steps         1. Connect and fail.
     *                   2. Read the last toast.
     *                   3. Compare against the constant.
     * @tc.expected      The toast equals the exported failure literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('toastValidationConnectFailLiteral', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(2);
      client.onFailed(16000001);
      expect(CONNECT_FAIL_TOAST).assertEqual(
        'Connect failed. Please ensure that the service is running in the background.');
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.lastToast().startsWith('Connect failed.')).assertTrue();
      expect(client.lastToast().endsWith('background.')).assertTrue();
      expect(client.lastToast().indexOf('service')).assertLarger(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.lastToast().length).assertEqual(76);
    });

    /**
     * @tc.name          toastValidationSendSuccessLiteral
     * @tc.desc          A successful send pushes the send success toast.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send the default payload.
     *                   2. Read the last toast.
     *                   3. Compare against the constant.
     * @tc.expected      The last toast is 'sendRequest success'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('toastValidationSendSuccessLiteral', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const prior: number = client.toasts.length;
      client.sendString();
      expect(SEND_SUCCESS_TOAST).assertEqual('sendRequest success');
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts.length).assertEqual(prior + 1);
      expect(client.lastToast().indexOf('sendRequest')).assertEqual(0);
      expect(client.lastToast().endsWith(' success')).assertTrue();
      expect(client.lastToast().length).assertEqual(19);
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          toastValidationSendFailWithoutProxyLiteral
     * @tc.desc          Sending without a proxy uses the send failure literal.
     * @tc.precondition  A fresh disconnected client exists.
     * @tc.steps         1. Call sendString without connecting.
     *                   2. Inspect the result code.
     *                   3. Read the last toast.
     * @tc.expected      The toast is 'sendRequest failed, please connect to the server first'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('toastValidationSendFailWithoutProxyLiteral', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.sendString().errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(SEND_FAIL_TOAST).assertEqual('sendRequest failed, please connect to the server first');
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.lastToast().indexOf('failed')).assertLarger(0);
      expect(client.lastToast().indexOf('connect to the server')).assertLarger(0);
      expect(client.toasts.length).assertEqual(1);
      expect(client.lastToast().length).assertEqual(54);
    });

    /**
     * @tc.name          toastValidationDisconnectFailLiteral
     * @tc.desc          The disconnect failure literal matches the production prompt.
     * @tc.precondition  The disconnect failure constant is exported.
     * @tc.steps         1. Read the constant.
     *                   2. Compare it with the oracle mapping.
     *                   3. Check its punctuation.
     * @tc.expected      The literal promises the user must connect first.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('toastValidationDisconnectFailLiteral', 0, () => {
      expect(DISCONNECT_FAIL_TOAST).assertEqual('disConnect failed. Please connect to the service first.');
      expect(expectedToastFor('disconnect-fail')).assertEqual(DISCONNECT_FAIL_TOAST);
      expect(DISCONNECT_FAIL_TOAST.startsWith('disConnect failed.')).assertTrue();
      expect(DISCONNECT_FAIL_TOAST.endsWith('.')).assertTrue();
      expect(DISCONNECT_FAIL_TOAST.indexOf('Please')).assertLarger(0);
      expect(DISCONNECT_FAIL_TOAST.length).assertEqual(55);
      expect(DISCONNECT_FAIL_TOAST.indexOf('  ')).assertLess(0);
    });

    /**
     * @tc.name          toastValidationDisconnectSuccessLiteral
     * @tc.desc          onDisconnect pushes the disconnect success toast.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Trigger onDisconnect.
     *                   2. Read the last toast.
     *                   3. Compare with the constant.
     * @tc.expected      The last toast is 'disconnectAbility success'.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('toastValidationDisconnectSuccessLiteral', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      expect(DISCONNECT_SUCCESS_TOAST).assertEqual('disconnectAbility success');
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.lastToast().indexOf('disconnectAbility')).assertEqual(0);
      expect(client.isDisconnect).assertTrue();
    });

    /**
     * @tc.name          toastValidationEmptyBeforeAnyAction
     * @tc.desc          A new client has no toast and lastToast returns empty text.
     * @tc.precondition  A fresh ConnectionModel exists.
     * @tc.steps         1. Read the toast array.
     *                   2. Call lastToast.
     *                   3. Trigger reset and read again.
     * @tc.expected      lastToast is the empty string before and after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('toastValidationEmptyBeforeAnyAction', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.toasts.length).assertEqual(0);
      expect(client.lastToast()).assertEqual('');
      expect(client.lastToast().length).assertEqual(0);
      client.connect(1);
      expect(client.lastToast()).assertEqual('');
      client.reset();
      expect(client.lastToast()).assertEqual('');
      expect(client.toasts.length).assertEqual(0);
      expect(textFingerprint(client.lastToast())).assertEqual(textFingerprint(''));
    });

    /**
     * @tc.name          toastValidationOracleCoversSixActions
     * @tc.desc          expectedToastFor maps six action keys to the exported literals.
     * @tc.precondition  The toast constants are imported.
     * @tc.steps         1. Evaluate all six action keys.
     *                   2. Collect the results.
     *                   3. Compare counts and values.
     * @tc.expected      Every key resolves to a distinct non-empty literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationOracleCoversSixActions', 0, () => {
      const keys: string[] = ['connect-success', 'connect-fail', 'send-success', 'send-fail',
        'disconnect-fail', 'disconnect-success'];
      const texts: string[] = [];
      for (let index = 0; index < keys.length; index++) {
        texts.push(expectedToastFor(keys[index]));
      }
      expect(texts.length).assertEqual(6);
      expect(uniqueStrings(texts).length).assertEqual(6);
      expect(texts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(texts[1]).assertEqual(CONNECT_FAIL_TOAST);
      expect(texts[2]).assertEqual(SEND_SUCCESS_TOAST);
      expect(texts[3]).assertEqual(SEND_FAIL_TOAST);
      expect(texts[4]).assertEqual(DISCONNECT_FAIL_TOAST);
      expect(texts[5]).assertEqual(DISCONNECT_SUCCESS_TOAST);
    });

    /**
     * @tc.name          toastValidationOracleFallbackIsDisconnectSuccess
     * @tc.desc          An unknown action key falls back to the disconnect success toast.
     * @tc.precondition  The oracle helper is imported.
     * @tc.steps         1. Query an unknown key.
     *                   2. Query an empty key.
     *                   3. Compare with the disconnect toast.
     * @tc.expected      Both unknown keys return the disconnect success literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationOracleFallbackIsDisconnectSuccess', 0, () => {
      expect(expectedToastFor('unknown-action')).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(expectedToastFor('')).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(expectedToastFor('connect-success')).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(expectedToastFor('unknown-action') === CONNECT_FAIL_TOAST).assertFalse();
      expect(expectedToastFor('')).assertEqual('disconnectAbility success');
      expect(expectedToastFor('disconnect-success')).assertEqual('disconnectAbility success');
    });

    /**
     * @tc.name          toastValidationAccumulatesAcrossLifecycle
     * @tc.desc          Connect, send and disconnect append three distinct toasts.
     * @tc.precondition  A connected session is created by hand.
     * @tc.steps         1. Connect and send.
     *                   2. Disconnect.
     *                   3. Compare the toast array order.
     * @tc.expected      The array is connect, send, disconnect in that order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationAccumulatesAcrossLifecycle', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(3);
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      client.onConnect(proxy);
      client.sendString();
      client.onDisconnect();
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(uniqueStrings(client.toasts).length).assertEqual(3);
      expect(joined(client.toasts, ' / ')).assertEqual(CONNECT_SUCCESS_TOAST + ' / ' +
        SEND_SUCCESS_TOAST + ' / ' + DISCONNECT_SUCCESS_TOAST);
    });

    /**
     * @tc.name          toastValidationFailedConnectDoesNotAddSuccess
     * @tc.desc          A failed connection yields only the failure toast.
     * @tc.precondition  A fresh client starts connecting.
     * @tc.steps         1. Connect and fail.
     *                   2. Read the toast array.
     *                   3. Confirm no success literal appears.
     * @tc.expected      Only the connect failure literal is present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationFailedConnectDoesNotAddSuccess', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(4);
      client.onFailed(16000001);
      expect(client.toasts.length).assertEqual(1);
      expect(client.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(countOf(client.toasts, CONNECT_SUCCESS_TOAST)).assertEqual(0);
      expect(countOf(client.toasts, DISCONNECT_SUCCESS_TOAST)).assertEqual(0);
      expect(client.toasts.indexOf(CONNECT_FAIL_TOAST)).assertEqual(0);
      expect(client.failedCode).assertEqual(16000001);
      expect(client.state).assertEqual('failed');
    });

    /**
     * @tc.name          toastValidationRepeatedSendsAppendRepeatedSuccess
     * @tc.desc          Three successful sends produce three identical success toasts.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send three times.
     *                   2. Count the success literal.
     *                   3. Check the last toast.
     * @tc.expected      The success literal occurs three times in a row.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationRepeatedSendsAppendRepeatedSuccess', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('one');
      client.sendString('two');
      client.sendString('three');
      expect(client.toasts.length).assertEqual(4);
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(3);
      expect(client.toasts[1]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts[3]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.countOf('send-ok')).assertEqual(3);
    });

    /**
     * @tc.name          toastValidationSendFailureUsesFailureLiteral
     * @tc.desc          A stub rejection pushes the send failure toast.
     * @tc.precondition  A connected session whose stub rejects the code exists.
     * @tc.steps         1. Configure the stub to fail the next send.
     *                   2. Send once.
     *                   3. Read the result and toast.
     * @tc.expected      The result code is 16000003 and the failure toast appears.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationSendFailureUsesFailureLiteral', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      expect(client.sendString().errCode).assertEqual(ERROR_SEND);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(SEND_FAIL_TOAST);
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(0);
      expect(client.events.countOf('send-failed')).assertEqual(1);
    });

    /**
     * @tc.name          toastValidationConnectRequestAloneAddsNothing
     * @tc.desc          Calling connect() without a callback does not show a toast.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Call connect(8).
     *                   2. Read the toast array.
     *                   3. Repeat the connect attempt.
     * @tc.expected      The toast array stays empty through both calls.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationConnectRequestAloneAddsNothing', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      expect(client.connect(8)).assertTrue();
      expect(client.toasts.length).assertEqual(0);
      expect(client.connect(9)).assertFalse();
      expect(client.toasts.length).assertEqual(0);
      expect(client.lastToast()).assertEqual('');
      expect(client.state).assertEqual('connecting');
      expect(client.connectId).assertEqual(8);
      expect(client.connectCalls).assertEqual(2);
    });

    /**
     * @tc.name          toastValidationDisconnectWithoutProxyStillToasts
     * @tc.desc          onDisconnect pushes success even when no proxy is attached.
     * @tc.precondition  A connecting client has no proxy yet.
     * @tc.steps         1. Connect without onConnect.
     *                   2. Trigger onDisconnect.
     *                   3. Read the toast array.
     * @tc.expected      The disconnect success toast is the only entry.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationDisconnectWithoutProxyStillToasts', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.onDisconnect();
      expect(client.proxy === undefined).assertTrue();
      expect(client.toasts.length).assertEqual(1);
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.state).assertEqual('disconnected');
      expect(client.isDisconnect).assertTrue();
      expect(client.events.countOf('disconnected')).assertEqual(1);
    });

    /**
     * @tc.name          toastValidationDoubleDisconnectAppendsTwice
     * @tc.desc          Two onDisconnect callbacks append two success toasts.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect once.
     *                   2. Disconnect again.
     *                   3. Count the entries.
     * @tc.expected      Two disconnect success toasts are present.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationDoubleDisconnectAppendsTwice', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      client.onDisconnect();
      expect(client.toasts.length).assertEqual(3);
      expect(countOf(client.toasts, DISCONNECT_SUCCESS_TOAST)).assertEqual(2);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('disconnected')).assertEqual(2);
      expect(client.connectId).assertEqual(-1);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          toastValidationResetClearsAllToasts
     * @tc.desc          reset() removes every accumulated toast.
     * @tc.precondition  A session collected connect and send toasts.
     * @tc.steps         1. Build the session and send.
     *                   2. Reset the client.
     *                   3. Read the toast array.
     * @tc.expected      The array is empty and lastToast returns empty text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationResetClearsAllToasts', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      expect(client.toasts.length).assertEqual(2);
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.lastToast()).assertEqual('');
      expect(client.isDisconnect).assertFalse();
      expect(client.failedCode).assertEqual(ERROR_NONE);
      expect(client.state).assertEqual('disconnected');
      expect(client.lastToast().length).assertEqual(0);
    });

    /**
     * @tc.name          toastValidationDurationConstant
     * @tc.desc          The production toast duration is 2000 milliseconds.
     * @tc.precondition  TOAST_DURATION_MS is exported.
     * @tc.steps         1. Read the constant.
     *                   2. Compare with literal seconds.
     *                   3. Check range relations.
     * @tc.expected      The duration is 2000 and equals two seconds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('toastValidationDurationConstant', 0, () => {
      expect(TOAST_DURATION_MS).assertEqual(2000);
      expect(TOAST_DURATION_MS).assertEqual(2 * 1000);
      expect(TOAST_DURATION_MS).assertLarger(0);
      expect(TOAST_DURATION_MS).assertLess(3001);
      expect(TOAST_DURATION_MS / 1000).assertEqual(2);
      expect(String(TOAST_DURATION_MS)).assertEqual('2000');
      expect(TOAST_DURATION_MS % 1000).assertEqual(0);
    });

    /**
     * @tc.name          toastValidationLiteralsAreAsciiEnglish
     * @tc.desc          Every toast literal uses printable ASCII characters only.
     * @tc.precondition  All six toast constants are imported.
     * @tc.steps         1. Build a list of literals.
     *                   2. Scan each character code.
     *                   3. Count whitespace characters.
     * @tc.expected      All codes are between 32 and 126 and spaces exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationLiteralsAreAsciiEnglish', 0, () => {
      const texts: string[] = [CONNECT_SUCCESS_TOAST, CONNECT_FAIL_TOAST, SEND_SUCCESS_TOAST,
        SEND_FAIL_TOAST, DISCONNECT_FAIL_TOAST, DISCONNECT_SUCCESS_TOAST];
      let maxCode: number = 0;
      let minCode: number = 1000;
      for (let index = 0; index < texts.length; index++) {
        for (let offset = 0; offset < texts[index].length; offset++) {
          const codeValue: number = texts[index].charCodeAt(offset);
          if (codeValue > maxCode) {
            maxCode = codeValue;
          }
          if (codeValue < minCode) {
            minCode = codeValue;
          }
        }
      }
      expect(minCode).assertEqual(32);
      expect(maxCode).assertLess(127);
      expect(countOf(texts[0].split(''), ' ')).assertEqual(1);
      expect(texts[1].indexOf(' ')).assertLarger(0);
      expect(texts[5].indexOf(' ')).assertLarger(0);
      expect(texts.length).assertEqual(6);
    });

    /**
     * @tc.name          toastValidationAllLiteralsDistinct
     * @tc.desc          The six toast literals never collide.
     * @tc.precondition  All literals are imported.
     * @tc.steps         1. Collect the literals.
     *                   2. Deduplicate them.
     *                   3. Compare fingerprints pairwise.
     * @tc.expected      Six unique strings with six unique fingerprints appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationAllLiteralsDistinct', 0, () => {
      const texts: string[] = [CONNECT_SUCCESS_TOAST, CONNECT_FAIL_TOAST, SEND_SUCCESS_TOAST,
        SEND_FAIL_TOAST, DISCONNECT_FAIL_TOAST, DISCONNECT_SUCCESS_TOAST];
      const hashes: string[] = [];
      for (let index = 0; index < texts.length; index++) {
        hashes.push(String(textFingerprint(texts[index])));
      }
      expect(uniqueStrings(texts).length).assertEqual(6);
      expect(uniqueStrings(hashes).length).assertEqual(6);
      expect(textFingerprint(CONNECT_SUCCESS_TOAST) === textFingerprint(SEND_SUCCESS_TOAST)).assertFalse();
      expect(textFingerprint(DISCONNECT_FAIL_TOAST) === textFingerprint(SEND_FAIL_TOAST)).assertFalse();
      expect(CONNECT_SUCCESS_TOAST === SEND_SUCCESS_TOAST).assertFalse();
      expect(DISCONNECT_SUCCESS_TOAST === CONNECT_SUCCESS_TOAST).assertFalse();
    });

    /**
     * @tc.name          toastValidationFailureThenSuccess
     * @tc.desc          A failure toast followed by a success toast keeps order.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Force one send failure.
     *                   2. Send successfully.
     *                   3. Compare the last two entries.
     * @tc.expected      The failure toast precedes the success toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationFailureThenSuccess', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('first');
      client.sendString('second');
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[1]).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts[2]).assertEqual(SEND_SUCCESS_TOAST);
      expect(countOf(client.toasts, SEND_FAIL_TOAST)).assertEqual(1);
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.last().startsWith('send-ok:')).assertTrue();
    });

    /**
     * @tc.name          toastValidationTwoClientsIsolated
     * @tc.desc          Toasts recorded on one client never leak to another.
     * @tc.precondition  Two independent clients exist.
     * @tc.steps         1. Fail one client.
     *                   2. Connect the other.
     *                   3. Compare their toast arrays.
     * @tc.expected      Each client holds only its own toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationTwoClientsIsolated', 0, () => {
      const failing: ConnectionModel = new ConnectionModel();
      const good: ConnectionModel = new ConnectionModel();
      failing.connect(1);
      failing.onFailed(16000002);
      good.connect(2);
      good.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(failing.toasts.length).assertEqual(1);
      expect(good.toasts.length).assertEqual(1);
      expect(failing.lastToast()).assertEqual(CONNECT_FAIL_TOAST);
      expect(good.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(failing.lastToast() === good.lastToast()).assertFalse();
      expect(failing.toasts.indexOf(CONNECT_SUCCESS_TOAST)).assertLess(0);
    });

    /**
     * @tc.name          toastValidationLastToastIgnoresArrayMutation
     * @tc.desc          lastToast always reads the current array tail.
     * @tc.precondition  A session with two toasts exists.
     * @tc.steps         1. Push a custom toast directly.
     *                   2. Read lastToast.
     *                   3. Remove it and read again.
     * @tc.expected      lastToast follows the array tail exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationLastToastIgnoresArrayMutation', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.toasts.push('manual toast');
      expect(client.lastToast()).assertEqual('manual toast');
      expect(client.toasts.length).assertEqual(2);
      client.toasts.pop();
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      client.toasts.pop();
      expect(client.lastToast()).assertEqual('');
      expect(client.toasts.length).assertEqual(0);
      expect(textFingerprint(client.lastToast())).assertEqual(textFingerprint(''));
    });

    /**
     * @tc.name          toastValidationDeadProxyOnConnectStillToasts
     * @tc.desc          onConnect with a dead proxy logs a register error but still toasts.
     * @tc.precondition  A proxy double is killed before the callback.
     * @tc.steps         1. Connect the client.
     *                   2. Kill the proxy and call onConnect.
     *                   3. Read the toast and logs.
     * @tc.expected      The connect success toast appears and the log holds an error.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationDeadProxyOnConnectStillToasts', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      proxy.kill();
      client.connect(6);
      client.onConnect(proxy);
      expect(client.toasts.length).assertEqual(1);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.logs.contains('register failed')).assertTrue();
      expect(client.state).assertEqual('connected');
      expect(client.proxy !== undefined).assertTrue();
    });

    /**
     * @tc.name          toastValidationConnectFailThenConnect
     * @tc.desc          A failed connection followed by a success keeps both toasts.
     * @tc.precondition  A client failed once and is retried.
     * @tc.steps         1. Connect and fail.
     *                   2. Connect again with a live proxy.
     *                   3. Compare the toast order.
     * @tc.expected      The failure toast precedes the success toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationConnectFailThenConnect', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.onFailed(16000005);
      expect(client.connect(2)).assertTrue();
      client.state = 'disconnected';
      expect(client.connect(3)).assertTrue();
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.toasts[1]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.connectCalls).assertEqual(3);
      expect(client.failedCode).assertEqual(16000005);
    });

    /**
     * @tc.name          toastValidationDeadProxySendFailure
     * @tc.desc          Sending through a dead proxy records the failure toast.
     * @tc.precondition  A connected session whose proxy died exists.
     * @tc.steps         1. Kill the proxy.
     *                   2. Send a payload.
     *                   3. Inspect result and toast.
     * @tc.expected      The result code is 16000003 and the failure toast is last.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationDeadProxySendFailure', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.proxy?.kill();
      expect(client.sendString('after death').errCode).assertEqual(ERROR_SEND);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(0);
      expect(client.events.countOf('send-failed')).assertEqual(1);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          toastValidationToastLeadingWords
     * @tc.desc          Each toast starts with the verb of the action it reports.
     * @tc.precondition  All literals are imported.
     * @tc.steps         1. Read the leading word of each literal.
     *                   2. Compare against expected verbs.
     *                   3. Check the number of words.
     * @tc.expected      The leading verbs match their actions.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationToastLeadingWords', 0, () => {
      const successWord: string = CONNECT_SUCCESS_TOAST.split(' ')[0];
      const failWord: string = SEND_FAIL_TOAST.split(' ')[0];
      const disconnectWord: string = DISCONNECT_SUCCESS_TOAST.split(' ')[0];
      expect(successWord).assertEqual('connectAbility');
      expect(failWord).assertEqual('sendRequest');
      expect(disconnectWord).assertEqual('disconnectAbility');
      expect(CONNECT_SUCCESS_TOAST.split(' ').length).assertEqual(2);
      expect(SEND_FAIL_TOAST.split(' ').length).assertEqual(8);
      expect(DISCONNECT_FAIL_TOAST.split(' ').length).assertEqual(8);
      expect(CONNECT_FAIL_TOAST.split(' ').length).assertEqual(12);
    });

    /**
     * @tc.name          toastValidationLengthOrdering
     * @tc.desc          The multi-clause failure toasts are longer than the success ones.
     * @tc.precondition  All literals are imported.
     * @tc.steps         1. Compare lengths.
     *                   2. Compare sentence counts.
     *                   3. Compare comma counts.
     * @tc.expected      Failure literals exceed 50 characters and contain a comma.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationLengthOrdering', 0, () => {
      expect(CONNECT_FAIL_TOAST.length).assertLarger(SEND_FAIL_TOAST.length);
      expect(DISCONNECT_FAIL_TOAST.length).assertLarger(SEND_FAIL_TOAST.length);
      expect(SEND_FAIL_TOAST.length).assertLarger(SEND_SUCCESS_TOAST.length);
      expect(SEND_SUCCESS_TOAST.length).assertLess(DISCONNECT_SUCCESS_TOAST.length);
      expect(countOf(SEND_FAIL_TOAST.split(''), ',')).assertEqual(1);
      expect(countOf(CONNECT_FAIL_TOAST.split(''), '.')).assertEqual(2);
      expect(countOf(DISCONNECT_FAIL_TOAST.split(''), '.')).assertEqual(2);
    });

    /**
     * @tc.name          toastValidationToastCountTracksSendEvents
     * @tc.desc          Each send event corresponds to exactly one toast.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send four payloads.
     *                   2. Count send events.
     *                   3. Count toasts minus the connect toast.
     * @tc.expected      The send toast count equals the send event count.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationToastCountTracksSendEvents', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('a');
      client.sendString('b');
      client.sendString('c');
      client.sendString('d');
      const sendEvents: number = client.events.countOf('send-ok') + client.events.countOf('send-failed');
      expect(sendEvents).assertEqual(4);
      expect(client.toasts.length).assertEqual(5);
      expect(client.toasts.length - 1).assertEqual(sendEvents);
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(4);
      expect(client.events.countOf('send-ok')).assertEqual(4);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts.indexOf(CONNECT_SUCCESS_TOAST)).assertEqual(0);
    });

    /**
     * @tc.name          toastValidationDisconnectReplacesConnectedView
     * @tc.desc          After disconnect isConnected is false while the toast remains.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect.
     *                   2. Query isConnected.
     *                   3. Read the toast.
     * @tc.expected      The client is not connected and the success toast persists.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationDisconnectReplacesConnectedView', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.isConnected()).assertTrue();
      client.onDisconnect();
      expect(client.isConnected()).assertFalse();
      expect(client.connectId).assertEqual(-1);
      expect(client.proxy === undefined).assertTrue();
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.toasts.length).assertEqual(2);
      expect(client.state).assertEqual('disconnected');
      expect(client.logs.contains('onDisconnect')).assertTrue();
    });

    /**
     * @tc.name          toastValidationSendAfterDisconnectFailsThenToasts
     * @tc.desc          Sending after disconnect records the proxy invalid toast.
     * @tc.precondition  A disconnected client exists.
     * @tc.steps         1. Connect then disconnect.
     *                   2. Send once.
     *                   3. Compare the last two toasts.
     * @tc.expected      The send failure toast follows the disconnect success toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationSendAfterDisconnectFailsThenToasts', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      expect(client.sendString().errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(SEND_FAIL_TOAST);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.logs.contains('proxy is invalid')).assertTrue();
      expect(client.connectId).assertEqual(-1);
    });

    /**
     * @tc.name          toastValidationWhitespacePayloadStillSuccess
     * @tc.desc          A whitespace-only payload still yields the success toast.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send three spaces.
     *                   2. Read the result.
     *                   3. Read the last toast.
     * @tc.expected      The request succeeds and the success toast is last.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationWhitespacePayloadStillSuccess', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.sendString('   ').isSuccess()).assertTrue();
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts.length).assertEqual(2);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.last()).assertEqual('send-ok:hello rpc');
      expect(countOf(client.toasts, SEND_FAIL_TOAST)).assertEqual(0);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          toastValidationNoCarryOverAfterReset
     * @tc.desc          A second lifecycle after reset starts with a clean toast list.
     * @tc.precondition  A session was used and reset.
     * @tc.steps         1. Send then reset.
     *                   2. Connect again.
     *                   3. Count the toasts.
     * @tc.expected      Exactly one connect toast exists in the new cycle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationNoCarryOverAfterReset', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      client.reset();
      client.connect(12);
      expect(client.toasts.length).assertEqual(0);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.toasts.length).assertEqual(1);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(0);
      expect(client.connectId).assertEqual(12);
      expect(client.events.countOf('connect')).assertEqual(1);
    });

    /**
     * @tc.name          toastValidationDisconnectFromFailedState
     * @tc.desc          Disconnecting a failed client still emits the success toast.
     * @tc.precondition  A client in the failed state exists.
     * @tc.steps         1. Connect and fail.
     *                   2. Trigger onDisconnect.
     *                   3. Read the last toast and state.
     * @tc.expected      The disconnect success toast is last and the state resets.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationDisconnectFromFailedState', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(4);
      client.onFailed(16000003);
      client.onDisconnect();
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.state).assertEqual('disconnected');
      expect(client.failedCode).assertEqual(16000003);
      expect(client.events.countOf('disconnected')).assertEqual(1);
    });

    /**
     * @tc.name          toastValidationNoDoubleSpacesAnywhere
     * @tc.desc          No toast literal contains two consecutive spaces.
     * @tc.precondition  All literals are imported.
     * @tc.steps         1. Build the literal list.
     *                   2. Search for a double space.
     *                   3. Check trimmed equality.
     * @tc.expected      Every literal is already trimmed and gap-free.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationNoDoubleSpacesAnywhere', 0, () => {
      const texts: string[] = [CONNECT_SUCCESS_TOAST, CONNECT_FAIL_TOAST, SEND_SUCCESS_TOAST,
        SEND_FAIL_TOAST, DISCONNECT_FAIL_TOAST, DISCONNECT_SUCCESS_TOAST];
      for (let index = 0; index < texts.length; index++) {
        expect(texts[index].indexOf('  ')).assertLess(0);
        expect(texts[index].trim()).assertEqual(texts[index]);
        expect(texts[index].length).assertLarger(0);
      }
      expect(texts[0].indexOf('\t')).assertLess(0);
      expect(texts[1].indexOf('\n')).assertLess(0);
      expect(texts[3].length).assertEqual(54);
    });

    /**
     * @tc.name          toastValidationTwoFailuresAccumulate
     * @tc.desc          Two forced failures append two failure toasts.
     * @tc.precondition  A connected session with a controllable proxy exists.
     * @tc.steps         1. Force and send two failures.
     *                   2. Count the failure literal.
     *                   3. Confirm success count is zero.
     * @tc.expected      The failure toast appears twice in sequence.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationTwoFailuresAccumulate', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('one');
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('two');
      expect(client.toasts.length).assertEqual(3);
      expect(countOf(client.toasts, SEND_FAIL_TOAST)).assertEqual(2);
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(0);
      expect(client.toasts[1]).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts[2]).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-failed')).assertEqual(2);
      expect(client.events.countOf('send-ok')).assertEqual(0);
    });

    /**
     * @tc.name          toastValidationFirstToastIndexAfterManySends
     * @tc.desc          The connect toast stays at index zero after many sends.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send seven payloads.
     *                   2. Read the toast array.
     *                   3. Check the first and last entries.
     * @tc.expected      Index zero holds the connect toast and index seven a send toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationFirstToastIndexAfterManySends', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      for (let index = 0; index < 7; index++) {
        client.sendString('payload ' + String(index));
      }
      expect(client.toasts.length).assertEqual(8);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[7]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts.indexOf(CONNECT_SUCCESS_TOAST)).assertEqual(0);
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(7);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.size()).assertEqual(10);
    });

    /**
     * @tc.name          toastValidationOracleKeysAreCaseSensitive
     * @tc.desc          Uppercase action keys fall through to the default toast.
     * @tc.precondition  The oracle helper is imported.
     * @tc.steps         1. Query uppercase variants.
     *                   2. Query the lowercase keys.
     *                   3. Compare results.
     * @tc.expected      Only lowercase keys resolve to their literals.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationOracleKeysAreCaseSensitive', 0, () => {
      expect(expectedToastFor('CONNECT-SUCCESS')).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(expectedToastFor('Connect-Success')).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(expectedToastFor('connect-success')).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(expectedToastFor('send-fail')).assertEqual(SEND_FAIL_TOAST);
      expect(expectedToastFor('SEND-FAIL')).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(expectedToastFor('send-fail') === expectedToastFor('SEND-FAIL')).assertFalse();
      expect(expectedToastFor('connect-fail')).assertEqual(CONNECT_FAIL_TOAST);
    });

    /**
     * @tc.name          toastValidationCustomReplyKeepsSuccessToast
     * @tc.desc          A custom reply payload does not change the toast contract.
     * @tc.precondition  A session with a custom reply exists.
     * @tc.steps         1. Create a session replying 'pong'.
     *                   2. Send.
     *                   3. Compare the toast.
     * @tc.expected      The reply is pong while the toast stays the success literal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationCustomReplyKeepsSuccessToast', 0, () => {
      const client: ConnectionModel = createConnectedSession('pong');
      const reply: string = client.sendString().readReply();
      expect(reply).assertEqual('pong');
      expect(reply).assertEqual('pong');
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.events.last()).assertEqual('send-ok:pong');
      expect(client.toasts.length).assertEqual(2);
      expect(client.logs.contains('reply pong')).assertTrue();
      expect(countOf(client.toasts, CONNECT_SUCCESS_TOAST)).assertEqual(1);
    });

    /**
     * @tc.name          toastValidationToastMapFingerprintUnique
     * @tc.desc          Fingerprints of all six toast literals are unique numbers.
     * @tc.precondition  All literals are imported.
     * @tc.steps         1. Hash each literal.
     *                   2. Sum and compare with a manual total.
     *                   3. Ensure no zero hash exists.
     * @tc.expected      All six hashes are positive and distinct.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationToastMapFingerprintUnique', 0, () => {
      const texts: string[] = [CONNECT_SUCCESS_TOAST, CONNECT_FAIL_TOAST, SEND_SUCCESS_TOAST,
        SEND_FAIL_TOAST, DISCONNECT_FAIL_TOAST, DISCONNECT_SUCCESS_TOAST];
      let total: number = 0;
      let manual: number = 0;
      for (let index = 0; index < texts.length; index++) {
        const hash: number = textFingerprint(texts[index]);
        total = total + hash;
        manual = manual + hash;
        expect(hash).assertLarger(0);
        expect(hash).assertLess(1000003);
      }
      expect(total).assertEqual(manual);
      expect(total).assertLarger(0);
      expect(uniqueStrings([String(textFingerprint(texts[4])), String(textFingerprint(texts[5]))]).length)
        .assertEqual(2);
      expect(texts.length).assertEqual(6);
    });

    /**
     * @tc.name          toastValidationRegisterFailureEventPair
     * @tc.desc          A failed death registration pairs an error log with the success toast.
     * @tc.precondition  A proxy is killed before onConnect.
     * @tc.steps         1. Connect a client.
     *                   2. Kill the proxy and call onConnect.
     *                   3. Compare events, logs and toast.
     * @tc.expected      The failure event exists but the connect toast is still shown.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationRegisterFailureEventPair', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      proxy.kill();
      client.connect(9);
      client.onConnect(proxy);
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
      expect(client.logs.countLevel('INFO')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
    });

    /**
     * @tc.name          toastValidationServiceWordOccurrences
     * @tc.desc          Service-related words appear the expected number of times.
     * @tc.precondition  All literals are imported.
     * @tc.steps         1. Count the word service in each failure literal.
     *                   2. Count the word please.
     *                   3. Compare sums.
     * @tc.expected      Each failure literal mentions service and please once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationServiceWordOccurrences', 0, () => {
      expect(countOf(CONNECT_FAIL_TOAST.split(' '), 'service')).assertEqual(1);
      expect(countOf(SEND_FAIL_TOAST.split(' '), 'server')).assertEqual(1);
      expect(countOf(DISCONNECT_FAIL_TOAST.split(' '), 'service')).assertEqual(1);
      expect(countOf(CONNECT_FAIL_TOAST.split(' '), 'Please')).assertEqual(1);
      expect(countOf(SEND_FAIL_TOAST.split(' '), 'please')).assertEqual(1);
      expect(countOf(DISCONNECT_FAIL_TOAST.split(' '), 'Please')).assertEqual(1);
      expect(CONNECT_SUCCESS_TOAST.indexOf('service')).assertLess(0);
    });

    /**
     * @tc.name          toastValidationFailStateThenSendWithoutProxy
     * @tc.desc          A failed client sends nothing and records the send failure toast.
     * @tc.precondition  A client in the failed state exists.
     * @tc.steps         1. Connect and fail.
     *                   2. Send without a proxy.
     *                   3. Compare the last two toasts.
     * @tc.expected      The connect failure toast precedes the send failure toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationFailStateThenSendWithoutProxy', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(2);
      client.onFailed(16000001);
      expect(client.sendString().errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_FAIL_TOAST);
      expect(client.toasts[1]).assertEqual(SEND_FAIL_TOAST);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(client.events.countOf('send-no-proxy')).assertEqual(1);
      expect(client.state).assertEqual('failed');
      expect(client.connectId).assertEqual(2);
    });

    /**
     * @tc.name          toastValidationOnlyResetClears
     * @tc.desc          Neither connect nor send nor disconnect clears prior toasts.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Run connect, send failure and disconnect.
     *                   2. Count toasts before reset.
     *                   3. Reset and count again.
     * @tc.expected      Only reset reduces the count to zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationOnlyResetClears', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.sendString();
      client.onDisconnect();
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      client.connect(2);
      expect(client.toasts.length).assertEqual(2);
      client.reset();
      expect(client.toasts.length).assertEqual(0);
      expect(client.lastToast()).assertEqual('');
      expect(client.events.size()).assertEqual(0);
    });

    /**
     * @tc.name          toastValidationJoinedTwoLifecycles
     * @tc.desc          Joined toast traces of two lifecycles keep both segments.
     * @tc.precondition  Two sessions were built independently.
     * @tc.steps         1. Build two sessions and disconnect both.
     *                   2. Join the toast arrays.
     *                   3. Compare the joined text.
     * @tc.expected      The joined text has four segments in lifecycle order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationJoinedTwoLifecycles', 0, () => {
      const first: ConnectionModel = createConnectedSession();
      const second: ConnectionModel = createConnectedSession();
      first.onDisconnect();
      second.onDisconnect();
      const text: string = joined(first.toasts, '|') + '#' + joined(second.toasts, '|');
      expect(first.toasts.length).assertEqual(2);
      expect(second.toasts.length).assertEqual(2);
      expect(text.split('#').join('|').split('|').length).assertEqual(4);
      expect(text.split('#').length).assertEqual(2);
      expect(text.indexOf(CONNECT_SUCCESS_TOAST)).assertEqual(0);
      expect(text.lastIndexOf(DISCONNECT_SUCCESS_TOAST)).assertLarger(0);
      expect(countOf(text.split('#').join('|').split('|'), CONNECT_SUCCESS_TOAST)).assertEqual(2);
    });

    /**
     * @tc.name          toastValidationManualClearEmptiesLast
     * @tc.desc          Emptying the toast array manually resets lastToast.
     * @tc.precondition  A session with toasts exists.
     * @tc.steps         1. Read lastToast.
     *                   2. Assign an empty array.
     *                   3. Read lastToast again.
     * @tc.expected      lastToast becomes empty text after the manual clear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationManualClearEmptiesLast', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      client.toasts = [];
      expect(client.lastToast()).assertEqual('');
      expect(client.toasts.length).assertEqual(0);
      expect(client.lastToast().length).assertEqual(0);
      client.sendString();
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts.length).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          toastValidationSuccessIndexAfterFailure
     * @tc.desc          A success toast lands directly after a failure toast.
     * @tc.precondition  A connected session with a controllable proxy exists.
     * @tc.steps         1. Force a failure.
     *                   2. Send successfully.
     *                   3. Check both indices.
     * @tc.expected      The failure is at index one and success at index two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationSuccessIndexAfterFailure', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('bad');
      client.sendString('good');
      expect(client.toasts[1]).assertEqual(SEND_FAIL_TOAST);
      expect(client.toasts[2]).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.toasts.indexOf(SEND_FAIL_TOAST)).assertEqual(1);
      expect(client.toasts.indexOf(SEND_SUCCESS_TOAST)).assertEqual(2);
      expect(client.toasts.indexOf(SEND_FAIL_TOAST)).assertLess(
        client.toasts.indexOf(SEND_SUCCESS_TOAST));
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(uniqueStrings(client.toasts).length).assertEqual(3);
    });

    /**
     * @tc.name          toastValidationSentenceCapitalization
     * @tc.desc          Sentence-style failure toasts start with an uppercase letter.
     * @tc.precondition  All literals are imported.
     * @tc.steps         1. Inspect the first character of each literal.
     *                   2. Compare with the uppercase form.
     *                   3. Check the action-style literals.
     * @tc.expected      Failure literals are capitalized and action literals are lowercase.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationSentenceCapitalization', 0, () => {
      expect(CONNECT_FAIL_TOAST.charAt(0)).assertEqual('C');
      expect(DISCONNECT_FAIL_TOAST.charAt(0)).assertEqual('d');
      expect(SEND_FAIL_TOAST.charAt(0)).assertEqual('s');
      expect(CONNECT_SUCCESS_TOAST.charAt(0)).assertEqual('c');
      expect(CONNECT_FAIL_TOAST.charAt(0)).assertEqual(CONNECT_FAIL_TOAST.charAt(0).toUpperCase());
      expect(SEND_FAIL_TOAST.charAt(0)).assertEqual(SEND_FAIL_TOAST.charAt(0).toLowerCase());
      expect(DISCONNECT_FAIL_TOAST.charAt(0)).assertEqual(DISCONNECT_FAIL_TOAST.charAt(0).toLowerCase());
    });

    /**
     * @tc.name          toastValidationConstantsImmutableAcrossUse
     * @tc.desc          Using a session does not mutate the exported constants.
     * @tc.precondition  The constants are imported.
     * @tc.steps         1. Capture the literal lengths.
     *                   2. Run a full session.
     *                   3. Recapture and compare.
     * @tc.expected      All literal lengths are unchanged after the session.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationConstantsImmutableAcrossUse', 0, () => {
      const before: number[] = [CONNECT_SUCCESS_TOAST.length, CONNECT_FAIL_TOAST.length,
        SEND_SUCCESS_TOAST.length, SEND_FAIL_TOAST.length];
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      client.onDisconnect();
      expect(client.toasts.length).assertEqual(3);
      expect(CONNECT_SUCCESS_TOAST.length).assertEqual(before[0]);
      expect(CONNECT_FAIL_TOAST.length).assertEqual(before[1]);
      expect(SEND_SUCCESS_TOAST.length).assertEqual(before[2]);
      expect(SEND_FAIL_TOAST.length).assertEqual(before[3]);
      expect(before[0]).assertEqual(22);
      expect(before[3]).assertEqual(54);
    });

    /**
     * @tc.name          toastValidationEmissionUnconditional
     * @tc.desc          onConnect toasts even when the proxy descriptor is unusual.
     * @tc.precondition  A stub with a custom descriptor exists.
     * @tc.steps         1. Build a proxy with a custom descriptor.
     *                   2. Connect and call onConnect.
     *                   3. Compare the toast and event descriptor.
     * @tc.expected      The same success toast is emitted regardless of descriptor.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationEmissionUnconditional', 0, () => {
      const stub: RemoteStubModel = new RemoteStubModel('CustomDescriptor');
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(13);
      client.onConnect(proxy);
      expect(proxy.descriptor).assertEqual('CustomDescriptor');
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.last()).assertEqual('connected:CustomDescriptor');
      expect(client.toasts.length).assertEqual(1);
      expect(client.lastToast()).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.state).assertEqual('connected');
    });

    /**
     * @tc.name          toastValidationDisconnectFailNeverEmittedByClient
     * @tc.desc          The disconnect failure literal is an oracle value only.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect the session.
     *                   2. Search the toast array for the failure literal.
     *                   3. Compare with the oracle value.
     * @tc.expected      The client emits no disconnect failure toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationDisconnectFailNeverEmittedByClient', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      expect(countOf(client.toasts, DISCONNECT_FAIL_TOAST)).assertEqual(0);
      expect(client.toasts.indexOf(DISCONNECT_FAIL_TOAST)).assertLess(0);
      expect(expectedToastFor('disconnect-fail')).assertEqual(DISCONNECT_FAIL_TOAST);
      expect(client.toasts.length).assertEqual(2);
      expect(client.lastToast()).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.lastToast() === DISCONNECT_FAIL_TOAST).assertFalse();
      expect(client.isDisconnect).assertTrue();
    });

    /**
     * @tc.name          toastValidationNoSendToastBeforeAnySend
     * @tc.desc          A connected session has no send toast before the first send.
     * @tc.precondition  A freshly connected session exists.
     * @tc.steps         1. Create the session.
     *                   2. Count send toasts.
     *                   3. Send once and recount.
     * @tc.expected      The send toast count moves from zero to one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationNoSendToastBeforeAnySend', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(0);
      expect(countOf(client.toasts, SEND_FAIL_TOAST)).assertEqual(0);
      expect(client.toasts.length).assertEqual(1);
      client.sendString();
      expect(countOf(client.toasts, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.toasts.length).assertEqual(2);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(countOf(client.toasts, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          toastValidationFiveConnectAttemptsSingleToast
     * @tc.desc          Repeated connect attempts queue only one success toast.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Call connect five times.
     *                   2. Deliver one onConnect.
     *                   3. Count the toasts.
     * @tc.expected      Only one toast exists despite five attempts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationFiveConnectAttemptsSingleToast', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      for (let index = 0; index < 5; index++) {
        client.connect(index + 1);
      }
      expect(client.connectCalls).assertEqual(5);
      expect(client.connectId).assertEqual(1);
      expect(client.toasts.length).assertEqual(0);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.toasts.length).assertEqual(1);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('connect')).assertEqual(1);
    });

    /**
     * @tc.name          toastValidationNounPhraseTokens
     * @tc.desc          Action literals name their ability in the first token.
     * @tc.precondition  The literals are imported.
     * @tc.steps         1. Split each action literal.
     *                   2. Verify the ability token.
     *                   3. Verify the status token.
     * @tc.expected      Ability and status tokens follow the production prompts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationNounPhraseTokens', 0, () => {
      expect(CONNECT_SUCCESS_TOAST.split(' ')[1]).assertEqual('success');
      expect(DISCONNECT_SUCCESS_TOAST.split(' ')[1]).assertEqual('success');
      expect(SEND_SUCCESS_TOAST.split(' ')[1]).assertEqual('success');
      expect(SEND_FAIL_TOAST.split(' ')[1]).assertEqual('failed,');
      expect(DISCONNECT_FAIL_TOAST.split(' ')[1]).assertEqual('failed.');
      expect(CONNECT_FAIL_TOAST.split(' ')[1]).assertEqual('failed.');
      expect(SEND_FAIL_TOAST.split(' ')[3]).assertEqual('connect');
    });

    /**
     * @tc.name          toastValidationLastToastStableRepeats
     * @tc.desc          Repeated lastToast reads return the same text.
     * @tc.precondition  A failed client holds one toast.
     * @tc.steps         1. Fail the connection.
     *                   2. Read lastToast four times.
     *                   3. Compare equality and fingerprints.
     * @tc.expected      Every read is identical and no toast is added.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationLastToastStableRepeats', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(3);
      client.onFailed(16000002);
      const first: string = client.lastToast();
      const second: string = client.lastToast();
      const third: string = client.lastToast();
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(first).assertEqual(CONNECT_FAIL_TOAST);
      expect(textFingerprint(first)).assertEqual(textFingerprint(third));
      expect(client.toasts.length).assertEqual(1);
      expect(client.failedCode).assertEqual(16000002);
      expect(client.logs.contains('onFailed')).assertTrue();
    });

    /**
     * @tc.name          toastValidationNoDigitsInLiterals
     * @tc.desc          No toast literal contains a digit character.
     * @tc.precondition  All literals are imported.
     * @tc.steps         1. Scan every literal for digits.
     *                   2. Compare with the known letters only set.
     *                   3. Verify punctuation usage.
     * @tc.expected      Digits never appear while commas and periods do.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationNoDigitsInLiterals', 0, () => {
      const texts: string[] = [CONNECT_SUCCESS_TOAST, CONNECT_FAIL_TOAST, SEND_SUCCESS_TOAST,
        SEND_FAIL_TOAST, DISCONNECT_FAIL_TOAST, DISCONNECT_SUCCESS_TOAST];
      const digits: string = '0123456789';
      for (let index = 0; index < texts.length; index++) {
        let digitCount: number = 0;
        for (let offset = 0; offset < digits.length; offset++) {
          if (texts[index].indexOf(digits.charAt(offset)) >= 0) {
            digitCount = digitCount + 1;
          }
        }
        expect(digitCount).assertEqual(0);
      }
      expect(SEND_FAIL_TOAST.indexOf(',')).assertLarger(0);
      expect(CONNECT_FAIL_TOAST.indexOf('.')).assertLarger(0);
      expect(texts.length).assertEqual(6);
    });

    /**
     * @tc.name          toastValidationFailToastLengthRelation
     * @tc.desc          The connect failure toast is the longest literal.
     * @tc.precondition  All literals are imported.
     * @tc.steps         1. Compare all six lengths.
     *                   2. Find the maximum.
     *                   3. Confirm the failure toast holds it.
     * @tc.expected      CONNECT_FAIL_TOAST is longer than the other five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationFailToastLengthRelation', 0, () => {
      const texts: string[] = [CONNECT_SUCCESS_TOAST, CONNECT_FAIL_TOAST, SEND_SUCCESS_TOAST,
        SEND_FAIL_TOAST, DISCONNECT_FAIL_TOAST, DISCONNECT_SUCCESS_TOAST];
      let longest: string = '';
      for (let index = 0; index < texts.length; index++) {
        if (texts[index].length > longest.length) {
          longest = texts[index];
        }
      }
      expect(longest).assertEqual(CONNECT_FAIL_TOAST);
      expect(longest.length).assertEqual(76);
      expect(longest.length).assertLarger(DISCONNECT_FAIL_TOAST.length);
      expect(DISCONNECT_FAIL_TOAST.length).assertLarger(SEND_FAIL_TOAST.length);
      expect(SEND_FAIL_TOAST.length).assertLarger(DISCONNECT_SUCCESS_TOAST.length);
      expect(DISCONNECT_SUCCESS_TOAST.length).assertLarger(CONNECT_SUCCESS_TOAST.length);
      expect(CONNECT_SUCCESS_TOAST.length).assertLarger(SEND_SUCCESS_TOAST.length);
    });

    /**
     * @tc.name          toastValidationToastPairOnReconnect
     * @tc.desc          A reconnect after disconnect adds a second connect toast.
     * @tc.precondition  A session was disconnected.
     * @tc.steps         1. Create a session and disconnect.
     *                   2. Connect again and deliver onConnect.
     *                   3. Count connect toasts.
     * @tc.expected      Two connect success toasts exist in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('toastValidationToastPairOnReconnect', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      client.connect(30);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(countOf(client.toasts, CONNECT_SUCCESS_TOAST)).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.toasts[1]).assertEqual(DISCONNECT_SUCCESS_TOAST);
      expect(client.toasts[2]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.connectId).assertEqual(30);
      expect(client.isConnected()).assertTrue();
    });

    /**
     * @tc.name          toastValidationFullTraceFingerprint
     * @tc.desc          The joined lifecycle toast trace has a stable fingerprint.
     * @tc.precondition  A session runs the full happy path twice.
     * @tc.steps         1. Build two identical sessions.
     *                   2. Join their toast traces.
     *                   3. Compare fingerprints.
     * @tc.expected      Both traces hash identically.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('toastValidationFullTraceFingerprint', 0, () => {
      const first: ConnectionModel = createConnectedSession();
      const second: ConnectionModel = createConnectedSession();
      first.sendString();
      second.sendString();
      first.onDisconnect();
      second.onDisconnect();
      expect(first.toasts.length).assertEqual(3);
      expect(second.toasts.length).assertEqual(3);
      expect(joined(first.toasts, '>')).assertEqual(joined(second.toasts, '>'));
      expect(textFingerprint(joined(first.toasts, '>'))).assertEqual(
        textFingerprint(joined(second.toasts, '>')));
      expect(textFingerprint(first.toasts[0]) === textFingerprint(first.toasts[2])).assertFalse();
      expect(first.lastToast()).assertEqual(second.lastToast());
    });
  });
}
