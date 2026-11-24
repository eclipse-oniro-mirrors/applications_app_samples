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
  ClientSnapshot,
  ClientMetrics,
  EventRecorder,
  RemoteProxyModel,
  RemoteStubModel,
  createConnectedSession,
  WantModel,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  REQUEST_CODE,
  ERROR_NONE,
  ERROR_SEND,
  STATE_CONNECTED,
  STATE_DISCONNECTED,
  STATE_FAILED,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint
} from '../Shared/SharedDriver';

export default function sessionValidation(): void {
  describe('SessionValidation', () => {
    beforeAll(() => {
      logSuite('SessionValidation', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('SessionValidation', 'end');
    });

    /**
     * @tc.name          sessionValidationHelperStartsWithConnectedState
     * @tc.desc          createConnectedSession returns a connected client.
     * @tc.precondition  The helper is exported.
     * @tc.steps         1. Build the session.
     *                   2. Read the state and id.
     *                   3. Check the death recipient.
     * @tc.expected      The session is connected with id seven and a registered recipient.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('sessionValidationHelperStartsWithConnectedState', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      logStep('sessionValidation', 'start');
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(7);
      expect(client.isConnected()).assertTrue();
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.proxy !== undefined).assertTrue();
      expect(client.proxy?.isAlive()).assertTrue();
      expect(client.toasts.length).assertEqual(1);
      expect(client.connectCalls).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationHelperDeathsRegistered
     * @tc.desc          The helper registers the client death recipient on the proxy.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the proxy registration flag.
     *                   2. Read the stored recipient.
     *                   3. Compare the event log.
     * @tc.expected      The proxy and the client agree on the registration.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationHelperDeathsRegistered', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.proxy?.deathRegistered).assertTrue();
      expect(client.proxy?.deathRecipient !== undefined).assertTrue();
      expect(client.proxy?.deathRecipient === client.deathRecipient).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.logs.contains('registerDeathRecipient success')).assertTrue();
      expect(client.events.size()).assertEqual(3);
    });

    /**
     * @tc.name          sessionValidationHelperDefaultReply
     * @tc.desc          The helper uses the default reply payload.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send the default payload.
     *                   2. Read the reply.
     *                   3. Compare with the constant.
     * @tc.expected      The reply is hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('sessionValidationHelperDefaultReply', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const result = client.sendString();
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(result.replyText).assertEqual('hello rpc');
      expect(result.errCode).assertEqual(ERROR_NONE);
      expect(client.proxy?.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
      expect(client.proxy?.stub.receivedTexts[0]).assertEqual('hello world');
      expect(client.proxy?.stub.handledCodes[0]).assertEqual(REQUEST_CODE);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          sessionValidationHelperCustomReply
     * @tc.desc          The helper honours a custom reply payload.
     * @tc.precondition  The helper is exported.
     * @tc.steps         1. Build a session with 'session reply'.
     *                   2. Send twice.
     *                   3. Compare both replies.
     * @tc.expected      Both replies equal the custom text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('sessionValidationHelperCustomReply', 0, () => {
      const client: ConnectionModel = createConnectedSession('session reply');
      expect(client.sendString('a').readReply()).assertEqual('session reply');
      expect(client.sendString('b').readReply()).assertEqual('session reply');
      expect(client.proxy?.stub.replyText).assertEqual('session reply');
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(2);
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.proxy?.sendCalls).assertEqual(2);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          sessionValidationMetricsFromSession
     * @tc.desc          ClientMetrics derives connect and send totals from events.
     * @tc.precondition  A session with two sends exists.
     * @tc.steps         1. Send twice.
     *                   2. Build the metrics.
     *                   3. Compare the fields.
     * @tc.expected      One connect, two sends and two replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationMetricsFromSession', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('one');
      client.sendString('two');
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertLarger(0);
      expect(client.events.countOf('send-ok')).assertEqual(2);
    });

    /**
     * @tc.name          sessionValidationMetricsRatioFailures
     * @tc.desc          The success ratio accounts for failed sends.
     * @tc.precondition  A session with one success and one failure exists.
     * @tc.steps         1. Send a success.
     *                   2. Force a failure and send.
     *                   3. Compute the ratio.
     * @tc.expected      The ratio is one half.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationMetricsRatioFailures', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('good');
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('bad');
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(metrics.successRatio()).assertLess(1);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          sessionValidationEmptyMetricsRatio
     * @tc.desc          A client without sends reports a zero ratio.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Build the metrics from a fresh client.
     *                   2. Compare every field.
     *                   3. Compute the ratio.
     * @tc.expected      All counts and the ratio are zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationEmptyMetricsRatio', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(0);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
      expect(metrics.fingerprint()).assertLarger(0);
      expect(client.events.size()).assertEqual(0);
    });

    /**
     * @tc.name          sessionValidationLifecycleEndToEnd
     * @tc.desc          A full session runs connect, send and disconnect in order.
     * @tc.precondition  A fresh client and live proxy exist.
     * @tc.steps         1. Connect with id ten.
     *                   2. Deliver the proxy and send.
     *                   3. Disconnect.
     * @tc.expected      The event order records every stage.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationLifecycleEndToEnd', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(10);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.sendString('lifecycle');
      expect(client.events.countOf('send-ok')).assertEqual(1);
      client.onDisconnect();
      const trace: string = client.events.trace();
      expect(trace.startsWith('connect:')).assertTrue();
      expect(trace.endsWith('disconnected:ok')).assertTrue();
      expect(client.events.size()).assertEqual(5);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(3);
      expect(client.connectId).assertEqual(-1);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          sessionValidationResetEndsSession
     * @tc.desc          reset() terminates the session and clears every trace.
     * @tc.precondition  A session with sends exists.
     * @tc.steps         1. Create the session and send.
     *                   2. Reset it.
     *                   3. Read all session fields.
     * @tc.expected      State, proxy, logs, toasts and events are cleared.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationResetEndsSession', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      client.reset();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.connectId).assertEqual(-1);
      expect(client.toasts.length).assertEqual(0);
      expect(client.events.size()).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
      expect(client.connectCalls).assertEqual(0);
      expect(client.isDisconnect).assertFalse();
      expect(client.deathRecipient.registered).assertFalse();
    });

    /**
     * @tc.name          sessionValidationSnapshotAtStart
     * @tc.desc          The session snapshot captures the connected start.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Build the snapshot.
     *                   2. Read each field.
     *                   3. Compare the describe string.
     * @tc.expected      The snapshot reports connected with id seven and one toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSnapshotAtStart', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(7);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.describe()).assertEqual('connected/7/true/true/1');
      expect(snapshot.sameAs(new ClientSnapshot(client))).assertTrue();
      expect(snapshot.describe().split('/').length).assertEqual(5);
    });

    /**
     * @tc.name          sessionValidationEventsStartWithConnect
     * @tc.desc          The session event recorder starts with connect and death registration.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the event entries.
     *                   2. Compare the first two entries.
     *                   3. Count the kinds.
     * @tc.expected      The recorder holds connect then death-register.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationEventsStartWithConnect', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const entries: string[] = client.events.entries;
      expect(entries.length).assertEqual(3);
      expect(entries[0]).assertEqual('connect:com.example.ipc_stub/ServiceAbility');
      expect(entries[1]).assertEqual('death-register:IPCStubTest');
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.last()).assertEqual('connected:IPCStubTest');
      expect(client.events.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          sessionValidationSendEventDetail
     * @tc.desc          A send records the reply text in its event detail.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send the default payload.
     *                   2. Read the last event.
     *                   3. Split the detail.
     * @tc.expected      The detail equals the reply payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSendEventDetail', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString();
      expect(client.events.last()).assertEqual('send-ok:hello rpc');
      expect(client.events.last().split(':').length).assertEqual(2);
      expect(client.events.last().split(':')[0]).assertEqual('send-ok');
      expect(client.events.last().split(':')[1]).assertEqual(REPLY_PAYLOAD);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.events.size()).assertEqual(4);
      expect(client.events.entries[3]).assertEqual('send-ok:' + REPLY_PAYLOAD);
      expect(client.events.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name          sessionValidationSnapshotAfterSend
     * @tc.desc          Sending grows the snapshot toast count only.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Snapshot before the send.
     *                   2. Send.
     *                   3. Snapshot after the send.
     * @tc.expected      The toast count grows and the other fields hold.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSnapshotAfterSend', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const before: ClientSnapshot = new ClientSnapshot(client);
      client.sendString('snapshot');
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(before.toastCount).assertEqual(1);
      expect(after.toastCount).assertEqual(2);
      expect(after.toastCount - before.toastCount).assertEqual(1);
      expect(after.connectId).assertEqual(before.connectId);
      expect(after.state).assertEqual(before.state);
      expect(after.hasProxy).assertEqual(before.hasProxy);
      expect(after.deathRegistered).assertEqual(before.deathRegistered);
      expect(before.sameAs(after)).assertFalse();
    });

    /**
     * @tc.name          sessionValidationSnapshotAfterDeath
     * @tc.desc          A dead proxy makes the session snapshot differ on proxy liveness.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Capture the snapshot.
     *         2. Notify proxy death.
     *         3. Capture the snapshot again.
     * @tc.expected      The state text stays connected while liveness is false.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSnapshotAfterDeath', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const before: ClientSnapshot = new ClientSnapshot(client);
      client.proxy?.notifyDeath();
      const after: ClientSnapshot = new ClientSnapshot(client);
      expect(before.state).assertEqual(STATE_CONNECTED);
      expect(after.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(after.hasProxy).assertTrue();
      expect(after.deathRegistered).assertTrue();
      expect(before.sameAs(after)).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.proxy?.isAlive()).assertFalse();
    });

    /**
     * @tc.name          sessionValidationReconnectAfterDisconnectCycle
     * @tc.desc          A session survives a disconnect and reconnect cycle.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect the session.
     *                   2. Connect again with id twenty.
     *                   3. Deliver a new proxy.
     * @tc.expected      The reconnect ends connected with two connect events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationReconnectAfterDisconnectCycle', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connect(20)).assertTrue();
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(20);
      expect(client.events.countOf('connect')).assertEqual(2);
      expect(client.events.countOf('connected')).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
      expect(client.isConnected()).assertTrue();
      expect(client.connectCalls).assertEqual(2);
    });

    /**
     * @tc.name          sessionValidationTwoSessionsIndependent
     * @tc.desc          Two sessions keep separate events, proxies and toasts.
     * @tc.precondition  Two connected sessions exist.
     * @tc.steps         1. Send on the first only.
     *                   2. Disconnect the second.
     *                   3. Compare both sessions.
     * @tc.expected      Each session records only its own operations.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationTwoSessionsIndependent', 0, () => {
      const first: ConnectionModel = createConnectedSession('first-reply');
      const second: ConnectionModel = createConnectedSession('second-reply');
      first.sendString('a');
      second.onDisconnect();
      expect(first.state).assertEqual(STATE_CONNECTED);
      expect(second.state).assertEqual(STATE_DISCONNECTED);
      expect(first.events.countOf('send-ok')).assertEqual(1);
      expect(second.events.countOf('send-ok')).assertEqual(0);
      expect(first.proxy !== undefined).assertTrue();
      expect(second.proxy === undefined).assertTrue();
      expect(first.toasts.length).assertEqual(2);
      expect(second.toasts.length).assertEqual(2);
      expect(first.proxy?.stub.replyText).assertEqual('first-reply');
    });

    /**
     * @tc.name          sessionValidationSessionReplyIsolation
     * @tc.desc          Custom replies never leak between sessions.
     * @tc.precondition  Two sessions with different replies exist.
     * @tc.steps         1. Send on both.
     *                   2. Compare the replies.
     *                   3. Compare the stub received texts.
     * @tc.expected      Each session returns its own reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSessionReplyIsolation', 0, () => {
      const first: ConnectionModel = createConnectedSession('alpha');
      const second: ConnectionModel = createConnectedSession('beta');
      expect(first.sendString('q1').readReply()).assertEqual('alpha');
      expect(second.sendString('q2').readReply()).assertEqual('beta');
      expect(first.sendString('q3').readReply()).assertEqual('alpha');
      expect(first.proxy?.stub.receivedTexts.length).assertEqual(2);
      expect(second.proxy?.stub.receivedTexts.length).assertEqual(1);
      expect(second.proxy?.stub.receivedTexts[0]).assertEqual('q2');
      expect(second.proxy?.stub.receivedTexts[0] === 'q1').assertFalse();
    });

    /**
     * @tc.name          sessionValidationEventRecorderStandalone
     * @tc.desc          A standalone EventRecorder records and reports kinds.
     * @tc.precondition  A fresh recorder exists.
     * @tc.steps         1. Record three entries of two kinds.
     *                   2. Count each kind.
     *                   3. Read the last entry.
     * @tc.expected      The counts and tail match the recorded data.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationEventRecorderStandalone', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('start', 'one');
      recorder.record('step', 'two');
      recorder.record('start', 'three');
      expect(recorder.size()).assertEqual(3);
      expect(recorder.countOf('start')).assertEqual(2);
      expect(recorder.countOf('step')).assertEqual(1);
      expect(recorder.countOf('missing')).assertEqual(0);
      expect(recorder.last()).assertEqual('start:three');
      expect(recorder.trace()).assertEqual('start:one|step:two|start:three');
      expect(recorder.fingerprint()).assertLarger(0);
      expect(recorder.entries.length).assertEqual(3);
    });

    /**
     * @tc.name          sessionValidationEventRecorderClear
     * @tc.desc          Clearing a recorder resets its size and fingerprint.
     * @tc.precondition  A recorder with entries exists.
     * @tc.steps         1. Record two entries.
     *                   2. Clear the recorder.
     *                   3. Read the accessors.
     * @tc.expected      The recorder becomes empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationEventRecorderClear', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('a', '1');
      recorder.record('b', '2');
      const before: number = recorder.fingerprint();
      recorder.clear();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.entries.length).assertEqual(0);
      expect(recorder.trace()).assertEqual('');
      expect(recorder.last()).assertEqual('');
      expect(recorder.countOf('a')).assertEqual(0);
      expect(recorder.fingerprint()).assertEqual(textFingerprint(''));
      expect(recorder.fingerprint() === before).assertFalse();
      expect(textFingerprint(recorder.trace())).assertEqual(216613);
    });

    /**
     * @tc.name          sessionValidationSessionEndMetrics
     * @tc.desc          Metrics after a closed session keep the send totals.
     * @tc.precondition  A session with two sends is disconnected.
     * @tc.steps         1. Send twice and disconnect.
     *                   2. Build the metrics.
     *                   3. Compare the fields.
     * @tc.expected      Sends and replies remain two after the disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSessionEndMetrics', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('one');
      client.sendString('two');
      client.onDisconnect();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.toasts.length).assertEqual(4);
    });

    /**
     * @tc.name          sessionValidationStartLogSequence
     * @tc.desc          A session start writes the register and onConnect info lines.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the log lines.
     *                   2. Compare with the expected sequence.
     *                   3. Count the info level.
     * @tc.expected      The start log holds two info lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationStartLogSequence', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.logs.size()).assertEqual(2);
      expect(client.logs.lines[0]).assertEqual('INFO registerDeathRecipient success');
      expect(client.logs.lines[1]).assertEqual('INFO onConnect');
      expect(client.logs.trace()).assertEqual('INFO registerDeathRecipient success|INFO onConnect');
      expect(client.logs.countLevel('INFO')).assertEqual(2);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(client.logs.limit).assertEqual(128);
    });

    /**
     * @tc.name          sessionValidationEndLogSequence
     * @tc.desc          A session end appends the onDisconnect info line.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Disconnect the session.
     *                   2. Read the log tail.
     *                   3. Compare the level counts.
     * @tc.expected      The tail is the onDisconnect line.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationEndLogSequence', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      expect(client.logs.size()).assertEqual(3);
      expect(client.logs.lines[2]).assertEqual('INFO onDisconnect');
      expect(client.logs.trace().endsWith('|INFO onDisconnect')).assertTrue();
      expect(client.logs.countLevel('INFO')).assertEqual(3);
      expect(client.logs.countLevel('WARN')).assertEqual(0);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.logs.trace().split('|').length).assertEqual(3);
      expect(client.logs.contains('onDisconnect')).assertTrue();
    });

    /**
     * @tc.name          sessionValidationToastSequence
     * @tc.desc          A session start, send and end push three ordered toasts.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send a payload.
     *                   2. Disconnect.
     *                   3. Compare the toast array.
     * @tc.expected      The toasts are connect, send, disconnect in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationToastSequence', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('toast');
      client.onDisconnect();
      expect(client.toasts.length).assertEqual(3);
      expect(client.toasts[0]).assertEqual('connectAbility success');
      expect(client.toasts[1]).assertEqual('sendRequest success');
      expect(client.toasts[2]).assertEqual('disconnectAbility success');
      expect(joined(client.toasts, '>')).assertEqual(
        'connectAbility success>sendRequest success>disconnectAbility success');
      expect(client.lastToast()).assertEqual('disconnectAbility success');
      expect(uniqueStrings(client.toasts).length).assertEqual(3);
      expect(countOf(client.toasts, 'sendRequest success')).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationDisconnectFlag
     * @tc.desc          The disconnect flag is set only after onDisconnect.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the flag before the callback.
     *                   2. Disconnect.
     *                   3. Read the flag again.
     * @tc.expected      The flag moves from false to true.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationDisconnectFlag', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.isDisconnect).assertFalse();
      client.disconnectRequested();
      expect(client.isDisconnect).assertFalse();
      client.onDisconnect();
      expect(client.isDisconnect).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.proxy === undefined).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.events.countOf('disconnect-request')).assertEqual(1);
      expect(client.events.countOf('disconnected')).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationDisconnectUnregistersRecipient
     * @tc.desc          onDisconnect unregisters the death recipient from the proxy.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Capture the proxy reference.
     *                   2. Disconnect.
     *                   3. Inspect the proxy registration.
     * @tc.expected      The recipient is unregistered and the proxy is dropped.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationDisconnectUnregistersRecipient', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const proxyRef: RemoteProxyModel | undefined = client.proxy;
      expect(proxyRef?.deathRegistered).assertTrue();
      client.onDisconnect();
      expect(client.proxy === undefined).assertTrue();
      expect(client.deathRecipient.registered).assertFalse();
      expect(proxyRef?.deathRegistered).assertFalse();
      expect(proxyRef?.deathRecipient === undefined).assertTrue();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.logs.contains('onDisconnect')).assertTrue();
    });

    /**
     * @tc.name          sessionValidationResetAfterDisconnect
     * @tc.desc          Reset after a closed session leaves a clean client.
     * @tc.precondition  A session was disconnected.
     * @tc.steps         1. Disconnect the session.
     *                   2. Reset.
     *                   3. Read the snapshot.
     * @tc.expected      The snapshot matches a fresh client.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationResetAfterDisconnect', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      client.reset();
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.connectId).assertEqual(-1);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.toastCount).assertEqual(0);
      expect(client.isDisconnect).assertFalse();
      expect(client.events.size()).assertEqual(0);
      expect(client.logs.size()).assertEqual(0);
      expect(snapshot.sameAs(new ClientSnapshot(new ConnectionModel()))).assertTrue();
    });

    /**
     * @tc.name          sessionValidationDeathFlowSnapshot
     * @tc.desc          The death notification increments the recipient and stops liveness.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Notify proxy death.
     *                   2. Read the recipient count.
     *                   3. Read the snapshot fields.
     * @tc.expected      One death is counted while the state text stays connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationDeathFlowSnapshot', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.proxy?.notifyDeath();
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(client.proxy?.isAlive()).assertFalse();
      expect(client.isConnected()).assertFalse();
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.connectId).assertEqual(7);
      expect(client.events.countOf('death-register')).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationConnectCallCount
     * @tc.desc          The session helper performs exactly one connect call.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the connect call counter.
     *                   2. Attempt another connect.
     *                   3. Recheck the counter.
     * @tc.expected      The counter moves from one to two on the extra attempt.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationConnectCallCount', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.connectCalls).assertEqual(1);
      expect(client.connect(99)).assertFalse();
      expect(client.connectCalls).assertEqual(2);
      expect(client.connectId).assertEqual(7);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.logs.contains('connect skipped in state connected')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationWantReferenceStable
     * @tc.desc          The session keeps the default want reference.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the want names.
     *                   2. Compare with a fresh want.
     *                   3. Check validation.
     * @tc.expected      The session want matches the production target.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationWantReferenceStable', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.want.matches(new WantModel())).assertTrue();
      expect(client.want.bundleName).assertEqual('com.example.ipc_stub');
      expect(client.want.abilityName).assertEqual('ServiceAbility');
      expect(client.want.validate().length).assertEqual(0);
      expect(client.want.describe()).assertEqual('com.example.ipc_stub/ServiceAbility');
      expect(client.events.entries[0]).assertEqual('connect:' + client.want.describe());
      expect(client.want.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          sessionValidationDeadProxyRegistrationFailure
     * @tc.desc          A dead proxy at connect time produces a failed registration event.
     * @tc.precondition  A killed proxy exists.
     * @tc.steps         1. Connect a fresh session by hand.
     *                   2. Deliver the killed proxy.
     *                   3. Read events and logs.
     * @tc.expected      The failure event is recorded and the toast still shows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationDeadProxyRegistrationFailure', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      proxy.kill();
      client.connect(11);
      client.onConnect(proxy);
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(0);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.logs.contains('register failed')).assertTrue();
      expect(client.toasts.length).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.logs.countLevel('ERROR')).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationFailedAttemptThenReconnect
     * @tc.desc          A failed attempt can be followed by a successful session.
     * @tc.precondition  A fresh client exists.
     * @tc.steps         1. Connect and fail.
     *                   2. Connect again and deliver a proxy.
     *                   3. Send one payload.
     * @tc.expected      The session ends connected with one success.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationFailedAttemptThenReconnect', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(1);
      client.onFailed(16000001);
      expect(client.state).assertEqual(STATE_FAILED);
      expect(client.connect(2)).assertTrue();
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.sendString('retry').isSuccess()).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.connectId).assertEqual(2);
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
      expect(client.toasts.length).assertEqual(3);
      expect(client.failedCode).assertEqual(16000001);
    });

    /**
     * @tc.name          sessionValidationMetricsFingerprintKnown
     * @tc.desc          Metrics fingerprint matches the documented count encoding.
     * @tc.precondition  A session with two sends exists.
     * @tc.steps         1. Send twice.
     *                   2. Compute the metrics fingerprint.
     *                   3. Compare with the manual encoding.
     * @tc.expected      The fingerprint equals the hashed count string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationMetricsFingerprintKnown', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('a');
      client.sendString('b');
      const metrics: ClientMetrics = ClientMetrics.from(client);
      const manual: number = textFingerprint('1:2:0:2');
      expect(metrics.fingerprint()).assertEqual(manual);
      expect(metrics.fingerprint()).assertLarger(0);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.sends).assertEqual(2);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationMetricsFailureKinds
     * @tc.desc          Metrics count both connection and send failures.
     * @tc.precondition  A session with a send failure and a connect failure exists.
     * @tc.steps         1. Force a send failure.
     *                   2. Trigger a connection failure.
     *                   3. Read the metrics failures.
     * @tc.expected      The failure total is two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationMetricsFailureKinds', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('bad');
      client.onFailed(16000001);
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.failures).assertEqual(2);
      expect(metrics.sends).assertEqual(1);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('1:1:2:0'));
      expect(client.events.countOf('failed')).assertEqual(1);
      expect(client.events.countOf('send-failed')).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationFiveSendsEventCount
     * @tc.desc          Five sends produce five send events and three base events.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send five payloads.
     *                   2. Count the events.
     *                   3. Compare the total size.
     * @tc.expected      The event recorder holds eight entries.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationFiveSendsEventCount', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      for (let index = 0; index < 5; index++) {
        client.sendString('s' + String(index));
      }
      expect(client.events.countOf('send-ok')).assertEqual(5);
      expect(client.events.size()).assertEqual(8);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.events.entries.length).assertEqual(8);
      expect(client.events.trace().split('|').length).assertEqual(8);
      expect(client.toasts.length).assertEqual(6);
    });

    /**
     * @tc.name          sessionValidationSnapshotAfterFailure
     * @tc.desc          A failure snapshot reports the failed state and toast.
     * @tc.precondition  A connecting client exists.
     * @tc.steps         1. Connect and fail.
     *                   2. Build the snapshot.
     *                   3. Compare the fields.
     * @tc.expected      The snapshot describes the failed state with one toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSnapshotAfterFailure', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      client.connect(3);
      client.onFailed(16000001);
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_FAILED);
      expect(snapshot.connectId).assertEqual(3);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.describe()).assertEqual('failed/3/false/false/1');
      expect(client.toasts[0].startsWith('Connect failed')).assertTrue();
      expect(client.events.countOf('failed')).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationDeathCountAfterDisconnect
     * @tc.desc          Death notifications after disconnect do not reach the client.
     * @tc.precondition  A session was disconnected with a captured proxy.
     * @tc.steps         1. Disconnect and keep the proxy reference.
     *                   2. Notify death on the old proxy.
     *                   3. Read the recipient count.
     * @tc.expected      The client recipient never receives the notification.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationDeathCountAfterDisconnect', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const proxyRef: RemoteProxyModel | undefined = client.proxy;
      client.onDisconnect();
      expect(proxyRef?.deathRecipient === undefined).assertTrue();
      proxyRef?.notifyDeath();
      expect(client.deathRecipient.diedCount).assertEqual(0);
      expect(client.proxy === undefined).assertTrue();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isConnected()).assertFalse();
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          sessionValidationSendLogDetail
     * @tc.desc          The send log line includes the reply text.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send with a custom reply.
     *                   2. Read the last log line.
     *                   3. Compare with the expected text.
     * @tc.expected      The log ends with the reply text.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSendLogDetail', 0, () => {
      const client: ConnectionModel = createConnectedSession('logged reply');
      client.sendString('query');
      expect(client.logs.size()).assertEqual(3);
      expect(client.logs.lines[2]).assertEqual('INFO reply logged reply');
      expect(client.logs.contains('reply logged reply')).assertTrue();
      expect(client.logs.trace().endsWith('reply logged reply')).assertTrue();
      expect(client.logs.countLevel('INFO')).assertEqual(3);
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.logs.lines[2].startsWith('INFO ')).assertTrue();
      expect(client.toasts.length).assertEqual(2);
    });

    /**
     * @tc.name          sessionValidationToastsAfterTwoFailures
     * @tc.desc          Two failed sends add two identical failure toasts.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Force and send two failures.
     *                   2. Read the toast array.
     *                   3. Compare the counts.
     * @tc.expected      The failure literal occurs twice.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationToastsAfterTwoFailures', 0, () => {
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
      expect(countOf(client.toasts, 'sendRequest failed, please connect to the server first')).assertEqual(2);
      expect(client.toasts[0]).assertEqual('connectAbility success');
      expect(client.toasts[1]).assertEqual(client.toasts[2]);
      expect(uniqueStrings(client.toasts).length).assertEqual(2);
      expect(client.events.countOf('send-failed')).assertEqual(2);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          sessionValidationIdenticalSessionsFingerprint
     * @tc.desc          Two sessions running the same steps share event fingerprints.
     * @tc.precondition  Two connected sessions exist.
     * @tc.steps         1. Send on both.
     *                   2. Compare the event traces.
     *                   3. Compare the fingerprints.
     * @tc.expected      Both sessions share traces and fingerprints.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationIdenticalSessionsFingerprint', 0, () => {
      const first: ConnectionModel = createConnectedSession();
      const second: ConnectionModel = createConnectedSession();
      first.sendString('same');
      second.sendString('same');
      expect(first.events.trace()).assertEqual(second.events.trace());
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.logs.trace()).assertEqual(second.logs.trace());
      expect(first.toasts.length).assertEqual(second.toasts.length);
      expect(first.events.size()).assertEqual(4);
      expect(second.events.size()).assertEqual(4);
      expect(textFingerprint(first.events.trace())).assertLarger(0);
      expect(first.events.fingerprint()).assertEqual(textFingerprint(first.events.trace()));
    });

    /**
     * @tc.name          sessionValidationCustomWantSession
     * @tc.desc          A session built with a custom want keeps it through the lifecycle.
     * @tc.precondition  A custom want is constructed.
     * @tc.steps         1. Build a client with the custom want.
     *                   2. Connect and deliver a proxy.
     *                   3. Send and disconnect.
     * @tc.expected      The want still matches the custom values at the end.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationCustomWantSession', 0, () => {
      const want: WantModel = new WantModel('com.example.custom', 'CustomAbility');
      const client: ConnectionModel = new ConnectionModel(want);
      client.connect(2);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      client.sendString();
      client.onDisconnect();
      expect(client.want.bundleName).assertEqual('com.example.custom');
      expect(client.want.abilityName).assertEqual('CustomAbility');
      expect(client.want.matches(want)).assertTrue();
      expect(client.want.validate().length).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.toasts.length).assertEqual(3);
      expect(client.events.size()).assertEqual(5);
    });

    /**
     * @tc.name          sessionValidationProxyDescriptor
     * @tc.desc          The proxy inherits the stub descriptor for the session.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the proxy descriptor.
     *                   2. Compare with the stub descriptor.
     *                   3. Check the event detail.
     * @tc.expected      Both descriptors are IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationProxyDescriptor', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      expect(client.proxy?.descriptor).assertEqual('IPCStubTest');
      expect(client.proxy?.stub.descriptor).assertEqual('IPCStubTest');
      expect(client.proxy?.descriptor).assertEqual(client.proxy?.stub.descriptor);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.last()).assertEqual('connected:IPCStubTest');
      expect(client.events.entries[1]).assertEqual('death-register:IPCStubTest');
      expect(client.logs.contains('onConnect')).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          sessionValidationCustomStubDescriptor
     * @tc.desc          A custom stub descriptor flows into the session events.
     * @tc.precondition  A custom stub and proxy exist.
     * @tc.steps         1. Build the proxy with a custom descriptor.
     *                   2. Connect and deliver it.
     *                   3. Read the events.
     * @tc.expected      The custom descriptor appears in the register and connect events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationCustomStubDescriptor', 0, () => {
      const stub: RemoteStubModel = new RemoteStubModel('SessionDescriptor');
      const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
      const client: ConnectionModel = new ConnectionModel();
      client.connect(4);
      client.onConnect(proxy);
      expect(client.proxy?.descriptor).assertEqual('SessionDescriptor');
      expect(client.events.entries[1]).assertEqual('death-register:SessionDescriptor');
      expect(client.events.last()).assertEqual('connected:SessionDescriptor');
      expect(client.proxy?.descriptor).assertEqual('SessionDescriptor');
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.toasts.length).assertEqual(1);
      expect(client.logs.countLevel('INFO')).assertEqual(2);
    });

    /**
     * @tc.name          sessionValidationReplyWriteCounts
     * @tc.desc          Each send result writes one reply into its own sequence.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send twice.
     *                   2. Inspect both reply sequences.
     *                   3. Compare the counters.
     * @tc.expected      Both results hold one write and zero reads before reading.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationReplyWriteCounts', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      const first = client.sendString('one');
      const second = client.sendString('two');
      expect(first.reply.writeCount).assertEqual(1);
      expect(second.reply.writeCount).assertEqual(1);
      expect(first.reply.cursor).assertEqual(0);
      expect(second.reply.cursor).assertEqual(0);
      expect(first.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(second.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(first.reply.readCount).assertEqual(1);
      expect(second.reply.readCount).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationTenSendsMetrics
     * @tc.desc          Ten successful sends produce ten replies and a unit ratio.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send ten payloads.
     *                   2. Build the metrics.
     *                   3. Compare the totals.
     * @tc.expected      The metrics report ten sends and ten replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationTenSendsMetrics', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      for (let index = 0; index < 10; index++) {
        client.sendString('p' + String(index));
      }
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(10);
      expect(metrics.replies).assertEqual(10);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.connects).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('1:10:0:10'));
      expect(client.events.size()).assertEqual(13);
      expect(client.toasts.length).assertEqual(11);
    });

    /**
     * @tc.name          sessionValidationRatioThreeQuarters
     * @tc.desc          Three successes out of four sends yield a ratio of three quarters.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send three successes.
     *                   2. Force one failure.
     *                   3. Compute the ratio.
     * @tc.expected      The ratio is three quarters.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationRatioThreeQuarters', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('a');
      client.sendString('b');
      client.sendString('c');
      if (client.proxy !== undefined) {
        client.proxy.failNextSend = ERROR_SEND;
      }
      client.sendString('d');
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(4);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.failures).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0.75);
      expect(metrics.successRatio()).assertLess(1);
      expect(metrics.successRatio()).assertLarger(0.5);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('1:4:1:3'));
      expect(client.events.countOf('send-ok')).assertEqual(3);
    });

    /**
     * @tc.name          sessionValidationResetSnapshotEquality
     * @tc.desc          A reset session matches a fresh client snapshot.
     * @tc.precondition  A used session was reset.
     * @tc.steps         1. Run a session and reset.
     *                   2. Snapshot it and a fresh client.
     *                   3. Compare descriptions.
     * @tc.expected      Both snapshots are equal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationResetSnapshotEquality', 0, () => {
      const used: ConnectionModel = createConnectedSession();
      used.sendString();
      used.onDisconnect();
      used.reset();
      const left: ClientSnapshot = new ClientSnapshot(used);
      const right: ClientSnapshot = new ClientSnapshot(new ConnectionModel());
      expect(left.sameAs(right)).assertTrue();
      expect(left.describe()).assertEqual(right.describe());
      expect(left.describe()).assertEqual('disconnected/-1/false/false/0');
      expect(left.toastCount).assertEqual(0);
      expect(left.state).assertEqual(STATE_DISCONNECTED);
      expect(used.logs.size()).assertEqual(0);
      expect(used.events.size()).assertEqual(0);
      expect(used.want.validate().length).assertEqual(0);
    });

    /**
     * @tc.name          sessionValidationStartEventOrder
     * @tc.desc          The connect event precedes death registration and send events.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send one payload.
     *                   2. Read the event entries.
     *                   3. Compare the ordering.
     * @tc.expected      The order is connect, death-register, connected, send-ok.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationStartEventOrder', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('order');
      const entries: string[] = client.events.entries;
      expect(entries.length).assertEqual(4);
      expect(entries[0].startsWith('connect:')).assertTrue();
      expect(entries[1].startsWith('death-register:')).assertTrue();
      expect(entries[2].startsWith('connected:')).assertTrue();
      expect(entries[3].startsWith('send-ok:')).assertTrue();
      expect(client.events.entries.indexOf(entries[0])).assertEqual(0);
      expect(client.events.entries.indexOf(entries[3])).assertEqual(3);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(1);
    });

    /**
     * @tc.name          sessionValidationSessionEndUniqueToasts
     * @tc.desc          A closed session holds three distinct toast literals.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send once.
     *                   2. Disconnect.
     *                   3. Deduplicate the toasts.
     * @tc.expected      The three toasts are unique.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSessionEndUniqueToasts', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('unique');
      client.onDisconnect();
      expect(client.toasts.length).assertEqual(3);
      expect(uniqueStrings(client.toasts).length).assertEqual(3);
      expect(client.toasts[0].startsWith('connectAbility')).assertTrue();
      expect(client.toasts[1].startsWith('sendRequest')).assertTrue();
      expect(client.toasts[2].startsWith('disconnectAbility')).assertTrue();
      expect(client.lastToast()).assertEqual('disconnectAbility success');
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.isDisconnect).assertTrue();
    });

    /**
     * @tc.name          sessionValidationSendsKeepOrderedLogs
     * @tc.desc          Send log lines appear in send order.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send three custom-reply payloads.
     *                   2. Read the log tail.
     *                   3. Compare the order.
     * @tc.expected      The reply lines appear in the order sent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationSendsKeepOrderedLogs', 0, () => {
      const client: ConnectionModel = createConnectedSession('r');
      client.sendString('1');
      client.sendString('2');
      client.sendString('3');
      expect(client.logs.size()).assertEqual(5);
      expect(client.logs.lines[2]).assertEqual('INFO reply r');
      expect(client.logs.lines[3]).assertEqual('INFO reply r');
      expect(client.logs.lines[4]).assertEqual('INFO reply r');
      expect(countOf(client.logs.lines, 'INFO reply r')).assertEqual(3);
      expect(client.logs.trace().endsWith('INFO reply r')).assertTrue();
      expect(client.events.countOf('send-ok')).assertEqual(3);
      expect(client.proxy?.stub.receivedTexts[2]).assertEqual('3');
    });

    /**
     * @tc.name          sessionValidationBulkLifecycleSnapshot
     * @tc.desc          A session with many sends keeps a consistent snapshot.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send one hundred payloads.
     *                   2. Build the snapshot.
     *                   3. Compare the counts.
     * @tc.expected      The snapshot reports one hundred one toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationBulkLifecycleSnapshot', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      for (let index = 0; index < 100; index++) {
        client.sendString('bulk');
      }
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.toastCount).assertEqual(101);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(7);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(client.events.countOf('send-ok')).assertEqual(100);
      expect(client.proxy?.stub.receivedTexts.length).assertEqual(100);
      expect(client.logs.size()).assertEqual(102);
    });

    /**
     * @tc.name          sessionValidationMetricsAfterReset
     * @tc.desc          Metrics of a reset session report zero totals.
     * @tc.precondition  A used session was reset.
     * @tc.steps         1. Send twice and reset.
     *                   2. Build the metrics.
     *                   3. Compare every field.
     * @tc.expected      All metrics are zero and the ratio is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationMetricsAfterReset', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('a');
      client.sendString('b');
      client.reset();
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.connects).assertEqual(0);
      expect(metrics.sends).assertEqual(0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.failures).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('0:0:0:0'));
      expect(client.events.size()).assertEqual(0);
      expect(client.connectCalls).assertEqual(0);
    });

    /**
     * @tc.name          sessionValidationRequestListCount
     * @tc.desc          The proxy request list tracks every session send.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send four payloads.
     *                   2. Read the request list.
     *                   3. Compare with the send count.
     * @tc.expected      The request list holds four request codes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationRequestListCount', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('1');
      client.sendString('2');
      client.sendString('3');
      client.sendString('4');
      const requests: number[] = client.proxy?.requests ?? [];
      expect(requests.length).assertEqual(4);
      expect(requests[0]).assertEqual(REQUEST_CODE);
      expect(requests[3]).assertEqual(REQUEST_CODE);
      expect(uniqueStrings([String(requests[0]), String(requests[3])]).length).assertEqual(1);
      expect(client.proxy?.sendCalls).assertEqual(4);
      expect(client.proxy?.stub.handledCodes.length).assertEqual(4);
    });

    /**
     * @tc.name          sessionValidationReconnectToastResume
     * @tc.desc          A reconnect cycle appends a second connect toast.
     * @tc.precondition  A session was disconnected.
     * @tc.steps         1. Disconnect and connect again.
     *                   2. Deliver a new proxy.
     *                   3. Count the connect toasts.
     * @tc.expected      Two connect toasts and one disconnect toast exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationReconnectToastResume', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.onDisconnect();
      client.connect(31);
      client.onConnect(new RemoteProxyModel(new RemoteStubModel()));
      expect(client.toasts.length).assertEqual(3);
      expect(countOf(client.toasts, 'connectAbility success')).assertEqual(2);
      expect(countOf(client.toasts, 'disconnectAbility success')).assertEqual(1);
      expect(client.toasts[2]).assertEqual('connectAbility success');
      expect(client.lastToast()).assertEqual('connectAbility success');
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.isDisconnect).assertTrue();
      expect(client.connectId).assertEqual(31);
    });

    /**
     * @tc.name          sessionValidationEndAfterTwoSendsSnapshot
     * @tc.desc          The final snapshot after two sends and a disconnect is consistent.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Send twice and disconnect.
     *                   2. Build the snapshot.
     *                   3. Compare the fields.
     * @tc.expected      The snapshot reports disconnected with three toasts.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationEndAfterTwoSendsSnapshot', 0, () => {
      const client: ConnectionModel = createConnectedSession();
      client.sendString('a');
      client.sendString('b');
      client.onDisconnect();
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_DISCONNECTED);
      expect(snapshot.toastCount).assertEqual(4);
      expect(snapshot.hasProxy).assertFalse();
      expect(snapshot.deathRegistered).assertFalse();
      expect(snapshot.connectId).assertEqual(-1);
      expect(snapshot.describe()).assertEqual('disconnected/-1/false/false/4');
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.proxy === undefined).assertTrue();
    });

    /**
     * @tc.name          sessionValidationRegistrationFailureThenDisconnect
     * @tc.desc          A failed registration can still be closed cleanly.
     * @tc.precondition  A killed proxy was delivered to a client.
     * @tc.steps         1. Connect and deliver the killed proxy.
     *                   2. Disconnect.
     *                   3. Read the state and events.
     * @tc.expected      The disconnect succeeds and the recipient stays unregistered.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('sessionValidationRegistrationFailureThenDisconnect', 0, () => {
      const client: ConnectionModel = new ConnectionModel();
      const proxy: RemoteProxyModel = new RemoteProxyModel(new RemoteStubModel());
      proxy.kill();
      client.connect(12);
      client.onConnect(proxy);
      client.onDisconnect();
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.deathRecipient.registered).assertFalse();
      expect(client.proxy === undefined).assertTrue();
      expect(client.events.countOf('death-register-failed')).assertEqual(1);
      expect(client.events.countOf('disconnected')).assertEqual(1);
      expect(client.toasts.length).assertEqual(2);
      expect(client.isDisconnect).assertTrue();
      expect(client.connectId).assertEqual(-1);
    });

    /**
     * @tc.name          sessionValidationTwoSendLogCount
     * @tc.desc          Two sends add exactly two reply log lines.
     * @tc.precondition  A connected session exists.
     * @tc.steps         1. Read the start log count.
     *                   2. Send twice.
     *                   3. Compare the final count.
     * @tc.expected      The log grows from two to four lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationTwoSendLogCount', 0, () => {
      const client: ConnectionModel = createConnectedSession('counted');
      expect(client.logs.size()).assertEqual(2);
      client.sendString('a');
      expect(client.logs.size()).assertEqual(3);
      client.sendString('b');
      expect(client.logs.size()).assertEqual(4);
      expect(countOf(client.logs.lines, 'INFO reply counted')).assertEqual(2);
      expect(client.logs.countLevel('INFO')).assertEqual(4);
      expect(client.logs.trace().split('|').length).assertEqual(4);
      expect(client.events.countOf('send-ok')).assertEqual(2);
      expect(client.toasts.length).assertEqual(3);
    });

    /**
     * @tc.name          sessionValidationCycleFingerprintStable
     * @tc.desc          Two identical sessions produce equal event and log traces.
     * @tc.precondition  Two sessions run the same operations.
     * @tc.steps         1. Run a send and disconnect on both.
     *                   2. Compare the traces.
     *                   3. Compare the fingerprints.
     * @tc.expected      Both sessions agree on every trace.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('sessionValidationCycleFingerprintStable', 0, () => {
      const first: ConnectionModel = createConnectedSession();
      const second: ConnectionModel = createConnectedSession();
      first.sendString('cycle');
      second.sendString('cycle');
      first.onDisconnect();
      second.onDisconnect();
      expect(first.events.trace()).assertEqual(second.events.trace());
      expect(first.logs.trace()).assertEqual(second.logs.trace());
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(textFingerprint(first.logs.trace())).assertEqual(textFingerprint(second.logs.trace()));
      expect(first.toasts.length).assertEqual(second.toasts.length);
      expect(first.state).assertEqual(second.state);
      expect(first.events.size()).assertEqual(5);
      expect(second.events.size()).assertEqual(5);
    });
  });
}
