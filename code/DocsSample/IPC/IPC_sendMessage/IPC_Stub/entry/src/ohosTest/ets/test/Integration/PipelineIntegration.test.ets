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
  OPTION_FLAG_SYNC,
  OPTION_FLAG_ASYNC,
  MessageSequenceModel,
  MessageOptionModel,
  InProcessClient,
  StubRemoteObjectModel,
  ServiceLifecycleModel,
  StubMetrics,
  StubRequestRecord,
  countOf,
  joined,
  textFingerprint
} from '../Shared/SharedDriver';

/** Result of the five-stage pipeline. */
export class PipelineRun {
  public encoded: boolean = false;
  public dispatched: boolean = false;
  public handled: boolean = false;
  public replyWritten: boolean = false;
  public decoded: string = '';
  public dataSize: number = 0;
  public replySize: number = 0;
  public stages: string[] = [];

  public stageTrace(): string {
    return joined(this.stages, '>');
  }
}

function runPipeline(stub: StubRemoteObjectModel, code: number, payload: string,
  option: MessageOptionModel = new MessageOptionModel()): PipelineRun {
  const run = new PipelineRun();
  const data = MessageSequenceModel.create();
  const reply = MessageSequenceModel.create();
  run.encoded = data.writeString(payload);
  if (run.encoded) {
    run.stages.push('encode');
  }
  run.dispatched = true;
  run.stages.push('dispatch');
  run.stages.push('handle');
  run.handled = stub.onRemoteMessageRequest(code, data, reply, option);
  run.dataSize = data.size();
  run.replySize = reply.size();
  if (run.replySize > 0) {
    run.replyWritten = true;
    run.stages.push('reply');
  }
  run.decoded = reply.readString();
  run.stages.push('decode');
  return run;
}

