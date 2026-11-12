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
import { colorSpaceManager, sendableColorSpaceManager } from '@kit.ArkGraphics2D';
import {
    startApp, runCase, addLog, resetToIndex, navigateToException, clickScrolledId, waitTextContains
} from '../testkit/SharedDriver';

// Every probe below repeats the request the page makes, so the expected outcome comes from the platform
// instead of a constant copied out of the page.
function enumAccepted(cs: colorSpaceManager.ColorSpace): boolean {
    try {
        sendableColorSpaceManager.create(cs);
        return true;
    } catch (error) {
        return false;
    }
}

function gammaAccepted(gamma: number): boolean {
    const primaries: colorSpaceManager.ColorSpacePrimaries = {
        redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60,
        blueX: 0.15, blueY: 0.06, whitePointX: 0.3127, whitePointY: 0.3290
    };
    try {
        sendableColorSpaceManager.create(primaries, gamma);
        return true;
    } catch (error) {
        return false;
    }
}

function outOfRangePrimariesAccepted(): boolean {
    const primaries: colorSpaceManager.ColorSpacePrimaries = {
        redX: 2.0, redY: -0.5, greenX: 3.0, greenY: -1.0,
        blueX: 5.0, blueY: -2.0, whitePointX: 0.3127, whitePointY: 0.3290
    };
    try {
        sendableColorSpaceManager.create(primaries, 2.2);
        return true;
    } catch (error) {
        return false;
    }
}

// Press one of the verification buttons and return the text the page reports.
async function pressAndRead(testName: string, id: string, prefix: string): Promise<string> {
    await addLog(`${testName}: press ${id}`);
    await clickScrolledId(id);
    return await waitTextContains('ErrorResult', prefix);
}

// The SRGB summary line is recomputed from the platform values with the tolerances the page declares.
function srgbOverallExpected(): string {
    const manager: sendableColorSpaceManager.ColorSpaceManager =
        sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);
    const gamma: number = manager.getGamma();
    const whitePoint = manager.getWhitePoint();
    const name: colorSpaceManager.ColorSpace = manager.getColorSpaceName();
    const gammaOk: boolean = Math.abs(gamma - 2.2) < 0.01;
    const wpXOk: boolean = whitePoint.length >= 2 && Math.abs(whitePoint[0] - 0.3127) < 0.001;
    const wpYOk: boolean = whitePoint.length >= 2 && Math.abs(whitePoint[1] - 0.3290) < 0.001;
    const nameOk: boolean = name === colorSpaceManager.ColorSpace.SRGB;
    const allPass: boolean = gammaOk && wpXOk && wpYOk && nameOk;
    return `Overall: ${allPass ? 'ALL PASS' : 'HAS FAILURES'}`;
}

