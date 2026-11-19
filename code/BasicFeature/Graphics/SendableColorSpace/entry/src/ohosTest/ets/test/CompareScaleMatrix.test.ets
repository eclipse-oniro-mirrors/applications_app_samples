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
    startApp, runCase, addLog, resetToIndex, navigateToStandard, clickScrolledId, scrollIntoView,
    textOfId, visibleTexts, waitTextContains, existsText, listHasTextBySwiping
} from '../testkit/SharedDriver';
import { getAllColorSpaces, ColorSpaceInfo } from '../../../main/ets/common/ColorSpaceData';

// The compare section lists every color space in one order, so selection is expressed with those indices.
const ALL_SPACES: ColorSpaceInfo[] = getAllColorSpaces();
const SEPARATOR: string = ' vs ';

function labelAt(index: number): string {
    return ALL_SPACES[index].label;
}

// The summary joins the selected labels in click order, which is what the expected value reproduces.
function expectedSummary(indices: number[]): string {
    let parts: string = '';
    for (let i = 0; i < indices.length; i++) {
        parts = parts + (i === 0 ? '' : SEPARATOR) + ALL_SPACES[indices[i]].label;
    }
    return `Comparing: ${parts}`;
}

function countSeparators(text: string): number {
    const parts: string[] = text.split(SEPARATOR);
    return parts.length - 1;
}

// The data table is a List, so only the rows that became visible are counted.
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

async function selectLabels(testName: string, indices: number[]): Promise<void> {
    for (let i = 0; i < indices.length; i++) {
        await addLog(`${testName}: select ${labelAt(indices[i])}`);
        await clickScrolledId(`CmpBtn_${labelAt(indices[i])}`);
    }
}

async function selectAndDraw(testName: string, indices: number[]): Promise<string> {
    await selectLabels(testName, indices);
    await clickScrolledId('BtnDrawCompare');
    await waitTextContains('StdCompareResult', 'Comparing: ');
    return await textOfId('StdCompareResult');
}

// The area column is recomputed from the coordinates the page lists, independently of the page formula result.
function expectedAreaRow(index: number): string {
    const info: ColorSpaceInfo = ALL_SPACES[index];
    const area: number = 0.5 * Math.abs(info.redX * (info.greenY - info.blueY) +
        info.greenX * (info.blueY - info.redY) + info.blueX * (info.redY - info.greenY));
    return `${info.label} | R(${info.redX},${info.redY}) G(${info.greenX},${info.greenY}) ` +
        `B(${info.blueX},${info.blueY}) | W(${info.whiteX},${info.whiteY}) | γ${info.gamma} | Area:${area.toFixed(4)}`;
}

