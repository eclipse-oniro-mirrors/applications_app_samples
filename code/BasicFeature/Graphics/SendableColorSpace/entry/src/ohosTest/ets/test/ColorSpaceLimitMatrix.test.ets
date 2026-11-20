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
import { sendableColorSpaceManager } from '@kit.ArkGraphics2D';
import {
    startApp, runCase, addLog, resetToIndex, navigateToStandard, clickScrolledId, textOfId,
    factsOf, numberAfter, isCloseTo, scrollPageToTop, ColorSpaceFacts
} from '../testkit/SharedDriver';
import { LIMIT_COLOR_SPACES, ColorSpaceInfo, getColorSpaceNameStr } from '../../../main/ets/common/ColorSpaceData';

// The name the system reports for an enum value, resolved the same way the standard page does it.
function platformName(info: ColorSpaceInfo): string {
    const manager: sendableColorSpaceManager.ColorSpaceManager = sendableColorSpaceManager.create(info.enumValue);
    return getColorSpaceNameStr(manager.getColorSpaceName());
}

export default function colorSpaceLimitMatrixTest(): void {
    describe('ColorSpaceLimitMatrix', () => {
        beforeAll(async () => {
            await addLog('ColorSpaceLimitMatrix suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToStandard();
        });

        // ==================== Limit range: 11 entries, one case each ====================

        /*
         * @tc.number: SUB_CS_VALUE_0301
         * @tc.name: testLimitValue0001
         * @tc.desc: Verify the Adobe_RGB_Limit button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testLimitValue0001', 0, async (done: Function) => {
            await runCase('testLimitValue0001', async (): Promise<void> => {
                const info: ColorSpaceInfo = LIMIT_COLOR_SPACES[0];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`LimBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testLimitValue0001: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testLimitValue0001: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testLimitValue0001: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testLimitValue0001: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testLimitValue0001: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0302
         * @tc.name: testLimitValue0002
         * @tc.desc: Verify the Display_P3_Limit button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testLimitValue0002', 0, async (done: Function) => {
            await runCase('testLimitValue0002', async (): Promise<void> => {
                const info: ColorSpaceInfo = LIMIT_COLOR_SPACES[1];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`LimBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testLimitValue0002: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testLimitValue0002: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testLimitValue0002: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testLimitValue0002: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testLimitValue0002: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0303
         * @tc.name: testLimitValue0003
         * @tc.desc: Verify the SRGB_Limit button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testLimitValue0003', 0, async (done: Function) => {
            await runCase('testLimitValue0003', async (): Promise<void> => {
                const info: ColorSpaceInfo = LIMIT_COLOR_SPACES[2];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`LimBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testLimitValue0003: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testLimitValue0003: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testLimitValue0003: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testLimitValue0003: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testLimitValue0003: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0304
         * @tc.name: testLimitValue0004
         * @tc.desc: Verify the BT709_Limit button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testLimitValue0004', 0, async (done: Function) => {
            await runCase('testLimitValue0004', async (): Promise<void> => {
                const info: ColorSpaceInfo = LIMIT_COLOR_SPACES[3];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`LimBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testLimitValue0004: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testLimitValue0004: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testLimitValue0004: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testLimitValue0004: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testLimitValue0004: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0305
         * @tc.name: testLimitValue0005
         * @tc.desc: Verify the BT601_EBU_Limit button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testLimitValue0005', 0, async (done: Function) => {
            await runCase('testLimitValue0005', async (): Promise<void> => {
                const info: ColorSpaceInfo = LIMIT_COLOR_SPACES[4];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`LimBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testLimitValue0005: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testLimitValue0005: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testLimitValue0005: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testLimitValue0005: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testLimitValue0005: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0306
         * @tc.name: testLimitValue0006
         * @tc.desc: Verify the BT601_SMPTE_Limit button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testLimitValue0006', 0, async (done: Function) => {
            await runCase('testLimitValue0006', async (): Promise<void> => {
                const info: ColorSpaceInfo = LIMIT_COLOR_SPACES[5];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`LimBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testLimitValue0006: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testLimitValue0006: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testLimitValue0006: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testLimitValue0006: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testLimitValue0006: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0307
         * @tc.name: testLimitValue0007
         * @tc.desc: Verify the BT2020_HLG_Limit button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testLimitValue0007', 0, async (done: Function) => {
            await runCase('testLimitValue0007', async (): Promise<void> => {
                const info: ColorSpaceInfo = LIMIT_COLOR_SPACES[6];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`LimBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testLimitValue0007: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testLimitValue0007: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testLimitValue0007: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testLimitValue0007: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testLimitValue0007: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0308
         * @tc.name: testLimitValue0008
         * @tc.desc: Verify the BT2020_PQ_Limit button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testLimitValue0008', 0, async (done: Function) => {
            await runCase('testLimitValue0008', async (): Promise<void> => {
                const info: ColorSpaceInfo = LIMIT_COLOR_SPACES[7];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`LimBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testLimitValue0008: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testLimitValue0008: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testLimitValue0008: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testLimitValue0008: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testLimitValue0008: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0309
         * @tc.name: testLimitValue0009
         * @tc.desc: Verify the P3_HLG_Limit button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testLimitValue0009', 0, async (done: Function) => {
            await runCase('testLimitValue0009', async (): Promise<void> => {
                const info: ColorSpaceInfo = LIMIT_COLOR_SPACES[8];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`LimBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testLimitValue0009: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testLimitValue0009: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testLimitValue0009: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testLimitValue0009: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testLimitValue0009: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0310
         * @tc.name: testLimitValue0010
         * @tc.desc: Verify the P3_PQ_Limit button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testLimitValue0010', 0, async (done: Function) => {
            await runCase('testLimitValue0010', async (): Promise<void> => {
                const info: ColorSpaceInfo = LIMIT_COLOR_SPACES[9];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`LimBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testLimitValue0010: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testLimitValue0010: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testLimitValue0010: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testLimitValue0010: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testLimitValue0010: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_VALUE_0311
         * @tc.name: testLimitValue0011
         * @tc.desc: Verify the Linear_P3 button renders the platform name, white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testLimitValue0011', 0, async (done: Function) => {
            await runCase('testLimitValue0011', async (): Promise<void> => {
                const info: ColorSpaceInfo = LIMIT_COLOR_SPACES[10];
                const facts: ColorSpaceFacts = factsOf(info.enumValue);
                await clickScrolledId(`LimBtn_${info.label}`);
                await scrollPageToTop();
                const shown: string = await textOfId('StdColorSpaceInfo');
                await addLog(`testLimitValue0011: actual=${shown}, expected type=${info.label}`);
                expect(shown.includes(`Type: ${info.label}`)).assertTrue();
                await addLog(`testLimitValue0011: actual name line, expected=${platformName(info)}`);
                expect(shown.includes(`ColorSpaceName: ${platformName(info)}`)).assertTrue();
                await addLog(`testLimitValue0011: actual white point line, expected=${facts.whitePoint}`);
                expect(shown.includes(`WhitePoint: ${facts.whitePoint}`)).assertTrue();
                await addLog(`testLimitValue0011: actual gamma=${numberAfter(shown, 'Gamma: ')}, ` +
                  `expected=${facts.gamma}`);
                expect(isCloseTo(numberAfter(shown, 'Gamma: '), facts.gamma, 0.001)).assertTrue();
                await addLog(`testLimitValue0011: result text is not an error for ${info.label}`);
                expect(shown.includes('Error:')).assertFalse();
            }, done);
        });
    });
}
