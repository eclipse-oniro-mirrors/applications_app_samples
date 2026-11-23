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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { ACCOUNT_ID, RESULT_CODE, CONNECTION_NUMBER } from '../Shared/SharedDriver';

enum OpKind {
  START = 0,
  FOR_RESULT = 1,
  WITH_ACCOUNT = 2,
  START_SERVICE = 3,
  STOP_SERVICE = 4,
  CONNECT = 5,
  DISCONNECT = 6,
  PERMISSION = 7,
  LABEL = 8,
  QUERY = 9
}

class OpResult {
  readonly kind: OpKind;
  readonly ok: boolean;
  readonly code: number;

  constructor(kind: OpKind, ok: boolean, code: number) {
    this.kind = kind;
    this.ok = ok;
    this.code = code;
  }

  describe(): string {
    return `${this.kind}:${this.ok}:${this.code}`;
  }
}

class OperationExecutor {
  private results: OpResult[] = [];

  execute(kind: OpKind): OpResult {
    let code = CONNECTION_NUMBER;
    if (kind === OpKind.FOR_RESULT) {
      code = RESULT_CODE;
    }
    if (kind === OpKind.WITH_ACCOUNT) {
      code = ACCOUNT_ID;
    }
    const result = new OpResult(kind, true, code);
    this.results.push(result);
    return result;
  }

  size(): number {
    return this.results.length;
  }

  all(): OpResult[] {
    return this.results;
  }

  okCount(): number {
    let count = 0;
    for (const result of this.results) {
      if (result.ok) {
        count += 1;
      }
    }
    return count;
  }

  countOf(kind: OpKind): number {
    let count = 0;
    for (const result of this.results) {
      if (result.kind === kind) {
        count += 1;
      }
    }
    return count;
  }

  codeOfLast(): number {
    if (this.results.length === 0) {
      return -1;
    }
    return this.results[this.results.length - 1].code;
  }

  lastKind(): OpKind {
    if (this.results.length === 0) {
      return OpKind.QUERY;
    }
    return this.results[this.results.length - 1].kind;
  }

  codes(): number[] {
    const result: number[] = [];
    for (const entry of this.results) {
      result.push(entry.code);
    }
    return result;
  }
}

class OperationSummary {
  private executor: OperationExecutor;

  constructor(executor: OperationExecutor) {
    this.executor = executor;
  }

  total(): number {
    return this.executor.size();
  }

  allOk(): boolean {
    if (this.executor.size() === 0) {
      return false;
    }
    return this.executor.okCount() === this.executor.size();
  }

  describe(): string {
    return `total=${this.executor.size()},ok=${this.executor.okCount()}`;
  }

  distinctKinds(): number {
    const kinds: OpKind[] = [];
    for (const result of this.executor.all()) {
      let seen = false;
      for (const kind of kinds) {
        if (kind === result.kind) {
          seen = true;
        }
      }
      if (!seen) {
        kinds.push(result.kind);
      }
    }
    return kinds.length;
  }
}

function buildExecutor(): OperationExecutor {
  const executor = new OperationExecutor();
  executor.execute(OpKind.START);
  executor.execute(OpKind.FOR_RESULT);
  executor.execute(OpKind.WITH_ACCOUNT);
  executor.execute(OpKind.START_SERVICE);
  executor.execute(OpKind.CONNECT);
  executor.execute(OpKind.PERMISSION);
  executor.execute(OpKind.LABEL);
  return executor;
}