export default function compareScaleMatrixTest(): void {
    describe('CompareScaleMatrix', () => {
        beforeAll(async () => {
            await addLog('CompareScaleMatrix suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToStandard();
        });

        /*
         * @tc.number: SUB_CS_CMP_2001
         * @tc.name: testCompareFourSelected0001
         * @tc.desc: Compare four color spaces and check the summary and the four generated data rows.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCompareFourSelected0001', 0, async (done: Function) => {
            await runCase('testCompareFourSelected0001', async (): Promise<void> => {
                const picked: number[] = [0, 1, 2, 3];
                const summary: string = await selectAndDraw('testCompareFourSelected0001', picked);
                await scrollIntoView('StdCompareTable');
                const firstExists: boolean = await existsText(expectedAreaRow(0));
                const lastFound: boolean = await listHasTextBySwiping('StdCompareTable', expectedAreaRow(3));
                await addLog(`testCompareFourSelected0001: actual=${summary}, expected=${expectedSummary(picked)}`);
                expect(summary).assertEqual(expectedSummary(picked));
                await addLog(`testCompareFourSelected0001: actual separators=${countSeparators(summary)}, expected=3`);
                expect(countSeparators(summary)).assertEqual(3);
                await addLog(`testCompareFourSelected0001: actual first row exists=${firstExists}, ` +
                  `expected=${expectedAreaRow(0)}`);
                expect(firstExists).assertTrue();
                await addLog(`testCompareFourSelected0001: actual last row found by scrolling=${lastFound}, ` +
                  `expected=${expectedAreaRow(3)}`);
                expect(lastFound).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_2002
         * @tc.name: testCompareFiveSelected0001
         * @tc.desc: Compare five color spaces and check the five generated data rows.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareFiveSelected0001', 0, async (done: Function) => {
            await runCase('testCompareFiveSelected0001', async (): Promise<void> => {
                const picked: number[] = [0, 2, 4, 6, 7];
                const summary: string = await selectAndDraw('testCompareFiveSelected0001', picked);
                await scrollIntoView('StdCompareTable');
                const firstExists: boolean = await existsText(expectedAreaRow(0));
                const lastFound: boolean = await listHasTextBySwiping('StdCompareTable', expectedAreaRow(7));
                await addLog(`testCompareFiveSelected0001: actual=${summary}, expected=${expectedSummary(picked)}`);
                expect(summary).assertEqual(expectedSummary(picked));
                await addLog(`testCompareFiveSelected0001: actual separators=${countSeparators(summary)}, expected=4`);
                expect(countSeparators(summary)).assertEqual(4);
                await addLog(`testCompareFiveSelected0001: actual first row exists=${firstExists}, ` +
                  `expected=${expectedAreaRow(0)}`);
                expect(firstExists).assertTrue();
                await addLog(`testCompareFiveSelected0001: actual last row found by scrolling=${lastFound}, ` +
                  `expected=${expectedAreaRow(7)}`);
                expect(lastFound).assertTrue();
                await addLog(`testCompareFiveSelected0001: last selected label is reported, expected=${labelAt(7)}`);
                expect(summary.endsWith(labelAt(7))).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_2003
         * @tc.name: testCompareSixSelected0001
         * @tc.desc: Compare six color spaces and check the six data rows keep the selection order.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareSixSelected0001', 0, async (done: Function) => {
            await runCase('testCompareSixSelected0001', async (): Promise<void> => {
                const picked: number[] = [7, 6, 5, 4, 3, 2];
                const summary: string = await selectAndDraw('testCompareSixSelected0001', picked);
                await scrollIntoView('StdCompareTable');
                const firstExists: boolean = await existsText(expectedAreaRow(7));
                const lastFound: boolean = await listHasTextBySwiping('StdCompareTable', expectedAreaRow(2));
                await addLog(`testCompareSixSelected0001: actual=${summary}, expected=${expectedSummary(picked)}`);
                expect(summary).assertEqual(expectedSummary(picked));
                await addLog(`testCompareSixSelected0001: actual separators=${countSeparators(summary)}, expected=5`);
                expect(countSeparators(summary)).assertEqual(5);
                await addLog(`testCompareSixSelected0001: actual first row exists=${firstExists}, ` +
                  `expected=${expectedAreaRow(7)}`);
                expect(firstExists).assertTrue();
                await addLog(`testCompareSixSelected0001: actual last row found by scrolling=${lastFound}, ` +
                  `expected=${expectedAreaRow(2)}`);
                expect(lastFound).assertTrue();
                await addLog(`testCompareSixSelected0001: reverse order starts at ${labelAt(7)}, summary=${summary}`);
                expect(summary.startsWith(`Comparing: ${labelAt(7)} vs `)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_2004
         * @tc.name: testCompareAllStandard0001
         * @tc.desc: Compare all eight standard color spaces and check every label appears once.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareAllStandard0001', 0, async (done: Function) => {
            await runCase('testCompareAllStandard0001', async (): Promise<void> => {
                const picked: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
                const summary: string = await selectAndDraw('testCompareAllStandard0001', picked);
                await scrollIntoView('StdCompareTable');
                const lastFound: boolean = await listHasTextBySwiping('StdCompareTable', expectedAreaRow(7));
                await addLog(`testCompareAllStandard0001: actual separators=${countSeparators(summary)}, expected=7`);
                expect(countSeparators(summary)).assertEqual(7);
                await addLog(`testCompareAllStandard0001: actual=${summary}, expected=${expectedSummary(picked)}`);
                expect(summary).assertEqual(expectedSummary(picked));
                await addLog(`testCompareAllStandard0001: the last standard row is reachable=${lastFound}, ` +
                  `expected=${expectedAreaRow(7)}`);
                expect(lastFound).assertTrue();
                await addLog(`testCompareAllStandard0001: summary starts with the first standard label`);
                expect(summary.startsWith(`Comparing: ${labelAt(0)} vs `)).assertTrue();
                await addLog(`testCompareAllStandard0001: summary ends with the eighth standard label`);
                expect(summary.endsWith(` vs ${labelAt(7)}`)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_2005
         * @tc.name: testCompareTwelveSelected0001
         * @tc.desc: Compare twelve color spaces across the standard and extended sections.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareTwelveSelected0001', 0, async (done: Function) => {
            await runCase('testCompareTwelveSelected0001', async (): Promise<void> => {
                const picked: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
                const summary: string = await selectAndDraw('testCompareTwelveSelected0001', picked);
                await addLog(`testCompareTwelveSelected0001: actual separators=${countSeparators(summary)}, ` +
                  `expected=11`);
                expect(countSeparators(summary)).assertEqual(11);
                await addLog(`testCompareTwelveSelected0001: actual=${summary}, expected=${expectedSummary(picked)}`);
                expect(summary).assertEqual(expectedSummary(picked));
                await addLog(`testCompareTwelveSelected0001: extended label ${labelAt(11)} is part of the summary`);
                expect(summary.includes(labelAt(11))).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_2006
         * @tc.name: testCompareTwelveRows0001
         * @tc.desc: Check the table keeps one generated row per selected color space for a twelve item selection.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareTwelveRows0001', 0, async (done: Function) => {
            await runCase('testCompareTwelveRows0001', async (): Promise<void> => {
                const picked: number[] = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0];
                const summary: string = await selectAndDraw('testCompareTwelveRows0001', picked);
                await scrollIntoView('StdCompareTable');
                const firstExists: boolean = await existsText(expectedAreaRow(11));
                const lastFound: boolean = await listHasTextBySwiping('StdCompareTable', expectedAreaRow(0), 20);
                await addLog(`testCompareTwelveRows0001: actual=${summary}, expected=${expectedSummary(picked)}`);
                expect(summary).assertEqual(expectedSummary(picked));
                await addLog(`testCompareTwelveRows0001: actual separators=${countSeparators(summary)}, expected=11`);
                expect(countSeparators(summary)).assertEqual(11);
                await addLog(`testCompareTwelveRows0001: first row exists=${firstExists}, ` +
                  `expected=${expectedAreaRow(11)}`);
                expect(firstExists).assertTrue();
                await addLog(`testCompareTwelveRows0001: last row found by scrolling=${lastFound}, ` +
                  `expected=${expectedAreaRow(0)}`);
                expect(lastFound).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_2007
         * @tc.name: testCompareAreaRecompute0001
         * @tc.desc: Compare two extended color spaces and recompute both chromaticity areas independently.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCompareAreaRecompute0001', 0, async (done: Function) => {
            await runCase('testCompareAreaRecompute0001', async (): Promise<void> => {
                const picked: number[] = [9, 12];
                const summary: string = await selectAndDraw('testCompareAreaRecompute0001', picked);
                await scrollIntoView('StdCompareTable');
                const firstRow: string = expectedAreaRow(9);
                const secondRow: string = expectedAreaRow(12);
                const firstExists: boolean = await existsText(firstRow);
                const secondExists: boolean = await existsText(secondRow);
                await addLog(`testCompareAreaRecompute0001: actual=${summary}, expected=${expectedSummary(picked)}`);
                expect(summary).assertEqual(expectedSummary(picked));
                await addLog(`testCompareAreaRecompute0001: actual first row=${firstExists}, expected=${firstRow}`);
                expect(firstExists).assertTrue();
                await addLog(`testCompareAreaRecompute0001: actual second row=${secondExists}, expected=${secondRow}`);
                expect(secondExists).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CMP_2008
         * @tc.name: testCompareDeselectPair0001
         * @tc.desc: Select four color spaces, deselect two of them and check the last comparison keeps the rest.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCompareDeselectPair0001', 0, async (done: Function) => {
            await runCase('testCompareDeselectPair0001', async (): Promise<void> => {
                await selectAndDraw('testCompareDeselectPair0001', [0, 1, 2, 3]);
                await clickScrolledId(`CmpBtn_${labelAt(1)}`);
                await clickScrolledId(`CmpBtn_${labelAt(2)}`);
                await clickScrolledId('BtnDrawCompare');
                const summary: string = await waitTextContains('StdCompareResult', 'Comparing: ');
                const remaining: number[] = [0, 3];
                await scrollIntoView('StdCompareTable');
                const rows: number = await visibleRowCount();
                await addLog(`testCompareDeselectPair0001: actual=${summary}, expected=${expectedSummary(remaining)}`);
                expect(summary).assertEqual(expectedSummary(remaining));
                await addLog(`testCompareDeselectPair0001: actual visible data rows=${rows}, expected=2`);
                expect(rows).assertEqual(2);
                await addLog(`testCompareDeselectPair0001: deselected label is gone, expected no ${labelAt(1)}`);
                expect(summary.includes(labelAt(1))).assertFalse();
                await addLog(`testCompareDeselectPair0001: kept label is still reported, expected ${labelAt(3)}`);
                expect(summary.includes(labelAt(3))).assertTrue();
            }, done);
        });
    });
}
