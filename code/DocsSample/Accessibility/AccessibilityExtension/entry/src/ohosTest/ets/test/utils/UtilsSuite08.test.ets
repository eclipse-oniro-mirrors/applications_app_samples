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

import { afterAll, describe, expect, it } from '@ohos/hypium';
import { MathUtils } from '../../../../main/ets/common/utils/MathUtils';
import { addLog, runCase } from '../../testkit/SharedDriver';

function refIsPrime(value: number): boolean {
  if (value < 2) {
    return false;
  }
  let divisor = 2;
  while (divisor * divisor <= value) {
    if (value % divisor === 0) {
      return false;
    }
    divisor = divisor + 1;
  }
  return true;
}

function refFib(value: number): number {
  if (value < 0) {
    return 0;
  }
  if (value === 0) {
    return 0;
  }
  if (value === 1) {
    return 1;
  }
  let previous = 0;
  let current = 1;
  let index = 2;
  while (index <= value) {
    const next = previous + current;
    previous = current;
    current = next;
    index = index + 1;
  }
  return current;
}

function refDigitSum(value: number): number {
  let rest = Math.abs(Math.trunc(value));
  let total = 0;
  while (rest > 0) {
    total = total + rest % 10;
    rest = Math.floor(rest / 10);
  }
  return total;
}

/**
 * MathUtils utility suite.
 *
 * Every case feeds one pooled input through a single helper and compares the
 * result against a locally written oracle. The helper is not referenced from
 * pages/Index.ets, so the suite exercises a surface the sample page never uses.
 */
