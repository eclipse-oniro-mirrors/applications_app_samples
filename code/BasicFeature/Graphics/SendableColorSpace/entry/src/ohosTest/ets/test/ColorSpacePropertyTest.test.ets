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
    startApp, runCase, addLog, textOfId, resetToIndex, navigateToStandard,
    clickScrolledId, waitTextContains, gammaMatches, delay
} from '../testkit/SharedDriver';

async function readProperties(buttonId: string, label: string): Promise<string> {
    await navigateToStandard();
    await clickScrolledId(buttonId);
    // The info block is rebuilt on every selection, so a single read can sample it while it is still empty.
    const expected: string = `Type: ${label}`;
    for (let attempt = 0; attempt < 10; attempt++) {
        const text: string = await textOfId('StdColorSpaceInfo');
        if (text.includes(expected)) {
            return text;
        }
        await delay(200);
    }
    await waitTextContains('StdColorSpaceInfo', expected);
    return textOfId('StdColorSpaceInfo');
}

export default function colorSpacePropertyTest(): void {
    describe('ColorSpacePropertyTest', () => {
        beforeAll(async () => {
            await addLog('ColorSpacePropertyTest suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
        });

        // ==================== 标准色域属性（8 条） ====================

        /*
         * @tc.number: SUB_CS_PROP_0100
         * @tc.name: testSrgbIndependentCreate0001
         * @tc.desc: Verify SRGB name, white point and gamma properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSrgbIndependentCreate0001', 0, async (done: Function) => {
            await runCase('testSrgbIndependentCreate0001', async (): Promise<void> => {
                const info: string = await readProperties('Btn_SRGB', 'SRGB');
                await addLog(`testSrgbIndependentCreate0001: actual=${info}, expected SRGB type and name`);
                expect(info).assertContain('Type: SRGB\nColorSpaceName: SRGB\n');
                await addLog(`testSrgbIndependentCreate0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testSrgbIndependentCreate0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.SRGB)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_0200
         * @tc.name: testDisplayP3IndependentCreate0001
         * @tc.desc: Verify Display P3 name, white point and gamma properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDisplayP3IndependentCreate0001', 0, async (done: Function) => {
            await runCase('testDisplayP3IndependentCreate0001', async (): Promise<void> => {
                const info: string = await readProperties('Btn_Display_P3', 'Display_P3');
                await addLog(`testDisplayP3IndependentCreate0001: actual=${info}, expected Display P3 type and name`);
                expect(info).assertContain('Type: Display_P3\nColorSpaceName: Display_P3\n');
                await addLog(`testDisplayP3IndependentCreate0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testDisplayP3IndependentCreate0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.DISPLAY_P3)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_0300
         * @tc.name: testDciP3IndependentCreate0001
         * @tc.desc: Verify DCI P3 name, white point and gamma properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDciP3IndependentCreate0001', 0, async (done: Function) => {
            await runCase('testDciP3IndependentCreate0001', async (): Promise<void> => {
                const info: string = await readProperties('Btn_DCI_P3', 'DCI_P3');
                await addLog(`testDciP3IndependentCreate0001: actual=${info}, expected DCI P3 type and name`);
                expect(info).assertContain('Type: DCI_P3\nColorSpaceName: DCI_P3\n');
                await addLog(`testDciP3IndependentCreate0001: actual=${info}, expected DCI white point`);
                expect(info).assertContain('WhitePoint: [0.3140, 0.3510]');
                await addLog(`testDciP3IndependentCreate0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.DCI_P3)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_0400
         * @tc.name: testBt2020HlgIndependentCreate0001
         * @tc.desc: Verify BT2020 HLG name, white point and gamma properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBt2020HlgIndependentCreate0001', 0, async (done: Function) => {
            await runCase('testBt2020HlgIndependentCreate0001', async (): Promise<void> => {
                const info: string = await readProperties('Btn_BT2020_HLG', 'BT2020_HLG');
                await addLog(`testBt2020HlgIndependentCreate0001: actual=${info}, expected BT2020 HLG type and name`);
                expect(info).assertContain('Type: BT2020_HLG\nColorSpaceName: BT2020_HLG\n');
                await addLog(`testBt2020HlgIndependentCreate0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testBt2020HlgIndependentCreate0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.BT2020_HLG)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_0500
         * @tc.name: testBt2020PqIndependentCreate0001
         * @tc.desc: Verify BT2020 PQ name, white point and gamma properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBt2020PqIndependentCreate0001', 0, async (done: Function) => {
            await runCase('testBt2020PqIndependentCreate0001', async (): Promise<void> => {
                const info: string = await readProperties('Btn_BT2020_PQ', 'BT2020_PQ');
                await addLog(`testBt2020PqIndependentCreate0001: actual=${info}, expected BT2020 PQ type and name`);
                expect(info).assertContain('Type: BT2020_PQ\nColorSpaceName: BT2020_PQ\n');
                await addLog(`testBt2020PqIndependentCreate0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testBt2020PqIndependentCreate0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.BT2020_PQ)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_0600
         * @tc.name: testBt709IndependentCreate0001
         * @tc.desc: Verify BT709 name, white point and gamma properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testBt709IndependentCreate0001', 0, async (done: Function) => {
            await runCase('testBt709IndependentCreate0001', async (): Promise<void> => {
                const info: string = await readProperties('Btn_BT709', 'BT709');
                await addLog(`testBt709IndependentCreate0001: actual=${info}, expected BT709 type and name`);
                expect(info).assertContain('Type: BT709\nColorSpaceName: BT709\n');
                await addLog(`testBt709IndependentCreate0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testBt709IndependentCreate0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.BT709)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_0700
         * @tc.name: testAdobeRgbIndependentCreate0001
         * @tc.desc: Verify Adobe RGB name, white point and gamma properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testAdobeRgbIndependentCreate0001', 0, async (done: Function) => {
            await runCase('testAdobeRgbIndependentCreate0001', async (): Promise<void> => {
                const info: string = await readProperties('Btn_Adobe_RGB_1998', 'Adobe_RGB_1998');
                await addLog(`testAdobeRgbIndependentCreate0001: actual=${info}, expected Adobe RGB type and name`);
                expect(info).assertContain('Type: Adobe_RGB_1998\nColorSpaceName: Adobe_RGB_1998\n');
                await addLog(`testAdobeRgbIndependentCreate0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testAdobeRgbIndependentCreate0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.ADOBE_RGB_1998)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_0800
         * @tc.name: testLinearSrgbIndependentCreate0001
         * @tc.desc: Verify Linear SRGB name, white point and gamma properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testLinearSrgbIndependentCreate0001', 0, async (done: Function) => {
            await runCase('testLinearSrgbIndependentCreate0001', async (): Promise<void> => {
                const info: string = await readProperties('Btn_Linear_SRGB', 'Linear_SRGB');
                await addLog(`testLinearSrgbIndependentCreate0001: actual=${info}, expected Linear SRGB type and name`);
                expect(info).assertContain('Type: Linear_SRGB\nColorSpaceName: Linear_SRGB\n');
                await addLog(`testLinearSrgbIndependentCreate0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testLinearSrgbIndependentCreate0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.LINEAR_SRGB)).assertTrue();
            }, done);
        });

        // ==================== 扩展色域属性（7 条） ====================

        /*
         * @tc.number: SUB_CS_PROP_0900
         * @tc.name: testBt601EbuProperty0001
         * @tc.desc: Verify BT601 EBU creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBt601EbuProperty0001', 0, async (done: Function) => {
            await runCase('testBt601EbuProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('ExtBtn_BT601_EBU', 'BT601_EBU');
                await addLog(`testBt601EbuProperty0001: actual=${info}, expected BT601 EBU type and name`);
                expect(info).assertContain('Type: BT601_EBU\nColorSpaceName: BT601_EBU\n');
                await addLog(`testBt601EbuProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testBt601EbuProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.BT601_EBU)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_1000
         * @tc.name: testBt601SmpteProperty0001
         * @tc.desc: Verify BT601 SMPTE C creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBt601SmpteProperty0001', 0, async (done: Function) => {
            await runCase('testBt601SmpteProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('ExtBtn_BT601_SMPTE_C', 'BT601_SMPTE_C');
                await addLog(`testBt601SmpteProperty0001: actual=${info}, expected BT601 SMPTE C type and name`);
                expect(info).assertContain('Type: BT601_SMPTE_C\nColorSpaceName: BT601_SMPTE_C\n');
                await addLog(`testBt601SmpteProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testBt601SmpteProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.BT601_SMPTE_C)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_1100
         * @tc.name: testP3HlgProperty0001
         * @tc.desc: Verify P3 HLG creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testP3HlgProperty0001', 0, async (done: Function) => {
            await runCase('testP3HlgProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('ExtBtn_P3_HLG', 'P3_HLG');
                await addLog(`testP3HlgProperty0001: actual=${info}, expected P3 HLG type and name`);
                expect(info).assertContain('Type: P3_HLG\nColorSpaceName: P3_HLG\n');
                await addLog(`testP3HlgProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testP3HlgProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.P3_HLG)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_1200
         * @tc.name: testP3PqProperty0001
         * @tc.desc: Verify P3 PQ creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testP3PqProperty0001', 0, async (done: Function) => {
            await runCase('testP3PqProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('ExtBtn_P3_PQ', 'P3_PQ');
                await addLog(`testP3PqProperty0001: actual=${info}, expected P3 PQ type and name`);
                expect(info).assertContain('Type: P3_PQ\nColorSpaceName: P3_PQ\n');
                await addLog(`testP3PqProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testP3PqProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.P3_PQ)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_1300
         * @tc.name: testLinearBt2020Property0001
         * @tc.desc: Verify Linear BT2020 creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testLinearBt2020Property0001', 0, async (done: Function) => {
            await runCase('testLinearBt2020Property0001', async (): Promise<void> => {
                const info: string = await readProperties('ExtBtn_Linear_BT2020', 'Linear_BT2020');
                await addLog(`testLinearBt2020Property0001: actual=${info}, expected Linear BT2020 type and name`);
                expect(info).assertContain('Type: Linear_BT2020\nColorSpaceName: Linear_BT2020\n');
                await addLog(`testLinearBt2020Property0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testLinearBt2020Property0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.LINEAR_BT2020)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_1400
         * @tc.name: testHLogProperty0001
         * @tc.desc: Verify H LOG creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testHLogProperty0001', 0, async (done: Function) => {
            await runCase('testHLogProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('ExtBtn_H_LOG', 'H_LOG');
                await addLog(`testHLogProperty0001: actual=${info}, expected H LOG type and name`);
                expect(info).assertContain('Type: H_LOG\nColorSpaceName: H_LOG\n');
                await addLog(`testHLogProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testHLogProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.H_LOG)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_1500
         * @tc.name: testDisplayBt2020Property0001
         * @tc.desc: Verify Display BT2020 creation and API name mapping.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testDisplayBt2020Property0001', 0, async (done: Function) => {
            await runCase('testDisplayBt2020Property0001', async (): Promise<void> => {
                const info: string = await readProperties('ExtBtn_Display_BT2020', 'Display_BT2020');
                await addLog(`testDisplayBt2020Property0001: actual=${info}, ` +
                  `expected Display BT2020 type and API name`);
                expect(info).assertContain('Type: Display_BT2020\nColorSpaceName: Display_BT2020_SRGB\n');
                await addLog(`testDisplayBt2020Property0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testDisplayBt2020Property0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB)).assertTrue();
            }, done);
        });

        // ==================== LIMIT 色域属性（11 条） ====================

        /*
         * @tc.number: SUB_CS_PROP_1600
         * @tc.name: testAdobeRgbLimitProperty0001
         * @tc.desc: Verify Adobe RGB Limit creation and API name mapping.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testAdobeRgbLimitProperty0001', 0, async (done: Function) => {
            await runCase('testAdobeRgbLimitProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('LimBtn_Adobe_RGB_Limit', 'Adobe_RGB_Limit');
                await addLog(`testAdobeRgbLimitProperty0001: actual=${info}, ` +
                  `expected Adobe RGB Limit type and API name`);
                expect(info).assertContain('Type: Adobe_RGB_Limit\nColorSpaceName: Adobe_RGB_1998_Limit\n');
                await addLog(`testAdobeRgbLimitProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testAdobeRgbLimitProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_1700
         * @tc.name: testDisplayP3LimitProperty0001
         * @tc.desc: Verify Display P3 Limit creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testDisplayP3LimitProperty0001', 0, async (done: Function) => {
            await runCase('testDisplayP3LimitProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('LimBtn_Display_P3_Limit', 'Display_P3_Limit');
                await addLog(`testDisplayP3LimitProperty0001: actual=${info}, expected Display P3 Limit type and name`);
                expect(info).assertContain('Type: Display_P3_Limit\nColorSpaceName: Display_P3_Limit\n');
                await addLog(`testDisplayP3LimitProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testDisplayP3LimitProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_1800
         * @tc.name: testSrgbLimitProperty0001
         * @tc.desc: Verify SRGB Limit creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testSrgbLimitProperty0001', 0, async (done: Function) => {
            await runCase('testSrgbLimitProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('LimBtn_SRGB_Limit', 'SRGB_Limit');
                await addLog(`testSrgbLimitProperty0001: actual=${info}, expected SRGB Limit type and name`);
                expect(info).assertContain('Type: SRGB_Limit\nColorSpaceName: SRGB_Limit\n');
                await addLog(`testSrgbLimitProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testSrgbLimitProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.SRGB_LIMIT)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_1900
         * @tc.name: testBt709LimitProperty0001
         * @tc.desc: Verify BT709 Limit creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBt709LimitProperty0001', 0, async (done: Function) => {
            await runCase('testBt709LimitProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('LimBtn_BT709_Limit', 'BT709_Limit');
                await addLog(`testBt709LimitProperty0001: actual=${info}, expected BT709 Limit type and name`);
                expect(info).assertContain('Type: BT709_Limit\nColorSpaceName: BT709_Limit\n');
                await addLog(`testBt709LimitProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testBt709LimitProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.BT709_LIMIT)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_2000
         * @tc.name: testBt601EbuLimitProperty0001
         * @tc.desc: Verify BT601 EBU Limit creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBt601EbuLimitProperty0001', 0, async (done: Function) => {
            await runCase('testBt601EbuLimitProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('LimBtn_BT601_EBU_Limit', 'BT601_EBU_Limit');
                await addLog(`testBt601EbuLimitProperty0001: actual=${info}, expected BT601 EBU Limit type and name`);
                expect(info).assertContain('Type: BT601_EBU_Limit\nColorSpaceName: BT601_EBU_Limit\n');
                await addLog(`testBt601EbuLimitProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testBt601EbuLimitProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.BT601_EBU_LIMIT)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_2100
         * @tc.name: testBt601SmpteLimitProperty0001
         * @tc.desc: Verify BT601 SMPTE Limit creation and API name mapping.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBt601SmpteLimitProperty0001', 0, async (done: Function) => {
            await runCase('testBt601SmpteLimitProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('LimBtn_BT601_SMPTE_Limit', 'BT601_SMPTE_Limit');
                await addLog(`testBt601SmpteLimitProperty0001: actual=${info}, ` +
                  `expected BT601 SMPTE Limit type and API name`);
                expect(info).assertContain('Type: BT601_SMPTE_Limit\nColorSpaceName: BT601_SMPTE_C_Limit\n');
                await addLog(`testBt601SmpteLimitProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testBt601SmpteLimitProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_2200
         * @tc.name: testBt2020HlgLimitProperty0001
         * @tc.desc: Verify BT2020 HLG Limit creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBt2020HlgLimitProperty0001', 0, async (done: Function) => {
            await runCase('testBt2020HlgLimitProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('LimBtn_BT2020_HLG_Limit', 'BT2020_HLG_Limit');
                await addLog(`testBt2020HlgLimitProperty0001: actual=${info}, expected BT2020 HLG Limit type and name`);
                expect(info).assertContain('Type: BT2020_HLG_Limit\nColorSpaceName: BT2020_HLG_Limit\n');
                await addLog(`testBt2020HlgLimitProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testBt2020HlgLimitProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_2300
         * @tc.name: testBt2020PqLimitProperty0001
         * @tc.desc: Verify BT2020 PQ Limit creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBt2020PqLimitProperty0001', 0, async (done: Function) => {
            await runCase('testBt2020PqLimitProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('LimBtn_BT2020_PQ_Limit', 'BT2020_PQ_Limit');
                await addLog(`testBt2020PqLimitProperty0001: actual=${info}, expected BT2020 PQ Limit type and name`);
                expect(info).assertContain('Type: BT2020_PQ_Limit\nColorSpaceName: BT2020_PQ_Limit\n');
                await addLog(`testBt2020PqLimitProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testBt2020PqLimitProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_2400
         * @tc.name: testP3HlgLimitProperty0001
         * @tc.desc: Verify P3 HLG Limit creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testP3HlgLimitProperty0001', 0, async (done: Function) => {
            await runCase('testP3HlgLimitProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('LimBtn_P3_HLG_Limit', 'P3_HLG_Limit');
                await addLog(`testP3HlgLimitProperty0001: actual=${info}, expected P3 HLG Limit type and name`);
                expect(info).assertContain('Type: P3_HLG_Limit\nColorSpaceName: P3_HLG_Limit\n');
                await addLog(`testP3HlgLimitProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testP3HlgLimitProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.P3_HLG_LIMIT)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_2500
         * @tc.name: testP3PqLimitProperty0001
         * @tc.desc: Verify P3 PQ Limit creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testP3PqLimitProperty0001', 0, async (done: Function) => {
            await runCase('testP3PqLimitProperty0001', async (): Promise<void> => {
                const info: string = await readProperties('LimBtn_P3_PQ_Limit', 'P3_PQ_Limit');
                await addLog(`testP3PqLimitProperty0001: actual=${info}, expected P3 PQ Limit type and name`);
                expect(info).assertContain('Type: P3_PQ_Limit\nColorSpaceName: P3_PQ_Limit\n');
                await addLog(`testP3PqLimitProperty0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testP3PqLimitProperty0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.P3_PQ_LIMIT)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_PROP_2600
         * @tc.name: testLinearP3Property0001
         * @tc.desc: Verify Linear P3 creation and properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testLinearP3Property0001', 0, async (done: Function) => {
            await runCase('testLinearP3Property0001', async (): Promise<void> => {
                const info: string = await readProperties('LimBtn_Linear_P3', 'Linear_P3');
                await addLog(`testLinearP3Property0001: actual=${info}, expected Linear P3 type and name`);
                expect(info).assertContain('Type: Linear_P3\nColorSpaceName: Linear_P3\n');
                await addLog(`testLinearP3Property0001: actual=${info}, expected D65 white point`);
                expect(info).assertContain('WhitePoint: [0.3127, 0.3290]');
                await addLog(`testLinearP3Property0001: actual=${info}, expected system gamma`);
                expect(gammaMatches(info, colorSpaceManager.ColorSpace.LINEAR_P3)).assertTrue();
            }, done);
        });
    });
}
