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
  STUB_DESCRIPTOR,
  REQUEST_CODE,
  UNKNOWN_CODE_ZERO,
  UNKNOWN_CODE_TWO,
  UNKNOWN_CODE_NEGATIVE,
  UNKNOWN_CODE_LARGE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  EVENT_ON_CONNECT,
  EVENT_ON_DISCONNECT,
  EVENT_ON_DESTROY,
  EVENT_ON_REQUEST,
  InProcessClient,
  StubRemoteObjectModel,
  ServiceLifecycleModel,
  ServiceSnapshot,
  StubMetrics,
  countOf,
  joined,
  textFingerprint
} from '../Shared/SharedDriver';

function openConversation(service: ServiceLifecycleModel): InProcessClient {
  const stub = service.onConnect();
  return new InProcessClient(stub);
}

function repeatedPayload(times: number, text: string): string {
  let value = '';
  for (let index = 0; index < times; index++) {
    value = value + text;
  }
  return value;
}

export default function userScenarios(): void {
  describe('IntegrationUserScenarios', () => {
    beforeAll(() => {
      logSuite('IntegrationUserScenarios', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('IntegrationUserScenarios', 'end');
    });

    /**
     * @tc.name          userScenariosFirstTimeUserSendsMessage
     * @tc.desc          A first-time user connects, sends one message and leaves cleanly.
     * @tc.precondition  A fresh service model exists.
     * @tc.steps         1. Create and connect.
     *                   2. Send the production payload.
     *                   3. Disconnect and destroy.
     * @tc.expected      The reply is hello rpc and the final state is destroyed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('userScenariosFirstTimeUserSendsMessage', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      service.onDisconnect();
      service.onDestroy();
      expect(service.state).assertEqual('destroyed');
      expect(service.connectCount).assertEqual(1);
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          userScenariosSecondMessageSameConnection
     * @tc.desc          A user sends a second message on the same connection.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send the first message.
     *                   2. Send the second message.
     *                   3. Compare reply counts.
     * @tc.expected      Both messages receive the production reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('userScenariosSecondMessageSameConnection', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const first = client.send(REQUEST_CODE, 'first message');
      const second = client.send(REQUEST_CODE, 'second message');
      expect(first.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(2);
      expect(service.connectCount).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(2);
      expect(client.sentTexts[1]).assertEqual('second message');
    });

    /**
     * @tc.name          userScenariosUserSendsUnknownCommand
     * @tc.desc          An unknown command is rejected without ending the session.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send an unknown code.
     *                   2. Read the result and state.
     *                   3. Send a valid message.
     * @tc.expected      The session stays connected and the valid message succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('userScenariosUserSendsUnknownCommand', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const rejected = client.send(UNKNOWN_CODE_TWO, 'unknown command');
      expect(rejected.isSuccess()).assertFalse();
      expect(rejected.replyText).assertEqual('');
      expect(service.state).assertEqual('connected');
      const accepted = client.send(REQUEST_CODE, 'valid command');
      expect(accepted.isSuccess()).assertTrue();
      expect(accepted.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.replies.length).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosUserRetriesAfterRejection
     * @tc.desc          A user retries after a rejected command and succeeds.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send an unknown code.
     *                   2. Retry with code one.
     *                   3. Compare both result rows.
     * @tc.expected      The retry succeeds while the first row stays rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserRetriesAfterRejection', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const failed = client.send(UNKNOWN_CODE_LARGE, 'typo');
      const retried = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(failed.handled).assertFalse();
      expect(retried.handled).assertTrue();
      expect(client.results.length).assertEqual(2);
      expect(client.results[0].isSuccess()).assertFalse();
      expect(client.results[1].isSuccess()).assertTrue();
      expect(client.trace()).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosUserDisconnectsAndReconnects
     * @tc.desc          A user reconnects after a disconnect and gets a fresh stub.
     * @tc.precondition  A service is created and connected once.
     * @tc.steps         1. Send one message.
     *                   2. Disconnect and connect again.
     *                   3. Send another message.
     * @tc.expected      The second stub is fresh and the new message succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserDisconnectsAndReconnects', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const firstClient = openConversation(service);
      firstClient.send(REQUEST_CODE, 'before reconnect');
      service.onDisconnect();
      const secondClient = openConversation(service);
      const result = secondClient.send(REQUEST_CODE, 'after reconnect');
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
      expect(secondClient.stub.requestCount()).assertEqual(1);
      expect(firstClient.stub.requestCount()).assertEqual(1);
      expect(result.isSuccess()).assertTrue();
    });

    /**
     * @tc.name          userScenariosUserClosesAppWithoutDisconnect
     * @tc.desc          Closing the app destroys the service without a disconnect callback.
     * @tc.precondition  A connected client has sent two messages.
     * @tc.steps         1. Connect and send two messages.
     *                   2. Destroy the service without disconnecting.
     *                   3. Read the counters.
     * @tc.expected      Destroy count is one and disconnect count is zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserClosesAppWithoutDisconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      client.sendMany(2);
      service.onDestroy();
      expect(service.destroyCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(0);
      expect(service.state).assertEqual('destroyed');
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(client.stub.requestCount()).assertEqual(2);
      expect(client.replies.length).assertEqual(2);
    });

    /**
     * @tc.name          userScenariosTwoUsersShareService
     * @tc.desc          Two users connect to the same service and keep separate sessions.
     * @tc.precondition  A service is created.
     * @tc.steps         1. Each user connects.
     *                   2. Each sends three messages.
     *                   3. Compare their replies and the service counters.
     * @tc.expected      Both users hold three replies while the service reports two connects.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosTwoUsersShareService', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = openConversation(service);
      const second = openConversation(service);
      first.sendMany(3);
      second.sendMany(3);
      expect(first.replies.length).assertEqual(3);
      expect(second.replies.length).assertEqual(3);
      expect(first.stub.requestCount()).assertEqual(3);
      expect(second.stub.requestCount()).assertEqual(3);
      expect(service.connectCount).assertEqual(2);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          userScenariosUserSendsAfterServiceDestroy
     * @tc.desc          A user keeps using the stub after the service is destroyed.
     * @tc.precondition  A connected client has one reply.
     * @tc.steps         1. Send one message.
     *                   2. Destroy the service.
     *                   3. Send a second message through the stub.
     * @tc.expected      The second message is still handled by the surviving stub.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserSendsAfterServiceDestroy', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      client.send(REQUEST_CODE, 'while alive');
      service.onDestroy();
      const after = client.send(REQUEST_CODE, 'after destroy');
      expect(after.isSuccess()).assertTrue();
      expect(after.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requestCount()).assertEqual(2);
      expect(client.replies.length).assertEqual(2);
      expect(service.isAlive()).assertFalse();
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosUserOpensNewSessionAfterReset
     * @tc.desc          A reset service serves a brand-new user session.
     * @tc.precondition  A service session has been reset.
     * @tc.steps         1. Run a session and reset.
     *                   2. Connect as a new user.
     *                   3. Send one message.
     * @tc.expected      The new session starts with a fresh stub and counters at one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserOpensNewSessionAfterReset', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      openConversation(service).sendMany(4);
      service.reset();
      service.onCreate();
      const client = openConversation(service);
      const result = client.send(REQUEST_CODE, 'new session');
      expect(result.isSuccess()).assertTrue();
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
      expect(service.logs.contains('onConnect')).assertTrue();
    });

    /**
     * @tc.name          userScenariosUserBurstOfMessages
     * @tc.desc          A user sends a burst of twenty messages successfully.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send twenty messages rapidly.
     *                   2. Count replies and ledger rows.
     *                   3. Build metrics.
     * @tc.expected      All twenty messages are handled with twenty replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserBurstOfMessages', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const handled = client.sendMany(20);
      expect(handled).assertEqual(20);
      expect(client.replies.length).assertEqual(20);
      expect(client.stub.requestCount()).assertEqual(20);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(1);
      expect(client.sentTexts.length).assertEqual(20);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          userScenariosUserSendsLongMessage
     * @tc.desc          A long message is stored and still receives the fixed reply.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Build a two-thousand-character message.
     *                   2. Send it.
     *                   3. Compare the recorded and requested lengths.
     * @tc.expected      The stored message length is two thousand and the reply is unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserSendsLongMessage', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const longMessage = repeatedPayload(2000, 'm');
      const result = client.send(REQUEST_CODE, longMessage);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requests[0].text.length).assertEqual(2000);
      expect(client.sentTexts[0].length).assertEqual(2000);
      expect(client.stub.requestCount()).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          userScenariosUserSendsEmptyMessage
     * @tc.desc          An empty message is accepted and answered with the stock reply.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send an empty string.
     *                   2. Read the result and ledger row.
     *                   3. Send a normal message afterwards.
     * @tc.expected      The empty message is handled and does not break the session.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserSendsEmptyMessage', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const empty = client.send(REQUEST_CODE, '');
      expect(empty.isSuccess()).assertTrue();
      expect(empty.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requests[0].text).assertEqual('');
      expect(client.stub.requests[0].handled).assertTrue();
      const normal = client.send(REQUEST_CODE, 'normal');
      expect(normal.isSuccess()).assertTrue();
      expect(client.replies.length).assertEqual(2);
    });

    /**
     * @tc.name          userScenariosUserSendsSpecialCharacters
     * @tc.desc          A message with separators and unicode-like text is preserved.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send text containing pipes, hashes and commas.
     *                   2. Read the ledger row.
     *                   3. Compare with the original text.
     * @tc.expected      The stored message equals the sent text exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserSendsSpecialCharacters', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const special = 'hello|rpc#test,value';
      const result = client.send(REQUEST_CODE, special);
      expect(result.isSuccess()).assertTrue();
      expect(client.stub.requests[0].text).assertEqual(special);
      expect(client.stub.requests[0].text.length).assertEqual(20);
      expect(client.stub.requests[0].text.indexOf('|')).assertEqual(5);
      expect(client.stub.requests[0].text.indexOf('#')).assertEqual(9);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          userScenariosUserChecksReplyText
     * @tc.desc          The user-visible reply matches the production literal exactly.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send one message.
     *                   2. Compare the reply with hello rpc.
     *                   3. Read the reply from the stub row.
     * @tc.expected      Both reply views equal hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('userScenariosUserChecksReplyText', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const result = client.send(REQUEST_CODE, REQUEST_PAYLOAD);
      expect(result.replyText).assertEqual('hello rpc');
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requests[0].replyText).assertEqual('hello rpc');
      expect(client.replies[0]).assertEqual('hello rpc');
      expect(result.errCode).assertEqual(0);
      expect(result.handled).assertTrue();
    });

    /**
     * @tc.name          userScenariosUserRepeatsSameMessage
     * @tc.desc          Repeating one message five times creates five independent exchanges.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send the same text five times.
     *                   2. Count replies and rows.
     *                   3. Compare the reply literal count.
     * @tc.expected      Five rows and five replies are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserRepeatsSameMessage', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      for (let index = 0; index < 5; index++) {
        client.send(REQUEST_CODE, 'same request');
      }
      const texts: string[] = [];
      for (let index = 0; index < client.stub.requests.length; index++) {
        texts.push(client.stub.requests[index].text);
      }
      expect(texts.length).assertEqual(5);
      expect(countOf(texts, 'same request')).assertEqual(5);
      expect(countOf(client.replies, REPLY_PAYLOAD)).assertEqual(5);
      expect(client.stub.requestCount()).assertEqual(5);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosUserAlternatesValidAndInvalid
     * @tc.desc          A user alternating valid and invalid codes sees alternating outcomes.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send six alternating codes.
     *                   2. Read each result flag.
     *                   3. Count successes and failures.
     * @tc.expected      Three successes and three failures are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserAlternatesValidAndInvalid', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      let successes = 0;
      let failures = 0;
      for (let index = 0; index < 6; index++) {
        const code = index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_ZERO;
        if (client.send(code, 'turn-' + String(index)).isSuccess()) {
          successes = successes + 1;
        } else {
          failures = failures + 1;
        }
      }
      expect(successes).assertEqual(3);
      expect(failures).assertEqual(3);
      expect(client.results.length).assertEqual(6);
      expect(client.replies.length).assertEqual(3);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(3);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          userScenariosUserQuitsMidSession
     * @tc.desc          A user quitting after two messages leaves consistent counters.
     * @tc.precondition  A connected client has sent two messages.
     * @tc.steps         1. Send two messages.
     *                   2. Disconnect without destroying.
     *                   3. Read counters and state.
     * @tc.expected      The service is disconnected and still alive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserQuitsMidSession', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      client.sendMany(2);
      service.onDisconnect();
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(2);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          userScenariosReturningUserAfterReconnect
     * @tc.desc          A returning user reconnects and sees old history plus new traffic.
     * @tc.precondition  A first session has completed and the service reconnected.
     * @tc.steps         1. Keep a reference to the first client.
     *                   2. Reconnect and send three new messages.
     *                   3. Compare old and new histories.
     * @tc.expected      The old client keeps its history and the new client starts fresh.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosReturningUserAfterReconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const firstClient = openConversation(service);
      firstClient.sendMany(2);
      service.onDisconnect();
      const secondClient = openConversation(service);
      secondClient.sendMany(3);
      expect(firstClient.results.length).assertEqual(2);
      expect(secondClient.results.length).assertEqual(3);
      expect(firstClient.stub.requestCount()).assertEqual(2);
      expect(secondClient.stub.requestCount()).assertEqual(3);
      expect(service.connectCount).assertEqual(2);
      expect(secondClient.trace()).assertEqual(joined([REPLY_PAYLOAD, REPLY_PAYLOAD, REPLY_PAYLOAD], '|'));
    });

    /**
     * @tc.name          userScenariosUserSeesNewStubEachConnect
     * @tc.desc          Each connect hands the user a different stub object.
     * @tc.precondition  A service is created.
     * @tc.steps         1. Connect three times.
     *                   2. Compare the three stubs.
     *                   3. Send one message through each.
     * @tc.expected      All three stubs are distinct with one message each.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserSeesNewStubEachConnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = openConversation(service);
      const second = openConversation(service);
      const third = openConversation(service);
      expect(first.stub === second.stub).assertFalse();
      expect(second.stub === third.stub).assertFalse();
      first.send(REQUEST_CODE);
      second.send(REQUEST_CODE);
      third.send(REQUEST_CODE);
      expect(first.stub.requestCount()).assertEqual(1);
      expect(second.stub.requestCount()).assertEqual(1);
      expect(third.stub.requestCount()).assertEqual(1);
      expect(service.connectCount).assertEqual(3);
    });

    /**
     * @tc.name          userScenariosUserSessionWithManyMessages
     * @tc.desc          A forty-message conversation keeps every reply.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send forty messages.
     *                   2. Count replies and rows.
     *                   3. Compare the success ratio.
     * @tc.expected      Forty replies and forty ledger rows are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserSessionWithManyMessages', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const handled = client.sendMany(40);
      expect(handled).assertEqual(40);
      expect(client.replies.length).assertEqual(40);
      expect(client.stub.requestCount()).assertEqual(40);
      expect(StubMetrics.from(client.stub).handled).assertEqual(40);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(1);
      expect(client.sentTexts.length).assertEqual(40);
    });

    /**
     * @tc.name          userScenariosUserRequestsBeforeConnect
     * @tc.desc          A request callback before connect is recorded without a stub.
     * @tc.precondition  A created service has not connected.
     * @tc.steps         1. Call onRequest twice.
     *                   2. Read the stub reference.
     *                   3. Connect and send traffic.
     * @tc.expected      The request counter reads two and the stub appears only after connect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserRequestsBeforeConnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      expect(service.requestCount).assertEqual(2);
      expect(service.stub).assertUndefined();
      expect(service.state).assertEqual('created');
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(2);
      const client = openConversation(service);
      expect(client.stub.requestCount()).assertEqual(0);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          userScenariosUserDisconnectsTwice
     * @tc.desc          Two disconnect calls increment the disconnect counter twice.
     * @tc.precondition  A connected service exists.
     * @tc.steps         1. Connect and send one message.
     *                   2. Disconnect twice.
     *                   3. Read the counter and state.
     * @tc.expected      The disconnect counter reads two and the state is disconnected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosUserDisconnectsTwice', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      client.send(REQUEST_CODE);
      service.onDisconnect();
      service.onDisconnect();
      expect(service.disconnectCount).assertEqual(2);
      expect(service.state).assertEqual('disconnected');
      expect(service.events.countOf(EVENT_ON_DISCONNECT)).assertEqual(2);
      expect(service.isAlive()).assertTrue();
      expect(client.stub.requestCount()).assertEqual(1);
      expect(service.events.last()).assertEqual(EVENT_ON_DISCONNECT);
    });

    /**
     * @tc.name          userScenariosUserDestroysTwice
     * @tc.desc          Two destroy calls increment the destroy counter twice.
     * @tc.precondition  A connected service exists.
     * @tc.steps         1. Connect and destroy twice.
     *                   2. Read the destroy counter.
     *                   3. Inspect the state and events.
     * @tc.expected      The counter and destroy event count both read two.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('userScenariosUserDestroysTwice', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      openConversation(service);
      service.onDestroy();
      service.onDestroy();
      expect(service.destroyCount).assertEqual(2);
      expect(service.events.countOf(EVENT_ON_DESTROY)).assertEqual(2);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.logs.contains(EVENT_ON_DESTROY)).assertTrue();
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
    });

    /**
     * @tc.name          userScenariosUserSessionCounterReport
     * @tc.desc          The session counter report matches the user's actions.
     * @tc.precondition  A session with one connect, one request and one disconnect exists.
     * @tc.steps         1. Run the session actions.
     *                   2. Capture a snapshot.
     *                   3. Compare the description.
     * @tc.expected      The snapshot reads disconnected/1/1/1/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserSessionCounterReport', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      openConversation(service).sendMany(3);
      service.onDisconnect();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.describe()).assertEqual('disconnected/1/1/1/0');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.disconnects).assertEqual(1);
      expect(snapshot.requests).assertEqual(1);
      expect(snapshot.destroys).assertEqual(0);
      expect(snapshot.state).assertEqual('disconnected');
    });

    /**
     * @tc.name          userScenariosUserCountsReplies
     * @tc.desc          The user-visible reply counter matches the handled count.
     * @tc.precondition  A mixed conversation has run.
     * @tc.steps         1. Send seven messages with two invalid.
     *                   2. Count replies and handled rows.
     *                   3. Compare both totals.
     * @tc.expected      Five replies match five handled rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserCountsReplies', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE, REQUEST_CODE,
        UNKNOWN_CODE_TWO, REQUEST_CODE, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'count-' + String(index));
      }
      let handledRows = 0;
      for (let index = 0; index < client.stub.requests.length; index++) {
        if (client.stub.requests[index].handled) {
          handledRows = handledRows + 1;
        }
      }
      expect(client.replies.length).assertEqual(5);
      expect(handledRows).assertEqual(5);
      expect(StubMetrics.from(client.stub).replies).assertEqual(5);
      expect(client.stub.requestCount()).assertEqual(7);
      expect(StubMetrics.from(client.stub).rejected).assertEqual(2);
    });

    /**
     * @tc.name          userScenariosUserMixedPlanReport
     * @tc.desc          A ten-message mixed plan produces a two-thirds profile.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send ten messages with three invalid.
     *                   2. Build metrics.
     *                   3. Compare the ratio.
     * @tc.expected      Seven handled and three rejected with ratio 0.7.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserMixedPlanReport', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const codes: number[] = [UNKNOWN_CODE_ZERO, REQUEST_CODE, REQUEST_CODE, UNKNOWN_CODE_TWO,
        REQUEST_CODE, REQUEST_CODE, REQUEST_CODE, UNKNOWN_CODE_NEGATIVE, REQUEST_CODE, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'report-' + String(index));
      }
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(10);
      expect(metrics.handled).assertEqual(7);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.successRatio()).assertEqual(0.7);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('10:7:3:7'));
      expect(client.replies.length).assertEqual(7);
    });

    /**
     * @tc.name          userScenariosUserRequestIdsProgression
     * @tc.desc          The service records request start ids in increasing order.
     * @tc.precondition  A service is created.
     * @tc.steps         1. Call onRequest with ids one, two and three.
     *                   2. Read the event trace.
     *                   3. Compare with the literal.
     * @tc.expected      The trace lists the ids in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserRequestIdsProgression', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      service.onRequest(3);
      expect(service.events.trace()).assertEqual('onCreate>onRequest:1>onRequest:2>onRequest:3');
      expect(service.requestCount).assertEqual(3);
      expect(service.events.countOf(EVENT_ON_REQUEST)).assertEqual(3);
      expect(service.logs.contains('onRequest 3')).assertTrue();
      expect(service.logs.size()).assertEqual(4);
      expect(service.state).assertEqual('created');
    });

    /**
     * @tc.name          userScenariosUserGreetingRoundTrip
     * @tc.desc          The hello world greeting round trip matches production.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send hello world with code one.
     *                   2. Read hello rpc.
     *                   3. Compare the ledger row.
     * @tc.expected      The request and reply literals match production exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('userScenariosUserGreetingRoundTrip', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const result = client.send(1, 'hello world');
      expect(result.errCode).assertEqual(0);
      expect(result.handled).assertTrue();
      expect(result.replyText).assertEqual('hello rpc');
      expect(client.stub.requests[0].text).assertEqual('hello world');
      expect(client.stub.requests[0].code).assertEqual(1);
      expect(client.stub.requests[0].option).assertEqual('0/0/false');
    });

    /**
     * @tc.name          userScenariosUserLongConversation
     * @tc.desc          A hundred-message conversation stays fully successful.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send one hundred messages.
     *                   2. Build metrics.
     *                   3. Sample replies at both ends.
     * @tc.expected      All one hundred messages are handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserLongConversation', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const handled = client.sendMany(100);
      expect(handled).assertEqual(100);
      expect(client.replies[0]).assertEqual(REPLY_PAYLOAD);
      expect(client.replies[99]).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requestCount()).assertEqual(100);
      expect(StubMetrics.from(client.stub).fingerprint()).assertEqual(textFingerprint('100:100:0:100'));
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          userScenariosUserReconnectConversation
     * @tc.desc          A conversation resumes on a new connection with new messages.
     * @tc.precondition  A first conversation has ended with a disconnect.
     * @tc.steps         1. Send three messages and disconnect.
     *                   2. Reconnect and send two messages.
     *                   3. Compare session counters.
     * @tc.expected      The resumed conversation receives two new replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserReconnectConversation', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = openConversation(service);
      first.sendMany(3);
      service.onDisconnect();
      const second = openConversation(service);
      second.sendMany(2);
      expect(first.replies.length).assertEqual(3);
      expect(second.replies.length).assertEqual(2);
      expect(second.stub.requestCount()).assertEqual(2);
      expect(service.connectCount).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          userScenariosUserEndsConversationCleanly
     * @tc.desc          Ending a conversation disconnects and destroys in order.
     * @tc.precondition  A conversation with four messages is open.
     * @tc.steps         1. Send four messages.
     *                   2. Disconnect and destroy.
     *                   3. Read the final trace tail.
     * @tc.expected      The last events are disconnect then destroy.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('userScenariosUserEndsConversationCleanly', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      client.sendMany(4);
      service.onDisconnect();
      service.onDestroy();
      const entries: string[] = service.events.entries;
      expect(entries[entries.length - 2]).assertEqual(EVENT_ON_DISCONNECT);
      expect(entries[entries.length - 1]).assertEqual(EVENT_ON_DESTROY);
      expect(service.state).assertEqual('destroyed');
      expect(service.isAlive()).assertFalse();
      expect(service.connectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosUserAbandonsStub
     * @tc.desc          An abandoned stub keeps its history without affecting new sessions.
     * @tc.precondition  A first client stub has recorded traffic.
     * @tc.steps         1. Send two messages and disconnect.
     *                   2. Start a second session.
     *                   3. Confirm the abandoned stub is unchanged.
     * @tc.expected      The abandoned stub still holds two rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserAbandonsStub', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const abandoned = openConversation(service);
      abandoned.sendMany(2);
      service.onDisconnect();
      const active = openConversation(service);
      active.sendMany(5);
      expect(abandoned.stub.requestCount()).assertEqual(2);
      expect(active.stub.requestCount()).assertEqual(5);
      expect(abandoned.replies.length).assertEqual(2);
      expect(active.replies.length).assertEqual(5);
      expect(StubMetrics.from(abandoned.stub).requests).assertEqual(2);
      expect(StubMetrics.from(active.stub).requests).assertEqual(5);
    });

    /**
     * @tc.name          userScenariosUserSwitchesBetweenServices
     * @tc.desc          A user switching services keeps two independent stubs.
     * @tc.precondition  Two service models are created.
     * @tc.steps         1. Connect to each service.
     *                   2. Send three messages to each.
     *                   3. Compare both ledgers.
     * @tc.expected      Each service reports three rows independent of the other.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserSwitchesBetweenServices', 0, () => {
      const firstService = new ServiceLifecycleModel();
      const secondService = new ServiceLifecycleModel();
      firstService.onCreate();
      secondService.onCreate();
      const firstClient = openConversation(firstService);
      const secondClient = openConversation(secondService);
      firstClient.sendMany(3);
      secondClient.sendMany(3);
      expect(firstClient.stub.requestCount()).assertEqual(3);
      expect(secondClient.stub.requestCount()).assertEqual(3);
      expect(firstClient.stub === secondClient.stub).assertFalse();
      expect(firstService.connectCount).assertEqual(1);
      expect(secondService.connectCount).assertEqual(1);
      expect(firstClient.stub.descriptor).assertEqual(secondClient.stub.descriptor);
    });

    /**
     * @tc.name          userScenariosUserParallelConversations
     * @tc.desc          Two conversations interleave without losing messages.
     * @tc.precondition  Two clients share one service stub.
     * @tc.steps         1. Interleave four sends between the clients.
     *                   2. Count each client's replies.
     *                   3. Compare the shared ledger.
     * @tc.expected      Each client holds two replies and the ledger holds four rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserParallelConversations', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.send(REQUEST_CODE, 'first-a');
      second.send(REQUEST_CODE, 'second-a');
      first.send(REQUEST_CODE, 'first-b');
      second.send(REQUEST_CODE, 'second-b');
      expect(first.replies.length).assertEqual(2);
      expect(second.replies.length).assertEqual(2);
      expect(stub.requestCount()).assertEqual(4);
      expect(stub.requests[1].text).assertEqual('second-a');
      expect(stub.requests[3].text).assertEqual('second-b');
      expect(StubMetrics.from(stub).replies).assertEqual(4);
    });

    /**
     * @tc.name          userScenariosUserChecksDescriptor
     * @tc.desc          The user-visible stub descriptor matches the production name.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Read the stub descriptor.
     *                   2. Compare with IPCStubTest.
     *                   3. Check the connect event detail.
     * @tc.expected      All descriptor views read IPCStubTest.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('userScenariosUserChecksDescriptor', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      expect(client.stub.descriptor).assertEqual('IPCStubTest');
      expect(client.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.events.last()).assertEqual('onConnect:IPCStubTest');
      expect(client.stub.alive).assertTrue();
      expect(service.connectCount).assertEqual(1);
      expect(service.logs.contains('onConnect')).assertTrue();
    });

    /**
     * @tc.name          userScenariosUserRejectionDoesNotAffectNext
     * @tc.desc          A rejected message leaves the next message unaffected.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send an invalid message.
     *                   2. Send two valid messages.
     *                   3. Compare result order and replies.
     * @tc.expected      The rejected send has no reply and both valid sends succeed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserRejectionDoesNotAffectNext', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const rejected = client.send(UNKNOWN_CODE_NEGATIVE, 'bad');
      const first = client.send(REQUEST_CODE, 'good-1');
      const second = client.send(REQUEST_CODE, 'good-2');
      expect(rejected.isSuccess()).assertFalse();
      expect(first.isSuccess()).assertTrue();
      expect(second.isSuccess()).assertTrue();
      expect(client.results.length).assertEqual(3);
      expect(client.replies.length).assertEqual(2);
      expect(client.trace()).assertEqual(REPLY_PAYLOAD + '|' + REPLY_PAYLOAD);
      expect(client.stub.requests[2].text).assertEqual('good-2');
    });

    /**
     * @tc.name          userScenariosUserSessionSnapshot
     * @tc.desc          A mid-session snapshot records the connection state and request count.
     * @tc.precondition  A connected session has two requests and three messages.
     * @tc.steps         1. Create the service, handle two requests, connect and send three messages.
     *                   2. Capture a snapshot.
     *                   3. Compare the description.
     * @tc.expected      The snapshot reads connected/1/0/2/0.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserSessionSnapshot', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      service.onRequest(2);
      const client = openConversation(service);
      client.sendMany(3);
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.describe()).assertEqual('connected/1/0/2/0');
      expect(snapshot.state).assertEqual('connected');
      expect(snapshot.connects).assertEqual(1);
      expect(snapshot.requests).assertEqual(2);
      expect(client.stub.requestCount()).assertEqual(3);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          userScenariosUserRestartsService
     * @tc.desc          A user restarts the service and starts a new conversation.
     * @tc.precondition  A service has been destroyed.
     * @tc.steps         1. Destroy the service.
     *                   2. Reset and create it again.
     *                   3. Connect and send one message.
     * @tc.expected      The restarted service reports a fresh session.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserRestartsService', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      openConversation(service).sendMany(3);
      service.onDestroy();
      expect(service.isAlive()).assertFalse();
      service.reset();
      service.onCreate();
      const client = openConversation(service);
      const result = client.send(REQUEST_CODE, 'after restart');
      expect(result.isSuccess()).assertTrue();
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
      expect(service.destroyCount).assertEqual(0);
      expect(client.stub.requestCount()).assertEqual(1);
      expect(service.events.size()).assertEqual(2);
    });

    /**
     * @tc.name          userScenariosUserEmptyConversation
     * @tc.desc          A session with no messages still records the connection.
     * @tc.precondition  A service is created.
     * @tc.steps         1. Connect without sending.
     *                   2. Disconnect.
     *                   3. Read counters and stub state.
     * @tc.expected      The connection is counted with zero stub requests.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserEmptyConversation', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      expect(client.stub.requestCount()).assertEqual(0);
      expect(client.replies.length).assertEqual(0);
      service.onDisconnect();
      expect(service.connectCount).assertEqual(1);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.events.size()).assertEqual(3);
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          userScenariosUserSingleReplyConversation
     * @tc.desc          A complete one-message conversation closes with exact counters.
     * @tc.precondition  A fresh service model exists.
     * @tc.steps         1. Create, connect and send one message.
     *                   2. Disconnect and destroy.
     *                   3. Compare the final snapshot.
     * @tc.expected      The final snapshot reads destroyed/1/1/0/1.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('userScenariosUserSingleReplyConversation', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const result = client.send(REQUEST_CODE, 'one message');
      service.onDisconnect();
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(snapshot.describe()).assertEqual('destroyed/1/1/0/1');
      expect(client.stub.requestCount()).assertEqual(1);
      expect(client.replies.length).assertEqual(1);
      expect(service.events.size()).assertEqual(4);
      expect(service.logs.contains(EVENT_ON_DESTROY)).assertTrue();
    });

    /**
     * @tc.name          userScenariosUserTwoHundredMessageConversation
     * @tc.desc          A two-hundred-message conversation stays successful end to end.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send two hundred messages.
     *                   2. Build metrics.
     *                   3. Disconnect and confirm history.
     * @tc.expected      Two hundred messages are handled with ratio one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserTwoHundredMessageConversation', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const handled = client.sendMany(200);
      expect(handled).assertEqual(200);
      expect(client.stub.requestCount()).assertEqual(200);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(1);
      expect(StubMetrics.from(client.stub).replies).assertEqual(200);
      service.onDisconnect();
      expect(client.replies.length).assertEqual(200);
      expect(service.disconnectCount).assertEqual(1);
      expect(client.stub.alive).assertTrue();
    });

    /**
     * @tc.name          userScenariosUserFreshStubAfterReconnect
     * @tc.desc          A reconnecting user always receives a stub with an empty ledger.
     * @tc.precondition  A first session has recorded traffic.
     * @tc.steps         1. Send five messages and disconnect.
     *                   2. Reconnect.
     *                   3. Confirm the new stub is empty before use.
     * @tc.expected      The new stub holds zero rows and the old stub keeps five.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserFreshStubAfterReconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const firstClient = openConversation(service);
      firstClient.sendMany(5);
      service.onDisconnect();
      const secondClient = openConversation(service);
      expect(secondClient.stub.requestCount()).assertEqual(0);
      expect(secondClient.results.length).assertEqual(0);
      expect(firstClient.stub.requestCount()).assertEqual(5);
      expect(secondClient.stub === firstClient.stub).assertFalse();
      expect(secondClient.stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(service.connectCount).assertEqual(2);
    });

    /**
     * @tc.name          userScenariosUserSessionLogAudit
     * @tc.desc          The session log names every callback the user triggered.
     * @tc.precondition  A full user session has run.
     * @tc.steps         1. Create, request, connect, disconnect and destroy.
     *                   2. Search the log for each callback.
     *                   3. Read the log size.
     * @tc.expected      All five callback names appear in five log lines.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserSessionLogAudit', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      service.onRequest(1);
      openConversation(service);
      service.onDisconnect();
      service.onDestroy();
      expect(service.logs.size()).assertEqual(5);
      expect(service.logs.contains('onCreate')).assertTrue();
      expect(service.logs.contains('onRequest 1')).assertTrue();
      expect(service.logs.contains('onConnect')).assertTrue();
      expect(service.logs.contains('onDisconnect')).assertTrue();
      expect(service.logs.contains('onDestroy')).assertTrue();
      expect(service.logs.trace().split('|').length).assertEqual(5);
    });

    /**
     * @tc.name          userScenariosUserJourneyFingerprint
     * @tc.desc          A documented user journey has a stable event fingerprint.
     * @tc.precondition  The journey recipe is known.
     * @tc.steps         1. Run create, connect, send, disconnect and destroy.
     *                   2. Build the expected trace literal.
     *                   3. Compare fingerprints.
     * @tc.expected      The recorder fingerprint equals the literal hash.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserJourneyFingerprint', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      client.send(REQUEST_CODE, 'journey');
      service.onDisconnect();
      service.onDestroy();
      const expected = 'onCreate>onConnect:' + STUB_DESCRIPTOR + '>onDisconnect>onDestroy';
      expect(service.events.trace()).assertEqual(expected);
      expect(service.events.fingerprint()).assertEqual(textFingerprint(expected));
      expect(service.events.size()).assertEqual(4);
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(StubMetrics.from(client.stub).handled).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosUserJourneyAuditEndToEnd
     * @tc.desc          Every observable agrees at the end of a complete journey.
     * @tc.precondition  A journey with twelve messages has completed.
     * @tc.steps         1. Connect and send twelve messages.
     *                   2. Disconnect and destroy.
     *                   3. Cross-check counters, metrics and snapshot.
     * @tc.expected      All values reconcile without contradiction.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserJourneyAuditEndToEnd', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      client.sendMany(12);
      service.onDisconnect();
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      const metrics = StubMetrics.from(client.stub);
      expect(snapshot.describe()).assertEqual('destroyed/1/1/0/1');
      expect(metrics.requests).assertEqual(12);
      expect(metrics.handled).assertEqual(12);
      expect(client.replies.length).assertEqual(12);
      expect(service.events.size()).assertEqual(4);
      expect(service.destroyCount).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosUserSendsAfterDisconnect
     * @tc.desc          A user can still send through a stub after disconnecting.
     * @tc.precondition  A connected client has been disconnected.
     * @tc.steps         1. Send one message and disconnect.
     *                   2. Send another message through the old stub.
     *                   3. Compare the ledger.
     * @tc.expected      The stub handles the post-disconnect message.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserSendsAfterDisconnect', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      client.send(REQUEST_CODE, 'before-leave');
      service.onDisconnect();
      const after = client.send(REQUEST_CODE, 'after-leave');
      expect(after.isSuccess()).assertTrue();
      expect(after.replyText).assertEqual(REPLY_PAYLOAD);
      expect(client.stub.requestCount()).assertEqual(2);
      expect(client.stub.requests[1].text).assertEqual('after-leave');
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          userScenariosUserMixedPayloadTypes
     * @tc.desc          Short, long and empty messages coexist in one session.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Send a short, a long and an empty message.
     *                   2. Read each ledger row.
     *                   3. Compare the stored lengths.
     * @tc.expected      Stored lengths read one, five hundred and zero.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserMixedPayloadTypes', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      client.send(REQUEST_CODE, 'x');
      client.send(REQUEST_CODE, repeatedPayload(500, 'z'));
      client.send(REQUEST_CODE, '');
      expect(client.stub.requestCount()).assertEqual(3);
      expect(client.stub.requests[0].text.length).assertEqual(1);
      expect(client.stub.requests[1].text.length).assertEqual(500);
      expect(client.stub.requests[2].text.length).assertEqual(0);
      expect(client.replies.length).assertEqual(3);
      expect(StubMetrics.from(client.stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          userScenariosUserRepeatedCycles
     * @tc.desc          Five connect-send-disconnect cycles keep counters aligned.
     * @tc.precondition  A service model is created once.
     * @tc.steps         1. Run five identical cycles.
     *                   2. Count connects and disconnects.
     *                   3. Confirm each stub handled one message.
     * @tc.expected      Both counters read five with five single-message stubs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserRepeatedCycles', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      let singleMessageStubs = 0;
      for (let cycle = 0; cycle < 5; cycle++) {
        const client = openConversation(service);
        client.send(REQUEST_CODE, 'cycle-' + String(cycle));
        if (client.stub.requestCount() === 1) {
          singleMessageStubs = singleMessageStubs + 1;
        }
        service.onDisconnect();
      }
      expect(singleMessageStubs).assertEqual(5);
      expect(service.connectCount).assertEqual(5);
      expect(service.disconnectCount).assertEqual(5);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(5);
      expect(service.state).assertEqual('disconnected');
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          userScenariosUserFinalReport
     * @tc.desc          A user's final report matches the metrics collected during the session.
     * @tc.precondition  A session with a mixed workload has run.
     * @tc.steps         1. Send nine messages with three invalid.
     *                   2. Build the final metrics.
     *                   3. Compare the report values.
     * @tc.expected      Six handled, three rejected, six replies and ratio two thirds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserFinalReport', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE, REQUEST_CODE,
        UNKNOWN_CODE_TWO, REQUEST_CODE, UNKNOWN_CODE_NEGATIVE, REQUEST_CODE, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'final-' + String(index));
      }
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(9);
      expect(metrics.handled).assertEqual(6);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.replies).assertEqual(6);
      expect(metrics.successRatio()).assertEqual(2 / 3);
      expect(client.replies.length).assertEqual(6);
    });

    /**
     * @tc.name          userScenariosUserClosesThenResets
     * @tc.desc          Closing a conversation and resetting leaves no user-visible state.
     * @tc.precondition  A complete conversation has ended in destroy.
     * @tc.steps         1. Run the conversation.
     *                   2. Destroy and reset.
     *                   3. Audit logs, events and references.
     * @tc.expected      The service is idle with empty logs and events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosUserClosesThenResets', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      client.sendMany(6);
      service.onDisconnect();
      service.onDestroy();
      service.reset();
      expect(service.state).assertEqual('idle');
      expect(service.logs.size()).assertEqual(0);
      expect(service.events.size()).assertEqual(0);
      expect(service.stub).assertUndefined();
      expect(service.connectCount).assertEqual(0);
      expect(client.replies.length).assertEqual(6);
    });

    /**
     * @tc.name          userScenariosConversationWithRejectList
     * @tc.desc          A service-side reject list blocks a user command temporarily.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Add code one to the reject list and send.
     *                   2. Remove the restriction and retry.
     *                   3. Compare both outcomes.
     * @tc.expected      The first send fails and the retry succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosConversationWithRejectList', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      client.stub.rejectCodes = [REQUEST_CODE];
      const blocked = client.send(REQUEST_CODE, 'blocked');
      expect(blocked.isSuccess()).assertFalse();
      expect(client.replies.length).assertEqual(0);
      client.stub.rejectCodes = [];
      const allowed = client.send(REQUEST_CODE, 'allowed');
      expect(allowed.isSuccess()).assertTrue();
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(2);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          userScenariosConversationAfterKillRevive
     * @tc.desc          A user conversation resumes after the stub is revived.
     * @tc.precondition  A connected client exists.
     * @tc.steps         1. Kill the stub and send.
     *                   2. Revive and send again.
     *                   3. Compare the outcomes.
     * @tc.expected      The dark send fails and the revived send succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosConversationAfterKillRevive', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      client.stub.kill();
      const dark = client.send(REQUEST_CODE, 'dark');
      client.stub.revive();
      const lit = client.send(REQUEST_CODE, 'lit');
      expect(dark.isSuccess()).assertFalse();
      expect(lit.isSuccess()).assertTrue();
      expect(client.stub.alive).assertTrue();
      expect(client.replies.length).assertEqual(1);
      expect(client.stub.requestCount()).assertEqual(2);
      expect(service.state).assertEqual('connected');
    });

    /**
     * @tc.name          userScenariosIsolationBetweenConversations
     * @tc.desc          Two conversations on one service keep independent client views.
     * @tc.precondition  Two clients are connected to the same service.
     * @tc.steps         1. Send two messages from the first client.
     *                   2. Send four from the second.
     *                   3. Compare both views and the shared ledger.
     * @tc.expected      Views read two and four with six shared rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosIsolationBetweenConversations', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const first = openConversation(service);
      const second = openConversation(service);
      first.sendMany(2);
      second.sendMany(4);
      expect(first.replies.length).assertEqual(2);
      expect(second.replies.length).assertEqual(4);
      expect(first.stub.requestCount()).assertEqual(2);
      expect(second.stub.requestCount()).assertEqual(4);
      expect(service.connectCount).assertEqual(2);
      expect(first.stub === second.stub).assertFalse();
    });

    /**
     * @tc.name          userScenariosFinalSnapshotAndLog
     * @tc.desc          The final snapshot and log agree on the completed session.
     * @tc.precondition  A session with two connects and one destroy has ended.
     * @tc.steps         1. Run two sessions then destroy.
     *                   2. Capture the snapshot.
     *                   3. Compare the log tail.
     * @tc.expected      The snapshot reads destroyed/2/1/0/1 with destroy last in the log.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosFinalSnapshotAndLog', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      openConversation(service);
      service.onDisconnect();
      openConversation(service);
      service.onRequest(1);
      service.onDestroy();
      const snapshot = new ServiceSnapshot(service);
      expect(snapshot.describe()).assertEqual('destroyed/2/1/1/1');
      expect(service.logs.contains('onDestroy')).assertTrue();
      expect(service.logs.lines[service.logs.size() - 1]).assertEqual('INFO onDestroy');
      expect(service.events.last()).assertEqual(EVENT_ON_DESTROY);
      expect(service.events.countOf(EVENT_ON_CONNECT)).assertEqual(2);
      expect(service.isAlive()).assertFalse();
    });

    /**
     * @tc.name          userScenariosConversationEndsWithMetricsAudit
     * @tc.desc          A closing audit reconciles the user view with service counters.
     * @tc.precondition  A session with a mixed plan has run and closed.
     * @tc.steps         1. Send eight messages with two invalid.
     *                   2. Disconnect and destroy.
     *                   3. Compare metrics, replies and snapshot.
     * @tc.expected      Six handled, two rejected and a destroyed snapshot.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('userScenariosConversationEndsWithMetricsAudit', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const client = openConversation(service);
      const codes: number[] = [REQUEST_CODE, UNKNOWN_CODE_ZERO, REQUEST_CODE, REQUEST_CODE,
        UNKNOWN_CODE_TWO, REQUEST_CODE, REQUEST_CODE, REQUEST_CODE];
      for (let index = 0; index < codes.length; index++) {
        client.send(codes[index], 'closing-' + String(index));
      }
      service.onDisconnect();
      service.onDestroy();
      const metrics = StubMetrics.from(client.stub);
      expect(metrics.requests).assertEqual(8);
      expect(metrics.handled).assertEqual(6);
      expect(metrics.rejected).assertEqual(2);
      expect(client.replies.length).assertEqual(6);
      expect(service.state).assertEqual('destroyed');
      expect(service.destroyCount).assertEqual(1);
    });
  });
}
