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
import { StringFormatter } from '../../../../main/ets/common/utils/StringFormatter';
import { addLog, runCase } from '../../testkit/SharedDriver';

/**
 * StringFormatter utility suite.
 *
 * Every method of the class is expanded over the same pooled input set, and every case
 * compares the returned value against a locally stated expectation.
 */
export default function utilsSuite11(): void {
    describe('UtilsSuite11', () => {

        /*
         * @tc.number: SUB_CS_UTIL_S11_0001
         * @tc.name: testUtilsSuite11Case0001
         * @tc.desc: Verify StringFormatter.bulletPrefix over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0001', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0001', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '• a';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0001: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.bulletPrefix(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0001: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.bulletPrefix(text);
                await addLog(`testUtilsSuite11Case0001: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0001: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0002
         * @tc.name: testUtilsSuite11Case0002
         * @tc.desc: Verify StringFormatter.bulletPrefix over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0002', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0002', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '• ';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0002: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.bulletPrefix(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0002: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.bulletPrefix(text);
                await addLog(`testUtilsSuite11Case0002: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0002: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0003
         * @tc.name: testUtilsSuite11Case0003
         * @tc.desc: Verify StringFormatter.bulletPrefix over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0003', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0003', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '• ab';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0003: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.bulletPrefix(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0003: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.bulletPrefix(text);
                await addLog(`testUtilsSuite11Case0003: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0003: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0004
         * @tc.name: testUtilsSuite11Case0004
         * @tc.desc: Verify StringFormatter.bulletPrefix over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0004', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0004', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = ' ';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '•  ';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0004: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.bulletPrefix(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0004: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.bulletPrefix(text);
                await addLog(`testUtilsSuite11Case0004: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0004: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0005
         * @tc.name: testUtilsSuite11Case0005
         * @tc.desc: Verify StringFormatter.bulletPrefix over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0005', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0005', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '• 1';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0005: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.bulletPrefix(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0005: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.bulletPrefix(text);
                await addLog(`testUtilsSuite11Case0005: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0005: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0006
         * @tc.name: testUtilsSuite11Case0006
         * @tc.desc: Verify StringFormatter.bulletPrefix over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0006', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0006', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '-';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '• -';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0006: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.bulletPrefix(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0006: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.bulletPrefix(text);
                await addLog(`testUtilsSuite11Case0006: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0006: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0007
         * @tc.name: testUtilsSuite11Case0007
         * @tc.desc: Verify StringFormatter.bulletPrefix over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0007', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0007', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'Ω';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '• Ω';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0007: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.bulletPrefix(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0007: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.bulletPrefix(text);
                await addLog(`testUtilsSuite11Case0007: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0007: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0008
         * @tc.name: testUtilsSuite11Case0008
         * @tc.desc: Verify StringFormatter.bulletPrefix over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0008', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0008', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'xy';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '• xy';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0008: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.bulletPrefix(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0008: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.bulletPrefix(text);
                await addLog(`testUtilsSuite11Case0008: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0008: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0009
         * @tc.name: testUtilsSuite11Case0009
         * @tc.desc: Verify StringFormatter.centerInWidth over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0009', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0009', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab'; const width: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: string = ' ab ';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0009: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.centerInWidth(text, width);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0009: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.centerInWidth(text, width);
                await addLog(`testUtilsSuite11Case0009: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0009: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0010
         * @tc.name: testUtilsSuite11Case0010
         * @tc.desc: Verify StringFormatter.centerInWidth over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0010', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0010', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab'; const width: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: string = ' ab  ';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0010: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.centerInWidth(text, width);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0010: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.centerInWidth(text, width);
                await addLog(`testUtilsSuite11Case0010: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0010: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0011
         * @tc.name: testUtilsSuite11Case0011
         * @tc.desc: Verify StringFormatter.centerInWidth over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0011', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0011', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abcd'; const width: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'abcd';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0011: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.centerInWidth(text, width);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0011: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.centerInWidth(text, width);
                await addLog(`testUtilsSuite11Case0011: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0011: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0012
         * @tc.name: testUtilsSuite11Case0012
         * @tc.desc: Verify StringFormatter.centerInWidth over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0012', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0012', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab'; const width: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'ab';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0012: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.centerInWidth(text, width);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0012: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.centerInWidth(text, width);
                await addLog(`testUtilsSuite11Case0012: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0012: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0013
         * @tc.name: testUtilsSuite11Case0013
         * @tc.desc: Verify StringFormatter.centerInWidth over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0013', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0013', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = ''; const width: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '  ';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0013: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.centerInWidth(text, width);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0013: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.centerInWidth(text, width);
                await addLog(`testUtilsSuite11Case0013: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0013: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0014
         * @tc.name: testUtilsSuite11Case0014
         * @tc.desc: Verify StringFormatter.centerInWidth over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0014', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0014', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a'; const width: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: string = ' a ';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0014: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.centerInWidth(text, width);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0014: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.centerInWidth(text, width);
                await addLog(`testUtilsSuite11Case0014: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0014: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0015
         * @tc.name: testUtilsSuite11Case0015
         * @tc.desc: Verify StringFormatter.centerInWidth over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0015', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0015', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab'; const width: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'ab ';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0015: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.centerInWidth(text, width);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0015: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.centerInWidth(text, width);
                await addLog(`testUtilsSuite11Case0015: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0015: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0016
         * @tc.name: testUtilsSuite11Case0016
         * @tc.desc: Verify StringFormatter.centerInWidth over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0016', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0016', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const width: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: string = ' abc ';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0016: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.centerInWidth(text, width);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0016: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.centerInWidth(text, width);
                await addLog(`testUtilsSuite11Case0016: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0016: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0017
         * @tc.name: testUtilsSuite11Case0017
         * @tc.desc: Verify StringFormatter.dashJoin over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0017', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0017', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const parts: string[] = ['a', 'b'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'a-b';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0017: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.dashJoin(parts);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0017: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.dashJoin(parts);
                await addLog(`testUtilsSuite11Case0017: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0017: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0018
         * @tc.name: testUtilsSuite11Case0018
         * @tc.desc: Verify StringFormatter.dashJoin over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0018', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0018', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const parts: string[] = [];
                // Step 2: state the expected value from a local oracle.
                const expected: string = '';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0018: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.dashJoin(parts);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0018: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.dashJoin(parts);
                await addLog(`testUtilsSuite11Case0018: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0018: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0019
         * @tc.name: testUtilsSuite11Case0019
         * @tc.desc: Verify StringFormatter.dashJoin over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0019', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0019', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const parts: string[] = ['a'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'a';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0019: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.dashJoin(parts);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0019: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.dashJoin(parts);
                await addLog(`testUtilsSuite11Case0019: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0019: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0020
         * @tc.name: testUtilsSuite11Case0020
         * @tc.desc: Verify StringFormatter.dashJoin over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0020', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0020', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const parts: string[] = ['1', '2', '3'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1-2-3';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0020: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.dashJoin(parts);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0020: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.dashJoin(parts);
                await addLog(`testUtilsSuite11Case0020: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0020: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0021
         * @tc.name: testUtilsSuite11Case0021
         * @tc.desc: Verify StringFormatter.dashJoin over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0021', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0021', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const parts: string[] = ['', ''];
                // Step 2: state the expected value from a local oracle.
                const expected: string = '-';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0021: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.dashJoin(parts);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0021: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.dashJoin(parts);
                await addLog(`testUtilsSuite11Case0021: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0021: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0022
         * @tc.name: testUtilsSuite11Case0022
         * @tc.desc: Verify StringFormatter.dashJoin over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0022', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0022', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const parts: string[] = ['ab'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'ab';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0022: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.dashJoin(parts);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0022: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.dashJoin(parts);
                await addLog(`testUtilsSuite11Case0022: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0022: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0023
         * @tc.name: testUtilsSuite11Case0023
         * @tc.desc: Verify StringFormatter.dashJoin over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0023', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0023', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const parts: string[] = ['a', '', 'b'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'a--b';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0023: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.dashJoin(parts);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0023: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.dashJoin(parts);
                await addLog(`testUtilsSuite11Case0023: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0023: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0024
         * @tc.name: testUtilsSuite11Case0024
         * @tc.desc: Verify StringFormatter.dashJoin over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0024', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0024', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const parts: string[] = ['x', 'y', 'z', 'w'];
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'x-y-z-w';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0024: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.dashJoin(parts);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0024: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.dashJoin(parts);
                await addLog(`testUtilsSuite11Case0024: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0024: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0025
         * @tc.name: testUtilsSuite11Case0025
         * @tc.desc: Verify StringFormatter.durationText over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0025', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0025', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seconds: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '00m 00s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0025: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.durationText(seconds);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0025: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.durationText(seconds);
                await addLog(`testUtilsSuite11Case0025: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0025: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0026
         * @tc.name: testUtilsSuite11Case0026
         * @tc.desc: Verify StringFormatter.durationText over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0026', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0026', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seconds: number = 59;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '00m 59s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0026: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.durationText(seconds);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0026: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.durationText(seconds);
                await addLog(`testUtilsSuite11Case0026: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0026: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0027
         * @tc.name: testUtilsSuite11Case0027
         * @tc.desc: Verify StringFormatter.durationText over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0027', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0027', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seconds: number = 60;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '01m 00s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0027: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.durationText(seconds);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0027: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.durationText(seconds);
                await addLog(`testUtilsSuite11Case0027: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0027: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0028
         * @tc.name: testUtilsSuite11Case0028
         * @tc.desc: Verify StringFormatter.durationText over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0028', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0028', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seconds: number = 3599;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '59m 59s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0028: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.durationText(seconds);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0028: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.durationText(seconds);
                await addLog(`testUtilsSuite11Case0028: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0028: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0029
         * @tc.name: testUtilsSuite11Case0029
         * @tc.desc: Verify StringFormatter.durationText over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0029', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0029', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seconds: number = 3600;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1h 00m 00s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0029: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.durationText(seconds);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0029: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.durationText(seconds);
                await addLog(`testUtilsSuite11Case0029: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0029: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0030
         * @tc.name: testUtilsSuite11Case0030
         * @tc.desc: Verify StringFormatter.durationText over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0030', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0030', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seconds: number = 3661;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1h 01m 01s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0030: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.durationText(seconds);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0030: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.durationText(seconds);
                await addLog(`testUtilsSuite11Case0030: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0030: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0031
         * @tc.name: testUtilsSuite11Case0031
         * @tc.desc: Verify StringFormatter.durationText over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0031', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0031', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seconds: number = 7322;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '2h 02m 02s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0031: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.durationText(seconds);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0031: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.durationText(seconds);
                await addLog(`testUtilsSuite11Case0031: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0031: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0032
         * @tc.name: testUtilsSuite11Case0032
         * @tc.desc: Verify StringFormatter.durationText over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0032', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0032', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const seconds: number = -5;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '00m 00s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0032: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.durationText(seconds);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0032: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.durationText(seconds);
                await addLog(`testUtilsSuite11Case0032: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0032: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0033
         * @tc.name: testUtilsSuite11Case0033
         * @tc.desc: Verify StringFormatter.ellipsis over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0033', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0033', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abcdef'; const limit: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'abc...';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0033: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ellipsis(text, limit);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0033: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ellipsis(text, limit);
                await addLog(`testUtilsSuite11Case0033: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0033: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0034
         * @tc.name: testUtilsSuite11Case0034
         * @tc.desc: Verify StringFormatter.ellipsis over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0034', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0034', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const limit: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'abc';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0034: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ellipsis(text, limit);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0034: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ellipsis(text, limit);
                await addLog(`testUtilsSuite11Case0034: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0034: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0035
         * @tc.name: testUtilsSuite11Case0035
         * @tc.desc: Verify StringFormatter.ellipsis over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0035', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0035', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const limit: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'abc';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0035: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ellipsis(text, limit);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0035: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ellipsis(text, limit);
                await addLog(`testUtilsSuite11Case0035: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0035: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0036
         * @tc.name: testUtilsSuite11Case0036
         * @tc.desc: Verify StringFormatter.ellipsis over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0036', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0036', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abcdef'; const limit: number = 6;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'abcdef';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0036: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ellipsis(text, limit);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0036: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ellipsis(text, limit);
                await addLog(`testUtilsSuite11Case0036: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0036: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0037
         * @tc.name: testUtilsSuite11Case0037
         * @tc.desc: Verify StringFormatter.ellipsis over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0037', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0037', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = ''; const limit: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0037: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ellipsis(text, limit);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0037: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ellipsis(text, limit);
                await addLog(`testUtilsSuite11Case0037: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0037: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0038
         * @tc.name: testUtilsSuite11Case0038
         * @tc.desc: Verify StringFormatter.ellipsis over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0038', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0038', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abcdef'; const limit: number = -1;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'abcdef';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0038: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ellipsis(text, limit);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0038: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ellipsis(text, limit);
                await addLog(`testUtilsSuite11Case0038: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0038: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0039
         * @tc.name: testUtilsSuite11Case0039
         * @tc.desc: Verify StringFormatter.ellipsis over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0039', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0039', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab'; const limit: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'a...';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0039: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ellipsis(text, limit);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0039: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ellipsis(text, limit);
                await addLog(`testUtilsSuite11Case0039: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0039: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0040
         * @tc.name: testUtilsSuite11Case0040
         * @tc.desc: Verify StringFormatter.ellipsis over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0040', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0040', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'hello world'; const limit: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'hello...';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0040: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ellipsis(text, limit);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0040: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ellipsis(text, limit);
                await addLog(`testUtilsSuite11Case0040: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0040: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0041
         * @tc.name: testUtilsSuite11Case0041
         * @tc.desc: Verify StringFormatter.fileSizeText over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0041', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0041', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const bytes: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '0 B';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0041: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.fileSizeText(bytes);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0041: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.fileSizeText(bytes);
                await addLog(`testUtilsSuite11Case0041: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0041: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0042
         * @tc.name: testUtilsSuite11Case0042
         * @tc.desc: Verify StringFormatter.fileSizeText over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0042', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0042', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const bytes: number = 512;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '512 B';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0042: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.fileSizeText(bytes);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0042: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.fileSizeText(bytes);
                await addLog(`testUtilsSuite11Case0042: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0042: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0043
         * @tc.name: testUtilsSuite11Case0043
         * @tc.desc: Verify StringFormatter.fileSizeText over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0043', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0043', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const bytes: number = 1023;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1023 B';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0043: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.fileSizeText(bytes);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0043: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.fileSizeText(bytes);
                await addLog(`testUtilsSuite11Case0043: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0043: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0044
         * @tc.name: testUtilsSuite11Case0044
         * @tc.desc: Verify StringFormatter.fileSizeText over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0044', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0044', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const bytes: number = 1024;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1.0 KB';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0044: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.fileSizeText(bytes);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0044: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.fileSizeText(bytes);
                await addLog(`testUtilsSuite11Case0044: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0044: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0045
         * @tc.name: testUtilsSuite11Case0045
         * @tc.desc: Verify StringFormatter.fileSizeText over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0045', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0045', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const bytes: number = 1536;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1.5 KB';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0045: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.fileSizeText(bytes);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0045: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.fileSizeText(bytes);
                await addLog(`testUtilsSuite11Case0045: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0045: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0046
         * @tc.name: testUtilsSuite11Case0046
         * @tc.desc: Verify StringFormatter.fileSizeText over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0046', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0046', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const bytes: number = 1048576;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1.0 MB';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0046: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.fileSizeText(bytes);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0046: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.fileSizeText(bytes);
                await addLog(`testUtilsSuite11Case0046: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0046: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0047
         * @tc.name: testUtilsSuite11Case0047
         * @tc.desc: Verify StringFormatter.fileSizeText over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0047', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0047', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const bytes: number = 2097152;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '2.0 MB';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0047: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.fileSizeText(bytes);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0047: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.fileSizeText(bytes);
                await addLog(`testUtilsSuite11Case0047: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0047: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0048
         * @tc.name: testUtilsSuite11Case0048
         * @tc.desc: Verify StringFormatter.fileSizeText over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0048', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0048', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const bytes: number = -5;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '0 B';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0048: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.fileSizeText(bytes);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0048: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.fileSizeText(bytes);
                await addLog(`testUtilsSuite11Case0048: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0048: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0049
         * @tc.name: testUtilsSuite11Case0049
         * @tc.desc: Verify StringFormatter.hexByte over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0049', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0049', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const value: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '00';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0049: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.hexByte(value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0049: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.hexByte(value);
                await addLog(`testUtilsSuite11Case0049: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0049: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0050
         * @tc.name: testUtilsSuite11Case0050
         * @tc.desc: Verify StringFormatter.hexByte over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0050', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0050', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const value: number = 255;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'FF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0050: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.hexByte(value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0050: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.hexByte(value);
                await addLog(`testUtilsSuite11Case0050: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0050: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0051
         * @tc.name: testUtilsSuite11Case0051
         * @tc.desc: Verify StringFormatter.hexByte over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0051', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0051', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const value: number = 16;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '10';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0051: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.hexByte(value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0051: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.hexByte(value);
                await addLog(`testUtilsSuite11Case0051: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0051: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0052
         * @tc.name: testUtilsSuite11Case0052
         * @tc.desc: Verify StringFormatter.hexByte over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0052', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0052', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const value: number = 10;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '0A';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0052: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.hexByte(value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0052: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.hexByte(value);
                await addLog(`testUtilsSuite11Case0052: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0052: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0053
         * @tc.name: testUtilsSuite11Case0053
         * @tc.desc: Verify StringFormatter.hexByte over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0053', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0053', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const value: number = 171;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'AB';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0053: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.hexByte(value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0053: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.hexByte(value);
                await addLog(`testUtilsSuite11Case0053: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0053: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0054
         * @tc.name: testUtilsSuite11Case0054
         * @tc.desc: Verify StringFormatter.hexByte over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0054', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0054', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const value: number = 256;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'FF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0054: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.hexByte(value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0054: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.hexByte(value);
                await addLog(`testUtilsSuite11Case0054: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0054: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0055
         * @tc.name: testUtilsSuite11Case0055
         * @tc.desc: Verify StringFormatter.hexByte over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0055', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0055', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const value: number = -1;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '00';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0055: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.hexByte(value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0055: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.hexByte(value);
                await addLog(`testUtilsSuite11Case0055: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0055: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0056
         * @tc.name: testUtilsSuite11Case0056
         * @tc.desc: Verify StringFormatter.hexByte over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0056', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0056', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const value: number = 128;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '80';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0056: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.hexByte(value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0056: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.hexByte(value);
                await addLog(`testUtilsSuite11Case0056: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0056: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0057
         * @tc.name: testUtilsSuite11Case0057
         * @tc.desc: Verify StringFormatter.labeledValue over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0057', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0057', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const label: string = 'W'; const value: string = '1';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'W: 1';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0057: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.labeledValue(label, value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0057: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.labeledValue(label, value);
                await addLog(`testUtilsSuite11Case0057: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0057: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0058
         * @tc.name: testUtilsSuite11Case0058
         * @tc.desc: Verify StringFormatter.labeledValue over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0058', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0058', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const label: string = ''; const value: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: string = ': ';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0058: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.labeledValue(label, value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0058: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.labeledValue(label, value);
                await addLog(`testUtilsSuite11Case0058: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0058: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0059
         * @tc.name: testUtilsSuite11Case0059
         * @tc.desc: Verify StringFormatter.labeledValue over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0059', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0059', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const label: string = 'a'; const value: string = 'b';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'a: b';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0059: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.labeledValue(label, value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0059: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.labeledValue(label, value);
                await addLog(`testUtilsSuite11Case0059: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0059: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0060
         * @tc.name: testUtilsSuite11Case0060
         * @tc.desc: Verify StringFormatter.labeledValue over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0060', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0060', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const label: string = 'Gamma'; const value: string = '2.2';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'Gamma: 2.2';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0060: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.labeledValue(label, value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0060: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.labeledValue(label, value);
                await addLog(`testUtilsSuite11Case0060: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0060: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0061
         * @tc.name: testUtilsSuite11Case0061
         * @tc.desc: Verify StringFormatter.labeledValue over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0061', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0061', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const label: string = 'x'; const value: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'x: ';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0061: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.labeledValue(label, value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0061: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.labeledValue(label, value);
                await addLog(`testUtilsSuite11Case0061: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0061: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0062
         * @tc.name: testUtilsSuite11Case0062
         * @tc.desc: Verify StringFormatter.labeledValue over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0062', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0062', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const label: string = ''; const value: string = 'y';
                // Step 2: state the expected value from a local oracle.
                const expected: string = ': y';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0062: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.labeledValue(label, value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0062: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.labeledValue(label, value);
                await addLog(`testUtilsSuite11Case0062: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0062: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0063
         * @tc.name: testUtilsSuite11Case0063
         * @tc.desc: Verify StringFormatter.labeledValue over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0063', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0063', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const label: string = 'Area'; const value: string = '0.11';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'Area: 0.11';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0063: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.labeledValue(label, value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0063: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.labeledValue(label, value);
                await addLog(`testUtilsSuite11Case0063: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0063: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0064
         * @tc.name: testUtilsSuite11Case0064
         * @tc.desc: Verify StringFormatter.labeledValue over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0064', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0064', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const label: string = 'id'; const value: string = '01';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'id: 01';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0064: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.labeledValue(label, value);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0064: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.labeledValue(label, value);
                await addLog(`testUtilsSuite11Case0064: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0064: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0065
         * @tc.name: testUtilsSuite11Case0065
         * @tc.desc: Verify StringFormatter.maskMiddle over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0065', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0065', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1234567890'; const keep: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '12****90';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0065: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.maskMiddle(text, keep);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0065: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.maskMiddle(text, keep);
                await addLog(`testUtilsSuite11Case0065: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0065: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0066
         * @tc.name: testUtilsSuite11Case0066
         * @tc.desc: Verify StringFormatter.maskMiddle over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0066', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0066', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abc'; const keep: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'abc';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0066: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.maskMiddle(text, keep);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0066: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.maskMiddle(text, keep);
                await addLog(`testUtilsSuite11Case0066: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0066: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0067
         * @tc.name: testUtilsSuite11Case0067
         * @tc.desc: Verify StringFormatter.maskMiddle over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0067', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0067', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abcdef'; const keep: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'abcdef';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0067: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.maskMiddle(text, keep);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0067: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.maskMiddle(text, keep);
                await addLog(`testUtilsSuite11Case0067: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0067: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0068
         * @tc.name: testUtilsSuite11Case0068
         * @tc.desc: Verify StringFormatter.maskMiddle over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0068', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0068', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abcdef'; const keep: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'ab****ef';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0068: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.maskMiddle(text, keep);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0068: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.maskMiddle(text, keep);
                await addLog(`testUtilsSuite11Case0068: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0068: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0069
         * @tc.name: testUtilsSuite11Case0069
         * @tc.desc: Verify StringFormatter.maskMiddle over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0069', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0069', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab'; const keep: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'ab';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0069: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.maskMiddle(text, keep);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0069: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.maskMiddle(text, keep);
                await addLog(`testUtilsSuite11Case0069: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0069: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0070
         * @tc.name: testUtilsSuite11Case0070
         * @tc.desc: Verify StringFormatter.maskMiddle over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0070', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0070', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abcdefg'; const keep: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'abc****efg';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0070: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.maskMiddle(text, keep);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0070: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.maskMiddle(text, keep);
                await addLog(`testUtilsSuite11Case0070: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0070: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0071
         * @tc.name: testUtilsSuite11Case0071
         * @tc.desc: Verify StringFormatter.maskMiddle over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0071', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0071', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1234'; const keep: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1****4';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0071: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.maskMiddle(text, keep);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0071: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.maskMiddle(text, keep);
                await addLog(`testUtilsSuite11Case0071: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0071: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0072
         * @tc.name: testUtilsSuite11Case0072
         * @tc.desc: Verify StringFormatter.maskMiddle over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0072', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0072', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'abcdef'; const keep: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '****';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0072: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.maskMiddle(text, keep);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0072: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.maskMiddle(text, keep);
                await addLog(`testUtilsSuite11Case0072: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0072: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0073
         * @tc.name: testUtilsSuite11Case0073
         * @tc.desc: Verify StringFormatter.ordinalText over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0073', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0073', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const position: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1st';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0073: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ordinalText(position);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0073: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ordinalText(position);
                await addLog(`testUtilsSuite11Case0073: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0073: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0074
         * @tc.name: testUtilsSuite11Case0074
         * @tc.desc: Verify StringFormatter.ordinalText over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0074', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0074', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const position: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '2nd';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0074: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ordinalText(position);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0074: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ordinalText(position);
                await addLog(`testUtilsSuite11Case0074: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0074: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0075
         * @tc.name: testUtilsSuite11Case0075
         * @tc.desc: Verify StringFormatter.ordinalText over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0075', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0075', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const position: number = 3;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '3rd';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0075: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ordinalText(position);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0075: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ordinalText(position);
                await addLog(`testUtilsSuite11Case0075: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0075: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0076
         * @tc.name: testUtilsSuite11Case0076
         * @tc.desc: Verify StringFormatter.ordinalText over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0076', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0076', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const position: number = 4;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '4th';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0076: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ordinalText(position);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0076: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ordinalText(position);
                await addLog(`testUtilsSuite11Case0076: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0076: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0077
         * @tc.name: testUtilsSuite11Case0077
         * @tc.desc: Verify StringFormatter.ordinalText over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0077', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0077', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const position: number = 11;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '11th';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0077: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ordinalText(position);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0077: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ordinalText(position);
                await addLog(`testUtilsSuite11Case0077: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0077: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0078
         * @tc.name: testUtilsSuite11Case0078
         * @tc.desc: Verify StringFormatter.ordinalText over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0078', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0078', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const position: number = 12;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '12th';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0078: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ordinalText(position);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0078: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ordinalText(position);
                await addLog(`testUtilsSuite11Case0078: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0078: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0079
         * @tc.name: testUtilsSuite11Case0079
         * @tc.desc: Verify StringFormatter.ordinalText over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0079', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0079', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const position: number = 13;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '13th';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0079: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ordinalText(position);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0079: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ordinalText(position);
                await addLog(`testUtilsSuite11Case0079: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0079: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0080
         * @tc.name: testUtilsSuite11Case0080
         * @tc.desc: Verify StringFormatter.ordinalText over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0080', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0080', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const position: number = 21;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '21st';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0080: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.ordinalText(position);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0080: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.ordinalText(position);
                await addLog(`testUtilsSuite11Case0080: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0080: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0081
         * @tc.name: testUtilsSuite11Case0081
         * @tc.desc: Verify StringFormatter.quoted over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0081', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0081', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '"a"';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0081: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.quoted(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0081: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.quoted(text);
                await addLog(`testUtilsSuite11Case0081: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0081: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0082
         * @tc.name: testUtilsSuite11Case0082
         * @tc.desc: Verify StringFormatter.quoted over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0082', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0082', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '""';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0082: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.quoted(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0082: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.quoted(text);
                await addLog(`testUtilsSuite11Case0082: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0082: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0083
         * @tc.name: testUtilsSuite11Case0083
         * @tc.desc: Verify StringFormatter.quoted over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0083', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0083', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '"ab"';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0083: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.quoted(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0083: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.quoted(text);
                await addLog(`testUtilsSuite11Case0083: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0083: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0084
         * @tc.name: testUtilsSuite11Case0084
         * @tc.desc: Verify StringFormatter.quoted over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0084', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0084', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = ' ';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '" "';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0084: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.quoted(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0084: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.quoted(text);
                await addLog(`testUtilsSuite11Case0084: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0084: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0085
         * @tc.name: testUtilsSuite11Case0085
         * @tc.desc: Verify StringFormatter.quoted over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0085', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0085', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '"1"';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0085: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.quoted(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0085: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.quoted(text);
                await addLog(`testUtilsSuite11Case0085: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0085: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0086
         * @tc.name: testUtilsSuite11Case0086
         * @tc.desc: Verify StringFormatter.quoted over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0086', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0086', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '"x"';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '""x""';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0086: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.quoted(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0086: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.quoted(text);
                await addLog(`testUtilsSuite11Case0086: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0086: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0087
         * @tc.name: testUtilsSuite11Case0087
         * @tc.desc: Verify StringFormatter.quoted over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0087', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0087', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'Ω';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '"Ω"';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0087: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.quoted(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0087: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.quoted(text);
                await addLog(`testUtilsSuite11Case0087: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0087: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0088
         * @tc.name: testUtilsSuite11Case0088
         * @tc.desc: Verify StringFormatter.quoted over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0088', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0088', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a b';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '"a b"';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0088: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.quoted(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0088: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.quoted(text);
                await addLog(`testUtilsSuite11Case0088: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0088: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0089
         * @tc.name: testUtilsSuite11Case0089
         * @tc.desc: Verify StringFormatter.titleCase over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0089', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0089', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'hello world';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'Hello World';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0089: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.titleCase(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0089: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.titleCase(text);
                await addLog(`testUtilsSuite11Case0089: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0089: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0090
         * @tc.name: testUtilsSuite11Case0090
         * @tc.desc: Verify StringFormatter.titleCase over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0090', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0090', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0090: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.titleCase(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0090: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.titleCase(text);
                await addLog(`testUtilsSuite11Case0090: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0090: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0091
         * @tc.name: testUtilsSuite11Case0091
         * @tc.desc: Verify StringFormatter.titleCase over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0091', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0091', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ABC';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'Abc';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0091: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.titleCase(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0091: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.titleCase(text);
                await addLog(`testUtilsSuite11Case0091: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0091: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0092
         * @tc.name: testUtilsSuite11Case0092
         * @tc.desc: Verify StringFormatter.titleCase over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0092', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0092', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a b';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'A B';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0092: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.titleCase(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0092: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.titleCase(text);
                await addLog(`testUtilsSuite11Case0092: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0092: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0093
         * @tc.name: testUtilsSuite11Case0093
         * @tc.desc: Verify StringFormatter.titleCase over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0093', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0093', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '  ';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '  ';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0093: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.titleCase(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0093: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.titleCase(text);
                await addLog(`testUtilsSuite11Case0093: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0093: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0094
         * @tc.name: testUtilsSuite11Case0094
         * @tc.desc: Verify StringFormatter.titleCase over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0094', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0094', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'x';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'X';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0094: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.titleCase(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0094: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.titleCase(text);
                await addLog(`testUtilsSuite11Case0094: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0094: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0095
         * @tc.name: testUtilsSuite11Case0095
         * @tc.desc: Verify StringFormatter.titleCase over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0095', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0095', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'hello  world';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'Hello  World';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0095: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.titleCase(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0095: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.titleCase(text);
                await addLog(`testUtilsSuite11Case0095: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0095: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0096
         * @tc.name: testUtilsSuite11Case0096
         * @tc.desc: Verify StringFormatter.titleCase over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0096', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0096', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'aBC dEF';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'Abc Def';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0096: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.titleCase(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0096: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.titleCase(text);
                await addLog(`testUtilsSuite11Case0096: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0096: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0097
         * @tc.name: testUtilsSuite11Case0097
         * @tc.desc: Verify StringFormatter.toPercentText over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0097', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0097', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const ratio: number = 0.5;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '50.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0097: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.toPercentText(ratio);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0097: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.toPercentText(ratio);
                await addLog(`testUtilsSuite11Case0097: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0097: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0098
         * @tc.name: testUtilsSuite11Case0098
         * @tc.desc: Verify StringFormatter.toPercentText over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0098', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0098', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const ratio: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '0.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0098: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.toPercentText(ratio);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0098: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.toPercentText(ratio);
                await addLog(`testUtilsSuite11Case0098: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0098: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0099
         * @tc.name: testUtilsSuite11Case0099
         * @tc.desc: Verify StringFormatter.toPercentText over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0099', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0099', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const ratio: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '100.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0099: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.toPercentText(ratio);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0099: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.toPercentText(ratio);
                await addLog(`testUtilsSuite11Case0099: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0099: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0100
         * @tc.name: testUtilsSuite11Case0100
         * @tc.desc: Verify StringFormatter.toPercentText over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0100', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0100', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const ratio: number = 0.25;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '25.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0100: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.toPercentText(ratio);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0100: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.toPercentText(ratio);
                await addLog(`testUtilsSuite11Case0100: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0100: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0101
         * @tc.name: testUtilsSuite11Case0101
         * @tc.desc: Verify StringFormatter.toPercentText over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0101', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0101', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const ratio: number = 0.123;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '12.3%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0101: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.toPercentText(ratio);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0101: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.toPercentText(ratio);
                await addLog(`testUtilsSuite11Case0101: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0101: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0102
         * @tc.name: testUtilsSuite11Case0102
         * @tc.desc: Verify StringFormatter.toPercentText over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0102', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0102', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const ratio: number = 2;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '200.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0102: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.toPercentText(ratio);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0102: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.toPercentText(ratio);
                await addLog(`testUtilsSuite11Case0102: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0102: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0103
         * @tc.name: testUtilsSuite11Case0103
         * @tc.desc: Verify StringFormatter.toPercentText over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0103', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0103', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const ratio: number = -0.5;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '-50.0%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0103: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.toPercentText(ratio);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0103: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.toPercentText(ratio);
                await addLog(`testUtilsSuite11Case0103: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0103: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0104
         * @tc.name: testUtilsSuite11Case0104
         * @tc.desc: Verify StringFormatter.toPercentText over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0104', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0104', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const ratio: number = 0.001;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '0.1%';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0104: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.toPercentText(ratio);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0104: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.toPercentText(ratio);
                await addLog(`testUtilsSuite11Case0104: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0104: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0105
         * @tc.name: testUtilsSuite11Case0105
         * @tc.desc: Verify StringFormatter.wrapBrackets over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0105', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0105', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '(a)';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0105: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.wrapBrackets(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0105: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.wrapBrackets(text);
                await addLog(`testUtilsSuite11Case0105: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0105: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0106
         * @tc.name: testUtilsSuite11Case0106
         * @tc.desc: Verify StringFormatter.wrapBrackets over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0106', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0106', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '()';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0106: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.wrapBrackets(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0106: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.wrapBrackets(text);
                await addLog(`testUtilsSuite11Case0106: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0106: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0107
         * @tc.name: testUtilsSuite11Case0107
         * @tc.desc: Verify StringFormatter.wrapBrackets over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0107', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0107', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '(ab)';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0107: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.wrapBrackets(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0107: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.wrapBrackets(text);
                await addLog(`testUtilsSuite11Case0107: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0107: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0108
         * @tc.name: testUtilsSuite11Case0108
         * @tc.desc: Verify StringFormatter.wrapBrackets over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0108', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0108', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = ' ';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '( )';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0108: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.wrapBrackets(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0108: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.wrapBrackets(text);
                await addLog(`testUtilsSuite11Case0108: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0108: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0109
         * @tc.name: testUtilsSuite11Case0109
         * @tc.desc: Verify StringFormatter.wrapBrackets over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0109', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0109', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '1';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '(1)';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0109: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.wrapBrackets(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0109: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.wrapBrackets(text);
                await addLog(`testUtilsSuite11Case0109: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0109: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0110
         * @tc.name: testUtilsSuite11Case0110
         * @tc.desc: Verify StringFormatter.wrapBrackets over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0110', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0110', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '(x)';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '((x))';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0110: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.wrapBrackets(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0110: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.wrapBrackets(text);
                await addLog(`testUtilsSuite11Case0110: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0110: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0111
         * @tc.name: testUtilsSuite11Case0111
         * @tc.desc: Verify StringFormatter.wrapBrackets over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0111', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0111', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'Ω';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '(Ω)';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0111: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.wrapBrackets(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0111: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.wrapBrackets(text);
                await addLog(`testUtilsSuite11Case0111: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0111: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0112
         * @tc.name: testUtilsSuite11Case0112
         * @tc.desc: Verify StringFormatter.wrapBrackets over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0112', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0112', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a b';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '(a b)';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0112: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.wrapBrackets(text);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0112: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.wrapBrackets(text);
                await addLog(`testUtilsSuite11Case0112: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0112: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0113
         * @tc.name: testUtilsSuite11Case0113
         * @tc.desc: Verify StringFormatter.millisToSecondText over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0113', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0113', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const millis: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '0.0 s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0113: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.millisToSecondText(millis);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0113: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.millisToSecondText(millis);
                await addLog(`testUtilsSuite11Case0113: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0113: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0114
         * @tc.name: testUtilsSuite11Case0114
         * @tc.desc: Verify StringFormatter.millisToSecondText over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0114', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0114', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const millis: number = 1000;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1.0 s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0114: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.millisToSecondText(millis);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0114: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.millisToSecondText(millis);
                await addLog(`testUtilsSuite11Case0114: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0114: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0115
         * @tc.name: testUtilsSuite11Case0115
         * @tc.desc: Verify StringFormatter.millisToSecondText over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0115', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0115', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const millis: number = 500;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '0.5 s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0115: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.millisToSecondText(millis);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0115: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.millisToSecondText(millis);
                await addLog(`testUtilsSuite11Case0115: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0115: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0116
         * @tc.name: testUtilsSuite11Case0116
         * @tc.desc: Verify StringFormatter.millisToSecondText over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0116', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0116', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const millis: number = 2500;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '2.5 s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0116: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.millisToSecondText(millis);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0116: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.millisToSecondText(millis);
                await addLog(`testUtilsSuite11Case0116: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0116: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0117
         * @tc.name: testUtilsSuite11Case0117
         * @tc.desc: Verify StringFormatter.millisToSecondText over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0117', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0117', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const millis: number = 1234;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '1.2 s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0117: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.millisToSecondText(millis);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0117: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.millisToSecondText(millis);
                await addLog(`testUtilsSuite11Case0117: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0117: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0118
         * @tc.name: testUtilsSuite11Case0118
         * @tc.desc: Verify StringFormatter.millisToSecondText over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0118', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0118', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const millis: number = 100;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '0.1 s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0118: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.millisToSecondText(millis);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0118: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.millisToSecondText(millis);
                await addLog(`testUtilsSuite11Case0118: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0118: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0119
         * @tc.name: testUtilsSuite11Case0119
         * @tc.desc: Verify StringFormatter.millisToSecondText over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0119', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0119', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const millis: number = 10000;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '10.0 s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0119: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.millisToSecondText(millis);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0119: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.millisToSecondText(millis);
                await addLog(`testUtilsSuite11Case0119: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0119: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0120
         * @tc.name: testUtilsSuite11Case0120
         * @tc.desc: Verify StringFormatter.millisToSecondText over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0120', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0120', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const millis: number = -500;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '-0.5 s';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0120: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.millisToSecondText(millis);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0120: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.millisToSecondText(millis);
                await addLog(`testUtilsSuite11Case0120: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0120: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0121
         * @tc.name: testUtilsSuite11Case0121
         * @tc.desc: Verify StringFormatter.repeatWith over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0121', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0121', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a'; const times: number = 3; const separator: string = '-';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'a-a-a';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0121: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.repeatWith(text, times, separator);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0121: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.repeatWith(text, times, separator);
                await addLog(`testUtilsSuite11Case0121: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0121: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0122
         * @tc.name: testUtilsSuite11Case0122
         * @tc.desc: Verify StringFormatter.repeatWith over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0122', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0122', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a'; const times: number = 0; const separator: string = '-';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0122: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.repeatWith(text, times, separator);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0122: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.repeatWith(text, times, separator);
                await addLog(`testUtilsSuite11Case0122: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0122: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0123
         * @tc.name: testUtilsSuite11Case0123
         * @tc.desc: Verify StringFormatter.repeatWith over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0123', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0123', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab'; const times: number = 2; const separator: string = ',';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'ab,ab';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0123: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.repeatWith(text, times, separator);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0123: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.repeatWith(text, times, separator);
                await addLog(`testUtilsSuite11Case0123: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0123: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0124
         * @tc.name: testUtilsSuite11Case0124
         * @tc.desc: Verify StringFormatter.repeatWith over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0124', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0124', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'x'; const times: number = 1; const separator: string = '|';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'x';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0124: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.repeatWith(text, times, separator);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0124: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.repeatWith(text, times, separator);
                await addLog(`testUtilsSuite11Case0124: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0124: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0125
         * @tc.name: testUtilsSuite11Case0125
         * @tc.desc: Verify StringFormatter.repeatWith over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0125', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0125', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a'; const times: number = 3; const separator: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'aaa';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0125: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.repeatWith(text, times, separator);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0125: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.repeatWith(text, times, separator);
                await addLog(`testUtilsSuite11Case0125: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0125: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0126
         * @tc.name: testUtilsSuite11Case0126
         * @tc.desc: Verify StringFormatter.repeatWith over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0126', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0126', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = '-'; const times: number = 2; const separator: string = '-';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '---';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0126: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.repeatWith(text, times, separator);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0126: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.repeatWith(text, times, separator);
                await addLog(`testUtilsSuite11Case0126: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0126: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0127
         * @tc.name: testUtilsSuite11Case0127
         * @tc.desc: Verify StringFormatter.repeatWith over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0127', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0127', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'ab'; const times: number = 1; const separator: string = '::';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'ab';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0127: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.repeatWith(text, times, separator);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0127: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.repeatWith(text, times, separator);
                await addLog(`testUtilsSuite11Case0127: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0127: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S11_0128
         * @tc.name: testUtilsSuite11Case0128
         * @tc.desc: Verify StringFormatter.repeatWith over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite11Case0128', 0, async (done: Function) => {
            await runCase('testUtilsSuite11Case0128', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const text: string = 'a'; const times: number = 2; const separator: string = ' ';
                // Step 2: state the expected value from a local oracle.
                const expected: string = 'a a';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite11Case0128: expected=${JSON.stringify(expected)}`);
                const actual: string = StringFormatter.repeatWith(text, times, separator);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite11Case0128: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = StringFormatter.repeatWith(text, times, separator);
                await addLog(`testUtilsSuite11Case0128: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite11Case0128: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

    });
}
