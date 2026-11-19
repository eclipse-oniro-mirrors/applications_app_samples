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
    startApp, runCase, addLog, waitId, textOfId, resetToIndex, navigateToCustom,
    clickScrolledId, scrollToId, scrollPageToTop, inputText, waitTextContains, numberAfter, isCloseTo,
    textOrEmpty
} from '../testkit/SharedDriver';

async function inputScrolledText(id: string, value: string): Promise<void> {
    await scrollToId(id);
    await inputText(id, value);
}

export default function customColorSpaceTest(): void {
    describe('CustomColorSpaceTest', () => {
        beforeAll(async () => {
            await addLog('CustomColorSpaceTest suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToCustom();
        });

        // ==================== 页面结构（1 条） ====================

        /*
         * @tc.number: SUB_CS_CUSTOM_0100
         * @tc.name: testCustomPageLayout0001
         * @tc.desc: Verify custom page labels and creation controls.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomPageLayout0001', 0, async (done: Function) => {
            await runCase('testCustomPageLayout0001', async (): Promise<void> => {
                const title: string = await textOfId('CustomPageTitle');
                const primariesLabel: string = await textOfId('PrimariesLabel');
                await scrollToId('BtnCreateCustom');
                const whitePointLabel: string = await textOfId('WhitePointLabel');
                const createText: string = await textOfId('BtnCreateCustom');
                const resetText: string = await textOfId('BtnReset');
                await addLog(`testCustomPageLayout0001: actual=${title}, expected=Custom Color Space`);
                expect(title).assertEqual('Custom Color Space');
                await addLog(`testCustomPageLayout0001: actual=${primariesLabel}, expected=Primaries (CIE xy)`);
                expect(primariesLabel).assertEqual('Primaries (CIE xy)');
                await addLog(`testCustomPageLayout0001: actual=${whitePointLabel}, expected=White Point (CIE xy)`);
                expect(whitePointLabel).assertEqual('White Point (CIE xy)');
                await addLog(`testCustomPageLayout0001: actual=${createText}, expected=Create Custom`);
                expect(createText).assertEqual('Create Custom');
                await addLog(`testCustomPageLayout0001: actual=${resetText}, expected=Reset`);
                expect(resetText).assertEqual('Reset');
            }, done);
        });

        // ==================== 默认创建完整输出（1 条） ====================

        /*
         * @tc.number: SUB_CS_CUSTOM_0200
         * @tc.name: testCreateCustomDefault0001
         * @tc.desc: Verify default creation returns complete custom properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCreateCustomDefault0001', 0, async (done: Function) => {
            await runCase('testCreateCustomDefault0001', async (): Promise<void> => {
                const initialInfo: string = await textOfId('CustomColorSpaceInfo');
                await clickScrolledId('BtnCreateCustom');
                const info: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const gamma: string = await textOfId('GammaValue');
                // The reported gamma keeps its float32 precision, so it is compared numerically.
                const reportedGamma: number = numberAfter(info, 'Gamma: ');
                await addLog(`testCreateCustomDefault0001: actual=${initialInfo}, expected empty initial result`);
                expect(initialInfo).assertEqual('');
                await addLog(`testCreateCustomDefault0001: actual=${info}, expected default header`);
                expect(info).assertContain('Type: Custom\nColorSpaceName: Custom\nWhitePoint: [0.3127, 0.3290]');
                await addLog(`testCreateCustomDefault0001: actual gamma=${reportedGamma}, expected=2.2`);
                expect(isCloseTo(reportedGamma, 2.2, 0.001)).assertTrue();
                await addLog(`testCreateCustomDefault0001: actual=${info}, expected default primaries and white point`);
                expect(info).assertContain('Primaries: R(0.64,0.33) G(0.3,0.6) B(0.15,0.06)\nWhitePoint Input: ' +
                  '(0.3127,0.329)');
                await addLog(`testCreateCustomDefault0001: actual=${gamma}, expected unchanged gamma=2.20`);
                expect(gamma).assertEqual('2.20');
            }, done);
        });

        // ==================== 越界坐标错误处理（1 条） ====================

        /*
         * @tc.number: SUB_CS_CUSTOM_0300
         * @tc.name: testInvalidPrimariesInput0001
         * @tc.desc: Verify a negative primary coordinate is accepted by the platform and echoed in the result.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testInvalidPrimariesInput0001', 0, async (done: Function) => {
            await runCase('testInvalidPrimariesInput0001', async (): Promise<void> => {
                await inputScrolledText('InputRedX', '-1');
                await clickScrolledId('BtnCreateCustom');
                // The platform accepts negative CIE coordinates, so the value is echoed instead of rejected.
                const info: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const redX: string = await textOfId('InputRedX');
                await addLog(`testInvalidPrimariesInput0001: actual=${info}, expected negative red X echoed`);
                expect(info).assertContain('Primaries: R(-1,0.33) G(0.3,0.6) B(0.15,0.06)');
                await addLog(`testInvalidPrimariesInput0001: actual redX=${redX}, expected preserved input=-1`);
                expect(redX).assertEqual('-1');
                await addLog(`testInvalidPrimariesInput0001: actual name line, expected a custom space name`);
                expect(info).assertContain('ColorSpaceName:');
            }, done);
        });

        // ==================== 八项坐标完整重置（1 条） ====================

        /*
         * @tc.number: SUB_CS_CUSTOM_0400
         * @tc.name: testResetAllCoordinates0001
         * @tc.desc: Verify reset restores all primary and white point coordinates.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testResetAllCoordinates0001', 0, async (done: Function) => {
            await runCase('testResetAllCoordinates0001', async (): Promise<void> => {
                await inputScrolledText('InputRedX', '0.68');
                await inputScrolledText('InputRedY', '0.32');
                await inputScrolledText('InputGreenX', '0.265');
                await inputScrolledText('InputGreenY', '0.69');
                await inputScrolledText('InputBlueX', '0.14');
                await inputScrolledText('InputBlueY', '0.07');
                await inputScrolledText('InputWhiteX', '0.314');
                await inputScrolledText('InputWhiteY', '0.351');
                await clickScrolledId('BtnCreateCustom');
                const createdInfo: string = await waitTextContains('CustomColorSpaceInfo', 'R(0.68,0.32)');
                await clickScrolledId('BtnReset');
                const info: string = await textOrEmpty('CustomColorSpaceInfo');
                // Every coordinate is read after a single scroll so the case stays well inside its time budget.
                await scrollPageToTop();
                const redX: string = await textOfId('InputRedX');
                const redY: string = await textOfId('InputRedY');
                const greenX: string = await textOfId('InputGreenX');
                const greenY: string = await textOfId('InputGreenY');
                const blueX: string = await textOfId('InputBlueX');
                const blueY: string = await textOfId('InputBlueY');
                const whiteX: string = await textOfId('InputWhiteX');
                const whiteY: string = await textOfId('InputWhiteY');
                const gamma: string = await textOfId('GammaValue');
                await addLog(`testResetAllCoordinates0001: actual=${createdInfo}, expected changed P3 primaries`);
                expect(createdInfo).assertContain('Primaries: R(0.68,0.32) G(0.265,0.69) B(0.14,0.07)');
                await addLog(`testResetAllCoordinates0001: actual=${redX}, expected=0.64`);
                expect(redX).assertEqual('0.64');
                await addLog(`testResetAllCoordinates0001: actual=${redY}, expected=0.33`);
                expect(redY).assertEqual('0.33');
                await addLog(`testResetAllCoordinates0001: actual=${greenX}, expected=0.30`);
                expect(greenX).assertEqual('0.30');
                await addLog(`testResetAllCoordinates0001: actual=${greenY}, expected=0.60`);
                expect(greenY).assertEqual('0.60');
                await addLog(`testResetAllCoordinates0001: actual=${blueX}, expected=0.15`);
                expect(blueX).assertEqual('0.15');
                await addLog(`testResetAllCoordinates0001: actual=${blueY}, expected=0.06`);
                expect(blueY).assertEqual('0.06');
                await addLog(`testResetAllCoordinates0001: actual=${whiteX}, expected=0.3127`);
                expect(whiteX).assertEqual('0.3127');
                await addLog(`testResetAllCoordinates0001: actual=${whiteY}, expected=0.3290`);
                expect(whiteY).assertEqual('0.3290');
                await addLog(`testResetAllCoordinates0001: actual=${gamma}, expected=2.20`);
                expect(gamma).assertEqual('2.20');
                await addLog(`testResetAllCoordinates0001: actual=${info}, expected empty reset result`);
                expect(info).assertEqual('');
            }, done);
        });

        // ==================== 返回后的初始状态（1 条） ====================

        /*
         * @tc.number: SUB_CS_CUSTOM_0500
         * @tc.name: testCustomReturnInitialState0001
         * @tc.desc: Verify leaving and revisiting custom page restores initial state.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testCustomReturnInitialState0001', 0, async (done: Function) => {
            await runCase('testCustomReturnInitialState0001', async (): Promise<void> => {
                await clickScrolledId('BtnCreateCustom');
                await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                await clickScrolledId('CustomBtnBack');
                await waitId('TitleText');
                await navigateToCustom();
                const title: string = await textOfId('CustomPageTitle');
                const gamma: string = await textOfId('GammaValue');
                const redX: string = await textOfId('InputRedX');
                const info: string = await textOfId('CustomColorSpaceInfo');
                await addLog(`testCustomReturnInitialState0001: actual=${title}, expected=Custom Color Space`);
                expect(title).assertEqual('Custom Color Space');
                await addLog(`testCustomReturnInitialState0001: actual=${gamma}, expected=2.20`);
                expect(gamma).assertEqual('2.20');
                await addLog(`testCustomReturnInitialState0001: actual=${redX}, expected=0.64`);
                expect(redX).assertEqual('0.64');
                await addLog(`testCustomReturnInitialState0001: actual=${info}, expected empty revisit result`);
                expect(info).assertEqual('');
            }, done);
        });
    });
}
