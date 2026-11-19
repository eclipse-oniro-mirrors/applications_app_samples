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
    startApp, runCase, addLog, resetToIndex, navigateToCustom, clickScrolledId, textOfId, textOrEmpty,
    numberAfter, isCloseTo, existsId, setSliderValue, scrollPageToTop
} from '../testkit/SharedDriver';

// The custom page declares the gamma slider as min 0.1, max 5.0, step 0.1 and starts at 2.2.
const GAMMA_MIN = 0.1;
const GAMMA_MAX = 5.0;
const GAMMA_START = 2.2;
const DEFAULT_PRIMARIES: string = 'Primaries: R(0.64,0.33) G(0.3,0.6) B(0.15,0.06)';

// Move the slider to the requested gamma and return the value shown next to it.
async function dragTo(gamma: number): Promise<string> {
    await setSliderValue('GammaSlider', gamma, GAMMA_MIN, GAMMA_MAX, GAMMA_START, 'GammaValue');
    return await textOfId('GammaValue');
}

export default function sliderBoundaryTest(): void {
    describe('SliderBoundary', () => {
        beforeAll(async () => {
            await addLog('SliderBoundary suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToCustom();
        });

        // ==================== Start value and single edits ====================

        /*
         * @tc.number: SUB_CS_SLIDER_0101
         * @tc.name: testSliderStartValue0001
         * @tc.desc: Check the gamma slider starts at 2.20 with no result shown yet.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSliderStartValue0001', 0, async (done: Function) => {
            await runCase('testSliderStartValue0001', async (): Promise<void> => {
                const shown: string = await textOfId('GammaValue');
                const info: string = await textOrEmpty('CustomColorSpaceInfo');
                await addLog(`testSliderStartValue0001: actual gamma display=${shown}, expected=2.20`);
                expect(shown).assertEqual('2.20');
                await addLog(`testSliderStartValue0001: actual info=${info}, expected empty before creation`);
                expect(info).assertEqual('');
                await addLog(`testSliderStartValue0001: slider control is reachable by id`);
                expect(await existsId('GammaSlider')).assertTrue();
                await addLog(`testSliderStartValue0001: the gamut canvas is already laid out`);
                expect(await existsId('CustomGamutCanvas')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_SLIDER_0102
         * @tc.name: testSliderLowerValue0001
         * @tc.desc: Select gamma 1.0 and check the created color space reports that gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSliderLowerValue0001', 0, async (done: Function) => {
            await runCase('testSliderLowerValue0001', async (): Promise<void> => {
                const shown: string = await dragTo(1.0);
                await addLog(`testSliderLowerValue0001: actual display=${shown}, expected=1.00`);
                expect(shown).assertEqual('1.00');
                await clickScrolledId('BtnCreateCustom');
                const info: string = await textOfId('CustomColorSpaceInfo');
                const gamma: number = numberAfter(info, 'Gamma: ');
                await addLog(`testSliderLowerValue0001: actual gamma=${gamma}, expected=1`);
                expect(isCloseTo(gamma, 1.0, 0.001)).assertTrue();
                await addLog(`testSliderLowerValue0001: creation kept the default primaries, info=${info}`);
                expect(info.includes(DEFAULT_PRIMARIES)).assertTrue();
                await addLog(`testSliderLowerValue0001: no uncaught error was surfaced`);
                expect(info.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_SLIDER_0103
         * @tc.name: testSliderMiddleValue0001
         * @tc.desc: Select gamma 3.0 and check the created color space reports that gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSliderMiddleValue0001', 0, async (done: Function) => {
            await runCase('testSliderMiddleValue0001', async (): Promise<void> => {
                const shown: string = await dragTo(3.0);
                await addLog(`testSliderMiddleValue0001: actual display=${shown}, expected=3.00`);
                expect(shown).assertEqual('3.00');
                await clickScrolledId('BtnCreateCustom');
                const info: string = await textOfId('CustomColorSpaceInfo');
                const gamma: number = numberAfter(info, 'Gamma: ');
                await addLog(`testSliderMiddleValue0001: actual gamma=${gamma}, expected=3`);
                expect(isCloseTo(gamma, 3.0, 0.001)).assertTrue();
                await addLog(`testSliderMiddleValue0001: name line present, info=${info}`);
                expect(info.includes('ColorSpaceName:')).assertTrue();
                await addLog(`testSliderMiddleValue0001: white point line present`);
                expect(info.includes('WhitePoint: [')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_SLIDER_0104
         * @tc.name: testSliderMinimum0001
         * @tc.desc: Select the lowest selectable gamma 0.1 and check the created color space keeps it.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSliderMinimum0001', 0, async (done: Function) => {
            await runCase('testSliderMinimum0001', async (): Promise<void> => {
                const shown: string = await dragTo(GAMMA_MIN);
                await addLog(`testSliderMinimum0001: actual display=${shown}, expected=0.10`);
                expect(shown).assertEqual('0.10');
                await clickScrolledId('BtnCreateCustom');
                const info: string = await textOfId('CustomColorSpaceInfo');
                const gamma: number = numberAfter(info, 'Gamma: ');
                await addLog(`testSliderMinimum0001: actual gamma=${gamma}, expected=0.1`);
                expect(isCloseTo(gamma, GAMMA_MIN, 0.001)).assertTrue();
                await addLog(`testSliderMinimum0001: the lower bound is accepted, no error in info=${info}`);
                expect(info.includes('Error:')).assertFalse();
                await addLog(`testSliderMinimum0001: creation produced the six documented lines`);
                expect(info.includes('WhitePoint Input: (')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_SLIDER_0105
         * @tc.name: testSliderMaximum0001
         * @tc.desc: Select the highest selectable gamma 5.0 and check the created color space keeps it.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSliderMaximum0001', 0, async (done: Function) => {
            await runCase('testSliderMaximum0001', async (): Promise<void> => {
                const shown: string = await dragTo(GAMMA_MAX);
                await addLog(`testSliderMaximum0001: actual display=${shown}, expected=5.00`);
                expect(shown).assertEqual('5.00');
                await clickScrolledId('BtnCreateCustom');
                const info: string = await textOfId('CustomColorSpaceInfo');
                const gamma: number = numberAfter(info, 'Gamma: ');
                await addLog(`testSliderMaximum0001: actual gamma=${gamma}, expected=5`);
                expect(isCloseTo(gamma, GAMMA_MAX, 0.001)).assertTrue();
                await addLog(`testSliderMaximum0001: the upper bound is accepted, no error in info=${info}`);
                expect(info.includes('Error:')).assertFalse();
                await addLog(`testSliderMaximum0001: primaries line still reports the defaults`);
                expect(info.includes(DEFAULT_PRIMARIES)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_SLIDER_0106
         * @tc.name: testSliderStepValue0001
         * @tc.desc: Select gamma 2.3 and check the slider snaps to the 0.1 step instead of a neighbouring value.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSliderStepValue0001', 0, async (done: Function) => {
            await runCase('testSliderStepValue0001', async (): Promise<void> => {
                const shown: string = await dragTo(2.3);
                await addLog(`testSliderStepValue0001: actual display=${shown}, expected=2.30`);
                expect(shown).assertEqual('2.30');
                await clickScrolledId('BtnCreateCustom');
                const info: string = await textOfId('CustomColorSpaceInfo');
                const gamma: number = numberAfter(info, 'Gamma: ');
                await addLog(`testSliderStepValue0001: actual gamma=${gamma}, expected=2.3`);
                expect(isCloseTo(gamma, 2.3, 0.001)).assertTrue();
                await addLog(`testSliderStepValue0001: primaries line kept the defaults, info=${info}`);
                expect(info.includes(DEFAULT_PRIMARIES)).assertTrue();
                await addLog(`testSliderStepValue0001: no uncaught error was surfaced`);
                expect(info.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_SLIDER_0107
         * @tc.name: testSliderResetValue0001
         * @tc.desc: Create with gamma 3.5, press reset and check both the display and the result return to the start.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSliderResetValue0001', 0, async (done: Function) => {
            await runCase('testSliderResetValue0001', async (): Promise<void> => {
                const shown: string = await dragTo(3.5);
                await addLog(`testSliderResetValue0001: actual display=${shown}, expected=3.50`);
                expect(shown).assertEqual('3.50');
                await clickScrolledId('BtnCreateCustom');
                const created: string = await textOfId('CustomColorSpaceInfo');
                const gamma: number = numberAfter(created, 'Gamma: ');
                await addLog(`testSliderResetValue0001: actual created gamma=${gamma}, expected=3.5`);
                expect(isCloseTo(gamma, 3.5, 0.001)).assertTrue();
                await clickScrolledId('BtnReset');
                const cleared: string = await textOrEmpty('CustomColorSpaceInfo');
                await addLog(`testSliderResetValue0001: actual result after reset=${cleared}, expected empty`);
                expect(cleared).assertEqual('');
                await scrollPageToTop();
                const restored: string = await textOfId('GammaValue');
                await addLog(`testSliderResetValue0001: actual display after reset=${restored}, expected=2.20`);
                expect(restored).assertEqual('2.20');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_SLIDER_0108
         * @tc.name: testSliderDisplayMatch0001
         * @tc.desc: Check the gamma printed in the result matches the value shown next to the slider.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSliderDisplayMatch0001', 0, async (done: Function) => {
            await runCase('testSliderDisplayMatch0001', async (): Promise<void> => {
                const shown: string = await dragTo(1.5);
                await addLog(`testSliderDisplayMatch0001: actual display=${shown}, expected=1.50`);
                expect(shown).assertEqual('1.50');
                await clickScrolledId('BtnCreateCustom');
                const info: string = await textOfId('CustomColorSpaceInfo');
                const gamma: number = numberAfter(info, 'Gamma: ');
                const displayed: number = parseFloat(shown);
                await addLog(`testSliderDisplayMatch0001: actual gamma=${gamma}, displayed=${displayed}`);
                expect(isCloseTo(gamma, displayed, 0.005)).assertTrue();
                await addLog(`testSliderDisplayMatch0001: white point input line kept the defaults, info=${info}`);
                expect(info.includes('WhitePoint Input: (0.3127,0.329)')).assertTrue();
                await addLog(`testSliderDisplayMatch0001: no uncaught error was surfaced`);
                expect(info.includes('Error:')).assertFalse();
            }, done);
        });
    });
}