export default function pipelineIntegration(): void {
  describe('IntegrationPipeline', () => {
    beforeAll(() => {
      logSuite('IntegrationPipeline', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('IntegrationPipeline', 'end');
    });

    /**
     * @tc.name          pipelineIntegrationStagesExecuteInOrder
     * @tc.desc          A successful run visits all five pipeline stages in order.
     * @tc.precondition  A stub and helper are available.
     * @tc.steps         1. Run a valid request through the pipeline.
     *                   2. Read the stage trace.
     *                   3. Compare with the expected order.
     * @tc.expected      The trace reads encode, dispatch, handle, reply, decode.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('pipelineIntegrationStagesExecuteInOrder', 0, () => {
      const stub = new StubRemoteObjectModel();
      const run = runPipeline(stub, REQUEST_CODE, REQUEST_PAYLOAD);
      expect(run.stageTrace()).assertEqual('encode>dispatch>handle>reply>decode');
      expect(run.stages.length).assertEqual(5);
      expect(run.handled).assertTrue();
      expect(run.replyWritten).assertTrue();
      expect(run.decoded).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationEncodeStageWritesPayload
     * @tc.desc          The encode stage appends exactly one string to the data sequence.
     * @tc.precondition  A stub and message sequence are prepared.
     * @tc.steps         1. Encode the payload.
     *                   2. Read size and write counters.
     *                   3. Inspect the sequence trace.
     * @tc.expected      The data sequence holds one written value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('pipelineIntegrationEncodeStageWritesPayload', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      expect(data.writeString('pipeline-payload')).assertTrue();
      expect(data.size()).assertEqual(1);
      expect(data.writeCount).assertEqual(1);
      expect(data.readCount).assertEqual(0);
      expect(data.trace()).assertEqual('pipeline-payload#0');
      const run = runPipeline(stub, REQUEST_CODE, REQUEST_PAYLOAD);
      expect(run.encoded).assertTrue();
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
    });

    /**
     * @tc.name          pipelineIntegrationDispatchStageReadsCode
     * @tc.desc          The dispatch stage preserves the request code for the stub.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run a valid code and an invalid code.
     *                   2. Read both ledger codes.
     *                   3. Compare with the dispatched values.
     * @tc.expected      The ledger stores both codes unchanged.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('pipelineIntegrationDispatchStageReadsCode', 0, () => {
      const stub = new StubRemoteObjectModel();
      const valid = runPipeline(stub, REQUEST_CODE, 'valid');
      const invalid = runPipeline(stub, UNKNOWN_CODE_TWO, 'invalid');
      expect(valid.dispatched).assertTrue();
      expect(invalid.dispatched).assertTrue();
      expect(stub.requests[0].code).assertEqual(REQUEST_CODE);
      expect(stub.requests[1].code).assertEqual(UNKNOWN_CODE_TWO);
      expect(stub.requestCount()).assertEqual(2);
      expect(valid.handled).assertTrue();
      expect(invalid.handled).assertFalse();
    });

    /**
     * @tc.name          pipelineIntegrationStubStageHandlesRequest
     * @tc.desc          The handle stage returns true only for code one.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run code one.
     *                   2. Run each canonical unknown code.
     *                   3. Compare the handled flags.
     * @tc.expected      Only code one is handled.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('pipelineIntegrationStubStageHandlesRequest', 0, () => {
      const stub = new StubRemoteObjectModel();
      expect(runPipeline(stub, REQUEST_CODE, 'one').handled).assertTrue();
      expect(runPipeline(stub, UNKNOWN_CODE_ZERO, 'zero').handled).assertFalse();
      expect(runPipeline(stub, UNKNOWN_CODE_TWO, 'two').handled).assertFalse();
      expect(runPipeline(stub, UNKNOWN_CODE_NEGATIVE, 'negative').handled).assertFalse();
      expect(runPipeline(stub, UNKNOWN_CODE_LARGE, 'large').handled).assertFalse();
      expect(stub.requestCount()).assertEqual(5);
      expect(StubMetrics.from(stub).handled).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationReplyStageWritesLiteral
     * @tc.desc          The reply stage writes exactly one stock reply.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run the pipeline.
     *                   2. Read the reply size and content.
     *                   3. Check the written row.
     * @tc.expected      The reply sequence holds one hello rpc value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('pipelineIntegrationReplyStageWritesLiteral', 0, () => {
      const stub = new StubRemoteObjectModel();
      const run = runPipeline(stub, REQUEST_CODE, 'reply-stage');
      expect(run.replySize).assertEqual(1);
      expect(run.replyWritten).assertTrue();
      expect(run.decoded).assertEqual('hello rpc');
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).replies).assertEqual(1);
      expect(run.dataSize).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationDecodeStageReadsReply
     * @tc.desc          The decode stage consumes the reply cursor exactly once.
     * @tc.precondition  A successful pipeline run exists.
     * @tc.steps         1. Decode the reply.
     *                   2. Decode again.
     *                   3. Read the reply cursor through a fresh sequence.
     * @tc.expected      The first decode returns hello rpc and the second is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationDecodeStageReadsReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('decode');
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.readString()).assertEqual('');
      expect(reply.readCount).assertEqual(1);
      expect(reply.cursor).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.trace()).assertEqual(REPLY_PAYLOAD + '#1');
    });

    /**
     * @tc.name          pipelineIntegrationFullPipelineSuccess
     * @tc.desc          A complete pipeline run produces the expected reply and row.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run the pipeline with code one.
     *                   2. Inspect the ledger and decoded reply.
     *                   3. Build metrics.
     * @tc.expected      The row shows the payload and reply with a handled flag.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('pipelineIntegrationFullPipelineSuccess', 0, () => {
      const stub = new StubRemoteObjectModel();
      const run = runPipeline(stub, REQUEST_CODE, 'full-pipeline');
      const row = stub.requests[0];
      expect(run.handled).assertTrue();
      expect(run.decoded).assertEqual(REPLY_PAYLOAD);
      expect(row.text).assertEqual('full-pipeline');
      expect(row.replyText).assertEqual(REPLY_PAYLOAD);
      expect(row.handled).assertTrue();
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationUnknownCodeShortCircuits
     * @tc.desc          An unknown code stops before the reply stage.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run an unknown code.
     *                   2. Read the stage trace.
     *                   3. Inspect the reply size and decode.
     * @tc.expected      The trace omits the reply stage and the decode is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationUnknownCodeShortCircuits', 0, () => {
      const stub = new StubRemoteObjectModel();
      const run = runPipeline(stub, UNKNOWN_CODE_ZERO, 'short-circuit');
      expect(run.stageTrace()).assertEqual('encode>dispatch>handle>decode');
      expect(run.handled).assertFalse();
      expect(run.replyWritten).assertFalse();
      expect(run.replySize).assertEqual(0);
      expect(run.decoded).assertEqual('');
      expect(stub.requests[0].handled).assertFalse();
    });

    /**
     * @tc.name          pipelineIntegrationDeadStubShortCircuits
     * @tc.desc          A killed stub rejects the handle stage without a reply.
     * @tc.precondition  A stub has been killed.
     * @tc.steps         1. Kill the stub.
     *                   2. Run the pipeline.
     *                   3. Read the trace and flags.
     * @tc.expected      The handle stage fails with no reply written.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationDeadStubShortCircuits', 0, () => {
      const stub = new StubRemoteObjectModel();
      stub.kill();
      const run = runPipeline(stub, REQUEST_CODE, 'dead-pipeline');
      expect(run.stageTrace()).assertEqual('encode>dispatch>handle>decode');
      expect(run.handled).assertFalse();
      expect(run.replySize).assertEqual(0);
      expect(run.decoded).assertEqual('');
      expect(stub.requests[0].handled).assertFalse();
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationReclaimFailsEncode
     * @tc.desc          A reclaimed data sequence cannot encode a payload.
     * @tc.precondition  A data sequence has been reclaimed.
     * @tc.steps         1. Reclaim the data sequence.
     *                   2. Attempt the encode write.
     *                   3. Run the pipeline with it.
     * @tc.expected      The write fails and the piped payload is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationReclaimFailsEncode', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      data.reclaim();
      expect(data.writeString('lost')).assertFalse();
      expect(data.size()).assertEqual(0);
      expect(data.trace()).assertEqual('#0');
      const reply = MessageSequenceModel.create();
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertTrue();
      expect(stub.requests[0].text).assertEqual('');
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          pipelineIntegrationReclaimedReplyFailsReplyStage
     * @tc.desc          A reclaimed reply sequence fails the reply stage.
     * @tc.precondition  A reply sequence has been reclaimed.
     * @tc.steps         1. Reclaim the reply sequence.
     *                   2. Invoke the stub.
     *                   3. Read the result and sizes.
     * @tc.expected      The stub returns false with no reply written.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationReclaimedReplyFailsReplyStage', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('request');
      reply.reclaim();
      const handled = stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(handled).assertFalse();
      expect(reply.size()).assertEqual(0);
      expect(reply.readString()).assertEqual('');
      expect(stub.requests[0].handled).assertFalse();
      expect(StubMetrics.from(stub).replies).assertEqual(0);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationStageTraceRecorded
     * @tc.desc          Failure traces omit only the reply stage.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run a success and a failure.
     *                   2. Join both stage traces.
     *                   3. Compare the lengths.
     * @tc.expected      Success traces have five stages and failure traces four.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationStageTraceRecorded', 0, () => {
      const stub = new StubRemoteObjectModel();
      const success = runPipeline(stub, REQUEST_CODE, 'trace-success');
      const failure = runPipeline(stub, UNKNOWN_CODE_TWO, 'trace-failure');
      expect(success.stages.length).assertEqual(5);
      expect(failure.stages.length).assertEqual(4);
      expect(success.stageTrace()).assertEqual('encode>dispatch>handle>reply>decode');
      expect(failure.stageTrace()).assertEqual('encode>dispatch>handle>decode');
      expect(countOf(success.stages, 'handle')).assertEqual(1);
      expect(countOf(failure.stages, 'reply')).assertEqual(0);
    });

    /**
     * @tc.name          pipelineIntegrationStageTraceFingerprint
     * @tc.desc          Identical pipelines produce identical stage-trace fingerprints.
     * @tc.precondition  Two stubs are prepared.
     * @tc.steps         1. Run the same pipeline on both stubs.
     *                   2. Hash each stage trace.
     *                   3. Compare the fingerprints.
     * @tc.expected      Both stage traces hash to the same value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationStageTraceFingerprint', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      const first = runPipeline(firstStub, REQUEST_CODE, 'fingerprint');
      const second = runPipeline(secondStub, REQUEST_CODE, 'fingerprint');
      expect(textFingerprint(first.stageTrace())).assertEqual(textFingerprint(second.stageTrace()));
      expect(textFingerprint(first.stageTrace())).assertEqual(textFingerprint('encode>dispatch>handle>reply>decode'));
      expect(first.decoded).assertEqual(second.decoded);
      expect(firstStub.requestCount()).assertEqual(secondStub.requestCount());
      expect(first.stageTrace() === 'encode>dispatch>handle>decode').assertFalse();
    });

    /**
     * @tc.name          pipelineIntegrationFiveStageAudit
     * @tc.desc          Each stage leaves its own observable artifact.
     * @tc.precondition  A pipeline run has completed.
     * @tc.steps         1. Run a valid pipeline.
     *                   2. Map each stage to its artifact.
     *                   3. Verify all five artifacts.
     * @tc.expected      Encoded data, dispatched code, handled row, reply and decode all exist.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationFiveStageAudit', 0, () => {
      const stub = new StubRemoteObjectModel();
      const run = runPipeline(stub, REQUEST_CODE, 'stage-audit');
      expect(run.encoded).assertTrue();
      expect(run.dispatched).assertTrue();
      expect(run.handled).assertTrue();
      expect(run.replyWritten).assertTrue();
      expect(run.decoded).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].text).assertEqual('stage-audit');
      expect(stub.requests[0].code).assertEqual(REQUEST_CODE);
    });

    /**
     * @tc.name          pipelineIntegrationPayloadPreservedThroughStages
     * @tc.desc          The payload reaches the ledger without modification.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run three distinct payloads.
     *                   2. Read each ledger row.
     *                   3. Compare with the originals.
     * @tc.expected      All three rows match their sent payloads.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationPayloadPreservedThroughStages', 0, () => {
      const stub = new StubRemoteObjectModel();
      const payloads: string[] = ['first-stage', 'second-stage', 'third-stage'];
      for (let index = 0; index < payloads.length; index++) {
        runPipeline(stub, REQUEST_CODE, payloads[index]);
      }
      expect(stub.requestCount()).assertEqual(3);
      expect(stub.requests[0].text).assertEqual('first-stage');
      expect(stub.requests[1].text).assertEqual('second-stage');
      expect(stub.requests[2].text).assertEqual('third-stage');
      expect(joined(payloads, ',')).assertEqual('first-stage,second-stage,third-stage');
      expect(StubMetrics.from(stub).handled).assertEqual(3);
    });

    /**
     * @tc.name          pipelineIntegrationReplyPreservedThroughStages
     * @tc.desc          Every success decodes to the same reply literal.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run four payloads through the pipeline.
     *                   2. Collect decoded replies.
     *                   3. Count literal matches.
     * @tc.expected      All four decoded replies equal hello rpc.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationReplyPreservedThroughStages', 0, () => {
      const stub = new StubRemoteObjectModel();
      const decoded: string[] = [];
      for (let index = 0; index < 4; index++) {
        decoded.push(runPipeline(stub, REQUEST_CODE, 'reply-' + String(index)).decoded);
      }
      expect(decoded.length).assertEqual(4);
      expect(countOf(decoded, REPLY_PAYLOAD)).assertEqual(4);
      expect(decoded[0]).assertEqual('hello rpc');
      expect(decoded[3]).assertEqual('hello rpc');
      expect(StubMetrics.from(stub).replies).assertEqual(4);
      expect(stub.requests[3].replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          pipelineIntegrationOptionReachesStub
     * @tc.desc          The message option is visible to the stub unchanged.
     * @tc.precondition  A stub and three options are prepared.
     * @tc.steps         1. Run the pipeline with each option.
     *                   2. Read the recorded option strings.
     *                   3. Compare with the option descriptors.
     * @tc.expected      All three option descriptors match exactly.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationOptionReachesStub', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new MessageOptionModel(OPTION_FLAG_SYNC, 0, false);
      const second = new MessageOptionModel(OPTION_FLAG_ASYNC, 30, false);
      const third = new MessageOptionModel(OPTION_FLAG_ASYNC, 0, true);
      runPipeline(stub, REQUEST_CODE, 'opt-1', first);
      runPipeline(stub, REQUEST_CODE, 'opt-2', second);
      runPipeline(stub, REQUEST_CODE, 'opt-3', third);
      expect(stub.requests[0].option).assertEqual('0/0/false');
      expect(stub.requests[1].option).assertEqual('1/30/false');
      expect(stub.requests[2].option).assertEqual('1/0/true');
      expect(stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(stub).handled).assertEqual(3);
    });

    /**
     * @tc.name          pipelineIntegrationLedgerRowPerRequest
     * @tc.desc          Each pipeline run appends exactly one ledger row.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run five pipelines including one failure.
     *                   2. Compare the row count with the run count.
     *                   3. Read the last row.
     * @tc.expected      Five runs produce five rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationLedgerRowPerRequest', 0, () => {
      const stub = new StubRemoteObjectModel();
      runPipeline(stub, REQUEST_CODE, 'row-1');
      runPipeline(stub, REQUEST_CODE, 'row-2');
      runPipeline(stub, UNKNOWN_CODE_LARGE, 'row-3');
      runPipeline(stub, REQUEST_CODE, 'row-4');
      runPipeline(stub, REQUEST_CODE, 'row-5');
      expect(stub.requestCount()).assertEqual(5);
      expect(stub.requests.length).assertEqual(5);
      expect(stub.lastRequest()?.text).assertEqual('row-5');
      expect(StubMetrics.from(stub).requests).assertEqual(5);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      expect(StubMetrics.from(stub).handled).assertEqual(4);
    });

    /**
     * @tc.name          pipelineIntegrationClientResultMatchesStages
     * @tc.desc          Client results agree with a direct pipeline run.
     * @tc.precondition  Two independent stubs are prepared.
     * @tc.steps         1. Send through the client.
     *                   2. Run the pipeline directly.
     *                   3. Compare both ledger rows.
     * @tc.expected      Both rows hold the same text, reply and handled flag.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationClientResultMatchesStages', 0, () => {
      const clientStub = new StubRemoteObjectModel();
      const pipelineStub = new StubRemoteObjectModel();
      const result = new InProcessClient(clientStub).send(REQUEST_CODE, 'compare');
      const run = runPipeline(pipelineStub, REQUEST_CODE, 'compare');
      expect(result.replyText).assertEqual(run.decoded);
      expect(clientStub.requests[0].text).assertEqual(pipelineStub.requests[0].text);
      expect(clientStub.requests[0].handled).assertEqual(run.handled);
      expect(result.errCode).assertEqual(0);
      expect(clientStub.requestCount()).assertEqual(pipelineStub.requestCount());
    });

    /**
     * @tc.name          pipelineIntegrationBatchPipeline
     * @tc.desc          Ten stage runs form a complete batch with ten replies.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run ten valid pipelines.
     *                   2. Count decoded replies.
     *                   3. Build metrics.
     * @tc.expected      Ten decoded replies and ten handled rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationBatchPipeline', 0, () => {
      const stub = new StubRemoteObjectModel();
      const decoded: string[] = [];
      for (let index = 0; index < 10; index++) {
        decoded.push(runPipeline(stub, REQUEST_CODE, 'batch-' + String(index)).decoded);
      }
      expect(decoded.length).assertEqual(10);
      expect(countOf(decoded, REPLY_PAYLOAD)).assertEqual(10);
      expect(stub.requestCount()).assertEqual(10);
      expect(StubMetrics.from(stub).handled).assertEqual(10);
      expect(stub.requests[9].text).assertEqual('batch-9');
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationTenRequestPipeline
     * @tc.desc          Ten sequential requests each complete five stages.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run ten requests.
     *                   2. Sum the stage counts.
     *                   3. Compare with fifty.
     * @tc.expected      Fifty total stages are recorded across ten runs.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationTenRequestPipeline', 0, () => {
      const stub = new StubRemoteObjectModel();
      let stages = 0;
      for (let index = 0; index < 10; index++) {
        stages = stages + runPipeline(stub, REQUEST_CODE, 'sequence-' + String(index)).stages.length;
      }
      expect(stages).assertEqual(50);
      expect(stub.requestCount()).assertEqual(10);
      expect(StubMetrics.from(stub).replies).assertEqual(10);
      expect(stub.requests[0].text).assertEqual('sequence-0');
      expect(stub.requests[9].text).assertEqual('sequence-9');
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationMixedPipeline
     * @tc.desc          A pipeline with rejected codes keeps stage counts consistent.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run nine requests with three failures.
     *                   2. Sum stage counts.
     *                   3. Build metrics.
     * @tc.expected      The stage total is forty-two with six successes.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationMixedPipeline', 0, () => {
      const stub = new StubRemoteObjectModel();
      let stages = 0;
      for (let index = 0; index < 9; index++) {
        const code = index % 3 === 0 ? UNKNOWN_CODE_TWO : REQUEST_CODE;
        stages = stages + runPipeline(stub, code, 'mixed-' + String(index)).stages.length;
      }
      const metrics = StubMetrics.from(stub);
      expect(stages).assertEqual(42);
      expect(metrics.requests).assertEqual(9);
      expect(metrics.handled).assertEqual(6);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.replies).assertEqual(6);
      expect(metrics.successRatio()).assertEqual(2 / 3);
    });

    /**
     * @tc.name          pipelineIntegrationPipelineMetrics
     * @tc.desc          Pipeline stage results map one to one onto metrics.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run five pipelines with two failures.
     *                   2. Count handled stage results.
     *                   3. Compare with metrics.
     * @tc.expected      Three handled runs and three metric replies agree.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationPipelineMetrics', 0, () => {
      const stub = new StubRemoteObjectModel();
      let handledRuns = 0;
      for (let index = 0; index < 5; index++) {
        const code = index < 2 ? UNKNOWN_CODE_NEGATIVE : REQUEST_CODE;
        if (runPipeline(stub, code, 'metric-' + String(index)).handled) {
          handledRuns = handledRuns + 1;
        }
      }
      const metrics = StubMetrics.from(stub);
      expect(handledRuns).assertEqual(3);
      expect(metrics.requests).assertEqual(5);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.successRatio()).assertEqual(0.6);
    });

    /**
     * @tc.name          pipelineIntegrationPipelineRatio
     * @tc.desc          A half-invalid pipeline plan reports a 0.5 ratio.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run twenty requests alternating validity.
     *                   2. Build metrics.
     *                   3. Compare the ratio and fingerprint.
     * @tc.expected      Ten handled, ten rejected and ratio 0.5.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationPipelineRatio', 0, () => {
      const stub = new StubRemoteObjectModel();
      for (let index = 0; index < 20; index++) {
        const code = index % 2 === 0 ? REQUEST_CODE : UNKNOWN_CODE_ZERO;
        runPipeline(stub, code, 'ratio-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(20);
      expect(metrics.handled).assertEqual(10);
      expect(metrics.rejected).assertEqual(10);
      expect(metrics.successRatio()).assertEqual(0.5);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('20:10:10:10'));
      expect(metrics.replies).assertEqual(10);
    });

    /**
     * @tc.name          pipelineIntegrationFingerprintFromCounts
     * @tc.desc          A twelve-run plan produces the exact metric fingerprint.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Reject every fourth run.
     *                   2. Build metrics.
     *                   3. Compare the fingerprint literal.
     * @tc.expected      The fingerprint equals the hash of 12:9:3:9.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationFingerprintFromCounts', 0, () => {
      const stub = new StubRemoteObjectModel();
      for (let index = 0; index < 12; index++) {
        const code = index % 4 === 0 ? UNKNOWN_CODE_LARGE : REQUEST_CODE;
        runPipeline(stub, code, 'fp-' + String(index));
      }
      const metrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(12);
      expect(metrics.handled).assertEqual(9);
      expect(metrics.rejected).assertEqual(3);
      expect(metrics.replies).assertEqual(9);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('12:9:3:9'));
      expect(metrics.successRatio()).assertEqual(0.75);
    });

    /**
     * @tc.name          pipelineIntegrationRejectedPipelineHasNoReply
     * @tc.desc          Rejected pipelines leave the reply sequence empty.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run three unknown codes.
     *                   2. Read each reply size and decode.
     *                   3. Inspect the ledger rows.
     * @tc.expected      Every reply size is zero and every decode is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationRejectedPipelineHasNoReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      const codes: number[] = [UNKNOWN_CODE_ZERO, UNKNOWN_CODE_TWO, UNKNOWN_CODE_NEGATIVE];
      for (let index = 0; index < codes.length; index++) {
        const run = runPipeline(stub, codes[index], 'rejected-' + String(index));
        expect(run.replySize).assertEqual(0);
        expect(run.decoded).assertEqual('');
        expect(run.replyWritten).assertFalse();
      }
      expect(stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(stub).replies).assertEqual(0);
      expect(StubMetrics.from(stub).rejected).assertEqual(3);
    });

    /**
     * @tc.name          pipelineIntegrationHandledPipelineHasReply
     * @tc.desc          Handled pipelines always carry one reply.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run three valid pipelines.
     *                   2. Read each reply size.
     *                   3. Compare with the metrics reply count.
     * @tc.expected      Every reply size reads one and metrics report three replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationHandledPipelineHasReply', 0, () => {
      const stub = new StubRemoteObjectModel();
      for (let index = 0; index < 3; index++) {
        const run = runPipeline(stub, REQUEST_CODE, 'handled-' + String(index));
        expect(run.replySize).assertEqual(1);
        expect(run.replyWritten).assertTrue();
        expect(run.decoded).assertEqual(REPLY_PAYLOAD);
      }
      expect(stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(stub).replies).assertEqual(3);
      expect(StubMetrics.from(stub).handled).assertEqual(3);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationTwoClientsPipeline
     * @tc.desc          Two clients share a pipeline stub with isolated result lists.
     * @tc.precondition  A shared stub and two clients exist.
     * @tc.steps         1. Send three requests from each client.
     *                   2. Compare client reply lists.
     *                   3. Inspect the shared ledger.
     * @tc.expected      Each client holds three replies and the stub holds six rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationTwoClientsPipeline', 0, () => {
      const stub = new StubRemoteObjectModel();
      const first = new InProcessClient(stub);
      const second = new InProcessClient(stub);
      first.sendMany(3);
      second.sendMany(3);
      expect(first.replies.length).assertEqual(3);
      expect(second.replies.length).assertEqual(3);
      expect(stub.requestCount()).assertEqual(6);
      expect(stub.requests[0].text).assertEqual(REQUEST_PAYLOAD);
      expect(StubMetrics.from(stub).replies).assertEqual(6);
      expect(first.trace()).assertEqual(second.trace());
    });

    /**
     * @tc.name          pipelineIntegrationParallelPipelines
     * @tc.desc          Interleaved pipelines preserve per-run stage traces.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run a success and a failure alternately.
     *                   2. Collect each trace.
     *                   3. Compare all four traces.
     * @tc.expected      Success and failure traces repeat without contamination.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationParallelPipelines', 0, () => {
      const stub = new StubRemoteObjectModel();
      const successTrace = runPipeline(stub, REQUEST_CODE, 'p1').stageTrace();
      const failureTrace = runPipeline(stub, UNKNOWN_CODE_ZERO, 'p2').stageTrace();
      const secondSuccess = runPipeline(stub, REQUEST_CODE, 'p3').stageTrace();
      const secondFailure = runPipeline(stub, UNKNOWN_CODE_TWO, 'p4').stageTrace();
      expect(successTrace).assertEqual(secondSuccess);
      expect(failureTrace).assertEqual(secondFailure);
      expect(successTrace).assertEqual('encode>dispatch>handle>reply>decode');
      expect(failureTrace).assertEqual('encode>dispatch>handle>decode');
      expect(successTrace === failureTrace).assertFalse();
      expect(stub.requestCount()).assertEqual(4);
    });

    /**
     * @tc.name          pipelineIntegrationPipelineIsolation
     * @tc.desc          Pipelines on separate stubs never share ledger rows.
     * @tc.precondition  Two stubs are prepared.
     * @tc.steps         1. Run two pipelines on the first stub.
     *                   2. Run one on the second.
     *                   3. Compare both ledgers.
     * @tc.expected      The stubs hold two and one rows respectively.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationPipelineIsolation', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      runPipeline(firstStub, REQUEST_CODE, 'isolated-1');
      runPipeline(firstStub, REQUEST_CODE, 'isolated-2');
      runPipeline(secondStub, REQUEST_CODE, 'isolated-3');
      expect(firstStub.requestCount()).assertEqual(2);
      expect(secondStub.requestCount()).assertEqual(1);
      expect(firstStub.requests[1].text).assertEqual('isolated-2');
      expect(secondStub.requests[0].text).assertEqual('isolated-3');
      expect(StubMetrics.from(firstStub).requests).assertEqual(2);
      expect(StubMetrics.from(secondStub).requests).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationPipelineReset
     * @tc.desc          Resetting the stub clears the pipeline ledger between batches.
     * @tc.precondition  A stub has run a batch.
     * @tc.steps         1. Run five pipelines.
     *                   2. Reset the stub.
     *                   3. Run two more and audit.
     * @tc.expected      Only the two new rows remain after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationPipelineReset', 0, () => {
      const stub = new StubRemoteObjectModel();
      for (let index = 0; index < 5; index++) {
        runPipeline(stub, REQUEST_CODE, 'before-reset-' + String(index));
      }
      stub.reset();
      expect(stub.requestCount()).assertEqual(0);
      runPipeline(stub, REQUEST_CODE, 'after-reset-1');
      runPipeline(stub, REQUEST_CODE, 'after-reset-2');
      expect(stub.requestCount()).assertEqual(2);
      expect(stub.requests[0].text).assertEqual('after-reset-1');
      expect(stub.requests[1].text).assertEqual('after-reset-2');
      expect(stub.requests.length).assertEqual(2);
      expect(StubMetrics.from(stub).requests).assertEqual(2);
    });

    /**
     * @tc.name          pipelineIntegrationPipelineReplay
     * @tc.desc          Replaying a pipeline batch reproduces the same metrics.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run a mixed batch and record metrics.
     *                   2. Reset and replay the batch.
     *                   3. Compare fingerprints.
     * @tc.expected      Both batch fingerprints match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationPipelineReplay', 0, () => {
      const stub = new StubRemoteObjectModel();
      for (let index = 0; index < 6; index++) {
        const code = index % 3 === 0 ? UNKNOWN_CODE_ZERO : REQUEST_CODE;
        runPipeline(stub, code, 'replay-' + String(index));
      }
      const first = StubMetrics.from(stub).fingerprint();
      stub.reset();
      for (let index = 0; index < 6; index++) {
        const code = index % 3 === 0 ? UNKNOWN_CODE_ZERO : REQUEST_CODE;
        runPipeline(stub, code, 'replay-' + String(index));
      }
      const second = StubMetrics.from(stub).fingerprint();
      expect(first).assertEqual(second);
      expect(first).assertEqual(textFingerprint('6:4:2:4'));
      expect(StubMetrics.from(stub).requests).assertEqual(6);
      expect(StubMetrics.from(stub).handled).assertEqual(4);
      expect(stub.requests[5].text).assertEqual('replay-5');
    });

    /**
     * @tc.name          pipelineIntegrationStageCountsMatch
     * @tc.desc          Stage counts equal the number of runs and replies.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run eight pipelines with two failures.
     *                   2. Count encode, handle and reply stages.
     *                   3. Compare with metrics.
     * @tc.expected      Eight encodes, eight handles and six replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationStageCountsMatch', 0, () => {
      const stub = new StubRemoteObjectModel();
      let encodeCount = 0;
      let handleCount = 0;
      let replyCount = 0;
      for (let index = 0; index < 8; index++) {
        const code = index < 2 ? UNKNOWN_CODE_TWO : REQUEST_CODE;
        const run = runPipeline(stub, code, 'count-' + String(index));
        encodeCount = encodeCount + countOf(run.stages, 'encode');
        handleCount = handleCount + countOf(run.stages, 'handle');
        replyCount = replyCount + countOf(run.stages, 'reply');
      }
      expect(encodeCount).assertEqual(8);
      expect(handleCount).assertEqual(8);
      expect(replyCount).assertEqual(6);
      expect(StubMetrics.from(stub).replies).assertEqual(6);
      expect(StubMetrics.from(stub).requests).assertEqual(8);
      expect(StubMetrics.from(stub).rejected).assertEqual(2);
    });

    /**
     * @tc.name          pipelineIntegrationEncodeReadCursor
     * @tc.desc          Encoding does not move the data read cursor.
     * @tc.precondition  A message sequence is created.
     * @tc.steps         1. Write two strings.
     *                   2. Read the cursor and counters.
     *                   3. Read one string.
     * @tc.expected      The cursor stays zero after writes and moves to one after a read.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationEncodeReadCursor', 0, () => {
      const data = MessageSequenceModel.create();
      data.writeString('encode-one');
      data.writeString('encode-two');
      expect(data.cursor).assertEqual(0);
      expect(data.writeCount).assertEqual(2);
      expect(data.readCount).assertEqual(0);
      expect(data.size()).assertEqual(2);
      expect(data.readString()).assertEqual('encode-one');
      expect(data.cursor).assertEqual(1);
      expect(data.trace()).assertEqual('encode-one|encode-two#1');
    });

    /**
     * @tc.name          pipelineIntegrationDispatchCursorAfterRead
     * @tc.desc          The stub consumes exactly one data value per handled request.
     * @tc.precondition  A stub and a two-value sequence are prepared.
     * @tc.steps         1. Write two values.
     *                   2. Invoke the stub twice with the same sequence.
     *                   3. Read the cursor and row texts.
     * @tc.expected      The cursor reaches two and each row holds one value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationDispatchCursorAfterRead', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      data.writeString('dispatch-one');
      data.writeString('dispatch-two');
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), new MessageOptionModel());
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), new MessageOptionModel());
      expect(data.cursor).assertEqual(2);
      expect(data.readCount).assertEqual(2);
      expect(stub.requests[0].text).assertEqual('dispatch-one');
      expect(stub.requests[1].text).assertEqual('dispatch-two');
      expect(stub.requestCount()).assertEqual(2);
      expect(data.size()).assertEqual(2);
    });

    /**
     * @tc.name          pipelineIntegrationReplyCursorAfterWrite
     * @tc.desc          The reply write stage leaves the reply cursor at zero.
     * @tc.precondition  A stub and sequences are prepared.
     * @tc.steps         1. Invoke the stub.
     *                   2. Read the reply cursor before decoding.
     *                   3. Decode and read the cursor again.
     * @tc.expected      The cursor is zero before the decode and one afterwards.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationReplyCursorAfterWrite', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('cursor-request');
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(reply.cursor).assertEqual(0);
      expect(reply.writeCount).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.cursor).assertEqual(1);
      expect(reply.readCount).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationSequenceSizes
     * @tc.desc          Data and reply sequence sizes stay at one after a successful run.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run one pipeline.
     *                   2. Read both sequence sizes.
     *                   3. Read the internal counters.
     * @tc.expected      Both sizes read one with one write each.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationSequenceSizes', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      const reply = MessageSequenceModel.create();
      data.writeString('size-request');
      stub.onRemoteMessageRequest(REQUEST_CODE, data, reply, new MessageOptionModel());
      expect(data.size()).assertEqual(1);
      expect(reply.size()).assertEqual(1);
      expect(data.writeCount).assertEqual(1);
      expect(reply.writeCount).assertEqual(1);
      expect(stub.requestCount()).assertEqual(1);
      expect(reply.values[0]).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          pipelineIntegrationEmptyPayloadPipeline
     * @tc.desc          An empty payload still traverses the full pipeline.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run the pipeline with an empty payload.
     *                   2. Read the stage trace.
     *                   3. Inspect the decoded reply and row.
     * @tc.expected      All five stages run and the row text is empty.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationEmptyPayloadPipeline', 0, () => {
      const stub = new StubRemoteObjectModel();
      const run = runPipeline(stub, REQUEST_CODE, '');
      expect(run.encoded).assertTrue();
      expect(run.stages.length).assertEqual(5);
      expect(run.handled).assertTrue();
      expect(run.decoded).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].text).assertEqual('');
      expect(stub.requests[0].replyText).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          pipelineIntegrationLongPayloadPipeline
     * @tc.desc          A long payload traverses every stage without truncation.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Build a one-thousand-character payload.
     *                   2. Run the pipeline.
     *                   3. Compare the stored and decoded values.
     * @tc.expected      The row text length is one thousand and the reply is intact.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationLongPayloadPipeline', 0, () => {
      const stub = new StubRemoteObjectModel();
      let payload = '';
      for (let index = 0; index < 1000; index++) {
        payload = payload + 'p';
      }
      const run = runPipeline(stub, REQUEST_CODE, payload);
      expect(run.handled).assertTrue();
      expect(stub.requests[0].text.length).assertEqual(1000);
      expect(stub.requests[0].text).assertEqual(payload);
      expect(run.decoded).assertEqual(REPLY_PAYLOAD);
      expect(run.dataSize).assertEqual(1);
      expect(run.stages.length).assertEqual(5);
    });

    /**
     * @tc.name          pipelineIntegrationSpecialPayloadPipeline
     * @tc.desc          Separator characters survive every pipeline stage.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run a payload with pipes, hashes and commas.
     *                   2. Read the stored text.
     *                   3. Compare with the original.
     * @tc.expected      The stored text is unchanged by the pipeline.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationSpecialPayloadPipeline', 0, () => {
      const stub = new StubRemoteObjectModel();
      const special = 'pipe|hash#comma,text';
      const run = runPipeline(stub, REQUEST_CODE, special);
      expect(run.handled).assertTrue();
      expect(stub.requests[0].text).assertEqual(special);
      expect(stub.requests[0].text.length).assertEqual(20);
      expect(run.stages.length).assertEqual(5);
      expect(run.decoded).assertEqual(REPLY_PAYLOAD);
      expect(stub.requests[0].handled).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationCustomReplyPipeline
     * @tc.desc          A custom reply flows through the reply and decode stages.
     * @tc.precondition  A stub with a custom reply is prepared.
     * @tc.steps         1. Set the custom reply.
     *                   2. Run the pipeline.
     *                   3. Compare the decode and row.
     * @tc.expected      Both the decode and the row carry the custom reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationCustomReplyPipeline', 0, () => {
      const stub = new StubRemoteObjectModel();
      stub.replyText = 'pipeline-custom';
      const run = runPipeline(stub, REQUEST_CODE, 'custom-request');
      expect(run.handled).assertTrue();
      expect(run.replyWritten).assertTrue();
      expect(run.decoded).assertEqual('pipeline-custom');
      expect(stub.requests[0].replyText).assertEqual('pipeline-custom');
      expect(StubMetrics.from(stub).replies).assertEqual(1);
      expect(run.replySize).assertEqual(1);
    });

    /**
     * @tc.name          pipelineIntegrationRejectListPipeline
     * @tc.desc          A reject list blocks the handle stage before the reply.
     * @tc.precondition  A stub rejects code one.
     * @tc.steps         1. Add code one to the reject list.
     *                   2. Run the pipeline.
     *                   3. Read the trace and flags.
     * @tc.expected      The run fails with no reply stage.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationRejectListPipeline', 0, () => {
      const stub = new StubRemoteObjectModel();
      stub.rejectCodes = [REQUEST_CODE];
      const run = runPipeline(stub, REQUEST_CODE, 'blocked-request');
      expect(run.handled).assertFalse();
      expect(run.replyWritten).assertFalse();
      expect(run.replySize).assertEqual(0);
      expect(run.decoded).assertEqual('');
      expect(run.stageTrace()).assertEqual('encode>dispatch>handle>decode');
      expect(stub.requests[0].handled).assertFalse();
    });

    /**
     * @tc.name          pipelineIntegrationKillWindowPipeline
     * @tc.desc          A pipeline run during a kill window stops at the handle stage.
     * @tc.precondition  A stub has been killed mid-session.
     * @tc.steps         1. Kill the stub.
     *                   2. Run two pipelines.
     *                   3. Revive and run again.
     * @tc.expected      Two failures precede one success after revival.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationKillWindowPipeline', 0, () => {
      const stub = new StubRemoteObjectModel();
      stub.kill();
      const first = runPipeline(stub, REQUEST_CODE, 'dark-1');
      const second = runPipeline(stub, REQUEST_CODE, 'dark-2');
      stub.revive();
      const third = runPipeline(stub, REQUEST_CODE, 'lit');
      expect(first.handled).assertFalse();
      expect(second.handled).assertFalse();
      expect(third.handled).assertTrue();
      expect(third.decoded).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(stub).rejected).assertEqual(2);
    });

    /**
     * @tc.name          pipelineIntegrationServiceHostPipeline
     * @tc.desc          A service-hosted stub runs the pipeline normally.
     * @tc.precondition  A service is connected.
     * @tc.steps         1. Run four pipelines through the service stub.
     *                   2. Build metrics.
     *                   3. Read the service state.
     * @tc.expected      Four replies are produced while the service stays connected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationServiceHostPipeline', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      for (let index = 0; index < 4; index++) {
        const run = runPipeline(stub, REQUEST_CODE, 'hosted-' + String(index));
        expect(run.decoded).assertEqual(REPLY_PAYLOAD);
      }
      expect(stub.requestCount()).assertEqual(4);
      expect(StubMetrics.from(stub).replies).assertEqual(4);
      expect(service.state).assertEqual('connected');
      expect(service.connectCount).assertEqual(1);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
    });

    /**
     * @tc.name          pipelineIntegrationServicePipelineStageOrder
     * @tc.desc          Service events and pipeline stages coexist in the right order.
     * @tc.precondition  A service is created.
     * @tc.steps         1. Create, connect and run a pipeline.
     *                   2. Disconnect.
     *                   3. Compare the event trace.
     * @tc.expected      The service trace lists create, connect and disconnect only.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationServicePipelineStageOrder', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const run = runPipeline(stub, REQUEST_CODE, 'service-stage');
      service.onDisconnect();
      expect(run.stageTrace()).assertEqual('encode>dispatch>handle>reply>decode');
      expect(service.events.trace()).assertEqual('onCreate>onConnect:' + STUB_DESCRIPTOR + '>onDisconnect');
      expect(service.events.size()).assertEqual(3);
      expect(service.state).assertEqual('disconnected');
      expect(stub.requestCount()).assertEqual(1);
      expect(run.decoded).assertEqual(REPLY_PAYLOAD);
    });

    /**
     * @tc.name          pipelineIntegrationServiceDisconnectMidPipeline
     * @tc.desc          A pipeline started before disconnect still completes.
     * @tc.precondition  A connected service stub exists.
     * @tc.steps         1. Run one pipeline.
     *                   2. Disconnect the service.
     *                   3. Run a second pipeline.
     * @tc.expected      Both pipeline runs succeed regardless of the disconnect.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationServiceDisconnectMidPipeline', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      const first = runPipeline(stub, REQUEST_CODE, 'before');
      service.onDisconnect();
      const second = runPipeline(stub, REQUEST_CODE, 'after');
      expect(first.handled).assertTrue();
      expect(second.handled).assertTrue();
      expect(second.decoded).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(2);
      expect(service.disconnectCount).assertEqual(1);
      expect(service.isAlive()).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationServiceDestroyMidPipeline
     * @tc.desc          A pipeline still runs after the hosting service is destroyed.
     * @tc.precondition  A connected service stub exists.
     * @tc.steps         1. Destroy the service.
     *                   2. Run three pipelines through the old stub.
     *                   3. Build metrics.
     * @tc.expected      All three pipelines succeed with three replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationServiceDestroyMidPipeline', 0, () => {
      const service = new ServiceLifecycleModel();
      service.onCreate();
      const stub = service.onConnect();
      service.onDestroy();
      for (let index = 0; index < 3; index++) {
        const run = runPipeline(stub, REQUEST_CODE, 'post-destroy-' + String(index));
        expect(run.handled).assertTrue();
        expect(run.decoded).assertEqual(REPLY_PAYLOAD);
      }
      expect(service.isAlive()).assertFalse();
      expect(stub.requestCount()).assertEqual(3);
      expect(StubMetrics.from(stub).replies).assertEqual(3);
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationHundredPipelineRuns
     * @tc.desc          One hundred sequential pipeline runs keep exact counts.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run one hundred pipelines.
     *                   2. Count decoded replies and stages.
     *                   3. Build metrics.
     * @tc.expected      One hundred replies and five hundred stages are recorded.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationHundredPipelineRuns', 0, () => {
      const stub = new StubRemoteObjectModel();
      let decoded = 0;
      let stages = 0;
      for (let index = 0; index < 100; index++) {
        const run = runPipeline(stub, REQUEST_CODE, 'hundred-' + String(index));
        if (run.decoded === REPLY_PAYLOAD) {
          decoded = decoded + 1;
        }
        stages = stages + run.stages.length;
      }
      expect(decoded).assertEqual(100);
      expect(stages).assertEqual(500);
      expect(stub.requestCount()).assertEqual(100);
      expect(StubMetrics.from(stub).requests).assertEqual(100);
      expect(StubMetrics.from(stub).replies).assertEqual(100);
      expect(stub.requests[99].text).assertEqual('hundred-99');
    });

    /**
     * @tc.name          pipelineIntegrationFinalPipelineAudit
     * @tc.desc          The final pipeline audit reconciles stages, rows and metrics.
     * @tc.precondition  A mixed pipeline batch has completed.
     * @tc.steps         1. Run ten pipelines with two failures.
     *                   2. Recount handle and reply stages.
     *                   3. Compare with the ledger and metrics.
     * @tc.expected      Eight replies and eight handled rows agree across all views.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationFinalPipelineAudit', 0, () => {
      const stub = new StubRemoteObjectModel();
      let replies = 0;
      let handles = 0;
      for (let index = 0; index < 10; index++) {
        const code = index < 2 ? UNKNOWN_CODE_LARGE : REQUEST_CODE;
        const run = runPipeline(stub, code, 'audit-' + String(index));
        replies = replies + countOf(run.stages, 'reply');
        handles = handles + countOf(run.stages, 'handle');
      }
      let ledgerHandled = 0;
      for (let index = 0; index < stub.requests.length; index++) {
        if (stub.requests[index].handled) {
          ledgerHandled = ledgerHandled + 1;
        }
      }
      expect(replies).assertEqual(8);
      expect(handles).assertEqual(10);
      expect(ledgerHandled).assertEqual(8);
      expect(StubMetrics.from(stub).replies).assertEqual(8);
      expect(StubMetrics.from(stub).requests).assertEqual(10);
      expect(StubMetrics.from(stub).successRatio()).assertEqual(0.8);
    });

    /**
     * @tc.name          pipelineIntegrationDeterministicPipelineFingerprint
     * @tc.desc          Two identical pipeline plans produce identical metric sets.
     * @tc.precondition  Two stubs are prepared.
     * @tc.steps         1. Run the same eight-request plan on both.
     *                   2. Build both metrics.
     *                   3. Compare fingerprints and counts.
     * @tc.expected      Fingerprints and every counter match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationDeterministicPipelineFingerprint', 0, () => {
      const firstStub = new StubRemoteObjectModel();
      const secondStub = new StubRemoteObjectModel();
      for (let index = 0; index < 8; index++) {
        const code = index % 4 === 0 ? UNKNOWN_CODE_ZERO : REQUEST_CODE;
        runPipeline(firstStub, code, 'deterministic-' + String(index));
        runPipeline(secondStub, code, 'deterministic-' + String(index));
      }
      const firstMetrics = StubMetrics.from(firstStub);
      const secondMetrics = StubMetrics.from(secondStub);
      expect(firstMetrics.fingerprint()).assertEqual(secondMetrics.fingerprint());
      expect(firstMetrics.requests).assertEqual(8);
      expect(firstMetrics.handled).assertEqual(6);
      expect(firstMetrics.rejected).assertEqual(2);
      expect(firstMetrics.replies).assertEqual(6);
      expect(firstStub.requests[7].text).assertEqual(secondStub.requests[7].text);
    });

    /**
     * @tc.name          pipelineIntegrationReplySequenceReuse
     * @tc.desc          One reply sequence accumulates replies across two runs.
     * @tc.precondition  A stub and a shared reply sequence exist.
     * @tc.steps         1. Invoke the stub twice with the same reply sequence.
     *                   2. Read the sequence size.
     *                   3. Decode both replies in order.
     * @tc.expected      The reply sequence holds two stock replies.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationReplySequenceReuse', 0, () => {
      const stub = new StubRemoteObjectModel();
      const reply = MessageSequenceModel.create();
      const firstData = MessageSequenceModel.create();
      const secondData = MessageSequenceModel.create();
      firstData.writeString('first-run');
      secondData.writeString('second-run');
      stub.onRemoteMessageRequest(REQUEST_CODE, firstData, reply, new MessageOptionModel());
      stub.onRemoteMessageRequest(REQUEST_CODE, secondData, reply, new MessageOptionModel());
      expect(reply.size()).assertEqual(2);
      expect(reply.writeCount).assertEqual(2);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.readString()).assertEqual(REPLY_PAYLOAD);
      expect(reply.readString()).assertEqual('');
      expect(reply.cursor).assertEqual(2);
    });

    /**
     * @tc.name          pipelineIntegrationRequestSequenceRewind
     * @tc.desc          A rewound data sequence feeds the same payload twice.
     * @tc.precondition  A stub and a data sequence exist.
     * @tc.steps         1. Write one payload.
     *                   2. Run the stub and rewind.
     *                   3. Run again and compare rows.
     * @tc.expected      Both rows hold the same payload with one stored value.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationRequestSequenceRewind', 0, () => {
      const stub = new StubRemoteObjectModel();
      const data = MessageSequenceModel.create();
      data.writeString('rewind-payload');
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), new MessageOptionModel());
      data.rewind();
      stub.onRemoteMessageRequest(REQUEST_CODE, data, MessageSequenceModel.create(), new MessageOptionModel());
      expect(data.size()).assertEqual(1);
      expect(data.writeCount).assertEqual(1);
      expect(data.readCount).assertEqual(2);
      expect(stub.requests[0].text).assertEqual('rewind-payload');
      expect(stub.requests[1].text).assertEqual('rewind-payload');
      expect(stub.requestCount()).assertEqual(2);
    });

    /**
     * @tc.name          pipelineIntegrationStageTraceWithOptions
     * @tc.desc          Option choice does not alter the stage trace shape.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run with sync and async options.
     *                   2. Compare both traces.
     *                   3. Read the recorded options.
     * @tc.expected      Both traces are identical with different option rows.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationStageTraceWithOptions', 0, () => {
      const stub = new StubRemoteObjectModel();
      const syncRun = runPipeline(stub, REQUEST_CODE, 'sync', new MessageOptionModel(OPTION_FLAG_SYNC, 0, false));
      const asyncRun = runPipeline(stub, REQUEST_CODE, 'async', new MessageOptionModel(OPTION_FLAG_ASYNC, 4, false));
      expect(syncRun.stageTrace()).assertEqual(asyncRun.stageTrace());
      expect(syncRun.stageTrace()).assertEqual('encode>dispatch>handle>reply>decode');
      expect(stub.requests[0].option).assertEqual('0/0/false');
      expect(stub.requests[1].option).assertEqual('1/4/false');
      expect(stub.requestCount()).assertEqual(2);
      expect(StubMetrics.from(stub).handled).assertEqual(2);
    });

    /**
     * @tc.name          pipelineIntegrationResetKeepsDescriptor
     * @tc.desc          A pipeline reset leaves the stub descriptor unchanged.
     * @tc.precondition  A stub has run a pipeline batch.
     * @tc.steps         1. Run three pipelines.
     *                   2. Reset the stub.
     *                   3. Run one more and read the descriptor.
     * @tc.expected      The descriptor stays IPCStubTest before and after reset.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationResetKeepsDescriptor', 0, () => {
      const stub = new StubRemoteObjectModel();
      for (let index = 0; index < 3; index++) {
        runPipeline(stub, REQUEST_CODE, 'pre-reset-' + String(index));
      }
      const before = stub.descriptor;
      stub.reset();
      const run = runPipeline(stub, REQUEST_CODE, 'post-reset');
      expect(before).assertEqual(STUB_DESCRIPTOR);
      expect(stub.descriptor).assertEqual(STUB_DESCRIPTOR);
      expect(run.handled).assertTrue();
      expect(stub.requestCount()).assertEqual(1);
      expect(stub.requests[0].text).assertEqual('post-reset');
      expect(stub.alive).assertTrue();
    });

    /**
     * @tc.name          pipelineIntegrationFullStageAudit
     * @tc.desc          A final audit verifies every stage artifact for one run.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run one valid pipeline.
     *                   2. Verify each stage artifact independently.
     *                   3. Compare with the metrics.
     * @tc.expected      All five stage artifacts are present and consistent.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('pipelineIntegrationFullStageAudit', 0, () => {
      const stub = new StubRemoteObjectModel();
      const run = runPipeline(stub, REQUEST_CODE, 'final-audit');
      expect(run.stageTrace()).assertEqual('encode>dispatch>handle>reply>decode');
      expect(run.encoded).assertTrue();
      expect(run.handled).assertTrue();
      expect(run.decoded).assertEqual(REPLY_PAYLOAD);
      expect(stub.requestCount()).assertEqual(1);
      expect(StubMetrics.from(stub).fingerprint()).assertEqual(textFingerprint('1:1:0:1'));
    });

    /**
     * @tc.name          pipelineIntegrationBatchFingerprintStability
     * @tc.desc          Three identical pipeline batches share one metric fingerprint.
     * @tc.precondition  A stub is prepared.
     * @tc.steps         1. Run a five-request batch and fingerprint it.
     *                   2. Reset and repeat twice.
     *                   3. Compare all fingerprints.
     * @tc.expected      All three batch fingerprints match.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('pipelineIntegrationBatchFingerprintStability', 0, () => {
      const stub = new StubRemoteObjectModel();
      const fingerprints: number[] = [];
      for (let batch = 0; batch < 3; batch++) {
        stub.reset();
        for (let index = 0; index < 5; index++) {
          runPipeline(stub, REQUEST_CODE, 'batch-' + String(batch) + '-' + String(index));
        }
        fingerprints.push(StubMetrics.from(stub).fingerprint());
      }
      expect(fingerprints.length).assertEqual(3);
      expect(fingerprints[0]).assertEqual(fingerprints[1]);
      expect(fingerprints[1]).assertEqual(fingerprints[2]);
      expect(fingerprints[0]).assertEqual(textFingerprint('5:5:0:5'));
      expect(stub.requestCount()).assertEqual(5);
      expect(StubMetrics.from(stub).replies).assertEqual(5);
    });

    /**
     * @tc.name          pipelineIntegrationEmptyRunBeforeAnyStage
     * @tc.desc          A pipeline result object starts with no stages or reply.
     * @tc.precondition  A pipeline result object is constructed.
     * @tc.steps         1. Create an empty run.
     *                   2. Read the stage trace and flags.
     *                   3. Send it through a real pipeline.
     * @tc.expected      The empty run reports zero stages and a blank reply.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL3
     */
    it('pipelineIntegrationEmptyRunBeforeAnyStage', 0, () => {
      const emptyRun = new PipelineRun();
      expect(emptyRun.stages.length).assertEqual(0);
      expect(emptyRun.stageTrace()).assertEqual('');
      expect(emptyRun.handled).assertFalse();
      expect(emptyRun.replySize).assertEqual(0);
      expect(emptyRun.decoded).assertEqual('');
      const stub = new StubRemoteObjectModel();
      const realRun = runPipeline(stub, REQUEST_CODE, 'real');
      expect(realRun.stages.length).assertEqual(5);
      expect(realRun.decoded).assertEqual(REPLY_PAYLOAD);
    });
  });
}
