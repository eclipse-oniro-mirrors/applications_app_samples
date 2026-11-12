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
import { ArrayUtils } from '../../../../main/ets/common/utils/ArrayUtils';
import { addLog, runCase } from '../../testkit/SharedDriver';

/**
 * ArrayUtils utility suite.
 *
 * Every case feeds one pooled input through a single helper and compares the
 * result against a locally written oracle. The helper is not referenced from
 * pages/Index.ets, so the suite exercises a surface the sample page never uses.
 */
export default function utilsSuite02(): void {
  describe('ArrayUtilsUtilsTest', () => {
    afterAll(() => {
      addLog('utilsSuite02 suite finished');
    })

    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0001
     * @tc.name      testUtilsSuite02Case0001
     * @tc.desc      Verify ArrayUtils.isEmpty over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0001', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0001', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.isEmpty';
        addLog('testUtilsSuite02Case0001: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0001: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.length === 0;
        addLog('testUtilsSuite02Case0001: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.isEmpty(input);
        addLog('testUtilsSuite02Case0001: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.isEmpty(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0001: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0002
     * @tc.name      testUtilsSuite02Case0002
     * @tc.desc      Verify ArrayUtils.isEmpty over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0002', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0002', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.isEmpty';
        addLog('testUtilsSuite02Case0002: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0002: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.length === 0;
        addLog('testUtilsSuite02Case0002: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.isEmpty(input);
        addLog('testUtilsSuite02Case0002: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.isEmpty(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0002: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0003
     * @tc.name      testUtilsSuite02Case0003
     * @tc.desc      Verify ArrayUtils.isEmpty over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0003', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0003', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.isEmpty';
        addLog('testUtilsSuite02Case0003: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0003: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.length === 0;
        addLog('testUtilsSuite02Case0003: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.isEmpty(input);
        addLog('testUtilsSuite02Case0003: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.isEmpty(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0003: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0004
     * @tc.name      testUtilsSuite02Case0004
     * @tc.desc      Verify ArrayUtils.isEmpty over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0004', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0004', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.isEmpty';
        addLog('testUtilsSuite02Case0004: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0004: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.length === 0;
        addLog('testUtilsSuite02Case0004: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.isEmpty(input);
        addLog('testUtilsSuite02Case0004: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.isEmpty(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0004: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0005
     * @tc.name      testUtilsSuite02Case0005
     * @tc.desc      Verify ArrayUtils.isEmpty over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0005', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0005', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.isEmpty';
        addLog('testUtilsSuite02Case0005: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0005: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.length === 0;
        addLog('testUtilsSuite02Case0005: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.isEmpty(input);
        addLog('testUtilsSuite02Case0005: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.isEmpty(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0005: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0006
     * @tc.name      testUtilsSuite02Case0006
     * @tc.desc      Verify ArrayUtils.isEmpty over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0006', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0006', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.isEmpty';
        addLog('testUtilsSuite02Case0006: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0006: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.length === 0;
        addLog('testUtilsSuite02Case0006: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.isEmpty(input);
        addLog('testUtilsSuite02Case0006: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.isEmpty(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0006: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0007
     * @tc.name      testUtilsSuite02Case0007
     * @tc.desc      Verify ArrayUtils.isEmpty over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0007', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0007', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.isEmpty';
        addLog('testUtilsSuite02Case0007: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0007: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.length === 0;
        addLog('testUtilsSuite02Case0007: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.isEmpty(input);
        addLog('testUtilsSuite02Case0007: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.isEmpty(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0007: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0008
     * @tc.name      testUtilsSuite02Case0008
     * @tc.desc      Verify ArrayUtils.isEmpty over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0008', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0008', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.isEmpty';
        addLog('testUtilsSuite02Case0008: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0008: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.length === 0;
        addLog('testUtilsSuite02Case0008: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.isEmpty(input);
        addLog('testUtilsSuite02Case0008: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.isEmpty(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0008: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0009
     * @tc.name      testUtilsSuite02Case0009
     * @tc.desc      Verify ArrayUtils.sum over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0009', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0009', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sum';
        addLog('testUtilsSuite02Case0009: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0009: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.reduce((left: number, right: number) => left + right, 0);
        addLog('testUtilsSuite02Case0009: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.sum(input);
        addLog('testUtilsSuite02Case0009: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.sum(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0009: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0010
     * @tc.name      testUtilsSuite02Case0010
     * @tc.desc      Verify ArrayUtils.sum over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0010', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0010', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sum';
        addLog('testUtilsSuite02Case0010: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0010: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.reduce((left: number, right: number) => left + right, 0);
        addLog('testUtilsSuite02Case0010: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.sum(input);
        addLog('testUtilsSuite02Case0010: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.sum(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0010: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0011
     * @tc.name      testUtilsSuite02Case0011
     * @tc.desc      Verify ArrayUtils.sum over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0011', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0011', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sum';
        addLog('testUtilsSuite02Case0011: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0011: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.reduce((left: number, right: number) => left + right, 0);
        addLog('testUtilsSuite02Case0011: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.sum(input);
        addLog('testUtilsSuite02Case0011: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.sum(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0011: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0012
     * @tc.name      testUtilsSuite02Case0012
     * @tc.desc      Verify ArrayUtils.sum over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0012', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0012', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sum';
        addLog('testUtilsSuite02Case0012: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0012: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.reduce((left: number, right: number) => left + right, 0);
        addLog('testUtilsSuite02Case0012: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.sum(input);
        addLog('testUtilsSuite02Case0012: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.sum(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0012: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0013
     * @tc.name      testUtilsSuite02Case0013
     * @tc.desc      Verify ArrayUtils.sum over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0013', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0013', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sum';
        addLog('testUtilsSuite02Case0013: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0013: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.reduce((left: number, right: number) => left + right, 0);
        addLog('testUtilsSuite02Case0013: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.sum(input);
        addLog('testUtilsSuite02Case0013: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.sum(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0013: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0014
     * @tc.name      testUtilsSuite02Case0014
     * @tc.desc      Verify ArrayUtils.sum over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0014', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0014', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sum';
        addLog('testUtilsSuite02Case0014: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0014: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.reduce((left: number, right: number) => left + right, 0);
        addLog('testUtilsSuite02Case0014: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.sum(input);
        addLog('testUtilsSuite02Case0014: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.sum(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0014: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0015
     * @tc.name      testUtilsSuite02Case0015
     * @tc.desc      Verify ArrayUtils.sum over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0015', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0015', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sum';
        addLog('testUtilsSuite02Case0015: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0015: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.reduce((left: number, right: number) => left + right, 0);
        addLog('testUtilsSuite02Case0015: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.sum(input);
        addLog('testUtilsSuite02Case0015: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.sum(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0015: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0016
     * @tc.name      testUtilsSuite02Case0016
     * @tc.desc      Verify ArrayUtils.sum over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0016', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0016', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sum';
        addLog('testUtilsSuite02Case0016: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0016: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.reduce((left: number, right: number) => left + right, 0);
        addLog('testUtilsSuite02Case0016: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.sum(input);
        addLog('testUtilsSuite02Case0016: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.sum(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0016: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0017
     * @tc.name      testUtilsSuite02Case0017
     * @tc.desc      Verify ArrayUtils.maxOf over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0017', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0017', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.maxOf';
        addLog('testUtilsSuite02Case0017: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0017: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[input.length - 1];
        addLog('testUtilsSuite02Case0017: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.maxOf(input);
        addLog('testUtilsSuite02Case0017: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.maxOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0017: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0018
     * @tc.name      testUtilsSuite02Case0018
     * @tc.desc      Verify ArrayUtils.maxOf over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0018', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0018', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.maxOf';
        addLog('testUtilsSuite02Case0018: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0018: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[input.length - 1];
        addLog('testUtilsSuite02Case0018: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.maxOf(input);
        addLog('testUtilsSuite02Case0018: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.maxOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0018: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0019
     * @tc.name      testUtilsSuite02Case0019
     * @tc.desc      Verify ArrayUtils.maxOf over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0019', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0019', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.maxOf';
        addLog('testUtilsSuite02Case0019: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0019: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[input.length - 1];
        addLog('testUtilsSuite02Case0019: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.maxOf(input);
        addLog('testUtilsSuite02Case0019: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.maxOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0019: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0020
     * @tc.name      testUtilsSuite02Case0020
     * @tc.desc      Verify ArrayUtils.maxOf over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0020', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0020', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.maxOf';
        addLog('testUtilsSuite02Case0020: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0020: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[input.length - 1];
        addLog('testUtilsSuite02Case0020: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.maxOf(input);
        addLog('testUtilsSuite02Case0020: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.maxOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0020: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0021
     * @tc.name      testUtilsSuite02Case0021
     * @tc.desc      Verify ArrayUtils.maxOf over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0021', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0021', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.maxOf';
        addLog('testUtilsSuite02Case0021: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0021: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[input.length - 1];
        addLog('testUtilsSuite02Case0021: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.maxOf(input);
        addLog('testUtilsSuite02Case0021: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.maxOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0021: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0022
     * @tc.name      testUtilsSuite02Case0022
     * @tc.desc      Verify ArrayUtils.maxOf over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0022', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0022', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.maxOf';
        addLog('testUtilsSuite02Case0022: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0022: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[input.length - 1];
        addLog('testUtilsSuite02Case0022: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.maxOf(input);
        addLog('testUtilsSuite02Case0022: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.maxOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0022: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0023
     * @tc.name      testUtilsSuite02Case0023
     * @tc.desc      Verify ArrayUtils.maxOf over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0023', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0023', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.maxOf';
        addLog('testUtilsSuite02Case0023: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0023: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[input.length - 1];
        addLog('testUtilsSuite02Case0023: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.maxOf(input);
        addLog('testUtilsSuite02Case0023: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.maxOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0023: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0024
     * @tc.name      testUtilsSuite02Case0024
     * @tc.desc      Verify ArrayUtils.maxOf over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0024', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0024', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.maxOf';
        addLog('testUtilsSuite02Case0024: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0024: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[input.length - 1];
        addLog('testUtilsSuite02Case0024: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.maxOf(input);
        addLog('testUtilsSuite02Case0024: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.maxOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0024: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0025
     * @tc.name      testUtilsSuite02Case0025
     * @tc.desc      Verify ArrayUtils.minOf over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0025', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0025', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.minOf';
        addLog('testUtilsSuite02Case0025: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0025: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[0];
        addLog('testUtilsSuite02Case0025: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.minOf(input);
        addLog('testUtilsSuite02Case0025: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.minOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0025: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0026
     * @tc.name      testUtilsSuite02Case0026
     * @tc.desc      Verify ArrayUtils.minOf over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0026', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0026', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.minOf';
        addLog('testUtilsSuite02Case0026: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0026: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[0];
        addLog('testUtilsSuite02Case0026: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.minOf(input);
        addLog('testUtilsSuite02Case0026: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.minOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0026: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0027
     * @tc.name      testUtilsSuite02Case0027
     * @tc.desc      Verify ArrayUtils.minOf over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0027', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0027', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.minOf';
        addLog('testUtilsSuite02Case0027: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0027: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[0];
        addLog('testUtilsSuite02Case0027: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.minOf(input);
        addLog('testUtilsSuite02Case0027: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.minOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0027: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0028
     * @tc.name      testUtilsSuite02Case0028
     * @tc.desc      Verify ArrayUtils.minOf over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0028', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0028', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.minOf';
        addLog('testUtilsSuite02Case0028: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0028: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[0];
        addLog('testUtilsSuite02Case0028: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.minOf(input);
        addLog('testUtilsSuite02Case0028: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.minOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0028: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0029
     * @tc.name      testUtilsSuite02Case0029
     * @tc.desc      Verify ArrayUtils.minOf over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0029', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0029', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.minOf';
        addLog('testUtilsSuite02Case0029: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0029: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[0];
        addLog('testUtilsSuite02Case0029: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.minOf(input);
        addLog('testUtilsSuite02Case0029: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.minOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0029: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0030
     * @tc.name      testUtilsSuite02Case0030
     * @tc.desc      Verify ArrayUtils.minOf over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0030', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0030', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.minOf';
        addLog('testUtilsSuite02Case0030: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0030: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[0];
        addLog('testUtilsSuite02Case0030: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.minOf(input);
        addLog('testUtilsSuite02Case0030: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.minOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0030: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0031
     * @tc.name      testUtilsSuite02Case0031
     * @tc.desc      Verify ArrayUtils.minOf over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0031', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0031', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.minOf';
        addLog('testUtilsSuite02Case0031: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0031: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[0];
        addLog('testUtilsSuite02Case0031: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.minOf(input);
        addLog('testUtilsSuite02Case0031: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.minOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0031: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0032
     * @tc.name      testUtilsSuite02Case0032
     * @tc.desc      Verify ArrayUtils.minOf over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0032', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0032', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.minOf';
        addLog('testUtilsSuite02Case0032: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0032: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.slice().sort((left: number, right: number) => left - right)[0];
        addLog('testUtilsSuite02Case0032: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.minOf(input);
        addLog('testUtilsSuite02Case0032: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.minOf(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0032: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0033
     * @tc.name      testUtilsSuite02Case0033
     * @tc.desc      Verify ArrayUtils.average over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0033', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0033', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.average';
        addLog('testUtilsSuite02Case0033: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0033: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.reduce((left: number, right: number) => left + right, 0) / input.length;
        addLog('testUtilsSuite02Case0033: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.average(input);
        addLog('testUtilsSuite02Case0033: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.average(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0033: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0034
     * @tc.name      testUtilsSuite02Case0034
     * @tc.desc      Verify ArrayUtils.average over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0034', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0034', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.average';
        addLog('testUtilsSuite02Case0034: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0034: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.reduce((left: number, right: number) => left + right, 0) / input.length;
        addLog('testUtilsSuite02Case0034: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.average(input);
        addLog('testUtilsSuite02Case0034: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.average(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0034: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0035
     * @tc.name      testUtilsSuite02Case0035
     * @tc.desc      Verify ArrayUtils.average over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0035', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0035', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.average';
        addLog('testUtilsSuite02Case0035: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0035: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.reduce((left: number, right: number) => left + right, 0) / input.length;
        addLog('testUtilsSuite02Case0035: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.average(input);
        addLog('testUtilsSuite02Case0035: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.average(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0035: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0036
     * @tc.name      testUtilsSuite02Case0036
     * @tc.desc      Verify ArrayUtils.average over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0036', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0036', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.average';
        addLog('testUtilsSuite02Case0036: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0036: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.reduce((left: number, right: number) => left + right, 0) / input.length;
        addLog('testUtilsSuite02Case0036: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.average(input);
        addLog('testUtilsSuite02Case0036: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.average(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0036: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0037
     * @tc.name      testUtilsSuite02Case0037
     * @tc.desc      Verify ArrayUtils.average over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0037', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0037', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.average';
        addLog('testUtilsSuite02Case0037: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0037: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.reduce((left: number, right: number) => left + right, 0) / input.length;
        addLog('testUtilsSuite02Case0037: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.average(input);
        addLog('testUtilsSuite02Case0037: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.average(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0037: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0038
     * @tc.name      testUtilsSuite02Case0038
     * @tc.desc      Verify ArrayUtils.average over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0038', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0038', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.average';
        addLog('testUtilsSuite02Case0038: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0038: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.reduce((left: number, right: number) => left + right, 0) / input.length;
        addLog('testUtilsSuite02Case0038: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.average(input);
        addLog('testUtilsSuite02Case0038: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.average(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0038: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0039
     * @tc.name      testUtilsSuite02Case0039
     * @tc.desc      Verify ArrayUtils.average over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0039', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0039', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.average';
        addLog('testUtilsSuite02Case0039: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0039: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.reduce((left: number, right: number) => left + right, 0) / input.length;
        addLog('testUtilsSuite02Case0039: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.average(input);
        addLog('testUtilsSuite02Case0039: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.average(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0039: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0040
     * @tc.name      testUtilsSuite02Case0040
     * @tc.desc      Verify ArrayUtils.average over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0040', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0040', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.average';
        addLog('testUtilsSuite02Case0040: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0040: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.length === 0 ? 0 : input.reduce((left: number, right: number) => left + right, 0) / input.length;
        addLog('testUtilsSuite02Case0040: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.average(input);
        addLog('testUtilsSuite02Case0040: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.average(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0040: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0041
     * @tc.name      testUtilsSuite02Case0041
     * @tc.desc      Verify ArrayUtils.countGreater over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0041', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0041', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.countGreater';
        addLog('testUtilsSuite02Case0041: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0041: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.filter((value: number) => value > 10).length;
        addLog('testUtilsSuite02Case0041: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.countGreater(input, 10);
        addLog('testUtilsSuite02Case0041: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.countGreater(input, 10);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0041: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0042
     * @tc.name      testUtilsSuite02Case0042
     * @tc.desc      Verify ArrayUtils.countGreater over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0042', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0042', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.countGreater';
        addLog('testUtilsSuite02Case0042: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0042: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.filter((value: number) => value > 10).length;
        addLog('testUtilsSuite02Case0042: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.countGreater(input, 10);
        addLog('testUtilsSuite02Case0042: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.countGreater(input, 10);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0042: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0043
     * @tc.name      testUtilsSuite02Case0043
     * @tc.desc      Verify ArrayUtils.countGreater over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0043', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0043', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.countGreater';
        addLog('testUtilsSuite02Case0043: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0043: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.filter((value: number) => value > 10).length;
        addLog('testUtilsSuite02Case0043: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.countGreater(input, 10);
        addLog('testUtilsSuite02Case0043: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.countGreater(input, 10);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0043: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0044
     * @tc.name      testUtilsSuite02Case0044
     * @tc.desc      Verify ArrayUtils.countGreater over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0044', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0044', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.countGreater';
        addLog('testUtilsSuite02Case0044: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0044: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.filter((value: number) => value > 10).length;
        addLog('testUtilsSuite02Case0044: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.countGreater(input, 10);
        addLog('testUtilsSuite02Case0044: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.countGreater(input, 10);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0044: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0045
     * @tc.name      testUtilsSuite02Case0045
     * @tc.desc      Verify ArrayUtils.countGreater over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0045', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0045', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.countGreater';
        addLog('testUtilsSuite02Case0045: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0045: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.filter((value: number) => value > 10).length;
        addLog('testUtilsSuite02Case0045: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.countGreater(input, 10);
        addLog('testUtilsSuite02Case0045: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.countGreater(input, 10);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0045: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0046
     * @tc.name      testUtilsSuite02Case0046
     * @tc.desc      Verify ArrayUtils.countGreater over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0046', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0046', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.countGreater';
        addLog('testUtilsSuite02Case0046: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0046: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.filter((value: number) => value > 10).length;
        addLog('testUtilsSuite02Case0046: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.countGreater(input, 10);
        addLog('testUtilsSuite02Case0046: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.countGreater(input, 10);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0046: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0047
     * @tc.name      testUtilsSuite02Case0047
     * @tc.desc      Verify ArrayUtils.countGreater over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0047', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0047', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.countGreater';
        addLog('testUtilsSuite02Case0047: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0047: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.filter((value: number) => value > 10).length;
        addLog('testUtilsSuite02Case0047: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.countGreater(input, 10);
        addLog('testUtilsSuite02Case0047: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.countGreater(input, 10);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0047: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0048
     * @tc.name      testUtilsSuite02Case0048
     * @tc.desc      Verify ArrayUtils.countGreater over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0048', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0048', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.countGreater';
        addLog('testUtilsSuite02Case0048: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0048: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.filter((value: number) => value > 10).length;
        addLog('testUtilsSuite02Case0048: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.countGreater(input, 10);
        addLog('testUtilsSuite02Case0048: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.countGreater(input, 10);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0048: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0049
     * @tc.name      testUtilsSuite02Case0049
     * @tc.desc      Verify ArrayUtils.indexOfValue over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0049', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0049', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.indexOfValue';
        addLog('testUtilsSuite02Case0049: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0049: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.indexOf(7);
        addLog('testUtilsSuite02Case0049: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.indexOfValue(input, 7);
        addLog('testUtilsSuite02Case0049: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.indexOfValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0049: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0050
     * @tc.name      testUtilsSuite02Case0050
     * @tc.desc      Verify ArrayUtils.indexOfValue over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0050', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0050', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.indexOfValue';
        addLog('testUtilsSuite02Case0050: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0050: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.indexOf(7);
        addLog('testUtilsSuite02Case0050: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.indexOfValue(input, 7);
        addLog('testUtilsSuite02Case0050: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.indexOfValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0050: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0051
     * @tc.name      testUtilsSuite02Case0051
     * @tc.desc      Verify ArrayUtils.indexOfValue over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0051', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0051', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.indexOfValue';
        addLog('testUtilsSuite02Case0051: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0051: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.indexOf(7);
        addLog('testUtilsSuite02Case0051: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.indexOfValue(input, 7);
        addLog('testUtilsSuite02Case0051: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.indexOfValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0051: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0052
     * @tc.name      testUtilsSuite02Case0052
     * @tc.desc      Verify ArrayUtils.indexOfValue over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0052', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0052', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.indexOfValue';
        addLog('testUtilsSuite02Case0052: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0052: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.indexOf(7);
        addLog('testUtilsSuite02Case0052: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.indexOfValue(input, 7);
        addLog('testUtilsSuite02Case0052: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.indexOfValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0052: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0053
     * @tc.name      testUtilsSuite02Case0053
     * @tc.desc      Verify ArrayUtils.indexOfValue over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0053', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0053', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.indexOfValue';
        addLog('testUtilsSuite02Case0053: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0053: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.indexOf(7);
        addLog('testUtilsSuite02Case0053: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.indexOfValue(input, 7);
        addLog('testUtilsSuite02Case0053: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.indexOfValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0053: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0054
     * @tc.name      testUtilsSuite02Case0054
     * @tc.desc      Verify ArrayUtils.indexOfValue over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0054', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0054', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.indexOfValue';
        addLog('testUtilsSuite02Case0054: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0054: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.indexOf(7);
        addLog('testUtilsSuite02Case0054: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.indexOfValue(input, 7);
        addLog('testUtilsSuite02Case0054: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.indexOfValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0054: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0055
     * @tc.name      testUtilsSuite02Case0055
     * @tc.desc      Verify ArrayUtils.indexOfValue over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0055', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0055', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.indexOfValue';
        addLog('testUtilsSuite02Case0055: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0055: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.indexOf(7);
        addLog('testUtilsSuite02Case0055: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.indexOfValue(input, 7);
        addLog('testUtilsSuite02Case0055: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.indexOfValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0055: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0056
     * @tc.name      testUtilsSuite02Case0056
     * @tc.desc      Verify ArrayUtils.indexOfValue over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0056', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0056', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.indexOfValue';
        addLog('testUtilsSuite02Case0056: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0056: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number = input.indexOf(7);
        addLog('testUtilsSuite02Case0056: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number = ArrayUtils.indexOfValue(input, 7);
        addLog('testUtilsSuite02Case0056: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('number');
        // The helper is side effect free, a second call must not drift.
        const repeated: number = ArrayUtils.indexOfValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0056: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0057
     * @tc.name      testUtilsSuite02Case0057
     * @tc.desc      Verify ArrayUtils.containsValue over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0057', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0057', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.containsValue';
        addLog('testUtilsSuite02Case0057: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0057: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.indexOf(7) >= 0;
        addLog('testUtilsSuite02Case0057: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.containsValue(input, 7);
        addLog('testUtilsSuite02Case0057: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.containsValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0057: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0058
     * @tc.name      testUtilsSuite02Case0058
     * @tc.desc      Verify ArrayUtils.containsValue over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0058', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0058', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.containsValue';
        addLog('testUtilsSuite02Case0058: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0058: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.indexOf(7) >= 0;
        addLog('testUtilsSuite02Case0058: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.containsValue(input, 7);
        addLog('testUtilsSuite02Case0058: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.containsValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0058: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0059
     * @tc.name      testUtilsSuite02Case0059
     * @tc.desc      Verify ArrayUtils.containsValue over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0059', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0059', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.containsValue';
        addLog('testUtilsSuite02Case0059: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0059: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.indexOf(7) >= 0;
        addLog('testUtilsSuite02Case0059: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.containsValue(input, 7);
        addLog('testUtilsSuite02Case0059: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.containsValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0059: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0060
     * @tc.name      testUtilsSuite02Case0060
     * @tc.desc      Verify ArrayUtils.containsValue over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0060', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0060', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.containsValue';
        addLog('testUtilsSuite02Case0060: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0060: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.indexOf(7) >= 0;
        addLog('testUtilsSuite02Case0060: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.containsValue(input, 7);
        addLog('testUtilsSuite02Case0060: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.containsValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0060: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0061
     * @tc.name      testUtilsSuite02Case0061
     * @tc.desc      Verify ArrayUtils.containsValue over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0061', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0061', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.containsValue';
        addLog('testUtilsSuite02Case0061: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0061: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.indexOf(7) >= 0;
        addLog('testUtilsSuite02Case0061: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.containsValue(input, 7);
        addLog('testUtilsSuite02Case0061: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.containsValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0061: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0062
     * @tc.name      testUtilsSuite02Case0062
     * @tc.desc      Verify ArrayUtils.containsValue over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0062', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0062', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.containsValue';
        addLog('testUtilsSuite02Case0062: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0062: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.indexOf(7) >= 0;
        addLog('testUtilsSuite02Case0062: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.containsValue(input, 7);
        addLog('testUtilsSuite02Case0062: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.containsValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0062: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0063
     * @tc.name      testUtilsSuite02Case0063
     * @tc.desc      Verify ArrayUtils.containsValue over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0063', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0063', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.containsValue';
        addLog('testUtilsSuite02Case0063: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0063: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.indexOf(7) >= 0;
        addLog('testUtilsSuite02Case0063: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.containsValue(input, 7);
        addLog('testUtilsSuite02Case0063: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.containsValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0063: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0064
     * @tc.name      testUtilsSuite02Case0064
     * @tc.desc      Verify ArrayUtils.containsValue over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0064', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0064', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.containsValue';
        addLog('testUtilsSuite02Case0064: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0064: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: boolean = input.indexOf(7) >= 0;
        addLog('testUtilsSuite02Case0064: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: boolean = ArrayUtils.containsValue(input, 7);
        addLog('testUtilsSuite02Case0064: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('boolean');
        // The helper is side effect free, a second call must not drift.
        const repeated: boolean = ArrayUtils.containsValue(input, 7);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0064: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0065
     * @tc.name      testUtilsSuite02Case0065
     * @tc.desc      Verify ArrayUtils.distinct over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0065', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0065', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.distinct';
        addLog('testUtilsSuite02Case0065: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0065: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.filter((value: number, index: number) => input.indexOf(value) === index);
        addLog('testUtilsSuite02Case0065: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.distinct(input);
        addLog('testUtilsSuite02Case0065: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.distinct(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0065: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0066
     * @tc.name      testUtilsSuite02Case0066
     * @tc.desc      Verify ArrayUtils.distinct over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0066', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0066', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.distinct';
        addLog('testUtilsSuite02Case0066: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0066: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.filter((value: number, index: number) => input.indexOf(value) === index);
        addLog('testUtilsSuite02Case0066: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.distinct(input);
        addLog('testUtilsSuite02Case0066: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.distinct(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0066: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0067
     * @tc.name      testUtilsSuite02Case0067
     * @tc.desc      Verify ArrayUtils.distinct over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0067', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0067', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.distinct';
        addLog('testUtilsSuite02Case0067: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0067: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.filter((value: number, index: number) => input.indexOf(value) === index);
        addLog('testUtilsSuite02Case0067: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.distinct(input);
        addLog('testUtilsSuite02Case0067: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.distinct(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0067: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0068
     * @tc.name      testUtilsSuite02Case0068
     * @tc.desc      Verify ArrayUtils.distinct over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0068', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0068', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.distinct';
        addLog('testUtilsSuite02Case0068: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0068: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.filter((value: number, index: number) => input.indexOf(value) === index);
        addLog('testUtilsSuite02Case0068: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.distinct(input);
        addLog('testUtilsSuite02Case0068: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.distinct(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0068: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0069
     * @tc.name      testUtilsSuite02Case0069
     * @tc.desc      Verify ArrayUtils.distinct over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0069', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0069', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.distinct';
        addLog('testUtilsSuite02Case0069: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0069: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.filter((value: number, index: number) => input.indexOf(value) === index);
        addLog('testUtilsSuite02Case0069: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.distinct(input);
        addLog('testUtilsSuite02Case0069: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.distinct(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0069: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0070
     * @tc.name      testUtilsSuite02Case0070
     * @tc.desc      Verify ArrayUtils.distinct over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0070', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0070', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.distinct';
        addLog('testUtilsSuite02Case0070: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0070: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.filter((value: number, index: number) => input.indexOf(value) === index);
        addLog('testUtilsSuite02Case0070: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.distinct(input);
        addLog('testUtilsSuite02Case0070: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.distinct(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0070: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0071
     * @tc.name      testUtilsSuite02Case0071
     * @tc.desc      Verify ArrayUtils.distinct over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0071', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0071', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.distinct';
        addLog('testUtilsSuite02Case0071: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0071: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.filter((value: number, index: number) => input.indexOf(value) === index);
        addLog('testUtilsSuite02Case0071: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.distinct(input);
        addLog('testUtilsSuite02Case0071: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.distinct(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0071: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0072
     * @tc.name      testUtilsSuite02Case0072
     * @tc.desc      Verify ArrayUtils.distinct over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0072', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0072', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.distinct';
        addLog('testUtilsSuite02Case0072: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0072: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.filter((value: number, index: number) => input.indexOf(value) === index);
        addLog('testUtilsSuite02Case0072: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.distinct(input);
        addLog('testUtilsSuite02Case0072: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.distinct(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0072: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0073
     * @tc.name      testUtilsSuite02Case0073
     * @tc.desc      Verify ArrayUtils.reversed over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0073', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0073', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.reversed';
        addLog('testUtilsSuite02Case0073: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0073: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().reverse();
        addLog('testUtilsSuite02Case0073: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.reversed(input);
        addLog('testUtilsSuite02Case0073: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.reversed(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0073: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0074
     * @tc.name      testUtilsSuite02Case0074
     * @tc.desc      Verify ArrayUtils.reversed over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0074', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0074', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.reversed';
        addLog('testUtilsSuite02Case0074: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0074: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().reverse();
        addLog('testUtilsSuite02Case0074: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.reversed(input);
        addLog('testUtilsSuite02Case0074: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.reversed(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0074: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0075
     * @tc.name      testUtilsSuite02Case0075
     * @tc.desc      Verify ArrayUtils.reversed over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0075', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0075', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.reversed';
        addLog('testUtilsSuite02Case0075: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0075: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().reverse();
        addLog('testUtilsSuite02Case0075: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.reversed(input);
        addLog('testUtilsSuite02Case0075: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.reversed(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0075: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0076
     * @tc.name      testUtilsSuite02Case0076
     * @tc.desc      Verify ArrayUtils.reversed over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0076', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0076', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.reversed';
        addLog('testUtilsSuite02Case0076: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0076: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().reverse();
        addLog('testUtilsSuite02Case0076: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.reversed(input);
        addLog('testUtilsSuite02Case0076: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.reversed(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0076: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0077
     * @tc.name      testUtilsSuite02Case0077
     * @tc.desc      Verify ArrayUtils.reversed over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0077', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0077', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.reversed';
        addLog('testUtilsSuite02Case0077: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0077: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().reverse();
        addLog('testUtilsSuite02Case0077: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.reversed(input);
        addLog('testUtilsSuite02Case0077: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.reversed(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0077: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0078
     * @tc.name      testUtilsSuite02Case0078
     * @tc.desc      Verify ArrayUtils.reversed over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0078', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0078', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.reversed';
        addLog('testUtilsSuite02Case0078: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0078: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().reverse();
        addLog('testUtilsSuite02Case0078: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.reversed(input);
        addLog('testUtilsSuite02Case0078: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.reversed(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0078: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0079
     * @tc.name      testUtilsSuite02Case0079
     * @tc.desc      Verify ArrayUtils.reversed over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0079', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0079', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.reversed';
        addLog('testUtilsSuite02Case0079: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0079: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().reverse();
        addLog('testUtilsSuite02Case0079: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.reversed(input);
        addLog('testUtilsSuite02Case0079: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.reversed(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0079: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0080
     * @tc.name      testUtilsSuite02Case0080
     * @tc.desc      Verify ArrayUtils.reversed over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0080', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0080', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.reversed';
        addLog('testUtilsSuite02Case0080: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0080: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().reverse();
        addLog('testUtilsSuite02Case0080: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.reversed(input);
        addLog('testUtilsSuite02Case0080: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.reversed(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0080: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0081
     * @tc.name      testUtilsSuite02Case0081
     * @tc.desc      Verify ArrayUtils.sortedAsc over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0081', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0081', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sortedAsc';
        addLog('testUtilsSuite02Case0081: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0081: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().sort((left: number, right: number) => left - right);
        addLog('testUtilsSuite02Case0081: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sortedAsc(input);
        addLog('testUtilsSuite02Case0081: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sortedAsc(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0081: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0082
     * @tc.name      testUtilsSuite02Case0082
     * @tc.desc      Verify ArrayUtils.sortedAsc over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0082', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0082', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sortedAsc';
        addLog('testUtilsSuite02Case0082: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0082: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().sort((left: number, right: number) => left - right);
        addLog('testUtilsSuite02Case0082: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sortedAsc(input);
        addLog('testUtilsSuite02Case0082: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sortedAsc(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0082: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0083
     * @tc.name      testUtilsSuite02Case0083
     * @tc.desc      Verify ArrayUtils.sortedAsc over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0083', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0083', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sortedAsc';
        addLog('testUtilsSuite02Case0083: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0083: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().sort((left: number, right: number) => left - right);
        addLog('testUtilsSuite02Case0083: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sortedAsc(input);
        addLog('testUtilsSuite02Case0083: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sortedAsc(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0083: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0084
     * @tc.name      testUtilsSuite02Case0084
     * @tc.desc      Verify ArrayUtils.sortedAsc over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0084', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0084', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sortedAsc';
        addLog('testUtilsSuite02Case0084: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0084: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().sort((left: number, right: number) => left - right);
        addLog('testUtilsSuite02Case0084: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sortedAsc(input);
        addLog('testUtilsSuite02Case0084: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sortedAsc(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0084: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0085
     * @tc.name      testUtilsSuite02Case0085
     * @tc.desc      Verify ArrayUtils.sortedAsc over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0085', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0085', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sortedAsc';
        addLog('testUtilsSuite02Case0085: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0085: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().sort((left: number, right: number) => left - right);
        addLog('testUtilsSuite02Case0085: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sortedAsc(input);
        addLog('testUtilsSuite02Case0085: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sortedAsc(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0085: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0086
     * @tc.name      testUtilsSuite02Case0086
     * @tc.desc      Verify ArrayUtils.sortedAsc over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0086', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0086', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sortedAsc';
        addLog('testUtilsSuite02Case0086: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0086: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().sort((left: number, right: number) => left - right);
        addLog('testUtilsSuite02Case0086: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sortedAsc(input);
        addLog('testUtilsSuite02Case0086: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sortedAsc(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0086: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0087
     * @tc.name      testUtilsSuite02Case0087
     * @tc.desc      Verify ArrayUtils.sortedAsc over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0087', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0087', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sortedAsc';
        addLog('testUtilsSuite02Case0087: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0087: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().sort((left: number, right: number) => left - right);
        addLog('testUtilsSuite02Case0087: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sortedAsc(input);
        addLog('testUtilsSuite02Case0087: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sortedAsc(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0087: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0088
     * @tc.name      testUtilsSuite02Case0088
     * @tc.desc      Verify ArrayUtils.sortedAsc over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0088', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0088', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sortedAsc';
        addLog('testUtilsSuite02Case0088: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0088: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice().sort((left: number, right: number) => left - right);
        addLog('testUtilsSuite02Case0088: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sortedAsc(input);
        addLog('testUtilsSuite02Case0088: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sortedAsc(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0088: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0089
     * @tc.name      testUtilsSuite02Case0089
     * @tc.desc      Verify ArrayUtils.joinComma over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0089', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0089', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.joinComma';
        addLog('testUtilsSuite02Case0089: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0089: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: string = input.join(',');
        addLog('testUtilsSuite02Case0089: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: string = ArrayUtils.joinComma(input);
        addLog('testUtilsSuite02Case0089: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('string');
        // The helper is side effect free, a second call must not drift.
        const repeated: string = ArrayUtils.joinComma(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0089: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0090
     * @tc.name      testUtilsSuite02Case0090
     * @tc.desc      Verify ArrayUtils.joinComma over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0090', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0090', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.joinComma';
        addLog('testUtilsSuite02Case0090: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0090: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: string = input.join(',');
        addLog('testUtilsSuite02Case0090: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: string = ArrayUtils.joinComma(input);
        addLog('testUtilsSuite02Case0090: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('string');
        // The helper is side effect free, a second call must not drift.
        const repeated: string = ArrayUtils.joinComma(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0090: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0091
     * @tc.name      testUtilsSuite02Case0091
     * @tc.desc      Verify ArrayUtils.joinComma over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0091', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0091', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.joinComma';
        addLog('testUtilsSuite02Case0091: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0091: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: string = input.join(',');
        addLog('testUtilsSuite02Case0091: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: string = ArrayUtils.joinComma(input);
        addLog('testUtilsSuite02Case0091: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('string');
        // The helper is side effect free, a second call must not drift.
        const repeated: string = ArrayUtils.joinComma(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0091: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0092
     * @tc.name      testUtilsSuite02Case0092
     * @tc.desc      Verify ArrayUtils.joinComma over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0092', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0092', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.joinComma';
        addLog('testUtilsSuite02Case0092: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0092: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: string = input.join(',');
        addLog('testUtilsSuite02Case0092: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: string = ArrayUtils.joinComma(input);
        addLog('testUtilsSuite02Case0092: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('string');
        // The helper is side effect free, a second call must not drift.
        const repeated: string = ArrayUtils.joinComma(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0092: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0093
     * @tc.name      testUtilsSuite02Case0093
     * @tc.desc      Verify ArrayUtils.joinComma over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0093', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0093', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.joinComma';
        addLog('testUtilsSuite02Case0093: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0093: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: string = input.join(',');
        addLog('testUtilsSuite02Case0093: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: string = ArrayUtils.joinComma(input);
        addLog('testUtilsSuite02Case0093: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('string');
        // The helper is side effect free, a second call must not drift.
        const repeated: string = ArrayUtils.joinComma(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0093: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0094
     * @tc.name      testUtilsSuite02Case0094
     * @tc.desc      Verify ArrayUtils.joinComma over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0094', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0094', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.joinComma';
        addLog('testUtilsSuite02Case0094: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0094: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: string = input.join(',');
        addLog('testUtilsSuite02Case0094: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: string = ArrayUtils.joinComma(input);
        addLog('testUtilsSuite02Case0094: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('string');
        // The helper is side effect free, a second call must not drift.
        const repeated: string = ArrayUtils.joinComma(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0094: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0095
     * @tc.name      testUtilsSuite02Case0095
     * @tc.desc      Verify ArrayUtils.joinComma over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0095', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0095', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.joinComma';
        addLog('testUtilsSuite02Case0095: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0095: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: string = input.join(',');
        addLog('testUtilsSuite02Case0095: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: string = ArrayUtils.joinComma(input);
        addLog('testUtilsSuite02Case0095: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('string');
        // The helper is side effect free, a second call must not drift.
        const repeated: string = ArrayUtils.joinComma(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0095: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0096
     * @tc.name      testUtilsSuite02Case0096
     * @tc.desc      Verify ArrayUtils.joinComma over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0096', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0096', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.joinComma';
        addLog('testUtilsSuite02Case0096: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0096: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: string = input.join(',');
        addLog('testUtilsSuite02Case0096: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: string = ArrayUtils.joinComma(input);
        addLog('testUtilsSuite02Case0096: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(actual).assertEqual(expected);
        expect(typeof actual).assertEqual('string');
        // The helper is side effect free, a second call must not drift.
        const repeated: string = ArrayUtils.joinComma(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0096: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0097
     * @tc.name      testUtilsSuite02Case0097
     * @tc.desc      Verify ArrayUtils.sliceSafe over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0097', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0097', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sliceSafe';
        addLog('testUtilsSuite02Case0097: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0097: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice(1, 3);
        addLog('testUtilsSuite02Case0097: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sliceSafe(input);
        addLog('testUtilsSuite02Case0097: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sliceSafe(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0097: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0098
     * @tc.name      testUtilsSuite02Case0098
     * @tc.desc      Verify ArrayUtils.sliceSafe over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0098', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0098', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sliceSafe';
        addLog('testUtilsSuite02Case0098: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0098: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice(1, 3);
        addLog('testUtilsSuite02Case0098: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sliceSafe(input);
        addLog('testUtilsSuite02Case0098: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sliceSafe(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0098: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0099
     * @tc.name      testUtilsSuite02Case0099
     * @tc.desc      Verify ArrayUtils.sliceSafe over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0099', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0099', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sliceSafe';
        addLog('testUtilsSuite02Case0099: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0099: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice(1, 3);
        addLog('testUtilsSuite02Case0099: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sliceSafe(input);
        addLog('testUtilsSuite02Case0099: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sliceSafe(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0099: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0100
     * @tc.name      testUtilsSuite02Case0100
     * @tc.desc      Verify ArrayUtils.sliceSafe over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0100', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0100', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sliceSafe';
        addLog('testUtilsSuite02Case0100: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0100: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice(1, 3);
        addLog('testUtilsSuite02Case0100: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sliceSafe(input);
        addLog('testUtilsSuite02Case0100: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sliceSafe(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0100: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0101
     * @tc.name      testUtilsSuite02Case0101
     * @tc.desc      Verify ArrayUtils.sliceSafe over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0101', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0101', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sliceSafe';
        addLog('testUtilsSuite02Case0101: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0101: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice(1, 3);
        addLog('testUtilsSuite02Case0101: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sliceSafe(input);
        addLog('testUtilsSuite02Case0101: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sliceSafe(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0101: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0102
     * @tc.name      testUtilsSuite02Case0102
     * @tc.desc      Verify ArrayUtils.sliceSafe over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0102', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0102', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sliceSafe';
        addLog('testUtilsSuite02Case0102: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0102: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice(1, 3);
        addLog('testUtilsSuite02Case0102: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sliceSafe(input);
        addLog('testUtilsSuite02Case0102: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sliceSafe(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0102: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0103
     * @tc.name      testUtilsSuite02Case0103
     * @tc.desc      Verify ArrayUtils.sliceSafe over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0103', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0103', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sliceSafe';
        addLog('testUtilsSuite02Case0103: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0103: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice(1, 3);
        addLog('testUtilsSuite02Case0103: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sliceSafe(input);
        addLog('testUtilsSuite02Case0103: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sliceSafe(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0103: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0104
     * @tc.name      testUtilsSuite02Case0104
     * @tc.desc      Verify ArrayUtils.sliceSafe over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0104', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0104', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.sliceSafe';
        addLog('testUtilsSuite02Case0104: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0104: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.slice(1, 3);
        addLog('testUtilsSuite02Case0104: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.sliceSafe(input);
        addLog('testUtilsSuite02Case0104: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.sliceSafe(input);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0104: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0105
     * @tc.name      testUtilsSuite02Case0105
     * @tc.desc      Verify ArrayUtils.concatAll over pooled input #1 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0105', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0105', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.concatAll';
        addLog('testUtilsSuite02Case0105: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [];
        addLog('testUtilsSuite02Case0105: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.concat([1, 2]);
        addLog('testUtilsSuite02Case0105: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.concatAll(input, [1, 2]);
        addLog('testUtilsSuite02Case0105: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.concatAll(input, [1, 2]);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0105: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0106
     * @tc.name      testUtilsSuite02Case0106
     * @tc.desc      Verify ArrayUtils.concatAll over pooled input #2 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0106', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0106', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.concatAll';
        addLog('testUtilsSuite02Case0106: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1];
        addLog('testUtilsSuite02Case0106: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.concat([1, 2]);
        addLog('testUtilsSuite02Case0106: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.concatAll(input, [1, 2]);
        addLog('testUtilsSuite02Case0106: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.concatAll(input, [1, 2]);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0106: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0107
     * @tc.name      testUtilsSuite02Case0107
     * @tc.desc      Verify ArrayUtils.concatAll over pooled input #3 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0107', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0107', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.concatAll';
        addLog('testUtilsSuite02Case0107: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [1, 2, 3];
        addLog('testUtilsSuite02Case0107: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.concat([1, 2]);
        addLog('testUtilsSuite02Case0107: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.concatAll(input, [1, 2]);
        addLog('testUtilsSuite02Case0107: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.concatAll(input, [1, 2]);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0107: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0108
     * @tc.name      testUtilsSuite02Case0108
     * @tc.desc      Verify ArrayUtils.concatAll over pooled input #4 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0108', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0108', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.concatAll';
        addLog('testUtilsSuite02Case0108: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [3, 1, 2];
        addLog('testUtilsSuite02Case0108: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.concat([1, 2]);
        addLog('testUtilsSuite02Case0108: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.concatAll(input, [1, 2]);
        addLog('testUtilsSuite02Case0108: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.concatAll(input, [1, 2]);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0108: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0109
     * @tc.name      testUtilsSuite02Case0109
     * @tc.desc      Verify ArrayUtils.concatAll over pooled input #5 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0109', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0109', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.concatAll';
        addLog('testUtilsSuite02Case0109: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [5, 5, 5];
        addLog('testUtilsSuite02Case0109: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.concat([1, 2]);
        addLog('testUtilsSuite02Case0109: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.concatAll(input, [1, 2]);
        addLog('testUtilsSuite02Case0109: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.concatAll(input, [1, 2]);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0109: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0110
     * @tc.name      testUtilsSuite02Case0110
     * @tc.desc      Verify ArrayUtils.concatAll over pooled input #6 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0110', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0110', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.concatAll';
        addLog('testUtilsSuite02Case0110: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [-1, 0, 1];
        addLog('testUtilsSuite02Case0110: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.concat([1, 2]);
        addLog('testUtilsSuite02Case0110: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.concatAll(input, [1, 2]);
        addLog('testUtilsSuite02Case0110: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.concatAll(input, [1, 2]);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0110: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0111
     * @tc.name      testUtilsSuite02Case0111
     * @tc.desc      Verify ArrayUtils.concatAll over pooled input #7 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0111', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0111', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.concatAll';
        addLog('testUtilsSuite02Case0111: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [7, 7, 9, 11];
        addLog('testUtilsSuite02Case0111: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.concat([1, 2]);
        addLog('testUtilsSuite02Case0111: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.concatAll(input, [1, 2]);
        addLog('testUtilsSuite02Case0111: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.concatAll(input, [1, 2]);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0111: end %{public}s', suiteName);
      }, done);
    });



    /**
     * @tc.number    SUB_A11Y_UTILS_S02_C0112
     * @tc.name      testUtilsSuite02Case0112
     * @tc.desc      Verify ArrayUtils.concatAll over pooled input #8 of the suite.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     * @tc.author    sample-author
     * @tc.since     2026
     * @tc.precondition The helper class is imported statically, no device service is involved.
     * @tc.steps     Build the pooled input, call the helper, compare against the local oracle.
     * @tc.expected  The helper reproduces the oracle for this pooled input.
     */
    it('testUtilsSuite02Case0112', 0, async (done: Function) => {
      await runCase('testUtilsSuite02Case0112', async (): Promise<void> => {
        const suiteName: string = 'ArrayUtils.concatAll';
        addLog('testUtilsSuite02Case0112: begin %{public}s', suiteName);
        // Step 1: materialise the pooled input literal used by this case.
        const input: number[] = [100, 50, 25, 12, 6];
        addLog('testUtilsSuite02Case0112: input=%{public}s', String(input));
        // Step 2: compute the expected value from a local oracle.
        // The oracle only depends on the input, so a wrong helper fails here.
        const expected: number[] = input.concat([1, 2]);
        addLog('testUtilsSuite02Case0112: expected=%{public}s', String(expected));
        // Step 3: invoke the helper under test.
        const actual: number[] = ArrayUtils.concatAll(input, [1, 2]);
        addLog('testUtilsSuite02Case0112: actual=%{public}s', String(actual));
        // Step 4: assert the value, the type shape and the stability of the call.
        expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
        expect(Array.isArray(actual)).assertTrue();
        // The helper is side effect free, a second call must not drift.
        const repeated: number[] = ArrayUtils.concatAll(input, [1, 2]);
        expect(JSON.stringify(repeated)).assertEqual(JSON.stringify(actual));
        // Step 5: nothing is cached between cases, so nothing has to be cleaned up.
        addLog('testUtilsSuite02Case0112: end %{public}s', suiteName);
      }, done);
    });



  });
}
