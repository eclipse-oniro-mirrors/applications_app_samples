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
    startApp, runCase, addLog, resetToIndex, navigateToStandard, clickScrolledId, textOfId,
    factsOf, numberAfter, isCloseTo, existsId, scrollPageToTop, ColorSpaceFacts
} from '../testkit/SharedDriver';
import {
    STANDARD_COLOR_SPACES, EXTENDED_COLOR_SPACES, ColorSpaceInfo, getColorSpaceNameStr
} from '../../../main/ets/common/ColorSpaceData';

// The name the system reports for an enum value, resolved the same way the standard page does it.
function platformName(info: ColorSpaceInfo): string {
    const manager: sendableColorSpaceManager.ColorSpaceManager = sendableColorSpaceManager.create(info.enumValue);
    return getColorSpaceNameStr(manager.getColorSpaceName());
}

export default function colorSpaceValueMatrixTest(): void {
    describe('ColorSpaceValueMatrix', () => {
        beforeAll(async () => {
            await addLog('ColorSpaceValueMatrix suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToStandard();
        });

        // ==================== Standard range: 8 entries, one case each ====================

        /*
         * @tc.number: SUB_CS_VALUE_0101
         * @tc.name: testStandardValue0001
         * @tc.desc: Verify the SRGB button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testStandardValue0001', 0, async (done: Function) => {
            await runCase('testStandardValue0001', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[0];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`Btn_${info.label}`);
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testStandardValue0001: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testStandardValue0001: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testStandardValue0001: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testStandardValue0001: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testStandardValue0001: gamut canvas visible for ${info.label}`);
                expect(await existsId('StdGamutCanvas')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0102
         * @tc.name: testStandardValue0002
         * @tc.desc: Verify the Display_P3 button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testStandardValue0002', 0, async (done: Function) => {
            await runCase('testStandardValue0002', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[1];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`Btn_${info.label}`);
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testStandardValue0002: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testStandardValue0002: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testStandardValue0002: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testStandardValue0002: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testStandardValue0002: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0103
         * @tc.name: testStandardValue0003
         * @tc.desc: Verify the DCI_P3 button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testStandardValue0003', 0, async (done: Function) => {
            await runCase('testStandardValue0003', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[2];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`Btn_${info.label}`);
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testStandardValue0003: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testStandardValue0003: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testStandardValue0003: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testStandardValue0003: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testStandardValue0003: gamut canvas visible for ${info.label}`);
                expect(await existsId('StdGamutCanvas')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0104
         * @tc.name: testStandardValue0004
         * @tc.desc: Verify the BT2020_HLG button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testStandardValue0004', 0, async (done: Function) => {
            await runCase('testStandardValue0004', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[3];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`Btn_${info.label}`);
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testStandardValue0004: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testStandardValue0004: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testStandardValue0004: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testStandardValue0004: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testStandardValue0004: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0105
         * @tc.name: testStandardValue0005
         * @tc.desc: Verify the BT2020_PQ button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testStandardValue0005', 0, async (done: Function) => {
            await runCase('testStandardValue0005', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[4];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`Btn_${info.label}`);
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testStandardValue0005: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testStandardValue0005: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testStandardValue0005: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testStandardValue0005: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testStandardValue0005: gamut canvas visible for ${info.label}`);
                expect(await existsId('StdGamutCanvas')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0106
         * @tc.name: testStandardValue0006
         * @tc.desc: Verify the BT709 button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testStandardValue0006', 0, async (done: Function) => {
            await runCase('testStandardValue0006', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[5];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`Btn_${info.label}`);
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testStandardValue0006: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testStandardValue0006: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testStandardValue0006: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testStandardValue0006: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testStandardValue0006: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0107
         * @tc.name: testStandardValue0007
         * @tc.desc: Verify the Adobe_RGB_1998 button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testStandardValue0007', 0, async (done: Function) => {
            await runCase('testStandardValue0007', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[6];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`Btn_${info.label}`);
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testStandardValue0007: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testStandardValue0007: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testStandardValue0007: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testStandardValue0007: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testStandardValue0007: gamut canvas visible for ${info.label}`);
                expect(await existsId('StdGamutCanvas')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0108
         * @tc.name: testStandardValue0008
         * @tc.desc: Verify the Linear_SRGB button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testStandardValue0008', 0, async (done: Function) => {
            await runCase('testStandardValue0008', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[7];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`Btn_${info.label}`);
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testStandardValue0008: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testStandardValue0008: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testStandardValue0008: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testStandardValue0008: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testStandardValue0008: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        // ==================== Extended range: 7 entries, one case each ====================

        /*
         * @tc.number: SUB_CS_VALUE_0201
         * @tc.name: testExtendedValue0001
         * @tc.desc: Verify the BT601_EBU button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExtendedValue0001', 0, async (done: Function) => {
            await runCase('testExtendedValue0001', async (): Promise<void> => {
                const info: ColorSpaceInfo = EXTENDED_COLOR_SPACES[0];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`ExtBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testExtendedValue0001: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testExtendedValue0001: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testExtendedValue0001: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testExtendedValue0001: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testExtendedValue0001: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0202
         * @tc.name: testExtendedValue0002
         * @tc.desc: Verify the BT601_SMPTE_C button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExtendedValue0002', 0, async (done: Function) => {
            await runCase('testExtendedValue0002', async (): Promise<void> => {
                const info: ColorSpaceInfo = EXTENDED_COLOR_SPACES[1];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`ExtBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testExtendedValue0002: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testExtendedValue0002: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testExtendedValue0002: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testExtendedValue0002: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testExtendedValue0002: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0203
         * @tc.name: testExtendedValue0003
         * @tc.desc: Verify the P3_HLG button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExtendedValue0003', 0, async (done: Function) => {
            await runCase('testExtendedValue0003', async (): Promise<void> => {
                const info: ColorSpaceInfo = EXTENDED_COLOR_SPACES[2];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`ExtBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testExtendedValue0003: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testExtendedValue0003: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testExtendedValue0003: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testExtendedValue0003: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testExtendedValue0003: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0204
         * @tc.name: testExtendedValue0004
         * @tc.desc: Verify the P3_PQ button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExtendedValue0004', 0, async (done: Function) => {
            await runCase('testExtendedValue0004', async (): Promise<void> => {
                const info: ColorSpaceInfo = EXTENDED_COLOR_SPACES[3];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`ExtBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testExtendedValue0004: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testExtendedValue0004: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testExtendedValue0004: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testExtendedValue0004: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testExtendedValue0004: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0205
         * @tc.name: testExtendedValue0005
         * @tc.desc: Verify the Linear_BT2020 button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExtendedValue0005', 0, async (done: Function) => {
            await runCase('testExtendedValue0005', async (): Promise<void> => {
                const info: ColorSpaceInfo = EXTENDED_COLOR_SPACES[4];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`ExtBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testExtendedValue0005: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testExtendedValue0005: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testExtendedValue0005: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testExtendedValue0005: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testExtendedValue0005: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0206
         * @tc.name: testExtendedValue0006
         * @tc.desc: Verify the H_LOG button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExtendedValue0006', 0, async (done: Function) => {
            await runCase('testExtendedValue0006', async (): Promise<void> => {
                const info: ColorSpaceInfo = EXTENDED_COLOR_SPACES[5];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`ExtBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testExtendedValue0006: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testExtendedValue0006: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testExtendedValue0006: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testExtendedValue0006: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testExtendedValue0006: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0207
         * @tc.name: testExtendedValue0007
         * @tc.desc: Verify the Display_BT2020 button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExtendedValue0007', 0, async (done: Function) => {
            await runCase('testExtendedValue0007', async (): Promise<void> => {
                const info: ColorSpaceInfo = EXTENDED_COLOR_SPACES[6];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`ExtBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testExtendedValue0007: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testExtendedValue0007: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testExtendedValue0007: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testExtendedValue0007: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testExtendedValue0007: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });
    });
}
