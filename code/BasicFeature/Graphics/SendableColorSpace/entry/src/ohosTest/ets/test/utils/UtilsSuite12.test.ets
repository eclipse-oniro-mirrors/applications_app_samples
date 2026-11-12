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
import { ColorUtils } from '../../../../main/ets/common/utils/ColorUtils';
import { addLog, runCase } from '../../testkit/SharedDriver';

/**
 * ColorUtils utility suite.
 *
 * Every method of the class is expanded over the same pooled input set, and every case
 * compares the returned value against a locally stated expectation.
 */
export default function utilsSuite12(): void {
    describe('UtilsSuite12', () => {

        /*
         * @tc.number: SUB_CS_UTIL_S12_0001
         * @tc.name: testUtilsSuite12Case0001
         * @tc.desc: Verify ColorUtils.hexToR over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0001', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0001', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FF8800';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 255;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0001: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToR(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0001: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToR(hex);
                await addLog(`testUtilsSuite12Case0001: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0001: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0002
         * @tc.name: testUtilsSuite12Case0002
         * @tc.desc: Verify ColorUtils.hexToR over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0002', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0002', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000000';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0002: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToR(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0002: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToR(hex);
                await addLog(`testUtilsSuite12Case0002: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0002: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0003
         * @tc.name: testUtilsSuite12Case0003
         * @tc.desc: Verify ColorUtils.hexToR over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0003', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0003', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FFFFFF';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 255;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0003: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToR(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0003: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToR(hex);
                await addLog(`testUtilsSuite12Case0003: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0003: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0004
         * @tc.name: testUtilsSuite12Case0004
         * @tc.desc: Verify ColorUtils.hexToR over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0004', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0004', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#808080';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 128;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0004: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToR(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0004: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToR(hex);
                await addLog(`testUtilsSuite12Case0004: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0004: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0005
         * @tc.name: testUtilsSuite12Case0005
         * @tc.desc: Verify ColorUtils.hexToR over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0005', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0005', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123456';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 18;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0005: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToR(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0005: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToR(hex);
                await addLog(`testUtilsSuite12Case0005: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0005: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0006
         * @tc.name: testUtilsSuite12Case0006
         * @tc.desc: Verify ColorUtils.hexToR over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0006', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0006', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#ABCDEF';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 171;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0006: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToR(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0006: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToR(hex);
                await addLog(`testUtilsSuite12Case0006: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0006: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0007
         * @tc.name: testUtilsSuite12Case0007
         * @tc.desc: Verify ColorUtils.hexToR over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0007', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0007', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#0A141F';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 10;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0007: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToR(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0007: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToR(hex);
                await addLog(`testUtilsSuite12Case0007: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0007: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0008
         * @tc.name: testUtilsSuite12Case0008
         * @tc.desc: Verify ColorUtils.hexToR over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0008', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0008', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FEDCBA';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 254;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0008: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToR(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0008: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToR(hex);
                await addLog(`testUtilsSuite12Case0008: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0008: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0009
         * @tc.name: testUtilsSuite12Case0009
         * @tc.desc: Verify ColorUtils.hexToG over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0009', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0009', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FF8800';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 136;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0009: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToG(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0009: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToG(hex);
                await addLog(`testUtilsSuite12Case0009: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0009: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0010
         * @tc.name: testUtilsSuite12Case0010
         * @tc.desc: Verify ColorUtils.hexToG over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0010', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0010', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000000';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0010: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToG(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0010: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToG(hex);
                await addLog(`testUtilsSuite12Case0010: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0010: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0011
         * @tc.name: testUtilsSuite12Case0011
         * @tc.desc: Verify ColorUtils.hexToG over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0011', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0011', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FFFFFF';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 255;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0011: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToG(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0011: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToG(hex);
                await addLog(`testUtilsSuite12Case0011: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0011: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0012
         * @tc.name: testUtilsSuite12Case0012
         * @tc.desc: Verify ColorUtils.hexToG over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0012', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0012', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#808080';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 128;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0012: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToG(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0012: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToG(hex);
                await addLog(`testUtilsSuite12Case0012: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0012: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0013
         * @tc.name: testUtilsSuite12Case0013
         * @tc.desc: Verify ColorUtils.hexToG over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0013', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0013', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123456';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 52;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0013: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToG(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0013: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToG(hex);
                await addLog(`testUtilsSuite12Case0013: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0013: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0014
         * @tc.name: testUtilsSuite12Case0014
         * @tc.desc: Verify ColorUtils.hexToG over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0014', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0014', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#ABCDEF';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 205;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0014: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToG(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0014: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToG(hex);
                await addLog(`testUtilsSuite12Case0014: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0014: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0015
         * @tc.name: testUtilsSuite12Case0015
         * @tc.desc: Verify ColorUtils.hexToG over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0015', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0015', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#0A141F';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 20;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0015: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToG(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0015: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToG(hex);
                await addLog(`testUtilsSuite12Case0015: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0015: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0016
         * @tc.name: testUtilsSuite12Case0016
         * @tc.desc: Verify ColorUtils.hexToG over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0016', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0016', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FEDCBA';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 220;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0016: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToG(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0016: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToG(hex);
                await addLog(`testUtilsSuite12Case0016: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0016: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0017
         * @tc.name: testUtilsSuite12Case0017
         * @tc.desc: Verify ColorUtils.hexToB over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0017', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0017', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FF8800';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0017: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToB(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0017: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToB(hex);
                await addLog(`testUtilsSuite12Case0017: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0017: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0018
         * @tc.name: testUtilsSuite12Case0018
         * @tc.desc: Verify ColorUtils.hexToB over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0018', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0018', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000000';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0018: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToB(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0018: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToB(hex);
                await addLog(`testUtilsSuite12Case0018: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0018: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0019
         * @tc.name: testUtilsSuite12Case0019
         * @tc.desc: Verify ColorUtils.hexToB over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0019', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0019', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FFFFFF';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 255;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0019: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToB(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0019: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToB(hex);
                await addLog(`testUtilsSuite12Case0019: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0019: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0020
         * @tc.name: testUtilsSuite12Case0020
         * @tc.desc: Verify ColorUtils.hexToB over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0020', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0020', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#808080';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 128;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0020: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToB(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0020: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToB(hex);
                await addLog(`testUtilsSuite12Case0020: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0020: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0021
         * @tc.name: testUtilsSuite12Case0021
         * @tc.desc: Verify ColorUtils.hexToB over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0021', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0021', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123456';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 86;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0021: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToB(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0021: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToB(hex);
                await addLog(`testUtilsSuite12Case0021: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0021: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0022
         * @tc.name: testUtilsSuite12Case0022
         * @tc.desc: Verify ColorUtils.hexToB over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0022', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0022', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#ABCDEF';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 239;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0022: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToB(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0022: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToB(hex);
                await addLog(`testUtilsSuite12Case0022: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0022: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0023
         * @tc.name: testUtilsSuite12Case0023
         * @tc.desc: Verify ColorUtils.hexToB over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0023', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0023', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#0A141F';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 31;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0023: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToB(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0023: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToB(hex);
                await addLog(`testUtilsSuite12Case0023: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0023: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0024
         * @tc.name: testUtilsSuite12Case0024
         * @tc.desc: Verify ColorUtils.hexToB over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0024', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0024', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FEDCBA';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 186;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0024: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexToB(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0024: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexToB(hex);
                await addLog(`testUtilsSuite12Case0024: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0024: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0025
         * @tc.name: testUtilsSuite12Case0025
         * @tc.desc: Verify ColorUtils.channelSum over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0025', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0025', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FF8800';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 391;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0025: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.channelSum(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0025: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.channelSum(hex);
                await addLog(`testUtilsSuite12Case0025: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0025: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0026
         * @tc.name: testUtilsSuite12Case0026
         * @tc.desc: Verify ColorUtils.channelSum over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0026', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0026', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000000';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0026: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.channelSum(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0026: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.channelSum(hex);
                await addLog(`testUtilsSuite12Case0026: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0026: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0027
         * @tc.name: testUtilsSuite12Case0027
         * @tc.desc: Verify ColorUtils.channelSum over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0027', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0027', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FFFFFF';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 765;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0027: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.channelSum(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0027: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.channelSum(hex);
                await addLog(`testUtilsSuite12Case0027: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0027: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0028
         * @tc.name: testUtilsSuite12Case0028
         * @tc.desc: Verify ColorUtils.channelSum over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0028', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0028', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#808080';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 384;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0028: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.channelSum(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0028: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.channelSum(hex);
                await addLog(`testUtilsSuite12Case0028: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0028: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0029
         * @tc.name: testUtilsSuite12Case0029
         * @tc.desc: Verify ColorUtils.channelSum over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0029', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0029', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123456';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 156;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0029: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.channelSum(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0029: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.channelSum(hex);
                await addLog(`testUtilsSuite12Case0029: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0029: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0030
         * @tc.name: testUtilsSuite12Case0030
         * @tc.desc: Verify ColorUtils.channelSum over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0030', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0030', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#ABCDEF';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 615;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0030: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.channelSum(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0030: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.channelSum(hex);
                await addLog(`testUtilsSuite12Case0030: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0030: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0031
         * @tc.name: testUtilsSuite12Case0031
         * @tc.desc: Verify ColorUtils.channelSum over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0031', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0031', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#0A141F';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 61;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0031: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.channelSum(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0031: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.channelSum(hex);
                await addLog(`testUtilsSuite12Case0031: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0031: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0032
         * @tc.name: testUtilsSuite12Case0032
         * @tc.desc: Verify ColorUtils.channelSum over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0032', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0032', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FEDCBA';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 660;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0032: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.channelSum(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0032: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.channelSum(hex);
                await addLog(`testUtilsSuite12Case0032: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0032: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0033
         * @tc.name: testUtilsSuite12Case0033
         * @tc.desc: Verify ColorUtils.darkenBy over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0033', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0033', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FFFFFF'; const amount: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#FFFFFF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0033: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.darkenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0033: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.darkenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0033: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0033: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0034
         * @tc.name: testUtilsSuite12Case0034
         * @tc.desc: Verify ColorUtils.darkenBy over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0034', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0034', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FFFFFF'; const amount: number = 255;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#000000';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0034: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.darkenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0034: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.darkenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0034: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0034: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0035
         * @tc.name: testUtilsSuite12Case0035
         * @tc.desc: Verify ColorUtils.darkenBy over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0035', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0035', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#808080'; const amount: number = 64;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#404040';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0035: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.darkenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0035: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.darkenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0035: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0035: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0036
         * @tc.name: testUtilsSuite12Case0036
         * @tc.desc: Verify ColorUtils.darkenBy over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0036', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0036', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FF0000'; const amount: number = 200;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#370000';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0036: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.darkenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0036: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.darkenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0036: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0036: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0037
         * @tc.name: testUtilsSuite12Case0037
         * @tc.desc: Verify ColorUtils.darkenBy over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0037', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0037', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000000'; const amount: number = 10;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#000000';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0037: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.darkenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0037: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.darkenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0037: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0037: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0038
         * @tc.name: testUtilsSuite12Case0038
         * @tc.desc: Verify ColorUtils.darkenBy over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0038', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0038', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123456'; const amount: number = 16;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#022446';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0038: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.darkenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0038: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.darkenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0038: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0038: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0039
         * @tc.name: testUtilsSuite12Case0039
         * @tc.desc: Verify ColorUtils.darkenBy over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0039', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0039', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#0A141F'; const amount: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#050F1A';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0039: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.darkenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0039: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.darkenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0039: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0039: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0040
         * @tc.name: testUtilsSuite12Case0040
         * @tc.desc: Verify ColorUtils.darkenBy over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0040', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0040', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#7F7F7F'; const amount: number = 127;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#000000';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0040: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.darkenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0040: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.darkenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0040: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0040: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0041
         * @tc.name: testUtilsSuite12Case0041
         * @tc.desc: Verify ColorUtils.lightenBy over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0041', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0041', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000000'; const amount: number = 255;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#FFFFFF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0041: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.lightenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0041: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.lightenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0041: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0041: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0042
         * @tc.name: testUtilsSuite12Case0042
         * @tc.desc: Verify ColorUtils.lightenBy over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0042', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0042', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000000'; const amount: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#000000';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0042: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.lightenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0042: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.lightenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0042: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0042: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0043
         * @tc.name: testUtilsSuite12Case0043
         * @tc.desc: Verify ColorUtils.lightenBy over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0043', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0043', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#808080'; const amount: number = 64;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#C0C0C0';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0043: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.lightenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0043: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.lightenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0043: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0043: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0044
         * @tc.name: testUtilsSuite12Case0044
         * @tc.desc: Verify ColorUtils.lightenBy over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0044', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0044', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FF0000'; const amount: number = 10;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#FF0A0A';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0044: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.lightenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0044: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.lightenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0044: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0044: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0045
         * @tc.name: testUtilsSuite12Case0045
         * @tc.desc: Verify ColorUtils.lightenBy over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0045', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0045', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FFFFFF'; const amount: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#FFFFFF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0045: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.lightenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0045: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.lightenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0045: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0045: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0046
         * @tc.name: testUtilsSuite12Case0046
         * @tc.desc: Verify ColorUtils.lightenBy over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0046', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0046', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123456'; const amount: number = 16;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#224466';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0046: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.lightenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0046: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.lightenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0046: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0046: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0047
         * @tc.name: testUtilsSuite12Case0047
         * @tc.desc: Verify ColorUtils.lightenBy over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0047', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0047', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#0A141F'; const amount: number = 5;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#0F1924';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0047: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.lightenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0047: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.lightenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0047: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0047: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0048
         * @tc.name: testUtilsSuite12Case0048
         * @tc.desc: Verify ColorUtils.lightenBy over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0048', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0048', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#7F7F7F'; const amount: number = 128;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#FFFFFF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0048: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.lightenBy(hex, amount);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0048: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.lightenBy(hex, amount);
                await addLog(`testUtilsSuite12Case0048: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0048: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0049
         * @tc.name: testUtilsSuite12Case0049
         * @tc.desc: Verify ColorUtils.hexDistance over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0049', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0049', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: string = '#000000'; const second: string = '#000000';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0049: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexDistance(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0049: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexDistance(first, second);
                await addLog(`testUtilsSuite12Case0049: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0049: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0050
         * @tc.name: testUtilsSuite12Case0050
         * @tc.desc: Verify ColorUtils.hexDistance over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0050', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0050', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: string = '#000000'; const second: string = '#FFFFFF';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 442;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0050: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexDistance(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0050: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexDistance(first, second);
                await addLog(`testUtilsSuite12Case0050: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0050: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0051
         * @tc.name: testUtilsSuite12Case0051
         * @tc.desc: Verify ColorUtils.hexDistance over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0051', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0051', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: string = '#FF0000'; const second: string = '#000000';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 255;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0051: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexDistance(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0051: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexDistance(first, second);
                await addLog(`testUtilsSuite12Case0051: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0051: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0052
         * @tc.name: testUtilsSuite12Case0052
         * @tc.desc: Verify ColorUtils.hexDistance over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0052', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0052', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: string = '#00FF00'; const second: string = '#000000';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 255;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0052: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexDistance(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0052: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexDistance(first, second);
                await addLog(`testUtilsSuite12Case0052: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0052: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0053
         * @tc.name: testUtilsSuite12Case0053
         * @tc.desc: Verify ColorUtils.hexDistance over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0053', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0053', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: string = '#0000FF'; const second: string = '#000000';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 255;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0053: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexDistance(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0053: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexDistance(first, second);
                await addLog(`testUtilsSuite12Case0053: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0053: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0054
         * @tc.name: testUtilsSuite12Case0054
         * @tc.desc: Verify ColorUtils.hexDistance over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0054', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0054', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: string = '#808080'; const second: string = '#7F7F7F';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 2;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0054: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexDistance(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0054: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexDistance(first, second);
                await addLog(`testUtilsSuite12Case0054: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0054: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0055
         * @tc.name: testUtilsSuite12Case0055
         * @tc.desc: Verify ColorUtils.hexDistance over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0055', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0055', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: string = '#123456'; const second: string = '#654321';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 100;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0055: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexDistance(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0055: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexDistance(first, second);
                await addLog(`testUtilsSuite12Case0055: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0055: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0056
         * @tc.name: testUtilsSuite12Case0056
         * @tc.desc: Verify ColorUtils.hexDistance over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0056', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0056', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const first: string = '#FFFFFF'; const second: string = '#FFFFFF';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0056: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.hexDistance(first, second);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0056: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.hexDistance(first, second);
                await addLog(`testUtilsSuite12Case0056: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0056: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0057
         * @tc.name: testUtilsSuite12Case0057
         * @tc.desc: Verify ColorUtils.invert over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0057', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0057', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000000';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#FFFFFF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0057: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.invert(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0057: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.invert(hex);
                await addLog(`testUtilsSuite12Case0057: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0057: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0058
         * @tc.name: testUtilsSuite12Case0058
         * @tc.desc: Verify ColorUtils.invert over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0058', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0058', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FFFFFF';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#000000';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0058: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.invert(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0058: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.invert(hex);
                await addLog(`testUtilsSuite12Case0058: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0058: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0059
         * @tc.name: testUtilsSuite12Case0059
         * @tc.desc: Verify ColorUtils.invert over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0059', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0059', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FF0000';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#00FFFF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0059: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.invert(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0059: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.invert(hex);
                await addLog(`testUtilsSuite12Case0059: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0059: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0060
         * @tc.name: testUtilsSuite12Case0060
         * @tc.desc: Verify ColorUtils.invert over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0060', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0060', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123456';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#EDCBA9';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0060: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.invert(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0060: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.invert(hex);
                await addLog(`testUtilsSuite12Case0060: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0060: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0061
         * @tc.name: testUtilsSuite12Case0061
         * @tc.desc: Verify ColorUtils.invert over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0061', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0061', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#808080';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#7F7F7F';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0061: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.invert(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0061: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.invert(hex);
                await addLog(`testUtilsSuite12Case0061: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0061: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0062
         * @tc.name: testUtilsSuite12Case0062
         * @tc.desc: Verify ColorUtils.invert over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0062', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0062', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#010203';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#FEFDFC';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0062: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.invert(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0062: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.invert(hex);
                await addLog(`testUtilsSuite12Case0062: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0062: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0063
         * @tc.name: testUtilsSuite12Case0063
         * @tc.desc: Verify ColorUtils.invert over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0063', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0063', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FEDCBA';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#012345';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0063: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.invert(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0063: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.invert(hex);
                await addLog(`testUtilsSuite12Case0063: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0063: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0064
         * @tc.name: testUtilsSuite12Case0064
         * @tc.desc: Verify ColorUtils.invert over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0064', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0064', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#0A141F';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#F5EBE0';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0064: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.invert(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0064: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.invert(hex);
                await addLog(`testUtilsSuite12Case0064: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0064: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0065
         * @tc.name: testUtilsSuite12Case0065
         * @tc.desc: Verify ColorUtils.isDark over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0065', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0065', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000000';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0065: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isDark(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0065: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isDark(hex);
                await addLog(`testUtilsSuite12Case0065: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0065: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0066
         * @tc.name: testUtilsSuite12Case0066
         * @tc.desc: Verify ColorUtils.isDark over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0066', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0066', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FFFFFF';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0066: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isDark(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0066: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isDark(hex);
                await addLog(`testUtilsSuite12Case0066: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0066: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0067
         * @tc.name: testUtilsSuite12Case0067
         * @tc.desc: Verify ColorUtils.isDark over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0067', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0067', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#808080';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0067: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isDark(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0067: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isDark(hex);
                await addLog(`testUtilsSuite12Case0067: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0067: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0068
         * @tc.name: testUtilsSuite12Case0068
         * @tc.desc: Verify ColorUtils.isDark over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0068', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0068', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#7F7F7F';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0068: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isDark(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0068: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isDark(hex);
                await addLog(`testUtilsSuite12Case0068: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0068: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0069
         * @tc.name: testUtilsSuite12Case0069
         * @tc.desc: Verify ColorUtils.isDark over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0069', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0069', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FF0000';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0069: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isDark(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0069: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isDark(hex);
                await addLog(`testUtilsSuite12Case0069: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0069: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0070
         * @tc.name: testUtilsSuite12Case0070
         * @tc.desc: Verify ColorUtils.isDark over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0070', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0070', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#00FF00';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0070: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isDark(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0070: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isDark(hex);
                await addLog(`testUtilsSuite12Case0070: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0070: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0071
         * @tc.name: testUtilsSuite12Case0071
         * @tc.desc: Verify ColorUtils.isDark over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0071', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0071', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#0000FF';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0071: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isDark(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0071: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isDark(hex);
                await addLog(`testUtilsSuite12Case0071: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0071: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0072
         * @tc.name: testUtilsSuite12Case0072
         * @tc.desc: Verify ColorUtils.isDark over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0072', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0072', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123456';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0072: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isDark(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0072: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isDark(hex);
                await addLog(`testUtilsSuite12Case0072: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0072: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0073
         * @tc.name: testUtilsSuite12Case0073
         * @tc.desc: Verify ColorUtils.isGray over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0073', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0073', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#808080';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0073: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isGray(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0073: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isGray(hex);
                await addLog(`testUtilsSuite12Case0073: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0073: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0074
         * @tc.name: testUtilsSuite12Case0074
         * @tc.desc: Verify ColorUtils.isGray over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0074', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0074', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#7F8081';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0074: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isGray(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0074: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isGray(hex);
                await addLog(`testUtilsSuite12Case0074: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0074: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0075
         * @tc.name: testUtilsSuite12Case0075
         * @tc.desc: Verify ColorUtils.isGray over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0075', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0075', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FF0000';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0075: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isGray(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0075: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isGray(hex);
                await addLog(`testUtilsSuite12Case0075: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0075: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0076
         * @tc.name: testUtilsSuite12Case0076
         * @tc.desc: Verify ColorUtils.isGray over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0076', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0076', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000000';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0076: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isGray(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0076: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isGray(hex);
                await addLog(`testUtilsSuite12Case0076: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0076: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0077
         * @tc.name: testUtilsSuite12Case0077
         * @tc.desc: Verify ColorUtils.isGray over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0077', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0077', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#010203';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0077: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isGray(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0077: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isGray(hex);
                await addLog(`testUtilsSuite12Case0077: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0077: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0078
         * @tc.name: testUtilsSuite12Case0078
         * @tc.desc: Verify ColorUtils.isGray over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0078', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0078', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FFFFFF';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0078: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isGray(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0078: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isGray(hex);
                await addLog(`testUtilsSuite12Case0078: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0078: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0079
         * @tc.name: testUtilsSuite12Case0079
         * @tc.desc: Verify ColorUtils.isGray over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0079', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0079', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#0A141F';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0079: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isGray(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0079: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isGray(hex);
                await addLog(`testUtilsSuite12Case0079: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0079: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0080
         * @tc.name: testUtilsSuite12Case0080
         * @tc.desc: Verify ColorUtils.isGray over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0080', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0080', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123456';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0080: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isGray(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0080: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isGray(hex);
                await addLog(`testUtilsSuite12Case0080: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0080: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0081
         * @tc.name: testUtilsSuite12Case0081
         * @tc.desc: Verify ColorUtils.isValidHex over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0081', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0081', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#abc';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0081: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isValidHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0081: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isValidHex(hex);
                await addLog(`testUtilsSuite12Case0081: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0081: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0082
         * @tc.name: testUtilsSuite12Case0082
         * @tc.desc: Verify ColorUtils.isValidHex over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0082', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0082', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#abcd';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0082: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isValidHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0082: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isValidHex(hex);
                await addLog(`testUtilsSuite12Case0082: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0082: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0083
         * @tc.name: testUtilsSuite12Case0083
         * @tc.desc: Verify ColorUtils.isValidHex over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0083', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0083', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#ABCDEF';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0083: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isValidHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0083: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isValidHex(hex);
                await addLog(`testUtilsSuite12Case0083: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0083: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0084
         * @tc.name: testUtilsSuite12Case0084
         * @tc.desc: Verify ColorUtils.isValidHex over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0084', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0084', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = 'ABCDEF';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0084: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isValidHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0084: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isValidHex(hex);
                await addLog(`testUtilsSuite12Case0084: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0084: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0085
         * @tc.name: testUtilsSuite12Case0085
         * @tc.desc: Verify ColorUtils.isValidHex over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0085', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0085', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '123';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0085: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isValidHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0085: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isValidHex(hex);
                await addLog(`testUtilsSuite12Case0085: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0085: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0086
         * @tc.name: testUtilsSuite12Case0086
         * @tc.desc: Verify ColorUtils.isValidHex over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0086', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0086', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#GGGGGG';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0086: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isValidHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0086: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isValidHex(hex);
                await addLog(`testUtilsSuite12Case0086: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0086: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0087
         * @tc.name: testUtilsSuite12Case0087
         * @tc.desc: Verify ColorUtils.isValidHex over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0087', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0087', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = false;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0087: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isValidHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0087: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isValidHex(hex);
                await addLog(`testUtilsSuite12Case0087: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0087: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0088
         * @tc.name: testUtilsSuite12Case0088
         * @tc.desc: Verify ColorUtils.isValidHex over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0088', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0088', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123456';
                // Step 2: state the expected value from a local oracle.
                const expected: boolean = true;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0088: expected=${JSON.stringify(expected)}`);
                const actual: boolean = ColorUtils.isValidHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0088: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: boolean = ColorUtils.isValidHex(hex);
                await addLog(`testUtilsSuite12Case0088: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0088: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0089
         * @tc.name: testUtilsSuite12Case0089
         * @tc.desc: Verify ColorUtils.luminance over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0089', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0089', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FFFFFF';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 255;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0089: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.luminance(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0089: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.luminance(hex);
                await addLog(`testUtilsSuite12Case0089: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0089: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0090
         * @tc.name: testUtilsSuite12Case0090
         * @tc.desc: Verify ColorUtils.luminance over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0090', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0090', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000000';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 0;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0090: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.luminance(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0090: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.luminance(hex);
                await addLog(`testUtilsSuite12Case0090: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0090: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0091
         * @tc.name: testUtilsSuite12Case0091
         * @tc.desc: Verify ColorUtils.luminance over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0091', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0091', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FF0000';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 76;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0091: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.luminance(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0091: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.luminance(hex);
                await addLog(`testUtilsSuite12Case0091: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0091: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0092
         * @tc.name: testUtilsSuite12Case0092
         * @tc.desc: Verify ColorUtils.luminance over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0092', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0092', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#00FF00';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 150;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0092: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.luminance(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0092: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.luminance(hex);
                await addLog(`testUtilsSuite12Case0092: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0092: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0093
         * @tc.name: testUtilsSuite12Case0093
         * @tc.desc: Verify ColorUtils.luminance over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0093', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0093', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#0000FF';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 29;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0093: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.luminance(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0093: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.luminance(hex);
                await addLog(`testUtilsSuite12Case0093: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0093: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0094
         * @tc.name: testUtilsSuite12Case0094
         * @tc.desc: Verify ColorUtils.luminance over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0094', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0094', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#808080';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 128;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0094: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.luminance(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0094: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.luminance(hex);
                await addLog(`testUtilsSuite12Case0094: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0094: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0095
         * @tc.name: testUtilsSuite12Case0095
         * @tc.desc: Verify ColorUtils.luminance over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0095', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0095', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FF8800';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 156;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0095: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.luminance(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0095: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.luminance(hex);
                await addLog(`testUtilsSuite12Case0095: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0095: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0096
         * @tc.name: testUtilsSuite12Case0096
         * @tc.desc: Verify ColorUtils.luminance over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0096', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0096', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123456';
                // Step 2: state the expected value from a local oracle.
                const expected: number = 46;
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0096: expected=${JSON.stringify(expected)}`);
                const actual: number = ColorUtils.luminance(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0096: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: number = ColorUtils.luminance(hex);
                await addLog(`testUtilsSuite12Case0096: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0096: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0097
         * @tc.name: testUtilsSuite12Case0097
         * @tc.desc: Verify ColorUtils.normalizeHex over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0097', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0097', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#abc';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#AABBCC';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0097: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.normalizeHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0097: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.normalizeHex(hex);
                await addLog(`testUtilsSuite12Case0097: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0097: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0098
         * @tc.name: testUtilsSuite12Case0098
         * @tc.desc: Verify ColorUtils.normalizeHex over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0098', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0098', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#ABC';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#AABBCC';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0098: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.normalizeHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0098: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.normalizeHex(hex);
                await addLog(`testUtilsSuite12Case0098: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0098: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0099
         * @tc.name: testUtilsSuite12Case0099
         * @tc.desc: Verify ColorUtils.normalizeHex over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0099', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0099', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#abcdef';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#ABCDEF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0099: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.normalizeHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0099: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.normalizeHex(hex);
                await addLog(`testUtilsSuite12Case0099: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0099: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0100
         * @tc.name: testUtilsSuite12Case0100
         * @tc.desc: Verify ColorUtils.normalizeHex over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0100', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0100', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#ABCDEF';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#ABCDEF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0100: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.normalizeHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0100: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.normalizeHex(hex);
                await addLog(`testUtilsSuite12Case0100: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0100: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0101
         * @tc.name: testUtilsSuite12Case0101
         * @tc.desc: Verify ColorUtils.normalizeHex over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0101', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0101', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = 'abcdef';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#ABCDEF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0101: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.normalizeHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0101: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.normalizeHex(hex);
                await addLog(`testUtilsSuite12Case0101: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0101: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0102
         * @tc.name: testUtilsSuite12Case0102
         * @tc.desc: Verify ColorUtils.normalizeHex over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0102', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0102', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#112233';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0102: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.normalizeHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0102: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.normalizeHex(hex);
                await addLog(`testUtilsSuite12Case0102: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0102: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0103
         * @tc.name: testUtilsSuite12Case0103
         * @tc.desc: Verify ColorUtils.normalizeHex over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0103', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0103', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#000000';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0103: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.normalizeHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0103: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.normalizeHex(hex);
                await addLog(`testUtilsSuite12Case0103: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0103: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0104
         * @tc.name: testUtilsSuite12Case0104
         * @tc.desc: Verify ColorUtils.normalizeHex over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0104', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0104', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#fff';
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#FFFFFF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0104: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.normalizeHex(hex);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0104: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.normalizeHex(hex);
                await addLog(`testUtilsSuite12Case0104: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0104: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0105
         * @tc.name: testUtilsSuite12Case0105
         * @tc.desc: Verify ColorUtils.toArgb over pooled input #1 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0105', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0105', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FF0000'; const alpha: number = 255;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#FFFF0000';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0105: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.toArgb(hex, alpha);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0105: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.toArgb(hex, alpha);
                await addLog(`testUtilsSuite12Case0105: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0105: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0106
         * @tc.name: testUtilsSuite12Case0106
         * @tc.desc: Verify ColorUtils.toArgb over pooled input #2 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0106', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0106', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#00FF00'; const alpha: number = 0;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#0000FF00';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0106: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.toArgb(hex, alpha);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0106: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.toArgb(hex, alpha);
                await addLog(`testUtilsSuite12Case0106: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0106: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0107
         * @tc.name: testUtilsSuite12Case0107
         * @tc.desc: Verify ColorUtils.toArgb over pooled input #3 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0107', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0107', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#0000FF'; const alpha: number = 128;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#800000FF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0107: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.toArgb(hex, alpha);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0107: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.toArgb(hex, alpha);
                await addLog(`testUtilsSuite12Case0107: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0107: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0108
         * @tc.name: testUtilsSuite12Case0108
         * @tc.desc: Verify ColorUtils.toArgb over pooled input #4 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0108', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0108', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#123456'; const alpha: number = 32;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#20123456';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0108: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.toArgb(hex, alpha);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0108: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.toArgb(hex, alpha);
                await addLog(`testUtilsSuite12Case0108: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0108: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0109
         * @tc.name: testUtilsSuite12Case0109
         * @tc.desc: Verify ColorUtils.toArgb over pooled input #5 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0109', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0109', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#FFFFFF'; const alpha: number = 100;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#64FFFFFF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0109: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.toArgb(hex, alpha);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0109: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.toArgb(hex, alpha);
                await addLog(`testUtilsSuite12Case0109: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0109: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0110
         * @tc.name: testUtilsSuite12Case0110
         * @tc.desc: Verify ColorUtils.toArgb over pooled input #6 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0110', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0110', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#000000'; const alpha: number = 1;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#01000000';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0110: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.toArgb(hex, alpha);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0110: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.toArgb(hex, alpha);
                await addLog(`testUtilsSuite12Case0110: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0110: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0111
         * @tc.name: testUtilsSuite12Case0111
         * @tc.desc: Verify ColorUtils.toArgb over pooled input #7 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0111', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0111', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#ABCDEF'; const alpha: number = 200;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#C8ABCDEF';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0111: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.toArgb(hex, alpha);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0111: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.toArgb(hex, alpha);
                await addLog(`testUtilsSuite12Case0111: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0111: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_S12_0112
         * @tc.name: testUtilsSuite12Case0112
         * @tc.desc: Verify ColorUtils.toArgb over pooled input #8 of the suite.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testUtilsSuite12Case0112', 0, async (done: Function) => {
            await runCase('testUtilsSuite12Case0112', async (): Promise<void> => {
                // Step 1: materialise the pooled literal used by this case.
                const hex: string = '#808080'; const alpha: number = 16;
                // Step 2: state the expected value from a local oracle.
                const expected: string = '#10808080';
                // Step 3: invoke the helper under test.
                await addLog(`testUtilsSuite12Case0112: expected=${JSON.stringify(expected)}`);
                const actual: string = ColorUtils.toArgb(hex, alpha);
                // Step 4: compare the value, the replay and the serialised form.
                await addLog(`testUtilsSuite12Case0112: actual=${JSON.stringify(actual)}`);
                expect(String(actual)).assertEqual(String(expected));
                const replayed: string = ColorUtils.toArgb(hex, alpha);
                await addLog(`testUtilsSuite12Case0112: replayed=${JSON.stringify(replayed)}`);
                expect(JSON.stringify(replayed)).assertEqual(JSON.stringify(actual));
                await addLog(`testUtilsSuite12Case0112: expected text=${String(expected)}`);
                expect(JSON.stringify(actual)).assertEqual(JSON.stringify(expected));
            }, done);
        });

    });
}
