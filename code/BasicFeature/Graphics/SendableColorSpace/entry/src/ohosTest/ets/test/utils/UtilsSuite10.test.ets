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
import { ValidateUtils } from '../../../../main/ets/common/utils/ValidateUtils';
import { addLog, runCase } from '../../testkit/SharedDriver';

/**
 * ValidateUtils utility suite.
 *
 * Every method of the class is expanded over the same pooled input set, and every case
 * compares the returned value against a locally stated expectation.
 */
export default function utilsSuite10(): void {
    describe('UtilsSuite10', () => {

        /*
         * @tc.number: SUB_CS_UTIL_S10_0001
         * @tc.name: testUtilsSuite10Case0001
         * @tc.desc: Verify ValidateUtils.isAlpha over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0001', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0001', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0001: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlpha(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0001: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlpha(text);
                await addLog(`testUtilsSuite10Case0001: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0001: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0002
         * @tc.name: testUtilsSuite10Case0002
         * @tc.desc: Verify ValidateUtils.isAlpha over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0002', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0002', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0002: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlpha(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0002: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlpha(text);
                await addLog(`testUtilsSuite10Case0002: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0002: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0003
         * @tc.name: testUtilsSuite10Case0003
         * @tc.desc: Verify ValidateUtils.isAlpha over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0003', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0003', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a1';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0003: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlpha(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0003: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlpha(text);
                await addLog(`testUtilsSuite10Case0003: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0003: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0004
         * @tc.name: testUtilsSuite10Case0004
         * @tc.desc: Verify ValidateUtils.isAlpha over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0004', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0004', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ABC';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0004: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlpha(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0004: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlpha(text);
                await addLog(`testUtilsSuite10Case0004: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0004: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0005
         * @tc.name: testUtilsSuite10Case0005
         * @tc.desc: Verify ValidateUtils.isAlpha over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0005', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0005', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a b';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0005: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlpha(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0005: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlpha(text);
                await addLog(`testUtilsSuite10Case0005: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0005: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0006
         * @tc.name: testUtilsSuite10Case0006
         * @tc.desc: Verify ValidateUtils.isAlpha over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0006', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0006', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'Ω';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0006: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlpha(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0006: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlpha(text);
                await addLog(`testUtilsSuite10Case0006: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0006: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0007
         * @tc.name: testUtilsSuite10Case0007
         * @tc.desc: Verify ValidateUtils.isAlpha over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0007', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0007', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'z';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0007: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlpha(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0007: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlpha(text);
                await addLog(`testUtilsSuite10Case0007: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0007: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0008
         * @tc.name: testUtilsSuite10Case0008
         * @tc.desc: Verify ValidateUtils.isAlpha over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0008', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0008', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab-c';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0008: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlpha(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0008: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlpha(text);
                await addLog(`testUtilsSuite10Case0008: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0008: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0009
         * @tc.name: testUtilsSuite10Case0009
         * @tc.desc: Verify ValidateUtils.isAlphanumeric over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0009', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0009', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0009: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlphanumeric(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0009: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlphanumeric(text);
                await addLog(`testUtilsSuite10Case0009: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0009: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0010
         * @tc.name: testUtilsSuite10Case0010
         * @tc.desc: Verify ValidateUtils.isAlphanumeric over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0010', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0010', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a1';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0010: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlphanumeric(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0010: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlphanumeric(text);
                await addLog(`testUtilsSuite10Case0010: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0010: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0011
         * @tc.name: testUtilsSuite10Case0011
         * @tc.desc: Verify ValidateUtils.isAlphanumeric over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0011', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0011', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0011: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlphanumeric(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0011: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlphanumeric(text);
                await addLog(`testUtilsSuite10Case0011: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0011: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0012
         * @tc.name: testUtilsSuite10Case0012
         * @tc.desc: Verify ValidateUtils.isAlphanumeric over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0012', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0012', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a-b';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0012: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlphanumeric(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0012: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlphanumeric(text);
                await addLog(`testUtilsSuite10Case0012: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0012: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0013
         * @tc.name: testUtilsSuite10Case0013
         * @tc.desc: Verify ValidateUtils.isAlphanumeric over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0013', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0013', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ABC123';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0013: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlphanumeric(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0013: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlphanumeric(text);
                await addLog(`testUtilsSuite10Case0013: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0013: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0014
         * @tc.name: testUtilsSuite10Case0014
         * @tc.desc: Verify ValidateUtils.isAlphanumeric over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0014', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0014', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = ' ';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0014: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlphanumeric(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0014: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlphanumeric(text);
                await addLog(`testUtilsSuite10Case0014: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0014: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0015
         * @tc.name: testUtilsSuite10Case0015
         * @tc.desc: Verify ValidateUtils.isAlphanumeric over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0015', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0015', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '0';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0015: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlphanumeric(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0015: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlphanumeric(text);
                await addLog(`testUtilsSuite10Case0015: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0015: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0016
         * @tc.name: testUtilsSuite10Case0016
         * @tc.desc: Verify ValidateUtils.isAlphanumeric over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0016', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0016', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a_b';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0016: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isAlphanumeric(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0016: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isAlphanumeric(text);
                await addLog(`testUtilsSuite10Case0016: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0016: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0017
         * @tc.name: testUtilsSuite10Case0017
         * @tc.desc: Verify ValidateUtils.isBooleanString over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0017', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0017', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'true';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0017: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isBooleanString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0017: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isBooleanString(text);
                await addLog(`testUtilsSuite10Case0017: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0017: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0018
         * @tc.name: testUtilsSuite10Case0018
         * @tc.desc: Verify ValidateUtils.isBooleanString over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0018', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0018', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'false';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0018: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isBooleanString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0018: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isBooleanString(text);
                await addLog(`testUtilsSuite10Case0018: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0018: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0019
         * @tc.name: testUtilsSuite10Case0019
         * @tc.desc: Verify ValidateUtils.isBooleanString over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0019', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0019', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'TRUE';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0019: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isBooleanString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0019: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isBooleanString(text);
                await addLog(`testUtilsSuite10Case0019: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0019: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0020
         * @tc.name: testUtilsSuite10Case0020
         * @tc.desc: Verify ValidateUtils.isBooleanString over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0020', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0020', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0020: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isBooleanString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0020: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isBooleanString(text);
                await addLog(`testUtilsSuite10Case0020: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0020: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0021
         * @tc.name: testUtilsSuite10Case0021
         * @tc.desc: Verify ValidateUtils.isBooleanString over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0021', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0021', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'yes';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0021: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isBooleanString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0021: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isBooleanString(text);
                await addLog(`testUtilsSuite10Case0021: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0021: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0022
         * @tc.name: testUtilsSuite10Case0022
         * @tc.desc: Verify ValidateUtils.isBooleanString over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0022', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0022', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'False';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0022: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isBooleanString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0022: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isBooleanString(text);
                await addLog(`testUtilsSuite10Case0022: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0022: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0023
         * @tc.name: testUtilsSuite10Case0023
         * @tc.desc: Verify ValidateUtils.isBooleanString over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0023', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0023', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = ' true';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0023: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isBooleanString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0023: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isBooleanString(text);
                await addLog(`testUtilsSuite10Case0023: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0023: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0024
         * @tc.name: testUtilsSuite10Case0024
         * @tc.desc: Verify ValidateUtils.isBooleanString over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0024', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0024', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0024: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isBooleanString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0024: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isBooleanString(text);
                await addLog(`testUtilsSuite10Case0024: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0024: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0025
         * @tc.name: testUtilsSuite10Case0025
         * @tc.desc: Verify ValidateUtils.isDigits over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0025', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0025', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '123';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0025: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isDigits(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0025: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isDigits(text);
                await addLog(`testUtilsSuite10Case0025: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0025: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0026
         * @tc.name: testUtilsSuite10Case0026
         * @tc.desc: Verify ValidateUtils.isDigits over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0026', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0026', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0026: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isDigits(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0026: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isDigits(text);
                await addLog(`testUtilsSuite10Case0026: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0026: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0027
         * @tc.name: testUtilsSuite10Case0027
         * @tc.desc: Verify ValidateUtils.isDigits over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0027', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0027', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1a';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0027: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isDigits(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0027: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isDigits(text);
                await addLog(`testUtilsSuite10Case0027: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0027: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0028
         * @tc.name: testUtilsSuite10Case0028
         * @tc.desc: Verify ValidateUtils.isDigits over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0028', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0028', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '0';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0028: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isDigits(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0028: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isDigits(text);
                await addLog(`testUtilsSuite10Case0028: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0028: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0029
         * @tc.name: testUtilsSuite10Case0029
         * @tc.desc: Verify ValidateUtils.isDigits over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0029', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0029', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '12 3';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0029: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isDigits(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0029: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isDigits(text);
                await addLog(`testUtilsSuite10Case0029: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0029: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0030
         * @tc.name: testUtilsSuite10Case0030
         * @tc.desc: Verify ValidateUtils.isDigits over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0030', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0030', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '007';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0030: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isDigits(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0030: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isDigits(text);
                await addLog(`testUtilsSuite10Case0030: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0030: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0031
         * @tc.name: testUtilsSuite10Case0031
         * @tc.desc: Verify ValidateUtils.isDigits over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0031', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0031', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '-';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0031: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isDigits(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0031: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isDigits(text);
                await addLog(`testUtilsSuite10Case0031: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0031: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0032
         * @tc.name: testUtilsSuite10Case0032
         * @tc.desc: Verify ValidateUtils.isDigits over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0032', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0032', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '9';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0032: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isDigits(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0032: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isDigits(text);
                await addLog(`testUtilsSuite10Case0032: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0032: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0033
         * @tc.name: testUtilsSuite10Case0033
         * @tc.desc: Verify ValidateUtils.isEmailLoose over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0033', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0033', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a@b.co';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0033: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmailLoose(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0033: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmailLoose(text);
                await addLog(`testUtilsSuite10Case0033: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0033: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0034
         * @tc.name: testUtilsSuite10Case0034
         * @tc.desc: Verify ValidateUtils.isEmailLoose over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0034', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0034', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a@b';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0034: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmailLoose(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0034: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmailLoose(text);
                await addLog(`testUtilsSuite10Case0034: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0034: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0035
         * @tc.name: testUtilsSuite10Case0035
         * @tc.desc: Verify ValidateUtils.isEmailLoose over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0035', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0035', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '@b.co';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0035: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmailLoose(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0035: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmailLoose(text);
                await addLog(`testUtilsSuite10Case0035: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0035: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0036
         * @tc.name: testUtilsSuite10Case0036
         * @tc.desc: Verify ValidateUtils.isEmailLoose over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0036', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0036', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a.b@c.de';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0036: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmailLoose(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0036: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmailLoose(text);
                await addLog(`testUtilsSuite10Case0036: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0036: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0037
         * @tc.name: testUtilsSuite10Case0037
         * @tc.desc: Verify ValidateUtils.isEmailLoose over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0037', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0037', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a@b.c';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0037: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmailLoose(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0037: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmailLoose(text);
                await addLog(`testUtilsSuite10Case0037: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0037: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0038
         * @tc.name: testUtilsSuite10Case0038
         * @tc.desc: Verify ValidateUtils.isEmailLoose over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0038', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0038', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0038: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmailLoose(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0038: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmailLoose(text);
                await addLog(`testUtilsSuite10Case0038: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0038: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0039
         * @tc.name: testUtilsSuite10Case0039
         * @tc.desc: Verify ValidateUtils.isEmailLoose over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0039', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0039', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a@b.com';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0039: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmailLoose(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0039: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmailLoose(text);
                await addLog(`testUtilsSuite10Case0039: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0039: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0040
         * @tc.name: testUtilsSuite10Case0040
         * @tc.desc: Verify ValidateUtils.isEmailLoose over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0040', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0040', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a b@c.de';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0040: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmailLoose(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0040: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmailLoose(text);
                await addLog(`testUtilsSuite10Case0040: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0040: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0041
         * @tc.name: testUtilsSuite10Case0041
         * @tc.desc: Verify ValidateUtils.isHexByte over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0041', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0041', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ff';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0041: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexByte(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0041: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexByte(text);
                await addLog(`testUtilsSuite10Case0041: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0041: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0042
         * @tc.name: testUtilsSuite10Case0042
         * @tc.desc: Verify ValidateUtils.isHexByte over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0042', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0042', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'FF';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0042: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexByte(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0042: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexByte(text);
                await addLog(`testUtilsSuite10Case0042: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0042: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0043
         * @tc.name: testUtilsSuite10Case0043
         * @tc.desc: Verify ValidateUtils.isHexByte over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0043', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0043', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '00';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0043: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexByte(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0043: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexByte(text);
                await addLog(`testUtilsSuite10Case0043: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0043: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0044
         * @tc.name: testUtilsSuite10Case0044
         * @tc.desc: Verify ValidateUtils.isHexByte over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0044', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0044', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'f';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0044: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexByte(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0044: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexByte(text);
                await addLog(`testUtilsSuite10Case0044: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0044: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0045
         * @tc.name: testUtilsSuite10Case0045
         * @tc.desc: Verify ValidateUtils.isHexByte over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0045', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0045', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'fff';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0045: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexByte(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0045: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexByte(text);
                await addLog(`testUtilsSuite10Case0045: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0045: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0046
         * @tc.name: testUtilsSuite10Case0046
         * @tc.desc: Verify ValidateUtils.isHexByte over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0046', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0046', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'gg';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0046: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexByte(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0046: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexByte(text);
                await addLog(`testUtilsSuite10Case0046: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0046: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0047
         * @tc.name: testUtilsSuite10Case0047
         * @tc.desc: Verify ValidateUtils.isHexByte over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0047', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0047', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0047: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexByte(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0047: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexByte(text);
                await addLog(`testUtilsSuite10Case0047: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0047: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0048
         * @tc.name: testUtilsSuite10Case0048
         * @tc.desc: Verify ValidateUtils.isHexByte over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0048', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0048', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a1';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0048: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexByte(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0048: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexByte(text);
                await addLog(`testUtilsSuite10Case0048: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0048: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0049
         * @tc.name: testUtilsSuite10Case0049
         * @tc.desc: Verify ValidateUtils.isHexColor over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0049', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0049', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '#abc';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0049: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexColor(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0049: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexColor(text);
                await addLog(`testUtilsSuite10Case0049: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0049: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0050
         * @tc.name: testUtilsSuite10Case0050
         * @tc.desc: Verify ValidateUtils.isHexColor over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0050', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0050', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '#abcdef';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0050: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexColor(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0050: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexColor(text);
                await addLog(`testUtilsSuite10Case0050: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0050: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0051
         * @tc.name: testUtilsSuite10Case0051
         * @tc.desc: Verify ValidateUtils.isHexColor over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0051', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0051', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '#ABC';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0051: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexColor(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0051: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexColor(text);
                await addLog(`testUtilsSuite10Case0051: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0051: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0052
         * @tc.name: testUtilsSuite10Case0052
         * @tc.desc: Verify ValidateUtils.isHexColor over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0052', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0052', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0052: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexColor(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0052: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexColor(text);
                await addLog(`testUtilsSuite10Case0052: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0052: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0053
         * @tc.name: testUtilsSuite10Case0053
         * @tc.desc: Verify ValidateUtils.isHexColor over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0053', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0053', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '#ab';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0053: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexColor(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0053: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexColor(text);
                await addLog(`testUtilsSuite10Case0053: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0053: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0054
         * @tc.name: testUtilsSuite10Case0054
         * @tc.desc: Verify ValidateUtils.isHexColor over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0054', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0054', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '#gggggg';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0054: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexColor(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0054: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexColor(text);
                await addLog(`testUtilsSuite10Case0054: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0054: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0055
         * @tc.name: testUtilsSuite10Case0055
         * @tc.desc: Verify ValidateUtils.isHexColor over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0055', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0055', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0055: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexColor(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0055: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexColor(text);
                await addLog(`testUtilsSuite10Case0055: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0055: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0056
         * @tc.name: testUtilsSuite10Case0056
         * @tc.desc: Verify ValidateUtils.isHexColor over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0056', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0056', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '#123456';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0056: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isHexColor(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0056: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isHexColor(text);
                await addLog(`testUtilsSuite10Case0056: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0056: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0057
         * @tc.name: testUtilsSuite10Case0057
         * @tc.desc: Verify ValidateUtils.isIpv4 over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0057', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0057', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1.2.3.4';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0057: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isIpv4(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0057: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isIpv4(text);
                await addLog(`testUtilsSuite10Case0057: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0057: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0058
         * @tc.name: testUtilsSuite10Case0058
         * @tc.desc: Verify ValidateUtils.isIpv4 over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0058', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0058', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '255.255.255.255';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0058: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isIpv4(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0058: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isIpv4(text);
                await addLog(`testUtilsSuite10Case0058: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0058: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0059
         * @tc.name: testUtilsSuite10Case0059
         * @tc.desc: Verify ValidateUtils.isIpv4 over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0059', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0059', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '256.1.1.1';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0059: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isIpv4(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0059: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isIpv4(text);
                await addLog(`testUtilsSuite10Case0059: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0059: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0060
         * @tc.name: testUtilsSuite10Case0060
         * @tc.desc: Verify ValidateUtils.isIpv4 over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0060', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0060', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1.2.3';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0060: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isIpv4(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0060: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isIpv4(text);
                await addLog(`testUtilsSuite10Case0060: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0060: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0061
         * @tc.name: testUtilsSuite10Case0061
         * @tc.desc: Verify ValidateUtils.isIpv4 over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0061', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0061', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0061: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isIpv4(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0061: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isIpv4(text);
                await addLog(`testUtilsSuite10Case0061: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0061: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0062
         * @tc.name: testUtilsSuite10Case0062
         * @tc.desc: Verify ValidateUtils.isIpv4 over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0062', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0062', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a.b.c.d';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0062: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isIpv4(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0062: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isIpv4(text);
                await addLog(`testUtilsSuite10Case0062: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0062: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0063
         * @tc.name: testUtilsSuite10Case0063
         * @tc.desc: Verify ValidateUtils.isIpv4 over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0063', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0063', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '0.0.0.0';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0063: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isIpv4(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0063: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isIpv4(text);
                await addLog(`testUtilsSuite10Case0063: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0063: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0064
         * @tc.name: testUtilsSuite10Case0064
         * @tc.desc: Verify ValidateUtils.isIpv4 over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0064', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0064', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1.2.3.4.5';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0064: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isIpv4(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0064: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isIpv4(text);
                await addLog(`testUtilsSuite10Case0064: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0064: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0065
         * @tc.name: testUtilsSuite10Case0065
         * @tc.desc: Verify ValidateUtils.isLowerCamel over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0065', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0065', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0065: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isLowerCamel(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0065: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isLowerCamel(text);
                await addLog(`testUtilsSuite10Case0065: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0065: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0066
         * @tc.name: testUtilsSuite10Case0066
         * @tc.desc: Verify ValidateUtils.isLowerCamel over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0066', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0066', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'Abc';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0066: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isLowerCamel(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0066: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isLowerCamel(text);
                await addLog(`testUtilsSuite10Case0066: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0066: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0067
         * @tc.name: testUtilsSuite10Case0067
         * @tc.desc: Verify ValidateUtils.isLowerCamel over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0067', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0067', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0067: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isLowerCamel(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0067: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isLowerCamel(text);
                await addLog(`testUtilsSuite10Case0067: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0067: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0068
         * @tc.name: testUtilsSuite10Case0068
         * @tc.desc: Verify ValidateUtils.isLowerCamel over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0068', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0068', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a1';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0068: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isLowerCamel(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0068: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isLowerCamel(text);
                await addLog(`testUtilsSuite10Case0068: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0068: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0069
         * @tc.name: testUtilsSuite10Case0069
         * @tc.desc: Verify ValidateUtils.isLowerCamel over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0069', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0069', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'aB';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0069: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isLowerCamel(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0069: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isLowerCamel(text);
                await addLog(`testUtilsSuite10Case0069: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0069: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0070
         * @tc.name: testUtilsSuite10Case0070
         * @tc.desc: Verify ValidateUtils.isLowerCamel over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0070', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0070', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a_b';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0070: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isLowerCamel(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0070: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isLowerCamel(text);
                await addLog(`testUtilsSuite10Case0070: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0070: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0071
         * @tc.name: testUtilsSuite10Case0071
         * @tc.desc: Verify ValidateUtils.isLowerCamel over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0071', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0071', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1a';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0071: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isLowerCamel(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0071: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isLowerCamel(text);
                await addLog(`testUtilsSuite10Case0071: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0071: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0072
         * @tc.name: testUtilsSuite10Case0072
         * @tc.desc: Verify ValidateUtils.isLowerCamel over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0072', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0072', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'z9';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0072: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isLowerCamel(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0072: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isLowerCamel(text);
                await addLog(`testUtilsSuite10Case0072: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0072: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0073
         * @tc.name: testUtilsSuite10Case0073
         * @tc.desc: Verify ValidateUtils.isNumericString over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0073', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0073', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '123';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0073: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isNumericString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0073: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isNumericString(text);
                await addLog(`testUtilsSuite10Case0073: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0073: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0074
         * @tc.name: testUtilsSuite10Case0074
         * @tc.desc: Verify ValidateUtils.isNumericString over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0074', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0074', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '-1';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0074: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isNumericString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0074: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isNumericString(text);
                await addLog(`testUtilsSuite10Case0074: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0074: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0075
         * @tc.name: testUtilsSuite10Case0075
         * @tc.desc: Verify ValidateUtils.isNumericString over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0075', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0075', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1.5';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0075: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isNumericString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0075: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isNumericString(text);
                await addLog(`testUtilsSuite10Case0075: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0075: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0076
         * @tc.name: testUtilsSuite10Case0076
         * @tc.desc: Verify ValidateUtils.isNumericString over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0076', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0076', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0076: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isNumericString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0076: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isNumericString(text);
                await addLog(`testUtilsSuite10Case0076: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0076: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0077
         * @tc.name: testUtilsSuite10Case0077
         * @tc.desc: Verify ValidateUtils.isNumericString over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0077', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0077', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1.';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0077: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isNumericString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0077: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isNumericString(text);
                await addLog(`testUtilsSuite10Case0077: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0077: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0078
         * @tc.name: testUtilsSuite10Case0078
         * @tc.desc: Verify ValidateUtils.isNumericString over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0078', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0078', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '.5';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0078: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isNumericString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0078: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isNumericString(text);
                await addLog(`testUtilsSuite10Case0078: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0078: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0079
         * @tc.name: testUtilsSuite10Case0079
         * @tc.desc: Verify ValidateUtils.isNumericString over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0079', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0079', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1a';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0079: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isNumericString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0079: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isNumericString(text);
                await addLog(`testUtilsSuite10Case0079: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0079: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0080
         * @tc.name: testUtilsSuite10Case0080
         * @tc.desc: Verify ValidateUtils.isNumericString over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0080', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0080', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '0';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0080: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isNumericString(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0080: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isNumericString(text);
                await addLog(`testUtilsSuite10Case0080: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0080: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0081
         * @tc.name: testUtilsSuite10Case0081
         * @tc.desc: Verify ValidateUtils.isPhoneCn over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0081', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0081', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '13800138000';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0081: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isPhoneCn(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0081: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isPhoneCn(text);
                await addLog(`testUtilsSuite10Case0081: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0081: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0082
         * @tc.name: testUtilsSuite10Case0082
         * @tc.desc: Verify ValidateUtils.isPhoneCn over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0082', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0082', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '12345678901';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0082: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isPhoneCn(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0082: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isPhoneCn(text);
                await addLog(`testUtilsSuite10Case0082: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0082: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0083
         * @tc.name: testUtilsSuite10Case0083
         * @tc.desc: Verify ValidateUtils.isPhoneCn over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0083', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0083', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1380013800';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0083: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isPhoneCn(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0083: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isPhoneCn(text);
                await addLog(`testUtilsSuite10Case0083: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0083: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0084
         * @tc.name: testUtilsSuite10Case0084
         * @tc.desc: Verify ValidateUtils.isPhoneCn over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0084', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0084', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '138001380000';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0084: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isPhoneCn(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0084: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isPhoneCn(text);
                await addLog(`testUtilsSuite10Case0084: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0084: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0085
         * @tc.name: testUtilsSuite10Case0085
         * @tc.desc: Verify ValidateUtils.isPhoneCn over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0085', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0085', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0085: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isPhoneCn(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0085: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isPhoneCn(text);
                await addLog(`testUtilsSuite10Case0085: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0085: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0086
         * @tc.name: testUtilsSuite10Case0086
         * @tc.desc: Verify ValidateUtils.isPhoneCn over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0086', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0086', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '23800138000';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0086: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isPhoneCn(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0086: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isPhoneCn(text);
                await addLog(`testUtilsSuite10Case0086: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0086: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0087
         * @tc.name: testUtilsSuite10Case0087
         * @tc.desc: Verify ValidateUtils.isPhoneCn over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0087', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0087', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '19912345678';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0087: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isPhoneCn(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0087: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isPhoneCn(text);
                await addLog(`testUtilsSuite10Case0087: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0087: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0088
         * @tc.name: testUtilsSuite10Case0088
         * @tc.desc: Verify ValidateUtils.isPhoneCn over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0088', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0088', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1380013800a';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0088: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isPhoneCn(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0088: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isPhoneCn(text);
                await addLog(`testUtilsSuite10Case0088: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0088: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0089
         * @tc.name: testUtilsSuite10Case0089
         * @tc.desc: Verify ValidateUtils.isUpperSnake over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0089', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0089', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ABC';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0089: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUpperSnake(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0089: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUpperSnake(text);
                await addLog(`testUtilsSuite10Case0089: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0089: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0090
         * @tc.name: testUtilsSuite10Case0090
         * @tc.desc: Verify ValidateUtils.isUpperSnake over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0090', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0090', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'A_B';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0090: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUpperSnake(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0090: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUpperSnake(text);
                await addLog(`testUtilsSuite10Case0090: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0090: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0091
         * @tc.name: testUtilsSuite10Case0091
         * @tc.desc: Verify ValidateUtils.isUpperSnake over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0091', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0091', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'A1';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0091: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUpperSnake(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0091: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUpperSnake(text);
                await addLog(`testUtilsSuite10Case0091: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0091: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0092
         * @tc.name: testUtilsSuite10Case0092
         * @tc.desc: Verify ValidateUtils.isUpperSnake over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0092', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0092', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0092: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUpperSnake(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0092: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUpperSnake(text);
                await addLog(`testUtilsSuite10Case0092: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0092: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0093
         * @tc.name: testUtilsSuite10Case0093
         * @tc.desc: Verify ValidateUtils.isUpperSnake over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0093', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0093', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0093: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUpperSnake(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0093: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUpperSnake(text);
                await addLog(`testUtilsSuite10Case0093: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0093: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0094
         * @tc.name: testUtilsSuite10Case0094
         * @tc.desc: Verify ValidateUtils.isUpperSnake over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0094', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0094', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'A_';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0094: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUpperSnake(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0094: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUpperSnake(text);
                await addLog(`testUtilsSuite10Case0094: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0094: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0095
         * @tc.name: testUtilsSuite10Case0095
         * @tc.desc: Verify ValidateUtils.isUpperSnake over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0095', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0095', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'A__B';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0095: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUpperSnake(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0095: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUpperSnake(text);
                await addLog(`testUtilsSuite10Case0095: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0095: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0096
         * @tc.name: testUtilsSuite10Case0096
         * @tc.desc: Verify ValidateUtils.isUpperSnake over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0096', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0096', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'AB_C1';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0096: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUpperSnake(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0096: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUpperSnake(text);
                await addLog(`testUtilsSuite10Case0096: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0096: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0097
         * @tc.name: testUtilsSuite10Case0097
         * @tc.desc: Verify ValidateUtils.isUrlHttp over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0097', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0097', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'http://a';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0097: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUrlHttp(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0097: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUrlHttp(text);
                await addLog(`testUtilsSuite10Case0097: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0097: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0098
         * @tc.name: testUtilsSuite10Case0098
         * @tc.desc: Verify ValidateUtils.isUrlHttp over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0098', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0098', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'https://a.b';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0098: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUrlHttp(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0098: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUrlHttp(text);
                await addLog(`testUtilsSuite10Case0098: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0098: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0099
         * @tc.name: testUtilsSuite10Case0099
         * @tc.desc: Verify ValidateUtils.isUrlHttp over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0099', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0099', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ftp://a';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0099: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUrlHttp(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0099: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUrlHttp(text);
                await addLog(`testUtilsSuite10Case0099: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0099: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0100
         * @tc.name: testUtilsSuite10Case0100
         * @tc.desc: Verify ValidateUtils.isUrlHttp over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0100', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0100', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'http://';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0100: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUrlHttp(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0100: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUrlHttp(text);
                await addLog(`testUtilsSuite10Case0100: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0100: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0101
         * @tc.name: testUtilsSuite10Case0101
         * @tc.desc: Verify ValidateUtils.isUrlHttp over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0101', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0101', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'https://a b';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0101: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUrlHttp(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0101: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUrlHttp(text);
                await addLog(`testUtilsSuite10Case0101: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0101: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0102
         * @tc.name: testUtilsSuite10Case0102
         * @tc.desc: Verify ValidateUtils.isUrlHttp over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0102', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0102', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0102: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUrlHttp(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0102: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUrlHttp(text);
                await addLog(`testUtilsSuite10Case0102: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0102: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0103
         * @tc.name: testUtilsSuite10Case0103
         * @tc.desc: Verify ValidateUtils.isUrlHttp over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0103', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0103', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'HTTP://a';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0103: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUrlHttp(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0103: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUrlHttp(text);
                await addLog(`testUtilsSuite10Case0103: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0103: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0104
         * @tc.name: testUtilsSuite10Case0104
         * @tc.desc: Verify ValidateUtils.isUrlHttp over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0104', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0104', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'http://a?b=1';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0104: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isUrlHttp(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0104: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isUrlHttp(text);
                await addLog(`testUtilsSuite10Case0104: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0104: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0105
         * @tc.name: testUtilsSuite10Case0105
         * @tc.desc: Verify ValidateUtils.lengthBetween over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0105', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0105', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const min: number = 1; const max: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0105: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.lengthBetween(text, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0105: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.lengthBetween(text, min, max);
                await addLog(`testUtilsSuite10Case0105: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0105: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0106
         * @tc.name: testUtilsSuite10Case0106
         * @tc.desc: Verify ValidateUtils.lengthBetween over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0106', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0106', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const min: number = 3; const max: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0106: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.lengthBetween(text, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0106: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.lengthBetween(text, min, max);
                await addLog(`testUtilsSuite10Case0106: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0106: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0107
         * @tc.name: testUtilsSuite10Case0107
         * @tc.desc: Verify ValidateUtils.lengthBetween over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0107', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0107', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const min: number = 4; const max: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0107: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.lengthBetween(text, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0107: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.lengthBetween(text, min, max);
                await addLog(`testUtilsSuite10Case0107: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0107: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0108
         * @tc.name: testUtilsSuite10Case0108
         * @tc.desc: Verify ValidateUtils.lengthBetween over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0108', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0108', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = ''; const min: number = 0; const max: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0108: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.lengthBetween(text, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0108: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.lengthBetween(text, min, max);
                await addLog(`testUtilsSuite10Case0108: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0108: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0109
         * @tc.name: testUtilsSuite10Case0109
         * @tc.desc: Verify ValidateUtils.lengthBetween over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0109', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0109', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const min: number = 0; const max: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0109: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.lengthBetween(text, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0109: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.lengthBetween(text, min, max);
                await addLog(`testUtilsSuite10Case0109: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0109: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0110
         * @tc.name: testUtilsSuite10Case0110
         * @tc.desc: Verify ValidateUtils.lengthBetween over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0110', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0110', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abcd'; const min: number = 2; const max: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0110: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.lengthBetween(text, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0110: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.lengthBetween(text, min, max);
                await addLog(`testUtilsSuite10Case0110: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0110: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0111
         * @tc.name: testUtilsSuite10Case0111
         * @tc.desc: Verify ValidateUtils.lengthBetween over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0111', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0111', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab'; const min: number = 2; const max: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0111: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.lengthBetween(text, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0111: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.lengthBetween(text, min, max);
                await addLog(`testUtilsSuite10Case0111: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0111: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0112
         * @tc.name: testUtilsSuite10Case0112
         * @tc.desc: Verify ValidateUtils.lengthBetween over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0112', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0112', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const min: number = -1; const max: number = 10;
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0112: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.lengthBetween(text, min, max);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0112: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.lengthBetween(text, min, max);
                await addLog(`testUtilsSuite10Case0112: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0112: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0113
         * @tc.name: testUtilsSuite10Case0113
         * @tc.desc: Verify ValidateUtils.isEmptyText over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0113', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0113', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0113: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmptyText(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0113: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmptyText(text);
                await addLog(`testUtilsSuite10Case0113: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0113: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0114
         * @tc.name: testUtilsSuite10Case0114
         * @tc.desc: Verify ValidateUtils.isEmptyText over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0114', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0114', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0114: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmptyText(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0114: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmptyText(text);
                await addLog(`testUtilsSuite10Case0114: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0114: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0115
         * @tc.name: testUtilsSuite10Case0115
         * @tc.desc: Verify ValidateUtils.isEmptyText over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0115', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0115', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = ' ';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0115: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmptyText(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0115: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmptyText(text);
                await addLog(`testUtilsSuite10Case0115: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0115: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0116
         * @tc.name: testUtilsSuite10Case0116
         * @tc.desc: Verify ValidateUtils.isEmptyText over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0116', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0116', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '0';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0116: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmptyText(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0116: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmptyText(text);
                await addLog(`testUtilsSuite10Case0116: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0116: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0117
         * @tc.name: testUtilsSuite10Case0117
         * @tc.desc: Verify ValidateUtils.isEmptyText over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0117', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0117', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0117: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmptyText(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0117: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmptyText(text);
                await addLog(`testUtilsSuite10Case0117: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0117: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0118
         * @tc.name: testUtilsSuite10Case0118
         * @tc.desc: Verify ValidateUtils.isEmptyText over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0118', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0118', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '\t';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0118: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmptyText(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0118: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmptyText(text);
                await addLog(`testUtilsSuite10Case0118: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0118: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0119
         * @tc.name: testUtilsSuite10Case0119
         * @tc.desc: Verify ValidateUtils.isEmptyText over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0119', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0119', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '  ';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0119: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmptyText(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0119: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmptyText(text);
                await addLog(`testUtilsSuite10Case0119: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0119: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0120
         * @tc.name: testUtilsSuite10Case0120
         * @tc.desc: Verify ValidateUtils.isEmptyText over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0120', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0120', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'Ω';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0120: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isEmptyText(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0120: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isEmptyText(text);
                await addLog(`testUtilsSuite10Case0120: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0120: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0121
         * @tc.name: testUtilsSuite10Case0121
         * @tc.desc: Verify ValidateUtils.startsWithText over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0121', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0121', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const prefix: string = 'ab';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0121: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.startsWithText(text, prefix);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0121: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.startsWithText(text, prefix);
                await addLog(`testUtilsSuite10Case0121: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0121: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0122
         * @tc.name: testUtilsSuite10Case0122
         * @tc.desc: Verify ValidateUtils.startsWithText over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0122', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0122', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const prefix: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0122: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.startsWithText(text, prefix);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0122: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.startsWithText(text, prefix);
                await addLog(`testUtilsSuite10Case0122: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0122: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0123
         * @tc.name: testUtilsSuite10Case0123
         * @tc.desc: Verify ValidateUtils.startsWithText over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0123', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0123', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const prefix: string = 'b';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0123: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.startsWithText(text, prefix);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0123: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.startsWithText(text, prefix);
                await addLog(`testUtilsSuite10Case0123: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0123: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0124
         * @tc.name: testUtilsSuite10Case0124
         * @tc.desc: Verify ValidateUtils.startsWithText over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0124', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0124', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const prefix: string = 'abcd';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0124: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.startsWithText(text, prefix);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0124: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.startsWithText(text, prefix);
                await addLog(`testUtilsSuite10Case0124: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0124: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0125
         * @tc.name: testUtilsSuite10Case0125
         * @tc.desc: Verify ValidateUtils.startsWithText over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0125', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0125', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = ''; const prefix: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0125: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.startsWithText(text, prefix);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0125: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.startsWithText(text, prefix);
                await addLog(`testUtilsSuite10Case0125: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0125: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0126
         * @tc.name: testUtilsSuite10Case0126
         * @tc.desc: Verify ValidateUtils.startsWithText over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0126', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0126', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const prefix: string = 'abc';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0126: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.startsWithText(text, prefix);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0126: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.startsWithText(text, prefix);
                await addLog(`testUtilsSuite10Case0126: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0126: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0127
         * @tc.name: testUtilsSuite10Case0127
         * @tc.desc: Verify ValidateUtils.startsWithText over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0127', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0127', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'Abc'; const prefix: string = 'a';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0127: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.startsWithText(text, prefix);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0127: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.startsWithText(text, prefix);
                await addLog(`testUtilsSuite10Case0127: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0127: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0128
         * @tc.name: testUtilsSuite10Case0128
         * @tc.desc: Verify ValidateUtils.startsWithText over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0128', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0128', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const prefix: string = 'a';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0128: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.startsWithText(text, prefix);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0128: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.startsWithText(text, prefix);
                await addLog(`testUtilsSuite10Case0128: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0128: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0129
         * @tc.name: testUtilsSuite10Case0129
         * @tc.desc: Verify ValidateUtils.isSingleDigit over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0129', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0129', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '5';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0129: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isSingleDigit(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0129: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isSingleDigit(text);
                await addLog(`testUtilsSuite10Case0129: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0129: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0130
         * @tc.name: testUtilsSuite10Case0130
         * @tc.desc: Verify ValidateUtils.isSingleDigit over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0130', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0130', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '55';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0130: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isSingleDigit(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0130: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isSingleDigit(text);
                await addLog(`testUtilsSuite10Case0130: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0130: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0131
         * @tc.name: testUtilsSuite10Case0131
         * @tc.desc: Verify ValidateUtils.isSingleDigit over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0131', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0131', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0131: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isSingleDigit(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0131: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isSingleDigit(text);
                await addLog(`testUtilsSuite10Case0131: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0131: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0132
         * @tc.name: testUtilsSuite10Case0132
         * @tc.desc: Verify ValidateUtils.isSingleDigit over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0132', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0132', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0132: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isSingleDigit(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0132: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isSingleDigit(text);
                await addLog(`testUtilsSuite10Case0132: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0132: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0133
         * @tc.name: testUtilsSuite10Case0133
         * @tc.desc: Verify ValidateUtils.isSingleDigit over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0133', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0133', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '0';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0133: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isSingleDigit(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0133: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isSingleDigit(text);
                await addLog(`testUtilsSuite10Case0133: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0133: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0134
         * @tc.name: testUtilsSuite10Case0134
         * @tc.desc: Verify ValidateUtils.isSingleDigit over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0134', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0134', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = ' 5';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0134: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isSingleDigit(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0134: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isSingleDigit(text);
                await addLog(`testUtilsSuite10Case0134: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0134: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0135
         * @tc.name: testUtilsSuite10Case0135
         * @tc.desc: Verify ValidateUtils.isSingleDigit over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0135', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0135', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '9';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0135: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isSingleDigit(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0135: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isSingleDigit(text);
                await addLog(`testUtilsSuite10Case0135: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0135: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S10_0136
         * @tc.name: testUtilsSuite10Case0136
         * @tc.desc: Verify ValidateUtils.isSingleDigit over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite10Case0136', 0, async (done: Function) => {
            await runCase('testUtilsSuite10Case0136', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '5a';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite10Case0136: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ValidateUtils.isSingleDigit(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite10Case0136: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ValidateUtils.isSingleDigit(text);
                await addLog(`testUtilsSuite10Case0136: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite10Case0136: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

    });
}
