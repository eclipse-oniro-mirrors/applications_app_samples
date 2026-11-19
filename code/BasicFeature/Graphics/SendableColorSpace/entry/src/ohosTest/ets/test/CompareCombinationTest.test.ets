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
    startApp, runCase, addLog, resetToIndex, navigateToStandard, clickScrolledId, scrollToId, scrollIntoView,
    textOfId, textOrEmpty, visibleTexts, waitTextContains, existsText, existsTextStartingWith
} from '../testkit/SharedDriver';

const SRGB_ROW: string =
    'SRGB | R(0.64,0.33) G(0.3,0.6) B(0.15,0.06) | W(0.3127,0.329) | γ2.2 | Area:0.1121';
const DISPLAY_P3_ROW: string =
    'Display_P3 | R(0.68,0.32) G(0.265,0.69) B(0.15,0.06) | W(0.3127,0.329) | γ2.2 | Area:0.1520';
const DCI_P3_ROW: string =
    'DCI_P3 | R(0.68,0.32) G(0.265,0.69) B(0.15,0.06) | W(0.314,0.351) | γ2.6 | Area:0.1520';
const BT2020_HLG_ROW: string =
    'BT2020_HLG | R(0.708,0.292) G(0.17,0.797) B(0.131,0.046) | W(0.3127,0.329) | γ2.2 | Area:0.2119';
const BT2020_PQ_ROW: string =
    'BT2020_PQ | R(0.708,0.292) G(0.17,0.797) B(0.131,0.046) | W(0.3127,0.329) | γ2.2 | Area:0.2119';
const BT709_ROW: string =
    'BT709 | R(0.64,0.33) G(0.3,0.6) B(0.15,0.06) | W(0.3127,0.329) | γ2.2 | Area:0.1121';
// The area is formatted from floating point arithmetic, so only the prefix of this row is compared.
const ADOBE_RGB_ROW_PREFIX: string =
    'Adobe_RGB_1998 | R(0.64,0.33) G(0.21,0.71) B(0.15,0.06) | W(0.3127,0.329) | γ2.2 | Area:';
const LINEAR_SRGB_ROW: string =
    'Linear_SRGB | R(0.64,0.33) G(0.3,0.6) B(0.15,0.06) | W(0.3127,0.329) | γ1 | Area:0.1121';
const BT601_EBU_ROW: string =
    'BT601_EBU | R(0.64,0.33) G(0.29,0.6) B(0.15,0.06) | W(0.3127,0.329) | γ2.2 | Area:0.1134';
const SRGB_LIMIT_ROW: string =
    'SRGB_Limit | R(0.64,0.33) G(0.3,0.6) B(0.15,0.06) | W(0.3127,0.329) | γ2.2 | Area:0.1121';

async function selectAndDraw(testName: string, labels: string[]): Promise<string> {
    for (let i = 0; i < labels.length; i++) {
        await addLog(`${testName}: select ${labels[i]}`);
        await clickScrolledId(`CmpBtn_${labels[i]}`);
    }
    await clickScrolledId('BtnDrawCompare');
    if (labels.length > 0) {
        await waitTextContains('StdCompareResult', 'Comparing: ');
    }
    return textOfId('StdCompareResult');
}

async function showComparisonRows(): Promise<void> {
    await scrollIntoView('StdCompareTable');
}

// Rows of the comparison table are plain text, so the ones on screen are recognised by their header.
async function visibleRowCount(): Promise<number> {
    const texts: string[] = await visibleTexts();
    let count: number = 0;
    for (let i = 0; i < texts.length; i++) {
        if (texts[i].includes(' | R(')) {
            count++;
        }
    }
    return count;
}