export default function abilityOperationsTest(): void {
  describe('AbilityOperationsSuite', () => {
    let executor: OperationExecutor = buildExecutor();

    beforeAll(() => {
      executor = buildExecutor();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'operations suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'operations suite end');
    });

    it('AbilityOperations_001', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      expect(fresh.size()).assertEqual(0);
      expect(fresh.okCount()).assertEqual(0);
      expect(fresh.codeOfLast()).assertEqual(-1);
      expect(fresh.lastKind()).assertEqual(OpKind.QUERY);
      done();
    });

    it('AbilityOperations_002', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const result = fresh.execute(OpKind.START);
      expect(result.ok).assertTrue();
      expect(result.kind).assertEqual(OpKind.START);
      expect(result.code).assertEqual(CONNECTION_NUMBER);
      expect(fresh.size()).assertEqual(1);
      done();
    });

    it('AbilityOperations_003', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const result = fresh.execute(OpKind.FOR_RESULT);
      expect(result.code).assertEqual(RESULT_CODE);
      expect(result.describe()).assertEqual(`${OpKind.FOR_RESULT}:true:${RESULT_CODE}`);
      done();
    });

    it('AbilityOperations_004', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const result = fresh.execute(OpKind.WITH_ACCOUNT);
      expect(result.code).assertEqual(ACCOUNT_ID);
      expect(fresh.codeOfLast()).assertEqual(ACCOUNT_ID);
      expect(fresh.lastKind()).assertEqual(OpKind.WITH_ACCOUNT);
      done();
    });

    it('AbilityOperations_005', 0, async (done: Function) => {
      expect(executor.size()).assertEqual(7);
      expect(executor.all().length).assertEqual(7);
      expect(executor.okCount()).assertEqual(7);
      done();
    });

    it('AbilityOperations_006', 0, async (done: Function) => {
      expect(executor.countOf(OpKind.START)).assertEqual(1);
      expect(executor.countOf(OpKind.FOR_RESULT)).assertEqual(1);
      expect(executor.countOf(OpKind.WITH_ACCOUNT)).assertEqual(1);
      expect(executor.countOf(OpKind.START_SERVICE)).assertEqual(1);
      expect(executor.countOf(OpKind.CONNECT)).assertEqual(1);
      expect(executor.countOf(OpKind.PERMISSION)).assertEqual(1);
      expect(executor.countOf(OpKind.LABEL)).assertEqual(1);
      done();
    });

    it('AbilityOperations_007', 0, async (done: Function) => {
      expect(executor.countOf(OpKind.STOP_SERVICE)).assertEqual(0);
      expect(executor.countOf(OpKind.DISCONNECT)).assertEqual(0);
      expect(executor.countOf(OpKind.QUERY)).assertEqual(0);
      done();
    });

    it('AbilityOperations_008', 0, async (done: Function) => {
      const codes = executor.codes();
      expect(codes.length).assertEqual(7);
      expect(codes[0]).assertEqual(CONNECTION_NUMBER);
      expect(codes[1]).assertEqual(RESULT_CODE);
      expect(codes[2]).assertEqual(ACCOUNT_ID);
      expect(codes[3]).assertEqual(CONNECTION_NUMBER);
      done();
    });

    it('AbilityOperations_009', 0, async (done: Function) => {
      expect(executor.codeOfLast()).assertEqual(CONNECTION_NUMBER);
      expect(executor.lastKind()).assertEqual(OpKind.LABEL);
      done();
    });

    it('AbilityOperations_010', 0, async (done: Function) => {
      const summary = new OperationSummary(executor);
      expect(summary.total()).assertEqual(7);
      expect(summary.allOk()).assertTrue();
      expect(summary.describe()).assertEqual('total=7,ok=7');
      expect(summary.distinctKinds()).assertEqual(7);
      done();
    });

    it('AbilityOperations_011', 0, async (done: Function) => {
      const empty = new OperationExecutor();
      const summary = new OperationSummary(empty);
      expect(summary.total()).assertEqual(0);
      expect(summary.allOk()).assertFalse();
      expect(summary.describe()).assertEqual('total=0,ok=0');
      expect(summary.distinctKinds()).assertEqual(0);
      done();
    });

    it('AbilityOperations_012', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.START);
      fresh.execute(OpKind.START);
      fresh.execute(OpKind.START);
      expect(fresh.countOf(OpKind.START)).assertEqual(3);
      const summary = new OperationSummary(fresh);
      expect(summary.distinctKinds()).assertEqual(1);
      expect(summary.allOk()).assertTrue();
      done();
    });

    it('AbilityOperations_013', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const result = new OpResult(OpKind.STOP_SERVICE, false, -1);
      expect(result.ok).assertFalse();
      expect(result.describe()).assertEqual(`${OpKind.STOP_SERVICE}:false:-1`);
      expect(fresh.okCount()).assertEqual(0);
      done();
    });

    it('AbilityOperations_014', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.START_SERVICE);
      fresh.execute(OpKind.STOP_SERVICE);
      fresh.execute(OpKind.CONNECT);
      fresh.execute(OpKind.DISCONNECT);
      expect(fresh.size()).assertEqual(4);
      expect(fresh.countOf(OpKind.START_SERVICE)).assertEqual(1);
      expect(fresh.countOf(OpKind.STOP_SERVICE)).assertEqual(1);
      expect(fresh.countOf(OpKind.CONNECT)).assertEqual(1);
      expect(fresh.countOf(OpKind.DISCONNECT)).assertEqual(1);
      done();
    });

    it('AbilityOperations_015', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.PERMISSION);
      fresh.execute(OpKind.LABEL);
      expect(fresh.codeOfLast()).assertEqual(CONNECTION_NUMBER);
      expect(fresh.lastKind()).assertEqual(OpKind.LABEL);
      expect(fresh.execute(OpKind.QUERY).code).assertEqual(CONNECTION_NUMBER);
      done();
    });

    it('AbilityOperations_016', 0, async (done: Function) => {
      let kindSum = 0;
      for (const result of executor.all()) {
        kindSum += result.kind;
      }
      expect(kindSum).assertEqual(0 + 1 + 2 + 3 + 5 + 7 + 8);
      done();
    });

    it('AbilityOperations_017', 0, async (done: Function) => {
      let okSum = 0;
      for (const result of executor.all()) {
        if (result.ok) {
          okSum += 1;
        }
      }
      expect(okSum).assertEqual(executor.okCount());
      expect(okSum).assertEqual(7);
      done();
    });

    it('AbilityOperations_018', 0, async (done: Function) => {
      const withAccount = executor.all().filter((result: OpResult) => result.code === ACCOUNT_ID);
      expect(withAccount.length >= 1).assertTrue();
      expect(withAccount.some((result: OpResult) => result.kind === OpKind.WITH_ACCOUNT)).assertTrue();
      done();
    });

    it('AbilityOperations_019', 0, async (done: Function) => {
      const forResults = executor.all().filter((result: OpResult) => result.code === RESULT_CODE);
      expect(forResults.length >= 1).assertTrue();
      expect(forResults.some((result: OpResult) => result.kind === OpKind.FOR_RESULT)).assertTrue();
      done();
    });

    it('AbilityOperations_020', 0, async (done: Function) => {
      const kinds = executor.all().map((result: OpResult) => result.kind);
      expect(kinds.length).assertEqual(7);
      expect(kinds[0]).assertEqual(OpKind.START);
      expect(kinds[6]).assertEqual(OpKind.LABEL);
      done();
    });

    it('AbilityOperations_021', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const results: OpResult[] = [];
      for (let i = 0; i < 5; i++) {
        results.push(fresh.execute(OpKind.START));
      }
      expect(results.length).assertEqual(5);
      expect(fresh.size()).assertEqual(5);
      expect(fresh.countOf(OpKind.START)).assertEqual(5);
      done();
    });

    it('AbilityOperations_022', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const kinds: OpKind[] = [OpKind.START, OpKind.FOR_RESULT, OpKind.WITH_ACCOUNT];
      for (const kind of kinds) {
        fresh.execute(kind);
      }
      const summary = new OperationSummary(fresh);
      expect(summary.total()).assertEqual(3);
      expect(summary.distinctKinds()).assertEqual(3);
      expect(summary.allOk()).assertTrue();
      done();
    });

    it('AbilityOperations_023', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.START);
      fresh.execute(OpKind.START);
      fresh.execute(OpKind.FOR_RESULT);
      const summary = new OperationSummary(fresh);
      expect(summary.total()).assertEqual(3);
      expect(summary.distinctKinds()).assertEqual(2);
      expect(fresh.countOf(OpKind.START)).assertEqual(2);
      done();
    });

    it('AbilityOperations_024', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const codes = fresh.codes();
      expect(codes.length).assertEqual(0);
      expect(fresh.lastKind()).assertEqual(OpKind.QUERY);
      expect(fresh.codeOfLast()).assertEqual(-1);
      done();
    });

    it('AbilityOperations_025', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      let expectedCode = 0;
      const sequence: OpKind[] = [OpKind.START, OpKind.FOR_RESULT, OpKind.WITH_ACCOUNT, OpKind.START_SERVICE];
      for (const kind of sequence) {
        const result = fresh.execute(kind);
        if (kind === OpKind.FOR_RESULT) {
          expectedCode = RESULT_CODE;
        } else if (kind === OpKind.WITH_ACCOUNT) {
          expectedCode = ACCOUNT_ID;
        } else {
          expectedCode = CONNECTION_NUMBER;
        }
        expect(result.code).assertEqual(expectedCode);
      }
      expect(fresh.size()).assertEqual(4);
      done();
    });

    it('AbilityOperations_026', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.QUERY);
      expect(fresh.lastKind()).assertEqual(OpKind.QUERY);
      expect(fresh.codeOfLast()).assertEqual(CONNECTION_NUMBER);
      expect(fresh.okCount()).assertEqual(1);
      done();
    });

    it('AbilityOperations_027', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const allKinds: OpKind[] = [OpKind.START, OpKind.FOR_RESULT, OpKind.WITH_ACCOUNT,
        OpKind.START_SERVICE, OpKind.STOP_SERVICE, OpKind.CONNECT, OpKind.DISCONNECT,
        OpKind.PERMISSION, OpKind.LABEL, OpKind.QUERY];
      for (const kind of allKinds) {
        fresh.execute(kind);
      }
      expect(fresh.size()).assertEqual(10);
      const summary = new OperationSummary(fresh);
      expect(summary.distinctKinds()).assertEqual(10);
      expect(summary.allOk()).assertTrue();
      done();
    });

    it('AbilityOperations_028', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const before = fresh.size();
      fresh.execute(OpKind.LABEL);
      const after = fresh.size();
      expect(after - before).assertEqual(1);
      expect(fresh.countOf(OpKind.LABEL)).assertEqual(1);
      done();
    });

    it('AbilityOperations_029', 0, async (done: Function) => {
      const uniqueKinds = executor.all().map((result: OpResult) => result.kind);
      let unique = true;
      for (let i = 0; i < uniqueKinds.length; i++) {
        for (let j = i + 1; j < uniqueKinds.length; j++) {
          if (uniqueKinds[i] === uniqueKinds[j]) {
            unique = false;
          }
        }
      }
      expect(unique).assertTrue();
      done();
    });

    it('AbilityOperations_030', 0, async (done: Function) => {
      const summary = new OperationSummary(executor);
      expect(summary.describe()).assertEqual('total=7,ok=7');
      expect(summary.total()).assertEqual(executor.size());
      expect(summary.distinctKinds()).assertEqual(7);
      done();
    });

    it('AbilityOperations_031', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.CONNECT);
      const connectionResult = fresh.all()[0];
      expect(connectionResult.kind).assertEqual(OpKind.CONNECT);
      expect(connectionResult.code).assertEqual(CONNECTION_NUMBER);
      const summary = new OperationSummary(fresh);
      expect(summary.allOk()).assertTrue();
      done();
    });

    it('AbilityOperations_032', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      for (let i = 0; i < 3; i++) {
        fresh.execute(OpKind.FOR_RESULT);
      }
      expect(fresh.countOf(OpKind.FOR_RESULT)).assertEqual(3);
      const codes = fresh.codes();
      expect(codes[0]).assertEqual(RESULT_CODE);
      expect(codes[1]).assertEqual(RESULT_CODE);
      expect(codes[2]).assertEqual(RESULT_CODE);
      done();
    });

    it('AbilityOperations_033', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.WITH_ACCOUNT);
      fresh.execute(OpKind.FOR_RESULT);
      const codes = fresh.codes();
      expect(codes.length).assertEqual(2);
      expect(codes[0]).assertEqual(ACCOUNT_ID);
      expect(codes[1]).assertEqual(RESULT_CODE);
      done();
    });

    it('AbilityOperations_034', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const result = new OpResult(OpKind.LABEL, true, 0);
      expect(result.describe()).assertEqual(`${OpKind.LABEL}:true:0`);
      const failed = new OpResult(OpKind.DISCONNECT, false, -1);
      expect(failed.ok).assertFalse();
      expect(failed.code).assertEqual(-1);
      done();
    });

    it('AbilityOperations_035', 0, async (done: Function) => {
      let total = 0;
      for (const result of executor.all()) {
        total += result.code;
      }
      expect(total).assertEqual(ACCOUNT_ID + RESULT_CODE);
      done();
    });

    it('AbilityOperations_036', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.START);
      fresh.execute(OpKind.FOR_RESULT);
      expect(fresh.all()[0].kind).assertEqual(OpKind.START);
      expect(fresh.all()[1].kind).assertEqual(OpKind.FOR_RESULT);
      expect(fresh.all()[0].describe()).assertEqual(`${OpKind.START}:true:${CONNECTION_NUMBER}`);
      done();
    });

    it('AbilityOperations_037', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.STOP_SERVICE);
      fresh.execute(OpKind.DISCONNECT);
      const summary = new OperationSummary(fresh);
      expect(summary.total()).assertEqual(2);
      expect(summary.distinctKinds()).assertEqual(2);
      expect(fresh.codeOfLast()).assertEqual(CONNECTION_NUMBER);
      done();
    });

    it('AbilityOperations_038', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const kinds: OpKind[] = [OpKind.START, OpKind.START, OpKind.START, OpKind.FOR_RESULT];
      for (const kind of kinds) {
        fresh.execute(kind);
      }
      expect(fresh.countOf(OpKind.START)).assertEqual(3);
      expect(fresh.countOf(OpKind.FOR_RESULT)).assertEqual(1);
      const summary = new OperationSummary(fresh);
      expect(summary.distinctKinds()).assertEqual(2);
      done();
    });

    it('AbilityOperations_039', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      let ok = 0;
      for (let i = 0; i < 8; i++) {
        if (fresh.execute(OpKind.PERMISSION).ok) {
          ok += 1;
        }
      }
      expect(ok).assertEqual(8);
      expect(fresh.size()).assertEqual(8);
      expect(fresh.countOf(OpKind.PERMISSION)).assertEqual(8);
      done();
    });

    it('AbilityOperations_040', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.LABEL);
      fresh.execute(OpKind.QUERY);
      expect(fresh.lastKind()).assertEqual(OpKind.QUERY);
      expect(fresh.codes().length).assertEqual(2);
      expect(fresh.codeOfLast()).assertEqual(CONNECTION_NUMBER);
      done();
    });

    it('AbilityOperations_041', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const sequence: OpKind[] = [OpKind.START_SERVICE, OpKind.CONNECT, OpKind.PERMISSION,
        OpKind.LABEL, OpKind.DISCONNECT, OpKind.STOP_SERVICE];
      for (const kind of sequence) {
        fresh.execute(kind);
      }
      expect(fresh.size()).assertEqual(6);
      expect(fresh.lastKind()).assertEqual(OpKind.STOP_SERVICE);
      expect(new OperationSummary(fresh).allOk()).assertTrue();
      done();
    });

    it('AbilityOperations_042', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.WITH_ACCOUNT);
      fresh.execute(OpKind.WITH_ACCOUNT);
      const codes = fresh.codes();
      expect(codes.length).assertEqual(2);
      expect(codes[0]).assertEqual(ACCOUNT_ID);
      expect(codes[1]).assertEqual(ACCOUNT_ID);
      expect(fresh.countOf(OpKind.WITH_ACCOUNT)).assertEqual(2);
      done();
    });

    it('AbilityOperations_043', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.START);
      const snapshot = fresh.all();
      expect(snapshot.length).assertEqual(1);
      fresh.execute(OpKind.START);
      expect(snapshot.length).assertEqual(2);
      expect(fresh.size()).assertEqual(2);
      done();
    });

    it('AbilityOperations_044', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const result = fresh.execute(OpKind.FOR_RESULT);
      expect(result.kind).assertEqual(OpKind.FOR_RESULT);
      expect(result.ok).assertTrue();
      const summary = new OperationSummary(fresh);
      expect(summary.total()).assertEqual(1);
      expect(summary.allOk()).assertTrue();
      done();
    });

    it('AbilityOperations_045', 0, async (done: Function) => {
      let kindsWithoutLabel = 0;
      for (const result of executor.all()) {
        if (result.kind !== OpKind.LABEL) {
          kindsWithoutLabel += 1;
        }
      }
      expect(kindsWithoutLabel).assertEqual(6);
      expect(executor.size() - kindsWithoutLabel).assertEqual(1);
      done();
    });

    it('AbilityOperations_046', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      for (let i = 0; i < 4; i++) {
        fresh.execute(OpKind.START);
        fresh.execute(OpKind.FOR_RESULT);
      }
      expect(fresh.size()).assertEqual(8);
      expect(fresh.countOf(OpKind.START)).assertEqual(4);
      expect(fresh.countOf(OpKind.FOR_RESULT)).assertEqual(4);
      done();
    });

    it('AbilityOperations_047', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      fresh.execute(OpKind.CONNECT);
      fresh.execute(OpKind.DISCONNECT);
      const codes = fresh.codes();
      expect(codes[0]).assertEqual(CONNECTION_NUMBER);
      expect(codes[1]).assertEqual(CONNECTION_NUMBER);
      expect(new OperationSummary(fresh).distinctKinds()).assertEqual(2);
      done();
    });

    it('AbilityOperations_048', 0, async (done: Function) => {
      const fresh = new OperationExecutor();
      const labelResult = fresh.execute(OpKind.LABEL);
      expect(labelResult.describe()).assertEqual(`${OpKind.LABEL}:true:0`);
      expect(fresh.lastKind()).assertEqual(OpKind.LABEL);
      expect(fresh.okCount()).assertEqual(1);
      done();
    });

    it('AbilityOperations_049', 0, async (done: Function) => {
      const counts: number[] = [];
      for (let i = 0; i < 3; i++) {
        const fresh = new OperationExecutor();
        for (let j = 0; j <= i; j++) {
          fresh.execute(OpKind.START);
        }
        counts.push(fresh.size());
      }
      expect(counts.length).assertEqual(3);
      expect(counts[0]).assertEqual(1);
      expect(counts[1]).assertEqual(2);
      expect(counts[2]).assertEqual(3);
      done();
    });

    it('AbilityOperations_050', 0, async (done: Function) => {
      const summary = new OperationSummary(executor);
      expect(summary.total()).assertEqual(executor.all().length);
      expect(summary.allOk()).assertTrue();
      expect(executor.codes().length).assertEqual(7);
      done();
    });
  });
}


