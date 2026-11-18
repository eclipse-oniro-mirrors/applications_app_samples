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
    navigateToChromaticity,
    clickId,
    textOfId,
    inputText,
    existsId,
    waitId
} from '../testkit/SharedDriver';

const INDEX_TITLE_ID = 'TitleText';
const CHROM_PAGE_TITLE_ID = 'ChromPageTitle';

export default function chromaticityDiagramTest(): void {
    describe('ChromaticityDiagramTest', () => {

        /*
         * @tc.number: SUB_CS_CHROM_0001
         * @tc.name: testChromNavigate0001
         * @tc.desc: Verify the chromaticity page opens from the index with every configured space listed.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testChromNavigate0001', 0, async (done: Function) => {
            await runCase('testChromNavigate0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToChromaticity();
                const title: string = await textOfId(CHROM_PAGE_TITLE_ID);
                await addLog(`testChromNavigate0001: actual title=${title}, expected=CIE Chromaticity Diagram`);
                expect(title).assertEqual('CIE Chromaticity Diagram');
                const summary: string = await textOfId('ChromSummaryText');
                await addLog(`testChromNavigate0001: actual summary=${summary}, expected=Spaces:26 Selected:SRGB`);
                expect(summary).assertEqual('Spaces:26 Selected:SRGB');
                await addLog('testChromNavigate0001: actual canvas present=true, expected=true');
                expect(await existsId('ChromCanvas')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHROM_0002
         * @tc.name: testChromDefaultArea0001
         * @tc.desc: Verify the page starts on sRGB and reports the published triangle area and coverage.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testChromDefaultArea0001', 0, async (done: Function) => {
            await runCase('testChromDefaultArea0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToChromaticity();
                const area: string = await textOfId('ChromAreaText');
                await addLog(`testChromDefaultArea0001: actual area line=${area}, ` +
                    'expected=Area:0.1121 Ratio:1.000 Covers:YES');
                expect(area).assertEqual('Area:0.1121 Ratio:1.000 Covers:YES');
                await addLog(`testChromDefaultArea0001: actual area=${numberAfter(area, 'Area:')}, expected=0.1121`);
                expect(isCloseTo(numberAfter(area, 'Area:'), 0.1121, 0.0002)).assertTrue();
                await addLog(`testChromDefaultArea0001: actual ratio=${numberAfter(area, 'Ratio:')}, expected=1`);
                expect(isCloseTo(numberAfter(area, 'Ratio:'), 1, 0.0005)).assertTrue();
                const white: string = await textOfId('ChromWhiteText');
                await addLog(`testChromDefaultArea0001: actual white line=${white}, ` +
                    'expected=White x:0.3127 y:0.3290 DistD65:0.0000');
                expect(white).assertEqual('White x:0.3127 y:0.3290 DistD65:0.0000');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHROM_0003
         * @tc.name: testChromSelectP30001
         * @tc.desc: Verify selecting Display P3 updates the area, the ratio and the coverage verdict.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testChromSelectP30001', 0, async (done: Function) => {
            await runCase('testChromSelectP30001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToChromaticity();
                await clickId('ChromSpace_Display_P3');
                const summary: string = await textOfId('ChromSummaryText');
                await addLog(`testChromSelectP30001: actual summary=${summary}, ` +
                  `expected=Spaces:26 Selected:Display_P3`);
                expect(summary).assertEqual('Spaces:26 Selected:Display_P3');
                const area: string = await textOfId('ChromAreaText');
                await addLog(`testChromSelectP30001: actual area line=${area}, ` +
                    'expected=Area:0.1520 Ratio:1.357 Covers:YES');
                expect(area).assertEqual('Area:0.1520 Ratio:1.357 Covers:YES');
                await addLog(`testChromSelectP30001: actual area=${numberAfter(area, 'Area:')}, expected=0.1520`);
                expect(isCloseTo(numberAfter(area, 'Area:'), 0.1520, 0.0002)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHROM_0004
         * @tc.name: testChromSelectBT20200001
         * @tc.desc: Verify BT.2020 is reported as the widest triangle that still covers sRGB.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testChromSelectBT20200001', 0, async (done: Function) => {
            await runCase('testChromSelectBT20200001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToChromaticity();
                await clickId('ChromSpace_BT2020_HLG');
                const area: string = await textOfId('ChromAreaText');
                await addLog(`testChromSelectBT20200001: actual area line=${area}, ` +
                    'expected=Area:0.2119 Ratio:1.891 Covers:YES');
                expect(area).assertEqual('Area:0.2119 Ratio:1.891 Covers:YES');
                await addLog(`testChromSelectBT20200001: actual ratio=${numberAfter(area, 'Ratio:')}, expected>1.8`);
                expect(numberAfter(area, 'Ratio:') > 1.8).assertTrue();
                await addLog('testChromSelectBT20200001: actual coverage token=YES, expected=YES');
                expect(area.endsWith('Covers:YES')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHROM_0005
         * @tc.name: testChromNarrowCoverage0001
         * @tc.desc: Verify a narrower triangle reports a ratio below one and no sRGB coverage.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testChromNarrowCoverage0001', 0, async (done: Function) => {
            await runCase('testChromNarrowCoverage0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToChromaticity();
                await clickId('ChromSpace_BT601_SMPTE_C');
                const area: string = await textOfId('ChromAreaText');
                await addLog(`testChromNarrowCoverage0001: actual area line=${area}, ` +
                    'expected=Area:0.1038 Ratio:0.926 Covers:NO');
                expect(area).assertEqual('Area:0.1038 Ratio:0.926 Covers:NO');
                await addLog(`testChromNarrowCoverage0001: actual ratio=${numberAfter(area, 'Ratio:')}, expected<1`);
                expect(numberAfter(area, 'Ratio:') < 1).assertTrue();
                await addLog('testChromNarrowCoverage0001: actual coverage token=NO, expected=NO');
                expect(area.endsWith('Covers:NO')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHROM_0006
         * @tc.name: testChromWhitePoint0001
         * @tc.desc: Verify the white point of DCI-P3 is reported as offset from the sRGB white point.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testChromWhitePoint0001', 0, async (done: Function) => {
            await runCase('testChromWhitePoint0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToChromaticity();
                await clickId('ChromSpace_DCI_P3');
                const white: string = await textOfId('ChromWhiteText');
                await addLog(`testChromWhitePoint0001: actual white line=${white}, ` +
                    'expected=White x:0.3140 y:0.3510 DistD65:0.0220');
                expect(white).assertEqual('White x:0.3140 y:0.3510 DistD65:0.0220');
                const distance: number = numberAfter(white, 'DistD65:');
                await addLog(`testChromWhitePoint0001: actual distance=${distance}, expected>0.02`);
                expect(distance > 0.02).assertTrue();
                await clickId('ChromSpace_BT709');
                const restored: string = await textOfId('ChromWhiteText');
                await addLog(`testChromWhitePoint0001: actual BT709 white line=${restored}, ` +
                    'expected=White x:0.3127 y:0.3290 DistD65:0.0000');
                expect(restored).assertEqual('White x:0.3127 y:0.3290 DistD65:0.0000');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHROM_0007
         * @tc.name: testChromReferenceToggle0001
         * @tc.desc: Verify the reference overlay toggles between on and off on each tap.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testChromReferenceToggle0001', 0, async (done: Function) => {
            await runCase('testChromReferenceToggle0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToChromaticity();
                const initial: string = await textOfId('ChromCompareText');
                await addLog(`testChromReferenceToggle0001: actual initial=${initial}, expected=Reference:OFF`);
                expect(initial).assertEqual('Reference:OFF');
                await clickId('ChromBtnCompare');
                const enabled: string = await textOfId('ChromCompareText');
                await addLog(`testChromReferenceToggle0001: actual first tap=${enabled}, expected=Reference:ON`);
                expect(enabled).assertEqual('Reference:ON');
                await clickId('ChromBtnCompare');
                const disabled: string = await textOfId('ChromCompareText');
                await addLog(`testChromReferenceToggle0001: actual second tap=${disabled}, expected=Reference:OFF`);
                expect(disabled).assertEqual('Reference:OFF');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHROM_0008
         * @tc.name: testChromProbeInside0001
         * @tc.desc: Verify the default probe sits inside sRGB and stays inside the wider P3 triangle.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testChromProbeInside0001', 0, async (done: Function) => {
            await runCase('testChromProbeInside0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToChromaticity();
                const inside: string = await textOfId('ChromPointText');
                await addLog(`testChromProbeInside0001: actual probe line=${inside}, ` +
                    'expected=Point x:0.3127 y:0.3290 Inside:YES');
                expect(inside).assertEqual('Point x:0.3127 y:0.3290 Inside:YES');
                await clickId('ChromSpace_Display_P3');
                const widened: string = await textOfId('ChromPointText');
                await addLog(`testChromProbeInside0001: actual probe line on P3=${widened}, expected Inside:YES`);
                expect(widened.endsWith('Inside:YES')).assertTrue();
                await addLog('testChromProbeInside0001: actual probe x text=starts with Point x:0.3127');
                expect(widened.startsWith('Point x:0.3127')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHROM_0009
         * @tc.name: testChromProbeOutside0001
         * @tc.desc: Verify a probe outside the sRGB triangle is reported as outside.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testChromProbeOutside0001', 0, async (done: Function) => {
            await runCase('testChromProbeOutside0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToChromaticity();
                await inputText('ChromInputX', '0.7');
                await inputText('ChromInputY', '0.25');
                await clickId('ChromBtnLocate');
                const outside: string = await textOfId('ChromPointText');
                await addLog(`testChromProbeOutside0001: actual probe line=${outside}, ` +
                    'expected=Point x:0.7000 y:0.2500 Inside:NO');
                expect(outside).assertEqual('Point x:0.7000 y:0.2500 Inside:NO');
                await addLog(`testChromProbeOutside0001: actual x=${numberAfter(outside, 'Point x:')}, expected=0.7`);
                expect(isCloseTo(numberAfter(outside, 'Point x:'), 0.7, 0.0001)).assertTrue();
                await addLog('testChromProbeOutside0001: actual verdict token=NO, expected=NO');
                expect(outside.endsWith('Inside:NO')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHROM_0010
         * @tc.name: testChromProbeInvalid0001
         * @tc.desc: Verify an out of range coordinate is rejected instead of being drawn.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testChromProbeInvalid0001', 0, async (done: Function) => {
            await runCase('testChromProbeInvalid0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToChromaticity();
                await inputText('ChromInputX', '1.5');
                await clickId('ChromBtnLocate');
                const rejected: string = await textOfId('ChromPointText');
                await addLog(`testChromProbeInvalid0001: actual line=${rejected}, ` +
                    'expected=Point invalid: enter numbers in 0..1');
                expect(rejected).assertEqual('Point invalid: enter numbers in 0..1');
                await addLog('testChromProbeInvalid0001: actual verdict token absent, expected=true');
                expect(rejected.includes('Inside:')).assertFalse();
                await inputText('ChromInputX', '0.3127');
                await clickId('ChromBtnLocate');
                const recovered: string = await textOfId('ChromPointText');
                await addLog(`testChromProbeInvalid0001: actual line after recovery=${recovered}, ` +
                    'expected=Point x:0.3127 y:0.3290 Inside:YES');
                expect(recovered).assertEqual('Point x:0.3127 y:0.3290 Inside:YES');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHROM_0011
         * @tc.name: testChromReset0001
         * @tc.desc: Verify reset restores the sRGB selection, the reference overlay and the default probe.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testChromReset0001', 0, async (done: Function) => {
            await runCase('testChromReset0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToChromaticity();
                await clickId('ChromSpace_BT2020_HLG');
                await clickId('ChromBtnCompare');
                await inputText('ChromInputX', '0.7');
                await clickId('ChromBtnLocate');
                await clickId('ChromBtnReset');
                const summary: string = await textOfId('ChromSummaryText');
                await addLog(`testChromReset0001: actual summary=${summary}, expected=Spaces:26 Selected:SRGB`);
                expect(summary).assertEqual('Spaces:26 Selected:SRGB');
                const area: string = await textOfId('ChromAreaText');
                await addLog(`testChromReset0001: actual area line=${area}, ` +
                    'expected=Area:0.1121 Ratio:1.000 Covers:YES');
                expect(area).assertEqual('Area:0.1121 Ratio:1.000 Covers:YES');
                const reference: string = await textOfId('ChromCompareText');
                await addLog(`testChromReset0001: actual reference=${reference}, expected=Reference:OFF`);
                expect(reference).assertEqual('Reference:OFF');
                const point: string = await textOfId('ChromPointText');
                await addLog(`testChromReset0001: actual probe line=${point}, ` +
                    'expected=Point x:0.3127 y:0.3290 Inside:YES');
                expect(point).assertEqual('Point x:0.3127 y:0.3290 Inside:YES');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHROM_0012
         * @tc.name: testChromBack0001
         * @tc.desc: Verify the page back button returns to the index without leaving the page stacked.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testChromBack0001', 0, async (done: Function) => {
            await runCase('testChromBack0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToChromaticity();
                await clickId('ChromBtnBack');
                await waitId(INDEX_TITLE_ID);
                await addLog('testChromBack0001: actual index visible=true, expected=true');
                expect(await existsId(INDEX_TITLE_ID)).assertTrue();
                await addLog('testChromBack0001: actual page title gone=true, expected=true');
                expect(await existsId(CHROM_PAGE_TITLE_ID)).assertFalse();
                await addLog('testChromBack0001: actual navigation button visible=true, expected=true');
                expect(await existsId('NavChromaticity')).assertTrue();
            }, done);
        });
    });
}
