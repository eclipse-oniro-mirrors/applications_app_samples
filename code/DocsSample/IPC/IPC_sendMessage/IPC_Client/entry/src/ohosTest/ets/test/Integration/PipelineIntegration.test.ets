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
import {
  ConnectionModel,
  RemoteProxyModel,
  RemoteStubModel,
  RequestResultModel,
  MessageSequenceModel,
  MessageOptionModel,
  ClientMetrics,
  ClientSnapshot,
  ERROR_NONE,
  ERROR_SEND,
  ERROR_PROXY_INVALID,
  REQUEST_CODE,
  REQUEST_PAYLOAD,
  REPLY_PAYLOAD,
  STATE_CONNECTED,
  STATE_DISCONNECTED,
  CONNECT_SUCCESS_TOAST,
  SEND_SUCCESS_TOAST,
  SEND_FAIL_TOAST,
  OPTION_FLAG_SYNC,
  OPTION_FLAG_ASYNC,
  textFingerprint,
  expectedReplyFor,
  expectedHandled,
  countOf
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

/** Captures the artefacts of one direct pipeline run. */
class PipelineOutcome {
  public code: number;
  public payload: string;
  public result: RequestResultModel;
  public data: MessageSequenceModel;
  public reply: MessageSequenceModel;

  constructor(code: number, payload: string, result: RequestResultModel, data: MessageSequenceModel,
    reply: MessageSequenceModel) {
    this.code = code;
    this.payload = payload;
    this.result = result;
    this.data = data;
    this.reply = reply;
  }

  public stageTrace(): string {
    return String(this.code) + '>' + String(this.result.errCode) + '>' + this.result.replyText + '>' +
      String(this.data.size()) + '>' + String(this.reply.size());
  }

  public isHandled(): boolean {
    return this.result.isSuccess();
  }
}

function newClient(): ConnectionModel {
  return new ConnectionModel();
}

function openConnection(client: ConnectionModel, id: number, reply: string = REPLY_PAYLOAD): RemoteProxyModel {
  client.connect(id);
  const stub: RemoteStubModel = new RemoteStubModel();
  stub.replyText = reply;
  const proxy: RemoteProxyModel = new RemoteProxyModel(stub);
  client.onConnect(proxy);
  return proxy;
}

function sendBurst(client: ConnectionModel, times: number, payload: string = REQUEST_PAYLOAD): RequestResultModel[] {
  const results: RequestResultModel[] = [];
  for (let index = 0; index < times; index++) {
    results.push(client.sendString(payload));
  }
  return results;
}

function successCount(results: RequestResultModel[]): number {
  let total = 0;
  for (let index = 0; index < results.length; index++) {
    if (results[index].isSuccess()) {
      total = total + 1;
    }
  }
  return total;
}

function codeCount(results: RequestResultModel[], code: number): number {
  let total = 0;
  for (let index = 0; index < results.length; index++) {
    if (results[index].errCode === code) {
      total = total + 1;
    }
  }
  return total;
}

function toastCount(client: ConnectionModel, text: string): number {
  return countOf(client.toasts, text);
}

/** Runs one direct pipeline: build data, write, dispatch and return all artefacts. */
function runDirect(proxy: RemoteProxyModel, code: number, payload: string): PipelineOutcome {
  const data: MessageSequenceModel = MessageSequenceModel.create();
  const reply: MessageSequenceModel = MessageSequenceModel.create();
  const option: MessageOptionModel = new MessageOptionModel();
  data.writeString(payload);
  const result: RequestResultModel = proxy.sendMessageRequest(code, data, reply, option);
  return new PipelineOutcome(code, payload, result, data, reply);
}

export default function pipelineIntegration(): void {
  describe('PipelineIntegration', () => {
    beforeAll(() => {
      logSuite('PipelineIntegration', 'begin');
    });

    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });

    afterAll(() => {
      logSuite('PipelineIntegration', 'end');
    });

    /**
     * @tc.name          pipelineIntegrationStageOrderHappyPath
     * @tc.desc          The direct pipeline passes through build, write, dispatch, handle and reply stages.
     * @tc.precondition  A connected proxy with a live stub.
     * @tc.steps         1. Run the pipeline with the known code.
     *                   2. Read the stage trace.
     *                   3. Compare each segment.
     * @tc.expected      The trace records success, the reply payload and the sequence sizes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('pipelineIntegrationStageOrderHappyPath', 0, () => {
      logStep('pipelineIntegrationStageOrderHappyPath', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4001);
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'stage-payload');
      const trace: string = outcome.stageTrace();
      const stages: string[] = trace.split('>');
      expect(stages.length).assertEqual(5);
      expect(stages[0]).assertEqual('1');
      expect(stages[1]).assertEqual('0');
      expect(stages[2]).assertEqual(REPLY_PAYLOAD);
      expect(stages[3]).assertEqual('1');
      expect(stages[4]).assertEqual('1');
      expect(outcome.isHandled()).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationResultSuccess
     * @tc.desc          A known request code produces a successful result with the stub reply.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run the pipeline.
     *                   2. Inspect the result.
     *                   3. Compare with the reply oracle.
     * @tc.expected      The result code is zero and the reply matches the oracle.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('pipelineIntegrationResultSuccess', 0, () => {
      logStep('pipelineIntegrationResultSuccess', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4002);
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, REQUEST_PAYLOAD);
      expect(outcome.result.errCode).assertEqual(ERROR_NONE);
      expect(outcome.result.isSuccess()).assertTrue();
      expect(outcome.result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(outcome.result.replyText).assertEqual(expectedReplyFor(REQUEST_CODE));
      expect(outcome.result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(outcome.result.reply.cursor).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          pipelineIntegrationReplyReadOnce
     * @tc.desc          The reply sequence can be read once before it is exhausted.
     * @tc.precondition  A pipeline outcome with one reply value.
     * @tc.steps         1. Read the result reply.
     *                   2. Read it a second time.
     *                   3. Inspect the reply counters.
     * @tc.expected      The first read returns the payload and the second returns empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationReplyReadOnce', 0, () => {
      logStep('pipelineIntegrationReplyReadOnce', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4003);
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'read-once');
      const first: string = outcome.result.readReply();
      const second: string = outcome.result.readReply();
      expect(first).assertEqual(REPLY_PAYLOAD);
      expect(second).assertEqual('');
      expect(outcome.result.reply.readCount).assertEqual(1);
      expect(outcome.result.reply.cursor).assertEqual(1);
      expect(outcome.result.reply.size()).assertEqual(1);
      expect(outcome.result.reply.isReclaimed()).assertFalse();
      expect(outcome.result.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          pipelineIntegrationDataReclaim
     * @tc.desc          The request data sequence can be reclaimed after dispatch.
     * @tc.precondition  A completed pipeline outcome.
     * @tc.steps         1. Reclaim the data sequence.
     *                   2. Attempt a read.
     *                   3. Confirm the stub record is unchanged.
     * @tc.expected      The data sequence is reclaimed and its read returns empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationDataReclaim', 0, () => {
      logStep('pipelineIntegrationDataReclaim', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4004);
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'reclaim-data');
      expect(outcome.data.size()).assertEqual(1);
      outcome.data.reclaim();
      expect(outcome.data.isReclaimed()).assertTrue();
      expect(outcome.data.readString()).assertEqual('');
      expect(outcome.data.size()).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('reclaim-data');
      expect(outcome.result.isSuccess()).assertTrue();
      expect(outcome.result.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          pipelineIntegrationReplyReclaim
     * @tc.desc          Reclaiming the result reply preserves the stored payload text.
     * @tc.precondition  A completed pipeline outcome.
     * @tc.steps         1. Reclaim the result reply.
     *                   2. Attempt to read it.
     *                   3. Compare the stored text.
     * @tc.expected      The reply refuses reads while the result text survives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationReplyReclaim', 0, () => {
      logStep('pipelineIntegrationReplyReclaim', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4005);
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'reclaim-reply');
      outcome.result.reply.reclaim();
      expect(outcome.result.reply.isReclaimed()).assertTrue();
      expect(outcome.result.readReply()).assertEqual('');
      expect(outcome.result.reply.size()).assertEqual(1);
      expect(outcome.result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(outcome.result.isSuccess()).assertTrue();
      expect(outcome.data.isReclaimed()).assertFalse();
      expect(outcome.reply.isReclaimed()).assertFalse();
    });

    /**
     * @tc.name          pipelineIntegrationDataCursorAfterHandle
     * @tc.desc          The stub consumes the request data so its cursor advances once.
     * @tc.precondition  A completed pipeline outcome.
     * @tc.steps         1. Inspect the data cursor and read count.
     *                   2. Read from the data sequence.
     *                   3. Confirm the payload reached the stub.
     * @tc.expected      The cursor and read count are one while the stub holds the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationDataCursorAfterHandle', 0, () => {
      logStep('pipelineIntegrationDataCursorAfterHandle', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4006);
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'cursor-payload');
      expect(outcome.data.cursor).assertEqual(1);
      expect(outcome.data.readCount).assertEqual(1);
      expect(outcome.data.readString()).assertEqual('');
      expect(outcome.data.writeCount).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('cursor-payload');
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(outcome.result.isSuccess()).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationStubReceivesPayload
     * @tc.desc          Distinct payloads reach the stub in pipeline order.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run three pipelines with distinct payloads.
     *                   2. Compare the stub receipt list.
     *                   3. Confirm the request count.
     * @tc.expected      The stub holds the three payloads in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationStubReceivesPayload', 0, () => {
      logStep('pipelineIntegrationStubReceivesPayload', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4007);
      runDirect(proxy, REQUEST_CODE, 'pipe-a');
      runDirect(proxy, REQUEST_CODE, 'pipe-b');
      runDirect(proxy, REQUEST_CODE, 'pipe-c');
      expect(proxy.stub.receivedTexts.length).assertEqual(3);
      expect(proxy.stub.receivedTexts[0]).assertEqual('pipe-a');
      expect(proxy.stub.receivedTexts[2]).assertEqual('pipe-c');
      expect(proxy.stub.receivedTexts.join('|')).assertEqual('pipe-a|pipe-b|pipe-c');
      expect(proxy.stub.requestCount()).assertEqual(3);
      expect(proxy.sendCalls).assertEqual(3);
      expect(proxy.requests.length).assertEqual(3);
    });

    /**
     * @tc.name          pipelineIntegrationKnownCodeHandled
     * @tc.desc          The known request code is reported as handled by the oracle.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run the pipeline with code one.
     *                   2. Compare with the handled oracle.
     *                   3. Confirm the result.
     * @tc.expected      The oracle and the result both report handling.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationKnownCodeHandled', 0, () => {
      logStep('pipelineIntegrationKnownCodeHandled', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4008);
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'known-code');
      expect(expectedHandled(REQUEST_CODE)).assertTrue();
      expect(outcome.isHandled()).assertTrue();
      expect(outcome.result.errCode).assertEqual(ERROR_NONE);
      expect(proxy.stub.handledCodes.length).assertEqual(1);
      expect(proxy.stub.handledCodes[0]).assertEqual(REQUEST_CODE);
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(outcome.stageTrace().startsWith('1>0>')).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationCodeZeroRejected
     * @tc.desc          Code zero is recorded but rejected by the stub.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run the pipeline with code zero.
     *                   2. Inspect the handled list and data cursor.
     *                   3. Compare with the oracle.
     * @tc.expected      The result fails and the data is never read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationCodeZeroRejected', 0, () => {
      logStep('pipelineIntegrationCodeZeroRejected', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4009);
      const outcome: PipelineOutcome = runDirect(proxy, 0, 'code-zero');
      expect(expectedHandled(0)).assertFalse();
      expect(outcome.isHandled()).assertFalse();
      expect(outcome.result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.stub.handledCodes[0]).assertEqual(0);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(outcome.data.readCount).assertEqual(0);
      expect(outcome.data.cursor).assertEqual(0);
      expect(outcome.result.replyText).assertEqual('');
    });

    /**
     * @tc.name          pipelineIntegrationCodeTwoRejected
     * @tc.desc          Code two is rejected while leaving the payload unconsumed.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run the pipeline with code two.
     *                   2. Inspect handled codes.
     *                   3. Attempt a data read.
     * @tc.expected      The result fails and the first data value is still readable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationCodeTwoRejected', 0, () => {
      logStep('pipelineIntegrationCodeTwoRejected', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4010);
      const outcome: PipelineOutcome = runDirect(proxy, 2, 'code-two');
      expect(outcome.result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.stub.handledCodes[0]).assertEqual(2);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(outcome.data.readCount).assertEqual(0);
      expect(outcome.data.readString()).assertEqual('code-two');
      expect(outcome.data.readString()).assertEqual('');
      expect(outcome.result.replyText).assertEqual('');
    });

    /**
     * @tc.name          pipelineIntegrationNegativeCodeRejected
     * @tc.desc          A negative code is recorded and rejected without touching the payload.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run the pipeline with code minus one.
     *                   2. Compare with the oracle.
     *                   3. Confirm the failure code.
     * @tc.expected      The negative code is rejected and the send error is reported.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationNegativeCodeRejected', 0, () => {
      logStep('pipelineIntegrationNegativeCodeRejected', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4011);
      const outcome: PipelineOutcome = runDirect(proxy, -1, 'negative-code');
      expect(expectedHandled(-1)).assertFalse();
      expect(outcome.result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.stub.handledCodes.length).assertEqual(1);
      expect(proxy.stub.handledCodes[0]).assertEqual(-1);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(outcome.data.readString()).assertEqual('negative-code');
      expect(outcome.result.isSuccess()).assertFalse();
    });

    /**
     * @tc.name          pipelineIntegrationLargeCodeRejected
     * @tc.desc          A large foreign code is rejected and recorded for diagnosis.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run the pipeline with code ninety-nine.
     *                   2. Inspect the handled list.
     *                   3. Confirm the data stayed intact.
     * @tc.expected      The result fails and the payload remains readable.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationLargeCodeRejected', 0, () => {
      logStep('pipelineIntegrationLargeCodeRejected', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4012);
      const outcome: PipelineOutcome = runDirect(proxy, 99, 'large-code');
      expect(outcome.result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.stub.handledCodes.length).assertEqual(1);
      expect(proxy.stub.handledCodes[0]).assertEqual(99);
      expect(proxy.sendCalls).assertEqual(1);
      expect(outcome.data.readString()).assertEqual('large-code');
      expect(outcome.result.reply.size()).assertEqual(0);
      expect(outcome.result.replyText).assertEqual('');
      expect(outcome.stageTrace()).assertEqual('99>16000003>>1>0');
    });

    /**
     * @tc.name          pipelineIntegrationMultipleRequestsOrder
     * @tc.desc          Five pipeline runs preserve request ordering end to end.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run five pipelines with numbered payloads.
     *                   2. Compare the stub order and handled codes.
     *                   3. Confirm every result is successful.
     * @tc.expected      The stub receives payload zero through four in order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationMultipleRequestsOrder', 0, () => {
      logStep('pipelineIntegrationMultipleRequestsOrder', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4013);
      let successes: number = 0;
      for (let index = 0; index < 5; index++) {
        const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'order-' + String(index));
        if (outcome.isHandled()) {
          successes = successes + 1;
        }
      }
      expect(successes).assertEqual(5);
      expect(proxy.stub.receivedTexts.length).assertEqual(5);
      expect(proxy.stub.receivedTexts[0]).assertEqual('order-0');
      expect(proxy.stub.receivedTexts[4]).assertEqual('order-4');
      expect(proxy.stub.handledCodes.length).assertEqual(5);
      expect(proxy.requests.length).assertEqual(5);
      expect(proxy.stub.receivedTexts.join(',')).assertEqual('order-0,order-1,order-2,order-3,order-4');
    });

    /**
     * @tc.name          pipelineIntegrationKilledStubPipeline
     * @tc.desc          A killed stub fails the pipeline before any handling stage.
     * @tc.precondition  A connected proxy whose stub was killed.
     * @tc.steps         1. Kill the stub.
     *                   2. Run the pipeline.
     *                   3. Inspect handled codes and data state.
     * @tc.expected      The result fails and no handle stage is recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationKilledStubPipeline', 0, () => {
      logStep('pipelineIntegrationKilledStubPipeline', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4014);
      proxy.kill();
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'killed-stub');
      expect(outcome.result.errCode).assertEqual(ERROR_SEND);
      expect(outcome.result.isSuccess()).assertFalse();
      expect(proxy.stub.handledCodes.length).assertEqual(0);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(1);
      expect(outcome.data.readCount).assertEqual(0);
      expect(outcome.data.size()).assertEqual(1);
      expect(outcome.result.reply.size()).assertEqual(0);
    });

    /**
     * @tc.name          pipelineIntegrationArmedFailurePipeline
     * @tc.desc          An armed failure short-circuits one pipeline run but not the next.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Arm the failure code and run the pipeline.
     *                   2. Run a second pipeline without arming.
     *                   3. Compare both outcomes.
     * @tc.expected      The first run fails with the injected code and the second succeeds.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationArmedFailurePipeline', 0, () => {
      logStep('pipelineIntegrationArmedFailurePipeline', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4015);
      proxy.failNextSend = ERROR_PROXY_INVALID;
      const failed: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'armed');
      const healthy: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'healthy');
      expect(failed.result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(failed.data.readCount).assertEqual(0);
      expect(healthy.result.errCode).assertEqual(ERROR_NONE);
      expect(healthy.isHandled()).assertTrue();
      expect(proxy.failNextSend).assertEqual(ERROR_NONE);
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('healthy');
      expect(proxy.sendCalls).assertEqual(2);
    });

    /**
     * @tc.name          pipelineIntegrationSequencePairsIndependent
     * @tc.desc          Two pipeline outcomes own separate data and reply sequences.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run two pipelines.
     *                   2. Reclaim the first pair.
     *                   3. Inspect the second pair.
     * @tc.expected      Reclaiming the first pair does not disturb the second.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationSequencePairsIndependent', 0, () => {
      logStep('pipelineIntegrationSequencePairsIndependent', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4016);
      const first: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'pair-one');
      const second: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'pair-two');
      first.data.reclaim();
      first.result.reply.reclaim();
      expect(first.data.isReclaimed()).assertTrue();
      expect(first.result.reply.isReclaimed()).assertTrue();
      expect(second.data.isReclaimed()).assertFalse();
      expect(second.result.reply.isReclaimed()).assertFalse();
      expect(second.data.readCount).assertEqual(1);
      expect(second.result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(first.data === second.data).assertFalse();
      expect(first.result === second.result).assertFalse();
    });

    /**
     * @tc.name          pipelineIntegrationReplyArgumentUnused
     * @tc.desc          The caller-supplied reply sequence stays empty because the stub builds its own.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run the pipeline with an explicit reply sequence.
     *                   2. Inspect that sequence.
     *                   3. Read the result reply.
     * @tc.expected      The supplied reply stays empty and the result reply holds the payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationReplyArgumentUnused', 0, () => {
      logStep('pipelineIntegrationReplyArgumentUnused', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4017);
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'reply-argument');
      expect(outcome.reply.size()).assertEqual(1);
      expect(outcome.reply.isEmpty()).assertFalse();
      expect(outcome.reply.isReclaimed()).assertFalse();
      expect(outcome.reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(outcome.result.reply.size()).assertEqual(1);
      expect(outcome.result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(outcome.result.replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          pipelineIntegrationSyncOptionRun
     * @tc.desc          A synchronous option dispatches the pipeline successfully.
     * @tc.precondition  A connected proxy and a sync option.
     * @tc.steps         1. Build data and a sync option.
     *                   2. Dispatch directly.
     *                   3. Inspect the option and result.
     * @tc.expected      The option reports sync and the pipeline returns the reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationSyncOptionRun', 0, () => {
      logStep('pipelineIntegrationSyncOptionRun', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4018);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const option: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_SYNC, 0, false);
      data.writeString('sync-payload');
      const result: RequestResultModel = proxy.sendMessageRequest(REQUEST_CODE, data, reply, option);
      expect(option.isSync()).assertTrue();
      expect(option.isAsync()).assertFalse();
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(proxy.stub.receivedTexts[0]).assertEqual('sync-payload');
      expect(data.readCount).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationAsyncOptionRun
     * @tc.desc          An asynchronous option with a wait time still completes the pipeline.
     * @tc.precondition  A connected proxy and an async option.
     * @tc.steps         1. Build data and an async option with wait time.
     *                   2. Dispatch directly.
     *                   3. Inspect the option and reply.
     * @tc.expected      The option reports async and the pipeline returns the reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationAsyncOptionRun', 0, () => {
      logStep('pipelineIntegrationAsyncOptionRun', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4019);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      const option: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 500, false);
      data.writeString('async-payload');
      const result: RequestResultModel = proxy.sendMessageRequest(REQUEST_CODE, data, reply, option);
      expect(option.isAsync()).assertTrue();
      expect(option.isSync()).assertFalse();
      expect(option.waitTime).assertEqual(500);
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(proxy.stub.receivedTexts[0]).assertEqual('async-payload');
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationOptionCloneInPipeline
     * @tc.desc          A cloned option keeps its wait time when used for a later pipeline run.
     * @tc.precondition  A connected proxy and a base async option.
     * @tc.steps         1. Clone the option and adjust its wait time.
     *                   2. Dispatch with the clone.
     *                   3. Confirm the original is unchanged.
     * @tc.expected      The clone carries the new wait time and the original keeps its own.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationOptionCloneInPipeline', 0, () => {
      logStep('pipelineIntegrationOptionCloneInPipeline', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4020);
      const base: MessageOptionModel = new MessageOptionModel(OPTION_FLAG_ASYNC, 100, false);
      const clone: MessageOptionModel = base.clone();
      clone.waitTime = 750;
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('clone-option');
      const result: RequestResultModel = proxy.sendMessageRequest(REQUEST_CODE, data, reply, clone);
      expect(base.waitTime).assertEqual(100);
      expect(clone.waitTime).assertEqual(750);
      expect(base.isAsync()).assertTrue();
      expect(clone.isAsync()).assertTrue();
      expect(result.isSuccess()).assertTrue();
      expect(proxy.stub.receivedTexts[0]).assertEqual('clone-option');
      expect(base.describe()).assertEqual('1/100/false');
      expect(clone.describe()).assertEqual('1/750/false');
    });

    /**
     * @tc.name          pipelineIntegrationMetricsAccumulate
     * @tc.desc          Metrics accumulate across mixed direct pipeline runs.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Run three successful and two failing pipelines.
     *                   2. Build metrics.
     *                   3. Compare the counts.
     * @tc.expected      Five sends split into three replies and two failures.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationMetricsAccumulate', 0, () => {
      logStep('pipelineIntegrationMetricsAccumulate', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4021);
      sendBurst(client, 3);
      proxy.failNextSend = ERROR_SEND;
      client.sendString('metric-fail-a');
      proxy.failNextSend = ERROR_SEND;
      client.sendString('metric-fail-b');
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.sends).assertEqual(5);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.failures).assertEqual(2);
      expect(metrics.replies + metrics.failures).assertEqual(metrics.sends);
      expect(metrics.successRatio()).assertEqual(0.6);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(2);
      expect(proxy.stub.receivedTexts.length).assertEqual(3);
      expect(proxy.sendCalls).assertEqual(5);
    });

    /**
     * @tc.name          pipelineIntegrationEventsRecorded
     * @tc.desc          Every pipeline step that emits an event appears in the trace.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Connect and dispatch three requests.
     *                   2. Count the event kinds.
     *                   3. Confirm the total.
     * @tc.expected      The trace holds one lifecycle set and three send events.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationEventsRecorded', 0, () => {
      logStep('pipelineIntegrationEventsRecorded', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 4022);
      sendBurst(client, 3);
      expect(client.events.countOf('connect')).assertEqual(1);
      expect(client.events.countOf('death-register')).assertEqual(1);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.events.countOf('send-ok')).assertEqual(3);
      expect(client.events.size()).assertEqual(6);
      expect(client.events.last()).assertEqual('send-ok:' + REPLY_PAYLOAD);
      expect(client.events.fingerprint() > 0).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationToastsRecorded
     * @tc.desc          Pipeline toasts follow each dispatched request plus the connect action.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Connect and dispatch four requests.
     *                   2. Count toasts by category.
     *                   3. Confirm the total.
     * @tc.expected      One connect toast and four success toasts appear.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationToastsRecorded', 0, () => {
      logStep('pipelineIntegrationToastsRecorded', 'begin');
      const client: ConnectionModel = newClient();
      openConnection(client, 4023);
      sendBurst(client, 4);
      expect(toastCount(client, CONNECT_SUCCESS_TOAST)).assertEqual(1);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(4);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(0);
      expect(client.toasts.length).assertEqual(5);
      expect(client.toasts[0]).assertEqual(CONNECT_SUCCESS_TOAST);
      expect(client.lastToast()).assertEqual(SEND_SUCCESS_TOAST);
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(ClientMetrics.from(client).replies).assertEqual(4);
    });

    /**
     * @tc.name          pipelineIntegrationEmptyPayloadRun
     * @tc.desc          An empty payload passes through every stage without breaking the reply.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run the pipeline with an empty payload.
     *                   2. Inspect the stub receipt.
     *                   3. Confirm the reply.
     * @tc.expected      The stub records an empty string and the reply is normal.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationEmptyPayloadRun', 0, () => {
      logStep('pipelineIntegrationEmptyPayloadRun', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4024);
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, '');
      expect(outcome.payload).assertEqual('');
      expect(outcome.isHandled()).assertTrue();
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('');
      expect(outcome.result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(outcome.data.size()).assertEqual(1);
      expect(outcome.data.readCount).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationLongPayloadRun
     * @tc.desc          A long payload survives write, handle and reply stages unchanged.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Build a long payload.
     *                   2. Run the pipeline.
     *                   3. Compare the stub receipt and its length.
     * @tc.expected      The stub receives the exact long payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationLongPayloadRun', 0, () => {
      logStep('pipelineIntegrationLongPayloadRun', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4025);
      let payload: string = '';
      for (let index = 0; index < 25; index++) {
        payload = payload + 'chunk-';
      }
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, payload);
      expect(payload.length).assertEqual(150);
      expect(outcome.isHandled()).assertTrue();
      expect(proxy.stub.receivedTexts[0]).assertEqual(payload);
      expect(proxy.stub.receivedTexts[0].length).assertEqual(150);
      expect(outcome.result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(outcome.data.readCount).assertEqual(1);
      expect(proxy.sendCalls).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationCustomReplyRun
     * @tc.desc          A custom stub reply flows through the reply-read stage.
     * @tc.precondition  A connected proxy with a custom stub reply.
     * @tc.steps         1. Run the pipeline.
     *                   2. Read the result reply.
     *                   3. Confirm the stored text.
     * @tc.expected      Both the read value and the stored text equal the custom reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationCustomReplyRun', 0, () => {
      logStep('pipelineIntegrationCustomReplyRun', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4026, 'pipeline-custom');
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'custom-request');
      expect(outcome.result.replyText).assertEqual('pipeline-custom');
      expect(outcome.result.readReply()).assertEqual('pipeline-custom');
      expect(outcome.result.reply.size()).assertEqual(1);
      expect(proxy.stub.replyText).assertEqual('pipeline-custom');
      expect(proxy.stub.receivedTexts[0]).assertEqual('custom-request');
      expect(outcome.stageTrace()).assertEqual('1>0>pipeline-custom>1>1');
      expect(outcome.result.isSuccess()).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationTwoProxiesIsolation
     * @tc.desc          Two proxies run pipelines independently with separate stubs.
     * @tc.precondition  Two connected clients.
     * @tc.steps         1. Run one pipeline per proxy.
     *                   2. Compare the stub records.
     *                   3. Confirm the results are independent.
     * @tc.expected      Each stub holds only its own payload and both results succeed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationTwoProxiesIsolation', 0, () => {
      logStep('pipelineIntegrationTwoProxiesIsolation', 'begin');
      const left: ConnectionModel = newClient();
      const right: ConnectionModel = newClient();
      const leftProxy: RemoteProxyModel = openConnection(left, 4027);
      const rightProxy: RemoteProxyModel = openConnection(right, 4028);
      const leftOutcome: PipelineOutcome = runDirect(leftProxy, REQUEST_CODE, 'left-pipe');
      const rightOutcome: PipelineOutcome = runDirect(rightProxy, REQUEST_CODE, 'right-pipe');
      expect(leftOutcome.isHandled()).assertTrue();
      expect(rightOutcome.isHandled()).assertTrue();
      expect(leftProxy.stub.receivedTexts[0]).assertEqual('left-pipe');
      expect(rightProxy.stub.receivedTexts[0]).assertEqual('right-pipe');
      expect(leftProxy.stub.receivedTexts.length).assertEqual(1);
      expect(rightProxy.stub.receivedTexts.length).assertEqual(1);
      expect(leftProxy === rightProxy).assertFalse();
      expect(leftProxy.stub === rightProxy.stub).assertFalse();
    });

    /**
     * @tc.name          pipelineIntegrationAfterDisconnect
     * @tc.desc          A pipeline requested after disconnect uses the client invalid-proxy branch.
     * @tc.precondition  A client that has disconnected.
     * @tc.steps         1. Connect and disconnect.
     *                   2. Send through the client.
     *                   3. Inspect the code and toast.
     * @tc.expected      The request fails before any stub handling occurs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationAfterDisconnect', 0, () => {
      logStep('pipelineIntegrationAfterDisconnect', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4029);
      client.onDisconnect();
      const result: RequestResultModel = client.sendString('post-disconnect-pipe');
      expect(result.errCode).assertEqual(ERROR_PROXY_INVALID);
      expect(result.isSuccess()).assertFalse();
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(client.lastToast()).assertEqual(SEND_FAIL_TOAST);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(proxy.sendCalls).assertEqual(0);
      expect(client.state).assertEqual(STATE_DISCONNECTED);
      expect(client.connectId).assertEqual(-1);
    });

    /**
     * @tc.name          pipelineIntegrationAfterDeath
     * @tc.desc          A pipeline requested after proxy death reaches the proxy but fails.
     * @tc.precondition  A connected client whose proxy has died.
     * @tc.steps         1. Notify death.
     *                   2. Send through the client.
     *                   3. Inspect proxy counters.
     * @tc.expected      The proxy records the dispatch but handles nothing.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationAfterDeath', 0, () => {
      logStep('pipelineIntegrationAfterDeath', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4030);
      proxy.notifyDeath();
      const result: RequestResultModel = client.sendString('post-death-pipe');
      expect(result.errCode).assertEqual(ERROR_SEND);
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests.length).assertEqual(1);
      expect(proxy.stub.handledCodes.length).assertEqual(0);
      expect(proxy.stub.receivedTexts.length).assertEqual(0);
      expect(client.deathRecipient.diedCount).assertEqual(1);
      expect(toastCount(client, SEND_FAIL_TOAST)).assertEqual(1);
      expect(client.isConnected()).assertFalse();
    });

    /**
     * @tc.name          pipelineIntegrationReclaimedDataDispatch
     * @tc.desc          Dispatching reclaimed request data still yields an empty-payload reply.
     * @tc.precondition  A connected proxy and a reclaimed data sequence.
     * @tc.steps         1. Write a value and reclaim the data.
     *                   2. Dispatch directly.
     *                   3. Inspect the stub receipt.
     * @tc.expected      The stub records an empty string and the reply still arrives.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationReclaimedDataDispatch', 0, () => {
      logStep('pipelineIntegrationReclaimedDataDispatch', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4031);
      const data: MessageSequenceModel = MessageSequenceModel.create();
      const reply: MessageSequenceModel = MessageSequenceModel.create();
      data.writeString('lost-payload');
      data.reclaim();
      const result: RequestResultModel =
        proxy.sendMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(data.isReclaimed()).assertTrue();
      expect(data.readCount).assertEqual(0);
      expect(result.isSuccess()).assertTrue();
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('');
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.reply.writeCount).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationReplyWriteCount
     * @tc.desc          The stub writes exactly one reply value per successful request.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run three successful pipelines.
     *                   2. Inspect each result reply write count.
     *                   3. Confirm the size.
     * @tc.expected      Every result reply has one written value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationReplyWriteCount', 0, () => {
      logStep('pipelineIntegrationReplyWriteCount', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4032);
      const first: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'write-one');
      const second: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'write-two');
      const third: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'write-three');
      expect(first.result.reply.writeCount).assertEqual(1);
      expect(second.result.reply.writeCount).assertEqual(1);
      expect(third.result.reply.writeCount).assertEqual(1);
      expect(first.result.reply.size()).assertEqual(1);
      expect(second.result.reply.size()).assertEqual(1);
      expect(third.result.reply.size()).assertEqual(1);
      expect(first.result.reply.readCount).assertEqual(0);
    });

    /**
     * @tc.name          pipelineIntegrationDataWriteCount
     * @tc.desc          Each request data sequence records exactly one write before dispatch.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run two pipelines.
     *                   2. Compare data write counts.
     *                   3. Confirm the values.
     * @tc.expected      Both data sequences report one write and one stored value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationDataWriteCount', 0, () => {
      logStep('pipelineIntegrationDataWriteCount', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4033);
      const first: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'write-count-a');
      const second: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'write-count-b');
      expect(first.data.writeCount).assertEqual(1);
      expect(second.data.writeCount).assertEqual(1);
      expect(first.data.size()).assertEqual(1);
      expect(second.data.size()).assertEqual(1);
      expect(first.data.values[0]).assertEqual('write-count-a');
      expect(second.data.values[0]).assertEqual('write-count-b');
      expect(first.data.cursor).assertEqual(1);
      expect(second.data.cursor).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationPayloadFingerprintMatch
     * @tc.desc          The stub receipt and the sent payload share a fingerprint.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Send a payload through the pipeline.
     *                   2. Fingerprint both strings.
     *                   3. Compare the fingerprints.
     * @tc.expected      Both fingerprints match and the values are positive.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationPayloadFingerprintMatch', 0, () => {
      logStep('pipelineIntegrationPayloadFingerprintMatch', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4034);
      const payload: string = 'fingerprint-payload-42';
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, payload);
      const sent: number = textFingerprint(payload);
      const received: number = textFingerprint(proxy.stub.receivedTexts[0]);
      expect(sent).assertEqual(received);
      expect(sent > 0).assertTrue();
      expect(proxy.stub.receivedTexts[0].length).assertEqual(payload.length);
      expect(outcome.isHandled()).assertTrue();
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(outcome.data.values[0]).assertEqual(payload);
      expect(textFingerprint('different')).assertEqual(textFingerprint('different'));
    });

    /**
     * @tc.name          pipelineIntegrationRetryAfterFailure
     * @tc.desc          A failed pipeline can be retried with a fresh sequence pair.
     * @tc.precondition  A connected proxy with an armed failure.
     * @tc.steps         1. Run a failing pipeline.
     *                   2. Run a retry pipeline.
     *                   3. Compare the results.
     * @tc.expected      The retry succeeds and the stub sees only the retry payload.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationRetryAfterFailure', 0, () => {
      logStep('pipelineIntegrationRetryAfterFailure', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4035);
      proxy.failNextSend = ERROR_SEND;
      const failed: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'retry-old');
      const retried: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'retry-new');
      expect(failed.result.errCode).assertEqual(ERROR_SEND);
      expect(failed.data.readCount).assertEqual(0);
      expect(retried.result.errCode).assertEqual(ERROR_NONE);
      expect(retried.isHandled()).assertTrue();
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
      expect(proxy.stub.receivedTexts[0]).assertEqual('retry-new');
      expect(proxy.sendCalls).assertEqual(2);
      expect(failed.data === retried.data).assertFalse();
    });

    /**
     * @tc.name          pipelineIntegrationReconnectStages
     * @tc.desc          Reconnecting installs a fresh pipeline with new registration and stub.
     * @tc.precondition  An empty client.
     * @tc.steps         1. Run a pipeline in session one.
     *                   2. Reconnect and run in session two.
     *                   3. Compare both outcomes.
     * @tc.expected      Both sessions succeed on their own proxies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationReconnectStages', 0, () => {
      logStep('pipelineIntegrationReconnectStages', 'begin');
      const client: ConnectionModel = newClient();
      const firstProxy: RemoteProxyModel = openConnection(client, 4036);
      const first: PipelineOutcome = runDirect(firstProxy, REQUEST_CODE, 'session-one');
      client.onDisconnect();
      const secondProxy: RemoteProxyModel = openConnection(client, 4037);
      const second: PipelineOutcome = runDirect(secondProxy, REQUEST_CODE, 'session-two');
      expect(first.isHandled()).assertTrue();
      expect(second.isHandled()).assertTrue();
      expect(firstProxy.stub.receivedTexts[0]).assertEqual('session-one');
      expect(secondProxy.stub.receivedTexts[0]).assertEqual('session-two');
      expect(firstProxy === secondProxy).assertFalse();
      expect(client.connectId).assertEqual(4037);
      expect(client.deathRecipient.registered).assertTrue();
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          pipelineIntegrationStageTraceVariants
     * @tc.desc          Stage traces differ between handled and rejected codes.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Trace a known-code run.
     *                   2. Trace a foreign-code run.
     *                   3. Compare the traces.
     * @tc.expected      The traces encode different codes and outcomes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationStageTraceVariants', 0, () => {
      logStep('pipelineIntegrationStageTraceVariants', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4038);
      const known: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'trace-known');
      const foreign: PipelineOutcome = runDirect(proxy, 7, 'trace-foreign');
      expect(known.stageTrace()).assertEqual('1>0>' + REPLY_PAYLOAD + '>1>1');
      expect(foreign.stageTrace()).assertEqual('7>16000003>>1>0');
      expect(known.stageTrace() === foreign.stageTrace()).assertFalse();
      expect(known.isHandled()).assertTrue();
      expect(foreign.isHandled()).assertFalse();
      expect(proxy.stub.handledCodes.length).assertEqual(2);
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationStageSegmentCount
     * @tc.desc          Every stage trace always contains exactly five segments.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Trace runs with three different codes.
     *                   2. Count the segments of each trace.
     *                   3. Compare with the expected five.
     * @tc.expected      All traces split into five segments.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationStageSegmentCount', 0, () => {
      logStep('pipelineIntegrationStageSegmentCount', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4039);
      const first: PipelineOutcome = runDirect(proxy, 1, 'segment-a');
      const second: PipelineOutcome = runDirect(proxy, 2, 'segment-b');
      const third: PipelineOutcome = runDirect(proxy, 3, 'segment-c');
      expect(first.stageTrace().split('>').length).assertEqual(5);
      expect(second.stageTrace().split('>').length).assertEqual(5);
      expect(third.stageTrace().split('>').length).assertEqual(5);
      expect(second.stageTrace().startsWith('2>')).assertTrue();
      expect(third.stageTrace().startsWith('3>')).assertTrue();
      expect(proxy.stub.handledCodes.length).assertEqual(3);
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationClientSendPath
     * @tc.desc          The client send path wraps the same pipeline and returns the reply.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Send through the client helper.
     *                   2. Inspect the result and proxy counters.
     *                   3. Confirm the stub receipt.
     * @tc.expected      The client path succeeds with the same reply as a direct dispatch.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationClientSendPath', 0, () => {
      logStep('pipelineIntegrationClientSendPath', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4040);
      const result: RequestResultModel = client.sendString('client-path');
      expect(result.isSuccess()).assertTrue();
      expect(result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(proxy.stub.receivedTexts[0]).assertEqual('client-path');
      expect(proxy.sendCalls).assertEqual(1);
      expect(proxy.requests[0]).assertEqual(REQUEST_CODE);
      expect(toastCount(client, SEND_SUCCESS_TOAST)).assertEqual(1);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          pipelineIntegrationMixedCodeSequence
     * @tc.desc          A mixed sequence of known and foreign codes handles only known ones.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run codes one, two, one and ninety-nine.
     *                   2. Count handled receipts.
     *                   3. Confirm the outcome pattern.
     * @tc.expected      Two runs succeed and two are rejected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationMixedCodeSequence', 0, () => {
      logStep('pipelineIntegrationMixedCodeSequence', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4041);
      const codes: number[] = [1, 2, 1, 99];
      let handled: number = 0;
      let rejected: number = 0;
      for (let index = 0; index < codes.length; index++) {
        const outcome: PipelineOutcome = runDirect(proxy, codes[index], 'mixed-' + String(index));
        if (outcome.isHandled()) {
          handled = handled + 1;
        } else {
          rejected = rejected + 1;
        }
      }
      expect(handled).assertEqual(2);
      expect(rejected).assertEqual(2);
      expect(proxy.stub.handledCodes.length).assertEqual(4);
      expect(proxy.stub.receivedTexts.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('mixed-0');
      expect(proxy.stub.receivedTexts[1]).assertEqual('mixed-2');
      expect(proxy.sendCalls).assertEqual(4);
      expect(proxy.stub.requestCount()).assertEqual(4);
    });

    /**
     * @tc.name          pipelineIntegrationStateAfterRuns
     * @tc.desc          Direct pipeline runs leave the client session connected and healthy.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Run four direct pipelines.
     *                   2. Inspect the client state.
     *                   3. Confirm the proxy binding.
     * @tc.expected      The client stays connected with the same proxy and no errors.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationStateAfterRuns', 0, () => {
      logStep('pipelineIntegrationStateAfterRuns', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4042);
      for (let index = 0; index < 4; index++) {
        runDirect(proxy, REQUEST_CODE, 'state-' + String(index));
      }
      expect(client.state).assertEqual(STATE_CONNECTED);
      expect(client.proxy).assertEqual(proxy);
      expect(client.isConnected()).assertTrue();
      expect(client.logs.countLevel('ERROR')).assertEqual(0);
      expect(client.logs.countLevel('WARN')).assertEqual(0);
      expect(client.events.countOf('connected')).assertEqual(1);
      expect(client.toasts.length).assertEqual(1);
      expect(client.deathRecipient.registered).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationSuccessPredicate
     * @tc.desc          The success predicate agrees with the error code on every outcome.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run one known and one foreign code.
     *                   2. Compare the predicate with the code.
     *                   3. Confirm the mapping.
     * @tc.expected      Success is true only for the zero error code.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationSuccessPredicate', 0, () => {
      logStep('pipelineIntegrationSuccessPredicate', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4043);
      const good: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'predicate-good');
      const bad: PipelineOutcome = runDirect(proxy, 42, 'predicate-bad');
      expect(good.result.errCode === ERROR_NONE).assertTrue();
      expect(good.result.isSuccess()).assertEqual(good.result.errCode === ERROR_NONE);
      expect(bad.result.errCode === ERROR_NONE).assertFalse();
      expect(bad.result.isSuccess()).assertEqual(bad.result.errCode === ERROR_NONE);
      expect(good.isHandled()).assertTrue();
      expect(bad.isHandled()).assertFalse();
      expect(good.result.isSuccess() === bad.result.isSuccess()).assertFalse();
      expect(proxy.stub.receivedTexts.length).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationRewindAfterDispatch
     * @tc.desc          Rewinding request data after dispatch re-exposes the sent payload.
     * @tc.precondition  A completed pipeline outcome.
     * @tc.steps         1. Rewind the data sequence.
     *                   2. Read the payload again.
     *                   3. Confirm the cursor state.
     * @tc.expected      The payload is readable again after rewind.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationRewindAfterDispatch', 0, () => {
      logStep('pipelineIntegrationRewindAfterDispatch', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4044);
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'rewind-payload');
      expect(outcome.data.readString()).assertEqual('');
      outcome.data.rewind();
      expect(outcome.data.cursor).assertEqual(0);
      expect(outcome.data.readString()).assertEqual('rewind-payload');
      expect(outcome.data.cursor).assertEqual(1);
      expect(outcome.data.readCount).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual('rewind-payload');
      expect(outcome.isHandled()).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationReplyChangeBetweenRuns
     * @tc.desc          A stub reply change between runs is visible in the later result.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run a pipeline with the default reply.
     *                   2. Change the stub reply and run again.
     *                   3. Compare both results.
     * @tc.expected      The first result uses the default reply and the second the new one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationReplyChangeBetweenRuns', 0, () => {
      logStep('pipelineIntegrationReplyChangeBetweenRuns', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4045);
      const first: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'reply-before');
      proxy.stub.replyText = 'reply-after-change';
      const second: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'reply-after');
      expect(first.result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(second.result.replyText).assertEqual('reply-after-change');
      expect(second.result.readReply()).assertEqual('reply-after-change');
      expect(proxy.stub.receivedTexts.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[1]).assertEqual('reply-after');
      expect(first.result.replyText === second.result.replyText).assertFalse();
      expect(proxy.stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name          pipelineIntegrationFiftyRuns
     * @tc.desc          Fifty direct pipeline runs all succeed and are fully recorded.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run fifty pipelines.
     *                   2. Count successes and stub receipts.
     *                   3. Confirm the counters.
     * @tc.expected      All fifty runs succeed and the stub holds fifty payloads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationFiftyRuns', 0, () => {
      logStep('pipelineIntegrationFiftyRuns', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4046);
      let successes: number = 0;
      for (let index = 0; index < 50; index++) {
        const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'bulk-' + String(index));
        if (outcome.isHandled()) {
          successes = successes + 1;
        }
      }
      expect(successes).assertEqual(50);
      expect(proxy.sendCalls).assertEqual(50);
      expect(proxy.requests.length).assertEqual(50);
      expect(proxy.stub.requestCount()).assertEqual(50);
      expect(proxy.stub.receivedTexts.length).assertEqual(50);
      expect(proxy.stub.receivedTexts[0]).assertEqual('bulk-0');
      expect(proxy.stub.receivedTexts[49]).assertEqual('bulk-49');
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationNoLeakAfterManyRuns
     * @tc.desc          Forty pipeline outcomes are fully reclaimed leaving no live sequence pair.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run forty pipelines and retain the outcomes.
     *                   2. Reclaim every data and reply sequence.
     *                   3. Count reclaimed pairs.
     * @tc.expected      All forty pairs report reclaimed.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationNoLeakAfterManyRuns', 0, () => {
      logStep('pipelineIntegrationNoLeakAfterManyRuns', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4047);
      const outcomes: PipelineOutcome[] = [];
      for (let index = 0; index < 40; index++) {
        outcomes.push(runDirect(proxy, REQUEST_CODE, 'leak-' + String(index)));
      }
      for (let index = 0; index < outcomes.length; index++) {
        outcomes[index].data.reclaim();
        outcomes[index].result.reply.reclaim();
      }
      let reclaimedPairs: number = 0;
      for (let index = 0; index < outcomes.length; index++) {
        if (outcomes[index].data.isReclaimed() && outcomes[index].result.reply.isReclaimed()) {
          reclaimedPairs = reclaimedPairs + 1;
        }
      }
      expect(outcomes.length).assertEqual(40);
      expect(reclaimedPairs).assertEqual(40);
      expect(outcomes[0].data.readString()).assertEqual('');
      expect(outcomes[39].result.readReply()).assertEqual('');
      expect(outcomes[20].result.replyText).assertEqual(REPLY_PAYLOAD);
      expect(proxy.stub.receivedTexts.length).assertEqual(40);
    });

    /**
     * @tc.name          pipelineIntegrationSnapshotAfterPipelines
     * @tc.desc          The client snapshot after direct pipelines still describes a healthy session.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Run five direct pipelines.
     *                   2. Capture the snapshot.
     *                   3. Compare each field.
     * @tc.expected      The snapshot reports connected, the id, a proxy and one toast.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationSnapshotAfterPipelines', 0, () => {
      logStep('pipelineIntegrationSnapshotAfterPipelines', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4048);
      for (let index = 0; index < 5; index++) {
        runDirect(proxy, REQUEST_CODE, 'snapshot-' + String(index));
      }
      const snapshot: ClientSnapshot = new ClientSnapshot(client);
      expect(snapshot.state).assertEqual(STATE_CONNECTED);
      expect(snapshot.connectId).assertEqual(4048);
      expect(snapshot.hasProxy).assertTrue();
      expect(snapshot.deathRegistered).assertTrue();
      expect(snapshot.toastCount).assertEqual(1);
      expect(snapshot.describe()).assertEqual('connected/4048/true/true/1');
      expect(client.toasts.length).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationFinalInvariants
     * @tc.desc          The pipeline totals reconcile after a mixed run of client and direct paths.
     * @tc.precondition  A connected client.
     * @tc.steps         1. Run four client sends and four direct pipelines.
     *                   2. Build metrics.
     *                   3. Verify the totals.
     * @tc.expected      The stub holds eight payloads and metrics report four client replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationFinalInvariants', 0, () => {
      logStep('pipelineIntegrationFinalInvariants', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4049);
      sendBurst(client, 4);
      for (let index = 0; index < 4; index++) {
        runDirect(proxy, REQUEST_CODE, 'direct-' + String(index));
      }
      const metrics: ClientMetrics = ClientMetrics.from(client);
      expect(metrics.replies).assertEqual(4);
      expect(metrics.sends).assertEqual(4);
      expect(metrics.successRatio()).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(8);
      expect(proxy.sendCalls).assertEqual(8);
      expect(proxy.requests.length).assertEqual(8);
      expect(client.toasts.length).assertEqual(5);
      expect(client.state).assertEqual(STATE_CONNECTED);
    });

    /**
     * @tc.name          pipelineIntegrationPayloadSizeInStages
     * @tc.desc          The payload length survives the write, handle and reply stages.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Send a payload of known length.
     *                   2. Compare the stored and received lengths.
     *                   3. Confirm the stage trace size.
     * @tc.expected      The data value and stub receipt share the same length.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationPayloadSizeInStages', 0, () => {
      logStep('pipelineIntegrationPayloadSizeInStages', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4050);
      const payload: string = 'size-stage-payload';
      const outcome: PipelineOutcome = runDirect(proxy, REQUEST_CODE, payload);
      expect(payload.length).assertEqual(18);
      expect(outcome.data.values[0].length).assertEqual(18);
      expect(proxy.stub.receivedTexts[0].length).assertEqual(18);
      expect(outcome.data.size()).assertEqual(1);
      expect(outcome.result.reply.size()).assertEqual(1);
      expect(outcome.stageTrace().split('>').length).assertEqual(5);
      expect(outcome.isHandled()).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationLateReplyReads
     * @tc.desc          Replies retained from earlier runs stay readable until consumed.
     * @tc.precondition  A connected proxy and three retained outcomes.
     * @tc.steps         1. Run three pipelines without reading replies.
     *                   2. Read each reply in reverse order.
     *                   3. Confirm the cursor of each.
     * @tc.expected      Every reply reads the payload exactly once.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationLateReplyReads', 0, () => {
      logStep('pipelineIntegrationLateReplyReads', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4051);
      const outcomes: PipelineOutcome[] = [];
      for (let index = 0; index < 3; index++) {
        outcomes.push(runDirect(proxy, REQUEST_CODE, 'late-' + String(index)));
      }
      expect(outcomes[2].result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(outcomes[1].result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(outcomes[0].result.readReply()).assertEqual(REPLY_PAYLOAD);
      expect(outcomes[0].result.reply.cursor).assertEqual(1);
      expect(outcomes[1].result.reply.cursor).assertEqual(1);
      expect(outcomes[2].result.reply.cursor).assertEqual(1);
      expect(proxy.stub.receivedTexts.length).assertEqual(3);
      expect(outcomes[1].result.readReply()).assertEqual('');
    });

    /**
     * @tc.name          pipelineIntegrationFingerprintPair
     * @tc.desc          The request fingerprint and the reply fingerprint are stable per run.
     * @tc.precondition  A connected proxy.
     * @tc.steps         1. Run one pipeline.
     *                   2. Fingerprint the request and reply values.
     *                   3. Repeat and compare.
     * @tc.expected      Both fingerprints reproduce on a second identical run.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationFingerprintPair', 0, () => {
      logStep('pipelineIntegrationFingerprintPair', 'begin');
      const client: ConnectionModel = newClient();
      const proxy: RemoteProxyModel = openConnection(client, 4052);
      const first: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'fp-request');
      const requestPrint: number = first.data.values[0] === 'fp-request' ?
        textFingerprint('fp-request') : -1;
      const replyPrint: number = textFingerprint(first.result.replyText);
      const second: PipelineOutcome = runDirect(proxy, REQUEST_CODE, 'fp-request');
      expect(requestPrint).assertEqual(textFingerprint('fp-request'));
      expect(replyPrint).assertEqual(textFingerprint(second.result.replyText));
      expect(requestPrint > 0).assertTrue();
      expect(replyPrint > 0).assertTrue();
      expect(proxy.stub.receivedTexts.length).assertEqual(2);
      expect(proxy.stub.receivedTexts[0]).assertEqual(proxy.stub.receivedTexts[1]);
      expect(second.result.isSuccess()).assertTrue();
    });
  });
}