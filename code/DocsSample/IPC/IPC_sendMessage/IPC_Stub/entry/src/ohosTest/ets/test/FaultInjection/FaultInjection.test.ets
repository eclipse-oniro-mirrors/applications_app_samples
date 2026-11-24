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
  STUB_DESCRIPTOR, REQUEST_PAYLOAD, REPLY_PAYLOAD, ERROR_NONE, ERROR_STUB_REJECTED,
  ERROR_STUB_NOT_ALIVE, ERROR_SEQUENCE_RECLAIMED, MessageSequenceModel, MessageOptionModel,
  StubRemoteObjectModel, InProcessClient, StubMetrics, replayCodes
} from '../Shared/SharedDriver';

const REASON_NONE: string = 'none';
const REASON_NOT_ALIVE: string = 'not-alive';
const REASON_REJECTED: string = 'rejected';
const REASON_SEQUENCE: string = 'sequence';
const REASON_UNHANDLED: string = 'unhandled';

class FaultRun {
  public handled: boolean;
  public code: number;
  public text: string;
  public replyText: string;
  public records: number;
  public alive: boolean;
  public reason: string;
  public aliveBefore: boolean;

  constructor(handled: boolean, code: number, text: string, replyText: string, records: number,
    alive: boolean, reason: string, aliveBefore: boolean) {
    this.handled = handled;
    this.code = code;
    this.text = text;
    this.replyText = replyText;
    this.records = records;
    this.alive = alive;
    this.reason = reason;
    this.aliveBefore = aliveBefore;
  }

  public errCode(): number {
    return faultError(this.reason, this.handled);
  }

  public token(): string {
    return this.reason + '|' + String(this.errCode()) + '|' + String(this.handled);
  }
}

function faultError(reason: string, handled: boolean): number {
  if (reason === REASON_NOT_ALIVE) {
    return ERROR_STUB_NOT_ALIVE;
  }
  if (reason === REASON_REJECTED || reason === REASON_UNHANDLED) {
    return ERROR_STUB_REJECTED;
  }
  if (reason === REASON_SEQUENCE) {
    return handled ? ERROR_NONE : ERROR_SEQUENCE_RECLAIMED;
  }
  return ERROR_NONE;
}

function runRequest(stub: StubRemoteObjectModel, code: number, payload: string = REQUEST_PAYLOAD,
  breakData: boolean = false, breakReply: boolean = false, emptyData: boolean = false): FaultRun {
  const aliveBefore: boolean = stub.alive;
  const rejected: boolean = stub.rejectCodes.indexOf(code) >= 0;
  const data: MessageSequenceModel = MessageSequenceModel.create();
  const reply: MessageSequenceModel = MessageSequenceModel.create();
  if (!emptyData) {
    data.writeString(payload);
  }
  if (breakData) {
    data.reclaim();
  }
  if (breakReply) {
    reply.reclaim();
  }
  const handled: boolean = stub.onRemoteMessageRequest(code, data, reply, new MessageOptionModel());
  let reason = REASON_NONE;
  if (!aliveBefore) {
    reason = REASON_NOT_ALIVE;
  } else if (rejected) {
    reason = REASON_REJECTED;
  } else if (breakReply || breakData) {
    reason = REASON_SEQUENCE;
  } else if (!handled) {
    reason = REASON_UNHANDLED;
  }
  const text: string = data.readString();
  const replyText: string = reply.readString();
  return new FaultRun(handled, code, text, replyText, stub.requestCount(), stub.alive, reason, aliveBefore);
}

function freshStub(): StubRemoteObjectModel {
  return new StubRemoteObjectModel(STUB_DESCRIPTOR);
}

function rejectList(code: number): number[] {
  const codes: number[] = [];
  codes.push(code);
  return codes;
}

