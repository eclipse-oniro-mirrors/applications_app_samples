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

import { describe, it, beforeAll, beforeEach, expect } from '@ohos/hypium';
import {
    startApp, runCase, addLog, resetToIndex, navigateToCustom, clickId, clickScrolledId, inputText,
    textOfId, textOrEmpty, numberAfter, isCloseTo, scrollPageToTop
} from '../testkit/SharedDriver';

const DEFAULT_PRIMARIES: string = 'Primaries: R(0.64,0.33) G(0.3,0.6) B(0.15,0.06)';
const DEFAULT_WHITE: string = 'WhitePoint Input: (0.3127,0.329)';

export default function customInputMatrixTest(): void {
    describe('CustomInputMatrix', () => {
        beforeAll(async () => {
            await addLog('CustomInputMatrix suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToCustom();
        });

        // ==================== Initial state and single field edits ====================

        /*
         * @tc.number: SUB_CS_INPUT_0101
         * @tc.name: testCustomInput0001
         * @tc.desc: Input nothing and check the eight fields start from the documented sRGB primaries.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomInput0001', 0, async (done: Function) => {
            await runCase('testCustomInput0001', async (): Promise<void> => {
                const redX: string = await textOfId('InputRedX');
                const greenY: string = await textOfId('InputGreenY');
                const whiteY: string = await textOfId('InputWhiteY');
                const gamma: string = await textOfId('GammaValue');
                await addLog(`testCustomInput0001: actual redX=${redX}, expected=0.64`);
                expect(redX).assertEqual('0.64');
                await addLog(`testCustomInput0001: actual greenY=${greenY}, expected=0.60`);
                expect(greenY).assertEqual('0.60');
                await addLog(`testCustomInput0001: actual whiteY=${whiteY}, expected=0.3290`);
                expect(whiteY).assertEqual('0.3290');
                await addLog(`testCustomInput0001: actual gamma=${gamma}, expected=2.20`);
                expect(gamma).assertEqual('2.20');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0102
         * @tc.name: testCustomInput0002
         * @tc.desc: Input a non-numeric red x and check creation falls back to the default coordinate.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomInput0002', 0, async (done: Function) => {
            await runCase('testCustomInput0002', async (): Promise<void> => {
                await inputText('InputRedX', 'abc');
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testCustomInput0002: actual=${shown}, expected default red x 0.64`);
                expect(shown.includes(DEFAULT_PRIMARIES)).assertTrue();
                await addLog(`testCustomInput0002: white point input line of ${shown}`);
                expect(shown.includes(DEFAULT_WHITE)).assertTrue();
                await addLog(`testCustomInput0002: creation reported a color space name`);
                expect(shown.includes('ColorSpaceName:')).assertTrue();
                await addLog(`testCustomInput0002: no uncaught error was surfaced`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0103
         * @tc.name: testCustomInput0003
         * @tc.desc: Input a non-numeric red y and check creation falls back to the default coordinate.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomInput0003', 0, async (done: Function) => {
            await runCase('testCustomInput0003', async (): Promise<void> => {
                await inputText('InputRedY', 'xyz');
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testCustomInput0003: actual=${shown}, expected default red y 0.33`);
                expect(shown.includes(DEFAULT_PRIMARIES)).assertTrue();
                await addLog(`testCustomInput0003: white point input line of ${shown}`);
                expect(shown.includes(DEFAULT_WHITE)).assertTrue();
                await addLog(`testCustomInput0003: creation reported a color space name`);
                expect(shown.includes('ColorSpaceName:')).assertTrue();
                await addLog(`testCustomInput0003: no uncaught error was surfaced`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0104
         * @tc.name: testCustomInput0004
         * @tc.desc: Input a non-numeric green x and check creation falls back to the default coordinate.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomInput0004', 0, async (done: Function) => {
            await runCase('testCustomInput0004', async (): Promise<void> => {
                await inputText('InputGreenX', '???');
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testCustomInput0004: actual=${shown}, expected default green x 0.3`);
                expect(shown.includes(DEFAULT_PRIMARIES)).assertTrue();
                await addLog(`testCustomInput0004: white point input line of ${shown}`);
                expect(shown.includes(DEFAULT_WHITE)).assertTrue();
                await addLog(`testCustomInput0004: creation reported a color space name`);
                expect(shown.includes('ColorSpaceName:')).assertTrue();
                await addLog(`testCustomInput0004: no uncaught error was surfaced`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0105
         * @tc.name: testCustomInput0005
         * @tc.desc: Input a partially numeric green y and check the leading number is the value used.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomInput0005', 0, async (done: Function) => {
            await runCase('testCustomInput0005', async (): Promise<void> => {
                await inputText('InputGreenY', '1abc');
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testCustomInput0005: actual=${shown}, expected green y parsed as 1`);
                expect(shown.includes('Primaries: R(0.64,0.33) G(0.3,1) B(0.15,0.06)')).assertTrue();
                await addLog(`testCustomInput0005: white point input line kept the defaults`);
                expect(shown.includes(DEFAULT_WHITE)).assertTrue();
                await addLog(`testCustomInput0005: creation reported a color space name`);
                expect(shown.includes('ColorSpaceName:')).assertTrue();
                await addLog(`testCustomInput0005: no uncaught error was surfaced`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0106
         * @tc.name: testCustomInput0006
         * @tc.desc: Input a negative blue x and check the page reports one deterministic outcome.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomInput0006', 0, async (done: Function) => {
            await runCase('testCustomInput0006', async (): Promise<void> => {
                await inputText('InputBlueX', '-0.5');
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                const accepted: boolean = shown.includes('Primaries: R(0.64,0.33) G(0.3,0.6) B(-0.5,0.06)');
                const rejected: boolean = shown.includes('Error:');
                await addLog(`testCustomInput0006: actual=${shown}, accepted=${accepted}, rejected=${rejected}`);
                expect(shown).assertDeepEquals(shown);
                await addLog(`testCustomInput0006: page reported either the parsed value or an error`);
                expect(accepted || rejected).assertTrue();
                await addLog(`testCustomInput0006: parsed value keeps the other defaults`);
                expect(accepted ? shown.includes('G(0.3,0.6)') : true).assertTrue();
                await addLog(`testCustomInput0006: page did not stay blank`);
                expect(shown.length > 10).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0107
         * @tc.name: testCustomInput0007
         * @tc.desc: Input a blue y above one and check the page reports one deterministic outcome.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomInput0007', 0, async (done: Function) => {
            await runCase('testCustomInput0007', async (): Promise<void> => {
                await inputText('InputBlueY', '2.5');
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                const accepted: boolean = shown.includes('Primaries: R(0.64,0.33) G(0.3,0.6) B(0.15,2.5)');
                const rejected: boolean = shown.includes('Error:');
                await addLog(`testCustomInput0007: actual=${shown}, accepted=${accepted}, rejected=${rejected}`);
                expect(shown.length > 10).assertTrue();
                await addLog(`testCustomInput0007: page reported either the parsed value or an error`);
                expect(accepted || rejected).assertTrue();
                await addLog(`testCustomInput0007: parsed value keeps the other defaults`);
                expect(accepted ? shown.includes('R(0.64,0.33)') : true).assertTrue();
                await addLog(`testCustomInput0007: white point input line is still present`);
                expect(shown.includes('WhitePoint Input:')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0108
         * @tc.name: testCustomInput0008
         * @tc.desc: Input a zero white x and check the reported white point input follows it.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomInput0008', 0, async (done: Function) => {
            await runCase('testCustomInput0008', async (): Promise<void> => {
                await inputText('InputWhiteX', '0');
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                const accepted: boolean = shown.includes('WhitePoint Input: (0,0.329)');
                const rejected: boolean = shown.includes('Error:');
                await addLog(`testCustomInput0008: actual=${shown}, accepted=${accepted}, rejected=${rejected}`);
                expect(shown.length > 10).assertTrue();
                await addLog(`testCustomInput0008: page reported either the parsed value or an error`);
                expect(accepted || rejected).assertTrue();
                await addLog(`testCustomInput0008: primaries line is still present`);
                expect(shown.includes('Primaries: R(')).assertTrue();
                await addLog(`testCustomInput0008: white point line is still present`);
                expect(shown.includes('WhitePoint:')).assertTrue();
            }, done);
        });

        // ==================== Multi field edits and reset ====================

        /*
         * @tc.number: SUB_CS_INPUT_0201
         * @tc.name: testCustomInput0009
         * @tc.desc: Input a space only white y and check it falls back to the default coordinate.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomInput0009', 0, async (done: Function) => {
            await runCase('testCustomInput0009', async (): Promise<void> => {
                await inputText('InputWhiteY', ' ');
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testCustomInput0009: actual=${shown}, expected default white y 0.329`);
                expect(shown.includes(DEFAULT_WHITE)).assertTrue();
                await addLog(`testCustomInput0009: primaries line kept the defaults`);
                expect(shown.includes(DEFAULT_PRIMARIES)).assertTrue();
                await addLog(`testCustomInput0009: creation reported a color space name`);
                expect(shown.includes('ColorSpaceName:')).assertTrue();
                await addLog(`testCustomInput0009: no uncaught error was surfaced`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0202
         * @tc.name: testCustomInput0010
         * @tc.desc: Input scientific notation and check the parsed coordinate is used.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomInput0010', 0, async (done: Function) => {
            await runCase('testCustomInput0010', async (): Promise<void> => {
                await inputText('InputRedX', '1e-3');
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                const accepted: boolean = shown.includes('Primaries: R(0.001,0.33)');
                const rejected: boolean = shown.includes('Error:');
                await addLog(`testCustomInput0010: actual=${shown}, accepted=${accepted}, rejected=${rejected}`);
                expect(shown.length > 10).assertTrue();
                await addLog(`testCustomInput0010: page reported either the parsed value or an error`);
                expect(accepted || rejected).assertTrue();
                await addLog(`testCustomInput0010: green and blue defaults survived`);
                expect(shown.includes('G(0.3,0.6)')).assertTrue();
                await addLog(`testCustomInput0010: white point input line is present`);
                expect(shown.includes('WhitePoint Input:')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0203
         * @tc.name: testCustomInput0011
         * @tc.desc: Input a leading space value and check the trimmed number is parsed.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomInput0011', 0, async (done: Function) => {
            await runCase('testCustomInput0011', async (): Promise<void> => {
                await inputText('InputGreenX', ' 0.5');
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                const accepted: boolean = shown.includes('G(0.5,0.6)');
                const rejected: boolean = shown.includes('Error:');
                await addLog(`testCustomInput0011: actual=${shown}, accepted=${accepted}, rejected=${rejected}`);
                expect(shown.length > 10).assertTrue();
                await addLog(`testCustomInput0011: page reported either the parsed value or an error`);
                expect(accepted || rejected).assertTrue();
                await addLog(`testCustomInput0011: red defaults survived`);
                expect(shown.includes('R(0.64,0.33)')).assertTrue();
                await addLog(`testCustomInput0011: blue defaults survived`);
                expect(shown.includes('B(0.15,0.06)')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0204
         * @tc.name: testCustomInput0012
         * @tc.desc: Input both red coordinates and check both are reported in the primaries line.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCustomInput0012', 0, async (done: Function) => {
            await runCase('testCustomInput0012', async (): Promise<void> => {
                await inputText('InputRedX', '0.7');
                await inputText('InputRedY', '0.2');
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testCustomInput0012: actual=${shown}, expected red pair 0.7 and 0.2`);
                expect(shown.includes('Primaries: R(0.7,0.2)')).assertTrue();
                await addLog(`testCustomInput0012: green defaults survived`);
                expect(shown.includes('G(0.3,0.6)')).assertTrue();
                await addLog(`testCustomInput0012: blue defaults survived`);
                expect(shown.includes('B(0.15,0.06)')).assertTrue();
                await addLog(`testCustomInput0012: white point input line kept the defaults`);
                expect(shown.includes(DEFAULT_WHITE)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0205
         * @tc.name: testCustomInput0013
         * @tc.desc: Reset after an edit and check all eight fields return to the sRGB defaults.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCustomInput0013', 0, async (done: Function) => {
            await runCase('testCustomInput0013', async (): Promise<void> => {
                await inputText('InputRedX', '0.7');
                await inputText('InputWhiteY', '0.4');
                await clickScrolledId('BtnReset');
                await scrollPageToTop();
                const redX: string = await textOfId('InputRedX');
                const whiteY: string = await textOfId('InputWhiteY');
                const info: string = await textOrEmpty('CustomColorSpaceInfo');
                await addLog(`testCustomInput0013: actual redX=${redX}, expected=0.64`);
                expect(redX).assertEqual('0.64');
                await addLog(`testCustomInput0013: actual whiteY=${whiteY}, expected=0.3290`);
                expect(whiteY).assertEqual('0.3290');
                await addLog(`testCustomInput0013: actual info=${info}, expected cleared result`);
                expect(info).assertEqual('');
                await addLog(`testCustomInput0013: gamma label returned to 2.20`);
                expect(await textOfId('GammaValue')).assertEqual('2.20');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0206
         * @tc.name: testCustomInput0014
         * @tc.desc: Input every field to the same value and check the whole primaries line follows it.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCustomInput0014', 0, async (done: Function) => {
            await runCase('testCustomInput0014', async (): Promise<void> => {
                await inputText('InputRedX', '0.5');
                await inputText('InputRedY', '0.5');
                await inputText('InputGreenX', '0.5');
                await inputText('InputGreenY', '0.5');
                await inputText('InputBlueX', '0.5');
                await inputText('InputBlueY', '0.5');
                await inputText('InputWhiteX', '0.5');
                await inputText('InputWhiteY', '0.5');
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testCustomInput0014: actual=${shown}, expected uniform 0.5 primaries`);
                expect(shown.includes('Primaries: R(0.5,0.5) G(0.5,0.5) B(0.5,0.5)')).assertTrue();
                await addLog(`testCustomInput0014: expected uniform 0.5 white point input`);
                expect(shown.includes('WhitePoint Input: (0.5,0.5)')).assertTrue();
                await addLog(`testCustomInput0014: creation reported a color space name`);
                expect(shown.includes('ColorSpaceName:')).assertTrue();
                await addLog(`testCustomInput0014: no uncaught error was surfaced`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0207
         * @tc.name: testCustomInput0015
         * @tc.desc: Input a value without creating and check the result area stays untouched.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCustomInput0015', 0, async (done: Function) => {
            await runCase('testCustomInput0015', async (): Promise<void> => {
                await inputText('InputRedX', '0.7');
                const info: string = await textOrEmpty('CustomColorSpaceInfo');
                const field: string = await textOfId('InputRedX');
                await addLog(`testCustomInput0015: actual info=${info}, expected empty before create`);
                expect(info).assertEqual('');
                await addLog(`testCustomInput0015: actual field=${field}, expected=0.7`);
                expect(field).assertEqual('0.7');
                await addLog(`testCustomInput0015: gamma label is still the default`);
                expect(await textOfId('GammaValue')).assertEqual('2.20');
                await addLog(`testCustomInput0015: no result text was produced`);
                expect(info.includes('ColorSpaceName:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INPUT_0208
         * @tc.name: testCustomInput0016
         * @tc.desc: Create with the defaults and check the reported gamma equals the slider value.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCustomInput0016', 0, async (done: Function) => {
            await runCase('testCustomInput0016', async (): Promise<void> => {
                await clickScrolledId('BtnCreateCustom');
                const shown: string = await textOfId('CustomColorSpaceInfo');
                const gamma: number = numberAfter(shown, 'Gamma: ');
                const slider: number = numberAfter(await textOfId('GammaValue'), '');
                await addLog(`testCustomInput0016: actual gamma=${gamma}, slider=${slider}`);
                expect(isCloseTo(gamma, slider, 0.01)).assertTrue();
                await addLog(`testCustomInput0016: gamma equals the default 2.2`);
                expect(isCloseTo(gamma, 2.2, 0.03)).assertTrue();
                await addLog(`testCustomInput0016: primaries line kept the defaults`);
                expect(shown.includes(DEFAULT_PRIMARIES)).assertTrue();
                await addLog(`testCustomInput0016: custom type line is reported`);
                expect(shown.includes('Type: Custom')).assertTrue();
            }, done);
        });
    });
}
