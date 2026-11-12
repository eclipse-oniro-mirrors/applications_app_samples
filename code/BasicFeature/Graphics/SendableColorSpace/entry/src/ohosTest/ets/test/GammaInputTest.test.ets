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
    startApp, runCase, addLog, clickId, textOfId, existsId, resetToIndex, navigateToCustom,
    inputText, setSliderValue, waitTextContains, numberAfter, isCloseTo, textOrEmpty, scrollToId
} from '../testkit/SharedDriver';

async function createWithGamma(testName: string, value: number): Promise<void> {
    await navigateToCustom();
    await setSliderValue('GammaSlider', value, 0.1, 5.0, 2.2, 'GammaValue');
    await addLog(`${testName}: create with gamma ${value}`);
    await clickId('BtnCreateCustom');
    await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
}

async function setCustomPrimaries(): Promise<void> {
    await inputText('InputRedX', '0.68');
    await inputText('InputRedY', '0.32');
    await inputText('InputGreenX', '0.265');
    await inputText('InputGreenY', '0.69');
    await inputText('InputBlueX', '0.15');
    await inputText('InputBlueY', '0.06');
    await inputText('InputWhiteX', '0.3127');
    await inputText('InputWhiteY', '0.3290');
}

export default function gammaInputTest(): void {
    describe('GammaInputTest', () => {
        beforeAll(async () => {
            await addLog('GammaInputTest suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
        });

        // ==================== Gamma 滑块数值矩阵（10 条） ====================

        /*
         * @tc.number: SUB_CS_GAMMA_0100
         * @tc.name: testGammaMinValue0001
         * @tc.desc: Verify creation with the minimum gamma value.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGammaMinValue0001', 0, async (done: Function) => {
            await runCase('testGammaMinValue0001', async (): Promise<void> => {
                await createWithGamma('testGammaMinValue0001', 0.1);
                const display: string = await textOfId('GammaValue');
                const info: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testGammaMinValue0001: actual=${display}, expected=0.10`);
                expect(display).assertEqual('0.10');
                await addLog(`testGammaMinValue0001: actual gamma=${numberAfter(info, 'Gamma: ')}, expected=0.1`);
                expect(isCloseTo(numberAfter(info, 'Gamma: '), 0.1, 0.001)).assertTrue();
                await addLog(`testGammaMinValue0001: actual=${info}, expected default primaries`);
                expect(info).assertContain('Primaries: R(0.64,0.33)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_0200
         * @tc.name: testGammaLowValue0001
         * @tc.desc: Verify creation with gamma 0.5.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGammaLowValue0001', 0, async (done: Function) => {
            await runCase('testGammaLowValue0001', async (): Promise<void> => {
                await createWithGamma('testGammaLowValue0001', 0.5);
                const display: string = await textOfId('GammaValue');
                const info: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testGammaLowValue0001: actual=${display}, expected=0.50`);
                expect(display).assertEqual('0.50');
                await addLog(`testGammaLowValue0001: actual gamma=${numberAfter(info, 'Gamma: ')}, expected=0.5`);
                expect(isCloseTo(numberAfter(info, 'Gamma: '), 0.5, 0.001)).assertTrue();
                await addLog(`testGammaLowValue0001: actual=${info}, expected default white point`);
                expect(info).assertContain('WhitePoint Input: (0.3127,0.329)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_0300
         * @tc.name: testGammaDefault0001
         * @tc.desc: Verify creation with the default gamma value.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testGammaDefault0001', 0, async (done: Function) => {
            await runCase('testGammaDefault0001', async (): Promise<void> => {
                await createWithGamma('testGammaDefault0001', 2.2);
                const display: string = await textOfId('GammaValue');
                const info: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testGammaDefault0001: actual=${display}, expected=2.20`);
                expect(display).assertEqual('2.20');
                await addLog(`testGammaDefault0001: actual gamma=${numberAfter(info, 'Gamma: ')}, expected=2.2`);
                expect(isCloseTo(numberAfter(info, 'Gamma: '), 2.2, 0.001)).assertTrue();
                await addLog(`testGammaDefault0001: actual=${info}, expected custom type`);
                expect(info).assertContain('Type: Custom');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_0400
         * @tc.name: testGammaMidValue0001
         * @tc.desc: Verify creation with gamma 1.5.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGammaMidValue0001', 0, async (done: Function) => {
            await runCase('testGammaMidValue0001', async (): Promise<void> => {
                await createWithGamma('testGammaMidValue0001', 1.5);
                const display: string = await textOfId('GammaValue');
                const info: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testGammaMidValue0001: actual=${display}, expected=1.50`);
                expect(display).assertEqual('1.50');
                await addLog(`testGammaMidValue0001: actual gamma=${numberAfter(info, 'Gamma: ')}, expected=1.5`);
                expect(isCloseTo(numberAfter(info, 'Gamma: '), 1.5, 0.001)).assertTrue();
                await addLog(`testGammaMidValue0001: actual=${info}, expected green primary`);
                expect(info).assertContain('G(0.3,0.6)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_0500
         * @tc.name: testGammaStandard0001
         * @tc.desc: Verify creation with gamma 2.0.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGammaStandard0001', 0, async (done: Function) => {
            await runCase('testGammaStandard0001', async (): Promise<void> => {
                await createWithGamma('testGammaStandard0001', 2.0);
                const display: string = await textOfId('GammaValue');
                const info: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testGammaStandard0001: actual=${display}, expected=2.00`);
                expect(display).assertEqual('2.00');
                await addLog(`testGammaStandard0001: actual gamma=${numberAfter(info, 'Gamma: ')}, expected=2`);
                expect(isCloseTo(numberAfter(info, 'Gamma: '), 2, 0.001)).assertTrue();
                await addLog(`testGammaStandard0001: actual=${info}, expected blue primary`);
                expect(info).assertContain('B(0.15,0.06)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_0600
         * @tc.name: testGammaDciP3Value0001
         * @tc.desc: Verify creation with gamma 2.6.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGammaDciP3Value0001', 0, async (done: Function) => {
            await runCase('testGammaDciP3Value0001', async (): Promise<void> => {
                await createWithGamma('testGammaDciP3Value0001', 2.6);
                const display: string = await textOfId('GammaValue');
                const info: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testGammaDciP3Value0001: actual=${display}, expected=2.60`);
                expect(display).assertEqual('2.60');
                await addLog(`testGammaDciP3Value0001: actual gamma=${numberAfter(info, 'Gamma: ')}, expected=2.6`);
                expect(isCloseTo(numberAfter(info, 'Gamma: '), 2.6, 0.001)).assertTrue();
                await scrollToId('CustomGamutCanvas');
                await addLog(`testGammaDciP3Value0001: canvas existence expected=true`);
                expect(await existsId('CustomGamutCanvas')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_0700
         * @tc.name: testGammaHighValue0001
         * @tc.desc: Verify creation with gamma 3.0.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGammaHighValue0001', 0, async (done: Function) => {
            await runCase('testGammaHighValue0001', async (): Promise<void> => {
                await createWithGamma('testGammaHighValue0001', 3.0);
                const display: string = await textOfId('GammaValue');
                const info: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testGammaHighValue0001: actual=${display}, expected=3.00`);
                expect(display).assertEqual('3.00');
                await addLog(`testGammaHighValue0001: actual gamma=${numberAfter(info, 'Gamma: ')}, expected=3`);
                expect(isCloseTo(numberAfter(info, 'Gamma: '), 3, 0.001)).assertTrue();
                await addLog(`testGammaHighValue0001: actual=${info}, expected custom color space name`);
                expect(info).assertContain('ColorSpaceName:');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_0800
         * @tc.name: testGammaVeryHighValue0001
         * @tc.desc: Verify creation with gamma 3.5.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGammaVeryHighValue0001', 0, async (done: Function) => {
            await runCase('testGammaVeryHighValue0001', async (): Promise<void> => {
                await createWithGamma('testGammaVeryHighValue0001', 3.5);
                const display: string = await textOfId('GammaValue');
                const info: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testGammaVeryHighValue0001: actual=${display}, expected=3.50`);
                expect(display).assertEqual('3.50');
                await addLog(`testGammaVeryHighValue0001: actual gamma=${numberAfter(info, 'Gamma: ')}, expected=3.5`);
                expect(isCloseTo(numberAfter(info, 'Gamma: '), 3.5, 0.001)).assertTrue();
                await addLog(`testGammaVeryHighValue0001: actual=${info}, expected white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_0900
         * @tc.name: testGammaMaxValue0001
         * @tc.desc: Verify creation with the maximum gamma value.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGammaMaxValue0001', 0, async (done: Function) => {
            await runCase('testGammaMaxValue0001', async (): Promise<void> => {
                await createWithGamma('testGammaMaxValue0001', 5.0);
                const display: string = await textOfId('GammaValue');
                const info: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testGammaMaxValue0001: actual=${display}, expected=5.00`);
                expect(display).assertEqual('5.00');
                await addLog(`testGammaMaxValue0001: actual gamma=${numberAfter(info, 'Gamma: ')}, expected=5`);
                expect(isCloseTo(numberAfter(info, 'Gamma: '), 5, 0.001)).assertTrue();
                await addLog(`testGammaMaxValue0001: actual=${info}, expected red primary`);
                expect(info).assertContain('R(0.64,0.33)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_1000
         * @tc.name: testGammaLinearValue0001
         * @tc.desc: Verify creation with linear gamma 1.0.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGammaLinearValue0001', 0, async (done: Function) => {
            await runCase('testGammaLinearValue0001', async (): Promise<void> => {
                await createWithGamma('testGammaLinearValue0001', 1.0);
                const display: string = await textOfId('GammaValue');
                const info: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testGammaLinearValue0001: actual=${display}, expected=1.00`);
                expect(display).assertEqual('1.00');
                await addLog(`testGammaLinearValue0001: actual gamma=${numberAfter(info, 'Gamma: ')}, expected=1`);
                expect(isCloseTo(numberAfter(info, 'Gamma: '), 1, 0.001)).assertTrue();
                await addLog(`testGammaLinearValue0001: actual=${info}, expected custom type`);
                expect(info).assertContain('Type: Custom');
            }, done);
        });

        // ==================== 输入、非法值与回退（6 条） ====================

        /*
         * @tc.number: SUB_CS_GAMMA_1100
         * @tc.name: testCustomPrimariesInput0001
         * @tc.desc: Verify all primary and white point inputs reach the result.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomPrimariesInput0001', 0, async (done: Function) => {
            await runCase('testCustomPrimariesInput0001', async (): Promise<void> => {
                await navigateToCustom();
                await setCustomPrimaries();
                await clickId('BtnCreateCustom');
                const info: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const redX: string = await textOfId('InputRedX');
                const greenY: string = await textOfId('InputGreenY');
                await addLog(`testCustomPrimariesInput0001: actual=${redX}, expected=0.68`);
                expect(redX).assertEqual('0.68');
                await addLog(`testCustomPrimariesInput0001: actual=${greenY}, expected=0.69`);
                expect(greenY).assertEqual('0.69');
                await addLog(`testCustomPrimariesInput0001: actual=${info}, expected all custom primaries`);
                expect(info).assertContain('Primaries: R(0.68,0.32) G(0.265,0.69) B(0.15,0.06)');
                await addLog(`testCustomPrimariesInput0001: actual=${info}, expected custom white point input`);
                expect(info).assertContain('WhitePoint Input: (0.3127,0.329)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_1200
         * @tc.name: testInvalidRedInputFallback0001
         * @tc.desc: Verify invalid red X input falls back without changing red Y.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testInvalidRedInputFallback0001', 0, async (done: Function) => {
            await runCase('testInvalidRedInputFallback0001', async (): Promise<void> => {
                await navigateToCustom();
                await inputText('InputRedX', 'invalid');
                await inputText('InputRedY', '0.34');
                await clickId('BtnCreateCustom');
                const info: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const redX: string = await textOfId('InputRedX');
                await addLog(`testInvalidRedInputFallback0001: actual=${redX}, expected=invalid`);
                expect(redX).assertEqual('invalid');
                await addLog(`testInvalidRedInputFallback0001: actual=${info}, expected red fallback and red Y 0.34`);
                expect(info).assertContain('R(0.64,0.34)');
                await addLog(`testInvalidRedInputFallback0001: actual=${info}, expected unchanged green primary`);
                expect(info).assertContain('G(0.3,0.6)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_1300
         * @tc.name: testInvalidGreenInputFallback0001
         * @tc.desc: Verify invalid green X input falls back without changing green Y.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testInvalidGreenInputFallback0001', 0, async (done: Function) => {
            await runCase('testInvalidGreenInputFallback0001', async (): Promise<void> => {
                await navigateToCustom();
                await inputText('InputGreenX', 'invalid');
                await inputText('InputGreenY', '0.61');
                await clickId('BtnCreateCustom');
                const info: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const greenX: string = await textOfId('InputGreenX');
                await addLog(`testInvalidGreenInputFallback0001: actual=${greenX}, expected=invalid`);
                expect(greenX).assertEqual('invalid');
                await addLog(`testInvalidGreenInputFallback0001: actual=${info}, ` +
                  `expected green fallback and green Y 0.61`);
                expect(info).assertContain('G(0.3,0.61)');
                await addLog(`testInvalidGreenInputFallback0001: actual=${info}, expected unchanged red primary`);
                expect(info).assertContain('R(0.64,0.33)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_1400
         * @tc.name: testInvalidBlueInputFallback0001
         * @tc.desc: Verify invalid blue X input falls back without changing blue Y.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testInvalidBlueInputFallback0001', 0, async (done: Function) => {
            await runCase('testInvalidBlueInputFallback0001', async (): Promise<void> => {
                await navigateToCustom();
                await inputText('InputBlueX', 'invalid');
                await inputText('InputBlueY', '0.07');
                await clickId('BtnCreateCustom');
                const info: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const blueX: string = await textOfId('InputBlueX');
                await addLog(`testInvalidBlueInputFallback0001: actual=${blueX}, expected=invalid`);
                expect(blueX).assertEqual('invalid');
                await addLog(`testInvalidBlueInputFallback0001: actual=${info}, ` +
                  `expected blue fallback and blue Y 0.07`);
                expect(info).assertContain('B(0.15,0.07)');
                await addLog(`testInvalidBlueInputFallback0001: actual=${info}, expected unchanged green primary`);
                expect(info).assertContain('G(0.3,0.6)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_1500
         * @tc.name: testInvalidWhiteInputFallback0001
         * @tc.desc: Verify invalid white X input falls back without changing white Y.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testInvalidWhiteInputFallback0001', 0, async (done: Function) => {
            await runCase('testInvalidWhiteInputFallback0001', async (): Promise<void> => {
                await navigateToCustom();
                await inputText('InputWhiteX', 'invalid');
                await inputText('InputWhiteY', '0.34');
                await clickId('BtnCreateCustom');
                const info: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const whiteX: string = await textOfId('InputWhiteX');
                await addLog(`testInvalidWhiteInputFallback0001: actual=${whiteX}, expected=invalid`);
                expect(whiteX).assertEqual('invalid');
                await addLog(`testInvalidWhiteInputFallback0001: actual=${info}, ` +
                  `expected white fallback and white Y 0.34`);
                expect(info).assertContain('WhitePoint Input: (0.3127,0.34)');
                await addLog(`testInvalidWhiteInputFallback0001: actual=${info}, expected formatted white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3400]');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_1600
         * @tc.name: testEmptyInputFallback0001
         * @tc.desc: Verify an empty primary input uses its default value.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testEmptyInputFallback0001', 0, async (done: Function) => {
            await runCase('testEmptyInputFallback0001', async (): Promise<void> => {
                await navigateToCustom();
                await inputText('InputRedX', '');
                await clickId('BtnCreateCustom');
                const info: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const redX: string = await textOfId('InputRedX');
                await addLog(`testEmptyInputFallback0001: actual=${redX}, expected empty input`);
                expect(redX).assertEqual('');
                await addLog(`testEmptyInputFallback0001: actual=${info}, expected default red primary`);
                expect(info).assertContain('R(0.64,0.33)');
                await addLog(`testEmptyInputFallback0001: actual gamma=${numberAfter(info, 'Gamma: ')}, ` +
                  `expected default 2.2`);
                expect(isCloseTo(numberAfter(info, 'Gamma: '), 2.2, 0.001)).assertTrue();
            }, done);
        });

        // ==================== 初始值与重置状态（3 条） ====================

        /*
         * @tc.number: SUB_CS_GAMMA_1700
         * @tc.name: testDefaultInputState0001
         * @tc.desc: Verify all default inputs before the first creation.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDefaultInputState0001', 0, async (done: Function) => {
            await runCase('testDefaultInputState0001', async (): Promise<void> => {
                await navigateToCustom();
                const gamma: string = await textOfId('GammaValue');
                const redX: string = await textOfId('InputRedX');
                const redY: string = await textOfId('InputRedY');
                const greenX: string = await textOfId('InputGreenX');
                const greenY: string = await textOfId('InputGreenY');
                const blueX: string = await textOfId('InputBlueX');
                const blueY: string = await textOfId('InputBlueY');
                const whiteX: string = await textOfId('InputWhiteX');
                const whiteY: string = await textOfId('InputWhiteY');
                const info: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testDefaultInputState0001: actual=${gamma}, expected=2.20`);
                expect(gamma).assertEqual('2.20');
                await addLog(`testDefaultInputState0001: actual=${redX}, expected=0.64`);
                expect(redX).assertEqual('0.64');
                await addLog(`testDefaultInputState0001: actual=${redY}, expected=0.33`);
                expect(redY).assertEqual('0.33');
                await addLog(`testDefaultInputState0001: actual=${greenX}, expected=0.30`);
                expect(greenX).assertEqual('0.30');
                await addLog(`testDefaultInputState0001: actual=${greenY}, expected=0.60`);
                expect(greenY).assertEqual('0.60');
                await addLog(`testDefaultInputState0001: actual=${blueX}, expected=0.15`);
                expect(blueX).assertEqual('0.15');
                await addLog(`testDefaultInputState0001: actual=${blueY}, expected=0.06`);
                expect(blueY).assertEqual('0.06');
                await addLog(`testDefaultInputState0001: actual=${whiteX}, expected=0.3127`);
                expect(whiteX).assertEqual('0.3127');
                await addLog(`testDefaultInputState0001: actual=${whiteY}, expected=0.3290`);
                expect(whiteY).assertEqual('0.3290');
                await addLog(`testDefaultInputState0001: actual=${info}, expected empty result`);
                expect(info).assertEqual('');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_1800
         * @tc.name: testResetRestoresInputs0001
         * @tc.desc: Verify reset restores gamma, inputs and the empty result state.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testResetRestoresInputs0001', 0, async (done: Function) => {
            await runCase('testResetRestoresInputs0001', async (): Promise<void> => {
                await navigateToCustom();
                await setSliderValue('GammaSlider', 3.0, 0.1, 5.0, 2.2, 'GammaValue');
                await inputText('InputRedX', '0.66');
                await clickId('BtnCreateCustom');
                const createdInfo: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                await addLog(`testResetRestoresInputs0001: actual gamma=${numberAfter(createdInfo, 'Gamma: ')}, ` +
                  `expected=3`);
                expect(isCloseTo(numberAfter(createdInfo, 'Gamma: '), 3, 0.001)).assertTrue();
                await clickId('BtnReset');
                const gamma: string = await textOfId('GammaValue');
                const redX: string = await textOfId('InputRedX');
                const info: string = await textOrEmpty('CustomColorSpaceInfo');
                await addLog(`testResetRestoresInputs0001: actual=${gamma}, expected=2.20`);
                expect(gamma).assertEqual('2.20');
                await addLog(`testResetRestoresInputs0001: actual=${redX}, expected=0.64`);
                expect(redX).assertEqual('0.64');
                await addLog(`testResetRestoresInputs0001: actual=${info}, expected empty result`);
                expect(info).assertEqual('');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_GAMMA_1900
         * @tc.name: testCreateResetCreate0001
         * @tc.desc: Verify a second creation uses reset defaults.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCreateResetCreate0001', 0, async (done: Function) => {
            await runCase('testCreateResetCreate0001', async (): Promise<void> => {
                await navigateToCustom();
                await setSliderValue('GammaSlider', 1.5, 0.1, 5.0, 2.2, 'GammaValue');
                await clickId('BtnCreateCustom');
                const firstInfo: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                await clickId('BtnReset');
                const resetInfo: string = await textOfId('CustomColorSpaceInfo');
                await clickId('BtnCreateCustom');
                const secondInfo: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                await addLog(`testCreateResetCreate0001: actual gamma=${numberAfter(firstInfo, 'Gamma: ')}, ` +
                  `expected first 1.5`);
                expect(isCloseTo(numberAfter(firstInfo, 'Gamma: '), 1.5, 0.001)).assertTrue();
                await addLog(`testCreateResetCreate0001: actual=${resetInfo}, expected empty reset result`);
                expect(resetInfo).assertEqual('');
                await addLog(`testCreateResetCreate0001: actual gamma=${numberAfter(secondInfo, 'Gamma: ')}, ` +
                  `expected default 2.2`);
                expect(isCloseTo(numberAfter(secondInfo, 'Gamma: '), 2.2, 0.001)).assertTrue();
                await addLog(`testCreateResetCreate0001: actual=${secondInfo}, expected default red primaries`);
                expect(secondInfo).assertContain('R(0.64,0.33)');
            }, done);
        });

        // ==================== 坐标上界错误（1 条） ====================

        /*
         * @tc.number: SUB_CS_GAMMA_2000
         * @tc.name: testOutOfRangePrimary0001
         * @tc.desc: Verify a primary coordinate above one is accepted by the platform and echoed in the result.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testOutOfRangePrimary0001', 0, async (done: Function) => {
            await runCase('testOutOfRangePrimary0001', async (): Promise<void> => {
                await navigateToCustom();
                await inputText('InputRedX', '1.2');
                await clickId('BtnCreateCustom');
                // The platform accepts coordinates above one, so the value is echoed instead of rejected.
                const info: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const redX: string = await textOfId('InputRedX');
                const rejected: boolean = info.includes('Error:');
                await addLog(`testOutOfRangePrimary0001: actual=${info}, expected red X echoed`);
                expect(info).assertContain('Primaries: R(1.2,0.33) G(0.3,0.6) B(0.15,0.06)');
                await addLog(`testOutOfRangePrimary0001: actual=${redX}, expected preserved input=1.2`);
                expect(redX).assertEqual('1.2');
                await addLog(`testOutOfRangePrimary0001: actual rejected=${rejected}, expected=false`);
                expect(rejected).assertFalse();
            }, done);
        });

        // ==================== 负白点错误（1 条） ====================

        /*
         * @tc.number: SUB_CS_GAMMA_2100
         * @tc.name: testNegativeWhitePoint0001
         * @tc.desc: Verify a negative white point is accepted by the platform and keeps the input.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNegativeWhitePoint0001', 0, async (done: Function) => {
            await runCase('testNegativeWhitePoint0001', async (): Promise<void> => {
                await navigateToCustom();
                await inputText('InputWhiteX', '-0.1');
                await clickId('BtnCreateCustom');
                // The platform accepts negative CIE coordinates, so the value is echoed instead of rejected.
                const info: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const whiteX: string = await textOfId('InputWhiteX');
                const rejected: boolean = info.includes('Error:');
                await addLog(`testNegativeWhitePoint0001: actual=${info}, expected white X echoed`);
                expect(info).assertContain('WhitePoint Input: (-0.1,0.329)');
                await addLog(`testNegativeWhitePoint0001: actual=${whiteX}, expected preserved input=-0.1`);
                expect(whiteX).assertEqual('-0.1');
                await addLog(`testNegativeWhitePoint0001: actual rejected=${rejected}, expected=false`);
                expect(rejected).assertFalse();
            }, done);
        });

        // ==================== 空白输入回退（1 条） ====================

        /*
         * @tc.number: SUB_CS_GAMMA_2200
         * @tc.name: testWhitespaceInputFallback0001
         * @tc.desc: Verify whitespace input uses the default coordinate and remains visible.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testWhitespaceInputFallback0001', 0, async (done: Function) => {
            await runCase('testWhitespaceInputFallback0001', async (): Promise<void> => {
                await navigateToCustom();
                await inputText('InputRedX', '   ');
                await inputText('InputRedY', '0.34');
                await clickId('BtnCreateCustom');
                const info: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const redX: string = await textOfId('InputRedX');
                await addLog(`testWhitespaceInputFallback0001: actual=[${redX}], expected three spaces`);
                expect(redX).assertEqual('   ');
                await addLog(`testWhitespaceInputFallback0001: actual=${info}, expected fallback red X and red Y 0.34`);
                expect(info).assertContain('R(0.64,0.34)');
                await addLog(`testWhitespaceInputFallback0001: actual=${info}, expected unchanged green primary`);
                expect(info).assertContain('G(0.3,0.6)');
            }, done);
        });

        // ==================== 数值前缀输入（1 条） ====================

        /*
         * @tc.number: SUB_CS_GAMMA_2300
         * @tc.name: testNumericPrefixInput0001
         * @tc.desc: Verify a numeric prefix is parsed while the original input remains visible.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumericPrefixInput0001', 0, async (done: Function) => {
            await runCase('testNumericPrefixInput0001', async (): Promise<void> => {
                await navigateToCustom();
                await inputText('InputRedX', '0.68abc');
                await clickId('BtnCreateCustom');
                const info: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const redX: string = await textOfId('InputRedX');
                await addLog(`testNumericPrefixInput0001: actual=${redX}, expected=0.68abc`);
                expect(redX).assertEqual('0.68abc');
                await addLog(`testNumericPrefixInput0001: actual=${info}, expected parsed red X 0.68`);
                expect(info).assertContain('R(0.68,0.33)');
                await addLog(`testNumericPrefixInput0001: actual=${info}, expected unchanged white point`);
                expect(info).assertContain('WhitePoint Input: (0.3127,0.329)');
            }, done);
        });

        // ==================== 创建错误后重置恢复（1 条） ====================

        /*
         * @tc.number: SUB_CS_GAMMA_2400
         * @tc.name: testResetAfterCreateError0001
         * @tc.desc: Verify reset clears a created result and a later creation uses the defaults.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testResetAfterCreateError0001', 0, async (done: Function) => {
            await runCase('testResetAfterCreateError0001', async (): Promise<void> => {
                await navigateToCustom();
                await inputText('InputRedX', '-1');
                await clickId('BtnCreateCustom');
                const createdInfo: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                await clickId('BtnReset');
                const redX: string = await textOfId('InputRedX');
                const resetInfo: string = await textOrEmpty('CustomColorSpaceInfo');
                await clickId('BtnCreateCustom');
                const recreatedInfo: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                await addLog(`testResetAfterCreateError0001: actual=${createdInfo}, expected negative red X echoed`);
                expect(createdInfo).assertContain('Primaries: R(-1,0.33)');
                await addLog(`testResetAfterCreateError0001: actual=${redX}, expected reset red X=0.64`);
                expect(redX).assertEqual('0.64');
                await addLog(`testResetAfterCreateError0001: actual=${resetInfo}, expected empty reset result`);
                expect(resetInfo).assertEqual('');
                await addLog(`testResetAfterCreateError0001: actual=${recreatedInfo}, expected default custom result`);
                expect(recreatedInfo).assertContain('Primaries: R(0.64,0.33) G(0.3,0.6) B(0.15,0.06)');
            }, done);
        });
    });
}