export default function faultInjection(): void {
  describe('FaultInjectionTest', () => {
    beforeAll(() => {
      logSuite('FaultInjectionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('FaultInjectionTest', 'end');
    });

    /**
     * @tc.name          faultInjectionKillRefusesProductionCode
     * @tc.desc          A killed stub refuses production code with the not-alive error before reading data.
     * @tc.precondition  The stub is killed before the request is dispatched.
     * @tc.steps         1. Kill the stub and confirm it is not alive.
     *                   2. Run the request and read the reason and error code.
     *                   3. Inspect the ledger and metrics.
     *                   4. Revive the stub and run the request again.
     * @tc.expected      The dead stub records the attempt, returns the not-alive error, and recovers after revival.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionKillRefusesProductionCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.kill();
      const first: FaultRun = runRequest(stub, 1);
      expect(stub.alive).assertFalse();
      expect(first.aliveBefore).assertFalse();
      expect(first.handled).assertFalse();
      expect(first.reason).assertEqual(REASON_NOT_ALIVE);
      expect(first.errCode()).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(first.replyText).assertEqual("");
      expect(first.records).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      stub.revive();
      const second: FaultRun = runRequest(stub, 1);
      expect(second.alive).assertTrue();
      expect(second.reason).assertEqual(REASON_NONE);
      expect(second.records).assertEqual(2);
      logStep("faultInjectionKillRefusesProductionCode", first.token() + ">" + second.token());
    });

    /**
     * @tc.name          faultInjectionKillRefusesZeroCode
     * @tc.desc          A killed stub refuses zero code with the not-alive error before reading data.
     * @tc.precondition  The stub is killed before the request is dispatched.
     * @tc.steps         1. Kill the stub and confirm it is not alive.
     *                   2. Run the request and read the reason and error code.
     *                   3. Inspect the ledger and metrics.
     *                   4. Revive the stub and run the request again.
     * @tc.expected      The dead stub records the attempt, returns the not-alive error, and recovers after revival.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionKillRefusesZeroCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.kill();
      const first: FaultRun = runRequest(stub, 0);
      expect(stub.alive).assertFalse();
      expect(first.aliveBefore).assertFalse();
      expect(first.handled).assertFalse();
      expect(first.reason).assertEqual(REASON_NOT_ALIVE);
      expect(first.errCode()).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(first.replyText).assertEqual("");
      expect(first.records).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      stub.revive();
      const second: FaultRun = runRequest(stub, 0);
      expect(second.alive).assertTrue();
      expect(second.reason).assertEqual(REASON_UNHANDLED);
      expect(second.records).assertEqual(2);
      logStep("faultInjectionKillRefusesZeroCode", first.token() + ">" + second.token());
    });

    /**
     * @tc.name          faultInjectionKillRefusesTwoCode
     * @tc.desc          A killed stub refuses two code with the not-alive error before reading data.
     * @tc.precondition  The stub is killed before the request is dispatched.
     * @tc.steps         1. Kill the stub and confirm it is not alive.
     *                   2. Run the request and read the reason and error code.
     *                   3. Inspect the ledger and metrics.
     *                   4. Revive the stub and run the request again.
     * @tc.expected      The dead stub records the attempt, returns the not-alive error, and recovers after revival.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionKillRefusesTwoCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.kill();
      const first: FaultRun = runRequest(stub, 2);
      expect(stub.alive).assertFalse();
      expect(first.aliveBefore).assertFalse();
      expect(first.handled).assertFalse();
      expect(first.reason).assertEqual(REASON_NOT_ALIVE);
      expect(first.errCode()).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(first.replyText).assertEqual("");
      expect(first.records).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      stub.revive();
      const second: FaultRun = runRequest(stub, 2);
      expect(second.alive).assertTrue();
      expect(second.reason).assertEqual(REASON_UNHANDLED);
      expect(second.records).assertEqual(2);
      logStep("faultInjectionKillRefusesTwoCode", first.token() + ">" + second.token());
    });

    /**
     * @tc.name          faultInjectionKillRefusesLargeCode
     * @tc.desc          A killed stub refuses large code with the not-alive error before reading data.
     * @tc.precondition  The stub is killed before the request is dispatched.
     * @tc.steps         1. Kill the stub and confirm it is not alive.
     *                   2. Run the request and read the reason and error code.
     *                   3. Inspect the ledger and metrics.
     *                   4. Revive the stub and run the request again.
     * @tc.expected      The dead stub records the attempt, returns the not-alive error, and recovers after revival.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionKillRefusesLargeCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.kill();
      const first: FaultRun = runRequest(stub, 99);
      expect(stub.alive).assertFalse();
      expect(first.aliveBefore).assertFalse();
      expect(first.handled).assertFalse();
      expect(first.reason).assertEqual(REASON_NOT_ALIVE);
      expect(first.errCode()).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(first.replyText).assertEqual("");
      expect(first.records).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      stub.revive();
      const second: FaultRun = runRequest(stub, 99);
      expect(second.alive).assertTrue();
      expect(second.reason).assertEqual(REASON_UNHANDLED);
      expect(second.records).assertEqual(2);
      logStep("faultInjectionKillRefusesLargeCode", first.token() + ">" + second.token());
    });

    /**
     * @tc.name          faultInjectionKillRefusesNegativeCode
     * @tc.desc          A killed stub refuses negative code with the not-alive error before reading data.
     * @tc.precondition  The stub is killed before the request is dispatched.
     * @tc.steps         1. Kill the stub and confirm it is not alive.
     *                   2. Run the request and read the reason and error code.
     *                   3. Inspect the ledger and metrics.
     *                   4. Revive the stub and run the request again.
     * @tc.expected      The dead stub records the attempt, returns the not-alive error, and recovers after revival.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionKillRefusesNegativeCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.kill();
      const first: FaultRun = runRequest(stub, -1);
      expect(stub.alive).assertFalse();
      expect(first.aliveBefore).assertFalse();
      expect(first.handled).assertFalse();
      expect(first.reason).assertEqual(REASON_NOT_ALIVE);
      expect(first.errCode()).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(first.replyText).assertEqual("");
      expect(first.records).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      stub.revive();
      const second: FaultRun = runRequest(stub, -1);
      expect(second.alive).assertTrue();
      expect(second.reason).assertEqual(REASON_UNHANDLED);
      expect(second.records).assertEqual(2);
      logStep("faultInjectionKillRefusesNegativeCode", first.token() + ">" + second.token());
    });

    /**
     * @tc.name          faultInjectionKillRefusesSevenCode
     * @tc.desc          A killed stub refuses seven code with the not-alive error before reading data.
     * @tc.precondition  The stub is killed before the request is dispatched.
     * @tc.steps         1. Kill the stub and confirm it is not alive.
     *                   2. Run the request and read the reason and error code.
     *                   3. Inspect the ledger and metrics.
     *                   4. Revive the stub and run the request again.
     * @tc.expected      The dead stub records the attempt, returns the not-alive error, and recovers after revival.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL1
     */
    it('faultInjectionKillRefusesSevenCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.kill();
      const first: FaultRun = runRequest(stub, 7);
      expect(stub.alive).assertFalse();
      expect(first.aliveBefore).assertFalse();
      expect(first.handled).assertFalse();
      expect(first.reason).assertEqual(REASON_NOT_ALIVE);
      expect(first.errCode()).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(first.replyText).assertEqual("");
      expect(first.records).assertEqual(1);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      stub.revive();
      const second: FaultRun = runRequest(stub, 7);
      expect(second.alive).assertTrue();
      expect(second.reason).assertEqual(REASON_UNHANDLED);
      expect(second.records).assertEqual(2);
      logStep("faultInjectionKillRefusesSevenCode", first.token() + ">" + second.token());
    });

    /**
     * @tc.name          faultInjectionRejectsProductionCode
     * @tc.desc          Request code 1 on the reject list is refused with production code.
     * @tc.precondition  The stub reject list is seeded with the request code.
     * @tc.steps         1. Seed the reject list with the code.
     *                   2. Run the request and read the rejection reason.
     *                   3. Clear the list and run the same code again.
     *                   4. Compare the two outcomes with the code oracle.
     * @tc.expected      The seeded attempt is rejected and the cleared attempt follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRejectsProductionCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.rejectCodes = rejectList(1);
      const blocked: FaultRun = runRequest(stub, 1);
      expect(stub.alive).assertTrue();
      expect(blocked.handled).assertFalse();
      expect(blocked.reason).assertEqual(REASON_REJECTED);
      expect(blocked.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(blocked.replyText).assertEqual("");
      expect(blocked.records).assertEqual(1);
      expect(stub.rejectCodes.indexOf(1) >= 0).assertTrue();
      stub.rejectCodes = [];
      const allowed: FaultRun = runRequest(stub, 1);
      expect(allowed.handled).assertEqual(true);
      expect(allowed.reason).assertEqual(REASON_NONE);
      expect(allowed.records).assertEqual(2);
      logStep("faultInjectionRejectsProductionCode", blocked.token() + ">" + allowed.token());
    });

    /**
     * @tc.name          faultInjectionRejectsZeroCode
     * @tc.desc          Request code 0 on the reject list is refused with zero code.
     * @tc.precondition  The stub reject list is seeded with the request code.
     * @tc.steps         1. Seed the reject list with the code.
     *                   2. Run the request and read the rejection reason.
     *                   3. Clear the list and run the same code again.
     *                   4. Compare the two outcomes with the code oracle.
     * @tc.expected      The seeded attempt is rejected and the cleared attempt follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRejectsZeroCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.rejectCodes = rejectList(0);
      const blocked: FaultRun = runRequest(stub, 0);
      expect(stub.alive).assertTrue();
      expect(blocked.handled).assertFalse();
      expect(blocked.reason).assertEqual(REASON_REJECTED);
      expect(blocked.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(blocked.replyText).assertEqual("");
      expect(blocked.records).assertEqual(1);
      expect(stub.rejectCodes.indexOf(0) >= 0).assertTrue();
      stub.rejectCodes = [];
      const allowed: FaultRun = runRequest(stub, 0);
      expect(allowed.handled).assertEqual(false);
      expect(allowed.reason).assertEqual(REASON_UNHANDLED);
      expect(allowed.records).assertEqual(2);
      logStep("faultInjectionRejectsZeroCode", blocked.token() + ">" + allowed.token());
    });

    /**
     * @tc.name          faultInjectionRejectsTwoCode
     * @tc.desc          Request code 2 on the reject list is refused with two code.
     * @tc.precondition  The stub reject list is seeded with the request code.
     * @tc.steps         1. Seed the reject list with the code.
     *                   2. Run the request and read the rejection reason.
     *                   3. Clear the list and run the same code again.
     *                   4. Compare the two outcomes with the code oracle.
     * @tc.expected      The seeded attempt is rejected and the cleared attempt follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRejectsTwoCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.rejectCodes = rejectList(2);
      const blocked: FaultRun = runRequest(stub, 2);
      expect(stub.alive).assertTrue();
      expect(blocked.handled).assertFalse();
      expect(blocked.reason).assertEqual(REASON_REJECTED);
      expect(blocked.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(blocked.replyText).assertEqual("");
      expect(blocked.records).assertEqual(1);
      expect(stub.rejectCodes.indexOf(2) >= 0).assertTrue();
      stub.rejectCodes = [];
      const allowed: FaultRun = runRequest(stub, 2);
      expect(allowed.handled).assertEqual(false);
      expect(allowed.reason).assertEqual(REASON_UNHANDLED);
      expect(allowed.records).assertEqual(2);
      logStep("faultInjectionRejectsTwoCode", blocked.token() + ">" + allowed.token());
    });

    /**
     * @tc.name          faultInjectionRejectsNegativeCode
     * @tc.desc          Request code -1 on the reject list is refused with negative code.
     * @tc.precondition  The stub reject list is seeded with the request code.
     * @tc.steps         1. Seed the reject list with the code.
     *                   2. Run the request and read the rejection reason.
     *                   3. Clear the list and run the same code again.
     *                   4. Compare the two outcomes with the code oracle.
     * @tc.expected      The seeded attempt is rejected and the cleared attempt follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRejectsNegativeCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.rejectCodes = rejectList(-1);
      const blocked: FaultRun = runRequest(stub, -1);
      expect(stub.alive).assertTrue();
      expect(blocked.handled).assertFalse();
      expect(blocked.reason).assertEqual(REASON_REJECTED);
      expect(blocked.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(blocked.replyText).assertEqual("");
      expect(blocked.records).assertEqual(1);
      expect(stub.rejectCodes.indexOf(-1) >= 0).assertTrue();
      stub.rejectCodes = [];
      const allowed: FaultRun = runRequest(stub, -1);
      expect(allowed.handled).assertEqual(false);
      expect(allowed.reason).assertEqual(REASON_UNHANDLED);
      expect(allowed.records).assertEqual(2);
      logStep("faultInjectionRejectsNegativeCode", blocked.token() + ">" + allowed.token());
    });

    /**
     * @tc.name          faultInjectionRejectsLargeCode
     * @tc.desc          Request code 99 on the reject list is refused with large code.
     * @tc.precondition  The stub reject list is seeded with the request code.
     * @tc.steps         1. Seed the reject list with the code.
     *                   2. Run the request and read the rejection reason.
     *                   3. Clear the list and run the same code again.
     *                   4. Compare the two outcomes with the code oracle.
     * @tc.expected      The seeded attempt is rejected and the cleared attempt follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRejectsLargeCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.rejectCodes = rejectList(99);
      const blocked: FaultRun = runRequest(stub, 99);
      expect(stub.alive).assertTrue();
      expect(blocked.handled).assertFalse();
      expect(blocked.reason).assertEqual(REASON_REJECTED);
      expect(blocked.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(blocked.replyText).assertEqual("");
      expect(blocked.records).assertEqual(1);
      expect(stub.rejectCodes.indexOf(99) >= 0).assertTrue();
      stub.rejectCodes = [];
      const allowed: FaultRun = runRequest(stub, 99);
      expect(allowed.handled).assertEqual(false);
      expect(allowed.reason).assertEqual(REASON_UNHANDLED);
      expect(allowed.records).assertEqual(2);
      logStep("faultInjectionRejectsLargeCode", blocked.token() + ">" + allowed.token());
    });

    /**
     * @tc.name          faultInjectionRejectsSevenCode
     * @tc.desc          Request code 7 on the reject list is refused with seven code.
     * @tc.precondition  The stub reject list is seeded with the request code.
     * @tc.steps         1. Seed the reject list with the code.
     *                   2. Run the request and read the rejection reason.
     *                   3. Clear the list and run the same code again.
     *                   4. Compare the two outcomes with the code oracle.
     * @tc.expected      The seeded attempt is rejected and the cleared attempt follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRejectsSevenCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.rejectCodes = rejectList(7);
      const blocked: FaultRun = runRequest(stub, 7);
      expect(stub.alive).assertTrue();
      expect(blocked.handled).assertFalse();
      expect(blocked.reason).assertEqual(REASON_REJECTED);
      expect(blocked.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(blocked.replyText).assertEqual("");
      expect(blocked.records).assertEqual(1);
      expect(stub.rejectCodes.indexOf(7) >= 0).assertTrue();
      stub.rejectCodes = [];
      const allowed: FaultRun = runRequest(stub, 7);
      expect(allowed.handled).assertEqual(false);
      expect(allowed.reason).assertEqual(REASON_UNHANDLED);
      expect(allowed.records).assertEqual(2);
      logStep("faultInjectionRejectsSevenCode", blocked.token() + ">" + allowed.token());
    });

    /**
     * @tc.name          faultInjectionRejectsThreeCode
     * @tc.desc          Request code 3 on the reject list is refused with three code.
     * @tc.precondition  The stub reject list is seeded with the request code.
     * @tc.steps         1. Seed the reject list with the code.
     *                   2. Run the request and read the rejection reason.
     *                   3. Clear the list and run the same code again.
     *                   4. Compare the two outcomes with the code oracle.
     * @tc.expected      The seeded attempt is rejected and the cleared attempt follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRejectsThreeCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.rejectCodes = rejectList(3);
      const blocked: FaultRun = runRequest(stub, 3);
      expect(stub.alive).assertTrue();
      expect(blocked.handled).assertFalse();
      expect(blocked.reason).assertEqual(REASON_REJECTED);
      expect(blocked.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(blocked.replyText).assertEqual("");
      expect(blocked.records).assertEqual(1);
      expect(stub.rejectCodes.indexOf(3) >= 0).assertTrue();
      stub.rejectCodes = [];
      const allowed: FaultRun = runRequest(stub, 3);
      expect(allowed.handled).assertEqual(false);
      expect(allowed.reason).assertEqual(REASON_UNHANDLED);
      expect(allowed.records).assertEqual(2);
      logStep("faultInjectionRejectsThreeCode", blocked.token() + ">" + allowed.token());
    });

    /**
     * @tc.name          faultInjectionRejectsFortyTwoCode
     * @tc.desc          Request code 42 on the reject list is refused with forty two code.
     * @tc.precondition  The stub reject list is seeded with the request code.
     * @tc.steps         1. Seed the reject list with the code.
     *                   2. Run the request and read the rejection reason.
     *                   3. Clear the list and run the same code again.
     *                   4. Compare the two outcomes with the code oracle.
     * @tc.expected      The seeded attempt is rejected and the cleared attempt follows the single-code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRejectsFortyTwoCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.rejectCodes = rejectList(42);
      const blocked: FaultRun = runRequest(stub, 42);
      expect(stub.alive).assertTrue();
      expect(blocked.handled).assertFalse();
      expect(blocked.reason).assertEqual(REASON_REJECTED);
      expect(blocked.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(blocked.replyText).assertEqual("");
      expect(blocked.records).assertEqual(1);
      expect(stub.rejectCodes.indexOf(42) >= 0).assertTrue();
      stub.rejectCodes = [];
      const allowed: FaultRun = runRequest(stub, 42);
      expect(allowed.handled).assertEqual(false);
      expect(allowed.reason).assertEqual(REASON_UNHANDLED);
      expect(allowed.records).assertEqual(2);
      logStep("faultInjectionRejectsFortyTwoCode", blocked.token() + ">" + allowed.token());
    });

    /**
     * @tc.name          faultInjectionDataBreakOnProductionCode
     * @tc.desc          A reclaimed request sequence for production code yields an empty read.
     * @tc.precondition  The data sequence is reclaimed immediately before dispatch.
     * @tc.steps         1. Write a payload and reclaim the data sequence.
     *                   2. Run request code 1 and read the echoed text.
     *                   3. Check the sequence and handled flags.
     *                   4. Inspect the ledger entry and metrics.
     * @tc.expected      The stub reads an empty string while the reply path is unaffected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionDataBreakOnProductionCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 1, REQUEST_PAYLOAD, true, false, false);
      expect(run.reason).assertEqual(REASON_SEQUENCE);
      expect(run.handled).assertEqual(true);
      expect(run.errCode()).assertEqual(ERROR_NONE);
      expect(run.text).assertEqual("");
      expect(run.replyText).assertEqual(REPLY_PAYLOAD);
      expect(run.records).assertEqual(1);
      expect(run.alive).assertTrue();
      const record = stub.lastRequest();
      expect(record?.text).assertEqual("");
      expect(record?.code).assertEqual(1);
      expect(stub.requests[0].handled).assertEqual(true);
      logStep("faultInjectionDataBreakOnProductionCode", run.token());
    });

    /**
     * @tc.name          faultInjectionDataBreakOnZeroCode
     * @tc.desc          A reclaimed request sequence for zero code yields an empty read.
     * @tc.precondition  The data sequence is reclaimed immediately before dispatch.
     * @tc.steps         1. Write a payload and reclaim the data sequence.
     *                   2. Run request code 0 and read the echoed text.
     *                   3. Check the sequence and handled flags.
     *                   4. Inspect the ledger entry and metrics.
     * @tc.expected      The stub reads an empty string while the reply path is unaffected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionDataBreakOnZeroCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 0, REQUEST_PAYLOAD, true, false, false);
      expect(run.reason).assertEqual(REASON_SEQUENCE);
      expect(run.handled).assertEqual(false);
      expect(run.errCode()).assertEqual(ERROR_SEQUENCE_RECLAIMED);
      expect(run.text).assertEqual("");
      expect(run.replyText).assertEqual("");
      expect(run.records).assertEqual(1);
      expect(run.alive).assertTrue();
      const record = stub.lastRequest();
      expect(record?.text).assertEqual("");
      expect(record?.code).assertEqual(0);
      expect(stub.requests[0].handled).assertEqual(false);
      logStep("faultInjectionDataBreakOnZeroCode", run.token());
    });

    /**
     * @tc.name          faultInjectionDataBreakOnTwoCode
     * @tc.desc          A reclaimed request sequence for two code yields an empty read.
     * @tc.precondition  The data sequence is reclaimed immediately before dispatch.
     * @tc.steps         1. Write a payload and reclaim the data sequence.
     *                   2. Run request code 2 and read the echoed text.
     *                   3. Check the sequence and handled flags.
     *                   4. Inspect the ledger entry and metrics.
     * @tc.expected      The stub reads an empty string while the reply path is unaffected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionDataBreakOnTwoCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 2, REQUEST_PAYLOAD, true, false, false);
      expect(run.reason).assertEqual(REASON_SEQUENCE);
      expect(run.handled).assertEqual(false);
      expect(run.errCode()).assertEqual(ERROR_SEQUENCE_RECLAIMED);
      expect(run.text).assertEqual("");
      expect(run.replyText).assertEqual("");
      expect(run.records).assertEqual(1);
      expect(run.alive).assertTrue();
      const record = stub.lastRequest();
      expect(record?.text).assertEqual("");
      expect(record?.code).assertEqual(2);
      expect(stub.requests[0].handled).assertEqual(false);
      logStep("faultInjectionDataBreakOnTwoCode", run.token());
    });

    /**
     * @tc.name          faultInjectionDataBreakOnLargeCode
     * @tc.desc          A reclaimed request sequence for large code yields an empty read.
     * @tc.precondition  The data sequence is reclaimed immediately before dispatch.
     * @tc.steps         1. Write a payload and reclaim the data sequence.
     *                   2. Run request code 99 and read the echoed text.
     *                   3. Check the sequence and handled flags.
     *                   4. Inspect the ledger entry and metrics.
     * @tc.expected      The stub reads an empty string while the reply path is unaffected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionDataBreakOnLargeCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 99, REQUEST_PAYLOAD, true, false, false);
      expect(run.reason).assertEqual(REASON_SEQUENCE);
      expect(run.handled).assertEqual(false);
      expect(run.errCode()).assertEqual(ERROR_SEQUENCE_RECLAIMED);
      expect(run.text).assertEqual("");
      expect(run.replyText).assertEqual("");
      expect(run.records).assertEqual(1);
      expect(run.alive).assertTrue();
      const record = stub.lastRequest();
      expect(record?.text).assertEqual("");
      expect(record?.code).assertEqual(99);
      expect(stub.requests[0].handled).assertEqual(false);
      logStep("faultInjectionDataBreakOnLargeCode", run.token());
    });

    /**
     * @tc.name          faultInjectionDataBreakOnNegativeCode
     * @tc.desc          A reclaimed request sequence for negative code yields an empty read.
     * @tc.precondition  The data sequence is reclaimed immediately before dispatch.
     * @tc.steps         1. Write a payload and reclaim the data sequence.
     *                   2. Run request code -1 and read the echoed text.
     *                   3. Check the sequence and handled flags.
     *                   4. Inspect the ledger entry and metrics.
     * @tc.expected      The stub reads an empty string while the reply path is unaffected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionDataBreakOnNegativeCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, -1, REQUEST_PAYLOAD, true, false, false);
      expect(run.reason).assertEqual(REASON_SEQUENCE);
      expect(run.handled).assertEqual(false);
      expect(run.errCode()).assertEqual(ERROR_SEQUENCE_RECLAIMED);
      expect(run.text).assertEqual("");
      expect(run.replyText).assertEqual("");
      expect(run.records).assertEqual(1);
      expect(run.alive).assertTrue();
      const record = stub.lastRequest();
      expect(record?.text).assertEqual("");
      expect(record?.code).assertEqual(-1);
      expect(stub.requests[0].handled).assertEqual(false);
      logStep("faultInjectionDataBreakOnNegativeCode", run.token());
    });

    /**
     * @tc.name          faultInjectionDataBreakOnSevenCode
     * @tc.desc          A reclaimed request sequence for seven code yields an empty read.
     * @tc.precondition  The data sequence is reclaimed immediately before dispatch.
     * @tc.steps         1. Write a payload and reclaim the data sequence.
     *                   2. Run request code 7 and read the echoed text.
     *                   3. Check the sequence and handled flags.
     *                   4. Inspect the ledger entry and metrics.
     * @tc.expected      The stub reads an empty string while the reply path is unaffected.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionDataBreakOnSevenCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 7, REQUEST_PAYLOAD, true, false, false);
      expect(run.reason).assertEqual(REASON_SEQUENCE);
      expect(run.handled).assertEqual(false);
      expect(run.errCode()).assertEqual(ERROR_SEQUENCE_RECLAIMED);
      expect(run.text).assertEqual("");
      expect(run.replyText).assertEqual("");
      expect(run.records).assertEqual(1);
      expect(run.alive).assertTrue();
      const record = stub.lastRequest();
      expect(record?.text).assertEqual("");
      expect(record?.code).assertEqual(7);
      expect(stub.requests[0].handled).assertEqual(false);
      logStep("faultInjectionDataBreakOnSevenCode", run.token());
    });

    /**
     * @tc.name          faultInjectionReplyBreakOnHelloWorld
     * @tc.desc          A reclaimed reply sequence for hello world payload fails the written reply.
     * @tc.precondition  The reply sequence is reclaimed before dispatch.
     * @tc.steps         1. Reclaim the reply sequence.
     *                   2. Run request code 1 and read the result.
     *                   3. Inspect the recorded reply text and handled flag.
     *                   4. Check aggregate metrics.
     * @tc.expected      The write fails, the request is unhandled, and the sequence error is returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionReplyBreakOnHelloWorld', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 1, 'hello world', false, true, false);
      expect(run.reason).assertEqual(REASON_SEQUENCE);
      expect(run.handled).assertFalse();
      expect(run.errCode()).assertEqual(ERROR_SEQUENCE_RECLAIMED);
      expect(run.replyText).assertEqual("");
      expect(run.text).assertEqual("");
      expect(run.records).assertEqual(1);
      const record = stub.lastRequest();
      expect(record?.handled).assertFalse();
      expect(record?.text).assertEqual('hello world');
      expect(record?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      logStep("faultInjectionReplyBreakOnHelloWorld", run.token());
    });

    /**
     * @tc.name          faultInjectionReplyBreakOnPing
     * @tc.desc          A reclaimed reply sequence for ping payload fails the written reply.
     * @tc.precondition  The reply sequence is reclaimed before dispatch.
     * @tc.steps         1. Reclaim the reply sequence.
     *                   2. Run request code 1 and read the result.
     *                   3. Inspect the recorded reply text and handled flag.
     *                   4. Check aggregate metrics.
     * @tc.expected      The write fails, the request is unhandled, and the sequence error is returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionReplyBreakOnPing', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 1, 'ping', false, true, false);
      expect(run.reason).assertEqual(REASON_SEQUENCE);
      expect(run.handled).assertFalse();
      expect(run.errCode()).assertEqual(ERROR_SEQUENCE_RECLAIMED);
      expect(run.replyText).assertEqual("");
      expect(run.text).assertEqual("");
      expect(run.records).assertEqual(1);
      const record = stub.lastRequest();
      expect(record?.handled).assertFalse();
      expect(record?.text).assertEqual('ping');
      expect(record?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      logStep("faultInjectionReplyBreakOnPing", run.token());
    });

    /**
     * @tc.name          faultInjectionReplyBreakOnShortToken
     * @tc.desc          A reclaimed reply sequence for short token payload fails the written reply.
     * @tc.precondition  The reply sequence is reclaimed before dispatch.
     * @tc.steps         1. Reclaim the reply sequence.
     *                   2. Run request code 1 and read the result.
     *                   3. Inspect the recorded reply text and handled flag.
     *                   4. Check aggregate metrics.
     * @tc.expected      The write fails, the request is unhandled, and the sequence error is returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionReplyBreakOnShortToken', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 1, 'abc', false, true, false);
      expect(run.reason).assertEqual(REASON_SEQUENCE);
      expect(run.handled).assertFalse();
      expect(run.errCode()).assertEqual(ERROR_SEQUENCE_RECLAIMED);
      expect(run.replyText).assertEqual("");
      expect(run.text).assertEqual("");
      expect(run.records).assertEqual(1);
      const record = stub.lastRequest();
      expect(record?.handled).assertFalse();
      expect(record?.text).assertEqual('abc');
      expect(record?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      logStep("faultInjectionReplyBreakOnShortToken", run.token());
    });

    /**
     * @tc.name          faultInjectionReplyBreakOnReplyLiteral
     * @tc.desc          A reclaimed reply sequence for reply literal payload fails the written reply.
     * @tc.precondition  The reply sequence is reclaimed before dispatch.
     * @tc.steps         1. Reclaim the reply sequence.
     *                   2. Run request code 1 and read the result.
     *                   3. Inspect the recorded reply text and handled flag.
     *                   4. Check aggregate metrics.
     * @tc.expected      The write fails, the request is unhandled, and the sequence error is returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionReplyBreakOnReplyLiteral', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 1, 'hello rpc', false, true, false);
      expect(run.reason).assertEqual(REASON_SEQUENCE);
      expect(run.handled).assertFalse();
      expect(run.errCode()).assertEqual(ERROR_SEQUENCE_RECLAIMED);
      expect(run.replyText).assertEqual("");
      expect(run.text).assertEqual("");
      expect(run.records).assertEqual(1);
      const record = stub.lastRequest();
      expect(record?.handled).assertFalse();
      expect(record?.text).assertEqual('hello rpc');
      expect(record?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      logStep("faultInjectionReplyBreakOnReplyLiteral", run.token());
    });

    /**
     * @tc.name          faultInjectionReplyBreakOnNumberedPayload
     * @tc.desc          A reclaimed reply sequence for numbered payload fails the written reply.
     * @tc.precondition  The reply sequence is reclaimed before dispatch.
     * @tc.steps         1. Reclaim the reply sequence.
     *                   2. Run request code 1 and read the result.
     *                   3. Inspect the recorded reply text and handled flag.
     *                   4. Check aggregate metrics.
     * @tc.expected      The write fails, the request is unhandled, and the sequence error is returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionReplyBreakOnNumberedPayload', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 1, 'payload-2', false, true, false);
      expect(run.reason).assertEqual(REASON_SEQUENCE);
      expect(run.handled).assertFalse();
      expect(run.errCode()).assertEqual(ERROR_SEQUENCE_RECLAIMED);
      expect(run.replyText).assertEqual("");
      expect(run.text).assertEqual("");
      expect(run.records).assertEqual(1);
      const record = stub.lastRequest();
      expect(record?.handled).assertFalse();
      expect(record?.text).assertEqual('payload-2');
      expect(record?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      logStep("faultInjectionReplyBreakOnNumberedPayload", run.token());
    });

    /**
     * @tc.name          faultInjectionReplyBreakOnSingleCharacter
     * @tc.desc          A reclaimed reply sequence for single character payload fails the written reply.
     * @tc.precondition  The reply sequence is reclaimed before dispatch.
     * @tc.steps         1. Reclaim the reply sequence.
     *                   2. Run request code 1 and read the result.
     *                   3. Inspect the recorded reply text and handled flag.
     *                   4. Check aggregate metrics.
     * @tc.expected      The write fails, the request is unhandled, and the sequence error is returned.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionReplyBreakOnSingleCharacter', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 1, 'x', false, true, false);
      expect(run.reason).assertEqual(REASON_SEQUENCE);
      expect(run.handled).assertFalse();
      expect(run.errCode()).assertEqual(ERROR_SEQUENCE_RECLAIMED);
      expect(run.replyText).assertEqual("");
      expect(run.text).assertEqual("");
      expect(run.records).assertEqual(1);
      const record = stub.lastRequest();
      expect(record?.handled).assertFalse();
      expect(record?.text).assertEqual('x');
      expect(record?.replyText).assertEqual(REPLY_PAYLOAD);
      expect(StubMetrics.from(stub).handled).assertEqual(0);
      expect(StubMetrics.from(stub).rejected).assertEqual(1);
      logStep("faultInjectionReplyBreakOnSingleCharacter", run.token());
    });

    /**
     * @tc.name          faultInjectionEmptyDataOnProductionCode
     * @tc.desc          An empty request sequence for production code leaves the echoed text empty.
     * @tc.precondition  The data sequence is created without any written element.
     * @tc.steps         1. Build an empty data sequence.
     *                   2. Run request code 1.
     *                   3. Read the echoed text and the reply.
     *                   4. Inspect the ledger and metrics.
     * @tc.expected      The code protocol still applies while the echoed text is the empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionEmptyDataOnProductionCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 1, REQUEST_PAYLOAD, false, false, true);
      expect(run.reason).assertEqual(REASON_NONE);
      expect(run.handled).assertEqual(true);
      expect(run.errCode()).assertEqual(ERROR_NONE);
      expect(run.text).assertEqual("");
      expect(run.replyText).assertEqual(REPLY_PAYLOAD);
      expect(run.records).assertEqual(1);
      const record = stub.lastRequest();
      expect(record?.text).assertEqual("");
      expect(record?.code).assertEqual(1);
      expect(StubMetrics.from(stub).requests).assertEqual(1);
      logStep("faultInjectionEmptyDataOnProductionCode", run.token());
    });

    /**
     * @tc.name          faultInjectionEmptyDataOnZeroCode
     * @tc.desc          An empty request sequence for zero code leaves the echoed text empty.
     * @tc.precondition  The data sequence is created without any written element.
     * @tc.steps         1. Build an empty data sequence.
     *                   2. Run request code 0.
     *                   3. Read the echoed text and the reply.
     *                   4. Inspect the ledger and metrics.
     * @tc.expected      The code protocol still applies while the echoed text is the empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionEmptyDataOnZeroCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 0, REQUEST_PAYLOAD, false, false, true);
      expect(run.reason).assertEqual(REASON_UNHANDLED);
      expect(run.handled).assertEqual(false);
      expect(run.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(run.text).assertEqual("");
      expect(run.replyText).assertEqual("");
      expect(run.records).assertEqual(1);
      const record = stub.lastRequest();
      expect(record?.text).assertEqual("");
      expect(record?.code).assertEqual(0);
      expect(StubMetrics.from(stub).requests).assertEqual(1);
      logStep("faultInjectionEmptyDataOnZeroCode", run.token());
    });

    /**
     * @tc.name          faultInjectionEmptyDataOnTwoCode
     * @tc.desc          An empty request sequence for two code leaves the echoed text empty.
     * @tc.precondition  The data sequence is created without any written element.
     * @tc.steps         1. Build an empty data sequence.
     *                   2. Run request code 2.
     *                   3. Read the echoed text and the reply.
     *                   4. Inspect the ledger and metrics.
     * @tc.expected      The code protocol still applies while the echoed text is the empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionEmptyDataOnTwoCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 2, REQUEST_PAYLOAD, false, false, true);
      expect(run.reason).assertEqual(REASON_UNHANDLED);
      expect(run.handled).assertEqual(false);
      expect(run.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(run.text).assertEqual("");
      expect(run.replyText).assertEqual("");
      expect(run.records).assertEqual(1);
      const record = stub.lastRequest();
      expect(record?.text).assertEqual("");
      expect(record?.code).assertEqual(2);
      expect(StubMetrics.from(stub).requests).assertEqual(1);
      logStep("faultInjectionEmptyDataOnTwoCode", run.token());
    });

    /**
     * @tc.name          faultInjectionEmptyDataOnLargeCode
     * @tc.desc          An empty request sequence for large code leaves the echoed text empty.
     * @tc.precondition  The data sequence is created without any written element.
     * @tc.steps         1. Build an empty data sequence.
     *                   2. Run request code 99.
     *                   3. Read the echoed text and the reply.
     *                   4. Inspect the ledger and metrics.
     * @tc.expected      The code protocol still applies while the echoed text is the empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionEmptyDataOnLargeCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 99, REQUEST_PAYLOAD, false, false, true);
      expect(run.reason).assertEqual(REASON_UNHANDLED);
      expect(run.handled).assertEqual(false);
      expect(run.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(run.text).assertEqual("");
      expect(run.replyText).assertEqual("");
      expect(run.records).assertEqual(1);
      const record = stub.lastRequest();
      expect(record?.text).assertEqual("");
      expect(record?.code).assertEqual(99);
      expect(StubMetrics.from(stub).requests).assertEqual(1);
      logStep("faultInjectionEmptyDataOnLargeCode", run.token());
    });

    /**
     * @tc.name          faultInjectionEmptyDataOnNegativeCode
     * @tc.desc          An empty request sequence for negative code leaves the echoed text empty.
     * @tc.precondition  The data sequence is created without any written element.
     * @tc.steps         1. Build an empty data sequence.
     *                   2. Run request code -1.
     *                   3. Read the echoed text and the reply.
     *                   4. Inspect the ledger and metrics.
     * @tc.expected      The code protocol still applies while the echoed text is the empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionEmptyDataOnNegativeCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, -1, REQUEST_PAYLOAD, false, false, true);
      expect(run.reason).assertEqual(REASON_UNHANDLED);
      expect(run.handled).assertEqual(false);
      expect(run.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(run.text).assertEqual("");
      expect(run.replyText).assertEqual("");
      expect(run.records).assertEqual(1);
      const record = stub.lastRequest();
      expect(record?.text).assertEqual("");
      expect(record?.code).assertEqual(-1);
      expect(StubMetrics.from(stub).requests).assertEqual(1);
      logStep("faultInjectionEmptyDataOnNegativeCode", run.token());
    });

    /**
     * @tc.name          faultInjectionEmptyDataOnSevenCode
     * @tc.desc          An empty request sequence for seven code leaves the echoed text empty.
     * @tc.precondition  The data sequence is created without any written element.
     * @tc.steps         1. Build an empty data sequence.
     *                   2. Run request code 7.
     *                   3. Read the echoed text and the reply.
     *                   4. Inspect the ledger and metrics.
     * @tc.expected      The code protocol still applies while the echoed text is the empty string.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionEmptyDataOnSevenCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const run: FaultRun = runRequest(stub, 7, REQUEST_PAYLOAD, false, false, true);
      expect(run.reason).assertEqual(REASON_UNHANDLED);
      expect(run.handled).assertEqual(false);
      expect(run.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(run.text).assertEqual("");
      expect(run.replyText).assertEqual("");
      expect(run.records).assertEqual(1);
      const record = stub.lastRequest();
      expect(record?.text).assertEqual("");
      expect(record?.code).assertEqual(7);
      expect(StubMetrics.from(stub).requests).assertEqual(1);
      logStep("faultInjectionEmptyDataOnSevenCode", run.token());
    });

    /**
     * @tc.name          faultInjectionRecoversProductionCode
     * @tc.desc          The stub recovers for production code after being killed once.
     * @tc.precondition  A kill and a revival bracket two requests with the same code.
     * @tc.steps         1. Kill the stub and run the first request.
     *                   2. Revive the stub and run the second request.
     *                   3. Compare the reasons and error codes.
     *                   4. Check the ledger and metrics across both attempts.
     * @tc.expected      Only the first attempt is not-alive while the second follows the code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRecoversProductionCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.kill();
      const dead: FaultRun = runRequest(stub, 1);
      stub.revive();
      const live: FaultRun = runRequest(stub, 1);
      expect(dead.errCode()).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(dead.records).assertEqual(1);
      expect(live.aliveBefore).assertTrue();
      expect(live.reason).assertEqual(REASON_NONE);
      expect(live.errCode()).assertEqual(ERROR_NONE);
      expect(live.records).assertEqual(2);
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(2);
      expect(metrics.rejected).assertEqual(1);
      expect(metrics.handled).assertEqual(1);
      expect(stub.alive).assertTrue();
      logStep("faultInjectionRecoversProductionCode", dead.token() + ">" + live.token());
    });

    /**
     * @tc.name          faultInjectionRecoversZeroCode
     * @tc.desc          The stub recovers for zero code after being killed once.
     * @tc.precondition  A kill and a revival bracket two requests with the same code.
     * @tc.steps         1. Kill the stub and run the first request.
     *                   2. Revive the stub and run the second request.
     *                   3. Compare the reasons and error codes.
     *                   4. Check the ledger and metrics across both attempts.
     * @tc.expected      Only the first attempt is not-alive while the second follows the code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRecoversZeroCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.kill();
      const dead: FaultRun = runRequest(stub, 0);
      stub.revive();
      const live: FaultRun = runRequest(stub, 0);
      expect(dead.errCode()).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(dead.records).assertEqual(1);
      expect(live.aliveBefore).assertTrue();
      expect(live.reason).assertEqual(REASON_UNHANDLED);
      expect(live.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(live.records).assertEqual(2);
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(2);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.handled).assertEqual(0);
      expect(stub.alive).assertTrue();
      logStep("faultInjectionRecoversZeroCode", dead.token() + ">" + live.token());
    });

    /**
     * @tc.name          faultInjectionRecoversTwoCode
     * @tc.desc          The stub recovers for two code after being killed once.
     * @tc.precondition  A kill and a revival bracket two requests with the same code.
     * @tc.steps         1. Kill the stub and run the first request.
     *                   2. Revive the stub and run the second request.
     *                   3. Compare the reasons and error codes.
     *                   4. Check the ledger and metrics across both attempts.
     * @tc.expected      Only the first attempt is not-alive while the second follows the code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRecoversTwoCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.kill();
      const dead: FaultRun = runRequest(stub, 2);
      stub.revive();
      const live: FaultRun = runRequest(stub, 2);
      expect(dead.errCode()).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(dead.records).assertEqual(1);
      expect(live.aliveBefore).assertTrue();
      expect(live.reason).assertEqual(REASON_UNHANDLED);
      expect(live.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(live.records).assertEqual(2);
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(2);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.handled).assertEqual(0);
      expect(stub.alive).assertTrue();
      logStep("faultInjectionRecoversTwoCode", dead.token() + ">" + live.token());
    });

    /**
     * @tc.name          faultInjectionRecoversLargeCode
     * @tc.desc          The stub recovers for large code after being killed once.
     * @tc.precondition  A kill and a revival bracket two requests with the same code.
     * @tc.steps         1. Kill the stub and run the first request.
     *                   2. Revive the stub and run the second request.
     *                   3. Compare the reasons and error codes.
     *                   4. Check the ledger and metrics across both attempts.
     * @tc.expected      Only the first attempt is not-alive while the second follows the code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRecoversLargeCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.kill();
      const dead: FaultRun = runRequest(stub, 99);
      stub.revive();
      const live: FaultRun = runRequest(stub, 99);
      expect(dead.errCode()).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(dead.records).assertEqual(1);
      expect(live.aliveBefore).assertTrue();
      expect(live.reason).assertEqual(REASON_UNHANDLED);
      expect(live.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(live.records).assertEqual(2);
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(2);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.handled).assertEqual(0);
      expect(stub.alive).assertTrue();
      logStep("faultInjectionRecoversLargeCode", dead.token() + ">" + live.token());
    });

    /**
     * @tc.name          faultInjectionRecoversNegativeCode
     * @tc.desc          The stub recovers for negative code after being killed once.
     * @tc.precondition  A kill and a revival bracket two requests with the same code.
     * @tc.steps         1. Kill the stub and run the first request.
     *                   2. Revive the stub and run the second request.
     *                   3. Compare the reasons and error codes.
     *                   4. Check the ledger and metrics across both attempts.
     * @tc.expected      Only the first attempt is not-alive while the second follows the code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRecoversNegativeCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.kill();
      const dead: FaultRun = runRequest(stub, -1);
      stub.revive();
      const live: FaultRun = runRequest(stub, -1);
      expect(dead.errCode()).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(dead.records).assertEqual(1);
      expect(live.aliveBefore).assertTrue();
      expect(live.reason).assertEqual(REASON_UNHANDLED);
      expect(live.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(live.records).assertEqual(2);
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(2);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.handled).assertEqual(0);
      expect(stub.alive).assertTrue();
      logStep("faultInjectionRecoversNegativeCode", dead.token() + ">" + live.token());
    });

    /**
     * @tc.name          faultInjectionRecoversSevenCode
     * @tc.desc          The stub recovers for seven code after being killed once.
     * @tc.precondition  A kill and a revival bracket two requests with the same code.
     * @tc.steps         1. Kill the stub and run the first request.
     *                   2. Revive the stub and run the second request.
     *                   3. Compare the reasons and error codes.
     *                   4. Check the ledger and metrics across both attempts.
     * @tc.expected      Only the first attempt is not-alive while the second follows the code protocol.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionRecoversSevenCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      stub.kill();
      const dead: FaultRun = runRequest(stub, 7);
      stub.revive();
      const live: FaultRun = runRequest(stub, 7);
      expect(dead.errCode()).assertEqual(ERROR_STUB_NOT_ALIVE);
      expect(dead.records).assertEqual(1);
      expect(live.aliveBefore).assertTrue();
      expect(live.reason).assertEqual(REASON_UNHANDLED);
      expect(live.errCode()).assertEqual(ERROR_STUB_REJECTED);
      expect(live.records).assertEqual(2);
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(metrics.requests).assertEqual(2);
      expect(metrics.rejected).assertEqual(2);
      expect(metrics.handled).assertEqual(0);
      expect(stub.alive).assertTrue();
      logStep("faultInjectionRecoversSevenCode", dead.token() + ">" + live.token());
    });

    /**
     * @tc.name          faultInjectionLedgerMixedCodes
     * @tc.desc          The mixed code ledger mixed codes keeps one record per attempt.
     * @tc.precondition  A fresh stub accepts a fixed list of four request codes.
     * @tc.steps         1. Replay the code list through the stub.
     *                   2. Count records and handled outcomes.
     *                   3. Compare the aggregate metrics.
     *                   4. List the recorded codes in order.
     * @tc.expected      The ledger length equals the code count and every record preserves its order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionLedgerMixedCodes', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const codes: number[] = [1, 2, 0, 1];
      let handled: number = 0;
      let rejected: number = 0;
      for (let index = 0; index < codes.length; index++) {
        const run: FaultRun = runRequest(stub, codes[index]);
        if (run.handled) {
          handled = handled + 1;
        } else {
          rejected = rejected + 1;
        }
      }
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(stub.requestCount()).assertEqual(codes.length);
      expect(metrics.requests).assertEqual(codes.length);
      expect(metrics.handled).assertEqual(handled);
      expect(metrics.rejected).assertEqual(rejected);
      expect(handled + rejected).assertEqual(codes.length);
      expect(stub.requests[0].code).assertEqual(codes[0]);
      expect(stub.requests[codes.length - 1].code).assertEqual(codes[codes.length - 1]);
      logStep("faultInjectionLedgerMixedCodes", metrics.requests + "/" + metrics.handled);
    });

    /**
     * @tc.name          faultInjectionLedgerUnknownFirst
     * @tc.desc          The mixed code ledger unknown first keeps one record per attempt.
     * @tc.precondition  A fresh stub accepts a fixed list of four request codes.
     * @tc.steps         1. Replay the code list through the stub.
     *                   2. Count records and handled outcomes.
     *                   3. Compare the aggregate metrics.
     *                   4. List the recorded codes in order.
     * @tc.expected      The ledger length equals the code count and every record preserves its order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionLedgerUnknownFirst', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const codes: number[] = [0, 0, 1, 2];
      let handled: number = 0;
      let rejected: number = 0;
      for (let index = 0; index < codes.length; index++) {
        const run: FaultRun = runRequest(stub, codes[index]);
        if (run.handled) {
          handled = handled + 1;
        } else {
          rejected = rejected + 1;
        }
      }
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(stub.requestCount()).assertEqual(codes.length);
      expect(metrics.requests).assertEqual(codes.length);
      expect(metrics.handled).assertEqual(handled);
      expect(metrics.rejected).assertEqual(rejected);
      expect(handled + rejected).assertEqual(codes.length);
      expect(stub.requests[0].code).assertEqual(codes[0]);
      expect(stub.requests[codes.length - 1].code).assertEqual(codes[codes.length - 1]);
      logStep("faultInjectionLedgerUnknownFirst", metrics.requests + "/" + metrics.handled);
    });

    /**
     * @tc.name          faultInjectionLedgerAllAccepted
     * @tc.desc          The mixed code ledger all accepted keeps one record per attempt.
     * @tc.precondition  A fresh stub accepts a fixed list of four request codes.
     * @tc.steps         1. Replay the code list through the stub.
     *                   2. Count records and handled outcomes.
     *                   3. Compare the aggregate metrics.
     *                   4. List the recorded codes in order.
     * @tc.expected      The ledger length equals the code count and every record preserves its order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionLedgerAllAccepted', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const codes: number[] = [1, 1, 1, 1];
      let handled: number = 0;
      let rejected: number = 0;
      for (let index = 0; index < codes.length; index++) {
        const run: FaultRun = runRequest(stub, codes[index]);
        if (run.handled) {
          handled = handled + 1;
        } else {
          rejected = rejected + 1;
        }
      }
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(stub.requestCount()).assertEqual(codes.length);
      expect(metrics.requests).assertEqual(codes.length);
      expect(metrics.handled).assertEqual(handled);
      expect(metrics.rejected).assertEqual(rejected);
      expect(handled + rejected).assertEqual(codes.length);
      expect(stub.requests[0].code).assertEqual(codes[0]);
      expect(stub.requests[codes.length - 1].code).assertEqual(codes[codes.length - 1]);
      logStep("faultInjectionLedgerAllAccepted", metrics.requests + "/" + metrics.handled);
    });

    /**
     * @tc.name          faultInjectionLedgerAllRejected
     * @tc.desc          The mixed code ledger all rejected keeps one record per attempt.
     * @tc.precondition  A fresh stub accepts a fixed list of four request codes.
     * @tc.steps         1. Replay the code list through the stub.
     *                   2. Count records and handled outcomes.
     *                   3. Compare the aggregate metrics.
     *                   4. List the recorded codes in order.
     * @tc.expected      The ledger length equals the code count and every record preserves its order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionLedgerAllRejected', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const codes: number[] = [2, 2, 2, 2];
      let handled: number = 0;
      let rejected: number = 0;
      for (let index = 0; index < codes.length; index++) {
        const run: FaultRun = runRequest(stub, codes[index]);
        if (run.handled) {
          handled = handled + 1;
        } else {
          rejected = rejected + 1;
        }
      }
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(stub.requestCount()).assertEqual(codes.length);
      expect(metrics.requests).assertEqual(codes.length);
      expect(metrics.handled).assertEqual(handled);
      expect(metrics.rejected).assertEqual(rejected);
      expect(handled + rejected).assertEqual(codes.length);
      expect(stub.requests[0].code).assertEqual(codes[0]);
      expect(stub.requests[codes.length - 1].code).assertEqual(codes[codes.length - 1]);
      logStep("faultInjectionLedgerAllRejected", metrics.requests + "/" + metrics.handled);
    });

    /**
     * @tc.name          faultInjectionLedgerExtremes
     * @tc.desc          The mixed code ledger extremes keeps one record per attempt.
     * @tc.precondition  A fresh stub accepts a fixed list of four request codes.
     * @tc.steps         1. Replay the code list through the stub.
     *                   2. Count records and handled outcomes.
     *                   3. Compare the aggregate metrics.
     *                   4. List the recorded codes in order.
     * @tc.expected      The ledger length equals the code count and every record preserves its order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionLedgerExtremes', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const codes: number[] = [-1, 1, 99, 0];
      let handled: number = 0;
      let rejected: number = 0;
      for (let index = 0; index < codes.length; index++) {
        const run: FaultRun = runRequest(stub, codes[index]);
        if (run.handled) {
          handled = handled + 1;
        } else {
          rejected = rejected + 1;
        }
      }
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(stub.requestCount()).assertEqual(codes.length);
      expect(metrics.requests).assertEqual(codes.length);
      expect(metrics.handled).assertEqual(handled);
      expect(metrics.rejected).assertEqual(rejected);
      expect(handled + rejected).assertEqual(codes.length);
      expect(stub.requests[0].code).assertEqual(codes[0]);
      expect(stub.requests[codes.length - 1].code).assertEqual(codes[codes.length - 1]);
      logStep("faultInjectionLedgerExtremes", metrics.requests + "/" + metrics.handled);
    });

    /**
     * @tc.name          faultInjectionLedgerAscendingCodes
     * @tc.desc          The mixed code ledger ascending codes keeps one record per attempt.
     * @tc.precondition  A fresh stub accepts a fixed list of four request codes.
     * @tc.steps         1. Replay the code list through the stub.
     *                   2. Count records and handled outcomes.
     *                   3. Compare the aggregate metrics.
     *                   4. List the recorded codes in order.
     * @tc.expected      The ledger length equals the code count and every record preserves its order.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionLedgerAscendingCodes', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const codes: number[] = [1, 2, 3, 4];
      let handled: number = 0;
      let rejected: number = 0;
      for (let index = 0; index < codes.length; index++) {
        const run: FaultRun = runRequest(stub, codes[index]);
        if (run.handled) {
          handled = handled + 1;
        } else {
          rejected = rejected + 1;
        }
      }
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(stub.requestCount()).assertEqual(codes.length);
      expect(metrics.requests).assertEqual(codes.length);
      expect(metrics.handled).assertEqual(handled);
      expect(metrics.rejected).assertEqual(rejected);
      expect(handled + rejected).assertEqual(codes.length);
      expect(stub.requests[0].code).assertEqual(codes[0]);
      expect(stub.requests[codes.length - 1].code).assertEqual(codes[codes.length - 1]);
      logStep("faultInjectionLedgerAscendingCodes", metrics.requests + "/" + metrics.handled);
    });

    /**
     * @tc.name          faultInjectionSequenceAlphaBeta
     * @tc.desc          Sequence primitives hold for the alpha beta pair pair before and after reclaim.
     * @tc.precondition  A message sequence is written, read, rewound and reclaimed.
     * @tc.steps         1. Write the first and second values.
     *                   2. Read one value and inspect the cursor.
     *                   3. Rewind and read again.
     *                   4. Reclaim and attempt another write and read.
     * @tc.expected      Writes and reads advance counters, rewind resets the cursor, and reclaim blocks both directions.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionSequenceAlphaBeta', 0, () => {
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.writeString('alpha')).assertTrue();
      expect(seq.writeString('beta')).assertTrue();
      expect(seq.size()).assertEqual(2);
      expect(seq.writeCount).assertEqual(2);
      expect(seq.readString()).assertEqual('alpha');
      expect(seq.cursor).assertEqual(1);
      expect(seq.readCount).assertEqual(1);
      expect(seq.trace()).assertEqual('alpha' + "|" + 'beta' + "#1");
      seq.rewind();
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('alpha');
      seq.reclaim();
      expect(seq.reclaimed).assertTrue();
      expect(seq.writeString("late")).assertFalse();
      expect(seq.writeCount).assertEqual(2);
      expect(seq.readString()).assertEqual("");
      expect(seq.cursor).assertEqual(0);
      logStep("faultInjectionSequenceAlphaBeta", seq.trace());
    });

    /**
     * @tc.name          faultInjectionSequenceLeftRight
     * @tc.desc          Sequence primitives hold for the left right pair pair before and after reclaim.
     * @tc.precondition  A message sequence is written, read, rewound and reclaimed.
     * @tc.steps         1. Write the first and second values.
     *                   2. Read one value and inspect the cursor.
     *                   3. Rewind and read again.
     *                   4. Reclaim and attempt another write and read.
     * @tc.expected      Writes and reads advance counters, rewind resets the cursor, and reclaim blocks both directions.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionSequenceLeftRight', 0, () => {
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.writeString('left')).assertTrue();
      expect(seq.writeString('right')).assertTrue();
      expect(seq.size()).assertEqual(2);
      expect(seq.writeCount).assertEqual(2);
      expect(seq.readString()).assertEqual('left');
      expect(seq.cursor).assertEqual(1);
      expect(seq.readCount).assertEqual(1);
      expect(seq.trace()).assertEqual('left' + "|" + 'right' + "#1");
      seq.rewind();
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('left');
      seq.reclaim();
      expect(seq.reclaimed).assertTrue();
      expect(seq.writeString("late")).assertFalse();
      expect(seq.writeCount).assertEqual(2);
      expect(seq.readString()).assertEqual("");
      expect(seq.cursor).assertEqual(0);
      logStep("faultInjectionSequenceLeftRight", seq.trace());
    });

    /**
     * @tc.name          faultInjectionSequenceXyPair
     * @tc.desc          Sequence primitives hold for the x y pair pair before and after reclaim.
     * @tc.precondition  A message sequence is written, read, rewound and reclaimed.
     * @tc.steps         1. Write the first and second values.
     *                   2. Read one value and inspect the cursor.
     *                   3. Rewind and read again.
     *                   4. Reclaim and attempt another write and read.
     * @tc.expected      Writes and reads advance counters, rewind resets the cursor, and reclaim blocks both directions.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionSequenceXyPair', 0, () => {
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.writeString('x')).assertTrue();
      expect(seq.writeString('y')).assertTrue();
      expect(seq.size()).assertEqual(2);
      expect(seq.writeCount).assertEqual(2);
      expect(seq.readString()).assertEqual('x');
      expect(seq.cursor).assertEqual(1);
      expect(seq.readCount).assertEqual(1);
      expect(seq.trace()).assertEqual('x' + "|" + 'y' + "#1");
      seq.rewind();
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('x');
      seq.reclaim();
      expect(seq.reclaimed).assertTrue();
      expect(seq.writeString("late")).assertFalse();
      expect(seq.writeCount).assertEqual(2);
      expect(seq.readString()).assertEqual("");
      expect(seq.cursor).assertEqual(0);
      logStep("faultInjectionSequenceXyPair", seq.trace());
    });

    /**
     * @tc.name          faultInjectionSequenceFirstSecond
     * @tc.desc          Sequence primitives hold for the first second pair pair before and after reclaim.
     * @tc.precondition  A message sequence is written, read, rewound and reclaimed.
     * @tc.steps         1. Write the first and second values.
     *                   2. Read one value and inspect the cursor.
     *                   3. Rewind and read again.
     *                   4. Reclaim and attempt another write and read.
     * @tc.expected      Writes and reads advance counters, rewind resets the cursor, and reclaim blocks both directions.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionSequenceFirstSecond', 0, () => {
      const seq: MessageSequenceModel = MessageSequenceModel.create();
      expect(seq.writeString('first')).assertTrue();
      expect(seq.writeString('second')).assertTrue();
      expect(seq.size()).assertEqual(2);
      expect(seq.writeCount).assertEqual(2);
      expect(seq.readString()).assertEqual('first');
      expect(seq.cursor).assertEqual(1);
      expect(seq.readCount).assertEqual(1);
      expect(seq.trace()).assertEqual('first' + "|" + 'second' + "#1");
      seq.rewind();
      expect(seq.cursor).assertEqual(0);
      expect(seq.readString()).assertEqual('first');
      seq.reclaim();
      expect(seq.reclaimed).assertTrue();
      expect(seq.writeString("late")).assertFalse();
      expect(seq.writeCount).assertEqual(2);
      expect(seq.readString()).assertEqual("");
      expect(seq.cursor).assertEqual(0);
      logStep("faultInjectionSequenceFirstSecond", seq.trace());
    });

    /**
     * @tc.name          faultInjectionMetricsMixedTallies
     * @tc.desc          Aggregate metrics for the mixed tallies ledger match a manual tally.
     * @tc.precondition  A code list mixing accepted and refused codes is replayed.
     * @tc.steps         1. Replay the code list.
     *                   2. Build metrics from the stub.
     *                   3. Compare requests, handled, rejected and replies.
     *                   4. Check the ratio and fingerprint stability.
     * @tc.expected      Every metric equals the manual tally and the ratio stays between zero and one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionMetricsMixedTallies', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const codes: number[] = [1, 2, 0, 1];
      const client: InProcessClient = replayCodes(stub, codes);
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(client.results.length).assertEqual(codes.length);
      expect(metrics.requests).assertEqual(codes.length);
      expect(metrics.handled).assertEqual(2);
      expect(metrics.rejected).assertEqual(codes.length - 2);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.successRatio() >= 0).assertTrue();
      expect(metrics.successRatio() <= 1).assertTrue();
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(stub).fingerprint());
      logStep("faultInjectionMetricsMixedTallies", String(metrics.fingerprint()));
    });

    /**
     * @tc.name          faultInjectionMetricsAllHandled
     * @tc.desc          Aggregate metrics for the all handled ledger match a manual tally.
     * @tc.precondition  A code list mixing accepted and refused codes is replayed.
     * @tc.steps         1. Replay the code list.
     *                   2. Build metrics from the stub.
     *                   3. Compare requests, handled, rejected and replies.
     *                   4. Check the ratio and fingerprint stability.
     * @tc.expected      Every metric equals the manual tally and the ratio stays between zero and one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionMetricsAllHandled', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const codes: number[] = [1, 1, 1];
      const client: InProcessClient = replayCodes(stub, codes);
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(client.results.length).assertEqual(codes.length);
      expect(metrics.requests).assertEqual(codes.length);
      expect(metrics.handled).assertEqual(3);
      expect(metrics.rejected).assertEqual(codes.length - 3);
      expect(metrics.replies).assertEqual(3);
      expect(metrics.successRatio() >= 0).assertTrue();
      expect(metrics.successRatio() <= 1).assertTrue();
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(stub).fingerprint());
      logStep("faultInjectionMetricsAllHandled", String(metrics.fingerprint()));
    });

    /**
     * @tc.name          faultInjectionMetricsNoneHandled
     * @tc.desc          Aggregate metrics for the none handled ledger match a manual tally.
     * @tc.precondition  A code list mixing accepted and refused codes is replayed.
     * @tc.steps         1. Replay the code list.
     *                   2. Build metrics from the stub.
     *                   3. Compare requests, handled, rejected and replies.
     *                   4. Check the ratio and fingerprint stability.
     * @tc.expected      Every metric equals the manual tally and the ratio stays between zero and one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionMetricsNoneHandled', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const codes: number[] = [0, 2, 99];
      const client: InProcessClient = replayCodes(stub, codes);
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(client.results.length).assertEqual(codes.length);
      expect(metrics.requests).assertEqual(codes.length);
      expect(metrics.handled).assertEqual(0);
      expect(metrics.rejected).assertEqual(codes.length - 0);
      expect(metrics.replies).assertEqual(0);
      expect(metrics.successRatio() >= 0).assertTrue();
      expect(metrics.successRatio() <= 1).assertTrue();
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(stub).fingerprint());
      logStep("faultInjectionMetricsNoneHandled", String(metrics.fingerprint()));
    });

    /**
     * @tc.name          faultInjectionMetricsAlternating
     * @tc.desc          Aggregate metrics for the alternating ledger match a manual tally.
     * @tc.precondition  A code list mixing accepted and refused codes is replayed.
     * @tc.steps         1. Replay the code list.
     *                   2. Build metrics from the stub.
     *                   3. Compare requests, handled, rejected and replies.
     *                   4. Check the ratio and fingerprint stability.
     * @tc.expected      Every metric equals the manual tally and the ratio stays between zero and one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionMetricsAlternating', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const codes: number[] = [1, 0, 1, 0];
      const client: InProcessClient = replayCodes(stub, codes);
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(client.results.length).assertEqual(codes.length);
      expect(metrics.requests).assertEqual(codes.length);
      expect(metrics.handled).assertEqual(2);
      expect(metrics.rejected).assertEqual(codes.length - 2);
      expect(metrics.replies).assertEqual(2);
      expect(metrics.successRatio() >= 0).assertTrue();
      expect(metrics.successRatio() <= 1).assertTrue();
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(stub).fingerprint());
      logStep("faultInjectionMetricsAlternating", String(metrics.fingerprint()));
    });

    /**
     * @tc.name          faultInjectionMetricsSingleHandled
     * @tc.desc          Aggregate metrics for the single handled ledger match a manual tally.
     * @tc.precondition  A code list mixing accepted and refused codes is replayed.
     * @tc.steps         1. Replay the code list.
     *                   2. Build metrics from the stub.
     *                   3. Compare requests, handled, rejected and replies.
     *                   4. Check the ratio and fingerprint stability.
     * @tc.expected      Every metric equals the manual tally and the ratio stays between zero and one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionMetricsSingleHandled', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const codes: number[] = [7, 1, 2];
      const client: InProcessClient = replayCodes(stub, codes);
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(client.results.length).assertEqual(codes.length);
      expect(metrics.requests).assertEqual(codes.length);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(codes.length - 1);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.successRatio() >= 0).assertTrue();
      expect(metrics.successRatio() <= 1).assertTrue();
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(stub).fingerprint());
      logStep("faultInjectionMetricsSingleHandled", String(metrics.fingerprint()));
    });

    /**
     * @tc.name          faultInjectionMetricsSingleCode
     * @tc.desc          Aggregate metrics for the single code ledger match a manual tally.
     * @tc.precondition  A code list mixing accepted and refused codes is replayed.
     * @tc.steps         1. Replay the code list.
     *                   2. Build metrics from the stub.
     *                   3. Compare requests, handled, rejected and replies.
     *                   4. Check the ratio and fingerprint stability.
     * @tc.expected      Every metric equals the manual tally and the ratio stays between zero and one.
     * @tc.remark        Pure logic case; no device or UI dependency.
     * @tc.type          FUNCTION
     * @tc.level         LEVEL2
     */
    it('faultInjectionMetricsSingleCode', 0, () => {
      const stub: StubRemoteObjectModel = freshStub();
      const codes: number[] = [1];
      const client: InProcessClient = replayCodes(stub, codes);
      const metrics: StubMetrics = StubMetrics.from(stub);
      expect(client.results.length).assertEqual(codes.length);
      expect(metrics.requests).assertEqual(codes.length);
      expect(metrics.handled).assertEqual(1);
      expect(metrics.rejected).assertEqual(codes.length - 1);
      expect(metrics.replies).assertEqual(1);
      expect(metrics.successRatio() >= 0).assertTrue();
      expect(metrics.successRatio() <= 1).assertTrue();
      expect(metrics.fingerprint()).assertEqual(StubMetrics.from(stub).fingerprint());
      logStep("faultInjectionMetricsSingleCode", String(metrics.fingerprint()));
    });
  });
}