export default function utilsSuite08(): void {
  describe('MathUtilsUtilsTest', () => {
    afterAll(() => {
      addLog('utilsSuite08 suite finished');
    })

    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0001
     * @tc.name      testUtilsSuite08Case0001
     * @tc.desc      Verify MathUtils.add over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0001', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0001', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.add';
        addLog('testUtilsSuite08Case0001: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0001: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input + 7;
        addLog('testUtilsSuite08Case0001: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.add(input, 7);
        addLog('testUtilsSuite08Case0001: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.add(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0001: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0002
     * @tc.name      testUtilsSuite08Case0002
     * @tc.desc      Verify MathUtils.add over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0002', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0002', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.add';
        addLog('testUtilsSuite08Case0002: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0002: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input + 7;
        addLog('testUtilsSuite08Case0002: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.add(input, 7);
        addLog('testUtilsSuite08Case0002: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.add(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0002: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0003
     * @tc.name      testUtilsSuite08Case0003
     * @tc.desc      Verify MathUtils.add over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0003', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0003', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.add';
        addLog('testUtilsSuite08Case0003: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0003: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input + 7;
        addLog('testUtilsSuite08Case0003: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.add(input, 7);
        addLog('testUtilsSuite08Case0003: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.add(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0003: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0004
     * @tc.name      testUtilsSuite08Case0004
     * @tc.desc      Verify MathUtils.add over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0004', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0004', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.add';
        addLog('testUtilsSuite08Case0004: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0004: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input + 7;
        addLog('testUtilsSuite08Case0004: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.add(input, 7);
        addLog('testUtilsSuite08Case0004: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.add(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0004: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0005
     * @tc.name      testUtilsSuite08Case0005
     * @tc.desc      Verify MathUtils.add over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0005', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0005', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.add';
        addLog('testUtilsSuite08Case0005: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0005: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input + 7;
        addLog('testUtilsSuite08Case0005: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.add(input, 7);
        addLog('testUtilsSuite08Case0005: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.add(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0005: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0006
     * @tc.name      testUtilsSuite08Case0006
     * @tc.desc      Verify MathUtils.add over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0006', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0006', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.add';
        addLog('testUtilsSuite08Case0006: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0006: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input + 7;
        addLog('testUtilsSuite08Case0006: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.add(input, 7);
        addLog('testUtilsSuite08Case0006: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.add(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0006: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0007
     * @tc.name      testUtilsSuite08Case0007
     * @tc.desc      Verify MathUtils.add over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0007', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0007', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.add';
        addLog('testUtilsSuite08Case0007: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0007: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input + 7;
        addLog('testUtilsSuite08Case0007: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.add(input, 7);
        addLog('testUtilsSuite08Case0007: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.add(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0007: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0008
     * @tc.name      testUtilsSuite08Case0008
     * @tc.desc      Verify MathUtils.add over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0008', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0008', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.add';
        addLog('testUtilsSuite08Case0008: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0008: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input + 7;
        addLog('testUtilsSuite08Case0008: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.add(input, 7);
        addLog('testUtilsSuite08Case0008: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.add(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0008: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0009
     * @tc.name      testUtilsSuite08Case0009
     * @tc.desc      Verify MathUtils.sub over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0009', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0009', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sub';
        addLog('testUtilsSuite08Case0009: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0009: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input - 7;
        addLog('testUtilsSuite08Case0009: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sub(input, 7);
        addLog('testUtilsSuite08Case0009: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sub(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0009: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0010
     * @tc.name      testUtilsSuite08Case0010
     * @tc.desc      Verify MathUtils.sub over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0010', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0010', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sub';
        addLog('testUtilsSuite08Case0010: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0010: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input - 7;
        addLog('testUtilsSuite08Case0010: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sub(input, 7);
        addLog('testUtilsSuite08Case0010: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sub(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0010: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0011
     * @tc.name      testUtilsSuite08Case0011
     * @tc.desc      Verify MathUtils.sub over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0011', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0011', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sub';
        addLog('testUtilsSuite08Case0011: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0011: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input - 7;
        addLog('testUtilsSuite08Case0011: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sub(input, 7);
        addLog('testUtilsSuite08Case0011: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sub(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0011: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0012
     * @tc.name      testUtilsSuite08Case0012
     * @tc.desc      Verify MathUtils.sub over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0012', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0012', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sub';
        addLog('testUtilsSuite08Case0012: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0012: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input - 7;
        addLog('testUtilsSuite08Case0012: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sub(input, 7);
        addLog('testUtilsSuite08Case0012: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sub(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0012: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0013
     * @tc.name      testUtilsSuite08Case0013
     * @tc.desc      Verify MathUtils.sub over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0013', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0013', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sub';
        addLog('testUtilsSuite08Case0013: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0013: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input - 7;
        addLog('testUtilsSuite08Case0013: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sub(input, 7);
        addLog('testUtilsSuite08Case0013: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sub(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0013: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0014
     * @tc.name      testUtilsSuite08Case0014
     * @tc.desc      Verify MathUtils.sub over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0014', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0014', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sub';
        addLog('testUtilsSuite08Case0014: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0014: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input - 7;
        addLog('testUtilsSuite08Case0014: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sub(input, 7);
        addLog('testUtilsSuite08Case0014: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sub(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0014: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0015
     * @tc.name      testUtilsSuite08Case0015
     * @tc.desc      Verify MathUtils.sub over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0015', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0015', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sub';
        addLog('testUtilsSuite08Case0015: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0015: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input - 7;
        addLog('testUtilsSuite08Case0015: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sub(input, 7);
        addLog('testUtilsSuite08Case0015: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sub(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0015: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0016
     * @tc.name      testUtilsSuite08Case0016
     * @tc.desc      Verify MathUtils.sub over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0016', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0016', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sub';
        addLog('testUtilsSuite08Case0016: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0016: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input - 7;
        addLog('testUtilsSuite08Case0016: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sub(input, 7);
        addLog('testUtilsSuite08Case0016: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sub(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0016: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0017
     * @tc.name      testUtilsSuite08Case0017
     * @tc.desc      Verify MathUtils.mul over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0017', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0017', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.mul';
        addLog('testUtilsSuite08Case0017: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0017: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 3;
        addLog('testUtilsSuite08Case0017: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.mul(input, 3);
        addLog('testUtilsSuite08Case0017: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.mul(input, 3);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0017: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0018
     * @tc.name      testUtilsSuite08Case0018
     * @tc.desc      Verify MathUtils.mul over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0018', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0018', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.mul';
        addLog('testUtilsSuite08Case0018: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0018: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 3;
        addLog('testUtilsSuite08Case0018: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.mul(input, 3);
        addLog('testUtilsSuite08Case0018: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.mul(input, 3);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0018: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0019
     * @tc.name      testUtilsSuite08Case0019
     * @tc.desc      Verify MathUtils.mul over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0019', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0019', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.mul';
        addLog('testUtilsSuite08Case0019: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0019: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 3;
        addLog('testUtilsSuite08Case0019: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.mul(input, 3);
        addLog('testUtilsSuite08Case0019: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.mul(input, 3);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0019: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0020
     * @tc.name      testUtilsSuite08Case0020
     * @tc.desc      Verify MathUtils.mul over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0020', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0020', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.mul';
        addLog('testUtilsSuite08Case0020: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0020: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 3;
        addLog('testUtilsSuite08Case0020: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.mul(input, 3);
        addLog('testUtilsSuite08Case0020: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.mul(input, 3);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0020: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0021
     * @tc.name      testUtilsSuite08Case0021
     * @tc.desc      Verify MathUtils.mul over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0021', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0021', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.mul';
        addLog('testUtilsSuite08Case0021: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0021: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 3;
        addLog('testUtilsSuite08Case0021: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.mul(input, 3);
        addLog('testUtilsSuite08Case0021: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.mul(input, 3);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0021: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0022
     * @tc.name      testUtilsSuite08Case0022
     * @tc.desc      Verify MathUtils.mul over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0022', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0022', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.mul';
        addLog('testUtilsSuite08Case0022: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0022: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 3;
        addLog('testUtilsSuite08Case0022: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.mul(input, 3);
        addLog('testUtilsSuite08Case0022: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.mul(input, 3);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0022: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0023
     * @tc.name      testUtilsSuite08Case0023
     * @tc.desc      Verify MathUtils.mul over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0023', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0023', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.mul';
        addLog('testUtilsSuite08Case0023: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0023: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 3;
        addLog('testUtilsSuite08Case0023: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.mul(input, 3);
        addLog('testUtilsSuite08Case0023: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.mul(input, 3);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0023: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0024
     * @tc.name      testUtilsSuite08Case0024
     * @tc.desc      Verify MathUtils.mul over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0024', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0024', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.mul';
        addLog('testUtilsSuite08Case0024: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0024: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 3;
        addLog('testUtilsSuite08Case0024: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.mul(input, 3);
        addLog('testUtilsSuite08Case0024: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.mul(input, 3);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0024: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0025
     * @tc.name      testUtilsSuite08Case0025
     * @tc.desc      Verify MathUtils.divSafe over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0025', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0025', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.divSafe';
        addLog('testUtilsSuite08Case0025: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0025: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input / 4;
        addLog('testUtilsSuite08Case0025: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.divSafe(input, 4);
        addLog('testUtilsSuite08Case0025: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.divSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0025: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0026
     * @tc.name      testUtilsSuite08Case0026
     * @tc.desc      Verify MathUtils.divSafe over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0026', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0026', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.divSafe';
        addLog('testUtilsSuite08Case0026: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0026: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input / 4;
        addLog('testUtilsSuite08Case0026: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.divSafe(input, 4);
        addLog('testUtilsSuite08Case0026: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.divSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0026: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0027
     * @tc.name      testUtilsSuite08Case0027
     * @tc.desc      Verify MathUtils.divSafe over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0027', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0027', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.divSafe';
        addLog('testUtilsSuite08Case0027: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0027: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input / 4;
        addLog('testUtilsSuite08Case0027: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.divSafe(input, 4);
        addLog('testUtilsSuite08Case0027: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.divSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0027: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0028
     * @tc.name      testUtilsSuite08Case0028
     * @tc.desc      Verify MathUtils.divSafe over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0028', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0028', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.divSafe';
        addLog('testUtilsSuite08Case0028: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0028: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input / 4;
        addLog('testUtilsSuite08Case0028: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.divSafe(input, 4);
        addLog('testUtilsSuite08Case0028: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.divSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0028: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0029
     * @tc.name      testUtilsSuite08Case0029
     * @tc.desc      Verify MathUtils.divSafe over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0029', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0029', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.divSafe';
        addLog('testUtilsSuite08Case0029: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0029: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input / 4;
        addLog('testUtilsSuite08Case0029: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.divSafe(input, 4);
        addLog('testUtilsSuite08Case0029: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.divSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0029: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0030
     * @tc.name      testUtilsSuite08Case0030
     * @tc.desc      Verify MathUtils.divSafe over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0030', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0030', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.divSafe';
        addLog('testUtilsSuite08Case0030: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0030: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input / 4;
        addLog('testUtilsSuite08Case0030: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.divSafe(input, 4);
        addLog('testUtilsSuite08Case0030: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.divSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0030: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0031
     * @tc.name      testUtilsSuite08Case0031
     * @tc.desc      Verify MathUtils.divSafe over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0031', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0031', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.divSafe';
        addLog('testUtilsSuite08Case0031: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0031: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input / 4;
        addLog('testUtilsSuite08Case0031: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.divSafe(input, 4);
        addLog('testUtilsSuite08Case0031: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.divSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0031: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0032
     * @tc.name      testUtilsSuite08Case0032
     * @tc.desc      Verify MathUtils.divSafe over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0032', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0032', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.divSafe';
        addLog('testUtilsSuite08Case0032: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0032: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input / 4;
        addLog('testUtilsSuite08Case0032: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.divSafe(input, 4);
        addLog('testUtilsSuite08Case0032: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.divSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0032: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0033
     * @tc.name      testUtilsSuite08Case0033
     * @tc.desc      Verify MathUtils.modSafe over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0033', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0033', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.modSafe';
        addLog('testUtilsSuite08Case0033: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0033: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input % 4;
        addLog('testUtilsSuite08Case0033: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.modSafe(input, 4);
        addLog('testUtilsSuite08Case0033: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.modSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0033: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0034
     * @tc.name      testUtilsSuite08Case0034
     * @tc.desc      Verify MathUtils.modSafe over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0034', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0034', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.modSafe';
        addLog('testUtilsSuite08Case0034: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0034: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input % 4;
        addLog('testUtilsSuite08Case0034: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.modSafe(input, 4);
        addLog('testUtilsSuite08Case0034: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.modSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0034: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0035
     * @tc.name      testUtilsSuite08Case0035
     * @tc.desc      Verify MathUtils.modSafe over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0035', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0035', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.modSafe';
        addLog('testUtilsSuite08Case0035: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0035: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input % 4;
        addLog('testUtilsSuite08Case0035: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.modSafe(input, 4);
        addLog('testUtilsSuite08Case0035: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.modSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0035: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0036
     * @tc.name      testUtilsSuite08Case0036
     * @tc.desc      Verify MathUtils.modSafe over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0036', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0036', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.modSafe';
        addLog('testUtilsSuite08Case0036: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0036: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input % 4;
        addLog('testUtilsSuite08Case0036: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.modSafe(input, 4);
        addLog('testUtilsSuite08Case0036: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.modSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0036: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0037
     * @tc.name      testUtilsSuite08Case0037
     * @tc.desc      Verify MathUtils.modSafe over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0037', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0037', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.modSafe';
        addLog('testUtilsSuite08Case0037: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0037: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input % 4;
        addLog('testUtilsSuite08Case0037: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.modSafe(input, 4);
        addLog('testUtilsSuite08Case0037: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.modSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0037: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0038
     * @tc.name      testUtilsSuite08Case0038
     * @tc.desc      Verify MathUtils.modSafe over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0038', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0038', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.modSafe';
        addLog('testUtilsSuite08Case0038: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0038: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input % 4;
        addLog('testUtilsSuite08Case0038: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.modSafe(input, 4);
        addLog('testUtilsSuite08Case0038: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.modSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0038: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0039
     * @tc.name      testUtilsSuite08Case0039
     * @tc.desc      Verify MathUtils.modSafe over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0039', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0039', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.modSafe';
        addLog('testUtilsSuite08Case0039: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0039: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input % 4;
        addLog('testUtilsSuite08Case0039: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.modSafe(input, 4);
        addLog('testUtilsSuite08Case0039: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.modSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0039: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0040
     * @tc.name      testUtilsSuite08Case0040
     * @tc.desc      Verify MathUtils.modSafe over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0040', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0040', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.modSafe';
        addLog('testUtilsSuite08Case0040: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0040: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input % 4;
        addLog('testUtilsSuite08Case0040: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.modSafe(input, 4);
        addLog('testUtilsSuite08Case0040: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.modSafe(input, 4);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0040: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0041
     * @tc.name      testUtilsSuite08Case0041
     * @tc.desc      Verify MathUtils.averageOfTwo over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0041', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0041', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.averageOfTwo';
        addLog('testUtilsSuite08Case0041: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0041: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = (input + 8) / 2;
        addLog('testUtilsSuite08Case0041: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.averageOfTwo(input, 8);
        addLog('testUtilsSuite08Case0041: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.averageOfTwo(input, 8);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0041: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0042
     * @tc.name      testUtilsSuite08Case0042
     * @tc.desc      Verify MathUtils.averageOfTwo over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0042', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0042', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.averageOfTwo';
        addLog('testUtilsSuite08Case0042: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0042: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = (input + 8) / 2;
        addLog('testUtilsSuite08Case0042: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.averageOfTwo(input, 8);
        addLog('testUtilsSuite08Case0042: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.averageOfTwo(input, 8);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0042: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0043
     * @tc.name      testUtilsSuite08Case0043
     * @tc.desc      Verify MathUtils.averageOfTwo over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0043', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0043', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.averageOfTwo';
        addLog('testUtilsSuite08Case0043: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0043: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = (input + 8) / 2;
        addLog('testUtilsSuite08Case0043: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.averageOfTwo(input, 8);
        addLog('testUtilsSuite08Case0043: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.averageOfTwo(input, 8);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0043: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0044
     * @tc.name      testUtilsSuite08Case0044
     * @tc.desc      Verify MathUtils.averageOfTwo over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0044', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0044', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.averageOfTwo';
        addLog('testUtilsSuite08Case0044: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0044: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = (input + 8) / 2;
        addLog('testUtilsSuite08Case0044: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.averageOfTwo(input, 8);
        addLog('testUtilsSuite08Case0044: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.averageOfTwo(input, 8);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0044: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0045
     * @tc.name      testUtilsSuite08Case0045
     * @tc.desc      Verify MathUtils.averageOfTwo over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0045', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0045', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.averageOfTwo';
        addLog('testUtilsSuite08Case0045: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0045: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = (input + 8) / 2;
        addLog('testUtilsSuite08Case0045: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.averageOfTwo(input, 8);
        addLog('testUtilsSuite08Case0045: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.averageOfTwo(input, 8);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0045: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0046
     * @tc.name      testUtilsSuite08Case0046
     * @tc.desc      Verify MathUtils.averageOfTwo over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0046', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0046', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.averageOfTwo';
        addLog('testUtilsSuite08Case0046: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0046: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = (input + 8) / 2;
        addLog('testUtilsSuite08Case0046: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.averageOfTwo(input, 8);
        addLog('testUtilsSuite08Case0046: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.averageOfTwo(input, 8);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0046: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0047
     * @tc.name      testUtilsSuite08Case0047
     * @tc.desc      Verify MathUtils.averageOfTwo over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0047', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0047', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.averageOfTwo';
        addLog('testUtilsSuite08Case0047: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0047: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = (input + 8) / 2;
        addLog('testUtilsSuite08Case0047: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.averageOfTwo(input, 8);
        addLog('testUtilsSuite08Case0047: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.averageOfTwo(input, 8);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0047: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0048
     * @tc.name      testUtilsSuite08Case0048
     * @tc.desc      Verify MathUtils.averageOfTwo over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0048', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0048', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.averageOfTwo';
        addLog('testUtilsSuite08Case0048: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0048: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = (input + 8) / 2;
        addLog('testUtilsSuite08Case0048: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.averageOfTwo(input, 8);
        addLog('testUtilsSuite08Case0048: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.averageOfTwo(input, 8);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0048: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0049
     * @tc.name      testUtilsSuite08Case0049
     * @tc.desc      Verify MathUtils.medianOfThree over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0049', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0049', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.medianOfThree';
        addLog('testUtilsSuite08Case0049: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0049: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 1 ? 1 : (input <= 5 ? input : 5);
        addLog('testUtilsSuite08Case0049: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.medianOfThree(input, 1, 5);
        addLog('testUtilsSuite08Case0049: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.medianOfThree(input, 1, 5);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0049: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0050
     * @tc.name      testUtilsSuite08Case0050
     * @tc.desc      Verify MathUtils.medianOfThree over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0050', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0050', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.medianOfThree';
        addLog('testUtilsSuite08Case0050: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0050: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 1 ? 1 : (input <= 5 ? input : 5);
        addLog('testUtilsSuite08Case0050: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.medianOfThree(input, 1, 5);
        addLog('testUtilsSuite08Case0050: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.medianOfThree(input, 1, 5);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0050: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0051
     * @tc.name      testUtilsSuite08Case0051
     * @tc.desc      Verify MathUtils.medianOfThree over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0051', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0051', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.medianOfThree';
        addLog('testUtilsSuite08Case0051: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0051: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 1 ? 1 : (input <= 5 ? input : 5);
        addLog('testUtilsSuite08Case0051: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.medianOfThree(input, 1, 5);
        addLog('testUtilsSuite08Case0051: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.medianOfThree(input, 1, 5);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0051: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0052
     * @tc.name      testUtilsSuite08Case0052
     * @tc.desc      Verify MathUtils.medianOfThree over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0052', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0052', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.medianOfThree';
        addLog('testUtilsSuite08Case0052: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0052: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 1 ? 1 : (input <= 5 ? input : 5);
        addLog('testUtilsSuite08Case0052: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.medianOfThree(input, 1, 5);
        addLog('testUtilsSuite08Case0052: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.medianOfThree(input, 1, 5);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0052: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0053
     * @tc.name      testUtilsSuite08Case0053
     * @tc.desc      Verify MathUtils.medianOfThree over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0053', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0053', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.medianOfThree';
        addLog('testUtilsSuite08Case0053: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0053: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 1 ? 1 : (input <= 5 ? input : 5);
        addLog('testUtilsSuite08Case0053: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.medianOfThree(input, 1, 5);
        addLog('testUtilsSuite08Case0053: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.medianOfThree(input, 1, 5);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0053: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0054
     * @tc.name      testUtilsSuite08Case0054
     * @tc.desc      Verify MathUtils.medianOfThree over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0054', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0054', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.medianOfThree';
        addLog('testUtilsSuite08Case0054: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0054: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 1 ? 1 : (input <= 5 ? input : 5);
        addLog('testUtilsSuite08Case0054: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.medianOfThree(input, 1, 5);
        addLog('testUtilsSuite08Case0054: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.medianOfThree(input, 1, 5);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0054: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0055
     * @tc.name      testUtilsSuite08Case0055
     * @tc.desc      Verify MathUtils.medianOfThree over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0055', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0055', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.medianOfThree';
        addLog('testUtilsSuite08Case0055: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0055: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 1 ? 1 : (input <= 5 ? input : 5);
        addLog('testUtilsSuite08Case0055: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.medianOfThree(input, 1, 5);
        addLog('testUtilsSuite08Case0055: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.medianOfThree(input, 1, 5);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0055: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0056
     * @tc.name      testUtilsSuite08Case0056
     * @tc.desc      Verify MathUtils.medianOfThree over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0056', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0056', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.medianOfThree';
        addLog('testUtilsSuite08Case0056: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0056: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 1 ? 1 : (input <= 5 ? input : 5);
        addLog('testUtilsSuite08Case0056: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.medianOfThree(input, 1, 5);
        addLog('testUtilsSuite08Case0056: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.medianOfThree(input, 1, 5);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0056: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0057
     * @tc.name      testUtilsSuite08Case0057
     * @tc.desc      Verify MathUtils.isPrime over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0057', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0057', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.isPrime';
        addLog('testUtilsSuite08Case0057: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0057: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = refIsPrime(input);
        addLog('testUtilsSuite08Case0057: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = MathUtils.isPrime(input);
        addLog('testUtilsSuite08Case0057: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = MathUtils.isPrime(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0057: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0058
     * @tc.name      testUtilsSuite08Case0058
     * @tc.desc      Verify MathUtils.isPrime over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0058', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0058', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.isPrime';
        addLog('testUtilsSuite08Case0058: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0058: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = refIsPrime(input);
        addLog('testUtilsSuite08Case0058: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = MathUtils.isPrime(input);
        addLog('testUtilsSuite08Case0058: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = MathUtils.isPrime(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0058: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0059
     * @tc.name      testUtilsSuite08Case0059
     * @tc.desc      Verify MathUtils.isPrime over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0059', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0059', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.isPrime';
        addLog('testUtilsSuite08Case0059: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0059: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = refIsPrime(input);
        addLog('testUtilsSuite08Case0059: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = MathUtils.isPrime(input);
        addLog('testUtilsSuite08Case0059: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = MathUtils.isPrime(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0059: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0060
     * @tc.name      testUtilsSuite08Case0060
     * @tc.desc      Verify MathUtils.isPrime over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0060', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0060', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.isPrime';
        addLog('testUtilsSuite08Case0060: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0060: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = refIsPrime(input);
        addLog('testUtilsSuite08Case0060: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = MathUtils.isPrime(input);
        addLog('testUtilsSuite08Case0060: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = MathUtils.isPrime(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0060: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0061
     * @tc.name      testUtilsSuite08Case0061
     * @tc.desc      Verify MathUtils.isPrime over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0061', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0061', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.isPrime';
        addLog('testUtilsSuite08Case0061: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0061: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = refIsPrime(input);
        addLog('testUtilsSuite08Case0061: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = MathUtils.isPrime(input);
        addLog('testUtilsSuite08Case0061: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = MathUtils.isPrime(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0061: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0062
     * @tc.name      testUtilsSuite08Case0062
     * @tc.desc      Verify MathUtils.isPrime over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0062', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0062', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.isPrime';
        addLog('testUtilsSuite08Case0062: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0062: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = refIsPrime(input);
        addLog('testUtilsSuite08Case0062: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = MathUtils.isPrime(input);
        addLog('testUtilsSuite08Case0062: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = MathUtils.isPrime(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0062: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0063
     * @tc.name      testUtilsSuite08Case0063
     * @tc.desc      Verify MathUtils.isPrime over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0063', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0063', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.isPrime';
        addLog('testUtilsSuite08Case0063: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0063: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = refIsPrime(input);
        addLog('testUtilsSuite08Case0063: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = MathUtils.isPrime(input);
        addLog('testUtilsSuite08Case0063: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = MathUtils.isPrime(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0063: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0064
     * @tc.name      testUtilsSuite08Case0064
     * @tc.desc      Verify MathUtils.isPrime over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0064', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0064', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.isPrime';
        addLog('testUtilsSuite08Case0064: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0064: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = refIsPrime(input);
        addLog('testUtilsSuite08Case0064: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = MathUtils.isPrime(input);
        addLog('testUtilsSuite08Case0064: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = MathUtils.isPrime(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0064: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0065
     * @tc.name      testUtilsSuite08Case0065
     * @tc.desc      Verify MathUtils.fib over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0065', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0065', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.fib';
        addLog('testUtilsSuite08Case0065: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0065: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refFib(input);
        addLog('testUtilsSuite08Case0065: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.fib(input);
        addLog('testUtilsSuite08Case0065: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.fib(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0065: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0066
     * @tc.name      testUtilsSuite08Case0066
     * @tc.desc      Verify MathUtils.fib over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0066', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0066', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.fib';
        addLog('testUtilsSuite08Case0066: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0066: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refFib(input);
        addLog('testUtilsSuite08Case0066: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.fib(input);
        addLog('testUtilsSuite08Case0066: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.fib(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0066: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0067
     * @tc.name      testUtilsSuite08Case0067
     * @tc.desc      Verify MathUtils.fib over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0067', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0067', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.fib';
        addLog('testUtilsSuite08Case0067: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0067: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refFib(input);
        addLog('testUtilsSuite08Case0067: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.fib(input);
        addLog('testUtilsSuite08Case0067: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.fib(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0067: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0068
     * @tc.name      testUtilsSuite08Case0068
     * @tc.desc      Verify MathUtils.fib over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0068', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0068', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.fib';
        addLog('testUtilsSuite08Case0068: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0068: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refFib(input);
        addLog('testUtilsSuite08Case0068: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.fib(input);
        addLog('testUtilsSuite08Case0068: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.fib(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0068: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0069
     * @tc.name      testUtilsSuite08Case0069
     * @tc.desc      Verify MathUtils.fib over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0069', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0069', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.fib';
        addLog('testUtilsSuite08Case0069: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0069: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refFib(input);
        addLog('testUtilsSuite08Case0069: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.fib(input);
        addLog('testUtilsSuite08Case0069: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.fib(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0069: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0070
     * @tc.name      testUtilsSuite08Case0070
     * @tc.desc      Verify MathUtils.fib over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0070', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0070', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.fib';
        addLog('testUtilsSuite08Case0070: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0070: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refFib(input);
        addLog('testUtilsSuite08Case0070: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.fib(input);
        addLog('testUtilsSuite08Case0070: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.fib(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0070: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0071
     * @tc.name      testUtilsSuite08Case0071
     * @tc.desc      Verify MathUtils.fib over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0071', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0071', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.fib';
        addLog('testUtilsSuite08Case0071: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0071: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refFib(input);
        addLog('testUtilsSuite08Case0071: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.fib(input);
        addLog('testUtilsSuite08Case0071: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.fib(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0071: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0072
     * @tc.name      testUtilsSuite08Case0072
     * @tc.desc      Verify MathUtils.fib over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0072', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0072', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.fib';
        addLog('testUtilsSuite08Case0072: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0072: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refFib(input);
        addLog('testUtilsSuite08Case0072: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.fib(input);
        addLog('testUtilsSuite08Case0072: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.fib(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0072: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0073
     * @tc.name      testUtilsSuite08Case0073
     * @tc.desc      Verify MathUtils.distanceToOrigin over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0073', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0073', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.distanceToOrigin';
        addLog('testUtilsSuite08Case0073: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0073: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.sqrt(input * input * 2);
        addLog('testUtilsSuite08Case0073: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.distanceToOrigin(input);
        addLog('testUtilsSuite08Case0073: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.distanceToOrigin(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0073: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0074
     * @tc.name      testUtilsSuite08Case0074
     * @tc.desc      Verify MathUtils.distanceToOrigin over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0074', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0074', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.distanceToOrigin';
        addLog('testUtilsSuite08Case0074: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0074: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.sqrt(input * input * 2);
        addLog('testUtilsSuite08Case0074: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.distanceToOrigin(input);
        addLog('testUtilsSuite08Case0074: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.distanceToOrigin(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0074: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0075
     * @tc.name      testUtilsSuite08Case0075
     * @tc.desc      Verify MathUtils.distanceToOrigin over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0075', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0075', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.distanceToOrigin';
        addLog('testUtilsSuite08Case0075: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0075: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.sqrt(input * input * 2);
        addLog('testUtilsSuite08Case0075: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.distanceToOrigin(input);
        addLog('testUtilsSuite08Case0075: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.distanceToOrigin(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0075: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0076
     * @tc.name      testUtilsSuite08Case0076
     * @tc.desc      Verify MathUtils.distanceToOrigin over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0076', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0076', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.distanceToOrigin';
        addLog('testUtilsSuite08Case0076: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0076: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.sqrt(input * input * 2);
        addLog('testUtilsSuite08Case0076: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.distanceToOrigin(input);
        addLog('testUtilsSuite08Case0076: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.distanceToOrigin(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0076: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0077
     * @tc.name      testUtilsSuite08Case0077
     * @tc.desc      Verify MathUtils.distanceToOrigin over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0077', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0077', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.distanceToOrigin';
        addLog('testUtilsSuite08Case0077: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0077: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.sqrt(input * input * 2);
        addLog('testUtilsSuite08Case0077: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.distanceToOrigin(input);
        addLog('testUtilsSuite08Case0077: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.distanceToOrigin(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0077: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0078
     * @tc.name      testUtilsSuite08Case0078
     * @tc.desc      Verify MathUtils.distanceToOrigin over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0078', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0078', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.distanceToOrigin';
        addLog('testUtilsSuite08Case0078: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0078: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.sqrt(input * input * 2);
        addLog('testUtilsSuite08Case0078: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.distanceToOrigin(input);
        addLog('testUtilsSuite08Case0078: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.distanceToOrigin(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0078: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0079
     * @tc.name      testUtilsSuite08Case0079
     * @tc.desc      Verify MathUtils.distanceToOrigin over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0079', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0079', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.distanceToOrigin';
        addLog('testUtilsSuite08Case0079: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0079: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.sqrt(input * input * 2);
        addLog('testUtilsSuite08Case0079: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.distanceToOrigin(input);
        addLog('testUtilsSuite08Case0079: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.distanceToOrigin(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0079: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0080
     * @tc.name      testUtilsSuite08Case0080
     * @tc.desc      Verify MathUtils.distanceToOrigin over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0080', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0080', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.distanceToOrigin';
        addLog('testUtilsSuite08Case0080: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0080: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.sqrt(input * input * 2);
        addLog('testUtilsSuite08Case0080: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.distanceToOrigin(input);
        addLog('testUtilsSuite08Case0080: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.distanceToOrigin(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0080: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0081
     * @tc.name      testUtilsSuite08Case0081
     * @tc.desc      Verify MathUtils.percentOf over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0081', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0081', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.percentOf';
        addLog('testUtilsSuite08Case0081: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0081: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 50 / 100;
        addLog('testUtilsSuite08Case0081: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.percentOf(input, 50);
        addLog('testUtilsSuite08Case0081: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.percentOf(input, 50);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0081: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0082
     * @tc.name      testUtilsSuite08Case0082
     * @tc.desc      Verify MathUtils.percentOf over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0082', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0082', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.percentOf';
        addLog('testUtilsSuite08Case0082: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0082: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 50 / 100;
        addLog('testUtilsSuite08Case0082: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.percentOf(input, 50);
        addLog('testUtilsSuite08Case0082: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.percentOf(input, 50);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0082: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0083
     * @tc.name      testUtilsSuite08Case0083
     * @tc.desc      Verify MathUtils.percentOf over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0083', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0083', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.percentOf';
        addLog('testUtilsSuite08Case0083: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0083: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 50 / 100;
        addLog('testUtilsSuite08Case0083: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.percentOf(input, 50);
        addLog('testUtilsSuite08Case0083: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.percentOf(input, 50);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0083: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0084
     * @tc.name      testUtilsSuite08Case0084
     * @tc.desc      Verify MathUtils.percentOf over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0084', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0084', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.percentOf';
        addLog('testUtilsSuite08Case0084: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0084: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 50 / 100;
        addLog('testUtilsSuite08Case0084: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.percentOf(input, 50);
        addLog('testUtilsSuite08Case0084: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.percentOf(input, 50);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0084: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0085
     * @tc.name      testUtilsSuite08Case0085
     * @tc.desc      Verify MathUtils.percentOf over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0085', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0085', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.percentOf';
        addLog('testUtilsSuite08Case0085: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0085: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 50 / 100;
        addLog('testUtilsSuite08Case0085: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.percentOf(input, 50);
        addLog('testUtilsSuite08Case0085: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.percentOf(input, 50);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0085: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0086
     * @tc.name      testUtilsSuite08Case0086
     * @tc.desc      Verify MathUtils.percentOf over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0086', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0086', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.percentOf';
        addLog('testUtilsSuite08Case0086: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0086: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 50 / 100;
        addLog('testUtilsSuite08Case0086: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.percentOf(input, 50);
        addLog('testUtilsSuite08Case0086: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.percentOf(input, 50);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0086: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0087
     * @tc.name      testUtilsSuite08Case0087
     * @tc.desc      Verify MathUtils.percentOf over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0087', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0087', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.percentOf';
        addLog('testUtilsSuite08Case0087: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0087: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 50 / 100;
        addLog('testUtilsSuite08Case0087: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.percentOf(input, 50);
        addLog('testUtilsSuite08Case0087: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.percentOf(input, 50);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0087: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0088
     * @tc.name      testUtilsSuite08Case0088
     * @tc.desc      Verify MathUtils.percentOf over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0088', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0088', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.percentOf';
        addLog('testUtilsSuite08Case0088: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0088: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input * 50 / 100;
        addLog('testUtilsSuite08Case0088: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.percentOf(input, 50);
        addLog('testUtilsSuite08Case0088: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.percentOf(input, 50);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0088: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0089
     * @tc.name      testUtilsSuite08Case0089
     * @tc.desc      Verify MathUtils.clampPercent over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0089', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0089', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.clampPercent';
        addLog('testUtilsSuite08Case0089: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0089: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.min(100, Math.max(0, input));
        addLog('testUtilsSuite08Case0089: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.clampPercent(input);
        addLog('testUtilsSuite08Case0089: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.clampPercent(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0089: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0090
     * @tc.name      testUtilsSuite08Case0090
     * @tc.desc      Verify MathUtils.clampPercent over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0090', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0090', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.clampPercent';
        addLog('testUtilsSuite08Case0090: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0090: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.min(100, Math.max(0, input));
        addLog('testUtilsSuite08Case0090: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.clampPercent(input);
        addLog('testUtilsSuite08Case0090: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.clampPercent(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0090: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0091
     * @tc.name      testUtilsSuite08Case0091
     * @tc.desc      Verify MathUtils.clampPercent over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0091', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0091', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.clampPercent';
        addLog('testUtilsSuite08Case0091: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0091: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.min(100, Math.max(0, input));
        addLog('testUtilsSuite08Case0091: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.clampPercent(input);
        addLog('testUtilsSuite08Case0091: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.clampPercent(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0091: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0092
     * @tc.name      testUtilsSuite08Case0092
     * @tc.desc      Verify MathUtils.clampPercent over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0092', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0092', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.clampPercent';
        addLog('testUtilsSuite08Case0092: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0092: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.min(100, Math.max(0, input));
        addLog('testUtilsSuite08Case0092: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.clampPercent(input);
        addLog('testUtilsSuite08Case0092: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.clampPercent(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0092: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0093
     * @tc.name      testUtilsSuite08Case0093
     * @tc.desc      Verify MathUtils.clampPercent over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0093', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0093', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.clampPercent';
        addLog('testUtilsSuite08Case0093: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0093: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.min(100, Math.max(0, input));
        addLog('testUtilsSuite08Case0093: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.clampPercent(input);
        addLog('testUtilsSuite08Case0093: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.clampPercent(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0093: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0094
     * @tc.name      testUtilsSuite08Case0094
     * @tc.desc      Verify MathUtils.clampPercent over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0094', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0094', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.clampPercent';
        addLog('testUtilsSuite08Case0094: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0094: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.min(100, Math.max(0, input));
        addLog('testUtilsSuite08Case0094: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.clampPercent(input);
        addLog('testUtilsSuite08Case0094: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.clampPercent(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0094: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0095
     * @tc.name      testUtilsSuite08Case0095
     * @tc.desc      Verify MathUtils.clampPercent over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0095', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0095', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.clampPercent';
        addLog('testUtilsSuite08Case0095: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0095: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.min(100, Math.max(0, input));
        addLog('testUtilsSuite08Case0095: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.clampPercent(input);
        addLog('testUtilsSuite08Case0095: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.clampPercent(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0095: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0096
     * @tc.name      testUtilsSuite08Case0096
     * @tc.desc      Verify MathUtils.clampPercent over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0096', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0096', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.clampPercent';
        addLog('testUtilsSuite08Case0096: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0096: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = Math.min(100, Math.max(0, input));
        addLog('testUtilsSuite08Case0096: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.clampPercent(input);
        addLog('testUtilsSuite08Case0096: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.clampPercent(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0096: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0097
     * @tc.name      testUtilsSuite08Case0097
     * @tc.desc      Verify MathUtils.popCount over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0097', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0097', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.popCount';
        addLog('testUtilsSuite08Case0097: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0097: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 0 ? 0 : Math.abs(Math.trunc(input)).toString(2).split('').filter((bit: string) => bit === '1').length;
        addLog('testUtilsSuite08Case0097: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.popCount(input);
        addLog('testUtilsSuite08Case0097: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.popCount(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0097: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0098
     * @tc.name      testUtilsSuite08Case0098
     * @tc.desc      Verify MathUtils.popCount over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0098', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0098', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.popCount';
        addLog('testUtilsSuite08Case0098: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0098: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 0 ? 0 : Math.abs(Math.trunc(input)).toString(2).split('').filter((bit: string) => bit === '1').length;
        addLog('testUtilsSuite08Case0098: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.popCount(input);
        addLog('testUtilsSuite08Case0098: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.popCount(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0098: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0099
     * @tc.name      testUtilsSuite08Case0099
     * @tc.desc      Verify MathUtils.popCount over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0099', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0099', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.popCount';
        addLog('testUtilsSuite08Case0099: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0099: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 0 ? 0 : Math.abs(Math.trunc(input)).toString(2).split('').filter((bit: string) => bit === '1').length;
        addLog('testUtilsSuite08Case0099: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.popCount(input);
        addLog('testUtilsSuite08Case0099: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.popCount(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0099: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0100
     * @tc.name      testUtilsSuite08Case0100
     * @tc.desc      Verify MathUtils.popCount over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0100', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0100', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.popCount';
        addLog('testUtilsSuite08Case0100: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0100: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 0 ? 0 : Math.abs(Math.trunc(input)).toString(2).split('').filter((bit: string) => bit === '1').length;
        addLog('testUtilsSuite08Case0100: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.popCount(input);
        addLog('testUtilsSuite08Case0100: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.popCount(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0100: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0101
     * @tc.name      testUtilsSuite08Case0101
     * @tc.desc      Verify MathUtils.popCount over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0101', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0101', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.popCount';
        addLog('testUtilsSuite08Case0101: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0101: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 0 ? 0 : Math.abs(Math.trunc(input)).toString(2).split('').filter((bit: string) => bit === '1').length;
        addLog('testUtilsSuite08Case0101: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.popCount(input);
        addLog('testUtilsSuite08Case0101: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.popCount(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0101: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0102
     * @tc.name      testUtilsSuite08Case0102
     * @tc.desc      Verify MathUtils.popCount over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0102', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0102', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.popCount';
        addLog('testUtilsSuite08Case0102: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0102: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 0 ? 0 : Math.abs(Math.trunc(input)).toString(2).split('').filter((bit: string) => bit === '1').length;
        addLog('testUtilsSuite08Case0102: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.popCount(input);
        addLog('testUtilsSuite08Case0102: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.popCount(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0102: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0103
     * @tc.name      testUtilsSuite08Case0103
     * @tc.desc      Verify MathUtils.popCount over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0103', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0103', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.popCount';
        addLog('testUtilsSuite08Case0103: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0103: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 0 ? 0 : Math.abs(Math.trunc(input)).toString(2).split('').filter((bit: string) => bit === '1').length;
        addLog('testUtilsSuite08Case0103: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.popCount(input);
        addLog('testUtilsSuite08Case0103: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.popCount(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0103: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0104
     * @tc.name      testUtilsSuite08Case0104
     * @tc.desc      Verify MathUtils.popCount over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0104', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0104', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.popCount';
        addLog('testUtilsSuite08Case0104: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0104: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input <= 0 ? 0 : Math.abs(Math.trunc(input)).toString(2).split('').filter((bit: string) => bit === '1').length;
        addLog('testUtilsSuite08Case0104: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.popCount(input);
        addLog('testUtilsSuite08Case0104: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.popCount(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0104: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0105
     * @tc.name      testUtilsSuite08Case0105
     * @tc.desc      Verify MathUtils.sumDigits over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0105', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0105', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sumDigits';
        addLog('testUtilsSuite08Case0105: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 0;
        addLog('testUtilsSuite08Case0105: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refDigitSum(input);
        addLog('testUtilsSuite08Case0105: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sumDigits(input);
        addLog('testUtilsSuite08Case0105: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sumDigits(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0105: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0106
     * @tc.name      testUtilsSuite08Case0106
     * @tc.desc      Verify MathUtils.sumDigits over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0106', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0106', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sumDigits';
        addLog('testUtilsSuite08Case0106: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 1;
        addLog('testUtilsSuite08Case0106: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refDigitSum(input);
        addLog('testUtilsSuite08Case0106: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sumDigits(input);
        addLog('testUtilsSuite08Case0106: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sumDigits(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0106: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0107
     * @tc.name      testUtilsSuite08Case0107
     * @tc.desc      Verify MathUtils.sumDigits over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0107', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0107', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sumDigits';
        addLog('testUtilsSuite08Case0107: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 7;
        addLog('testUtilsSuite08Case0107: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refDigitSum(input);
        addLog('testUtilsSuite08Case0107: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sumDigits(input);
        addLog('testUtilsSuite08Case0107: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sumDigits(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0107: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0108
     * @tc.name      testUtilsSuite08Case0108
     * @tc.desc      Verify MathUtils.sumDigits over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0108', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0108', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sumDigits';
        addLog('testUtilsSuite08Case0108: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 100;
        addLog('testUtilsSuite08Case0108: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refDigitSum(input);
        addLog('testUtilsSuite08Case0108: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sumDigits(input);
        addLog('testUtilsSuite08Case0108: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sumDigits(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0108: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0109
     * @tc.name      testUtilsSuite08Case0109
     * @tc.desc      Verify MathUtils.sumDigits over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0109', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0109', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sumDigits';
        addLog('testUtilsSuite08Case0109: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = -5;
        addLog('testUtilsSuite08Case0109: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refDigitSum(input);
        addLog('testUtilsSuite08Case0109: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sumDigits(input);
        addLog('testUtilsSuite08Case0109: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sumDigits(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0109: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0110
     * @tc.name      testUtilsSuite08Case0110
     * @tc.desc      Verify MathUtils.sumDigits over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0110', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0110', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sumDigits';
        addLog('testUtilsSuite08Case0110: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 12345;
        addLog('testUtilsSuite08Case0110: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refDigitSum(input);
        addLog('testUtilsSuite08Case0110: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sumDigits(input);
        addLog('testUtilsSuite08Case0110: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sumDigits(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0110: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0111
     * @tc.name      testUtilsSuite08Case0111
     * @tc.desc      Verify MathUtils.sumDigits over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0111', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0111', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sumDigits';
        addLog('testUtilsSuite08Case0111: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 42;
        addLog('testUtilsSuite08Case0111: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refDigitSum(input);
        addLog('testUtilsSuite08Case0111: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sumDigits(input);
        addLog('testUtilsSuite08Case0111: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sumDigits(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0111: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S08_C0112
     * @tc.name      testUtilsSuite08Case0112
     * @tc.desc      Verify MathUtils.sumDigits over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite08Case0112', 0, async (done: Function) => {
      await runCase('testUtilsSuite08Case0112', async (): Promise<void> => {
        const suiteName: string = 'MathUtils.sumDigits';
        addLog('testUtilsSuite08Case0112: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number = 999;
        addLog('testUtilsSuite08Case0112: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = refDigitSum(input);
        addLog('testUtilsSuite08Case0112: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = MathUtils.sumDigits(input);
        addLog('testUtilsSuite08Case0112: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = MathUtils.sumDigits(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite08Case0112: end %{public}s', suiteName);
      }, done);
    });



  });
}
