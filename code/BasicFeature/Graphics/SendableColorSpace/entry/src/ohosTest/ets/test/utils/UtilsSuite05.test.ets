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

import { describe, expect, it } from '@ohos/hypium';
import { ArrayUtils } from '../../../../main/ets/common/utils/ArrayUtils';
import { addLog, runCase } from '../../testkit/SharedDriver';

/**
 * ArrayUtils utility suite.
 *
 * Every method of the class is expanded over the same pooled input set, and every case
 * compares the returned value against a locally stated expectation.
 */
export default function utilsSuite05(): void {
    describe('UtilsSuite05', () => {

        /*
         * @tc.number: SUB_CS_UTIL_S05_0001
         * @tc.name: testUtilsSuite05Case0001
         * @tc.desc: Verify ArrayUtils.sum over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0001', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0001', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0001: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.sum(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0001: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.sum(values);
                await addLog(`testUtilsSuite05Case0001: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0001: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0002
         * @tc.name: testUtilsSuite05Case0002
         * @tc.desc: Verify ArrayUtils.sum over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0002', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0002', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 3];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 6;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0002: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.sum(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0002: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.sum(values);
                await addLog(`testUtilsSuite05Case0002: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0002: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0003
         * @tc.name: testUtilsSuite05Case0003
         * @tc.desc: Verify ArrayUtils.sum over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0003', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0003', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [5];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 5;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0003: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.sum(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0003: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.sum(values);
                await addLog(`testUtilsSuite05Case0003: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0003: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0004
         * @tc.name: testUtilsSuite05Case0004
         * @tc.desc: Verify ArrayUtils.sum over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0004', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0004', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [-1, -2];
                // Step 2: state the expected value from a local oracle.
                const expected: number = -3;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0004: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.sum(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0004: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.sum(values);
                await addLog(`testUtilsSuite05Case0004: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0004: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0005
         * @tc.name: testUtilsSuite05Case0005
         * @tc.desc: Verify ArrayUtils.sum over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0005', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0005', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [3, 1, 2];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 6;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0005: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.sum(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0005: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.sum(values);
                await addLog(`testUtilsSuite05Case0005: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0005: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0006
         * @tc.name: testUtilsSuite05Case0006
         * @tc.desc: Verify ArrayUtils.sum over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0006', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0006', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [0, 0, 0];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0006: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.sum(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0006: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.sum(values);
                await addLog(`testUtilsSuite05Case0006: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0006: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0007
         * @tc.name: testUtilsSuite05Case0007
         * @tc.desc: Verify ArrayUtils.sum over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0007', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0007', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 100;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0007: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.sum(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0007: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.sum(values);
                await addLog(`testUtilsSuite05Case0007: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0007: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0008
         * @tc.name: testUtilsSuite05Case0008
         * @tc.desc: Verify ArrayUtils.sum over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0008', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0008', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [7, 7];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 14;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0008: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.sum(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0008: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.sum(values);
                await addLog(`testUtilsSuite05Case0008: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0008: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0009
         * @tc.name: testUtilsSuite05Case0009
         * @tc.desc: Verify ArrayUtils.average over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0009', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0009', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0009: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.average(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0009: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.average(values);
                await addLog(`testUtilsSuite05Case0009: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0009: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0010
         * @tc.name: testUtilsSuite05Case0010
         * @tc.desc: Verify ArrayUtils.average over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0010', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0010', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 3];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0010: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.average(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0010: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.average(values);
                await addLog(`testUtilsSuite05Case0010: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0010: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0011
         * @tc.name: testUtilsSuite05Case0011
         * @tc.desc: Verify ArrayUtils.average over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0011', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0011', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [5];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 5;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0011: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.average(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0011: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.average(values);
                await addLog(`testUtilsSuite05Case0011: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0011: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0012
         * @tc.name: testUtilsSuite05Case0012
         * @tc.desc: Verify ArrayUtils.average over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0012', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0012', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [-1, -2];
                // Step 2: state the expected value from a local oracle.
                const expected: number = -1.5;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0012: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.average(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0012: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.average(values);
                await addLog(`testUtilsSuite05Case0012: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0012: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0013
         * @tc.name: testUtilsSuite05Case0013
         * @tc.desc: Verify ArrayUtils.average over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0013', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0013', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [3, 1, 2];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0013: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.average(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0013: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.average(values);
                await addLog(`testUtilsSuite05Case0013: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0013: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0014
         * @tc.name: testUtilsSuite05Case0014
         * @tc.desc: Verify ArrayUtils.average over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0014', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0014', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [0, 0, 0];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0014: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.average(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0014: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.average(values);
                await addLog(`testUtilsSuite05Case0014: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0014: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0015
         * @tc.name: testUtilsSuite05Case0015
         * @tc.desc: Verify ArrayUtils.average over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0015', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0015', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 25;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0015: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.average(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0015: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.average(values);
                await addLog(`testUtilsSuite05Case0015: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0015: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0016
         * @tc.name: testUtilsSuite05Case0016
         * @tc.desc: Verify ArrayUtils.average over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0016', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0016', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [7, 7];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 7;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0016: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.average(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0016: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.average(values);
                await addLog(`testUtilsSuite05Case0016: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0016: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0017
         * @tc.name: testUtilsSuite05Case0017
         * @tc.desc: Verify ArrayUtils.maxOf over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0017', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0017', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0017: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.maxOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0017: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.maxOf(values);
                await addLog(`testUtilsSuite05Case0017: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0017: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0018
         * @tc.name: testUtilsSuite05Case0018
         * @tc.desc: Verify ArrayUtils.maxOf over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0018', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0018', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 3];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 3;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0018: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.maxOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0018: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.maxOf(values);
                await addLog(`testUtilsSuite05Case0018: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0018: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0019
         * @tc.name: testUtilsSuite05Case0019
         * @tc.desc: Verify ArrayUtils.maxOf over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0019', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0019', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [5];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 5;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0019: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.maxOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0019: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.maxOf(values);
                await addLog(`testUtilsSuite05Case0019: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0019: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0020
         * @tc.name: testUtilsSuite05Case0020
         * @tc.desc: Verify ArrayUtils.maxOf over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0020', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0020', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [-1, -2];
                // Step 2: state the expected value from a local oracle.
                const expected: number = -1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0020: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.maxOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0020: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.maxOf(values);
                await addLog(`testUtilsSuite05Case0020: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0020: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0021
         * @tc.name: testUtilsSuite05Case0021
         * @tc.desc: Verify ArrayUtils.maxOf over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0021', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0021', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [3, 1, 2];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 3;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0021: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.maxOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0021: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.maxOf(values);
                await addLog(`testUtilsSuite05Case0021: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0021: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0022
         * @tc.name: testUtilsSuite05Case0022
         * @tc.desc: Verify ArrayUtils.maxOf over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0022', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0022', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [0, 0, 0];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0022: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.maxOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0022: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.maxOf(values);
                await addLog(`testUtilsSuite05Case0022: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0022: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0023
         * @tc.name: testUtilsSuite05Case0023
         * @tc.desc: Verify ArrayUtils.maxOf over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0023', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0023', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 40;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0023: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.maxOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0023: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.maxOf(values);
                await addLog(`testUtilsSuite05Case0023: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0023: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0024
         * @tc.name: testUtilsSuite05Case0024
         * @tc.desc: Verify ArrayUtils.maxOf over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0024', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0024', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [7, 7];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 7;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0024: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.maxOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0024: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.maxOf(values);
                await addLog(`testUtilsSuite05Case0024: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0024: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0025
         * @tc.name: testUtilsSuite05Case0025
         * @tc.desc: Verify ArrayUtils.minOf over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0025', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0025', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0025: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.minOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0025: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.minOf(values);
                await addLog(`testUtilsSuite05Case0025: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0025: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0026
         * @tc.name: testUtilsSuite05Case0026
         * @tc.desc: Verify ArrayUtils.minOf over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0026', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0026', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 3];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0026: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.minOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0026: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.minOf(values);
                await addLog(`testUtilsSuite05Case0026: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0026: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0027
         * @tc.name: testUtilsSuite05Case0027
         * @tc.desc: Verify ArrayUtils.minOf over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0027', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0027', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [5];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 5;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0027: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.minOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0027: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.minOf(values);
                await addLog(`testUtilsSuite05Case0027: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0027: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0028
         * @tc.name: testUtilsSuite05Case0028
         * @tc.desc: Verify ArrayUtils.minOf over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0028', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0028', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [-1, -2];
                // Step 2: state the expected value from a local oracle.
                const expected: number = -2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0028: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.minOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0028: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.minOf(values);
                await addLog(`testUtilsSuite05Case0028: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0028: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0029
         * @tc.name: testUtilsSuite05Case0029
         * @tc.desc: Verify ArrayUtils.minOf over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0029', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0029', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [3, 1, 2];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0029: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.minOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0029: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.minOf(values);
                await addLog(`testUtilsSuite05Case0029: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0029: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0030
         * @tc.name: testUtilsSuite05Case0030
         * @tc.desc: Verify ArrayUtils.minOf over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0030', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0030', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [0, 0, 0];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0030: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.minOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0030: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.minOf(values);
                await addLog(`testUtilsSuite05Case0030: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0030: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0031
         * @tc.name: testUtilsSuite05Case0031
         * @tc.desc: Verify ArrayUtils.minOf over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0031', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0031', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 10;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0031: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.minOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0031: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.minOf(values);
                await addLog(`testUtilsSuite05Case0031: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0031: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0032
         * @tc.name: testUtilsSuite05Case0032
         * @tc.desc: Verify ArrayUtils.minOf over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0032', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0032', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [7, 7];
                // Step 2: state the expected value from a local oracle.
                const expected: number = 7;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0032: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.minOf(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0032: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.minOf(values);
                await addLog(`testUtilsSuite05Case0032: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0032: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0033
         * @tc.name: testUtilsSuite05Case0033
         * @tc.desc: Verify ArrayUtils.distinct over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0033', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0033', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0033: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.distinct(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0033: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.distinct(values);
                await addLog(`testUtilsSuite05Case0033: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0033: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0034
         * @tc.name: testUtilsSuite05Case0034
         * @tc.desc: Verify ArrayUtils.distinct over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0034', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0034', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 1, 2];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [1, 2];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0034: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.distinct(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0034: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.distinct(values);
                await addLog(`testUtilsSuite05Case0034: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0034: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0035
         * @tc.name: testUtilsSuite05Case0035
         * @tc.desc: Verify ArrayUtils.distinct over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0035', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0035', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [5, 5, 5];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [5];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0035: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.distinct(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0035: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.distinct(values);
                await addLog(`testUtilsSuite05Case0035: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0035: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0036
         * @tc.name: testUtilsSuite05Case0036
         * @tc.desc: Verify ArrayUtils.distinct over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0036', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0036', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 1];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [1, 2];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0036: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.distinct(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0036: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.distinct(values);
                await addLog(`testUtilsSuite05Case0036: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0036: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0037
         * @tc.name: testUtilsSuite05Case0037
         * @tc.desc: Verify ArrayUtils.distinct over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0037', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0037', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [3, 1, 3, 1];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [3, 1];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0037: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.distinct(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0037: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.distinct(values);
                await addLog(`testUtilsSuite05Case0037: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0037: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0038
         * @tc.name: testUtilsSuite05Case0038
         * @tc.desc: Verify ArrayUtils.distinct over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0038', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0038', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [0, 0];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [0];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0038: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.distinct(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0038: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.distinct(values);
                await addLog(`testUtilsSuite05Case0038: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0038: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0039
         * @tc.name: testUtilsSuite05Case0039
         * @tc.desc: Verify ArrayUtils.distinct over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0039', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0039', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 3, 2, 1];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [1, 2, 3];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0039: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.distinct(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0039: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.distinct(values);
                await addLog(`testUtilsSuite05Case0039: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0039: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0040
         * @tc.name: testUtilsSuite05Case0040
         * @tc.desc: Verify ArrayUtils.distinct over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0040', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0040', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [7];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [7];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0040: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.distinct(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0040: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.distinct(values);
                await addLog(`testUtilsSuite05Case0040: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0040: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0041
         * @tc.name: testUtilsSuite05Case0041
         * @tc.desc: Verify ArrayUtils.containsValue over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0041', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0041', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 3]; const target: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0041: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.containsValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0041: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.containsValue(values, target);
                await addLog(`testUtilsSuite05Case0041: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0041: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0042
         * @tc.name: testUtilsSuite05Case0042
         * @tc.desc: Verify ArrayUtils.containsValue over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0042', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0042', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = []; const target: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0042: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.containsValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0042: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.containsValue(values, target);
                await addLog(`testUtilsSuite05Case0042: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0042: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0043
         * @tc.name: testUtilsSuite05Case0043
         * @tc.desc: Verify ArrayUtils.containsValue over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0043', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0043', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [5]; const target: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0043: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.containsValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0043: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.containsValue(values, target);
                await addLog(`testUtilsSuite05Case0043: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0043: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0044
         * @tc.name: testUtilsSuite05Case0044
         * @tc.desc: Verify ArrayUtils.containsValue over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0044', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0044', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [-1, -2]; const target: number = -2;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0044: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.containsValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0044: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.containsValue(values, target);
                await addLog(`testUtilsSuite05Case0044: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0044: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0045
         * @tc.name: testUtilsSuite05Case0045
         * @tc.desc: Verify ArrayUtils.containsValue over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0045', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0045', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [3, 1, 2]; const target: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0045: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.containsValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0045: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.containsValue(values, target);
                await addLog(`testUtilsSuite05Case0045: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0045: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0046
         * @tc.name: testUtilsSuite05Case0046
         * @tc.desc: Verify ArrayUtils.containsValue over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0046', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0046', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [0, 0, 0]; const target: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0046: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.containsValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0046: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.containsValue(values, target);
                await addLog(`testUtilsSuite05Case0046: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0046: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0047
         * @tc.name: testUtilsSuite05Case0047
         * @tc.desc: Verify ArrayUtils.containsValue over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0047', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0047', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40]; const target: number = 40;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0047: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.containsValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0047: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.containsValue(values, target);
                await addLog(`testUtilsSuite05Case0047: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0047: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0048
         * @tc.name: testUtilsSuite05Case0048
         * @tc.desc: Verify ArrayUtils.containsValue over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0048', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0048', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [7, 7]; const target: number = 8;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0048: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.containsValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0048: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.containsValue(values, target);
                await addLog(`testUtilsSuite05Case0048: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0048: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0049
         * @tc.name: testUtilsSuite05Case0049
         * @tc.desc: Verify ArrayUtils.indexOfValue over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0049', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0049', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 3]; const target: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0049: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.indexOfValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0049: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.indexOfValue(values, target);
                await addLog(`testUtilsSuite05Case0049: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0049: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0050
         * @tc.name: testUtilsSuite05Case0050
         * @tc.desc: Verify ArrayUtils.indexOfValue over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0050', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0050', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = []; const target: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: number = -1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0050: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.indexOfValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0050: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.indexOfValue(values, target);
                await addLog(`testUtilsSuite05Case0050: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0050: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0051
         * @tc.name: testUtilsSuite05Case0051
         * @tc.desc: Verify ArrayUtils.indexOfValue over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0051', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0051', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [5]; const target: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0051: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.indexOfValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0051: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.indexOfValue(values, target);
                await addLog(`testUtilsSuite05Case0051: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0051: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0052
         * @tc.name: testUtilsSuite05Case0052
         * @tc.desc: Verify ArrayUtils.indexOfValue over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0052', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0052', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [-1, -2]; const target: number = -2;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0052: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.indexOfValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0052: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.indexOfValue(values, target);
                await addLog(`testUtilsSuite05Case0052: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0052: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0053
         * @tc.name: testUtilsSuite05Case0053
         * @tc.desc: Verify ArrayUtils.indexOfValue over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0053', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0053', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [3, 1, 2]; const target: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = -1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0053: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.indexOfValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0053: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.indexOfValue(values, target);
                await addLog(`testUtilsSuite05Case0053: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0053: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0054
         * @tc.name: testUtilsSuite05Case0054
         * @tc.desc: Verify ArrayUtils.indexOfValue over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0054', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0054', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [0, 0, 0]; const target: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0054: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.indexOfValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0054: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.indexOfValue(values, target);
                await addLog(`testUtilsSuite05Case0054: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0054: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0055
         * @tc.name: testUtilsSuite05Case0055
         * @tc.desc: Verify ArrayUtils.indexOfValue over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0055', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0055', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40]; const target: number = 30;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0055: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.indexOfValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0055: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.indexOfValue(values, target);
                await addLog(`testUtilsSuite05Case0055: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0055: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0056
         * @tc.name: testUtilsSuite05Case0056
         * @tc.desc: Verify ArrayUtils.indexOfValue over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0056', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0056', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [7, 7]; const target: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0056: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.indexOfValue(values, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0056: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.indexOfValue(values, target);
                await addLog(`testUtilsSuite05Case0056: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0056: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0057
         * @tc.name: testUtilsSuite05Case0057
         * @tc.desc: Verify ArrayUtils.isEmpty over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0057', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0057', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [];
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0057: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.isEmpty(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0057: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.isEmpty(values);
                await addLog(`testUtilsSuite05Case0057: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0057: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0058
         * @tc.name: testUtilsSuite05Case0058
         * @tc.desc: Verify ArrayUtils.isEmpty over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0058', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0058', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 3];
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0058: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.isEmpty(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0058: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.isEmpty(values);
                await addLog(`testUtilsSuite05Case0058: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0058: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0059
         * @tc.name: testUtilsSuite05Case0059
         * @tc.desc: Verify ArrayUtils.isEmpty over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0059', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0059', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [5];
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0059: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.isEmpty(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0059: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.isEmpty(values);
                await addLog(`testUtilsSuite05Case0059: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0059: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0060
         * @tc.name: testUtilsSuite05Case0060
         * @tc.desc: Verify ArrayUtils.isEmpty over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0060', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0060', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [-1, -2];
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0060: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.isEmpty(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0060: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.isEmpty(values);
                await addLog(`testUtilsSuite05Case0060: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0060: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0061
         * @tc.name: testUtilsSuite05Case0061
         * @tc.desc: Verify ArrayUtils.isEmpty over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0061', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0061', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [3, 1, 2];
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0061: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.isEmpty(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0061: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.isEmpty(values);
                await addLog(`testUtilsSuite05Case0061: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0061: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0062
         * @tc.name: testUtilsSuite05Case0062
         * @tc.desc: Verify ArrayUtils.isEmpty over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0062', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0062', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [0, 0, 0];
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0062: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.isEmpty(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0062: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.isEmpty(values);
                await addLog(`testUtilsSuite05Case0062: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0062: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0063
         * @tc.name: testUtilsSuite05Case0063
         * @tc.desc: Verify ArrayUtils.isEmpty over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0063', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0063', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40];
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0063: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.isEmpty(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0063: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.isEmpty(values);
                await addLog(`testUtilsSuite05Case0063: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0063: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0064
         * @tc.name: testUtilsSuite05Case0064
         * @tc.desc: Verify ArrayUtils.isEmpty over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0064', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0064', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [7, 7];
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0064: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ArrayUtils.isEmpty(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0064: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ArrayUtils.isEmpty(values);
                await addLog(`testUtilsSuite05Case0064: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0064: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0065
         * @tc.name: testUtilsSuite05Case0065
         * @tc.desc: Verify ArrayUtils.countGreater over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0065', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0065', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 3]; const threshold: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0065: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.countGreater(values, threshold);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0065: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.countGreater(values, threshold);
                await addLog(`testUtilsSuite05Case0065: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0065: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0066
         * @tc.name: testUtilsSuite05Case0066
         * @tc.desc: Verify ArrayUtils.countGreater over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0066', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0066', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = []; const threshold: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0066: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.countGreater(values, threshold);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0066: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.countGreater(values, threshold);
                await addLog(`testUtilsSuite05Case0066: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0066: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0067
         * @tc.name: testUtilsSuite05Case0067
         * @tc.desc: Verify ArrayUtils.countGreater over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0067', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0067', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [5]; const threshold: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0067: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.countGreater(values, threshold);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0067: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.countGreater(values, threshold);
                await addLog(`testUtilsSuite05Case0067: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0067: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0068
         * @tc.name: testUtilsSuite05Case0068
         * @tc.desc: Verify ArrayUtils.countGreater over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0068', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0068', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [-1, -2]; const threshold: number = -2;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0068: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.countGreater(values, threshold);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0068: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.countGreater(values, threshold);
                await addLog(`testUtilsSuite05Case0068: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0068: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0069
         * @tc.name: testUtilsSuite05Case0069
         * @tc.desc: Verify ArrayUtils.countGreater over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0069', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0069', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [3, 1, 2]; const threshold: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0069: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.countGreater(values, threshold);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0069: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.countGreater(values, threshold);
                await addLog(`testUtilsSuite05Case0069: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0069: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0070
         * @tc.name: testUtilsSuite05Case0070
         * @tc.desc: Verify ArrayUtils.countGreater over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0070', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0070', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [0, 0, 0]; const threshold: number = -1;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 3;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0070: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.countGreater(values, threshold);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0070: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.countGreater(values, threshold);
                await addLog(`testUtilsSuite05Case0070: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0070: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0071
         * @tc.name: testUtilsSuite05Case0071
         * @tc.desc: Verify ArrayUtils.countGreater over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0071', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0071', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40]; const threshold: number = 15;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 3;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0071: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.countGreater(values, threshold);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0071: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.countGreater(values, threshold);
                await addLog(`testUtilsSuite05Case0071: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0071: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0072
         * @tc.name: testUtilsSuite05Case0072
         * @tc.desc: Verify ArrayUtils.countGreater over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0072', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0072', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [7, 7]; const threshold: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0072: expected=${JSON.stringify(expected)}`);
                const actual: number = ArrayUtils.countGreater(values, threshold);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0072: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ArrayUtils.countGreater(values, threshold);
                await addLog(`testUtilsSuite05Case0072: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0072: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0073
         * @tc.name: testUtilsSuite05Case0073
         * @tc.desc: Verify ArrayUtils.joinComma over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0073', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0073', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [];
                // Step 2: state the expected value from a local oracle.
                const expected: string = '';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0073: expected=${JSON.stringify(expected)}`);
                const actual: string = ArrayUtils.joinComma(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0073: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ArrayUtils.joinComma(values);
                await addLog(`testUtilsSuite05Case0073: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0073: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0074
         * @tc.name: testUtilsSuite05Case0074
         * @tc.desc: Verify ArrayUtils.joinComma over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0074', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0074', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 3];
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1,2,3';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0074: expected=${JSON.stringify(expected)}`);
                const actual: string = ArrayUtils.joinComma(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0074: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ArrayUtils.joinComma(values);
                await addLog(`testUtilsSuite05Case0074: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0074: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0075
         * @tc.name: testUtilsSuite05Case0075
         * @tc.desc: Verify ArrayUtils.joinComma over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0075', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0075', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [5];
                // Step 2: state the expected value from a local oracle.
                const expected: string = '5';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0075: expected=${JSON.stringify(expected)}`);
                const actual: string = ArrayUtils.joinComma(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0075: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ArrayUtils.joinComma(values);
                await addLog(`testUtilsSuite05Case0075: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0075: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0076
         * @tc.name: testUtilsSuite05Case0076
         * @tc.desc: Verify ArrayUtils.joinComma over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0076', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0076', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [-1, -2];
                // Step 2: state the expected value from a local oracle.
                const expected: string = '-1,-2';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0076: expected=${JSON.stringify(expected)}`);
                const actual: string = ArrayUtils.joinComma(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0076: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ArrayUtils.joinComma(values);
                await addLog(`testUtilsSuite05Case0076: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0076: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0077
         * @tc.name: testUtilsSuite05Case0077
         * @tc.desc: Verify ArrayUtils.joinComma over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0077', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0077', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [3, 1, 2];
                // Step 2: state the expected value from a local oracle.
                const expected: string = '3,1,2';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0077: expected=${JSON.stringify(expected)}`);
                const actual: string = ArrayUtils.joinComma(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0077: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ArrayUtils.joinComma(values);
                await addLog(`testUtilsSuite05Case0077: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0077: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0078
         * @tc.name: testUtilsSuite05Case0078
         * @tc.desc: Verify ArrayUtils.joinComma over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0078', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0078', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [0, 0, 0];
                // Step 2: state the expected value from a local oracle.
                const expected: string = '0,0,0';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0078: expected=${JSON.stringify(expected)}`);
                const actual: string = ArrayUtils.joinComma(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0078: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ArrayUtils.joinComma(values);
                await addLog(`testUtilsSuite05Case0078: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0078: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0079
         * @tc.name: testUtilsSuite05Case0079
         * @tc.desc: Verify ArrayUtils.joinComma over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0079', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0079', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40];
                // Step 2: state the expected value from a local oracle.
                const expected: string = '10,20,30,40';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0079: expected=${JSON.stringify(expected)}`);
                const actual: string = ArrayUtils.joinComma(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0079: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ArrayUtils.joinComma(values);
                await addLog(`testUtilsSuite05Case0079: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0079: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0080
         * @tc.name: testUtilsSuite05Case0080
         * @tc.desc: Verify ArrayUtils.joinComma over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0080', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0080', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [7, 7];
                // Step 2: state the expected value from a local oracle.
                const expected: string = '7,7';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0080: expected=${JSON.stringify(expected)}`);
                const actual: string = ArrayUtils.joinComma(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0080: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ArrayUtils.joinComma(values);
                await addLog(`testUtilsSuite05Case0080: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0080: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0081
         * @tc.name: testUtilsSuite05Case0081
         * @tc.desc: Verify ArrayUtils.reversed over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0081', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0081', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0081: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.reversed(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0081: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.reversed(values);
                await addLog(`testUtilsSuite05Case0081: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0081: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0082
         * @tc.name: testUtilsSuite05Case0082
         * @tc.desc: Verify ArrayUtils.reversed over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0082', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0082', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 3];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [3, 2, 1];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0082: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.reversed(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0082: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.reversed(values);
                await addLog(`testUtilsSuite05Case0082: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0082: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0083
         * @tc.name: testUtilsSuite05Case0083
         * @tc.desc: Verify ArrayUtils.reversed over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0083', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0083', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [5];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [5];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0083: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.reversed(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0083: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.reversed(values);
                await addLog(`testUtilsSuite05Case0083: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0083: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0084
         * @tc.name: testUtilsSuite05Case0084
         * @tc.desc: Verify ArrayUtils.reversed over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0084', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0084', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [-1, -2];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [-2, -1];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0084: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.reversed(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0084: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.reversed(values);
                await addLog(`testUtilsSuite05Case0084: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0084: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0085
         * @tc.name: testUtilsSuite05Case0085
         * @tc.desc: Verify ArrayUtils.reversed over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0085', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0085', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [3, 1, 2];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [2, 1, 3];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0085: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.reversed(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0085: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.reversed(values);
                await addLog(`testUtilsSuite05Case0085: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0085: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0086
         * @tc.name: testUtilsSuite05Case0086
         * @tc.desc: Verify ArrayUtils.reversed over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0086', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0086', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [0, 0, 0];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [0, 0, 0];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0086: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.reversed(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0086: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.reversed(values);
                await addLog(`testUtilsSuite05Case0086: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0086: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0087
         * @tc.name: testUtilsSuite05Case0087
         * @tc.desc: Verify ArrayUtils.reversed over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0087', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0087', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [40, 30, 20, 10];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0087: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.reversed(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0087: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.reversed(values);
                await addLog(`testUtilsSuite05Case0087: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0087: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0088
         * @tc.name: testUtilsSuite05Case0088
         * @tc.desc: Verify ArrayUtils.reversed over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0088', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0088', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [7, 7];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [7, 7];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0088: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.reversed(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0088: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.reversed(values);
                await addLog(`testUtilsSuite05Case0088: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0088: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0089
         * @tc.name: testUtilsSuite05Case0089
         * @tc.desc: Verify ArrayUtils.sortedAsc over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0089', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0089', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0089: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sortedAsc(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0089: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sortedAsc(values);
                await addLog(`testUtilsSuite05Case0089: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0089: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0090
         * @tc.name: testUtilsSuite05Case0090
         * @tc.desc: Verify ArrayUtils.sortedAsc over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0090', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0090', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [1, 2, 3];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [1, 2, 3];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0090: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sortedAsc(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0090: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sortedAsc(values);
                await addLog(`testUtilsSuite05Case0090: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0090: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0091
         * @tc.name: testUtilsSuite05Case0091
         * @tc.desc: Verify ArrayUtils.sortedAsc over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0091', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0091', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [5];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [5];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0091: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sortedAsc(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0091: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sortedAsc(values);
                await addLog(`testUtilsSuite05Case0091: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0091: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0092
         * @tc.name: testUtilsSuite05Case0092
         * @tc.desc: Verify ArrayUtils.sortedAsc over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0092', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0092', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [-1, -2];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [-2, -1];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0092: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sortedAsc(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0092: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sortedAsc(values);
                await addLog(`testUtilsSuite05Case0092: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0092: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0093
         * @tc.name: testUtilsSuite05Case0093
         * @tc.desc: Verify ArrayUtils.sortedAsc over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0093', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0093', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [3, 1, 2];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [1, 2, 3];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0093: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sortedAsc(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0093: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sortedAsc(values);
                await addLog(`testUtilsSuite05Case0093: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0093: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0094
         * @tc.name: testUtilsSuite05Case0094
         * @tc.desc: Verify ArrayUtils.sortedAsc over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0094', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0094', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [0, 0, 0];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [0, 0, 0];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0094: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sortedAsc(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0094: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sortedAsc(values);
                await addLog(`testUtilsSuite05Case0094: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0094: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0095
         * @tc.name: testUtilsSuite05Case0095
         * @tc.desc: Verify ArrayUtils.sortedAsc over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0095', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0095', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [10, 20, 30, 40];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0095: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sortedAsc(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0095: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sortedAsc(values);
                await addLog(`testUtilsSuite05Case0095: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0095: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0096
         * @tc.name: testUtilsSuite05Case0096
         * @tc.desc: Verify ArrayUtils.sortedAsc over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0096', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0096', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [7, 7];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [7, 7];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0096: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sortedAsc(values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0096: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sortedAsc(values);
                await addLog(`testUtilsSuite05Case0096: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0096: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0097
         * @tc.name: testUtilsSuite05Case0097
         * @tc.desc: Verify ArrayUtils.sliceSafe over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0097', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0097', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40]; const start: number = 0; const end: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [10, 20];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0097: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sliceSafe(values, start, end);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0097: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sliceSafe(values, start, end);
                await addLog(`testUtilsSuite05Case0097: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0097: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0098
         * @tc.name: testUtilsSuite05Case0098
         * @tc.desc: Verify ArrayUtils.sliceSafe over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0098', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0098', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40]; const start: number = 1; const end: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [20, 30];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0098: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sliceSafe(values, start, end);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0098: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sliceSafe(values, start, end);
                await addLog(`testUtilsSuite05Case0098: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0098: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0099
         * @tc.name: testUtilsSuite05Case0099
         * @tc.desc: Verify ArrayUtils.sliceSafe over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0099', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0099', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40]; const start: number = 0; const end: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [10, 20, 30, 40];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0099: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sliceSafe(values, start, end);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0099: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sliceSafe(values, start, end);
                await addLog(`testUtilsSuite05Case0099: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0099: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0100
         * @tc.name: testUtilsSuite05Case0100
         * @tc.desc: Verify ArrayUtils.sliceSafe over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0100', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0100', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40]; const start: number = 2; const end: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [30, 40];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0100: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sliceSafe(values, start, end);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0100: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sliceSafe(values, start, end);
                await addLog(`testUtilsSuite05Case0100: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0100: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0101
         * @tc.name: testUtilsSuite05Case0101
         * @tc.desc: Verify ArrayUtils.sliceSafe over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0101', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0101', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40]; const start: number = 4; const end: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0101: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sliceSafe(values, start, end);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0101: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sliceSafe(values, start, end);
                await addLog(`testUtilsSuite05Case0101: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0101: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0102
         * @tc.name: testUtilsSuite05Case0102
         * @tc.desc: Verify ArrayUtils.sliceSafe over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0102', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0102', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40]; const start: number = -1; const end: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0102: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sliceSafe(values, start, end);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0102: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sliceSafe(values, start, end);
                await addLog(`testUtilsSuite05Case0102: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0102: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0103
         * @tc.name: testUtilsSuite05Case0103
         * @tc.desc: Verify ArrayUtils.sliceSafe over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0103', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0103', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40]; const start: number = 2; const end: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0103: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sliceSafe(values, start, end);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0103: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sliceSafe(values, start, end);
                await addLog(`testUtilsSuite05Case0103: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0103: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0104
         * @tc.name: testUtilsSuite05Case0104
         * @tc.desc: Verify ArrayUtils.sliceSafe over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0104', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0104', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const values: number[] = [10, 20, 30, 40]; const start: number = 3; const end: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0104: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.sliceSafe(values, start, end);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0104: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.sliceSafe(values, start, end);
                await addLog(`testUtilsSuite05Case0104: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0104: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0105
         * @tc.name: testUtilsSuite05Case0105
         * @tc.desc: Verify ArrayUtils.concatAll over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0105', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0105', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number[] = [1, 2]; const second: number[] = [3];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [1, 2, 3];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0105: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.concatAll(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0105: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.concatAll(first, second);
                await addLog(`testUtilsSuite05Case0105: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0105: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0106
         * @tc.name: testUtilsSuite05Case0106
         * @tc.desc: Verify ArrayUtils.concatAll over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0106', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0106', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number[] = []; const second: number[] = [];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0106: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.concatAll(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0106: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.concatAll(first, second);
                await addLog(`testUtilsSuite05Case0106: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0106: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0107
         * @tc.name: testUtilsSuite05Case0107
         * @tc.desc: Verify ArrayUtils.concatAll over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0107', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0107', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number[] = [1]; const second: number[] = [];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [1];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0107: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.concatAll(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0107: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.concatAll(first, second);
                await addLog(`testUtilsSuite05Case0107: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0107: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0108
         * @tc.name: testUtilsSuite05Case0108
         * @tc.desc: Verify ArrayUtils.concatAll over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0108', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0108', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number[] = []; const second: number[] = [2];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [2];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0108: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.concatAll(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0108: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.concatAll(first, second);
                await addLog(`testUtilsSuite05Case0108: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0108: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0109
         * @tc.name: testUtilsSuite05Case0109
         * @tc.desc: Verify ArrayUtils.concatAll over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0109', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0109', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number[] = [1, 2]; const second: number[] = [2, 3];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [1, 2, 2, 3];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0109: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.concatAll(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0109: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.concatAll(first, second);
                await addLog(`testUtilsSuite05Case0109: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0109: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0110
         * @tc.name: testUtilsSuite05Case0110
         * @tc.desc: Verify ArrayUtils.concatAll over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0110', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0110', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number[] = [0]; const second: number[] = [0];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [0, 0];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0110: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.concatAll(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0110: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.concatAll(first, second);
                await addLog(`testUtilsSuite05Case0110: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0110: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0111
         * @tc.name: testUtilsSuite05Case0111
         * @tc.desc: Verify ArrayUtils.concatAll over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0111', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0111', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number[] = [9, 8]; const second: number[] = [7];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [9, 8, 7];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0111: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.concatAll(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0111: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.concatAll(first, second);
                await addLog(`testUtilsSuite05Case0111: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0111: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S05_0112
         * @tc.name: testUtilsSuite05Case0112
         * @tc.desc: Verify ArrayUtils.concatAll over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite05Case0112', 0, async (done: Function) => {
            await runCase('testUtilsSuite05Case0112', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number[] = [-1]; const second: number[] = [-2];
                // Step 2: state the expected value from a local oracle.
                const expected: number[] = [-1, -2];
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite05Case0112: expected=${JSON.stringify(expected)}`);
                const actual: number[] = ArrayUtils.concatAll(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite05Case0112: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number[] = ArrayUtils.concatAll(first, second);
                await addLog(`testUtilsSuite05Case0112: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite05Case0112: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

    });
}