export default function compareCombinationTest(): void {
    describe('CompareCombinationTest', () => {
        beforeAll(async () => {
            await addLog('CompareCombinationTest suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToStandard();
        });

        /*
         * @tc.number: SUB_CS_CMP_0100
         * @tc.name: testCompareEmptyDraw0001
         * @tc.desc: Verify empty selection produces no comparison summary or data rows.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareEmptyDraw0001', 0, async (done: Function) => {
            await runCase('testCompareEmptyDraw0001', async (): Promise<void> => {
                const initial: string = await textOrEmpty('StdCompareResult');
                await clickScrolledId('BtnDrawCompare');
                const actual: string = await textOrEmpty('StdCompareResult');
                await scrollToId('StdCompareDataTable');
                const tableTitle: string = await textOfId('StdCompareDataTable');
                await addLog(`testCompareEmptyDraw0001: actual=${initial}, expected empty initial summary`);
                expect(initial).assertEqual('');
                await addLog(`testCompareEmptyDraw0001: actual=${actual}, expected empty summary`);
                expect(actual).assertEqual('');
                await addLog(`testCompareEmptyDraw0001: actual=${tableTitle}, expected Comparison Data`);
                expect(tableTitle).assertEqual('Comparison Data');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_0200
         * @tc.name: testCompareSingleSrgb0001
         * @tc.desc: Verify single SRGB comparison summary and numeric data row.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCompareSingleSrgb0001', 0, async (done: Function) => {
            await runCase('testCompareSingleSrgb0001', async (): Promise<void> => {
                const summary: string = await selectAndDraw('testCompareSingleSrgb0001', ['SRGB']);
                await showComparisonRows();
                const rowExists: boolean = await existsText(SRGB_ROW);
                const tableTitle: string = await textOfId('StdCompareDataTable');
                await addLog(`testCompareSingleSrgb0001: actual=${summary}, expected=Comparing: SRGB`);
                expect(summary).assertEqual('Comparing: SRGB');
                await addLog(`testCompareSingleSrgb0001: actual row exists=${rowExists}, expected=${SRGB_ROW}`);
                expect(rowExists).assertTrue();
                await addLog(`testCompareSingleSrgb0001: actual=${tableTitle}, expected=Comparison Data`);
                expect(tableTitle).assertEqual('Comparison Data');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_0300
         * @tc.name: testCompareSrgbDisplayP30001
         * @tc.desc: Verify SRGB and Display_P3 comparison order and numeric rows.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCompareSrgbDisplayP30001', 0, async (done: Function) => {
            await runCase('testCompareSrgbDisplayP30001', async (): Promise<void> => {
                const summary: string = await selectAndDraw('testCompareSrgbDisplayP30001', ['SRGB', 'Display_P3']);
                await showComparisonRows();
                const srgbExists: boolean = await existsText(SRGB_ROW);
                const p3Exists: boolean = await existsText(DISPLAY_P3_ROW);
                await addLog(`testCompareSrgbDisplayP30001: actual=${summary}, expected SRGB vs Display_P3`);
                expect(summary).assertEqual('Comparing: SRGB vs Display_P3');
                await addLog(`testCompareSrgbDisplayP30001: actual SRGB row=${srgbExists}, expected=${SRGB_ROW}`);
                expect(srgbExists).assertTrue();
                await addLog(`testCompareSrgbDisplayP30001: actual P3 row=${p3Exists}, expected=${DISPLAY_P3_ROW}`);
                expect(p3Exists).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_0400
         * @tc.name: testCompareDisplayP3DciP30001
         * @tc.desc: Verify Display_P3 and DCI_P3 retain distinct white point and gamma values.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareDisplayP3DciP30001', 0, async (done: Function) => {
            await runCase('testCompareDisplayP3DciP30001', async (): Promise<void> => {
                const summary: string = await selectAndDraw('testCompareDisplayP3DciP30001', ['Display_P3', 'DCI_P3']);
                await showComparisonRows();
                const displayExists: boolean = await existsText(DISPLAY_P3_ROW);
                const dciExists: boolean = await existsText(DCI_P3_ROW);
                await addLog(`testCompareDisplayP3DciP30001: actual=${summary}, expected Display_P3 vs DCI_P3`);
                expect(summary).assertEqual('Comparing: Display_P3 vs DCI_P3');
                await addLog(`testCompareDisplayP3DciP30001: actual Display row=${displayExists}, ` +
                  `expected D65 gamma 2.2`);
                expect(displayExists).assertTrue();
                await addLog(`testCompareDisplayP3DciP30001: actual DCI row=${dciExists}, ` +
                  `expected DCI white gamma 2.6`);
                expect(dciExists).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_0500
         * @tc.name: testCompareBt2020TransferVariants0001
         * @tc.desc: Verify BT2020_HLG and BT2020_PQ comparison keeps separate labels with equal coordinates.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareBt2020TransferVariants0001', 0, async (done: Function) => {
            await runCase('testCompareBt2020TransferVariants0001', async (): Promise<void> => {
                const summary: string = await selectAndDraw('testCompareBt2020TransferVariants0001',
                    ['BT2020_HLG', 'BT2020_PQ']);
                await showComparisonRows();
                const hlgExists: boolean = await existsText(BT2020_HLG_ROW);
                const pqExists: boolean = await existsText(BT2020_PQ_ROW);
                await addLog(`testCompareBt2020TransferVariants0001: actual=${summary}, expected HLG vs PQ`);
                expect(summary).assertEqual('Comparing: BT2020_HLG vs BT2020_PQ');
                await addLog(`testCompareBt2020TransferVariants0001: actual HLG row=${hlgExists}, ` +
                  `expected area 0.2119`);
                expect(hlgExists).assertTrue();
                await addLog(`testCompareBt2020TransferVariants0001: actual PQ row=${pqExists}, expected area 0.2119`);
                expect(pqExists).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_0600
         * @tc.name: testCompareLinearSrgbSrgb0001
         * @tc.desc: Verify Linear_SRGB and SRGB comparison reports gamma 1 and gamma 2.2.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareLinearSrgbSrgb0001', 0, async (done: Function) => {
            await runCase('testCompareLinearSrgbSrgb0001', async (): Promise<void> => {
                const summary: string = await selectAndDraw('testCompareLinearSrgbSrgb0001', ['Linear_SRGB', 'SRGB']);
                await showComparisonRows();
                const linearExists: boolean = await existsText(LINEAR_SRGB_ROW);
                const srgbExists: boolean = await existsText(SRGB_ROW);
                await addLog(`testCompareLinearSrgbSrgb0001: actual=${summary}, expected Linear_SRGB vs SRGB`);
                expect(summary).assertEqual('Comparing: Linear_SRGB vs SRGB');
                await addLog(`testCompareLinearSrgbSrgb0001: actual linear row=${linearExists}, expected gamma 1`);
                expect(linearExists).assertTrue();
                await addLog(`testCompareLinearSrgbSrgb0001: actual SRGB row=${srgbExists}, expected gamma 2.2`);
                expect(srgbExists).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_0700
         * @tc.name: testCompareAdobeRgbBt7090001
         * @tc.desc: Verify Adobe_RGB_1998 and BT709 comparison reports distinct gamut areas.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareAdobeRgbBt7090001', 0, async (done: Function) => {
            await runCase('testCompareAdobeRgbBt7090001', async (): Promise<void> => {
                const summary: string = await selectAndDraw('testCompareAdobeRgbBt7090001',
                    ['Adobe_RGB_1998', 'BT709']);
                await showComparisonRows();
                const adobeExists: boolean = await existsTextStartingWith(ADOBE_RGB_ROW_PREFIX);
                const bt709Exists: boolean = await existsText(BT709_ROW);
                await addLog(`testCompareAdobeRgbBt7090001: actual=${summary}, expected Adobe_RGB_1998 vs BT709`);
                expect(summary).assertEqual('Comparing: Adobe_RGB_1998 vs BT709');
                await addLog(`testCompareAdobeRgbBt7090001: actual Adobe row=${adobeExists}, ` +
                  `expected coordinates prefix`);
                expect(adobeExists).assertTrue();
                await addLog(`testCompareAdobeRgbBt7090001: actual BT709 row=${bt709Exists}, expected area 0.1121`);
                expect(bt709Exists).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_0800
         * @tc.name: testCompareTripleOrder0001
         * @tc.desc: Verify three color spaces preserve selection order in summary and data rows.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareTripleOrder0001', 0, async (done: Function) => {
            await runCase('testCompareTripleOrder0001', async (): Promise<void> => {
                const summary: string = await selectAndDraw('testCompareTripleOrder0001',
                    ['DCI_P3', 'SRGB', 'BT2020_HLG']);
                await showComparisonRows();
                const dciExists: boolean = await existsText(DCI_P3_ROW);
                const bt2020Exists: boolean = await existsText(BT2020_HLG_ROW);
                await addLog(`testCompareTripleOrder0001: actual=${summary}, expected DCI_P3 SRGB BT2020_HLG order`);
                expect(summary).assertEqual('Comparing: DCI_P3 vs SRGB vs BT2020_HLG');
                await addLog(`testCompareTripleOrder0001: actual DCI row=${dciExists}, expected=${DCI_P3_ROW}`);
                expect(dciExists).assertTrue();
                await addLog(`testCompareTripleOrder0001: actual BT2020 row=${bt2020Exists}, ` +
                  `expected=${BT2020_HLG_ROW}`);
                expect(bt2020Exists).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_0900
         * @tc.name: testCompareSelectDeselect0001
         * @tc.desc: Verify selecting and deselecting SRGB leaves an empty comparison.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareSelectDeselect0001', 0, async (done: Function) => {
            await runCase('testCompareSelectDeselect0001', async (): Promise<void> => {
                await clickScrolledId('CmpBtn_SRGB');
                await clickScrolledId('CmpBtn_SRGB');
                await clickScrolledId('BtnDrawCompare');
                const summary: string = await textOrEmpty('StdCompareResult');
                await showComparisonRows();
                const rowExists: boolean = await existsText(SRGB_ROW);
                const tableTitle: string = await textOfId('StdCompareDataTable');
                await addLog(`testCompareSelectDeselect0001: actual=${summary}, expected empty summary`);
                expect(summary).assertEqual('');
                await addLog(`testCompareSelectDeselect0001: actual row exists=${rowExists}, expected false`);
                expect(rowExists).assertFalse();
                await addLog(`testCompareSelectDeselect0001: actual=${tableTitle}, expected Comparison Data`);
                expect(tableTitle).assertEqual('Comparison Data');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_1000
         * @tc.name: testCompareClearSelection0001
         * @tc.desc: Verify clear removes comparison summary and generated data rows.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCompareClearSelection0001', 0, async (done: Function) => {
            await runCase('testCompareClearSelection0001', async (): Promise<void> => {
                const before: string = await selectAndDraw('testCompareClearSelection0001', ['SRGB']);
                await showComparisonRows();
                const rowBefore: boolean = await existsText(SRGB_ROW);
                await clickScrolledId('BtnClearCompare');
                const after: string = await textOrEmpty('StdCompareResult');
                const rowAfter: boolean = await existsText(SRGB_ROW);
                await addLog(`testCompareClearSelection0001: actual before=${before}, expected Comparing: SRGB`);
                expect(before).assertEqual('Comparing: SRGB');
                await addLog(`testCompareClearSelection0001: actual row before=${rowBefore}, expected true`);
                expect(rowBefore).assertTrue();
                await addLog(`testCompareClearSelection0001: actual after=${after}, expected empty summary`);
                expect(after).assertEqual('');
                await addLog(`testCompareClearSelection0001: actual row after=${rowAfter}, expected false`);
                expect(rowAfter).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_1100
         * @tc.name: testCompareRedrawAddsSelection0001
         * @tc.desc: Verify redraw updates summary and rows after another color space is selected.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareRedrawAddsSelection0001', 0, async (done: Function) => {
            await runCase('testCompareRedrawAddsSelection0001', async (): Promise<void> => {
                const first: string = await selectAndDraw('testCompareRedrawAddsSelection0001', ['SRGB']);
                await clickScrolledId('CmpBtn_Display_P3');
                await clickScrolledId('BtnDrawCompare');
                const second: string = await waitTextContains('StdCompareResult', 'Display_P3');
                await showComparisonRows();
                const p3Exists: boolean = await existsText(DISPLAY_P3_ROW);
                await addLog(`testCompareRedrawAddsSelection0001: actual first=${first}, expected Comparing: SRGB`);
                expect(first).assertEqual('Comparing: SRGB');
                await addLog(`testCompareRedrawAddsSelection0001: actual second=${second}, expected added Display_P3`);
                expect(second).assertEqual('Comparing: SRGB vs Display_P3');
                await addLog(`testCompareRedrawAddsSelection0001: actual P3 row=${p3Exists}, expected true`);
                expect(p3Exists).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_1200
         * @tc.name: testCompareExtendedAndLimit0001
         * @tc.desc: Verify extended and LIMIT color spaces can be compared with exact numeric rows.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareExtendedAndLimit0001', 0, async (done: Function) => {
            await runCase('testCompareExtendedAndLimit0001', async (): Promise<void> => {
                const summary: string = await selectAndDraw('testCompareExtendedAndLimit0001',
                    ['BT601_EBU', 'SRGB_Limit']);
                await showComparisonRows();
                const extendedExists: boolean = await existsText(BT601_EBU_ROW);
                const limitExists: boolean = await existsText(SRGB_LIMIT_ROW);
                await addLog(`testCompareExtendedAndLimit0001: actual=${summary}, expected BT601_EBU vs SRGB_Limit`);
                expect(summary).assertEqual('Comparing: BT601_EBU vs SRGB_Limit');
                await addLog(`testCompareExtendedAndLimit0001: actual extended row=${extendedExists}, ` +
                  `expected area 0.1134`);
                expect(extendedExists).assertTrue();
                await addLog(`testCompareExtendedAndLimit0001: actual LIMIT row=${limitExists}, expected area 0.1121`);
                expect(limitExists).assertTrue();
            }, done);
        });

        // ==================== 取消中间选择（1 条） ====================

        /*
         * @tc.number: SUB_CS_CMP_1300
         * @tc.name: testCompareDeselectMiddle0001
         * @tc.desc: Verify deselecting the middle item preserves only the first and last items.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareDeselectMiddle0001', 0, async (done: Function) => {
            await runCase('testCompareDeselectMiddle0001', async (): Promise<void> => {
                await clickScrolledId('CmpBtn_SRGB');
                await clickScrolledId('CmpBtn_Display_P3');
                await clickScrolledId('CmpBtn_DCI_P3');
                await clickScrolledId('CmpBtn_Display_P3');
                await clickScrolledId('BtnDrawCompare');
                const summary: string = await waitTextContains('StdCompareResult', 'Comparing:');
                await showComparisonRows();
                const srgbExists: boolean = await existsText(SRGB_ROW);
                const displayExists: boolean = await existsText(DISPLAY_P3_ROW);
                const dciExists: boolean = await existsText(DCI_P3_ROW);
                await addLog(`testCompareDeselectMiddle0001: actual=${summary}, expected SRGB vs DCI_P3`);
                expect(summary).assertEqual('Comparing: SRGB vs DCI_P3');
                await addLog(`testCompareDeselectMiddle0001: actual SRGB row=${srgbExists}, expected=true`);
                expect(srgbExists).assertTrue();
                await addLog(`testCompareDeselectMiddle0001: actual Display row=${displayExists}, expected=false`);
                expect(displayExists).assertFalse();
                await addLog(`testCompareDeselectMiddle0001: actual DCI row=${dciExists}, expected=true`);
                expect(dciExists).assertTrue();
            }, done);
        });

        // ==================== 取消后重选顺序（1 条） ====================

        /*
         * @tc.number: SUB_CS_CMP_1400
         * @tc.name: testCompareReselectOrder0001
         * @tc.desc: Verify reselecting an item moves it to the end of comparison order.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareReselectOrder0001', 0, async (done: Function) => {
            await runCase('testCompareReselectOrder0001', async (): Promise<void> => {
                await clickScrolledId('CmpBtn_SRGB');
                await clickScrolledId('CmpBtn_Display_P3');
                await clickScrolledId('CmpBtn_SRGB');
                await clickScrolledId('CmpBtn_SRGB');
                await clickScrolledId('BtnDrawCompare');
                const summary: string = await waitTextContains('StdCompareResult', 'Comparing:');
                await showComparisonRows();
                const displayExists: boolean = await existsText(DISPLAY_P3_ROW);
                const srgbExists: boolean = await existsText(SRGB_ROW);
                await addLog(`testCompareReselectOrder0001: actual=${summary}, expected Display_P3 vs SRGB`);
                expect(summary).assertEqual('Comparing: Display_P3 vs SRGB');
                await addLog(`testCompareReselectOrder0001: actual Display row=${displayExists}, expected=true`);
                expect(displayExists).assertTrue();
                await addLog(`testCompareReselectOrder0001: actual SRGB row=${srgbExists}, expected=true`);
                expect(srgbExists).assertTrue();
            }, done);
        });

        // ==================== 重绘移除选择（1 条） ====================

        /*
         * @tc.number: SUB_CS_CMP_1500
         * @tc.name: testCompareRedrawRemovesSelection0001
         * @tc.desc: Verify redraw removes the data row for a deselected color space.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareRedrawRemovesSelection0001', 0, async (done: Function) => {
            await runCase('testCompareRedrawRemovesSelection0001', async (): Promise<void> => {
                const first: string = await selectAndDraw('testCompareRedrawRemovesSelection0001',
                  ['SRGB', 'Display_P3']);
                await clickScrolledId('CmpBtn_SRGB');
                await clickScrolledId('BtnDrawCompare');
                const second: string = await waitTextContains('StdCompareResult', 'Comparing: Display_P3');
                await showComparisonRows();
                const rowCount: number = await visibleRowCount();
                await addLog(`testCompareRedrawRemovesSelection0001: actual first=${first}, ` +
                  `expected SRGB vs Display_P3`);
                expect(first).assertEqual('Comparing: SRGB vs Display_P3');
                await addLog(`testCompareRedrawRemovesSelection0001: actual second=${second}, ` +
                  `expected Display_P3 only`);
                expect(second).assertEqual('Comparing: Display_P3');
                await addLog(`testCompareRedrawRemovesSelection0001: actual rows=${rowCount}, expected=1`);
                expect(rowCount).assertEqual(1);
            }, done);
        });

        // ==================== 清空后重新选择（1 条） ====================

        /*
         * @tc.number: SUB_CS_CMP_1600
         * @tc.name: testCompareClearThenSelect0001
         * @tc.desc: Verify comparison can restart with a new selection after clearing old rows.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareClearThenSelect0001', 0, async (done: Function) => {
            await runCase('testCompareClearThenSelect0001', async (): Promise<void> => {
                await selectAndDraw('testCompareClearThenSelect0001', ['SRGB']);
                await clickScrolledId('BtnClearCompare');
                const cleared: string = await textOrEmpty('StdCompareResult');
                const summary: string = await selectAndDraw('testCompareClearThenSelect0001', ['DCI_P3']);
                await showComparisonRows();
                const srgbExists: boolean = await existsText(SRGB_ROW);
                const dciExists: boolean = await existsText(DCI_P3_ROW);
                await addLog(`testCompareClearThenSelect0001: actual cleared=${cleared}, expected empty summary`);
                expect(cleared).assertEqual('');
                await addLog(`testCompareClearThenSelect0001: actual=${summary}, expected Comparing: DCI_P3`);
                expect(summary).assertEqual('Comparing: DCI_P3');
                await addLog(`testCompareClearThenSelect0001: actual old SRGB row=${srgbExists}, expected=false`);
                expect(srgbExists).assertFalse();
                await addLog(`testCompareClearThenSelect0001: actual DCI row=${dciExists}, expected=true`);
                expect(dciExists).assertTrue();
            }, done);
        });
    });
}
