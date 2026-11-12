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
import { RandomUtils } from '../../../../main/ets/common/utils/RandomUtils';
import { addLog, runCase } from '../../testkit/SharedDriver';

/**
 * RandomUtils utility suite.
 *
 * Every method of the class is expanded over the same pooled input set, and every case
 * compares the returned value against a locally stated expectation.
 */
export default function utilsSuite15(): void {
    describe('UtilsSuite15', () => {

        /*
         * @tc.number: SUB_CS_UTIL_S15_0001
         * @tc.name: testUtilsSuite15Case0001
         * @tc.desc: Verify RandomUtils.nextValue over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0001', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0001', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 17;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0001: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextValue(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0001: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextValue(seed);
                await addLog(`testUtilsSuite15Case0001: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0001: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0002
         * @tc.name: testUtilsSuite15Case0002
         * @tc.desc: Verify RandomUtils.nextValue over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0002', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0002', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 54;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0002: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextValue(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0002: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextValue(seed);
                await addLog(`testUtilsSuite15Case0002: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0002: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0003
         * @tc.name: testUtilsSuite15Case0003
         * @tc.desc: Verify RandomUtils.nextValue over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0003', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0003', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 91;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0003: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextValue(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0003: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextValue(seed);
                await addLog(`testUtilsSuite15Case0003: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0003: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0004
         * @tc.name: testUtilsSuite15Case0004
         * @tc.desc: Verify RandomUtils.nextValue over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0004', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0004', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 27;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0004: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextValue(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0004: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextValue(seed);
                await addLog(`testUtilsSuite15Case0004: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0004: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0005
         * @tc.name: testUtilsSuite15Case0005
         * @tc.desc: Verify RandomUtils.nextValue over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0005', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0005', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 64;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0005: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextValue(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0005: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextValue(seed);
                await addLog(`testUtilsSuite15Case0005: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0005: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0006
         * @tc.name: testUtilsSuite15Case0006
         * @tc.desc: Verify RandomUtils.nextValue over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0006', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0006', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0006: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextValue(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0006: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextValue(seed);
                await addLog(`testUtilsSuite15Case0006: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0006: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0007
         * @tc.name: testUtilsSuite15Case0007
         * @tc.desc: Verify RandomUtils.nextValue over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0007', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0007', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 37;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0007: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextValue(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0007: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextValue(seed);
                await addLog(`testUtilsSuite15Case0007: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0007: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0008
         * @tc.name: testUtilsSuite15Case0008
         * @tc.desc: Verify RandomUtils.nextValue over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0008', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0008', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 74;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0008: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextValue(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0008: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextValue(seed);
                await addLog(`testUtilsSuite15Case0008: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0008: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0009
         * @tc.name: testUtilsSuite15Case0009
         * @tc.desc: Verify RandomUtils.nextBool over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0009', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0009', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0009: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.nextBool(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0009: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.nextBool(seed);
                await addLog(`testUtilsSuite15Case0009: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0009: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0010
         * @tc.name: testUtilsSuite15Case0010
         * @tc.desc: Verify RandomUtils.nextBool over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0010', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0010', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0010: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.nextBool(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0010: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.nextBool(seed);
                await addLog(`testUtilsSuite15Case0010: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0010: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0011
         * @tc.name: testUtilsSuite15Case0011
         * @tc.desc: Verify RandomUtils.nextBool over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0011', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0011', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0011: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.nextBool(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0011: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.nextBool(seed);
                await addLog(`testUtilsSuite15Case0011: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0011: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0012
         * @tc.name: testUtilsSuite15Case0012
         * @tc.desc: Verify RandomUtils.nextBool over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0012', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0012', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0012: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.nextBool(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0012: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.nextBool(seed);
                await addLog(`testUtilsSuite15Case0012: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0012: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0013
         * @tc.name: testUtilsSuite15Case0013
         * @tc.desc: Verify RandomUtils.nextBool over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0013', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0013', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0013: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.nextBool(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0013: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.nextBool(seed);
                await addLog(`testUtilsSuite15Case0013: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0013: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0014
         * @tc.name: testUtilsSuite15Case0014
         * @tc.desc: Verify RandomUtils.nextBool over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0014', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0014', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0014: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.nextBool(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0014: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.nextBool(seed);
                await addLog(`testUtilsSuite15Case0014: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0014: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0015
         * @tc.name: testUtilsSuite15Case0015
         * @tc.desc: Verify RandomUtils.nextBool over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0015', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0015', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0015: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.nextBool(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0015: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.nextBool(seed);
                await addLog(`testUtilsSuite15Case0015: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0015: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0016
         * @tc.name: testUtilsSuite15Case0016
         * @tc.desc: Verify RandomUtils.nextBool over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0016', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0016', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0016: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.nextBool(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0016: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.nextBool(seed);
                await addLog(`testUtilsSuite15Case0016: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0016: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0017
         * @tc.name: testUtilsSuite15Case0017
         * @tc.desc: Verify RandomUtils.nextInRange over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0017', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0017', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0; const min: number = 1; const max: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 6;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0017: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextInRange(seed, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0017: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextInRange(seed, min, max);
                await addLog(`testUtilsSuite15Case0017: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0017: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0018
         * @tc.name: testUtilsSuite15Case0018
         * @tc.desc: Verify RandomUtils.nextInRange over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0018', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0018', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1; const min: number = 1; const max: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0018: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextInRange(seed, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0018: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextInRange(seed, min, max);
                await addLog(`testUtilsSuite15Case0018: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0018: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0019
         * @tc.name: testUtilsSuite15Case0019
         * @tc.desc: Verify RandomUtils.nextInRange over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0019', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0019', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2; const min: number = 1; const max: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0019: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextInRange(seed, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0019: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextInRange(seed, min, max);
                await addLog(`testUtilsSuite15Case0019: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0019: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0020
         * @tc.name: testUtilsSuite15Case0020
         * @tc.desc: Verify RandomUtils.nextInRange over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0020', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0020', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3; const min: number = 1; const max: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 4;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0020: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextInRange(seed, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0020: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextInRange(seed, min, max);
                await addLog(`testUtilsSuite15Case0020: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0020: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0021
         * @tc.name: testUtilsSuite15Case0021
         * @tc.desc: Verify RandomUtils.nextInRange over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0021', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0021', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4; const min: number = 1; const max: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 5;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0021: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextInRange(seed, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0021: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextInRange(seed, min, max);
                await addLog(`testUtilsSuite15Case0021: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0021: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0022
         * @tc.name: testUtilsSuite15Case0022
         * @tc.desc: Verify RandomUtils.nextInRange over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0022', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0022', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5; const min: number = 1; const max: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0022: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextInRange(seed, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0022: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextInRange(seed, min, max);
                await addLog(`testUtilsSuite15Case0022: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0022: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0023
         * @tc.name: testUtilsSuite15Case0023
         * @tc.desc: Verify RandomUtils.nextInRange over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0023', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0023', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6; const min: number = 1; const max: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0023: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextInRange(seed, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0023: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextInRange(seed, min, max);
                await addLog(`testUtilsSuite15Case0023: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0023: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0024
         * @tc.name: testUtilsSuite15Case0024
         * @tc.desc: Verify RandomUtils.nextInRange over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0024', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0024', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7; const min: number = 1; const max: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 3;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0024: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.nextInRange(seed, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0024: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.nextInRange(seed, min, max);
                await addLog(`testUtilsSuite15Case0024: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0024: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0025
         * @tc.name: testUtilsSuite15Case0025
         * @tc.desc: Verify RandomUtils.diceRoll over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0025', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0025', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 6;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0025: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.diceRoll(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0025: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.diceRoll(seed);
                await addLog(`testUtilsSuite15Case0025: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0025: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0026
         * @tc.name: testUtilsSuite15Case0026
         * @tc.desc: Verify RandomUtils.diceRoll over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0026', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0026', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0026: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.diceRoll(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0026: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.diceRoll(seed);
                await addLog(`testUtilsSuite15Case0026: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0026: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0027
         * @tc.name: testUtilsSuite15Case0027
         * @tc.desc: Verify RandomUtils.diceRoll over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0027', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0027', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0027: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.diceRoll(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0027: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.diceRoll(seed);
                await addLog(`testUtilsSuite15Case0027: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0027: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0028
         * @tc.name: testUtilsSuite15Case0028
         * @tc.desc: Verify RandomUtils.diceRoll over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0028', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0028', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 4;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0028: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.diceRoll(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0028: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.diceRoll(seed);
                await addLog(`testUtilsSuite15Case0028: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0028: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0029
         * @tc.name: testUtilsSuite15Case0029
         * @tc.desc: Verify RandomUtils.diceRoll over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0029', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0029', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 5;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0029: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.diceRoll(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0029: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.diceRoll(seed);
                await addLog(`testUtilsSuite15Case0029: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0029: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0030
         * @tc.name: testUtilsSuite15Case0030
         * @tc.desc: Verify RandomUtils.diceRoll over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0030', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0030', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0030: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.diceRoll(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0030: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.diceRoll(seed);
                await addLog(`testUtilsSuite15Case0030: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0030: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0031
         * @tc.name: testUtilsSuite15Case0031
         * @tc.desc: Verify RandomUtils.diceRoll over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0031', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0031', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0031: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.diceRoll(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0031: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.diceRoll(seed);
                await addLog(`testUtilsSuite15Case0031: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0031: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0032
         * @tc.name: testUtilsSuite15Case0032
         * @tc.desc: Verify RandomUtils.diceRoll over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0032', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0032', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 3;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0032: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.diceRoll(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0032: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.diceRoll(seed);
                await addLog(`testUtilsSuite15Case0032: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0032: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0033
         * @tc.name: testUtilsSuite15Case0033
         * @tc.desc: Verify RandomUtils.percentFromSeed over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0033', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0033', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 17;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0033: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.percentFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0033: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.percentFromSeed(seed);
                await addLog(`testUtilsSuite15Case0033: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0033: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0034
         * @tc.name: testUtilsSuite15Case0034
         * @tc.desc: Verify RandomUtils.percentFromSeed over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0034', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0034', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 54;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0034: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.percentFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0034: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.percentFromSeed(seed);
                await addLog(`testUtilsSuite15Case0034: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0034: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0035
         * @tc.name: testUtilsSuite15Case0035
         * @tc.desc: Verify RandomUtils.percentFromSeed over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0035', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0035', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 91;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0035: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.percentFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0035: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.percentFromSeed(seed);
                await addLog(`testUtilsSuite15Case0035: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0035: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0036
         * @tc.name: testUtilsSuite15Case0036
         * @tc.desc: Verify RandomUtils.percentFromSeed over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0036', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0036', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 27;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0036: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.percentFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0036: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.percentFromSeed(seed);
                await addLog(`testUtilsSuite15Case0036: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0036: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0037
         * @tc.name: testUtilsSuite15Case0037
         * @tc.desc: Verify RandomUtils.percentFromSeed over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0037', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0037', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 64;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0037: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.percentFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0037: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.percentFromSeed(seed);
                await addLog(`testUtilsSuite15Case0037: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0037: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0038
         * @tc.name: testUtilsSuite15Case0038
         * @tc.desc: Verify RandomUtils.percentFromSeed over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0038', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0038', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0038: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.percentFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0038: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.percentFromSeed(seed);
                await addLog(`testUtilsSuite15Case0038: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0038: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0039
         * @tc.name: testUtilsSuite15Case0039
         * @tc.desc: Verify RandomUtils.percentFromSeed over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0039', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0039', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 37;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0039: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.percentFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0039: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.percentFromSeed(seed);
                await addLog(`testUtilsSuite15Case0039: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0039: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0040
         * @tc.name: testUtilsSuite15Case0040
         * @tc.desc: Verify RandomUtils.percentFromSeed over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0040', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0040', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 74;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0040: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.percentFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0040: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.percentFromSeed(seed);
                await addLog(`testUtilsSuite15Case0040: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0040: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0041
         * @tc.name: testUtilsSuite15Case0041
         * @tc.desc: Verify RandomUtils.bucketOf over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0041', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0041', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0; const buckets: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0041: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.bucketOf(seed, buckets);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0041: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.bucketOf(seed, buckets);
                await addLog(`testUtilsSuite15Case0041: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0041: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0042
         * @tc.name: testUtilsSuite15Case0042
         * @tc.desc: Verify RandomUtils.bucketOf over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0042', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0042', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1; const buckets: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0042: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.bucketOf(seed, buckets);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0042: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.bucketOf(seed, buckets);
                await addLog(`testUtilsSuite15Case0042: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0042: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0043
         * @tc.name: testUtilsSuite15Case0043
         * @tc.desc: Verify RandomUtils.bucketOf over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0043', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0043', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2; const buckets: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 3;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0043: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.bucketOf(seed, buckets);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0043: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.bucketOf(seed, buckets);
                await addLog(`testUtilsSuite15Case0043: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0043: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0044
         * @tc.name: testUtilsSuite15Case0044
         * @tc.desc: Verify RandomUtils.bucketOf over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0044', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0044', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3; const buckets: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 3;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0044: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.bucketOf(seed, buckets);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0044: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.bucketOf(seed, buckets);
                await addLog(`testUtilsSuite15Case0044: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0044: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0045
         * @tc.name: testUtilsSuite15Case0045
         * @tc.desc: Verify RandomUtils.bucketOf over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0045', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0045', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4; const buckets: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0045: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.bucketOf(seed, buckets);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0045: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.bucketOf(seed, buckets);
                await addLog(`testUtilsSuite15Case0045: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0045: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0046
         * @tc.name: testUtilsSuite15Case0046
         * @tc.desc: Verify RandomUtils.bucketOf over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0046', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0046', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5; const buckets: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0046: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.bucketOf(seed, buckets);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0046: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.bucketOf(seed, buckets);
                await addLog(`testUtilsSuite15Case0046: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0046: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0047
         * @tc.name: testUtilsSuite15Case0047
         * @tc.desc: Verify RandomUtils.bucketOf over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0047', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0047', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6; const buckets: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0047: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.bucketOf(seed, buckets);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0047: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.bucketOf(seed, buckets);
                await addLog(`testUtilsSuite15Case0047: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0047: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0048
         * @tc.name: testUtilsSuite15Case0048
         * @tc.desc: Verify RandomUtils.bucketOf over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0048', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0048', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7; const buckets: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0048: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.bucketOf(seed, buckets);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0048: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.bucketOf(seed, buckets);
                await addLog(`testUtilsSuite15Case0048: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0048: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0049
         * @tc.name: testUtilsSuite15Case0049
         * @tc.desc: Verify RandomUtils.countInBucket over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0049', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0049', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seeds: number[] = [0, 1, 2, 3]; const buckets: number = 4; const target: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0049: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.countInBucket(seeds, buckets, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0049: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.countInBucket(seeds, buckets, target);
                await addLog(`testUtilsSuite15Case0049: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0049: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0050
         * @tc.name: testUtilsSuite15Case0050
         * @tc.desc: Verify RandomUtils.countInBucket over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0050', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0050', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seeds: number[] = [0, 1, 2, 3]; const buckets: number = 4; const target: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0050: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.countInBucket(seeds, buckets, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0050: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.countInBucket(seeds, buckets, target);
                await addLog(`testUtilsSuite15Case0050: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0050: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0051
         * @tc.name: testUtilsSuite15Case0051
         * @tc.desc: Verify RandomUtils.countInBucket over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0051', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0051', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seeds: number[] = [0, 1, 2, 3]; const buckets: number = 4; const target: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0051: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.countInBucket(seeds, buckets, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0051: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.countInBucket(seeds, buckets, target);
                await addLog(`testUtilsSuite15Case0051: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0051: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0052
         * @tc.name: testUtilsSuite15Case0052
         * @tc.desc: Verify RandomUtils.countInBucket over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0052', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0052', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seeds: number[] = [0, 1, 2, 3]; const buckets: number = 4; const target: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0052: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.countInBucket(seeds, buckets, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0052: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.countInBucket(seeds, buckets, target);
                await addLog(`testUtilsSuite15Case0052: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0052: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0053
         * @tc.name: testUtilsSuite15Case0053
         * @tc.desc: Verify RandomUtils.countInBucket over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0053', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0053', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seeds: number[] = [4, 5, 6, 7]; const buckets: number = 4; const target: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0053: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.countInBucket(seeds, buckets, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0053: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.countInBucket(seeds, buckets, target);
                await addLog(`testUtilsSuite15Case0053: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0053: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0054
         * @tc.name: testUtilsSuite15Case0054
         * @tc.desc: Verify RandomUtils.countInBucket over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0054', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0054', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seeds: number[] = [4, 5, 6, 7]; const buckets: number = 4; const target: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0054: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.countInBucket(seeds, buckets, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0054: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.countInBucket(seeds, buckets, target);
                await addLog(`testUtilsSuite15Case0054: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0054: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0055
         * @tc.name: testUtilsSuite15Case0055
         * @tc.desc: Verify RandomUtils.countInBucket over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0055', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0055', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seeds: number[] = [4, 5, 6, 7]; const buckets: number = 4; const target: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0055: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.countInBucket(seeds, buckets, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0055: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.countInBucket(seeds, buckets, target);
                await addLog(`testUtilsSuite15Case0055: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0055: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0056
         * @tc.name: testUtilsSuite15Case0056
         * @tc.desc: Verify RandomUtils.countInBucket over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0056', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0056', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seeds: number[] = []; const buckets: number = 4; const target: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0056: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.countInBucket(seeds, buckets, target);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0056: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.countInBucket(seeds, buckets, target);
                await addLog(`testUtilsSuite15Case0056: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0056: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0057
         * @tc.name: testUtilsSuite15Case0057
         * @tc.desc: Verify RandomUtils.coinFlipText over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0057', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0057', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'tails';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0057: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.coinFlipText(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0057: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.coinFlipText(seed);
                await addLog(`testUtilsSuite15Case0057: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0057: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0058
         * @tc.name: testUtilsSuite15Case0058
         * @tc.desc: Verify RandomUtils.coinFlipText over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0058', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0058', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'heads';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0058: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.coinFlipText(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0058: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.coinFlipText(seed);
                await addLog(`testUtilsSuite15Case0058: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0058: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0059
         * @tc.name: testUtilsSuite15Case0059
         * @tc.desc: Verify RandomUtils.coinFlipText over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0059', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0059', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'tails';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0059: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.coinFlipText(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0059: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.coinFlipText(seed);
                await addLog(`testUtilsSuite15Case0059: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0059: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0060
         * @tc.name: testUtilsSuite15Case0060
         * @tc.desc: Verify RandomUtils.coinFlipText over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0060', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0060', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'tails';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0060: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.coinFlipText(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0060: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.coinFlipText(seed);
                await addLog(`testUtilsSuite15Case0060: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0060: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0061
         * @tc.name: testUtilsSuite15Case0061
         * @tc.desc: Verify RandomUtils.coinFlipText over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0061', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0061', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'heads';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0061: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.coinFlipText(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0061: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.coinFlipText(seed);
                await addLog(`testUtilsSuite15Case0061: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0061: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0062
         * @tc.name: testUtilsSuite15Case0062
         * @tc.desc: Verify RandomUtils.coinFlipText over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0062', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0062', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'heads';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0062: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.coinFlipText(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0062: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.coinFlipText(seed);
                await addLog(`testUtilsSuite15Case0062: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0062: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0063
         * @tc.name: testUtilsSuite15Case0063
         * @tc.desc: Verify RandomUtils.coinFlipText over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0063', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0063', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'tails';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0063: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.coinFlipText(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0063: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.coinFlipText(seed);
                await addLog(`testUtilsSuite15Case0063: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0063: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0064
         * @tc.name: testUtilsSuite15Case0064
         * @tc.desc: Verify RandomUtils.coinFlipText over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0064', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0064', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'heads';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0064: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.coinFlipText(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0064: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.coinFlipText(seed);
                await addLog(`testUtilsSuite15Case0064: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0064: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0065
         * @tc.name: testUtilsSuite15Case0065
         * @tc.desc: Verify RandomUtils.scaleBySeed over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0065', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0065', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0; const maximum: number = 10;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 6;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0065: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.scaleBySeed(seed, maximum);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0065: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.scaleBySeed(seed, maximum);
                await addLog(`testUtilsSuite15Case0065: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0065: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0066
         * @tc.name: testUtilsSuite15Case0066
         * @tc.desc: Verify RandomUtils.scaleBySeed over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0066', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0066', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1; const maximum: number = 10;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 10;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0066: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.scaleBySeed(seed, maximum);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0066: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.scaleBySeed(seed, maximum);
                await addLog(`testUtilsSuite15Case0066: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0066: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0067
         * @tc.name: testUtilsSuite15Case0067
         * @tc.desc: Verify RandomUtils.scaleBySeed over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0067', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0067', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2; const maximum: number = 10;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 3;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0067: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.scaleBySeed(seed, maximum);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0067: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.scaleBySeed(seed, maximum);
                await addLog(`testUtilsSuite15Case0067: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0067: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0068
         * @tc.name: testUtilsSuite15Case0068
         * @tc.desc: Verify RandomUtils.scaleBySeed over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0068', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0068', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3; const maximum: number = 10;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 5;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0068: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.scaleBySeed(seed, maximum);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0068: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.scaleBySeed(seed, maximum);
                await addLog(`testUtilsSuite15Case0068: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0068: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0069
         * @tc.name: testUtilsSuite15Case0069
         * @tc.desc: Verify RandomUtils.scaleBySeed over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0069', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0069', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4; const maximum: number = 10;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 9;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0069: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.scaleBySeed(seed, maximum);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0069: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.scaleBySeed(seed, maximum);
                await addLog(`testUtilsSuite15Case0069: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0069: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0070
         * @tc.name: testUtilsSuite15Case0070
         * @tc.desc: Verify RandomUtils.scaleBySeed over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0070', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0070', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5; const maximum: number = 10;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0070: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.scaleBySeed(seed, maximum);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0070: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.scaleBySeed(seed, maximum);
                await addLog(`testUtilsSuite15Case0070: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0070: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0071
         * @tc.name: testUtilsSuite15Case0071
         * @tc.desc: Verify RandomUtils.scaleBySeed over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0071', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0071', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6; const maximum: number = 10;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 4;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0071: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.scaleBySeed(seed, maximum);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0071: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.scaleBySeed(seed, maximum);
                await addLog(`testUtilsSuite15Case0071: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0071: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0072
         * @tc.name: testUtilsSuite15Case0072
         * @tc.desc: Verify RandomUtils.scaleBySeed over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0072', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0072', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7; const maximum: number = 10;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 8;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0072: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.scaleBySeed(seed, maximum);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0072: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.scaleBySeed(seed, maximum);
                await addLog(`testUtilsSuite15Case0072: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0072: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0073
         * @tc.name: testUtilsSuite15Case0073
         * @tc.desc: Verify RandomUtils.formatScaledPercent over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0073', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0073', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '17.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0073: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.formatScaledPercent(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0073: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.formatScaledPercent(seed);
                await addLog(`testUtilsSuite15Case0073: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0073: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0074
         * @tc.name: testUtilsSuite15Case0074
         * @tc.desc: Verify RandomUtils.formatScaledPercent over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0074', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0074', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '54.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0074: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.formatScaledPercent(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0074: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.formatScaledPercent(seed);
                await addLog(`testUtilsSuite15Case0074: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0074: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0075
         * @tc.name: testUtilsSuite15Case0075
         * @tc.desc: Verify RandomUtils.formatScaledPercent over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0075', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0075', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '91.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0075: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.formatScaledPercent(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0075: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.formatScaledPercent(seed);
                await addLog(`testUtilsSuite15Case0075: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0075: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0076
         * @tc.name: testUtilsSuite15Case0076
         * @tc.desc: Verify RandomUtils.formatScaledPercent over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0076', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0076', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '27.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0076: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.formatScaledPercent(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0076: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.formatScaledPercent(seed);
                await addLog(`testUtilsSuite15Case0076: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0076: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0077
         * @tc.name: testUtilsSuite15Case0077
         * @tc.desc: Verify RandomUtils.formatScaledPercent over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0077', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0077', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '64.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0077: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.formatScaledPercent(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0077: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.formatScaledPercent(seed);
                await addLog(`testUtilsSuite15Case0077: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0077: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0078
         * @tc.name: testUtilsSuite15Case0078
         * @tc.desc: Verify RandomUtils.formatScaledPercent over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0078', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0078', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '0.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0078: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.formatScaledPercent(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0078: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.formatScaledPercent(seed);
                await addLog(`testUtilsSuite15Case0078: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0078: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0079
         * @tc.name: testUtilsSuite15Case0079
         * @tc.desc: Verify RandomUtils.formatScaledPercent over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0079', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0079', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '37.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0079: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.formatScaledPercent(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0079: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.formatScaledPercent(seed);
                await addLog(`testUtilsSuite15Case0079: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0079: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0080
         * @tc.name: testUtilsSuite15Case0080
         * @tc.desc: Verify RandomUtils.formatScaledPercent over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0080', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0080', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '74.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0080: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.formatScaledPercent(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0080: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.formatScaledPercent(seed);
                await addLog(`testUtilsSuite15Case0080: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0080: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0081
         * @tc.name: testUtilsSuite15Case0081
         * @tc.desc: Verify RandomUtils.pickIndex over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0081', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0081', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0; const size: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0081: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.pickIndex(seed, size);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0081: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.pickIndex(seed, size);
                await addLog(`testUtilsSuite15Case0081: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0081: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0082
         * @tc.name: testUtilsSuite15Case0082
         * @tc.desc: Verify RandomUtils.pickIndex over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0082', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0082', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1; const size: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 4;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0082: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.pickIndex(seed, size);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0082: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.pickIndex(seed, size);
                await addLog(`testUtilsSuite15Case0082: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0082: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0083
         * @tc.name: testUtilsSuite15Case0083
         * @tc.desc: Verify RandomUtils.pickIndex over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0083', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0083', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2; const size: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0083: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.pickIndex(seed, size);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0083: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.pickIndex(seed, size);
                await addLog(`testUtilsSuite15Case0083: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0083: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0084
         * @tc.name: testUtilsSuite15Case0084
         * @tc.desc: Verify RandomUtils.pickIndex over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0084', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0084', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3; const size: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0084: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.pickIndex(seed, size);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0084: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.pickIndex(seed, size);
                await addLog(`testUtilsSuite15Case0084: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0084: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0085
         * @tc.name: testUtilsSuite15Case0085
         * @tc.desc: Verify RandomUtils.pickIndex over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0085', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0085', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4; const size: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 4;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0085: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.pickIndex(seed, size);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0085: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.pickIndex(seed, size);
                await addLog(`testUtilsSuite15Case0085: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0085: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0086
         * @tc.name: testUtilsSuite15Case0086
         * @tc.desc: Verify RandomUtils.pickIndex over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0086', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0086', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5; const size: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0086: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.pickIndex(seed, size);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0086: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.pickIndex(seed, size);
                await addLog(`testUtilsSuite15Case0086: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0086: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0087
         * @tc.name: testUtilsSuite15Case0087
         * @tc.desc: Verify RandomUtils.pickIndex over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0087', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0087', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6; const size: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0087: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.pickIndex(seed, size);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0087: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.pickIndex(seed, size);
                await addLog(`testUtilsSuite15Case0087: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0087: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0088
         * @tc.name: testUtilsSuite15Case0088
         * @tc.desc: Verify RandomUtils.pickIndex over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0088', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0088', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7; const size: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 4;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0088: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.pickIndex(seed, size);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0088: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.pickIndex(seed, size);
                await addLog(`testUtilsSuite15Case0088: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0088: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0089
         * @tc.name: testUtilsSuite15Case0089
         * @tc.desc: Verify RandomUtils.pickFromList over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0089', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0089', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0; const values: string[] = ['a', 'b', 'c', 'd', 'e'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'c';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0089: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.pickFromList(seed, values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0089: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.pickFromList(seed, values);
                await addLog(`testUtilsSuite15Case0089: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0089: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0090
         * @tc.name: testUtilsSuite15Case0090
         * @tc.desc: Verify RandomUtils.pickFromList over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0090', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0090', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1; const values: string[] = ['a', 'b', 'c', 'd', 'e'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'e';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0090: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.pickFromList(seed, values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0090: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.pickFromList(seed, values);
                await addLog(`testUtilsSuite15Case0090: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0090: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0091
         * @tc.name: testUtilsSuite15Case0091
         * @tc.desc: Verify RandomUtils.pickFromList over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0091', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0091', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2; const values: string[] = ['a', 'b', 'c', 'd', 'e'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'b';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0091: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.pickFromList(seed, values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0091: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.pickFromList(seed, values);
                await addLog(`testUtilsSuite15Case0091: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0091: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0092
         * @tc.name: testUtilsSuite15Case0092
         * @tc.desc: Verify RandomUtils.pickFromList over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0092', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0092', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3; const values: string[] = ['a', 'b', 'c', 'd', 'e'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'c';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0092: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.pickFromList(seed, values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0092: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.pickFromList(seed, values);
                await addLog(`testUtilsSuite15Case0092: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0092: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0093
         * @tc.name: testUtilsSuite15Case0093
         * @tc.desc: Verify RandomUtils.pickFromList over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0093', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0093', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4; const values: string[] = ['a', 'b', 'c', 'd', 'e'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'e';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0093: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.pickFromList(seed, values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0093: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.pickFromList(seed, values);
                await addLog(`testUtilsSuite15Case0093: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0093: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0094
         * @tc.name: testUtilsSuite15Case0094
         * @tc.desc: Verify RandomUtils.pickFromList over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0094', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0094', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5; const values: string[] = ['a', 'b', 'c', 'd', 'e'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'a';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0094: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.pickFromList(seed, values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0094: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.pickFromList(seed, values);
                await addLog(`testUtilsSuite15Case0094: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0094: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0095
         * @tc.name: testUtilsSuite15Case0095
         * @tc.desc: Verify RandomUtils.pickFromList over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0095', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0095', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6; const values: string[] = ['a', 'b', 'c', 'd', 'e'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'c';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0095: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.pickFromList(seed, values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0095: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.pickFromList(seed, values);
                await addLog(`testUtilsSuite15Case0095: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0095: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0096
         * @tc.name: testUtilsSuite15Case0096
         * @tc.desc: Verify RandomUtils.pickFromList over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0096', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0096', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7; const values: string[] = ['a', 'b', 'c', 'd', 'e'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'e';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0096: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.pickFromList(seed, values);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0096: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.pickFromList(seed, values);
                await addLog(`testUtilsSuite15Case0096: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0096: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0097
         * @tc.name: testUtilsSuite15Case0097
         * @tc.desc: Verify RandomUtils.hashSeed over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0097', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0097', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 7;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0097: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.hashSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0097: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.hashSeed(seed);
                await addLog(`testUtilsSuite15Case0097: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0097: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0098
         * @tc.name: testUtilsSuite15Case0098
         * @tc.desc: Verify RandomUtils.hashSeed over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0098', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0098', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 38;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0098: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.hashSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0098: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.hashSeed(seed);
                await addLog(`testUtilsSuite15Case0098: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0098: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0099
         * @tc.name: testUtilsSuite15Case0099
         * @tc.desc: Verify RandomUtils.hashSeed over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0099', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0099', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 69;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0099: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.hashSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0099: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.hashSeed(seed);
                await addLog(`testUtilsSuite15Case0099: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0099: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0100
         * @tc.name: testUtilsSuite15Case0100
         * @tc.desc: Verify RandomUtils.hashSeed over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0100', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0100', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 100;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0100: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.hashSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0100: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.hashSeed(seed);
                await addLog(`testUtilsSuite15Case0100: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0100: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0101
         * @tc.name: testUtilsSuite15Case0101
         * @tc.desc: Verify RandomUtils.hashSeed over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0101', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0101', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 131;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0101: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.hashSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0101: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.hashSeed(seed);
                await addLog(`testUtilsSuite15Case0101: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0101: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0102
         * @tc.name: testUtilsSuite15Case0102
         * @tc.desc: Verify RandomUtils.hashSeed over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0102', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0102', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 162;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0102: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.hashSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0102: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.hashSeed(seed);
                await addLog(`testUtilsSuite15Case0102: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0102: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0103
         * @tc.name: testUtilsSuite15Case0103
         * @tc.desc: Verify RandomUtils.hashSeed over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0103', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0103', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 193;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0103: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.hashSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0103: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.hashSeed(seed);
                await addLog(`testUtilsSuite15Case0103: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0103: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0104
         * @tc.name: testUtilsSuite15Case0104
         * @tc.desc: Verify RandomUtils.hashSeed over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0104', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0104', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 224;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0104: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.hashSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0104: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.hashSeed(seed);
                await addLog(`testUtilsSuite15Case0104: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0104: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0105
         * @tc.name: testUtilsSuite15Case0105
         * @tc.desc: Verify RandomUtils.isEvenSeed over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0105', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0105', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0105: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.isEvenSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0105: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.isEvenSeed(seed);
                await addLog(`testUtilsSuite15Case0105: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0105: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0106
         * @tc.name: testUtilsSuite15Case0106
         * @tc.desc: Verify RandomUtils.isEvenSeed over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0106', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0106', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0106: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.isEvenSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0106: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.isEvenSeed(seed);
                await addLog(`testUtilsSuite15Case0106: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0106: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0107
         * @tc.name: testUtilsSuite15Case0107
         * @tc.desc: Verify RandomUtils.isEvenSeed over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0107', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0107', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0107: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.isEvenSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0107: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.isEvenSeed(seed);
                await addLog(`testUtilsSuite15Case0107: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0107: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0108
         * @tc.name: testUtilsSuite15Case0108
         * @tc.desc: Verify RandomUtils.isEvenSeed over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0108', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0108', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0108: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.isEvenSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0108: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.isEvenSeed(seed);
                await addLog(`testUtilsSuite15Case0108: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0108: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0109
         * @tc.name: testUtilsSuite15Case0109
         * @tc.desc: Verify RandomUtils.isEvenSeed over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0109', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0109', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0109: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.isEvenSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0109: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.isEvenSeed(seed);
                await addLog(`testUtilsSuite15Case0109: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0109: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0110
         * @tc.name: testUtilsSuite15Case0110
         * @tc.desc: Verify RandomUtils.isEvenSeed over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0110', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0110', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0110: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.isEvenSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0110: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.isEvenSeed(seed);
                await addLog(`testUtilsSuite15Case0110: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0110: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0111
         * @tc.name: testUtilsSuite15Case0111
         * @tc.desc: Verify RandomUtils.isEvenSeed over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0111', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0111', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0111: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.isEvenSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0111: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.isEvenSeed(seed);
                await addLog(`testUtilsSuite15Case0111: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0111: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0112
         * @tc.name: testUtilsSuite15Case0112
         * @tc.desc: Verify RandomUtils.isEvenSeed over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0112', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0112', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0112: expected=${JSON.stringify(expected)}`);
                const actual: boolean = RandomUtils.isEvenSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0112: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = RandomUtils.isEvenSeed(seed);
                await addLog(`testUtilsSuite15Case0112: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0112: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0113
         * @tc.name: testUtilsSuite15Case0113
         * @tc.desc: Verify RandomUtils.averageOfTwoSeeds over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0113', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0113', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number = 0; const second: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 35.5;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0113: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.averageOfTwoSeeds(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0113: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.averageOfTwoSeeds(first, second);
                await addLog(`testUtilsSuite15Case0113: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0113: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0114
         * @tc.name: testUtilsSuite15Case0114
         * @tc.desc: Verify RandomUtils.averageOfTwoSeeds over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0114', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0114', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number = 2; const second: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 59;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0114: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.averageOfTwoSeeds(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0114: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.averageOfTwoSeeds(first, second);
                await addLog(`testUtilsSuite15Case0114: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0114: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0115
         * @tc.name: testUtilsSuite15Case0115
         * @tc.desc: Verify RandomUtils.averageOfTwoSeeds over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0115', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0115', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number = 4; const second: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 32;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0115: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.averageOfTwoSeeds(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0115: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.averageOfTwoSeeds(first, second);
                await addLog(`testUtilsSuite15Case0115: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0115: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0116
         * @tc.name: testUtilsSuite15Case0116
         * @tc.desc: Verify RandomUtils.averageOfTwoSeeds over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0116', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0116', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number = 6; const second: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 55.5;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0116: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.averageOfTwoSeeds(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0116: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.averageOfTwoSeeds(first, second);
                await addLog(`testUtilsSuite15Case0116: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0116: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0117
         * @tc.name: testUtilsSuite15Case0117
         * @tc.desc: Verify RandomUtils.averageOfTwoSeeds over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0117', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0117', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number = 0; const second: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 17;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0117: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.averageOfTwoSeeds(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0117: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.averageOfTwoSeeds(first, second);
                await addLog(`testUtilsSuite15Case0117: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0117: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0118
         * @tc.name: testUtilsSuite15Case0118
         * @tc.desc: Verify RandomUtils.averageOfTwoSeeds over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0118', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0118', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number = 1; const second: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 54;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0118: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.averageOfTwoSeeds(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0118: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.averageOfTwoSeeds(first, second);
                await addLog(`testUtilsSuite15Case0118: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0118: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0119
         * @tc.name: testUtilsSuite15Case0119
         * @tc.desc: Verify RandomUtils.averageOfTwoSeeds over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0119', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0119', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number = 5; const second: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 18.5;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0119: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.averageOfTwoSeeds(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0119: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.averageOfTwoSeeds(first, second);
                await addLog(`testUtilsSuite15Case0119: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0119: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0120
         * @tc.name: testUtilsSuite15Case0120
         * @tc.desc: Verify RandomUtils.averageOfTwoSeeds over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0120', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0120', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: number = 3; const second: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 45.5;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0120: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.averageOfTwoSeeds(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0120: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.averageOfTwoSeeds(first, second);
                await addLog(`testUtilsSuite15Case0120: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0120: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0121
         * @tc.name: testUtilsSuite15Case0121
         * @tc.desc: Verify RandomUtils.tokenFromSeed over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0121', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0121', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '11';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0121: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.tokenFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0121: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.tokenFromSeed(seed);
                await addLog(`testUtilsSuite15Case0121: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0121: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0122
         * @tc.name: testUtilsSuite15Case0122
         * @tc.desc: Verify RandomUtils.tokenFromSeed over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0122', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0122', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '36';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0122: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.tokenFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0122: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.tokenFromSeed(seed);
                await addLog(`testUtilsSuite15Case0122: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0122: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0123
         * @tc.name: testUtilsSuite15Case0123
         * @tc.desc: Verify RandomUtils.tokenFromSeed over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0123', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0123', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '5B';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0123: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.tokenFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0123: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.tokenFromSeed(seed);
                await addLog(`testUtilsSuite15Case0123: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0123: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0124
         * @tc.name: testUtilsSuite15Case0124
         * @tc.desc: Verify RandomUtils.tokenFromSeed over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0124', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0124', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1B';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0124: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.tokenFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0124: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.tokenFromSeed(seed);
                await addLog(`testUtilsSuite15Case0124: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0124: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0125
         * @tc.name: testUtilsSuite15Case0125
         * @tc.desc: Verify RandomUtils.tokenFromSeed over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0125', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0125', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '40';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0125: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.tokenFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0125: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.tokenFromSeed(seed);
                await addLog(`testUtilsSuite15Case0125: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0125: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0126
         * @tc.name: testUtilsSuite15Case0126
         * @tc.desc: Verify RandomUtils.tokenFromSeed over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0126', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0126', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '00';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0126: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.tokenFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0126: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.tokenFromSeed(seed);
                await addLog(`testUtilsSuite15Case0126: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0126: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0127
         * @tc.name: testUtilsSuite15Case0127
         * @tc.desc: Verify RandomUtils.tokenFromSeed over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0127', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0127', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '25';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0127: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.tokenFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0127: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.tokenFromSeed(seed);
                await addLog(`testUtilsSuite15Case0127: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0127: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0128
         * @tc.name: testUtilsSuite15Case0128
         * @tc.desc: Verify RandomUtils.tokenFromSeed over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0128', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0128', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '4A';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0128: expected=${JSON.stringify(expected)}`);
                const actual: string = RandomUtils.tokenFromSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0128: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = RandomUtils.tokenFromSeed(seed);
                await addLog(`testUtilsSuite15Case0128: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0128: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0129
         * @tc.name: testUtilsSuite15Case0129
         * @tc.desc: Verify RandomUtils.uuidFromSeed over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0129', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0129', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0;
                // Step 2: invoke the helper under test.
                const actual: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0129: actual=${String(actual)}`);
                expect(actual.length).assertEqual(36);
                // Step 3: check the grouped shape of the value.
                await addLog(`testUtilsSuite15Case0129: groups=${actual.split('-').length}`);
                expect(actual.split('-').length).assertEqual(5);
                // Step 4: replay the call and compare both results.
                const replayed: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0129: replayed=${replayed}`);
                expect(replayed).assertEqual(actual);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0130
         * @tc.name: testUtilsSuite15Case0130
         * @tc.desc: Verify RandomUtils.uuidFromSeed over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0130', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0130', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1;
                // Step 2: invoke the helper under test.
                const actual: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0130: actual=${String(actual)}`);
                expect(actual.length).assertEqual(36);
                // Step 3: check the grouped shape of the value.
                await addLog(`testUtilsSuite15Case0130: groups=${actual.split('-').length}`);
                expect(actual.split('-').length).assertEqual(5);
                // Step 4: replay the call and compare both results.
                const replayed: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0130: replayed=${replayed}`);
                expect(replayed).assertEqual(actual);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0131
         * @tc.name: testUtilsSuite15Case0131
         * @tc.desc: Verify RandomUtils.uuidFromSeed over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0131', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0131', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2;
                // Step 2: invoke the helper under test.
                const actual: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0131: actual=${String(actual)}`);
                expect(actual.length).assertEqual(36);
                // Step 3: check the grouped shape of the value.
                await addLog(`testUtilsSuite15Case0131: groups=${actual.split('-').length}`);
                expect(actual.split('-').length).assertEqual(5);
                // Step 4: replay the call and compare both results.
                const replayed: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0131: replayed=${replayed}`);
                expect(replayed).assertEqual(actual);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0132
         * @tc.name: testUtilsSuite15Case0132
         * @tc.desc: Verify RandomUtils.uuidFromSeed over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0132', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0132', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3;
                // Step 2: invoke the helper under test.
                const actual: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0132: actual=${String(actual)}`);
                expect(actual.length).assertEqual(36);
                // Step 3: check the grouped shape of the value.
                await addLog(`testUtilsSuite15Case0132: groups=${actual.split('-').length}`);
                expect(actual.split('-').length).assertEqual(5);
                // Step 4: replay the call and compare both results.
                const replayed: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0132: replayed=${replayed}`);
                expect(replayed).assertEqual(actual);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0133
         * @tc.name: testUtilsSuite15Case0133
         * @tc.desc: Verify RandomUtils.uuidFromSeed over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0133', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0133', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4;
                // Step 2: invoke the helper under test.
                const actual: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0133: actual=${String(actual)}`);
                expect(actual.length).assertEqual(36);
                // Step 3: check the grouped shape of the value.
                await addLog(`testUtilsSuite15Case0133: groups=${actual.split('-').length}`);
                expect(actual.split('-').length).assertEqual(5);
                // Step 4: replay the call and compare both results.
                const replayed: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0133: replayed=${replayed}`);
                expect(replayed).assertEqual(actual);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0134
         * @tc.name: testUtilsSuite15Case0134
         * @tc.desc: Verify RandomUtils.uuidFromSeed over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0134', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0134', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5;
                // Step 2: invoke the helper under test.
                const actual: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0134: actual=${String(actual)}`);
                expect(actual.length).assertEqual(36);
                // Step 3: check the grouped shape of the value.
                await addLog(`testUtilsSuite15Case0134: groups=${actual.split('-').length}`);
                expect(actual.split('-').length).assertEqual(5);
                // Step 4: replay the call and compare both results.
                const replayed: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0134: replayed=${replayed}`);
                expect(replayed).assertEqual(actual);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0135
         * @tc.name: testUtilsSuite15Case0135
         * @tc.desc: Verify RandomUtils.uuidFromSeed over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0135', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0135', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6;
                // Step 2: invoke the helper under test.
                const actual: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0135: actual=${String(actual)}`);
                expect(actual.length).assertEqual(36);
                // Step 3: check the grouped shape of the value.
                await addLog(`testUtilsSuite15Case0135: groups=${actual.split('-').length}`);
                expect(actual.split('-').length).assertEqual(5);
                // Step 4: replay the call and compare both results.
                const replayed: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0135: replayed=${replayed}`);
                expect(replayed).assertEqual(actual);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0136
         * @tc.name: testUtilsSuite15Case0136
         * @tc.desc: Verify RandomUtils.uuidFromSeed over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0136', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0136', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7;
                // Step 2: invoke the helper under test.
                const actual: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0136: actual=${String(actual)}`);
                expect(actual.length).assertEqual(36);
                // Step 3: check the grouped shape of the value.
                await addLog(`testUtilsSuite15Case0136: groups=${actual.split('-').length}`);
                expect(actual.split('-').length).assertEqual(5);
                // Step 4: replay the call and compare both results.
                const replayed: string = RandomUtils.uuidFromSeed(seed);
                await addLog(`testUtilsSuite15Case0136: replayed=${replayed}`);
                expect(replayed).assertEqual(actual);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0137
         * @tc.name: testUtilsSuite15Case0137
         * @tc.desc: Verify RandomUtils.digitCountOfSeed over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0137', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0137', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0137: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.digitCountOfSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0137: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.digitCountOfSeed(seed);
                await addLog(`testUtilsSuite15Case0137: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0137: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0138
         * @tc.name: testUtilsSuite15Case0138
         * @tc.desc: Verify RandomUtils.digitCountOfSeed over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0138', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0138', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0138: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.digitCountOfSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0138: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.digitCountOfSeed(seed);
                await addLog(`testUtilsSuite15Case0138: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0138: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0139
         * @tc.name: testUtilsSuite15Case0139
         * @tc.desc: Verify RandomUtils.digitCountOfSeed over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0139', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0139', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0139: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.digitCountOfSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0139: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.digitCountOfSeed(seed);
                await addLog(`testUtilsSuite15Case0139: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0139: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0140
         * @tc.name: testUtilsSuite15Case0140
         * @tc.desc: Verify RandomUtils.digitCountOfSeed over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0140', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0140', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0140: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.digitCountOfSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0140: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.digitCountOfSeed(seed);
                await addLog(`testUtilsSuite15Case0140: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0140: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0141
         * @tc.name: testUtilsSuite15Case0141
         * @tc.desc: Verify RandomUtils.digitCountOfSeed over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0141', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0141', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0141: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.digitCountOfSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0141: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.digitCountOfSeed(seed);
                await addLog(`testUtilsSuite15Case0141: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0141: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0142
         * @tc.name: testUtilsSuite15Case0142
         * @tc.desc: Verify RandomUtils.digitCountOfSeed over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0142', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0142', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 1;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0142: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.digitCountOfSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0142: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.digitCountOfSeed(seed);
                await addLog(`testUtilsSuite15Case0142: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0142: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0143
         * @tc.name: testUtilsSuite15Case0143
         * @tc.desc: Verify RandomUtils.digitCountOfSeed over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0143', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0143', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0143: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.digitCountOfSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0143: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.digitCountOfSeed(seed);
                await addLog(`testUtilsSuite15Case0143: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0143: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S15_0144
         * @tc.name: testUtilsSuite15Case0144
         * @tc.desc: Verify RandomUtils.digitCountOfSeed over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite15Case0144', 0, async (done: Function) => {
            await runCase('testUtilsSuite15Case0144', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seed: number = 7;
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite15Case0144: expected=${JSON.stringify(expected)}`);
                const actual: number = RandomUtils.digitCountOfSeed(seed);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite15Case0144: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = RandomUtils.digitCountOfSeed(seed);
                await addLog(`testUtilsSuite15Case0144: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite15Case0144: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

    });
}