export default function exceptionOutcomeTest(): void {
    describe('ExceptionOutcome', () => {
        beforeAll(async () => {
            await addLog('ExceptionOutcome suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToException();
        });

        /*
         * @tc.number: SUB_CS_EXC_0101
         * @tc.name: testUnknownEnumOutcome0001
         * @tc.desc: Press the UNKNOWN enum button and check the reported outcome matches the platform answer.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testUnknownEnumOutcome0001', 0, async (done: Function) => {
            await runCase('testUnknownEnumOutcome0001', async (): Promise<void> => {
                const shown: string = await pressAndRead('testUnknownEnumOutcome0001', 'BtnTestUnknown',
                  'UNKNOWN enum: ');
                const accepted: boolean = enumAccepted(colorSpaceManager.ColorSpace.UNKNOWN);
                await addLog(`testUnknownEnumOutcome0001: actual=${shown}, platform accepted=${accepted}`);
                expect(shown.startsWith('UNKNOWN enum: ')).assertTrue();
                await addLog(`testUnknownEnumOutcome0001: page reported Caught expected ` +
                  `error=${shown.includes('Caught expected error')}, expected=${!accepted}`);
                expect(shown.includes('Caught expected error')).assertEqual(!accepted);
                await addLog(`testUnknownEnumOutcome0001: page reported Unexpected ` +
                  `success=${shown.includes('Unexpected success')}, expected=${accepted}`);
                expect(shown.includes('Unexpected success')).assertEqual(accepted);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0102
         * @tc.name: testCustomEnumOutcome0001
         * @tc.desc: Press the CUSTOM enum button and check the reported outcome matches the platform answer.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomEnumOutcome0001', 0, async (done: Function) => {
            await runCase('testCustomEnumOutcome0001', async (): Promise<void> => {
                const shown: string = await pressAndRead('testCustomEnumOutcome0001', 'BtnTestCustom', 'CUSTOM enum: ');
                const accepted: boolean = enumAccepted(colorSpaceManager.ColorSpace.CUSTOM);
                await addLog(`testCustomEnumOutcome0001: actual=${shown}, platform accepted=${accepted}`);
                expect(shown.startsWith('CUSTOM enum: ')).assertTrue();
                await addLog(`testCustomEnumOutcome0001: page reported Caught expected ` +
                  `error=${shown.includes('Caught expected error')}, expected=${!accepted}`);
                expect(shown.includes('Caught expected error')).assertEqual(!accepted);
                await addLog(`testCustomEnumOutcome0001: page reported Unexpected ` +
                  `success=${shown.includes('Unexpected success')}, expected=${accepted}`);
                expect(shown.includes('Unexpected success')).assertEqual(accepted);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0103
         * @tc.name: testNegativeGammaOutcome0001
         * @tc.desc: Press the gamma -1.0 button and check the reported outcome matches the platform answer.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testNegativeGammaOutcome0001', 0, async (done: Function) => {
            await runCase('testNegativeGammaOutcome0001', async (): Promise<void> => {
                const shown: string = await pressAndRead('testNegativeGammaOutcome0001', 'BtnTestNegGamma',
                  'Gamma=-1.0: ');
                const accepted: boolean = gammaAccepted(-1.0);
                await addLog(`testNegativeGammaOutcome0001: actual=${shown}, platform accepted=${accepted}`);
                expect(shown.startsWith('Gamma=-1.0: ')).assertTrue();
                await addLog(`testNegativeGammaOutcome0001: page reported Caught expected ` +
                  `error=${shown.includes('Caught expected error')}, expected=${!accepted}`);
                expect(shown.includes('Caught expected error')).assertEqual(!accepted);
                await addLog(`testNegativeGammaOutcome0001: page reported Unexpected ` +
                  `success=${shown.includes('Unexpected success')}, expected=${accepted}`);
                expect(shown.includes('Unexpected success')).assertEqual(accepted);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0104
         * @tc.name: testZeroGammaOutcome0001
         * @tc.desc: Press the gamma 0 button and check the reported outcome matches the platform answer.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testZeroGammaOutcome0001', 0, async (done: Function) => {
            await runCase('testZeroGammaOutcome0001', async (): Promise<void> => {
                const shown: string = await pressAndRead('testZeroGammaOutcome0001', 'BtnTestZeroGamma', 'Gamma=0: ');
                const accepted: boolean = gammaAccepted(0);
                await addLog(`testZeroGammaOutcome0001: actual=${shown}, platform accepted=${accepted}`);
                expect(shown.startsWith('Gamma=0: ')).assertTrue();
                await addLog(`testZeroGammaOutcome0001: page reported Caught expected ` +
                  `error=${shown.includes('Caught expected error')}, expected=${!accepted}`);
                expect(shown.includes('Caught expected error')).assertEqual(!accepted);
                await addLog(`testZeroGammaOutcome0001: page reported Unexpected ` +
                  `success=${shown.includes('Unexpected success')}, expected=${accepted}`);
                expect(shown.includes('Unexpected success')).assertEqual(accepted);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0105
         * @tc.name: testInvalidPrimariesOutcome0001
         * @tc.desc: Press the out of range coordinates button and check the reported outcome matches the platform
         * answer.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testInvalidPrimariesOutcome0001', 0, async (done: Function) => {
            await runCase('testInvalidPrimariesOutcome0001', async (): Promise<void> => {
                const shown: string = await pressAndRead('testInvalidPrimariesOutcome0001', 'BtnTestInvalidPrimaries',
                  'Invalid primaries: ');
                const accepted: boolean = outOfRangePrimariesAccepted();
                await addLog(`testInvalidPrimariesOutcome0001: actual=${shown}, platform accepted=${accepted}`);
                expect(shown.startsWith('Invalid primaries: ')).assertTrue();
                await addLog(`testInvalidPrimariesOutcome0001: page reported Caught expected ` +
                  `error=${shown.includes('Caught expected error')}, expected=${!accepted}`);
                expect(shown.includes('Caught expected error')).assertEqual(!accepted);
                await addLog(`testInvalidPrimariesOutcome0001: page reported Unexpected ` +
                  `success=${shown.includes('Unexpected success')}, expected=${accepted}`);
                expect(shown.includes('Unexpected success')).assertEqual(accepted);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0106
         * @tc.name: testEnum999Outcome0001
         * @tc.desc: Press the enum 999 button and check the reported outcome matches the platform answer.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testEnum999Outcome0001', 0, async (done: Function) => {
            await runCase('testEnum999Outcome0001', async (): Promise<void> => {
                const shown: string = await pressAndRead('testEnum999Outcome0001', 'BtnTestEnum999', 'Enum=999: ');
                const accepted: boolean = enumAccepted(999 as colorSpaceManager.ColorSpace);
                await addLog(`testEnum999Outcome0001: actual=${shown}, platform accepted=${accepted}`);
                expect(shown.startsWith('Enum=999: ')).assertTrue();
                await addLog(`testEnum999Outcome0001: page reported Caught expected ` +
                  `error=${shown.includes('Caught expected error')}, expected=${!accepted}`);
                expect(shown.includes('Caught expected error')).assertEqual(!accepted);
                await addLog(`testEnum999Outcome0001: page reported Unexpected ` +
                  `success=${shown.includes('Unexpected success')}, expected=${accepted}`);
                expect(shown.includes('Unexpected success')).assertEqual(accepted);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0107
         * @tc.name: testEnumNegativeOneOutcome0001
         * @tc.desc: Press the enum -1 button and check the reported outcome matches the platform answer.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testEnumNegativeOneOutcome0001', 0, async (done: Function) => {
            await runCase('testEnumNegativeOneOutcome0001', async (): Promise<void> => {
                const shown: string = await pressAndRead('testEnumNegativeOneOutcome0001', 'BtnTestEnumNeg1',
                  'Enum=-1: ');
                const accepted: boolean = enumAccepted(-1 as colorSpaceManager.ColorSpace);
                await addLog(`testEnumNegativeOneOutcome0001: actual=${shown}, platform accepted=${accepted}`);
                expect(shown.startsWith('Enum=-1: ')).assertTrue();
                await addLog(`testEnumNegativeOneOutcome0001: page reported Caught expected ` +
                  `error=${shown.includes('Caught expected error')}, expected=${!accepted}`);
                expect(shown.includes('Caught expected error')).assertEqual(!accepted);
                await addLog(`testEnumNegativeOneOutcome0001: page reported Unexpected ` +
                  `success=${shown.includes('Unexpected success')}, expected=${accepted}`);
                expect(shown.includes('Unexpected success')).assertEqual(accepted);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0108
         * @tc.name: testSrgbPropertySummary0001
         * @tc.desc: Press the SRGB property button and check the summary matches the platform values.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSrgbPropertySummary0001', 0, async (done: Function) => {
            await runCase('testSrgbPropertySummary0001', async (): Promise<void> => {
                const shown: string = await pressAndRead('testSrgbPropertySummary0001', 'BtnVerifySrgb',
                  'SRGB Property Verification:');
                const expected: string = srgbOverallExpected();
                await addLog(`testSrgbPropertySummary0001: actual=${shown}, expected line=${expected}`);
                expect(shown.startsWith('SRGB Property Verification:')).assertTrue();
                await addLog(`testSrgbPropertySummary0001: actual summary line, expected=${expected}`);
                expect(shown.includes(expected)).assertTrue();
                await addLog(`testSrgbPropertySummary0001: the name check follows the platform enum`);
                expect(shown.includes('Name:')).assertTrue();
                await addLog(`testSrgbPropertySummary0001: the white point line was printed`);
                expect(shown.includes('WhitePoint: [')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0109
         * @tc.name: testLinearSrgbGammaSummary0001
         * @tc.desc: Press the LINEAR_SRGB gamma button and check the summary matches the platform gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testLinearSrgbGammaSummary0001', 0, async (done: Function) => {
            await runCase('testLinearSrgbGammaSummary0001', async (): Promise<void> => {
                const shown: string = await pressAndRead('testLinearSrgbGammaSummary0001', 'BtnVerifyLinearSrgb',
                  'LINEAR_SRGB Property Verification:');
                const manager: sendableColorSpaceManager.ColorSpaceManager =
                    sendableColorSpaceManager.create(colorSpaceManager.ColorSpace.LINEAR_SRGB);
                const gammaOk: boolean = Math.abs(manager.getGamma() - 1.0) < 0.01;
                const expected: string = `Overall: ${gammaOk ? 'ALL PASS' : 'HAS FAILURES'}`;
                await addLog(`testLinearSrgbGammaSummary0001: actual=${shown}, expected line=${expected}`);
                expect(shown.startsWith('LINEAR_SRGB Property Verification:')).assertTrue();
                await addLog(`testLinearSrgbGammaSummary0001: actual summary line, expected=${expected}`);
                expect(shown.includes(expected)).assertTrue();
                await addLog(`testLinearSrgbGammaSummary0001: the gamma line reports the platform gamma ` +
                  `${manager.getGamma()}`);
                expect(shown.includes('Gamma: ')).assertTrue();
            }, done);
        });
    });
}
