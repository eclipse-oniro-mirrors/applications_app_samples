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
import { colorSpaceManager } from '@kit.ArkGraphics2D';
import {
    startApp, runCase, addLog, textOfId, existsId, existsText, resetToIndex, navigateToStandard,
    clickScrolledId, scrollToId, existsTextByScrollingDown, waitTextContains, standardInfoText, standardTaskPoolText
} from '../testkit/SharedDriver';

async function readWithTaskPool(buttonId: string, label: string): Promise<string> {
    await clickScrolledId(buttonId);
    await waitTextContains('StdColorSpaceInfo', `Type: ${label}`);
    await clickScrolledId('StdBtnTaskPoolRead');
    return waitTextContains('StdTaskPoolResult', `[TaskPool] name=${label}`);
}

export default function standardColorSpaceTest(): void {
    describe('StandardColorSpaceTest', () => {
        beforeAll(async () => {
            await addLog('StandardColorSpaceTest suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToStandard();
        });

        // ==================== 页面初始状态（1 条） ====================

        /*
         * @tc.number: SUB_CS_STD_0100
         * @tc.name: testStandardPageLayout0001
         * @tc.desc: Verify standard page title, empty result and gamut layout.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testStandardPageLayout0001', 0, async (done: Function) => {
            await runCase('testStandardPageLayout0001', async (): Promise<void> => {
                const title: string = await textOfId('StdPageTitle');
                const initialInfo: string = await textOfId('StdColorSpaceInfo');
                await scrollToId('StdGamutCanvas');
                const gamutTitle: string = await textOfId('StdGamutTitle');
                await addLog(`testStandardPageLayout0001: actual=${title}, expected=Standard Color Spaces`);
                expect(title).assertEqual('Standard Color Spaces');
                await addLog(`testStandardPageLayout0001: actual=${initialInfo}, expected empty initial info`);
                expect(initialInfo).assertEqual('');
                await addLog(`testStandardPageLayout0001: actual=${gamutTitle}, expected=Gamut Visualization`);
                expect(gamutTitle).assertEqual('Gamut Visualization');
            }, done);
        });

        // ==================== 扩展与 LIMIT 分组可达性（1 条） ====================

        /*
         * @tc.number: SUB_CS_STD_0200
         * @tc.name: testStandardSections0001
         * @tc.desc: Verify extended and LIMIT sections expose their actual buttons.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testStandardSections0001', 0, async (done: Function) => {
            await runCase('testStandardSections0001', async (): Promise<void> => {
                await scrollToId('ExtBtn_BT601_SMPTE_C');
                const extendedTitle: string = await textOfId('ExtSectionTitle');
                const extendedButton: boolean = await existsId('ExtBtn_BT601_SMPTE_C');
                await scrollToId('LimBtn_Linear_P3');
                const limitTitle: string = await textOfId('LimSectionTitle');
                const limitButton: boolean = await existsId('LimBtn_Linear_P3');
                await addLog(`testStandardSections0001: actual=${extendedTitle}, expected extended section title`);
                expect(extendedTitle).assertEqual('Extended Color Spaces (API 11+)');
                await addLog(`testStandardSections0001: actual=${extendedButton}, expected BT601_SMPTE_C button=true`);
                expect(extendedButton).assertTrue();
                await addLog(`testStandardSections0001: actual=${limitTitle}, expected LIMIT section title`);
                expect(limitTitle).assertEqual('LIMIT Range Color Spaces (API 11+)');
                await addLog(`testStandardSections0001: actual=${limitButton}, expected Linear_P3 button=true`);
                expect(limitButton).assertTrue();
            }, done);
        });

        // ==================== TaskPool 未创建守卫（1 条） ====================

        /*
         * @tc.number: SUB_CS_STD_0300
         * @tc.name: testTaskPoolGuardNoCreate0001
         * @tc.desc: Verify TaskPool read is guarded before color space creation.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testTaskPoolGuardNoCreate0001', 0, async (done: Function) => {
            await runCase('testTaskPoolGuardNoCreate0001', async (): Promise<void> => {
                await clickScrolledId('StdBtnTaskPoolRead');
                const result: string = await waitTextContains('StdTaskPoolResult', 'Please create');
                const info: string = await textOfId('StdColorSpaceInfo');
                const taskStarted: boolean = result.includes('[TaskPool]');
                await addLog(`testTaskPoolGuardNoCreate0001: actual=${result}, expected creation guard`);
                expect(result).assertEqual('Please create a color space first');
                await addLog(`testTaskPoolGuardNoCreate0001: actual=${info}, expected empty color space info`);
                expect(info).assertEqual('');
                await addLog(`testTaskPoolGuardNoCreate0001: actual=${taskStarted}, expected no TaskPool result=false`);
                expect(taskStarted).assertFalse();
            }, done);
        });

        // ==================== TaskPool 精确读取（1 条） ====================

        /*
         * @tc.number: SUB_CS_STD_0400
         * @tc.name: testTaskPoolRead0001
         * @tc.desc: Verify TaskPool returns complete SRGB properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testTaskPoolRead0001', 0, async (done: Function) => {
            await runCase('testTaskPoolRead0001', async (): Promise<void> => {
                await scrollToId('StdTaskPoolResult');
                const initialResult: string = await textOfId('StdTaskPoolResult');
                const result: string = await readWithTaskPool('Btn_SRGB', 'SRGB');
                const info: string = await textOfId('StdColorSpaceInfo');
                const expectedInfo: string = standardInfoText('SRGB', 'SRGB', colorSpaceManager.ColorSpace.SRGB);
                const expectedResult: string = standardTaskPoolText('SRGB', colorSpaceManager.ColorSpace.SRGB);
                await addLog(`testTaskPoolRead0001: actual=${initialResult}, expected empty initial TaskPool result`);
                expect(initialResult).assertEqual('');
                await addLog(`testTaskPoolRead0001: actual=${info}, expected=${expectedInfo}`);
                expect(info).assertEqual(expectedInfo);
                await addLog(`testTaskPoolRead0001: actual=${result}, expected=${expectedResult}`);
                expect(result).assertEqual(expectedResult);
            }, done);
        });

        // ==================== 切换后 TaskPool 读取（1 条） ====================

        /*
         * @tc.number: SUB_CS_STD_0500
         * @tc.name: testTaskPoolReadAfterSwitch0001
         * @tc.desc: Verify TaskPool reads updated properties after switching color spaces.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testTaskPoolReadAfterSwitch0001', 0, async (done: Function) => {
            await runCase('testTaskPoolReadAfterSwitch0001', async (): Promise<void> => {
                const srgbResult: string = await readWithTaskPool('Btn_SRGB', 'SRGB');
                const dciResult: string = await readWithTaskPool('Btn_DCI_P3', 'DCI_P3');
                const dciInfo: string = await textOfId('StdColorSpaceInfo');
                const expectedSrgb: string = standardTaskPoolText('SRGB', colorSpaceManager.ColorSpace.SRGB);
                const expectedDci: string = standardTaskPoolText('DCI_P3', colorSpaceManager.ColorSpace.DCI_P3);
                const expectedInfo: string = standardInfoText('DCI_P3', 'DCI_P3', colorSpaceManager.ColorSpace.DCI_P3);
                await addLog(`testTaskPoolReadAfterSwitch0001: actual=${srgbResult}, expected=${expectedSrgb}`);
                expect(srgbResult).assertEqual(expectedSrgb);
                await addLog(`testTaskPoolReadAfterSwitch0001: actual=${dciResult}, expected=${expectedDci}`);
                expect(dciResult).assertEqual(expectedDci);
                await addLog(`testTaskPoolReadAfterSwitch0001: actual=${dciInfo}, expected=${expectedInfo}`);
                expect(dciInfo).assertEqual(expectedInfo);
            }, done);
        });

        // ==================== 创建与对比状态隔离（1 条） ====================

        /*
         * @tc.number: SUB_CS_STD_0600
         * @tc.name: testStandardCreateDoesNotChangeCompare0001
         * @tc.desc: Verify creating a color space preserves the existing comparison and rows.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testStandardCreateDoesNotChangeCompare0001', 0, async (done: Function) => {
            await runCase('testStandardCreateDoesNotChangeCompare0001', async (): Promise<void> => {
                await clickScrolledId('CmpBtn_SRGB');
                await clickScrolledId('CmpBtn_Display_P3');
                await clickScrolledId('BtnDrawCompare');
                const before: string = await waitTextContains('StdCompareResult', 'Comparing:');
                await clickScrolledId('Btn_DCI_P3');
                const info: string = await waitTextContains('StdColorSpaceInfo', 'Type: DCI_P3');
                await scrollToId('StdCompareResult');
                const after: string = await textOfId('StdCompareResult');
                const rowExists: boolean = await existsTextByScrollingDown(
                    'Display_P3 | R(0.68,0.32) G(0.265,0.69) B(0.15,0.06) | W(0.3127,0.329) | γ2.2 | Area:0.1520');
                const expectedInfo: string = standardInfoText('DCI_P3', 'DCI_P3', colorSpaceManager.ColorSpace.DCI_P3);
                await addLog(`testStandardCreateDoesNotChangeCompare0001: actual before=${before}, ` +
                  `expected SRGB vs Display_P3`);
                expect(before).assertEqual('Comparing: SRGB vs Display_P3');
                await addLog(`testStandardCreateDoesNotChangeCompare0001: actual=${info}, expected=${expectedInfo}`);
                expect(info).assertEqual(expectedInfo);
                await addLog(`testStandardCreateDoesNotChangeCompare0001: actual after=${after}, ` +
                  `expected unchanged comparison`);
                expect(after).assertEqual(before);
                await addLog(`testStandardCreateDoesNotChangeCompare0001: actual Display row=${rowExists}, ` +
                  `expected=true`);
                expect(rowExists).assertTrue();
            }, done);
        });
    });
}
