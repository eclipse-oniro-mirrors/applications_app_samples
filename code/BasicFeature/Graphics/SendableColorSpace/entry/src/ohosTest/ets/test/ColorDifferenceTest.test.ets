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

import { describe, it, expect } from '@ohos/hypium';
import {
    runCase,
    addLog,
    isCloseTo,
    numberAfter,
    resetToIndex,
    navigateToDifference,
    clickId,
    textOfId,
    existsId,
    setSliderValue,
    waitId
} from '../testkit/SharedDriver';

const INDEX_TITLE_ID = 'TitleText';
const DIFF_PAGE_TITLE_ID = 'DiffPageTitle';

// The band table the page applies to the reported CIE2000 value.
function bandOf(deltaE: number): string {
    if (deltaE < 1) {
        return 'Imperceptible';
    }
    if (deltaE < 2) {
        return 'Slight';
    }
    if (deltaE < 10) {
        return 'Noticeable';
    }
    return 'Obvious';
}

export default function colorDifferenceTest(): void {
    describe('ColorDifferenceTest', () => {

        /*
         * @tc.number: SUB_CS_DIFF_0001
         * @tc.name: testDiffNavigate0001
         * @tc.desc: Verify the difference page opens on the sRGB space with the white to black preset.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDiffNavigate0001', 0, async (done: Function) => {
            await runCase('testDiffNavigate0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                const title: string = await textOfId(DIFF_PAGE_TITLE_ID);
                await addLog(`testDiffNavigate0001: actual title=${title}, expected=Color Difference`);
                expect(title).assertEqual('Color Difference');
                const space: string = await textOfId('DiffSpaceText');
                await addLog(`testDiffNavigate0001: actual space line=${space}, expected=Space:SRGB`);
                expect(space).assertEqual('Space:SRGB');
                const preset: string = await textOfId('DiffPresetText');
                await addLog(`testDiffNavigate0001: actual preset line=${preset}, expected=Preset:White/Black`);
                expect(preset).assertEqual('Preset:White/Black');
                const colorA: string = await textOfId('DiffColorAText');
                await addLog(`testDiffNavigate0001: actual color A=${colorA}, expected=A:(255, 255, 255)`);
                expect(colorA).assertEqual('A:(255, 255, 255)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0002
         * @tc.name: testDiffDefaultDelta0001
         * @tc.desc: Verify white against black is reported as a full lightness difference by all three metrics.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDiffDefaultDelta0001', 0, async (done: Function) => {
            await runCase('testDiffDefaultDelta0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                const delta: string = await textOfId('DiffDeltaText');
                await addLog(`testDiffDefaultDelta0001: actual delta line=${delta}, ` +
                    'expected=dE76:100.000 dE94:100.000 dE2000:100.000');
                expect(delta).assertEqual('dE76:100.000 dE94:100.000 dE2000:100.000');
                await addLog(`testDiffDefaultDelta0001: actual dE76=${numberAfter(delta, 'dE76:')}, expected=100`);
                expect(isCloseTo(numberAfter(delta, 'dE76:'), 100, 0.01)).assertTrue();
                await addLog(`testDiffDefaultDelta0001: actual dE2000=${numberAfter(delta, 'dE2000:')}, expected=100`);
                expect(isCloseTo(numberAfter(delta, 'dE2000:'), 100, 0.01)).assertTrue();
                const verdict: string = await textOfId('DiffVerdictText');
                await addLog(`testDiffDefaultDelta0001: actual verdict=${verdict}, expected=Verdict:Obvious`);
                expect(verdict).assertEqual('Verdict:Obvious');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0003
         * @tc.name: testDiffIdentical0001
         * @tc.desc: Verify two identical colors report a zero difference and the lowest verdict band.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDiffIdentical0001', 0, async (done: Function) => {
            await runCase('testDiffIdentical0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                await clickId('DiffPreset4');
                const preset: string = await textOfId('DiffPresetText');
                await addLog(`testDiffIdentical0001: actual preset line=${preset}, expected=Preset:Identical`);
                expect(preset).assertEqual('Preset:Identical');
                const delta: string = await textOfId('DiffDeltaText');
                await addLog(`testDiffIdentical0001: actual delta line=${delta}, ` +
                    'expected=dE76:0.000 dE94:0.000 dE2000:0.000');
                expect(delta).assertEqual('dE76:0.000 dE94:0.000 dE2000:0.000');
                const colorA: string = await textOfId('DiffColorAText');
                const colorB: string = await textOfId('DiffColorBText');
                await addLog(`testDiffIdentical0001: actual colors A=${colorA} B=${colorB}, expected equal`);
                expect(colorA.substring(2)).assertEqual(colorB.substring(2));
                const verdict: string = await textOfId('DiffVerdictText');
                await addLog(`testDiffIdentical0001: actual verdict=${verdict}, expected=Verdict:Imperceptible`);
                expect(verdict).assertEqual('Verdict:Imperceptible');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0004
         * @tc.name: testDiffPresetGrayStep0001
         * @tc.desc: Verify a mid gray step stays below the Euclidean difference once CIE2000 weighting applies.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDiffPresetGrayStep0001', 0, async (done: Function) => {
            await runCase('testDiffPresetGrayStep0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                await clickId('DiffPreset1');
                const colorA: string = await textOfId('DiffColorAText');
                await addLog(`testDiffPresetGrayStep0001: actual color A=${colorA}, expected=A:(128, 128, 128)`);
                expect(colorA).assertEqual('A:(128, 128, 128)');
                const colorB: string = await textOfId('DiffColorBText');
                await addLog(`testDiffPresetGrayStep0001: actual color B=${colorB}, expected=B:(160, 160, 160)`);
                expect(colorB).assertEqual('B:(160, 160, 160)');
                const delta: string = await textOfId('DiffDeltaText');
                const difference76: number = numberAfter(delta, 'dE76:');
                const difference2000: number = numberAfter(delta, 'dE2000:');
                await addLog(`testDiffPresetGrayStep0001: actual dE76=${difference76}, expected>8`);
                expect(difference76 > 8).assertTrue();
                await addLog(`testDiffPresetGrayStep0001: actual dE2000=${difference2000}, expected below dE76`);
                expect(difference2000 < difference76).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0005
         * @tc.name: testDiffPresetNearRed0001
         * @tc.desc: Verify a small red step reports a positive difference that CIE2000 does not inflate.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testDiffPresetNearRed0001', 0, async (done: Function) => {
            await runCase('testDiffPresetNearRed0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                await clickId('DiffPreset2');
                const colorA: string = await textOfId('DiffColorAText');
                await addLog(`testDiffPresetNearRed0001: actual color A=${colorA}, expected=A:(200, 30, 40)`);
                expect(colorA).assertEqual('A:(200, 30, 40)');
                const delta: string = await textOfId('DiffDeltaText');
                const difference76: number = numberAfter(delta, 'dE76:');
                const difference2000: number = numberAfter(delta, 'dE2000:');
                await addLog(`testDiffPresetNearRed0001: actual dE2000=${difference2000}, expected>0`);
                expect(difference2000 > 0).assertTrue();
                await addLog(`testDiffPresetNearRed0001: actual dE2000=${difference2000}, ` +
                  `expected below dE76=${difference76}`);
                expect(difference2000 < difference76).assertTrue();
                const lab: string = await textOfId('DiffLabText');
                await addLog(`testDiffPresetNearRed0001: actual lab line prefix=${lab.substring(0, 12)}, ` +
                  `expected=LabA:L=`);
                expect(lab.startsWith('LabA:L=')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0006
         * @tc.name: testDiffPresetBlueStep0001
         * @tc.desc: Verify a five level blue step stays a small difference and is not called obvious.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testDiffPresetBlueStep0001', 0, async (done: Function) => {
            await runCase('testDiffPresetBlueStep0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                await clickId('DiffPreset3');
                const colorB: string = await textOfId('DiffColorBText');
                await addLog(`testDiffPresetBlueStep0001: actual color B=${colorB}, expected=B:(0, 0, 250)`);
                expect(colorB).assertEqual('B:(0, 0, 250)');
                const delta: string = await textOfId('DiffDeltaText');
                const difference76: number = numberAfter(delta, 'dE76:');
                await addLog(`testDiffPresetBlueStep0001: actual dE76=${difference76}, expected between 0 and 6`);
                expect(difference76 > 0).assertTrue();
                await addLog(`testDiffPresetBlueStep0001: actual dE76=${difference76}, expected below 6`);
                expect(difference76 < 6).assertTrue();
                const verdict: string = await textOfId('DiffVerdictText');
                await addLog(`testDiffPresetBlueStep0001: actual verdict=${verdict}, expected not Obvious`);
                expect(verdict === 'Verdict:Obvious').assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0007
         * @tc.name: testDiffPresetYellowGreen0001
         * @tc.desc: Verify opposite hues report an obvious difference in every metric.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDiffPresetYellowGreen0001', 0, async (done: Function) => {
            await runCase('testDiffPresetYellowGreen0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                await clickId('DiffPreset5');
                const preset: string = await textOfId('DiffPresetText');
                await addLog(`testDiffPresetYellowGreen0001: actual preset line=${preset}, ` +
                  `expected=Preset:YellowGreen`);
                expect(preset).assertEqual('Preset:YellowGreen');
                const delta: string = await textOfId('DiffDeltaText');
                const difference2000: number = numberAfter(delta, 'dE2000:');
                await addLog(`testDiffPresetYellowGreen0001: actual dE2000=${difference2000}, expected>10`);
                expect(difference2000 > 10).assertTrue();
                const verdict: string = await textOfId('DiffVerdictText');
                await addLog(`testDiffPresetYellowGreen0001: actual verdict=${verdict}, expected=Verdict:Obvious`);
                expect(verdict).assertEqual('Verdict:Obvious');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0008
         * @tc.name: testDiffSwapSymmetry0001
         * @tc.desc: Verify swapping the two colors keeps the difference and exchanges the previews.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDiffSwapSymmetry0001', 0, async (done: Function) => {
            await runCase('testDiffSwapSymmetry0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                await clickId('DiffPreset2');
                const before: string = await textOfId('DiffDeltaText');
                await clickId('DiffBtnSwap');
                const after: string = await textOfId('DiffDeltaText');
                await addLog(`testDiffSwapSymmetry0001: before=${before} after=${after}, expected equal`);
                expect(after).assertEqual(before);
                const colorA: string = await textOfId('DiffColorAText');
                await addLog(`testDiffSwapSymmetry0001: actual color A after swap=${colorA}, expected=A:(205, 40, 45)`);
                expect(colorA).assertEqual('A:(205, 40, 45)');
                const colorB: string = await textOfId('DiffColorBText');
                await addLog(`testDiffSwapSymmetry0001: actual color B after swap=${colorB}, expected=B:(200, 30, 40)`);
                expect(colorB).assertEqual('B:(200, 30, 40)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0009
         * @tc.name: testDiffSpaceChange0001
         * @tc.desc: Verify the same bytes report a different difference once the color space changes.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDiffSpaceChange0001', 0, async (done: Function) => {
            await runCase('testDiffSpaceChange0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                await clickId('DiffPreset2');
                const srgbDelta: string = await textOfId('DiffDeltaText');
                await clickId('DiffSpace_BT2020_HLG');
                const space: string = await textOfId('DiffSpaceText');
                await addLog(`testDiffSpaceChange0001: actual space line=${space}, expected=Space:BT2020_HLG`);
                expect(space).assertEqual('Space:BT2020_HLG');
                const wideDelta: string = await textOfId('DiffDeltaText');
                await addLog(`testDiffSpaceChange0001: sRGB=${srgbDelta} BT2020=${wideDelta}, expected different`);
                expect(wideDelta === srgbDelta).assertFalse();
                const wideValue: number = numberAfter(wideDelta, 'dE76:');
                const narrowValue: number = numberAfter(srgbDelta, 'dE76:');
                await addLog(`testDiffSpaceChange0001: actual BT2020 dE76=${wideValue}, sRGB dE76=${narrowValue}`);
                expect(Math.abs(wideValue - narrowValue) > 0.01).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0010
         * @tc.name: testDiffSliderChange0001
         * @tc.desc: Verify dragging the red slider of color A updates the value label and the preview.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDiffSliderChange0001', 0, async (done: Function) => {
            await runCase('testDiffSliderChange0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                const before: string = await textOfId('DiffDeltaText');
                await setSliderValue('DiffSliderR', 64, 0, 255, 255, 'DiffRValue');
                const shown: string = await textOfId('DiffRValue');
                await addLog(`testDiffSliderChange0001: actual label=${shown}, expected=64`);
                expect(shown).assertEqual('64');
                const colorA: string = await textOfId('DiffColorAText');
                await addLog(`testDiffSliderChange0001: actual color A=${colorA}, expected prefix A:(64,`);
                expect(colorA.startsWith('A:(64,')).assertTrue();
                const delta: string = await textOfId('DiffDeltaText');
                await addLog(`testDiffSliderChange0001: before=${before} after=${delta}, expected different`);
                expect(delta === before).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0011
         * @tc.name: testDiffSliderZero0001
         * @tc.desc: Verify driving color A to black reproduces the black to black zero difference.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testDiffSliderZero0001', 0, async (done: Function) => {
            await runCase('testDiffSliderZero0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                await setSliderValue('DiffSliderR', 0, 0, 255, 255, 'DiffRValue');
                await setSliderValue('DiffSliderG', 0, 0, 255, 255, 'DiffGValue');
                await setSliderValue('DiffSliderB', 0, 0, 255, 255, 'DiffBValue');
                const colorA: string = await textOfId('DiffColorAText');
                await addLog(`testDiffSliderZero0001: actual color A=${colorA}, expected=A:(0, 0, 0)`);
                expect(colorA).assertEqual('A:(0, 0, 0)');
                const delta: string = await textOfId('DiffDeltaText');
                await addLog(`testDiffSliderZero0001: actual delta line=${delta}, ` +
                    'expected=dE76:0.000 dE94:0.000 dE2000:0.000');
                expect(delta).assertEqual('dE76:0.000 dE94:0.000 dE2000:0.000');
                const verdict: string = await textOfId('DiffVerdictText');
                await addLog(`testDiffSliderZero0001: actual verdict=${verdict}, expected=Verdict:Imperceptible`);
                expect(verdict).assertEqual('Verdict:Imperceptible');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0012
         * @tc.name: testDiffVerdictBands0001
         * @tc.desc: Verify every preset reports the verdict band that matches its CIE2000 value.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testDiffVerdictBands0001', 0, async (done: Function) => {
            await runCase('testDiffVerdictBands0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                let matched: number = 0;
                let imperceptible: number = 0;
                let obvious: number = 0;
                for (let index = 0; index < 6; index++) {
                    await clickId(`DiffPreset${index}`);
                    const delta: string = await textOfId('DiffDeltaText');
                    const verdict: string = await textOfId('DiffVerdictText');
                    const value: number = numberAfter(delta, 'dE2000:');
                    const expected: string = `Verdict:${bandOf(value)}`;
                    await addLog(`testDiffVerdictBands0001: preset ${index} dE2000=${value} verdict=${verdict}, ` +
                        `expected=${expected}`);
                    expect(verdict).assertEqual(expected);
                    if (verdict === expected) {
                        matched++;
                    }
                    if (verdict === 'Verdict:Imperceptible') {
                        imperceptible++;
                    }
                    if (verdict === 'Verdict:Obvious') {
                        obvious++;
                    }
                }
                await addLog(`testDiffVerdictBands0001: actual matched presets=${matched}, expected=6`);
                expect(matched).assertEqual(6);
                await addLog(`testDiffVerdictBands0001: actual imperceptible=${imperceptible}, expected at least 1`);
                expect(imperceptible >= 1).assertTrue();
                await addLog(`testDiffVerdictBands0001: actual obvious=${obvious}, expected at least 1`);
                expect(obvious >= 1).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0013
         * @tc.name: testDiffLabText0001
         * @tc.desc: Verify the Lab block reports the published lightness of white and black.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testDiffLabText0001', 0, async (done: Function) => {
            await runCase('testDiffLabText0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                const lab: string = await textOfId('DiffLabText');
                await addLog(`testDiffLabText0001: actual lab line=${lab}, expected to start with LabA:L=100.00`);
                expect(lab.startsWith('LabA:L=100.00')).assertTrue();
                await addLog(`testDiffLabText0001: actual lab line=${lab}, ` +
                    'expected to end with LabB:L=0.00 a=0.00 b=0.00');
                expect(lab.endsWith('LabB:L=0.00 a=0.00 b=0.00')).assertTrue();
                await clickId('DiffPreset2');
                const redLab: string = await textOfId('DiffLabText');
                await addLog(`testDiffLabText0001: neutral=${lab} red=${redLab}, expected different Lab triples`);
                expect(redLab === lab).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0014
         * @tc.name: testDiffReset0001
         * @tc.desc: Verify reset restores the default space, the default preset and the default difference.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testDiffReset0001', 0, async (done: Function) => {
            await runCase('testDiffReset0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                await clickId('DiffPreset5');
                await clickId('DiffSpace_Adobe_RGB_1998');
                await clickId('DiffBtnReset');
                const space: string = await textOfId('DiffSpaceText');
                await addLog(`testDiffReset0001: actual space line=${space}, expected=Space:SRGB`);
                expect(space).assertEqual('Space:SRGB');
                const preset: string = await textOfId('DiffPresetText');
                await addLog(`testDiffReset0001: actual preset line=${preset}, expected=Preset:White/Black`);
                expect(preset).assertEqual('Preset:White/Black');
                const delta: string = await textOfId('DiffDeltaText');
                await addLog(`testDiffReset0001: actual delta line=${delta}, ` +
                    'expected=dE76:100.000 dE94:100.000 dE2000:100.000');
                expect(delta).assertEqual('dE76:100.000 dE94:100.000 dE2000:100.000');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_DIFF_0015
         * @tc.name: testDiffBack0001
         * @tc.desc: Verify the difference page back button returns to the index.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testDiffBack0001', 0, async (done: Function) => {
            await runCase('testDiffBack0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToDifference();
                await clickId('DiffBtnBack');
                await waitId(INDEX_TITLE_ID);
                await addLog('testDiffBack0001: actual index visible=true, expected=true');
                expect(await existsId(INDEX_TITLE_ID)).assertTrue();
                await addLog('testDiffBack0001: actual page title gone=true, expected=true');
                expect(await existsId(DIFF_PAGE_TITLE_ID)).assertFalse();
                await addLog('testDiffBack0001: actual index button visible=true, expected=true');
                expect(await existsId('NavDifference')).assertTrue();
            }, done);
        });
    });
}
