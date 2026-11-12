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
    startApp, runCase, addLog, waitId, clickId, textOfId, resetToIndex,
    clickScrolledId, waitTextContains, pressBack, matchesLocalizedText,
    standardInfoText, channelResultText, factsOf, verdict, overallText, numberAfter, isCloseTo
} from '../testkit/SharedDriver';

export default function navigationFlowTest(): void {
    describe('NavigationFlowTest', () => {
        beforeAll(async () => {
            await addLog('NavigationFlowTest suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
        });

        // ==================== 四页完整用户旅程（1 条） ====================

        /*
         * @tc.number: SUB_CS_NAV_FLOW_0100
         * @tc.name: testNavigationUserJourney0001
         * @tc.desc: Complete key operations on all four pages and return to index after each operation.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testNavigationUserJourney0001', 0, async (done: Function) => {
            await runCase('testNavigationUserJourney0001', async (): Promise<void> => {
                await clickId('NavStandard');
                await clickId('Btn_SRGB');
                const standardInfo: string = await waitTextContains('StdColorSpaceInfo', 'Type: SRGB');
                const expectedStandard: string =
                    standardInfoText('SRGB', 'SRGB', colorSpaceManager.ColorSpace.SRGB);
                await addLog(`testNavigationUserJourney0001: actual=${standardInfo}, expected=${expectedStandard}`);
                expect(standardInfo).assertEqual(expectedStandard);
                await clickId('StdBtnBack');
                await waitId('TitleText');

                await clickId('NavCustom');
                await clickScrolledId('BtnCreateCustom');
                const customInfo: string = await waitTextContains('CustomColorSpaceInfo', 'Type: Custom');
                const expectedCustom: string = 'Type: Custom\nColorSpaceName: Custom\n' +
                    'WhitePoint: [0.3127, 0.3290]\nGamma: 2.2\n' +
                    'Primaries: R(0.64,0.33) G(0.3,0.6) B(0.15,0.06)\n' +
                    'WhitePoint Input: (0.3127,0.329)';
                await addLog(`testNavigationUserJourney0001: actual=${customInfo}, expected=${expectedCustom}`);
                expect(customInfo).assertContain('Type: Custom\nColorSpaceName: Custom\nWhitePoint: [0.3127, 0.3290]');
                await addLog(`testNavigationUserJourney0001: actual gamma=${numberAfter(customInfo, 'Gamma: ')}, ` +
                  `expected=2.2`);
                expect(isCloseTo(numberAfter(customInfo, 'Gamma: '), 2.2, 0.001)).assertTrue();
                await addLog(`testNavigationUserJourney0001: actual=${customInfo}, ` +
                  `expected default primaries and white point input`);
                expect(customInfo).assertContain('Primaries: R(0.64,0.33) G(0.3,0.6) B(0.15,0.06)\nWhitePoint Input: ' +
                  '(0.3127,0.329)');
                await clickScrolledId('CustomBtnBack');
                await waitId('TitleText');

                await clickId('NavConcurrency');
                await clickScrolledId('ConBtnTaskPoolRead');
                const taskResult: string = await waitTextContains('ConTaskPoolResult', '[TaskPool] name=SRGB');
                const expectedTask: string =
                    channelResultText('TaskPool', 'SRGB', colorSpaceManager.ColorSpace.SRGB);
                await addLog(`testNavigationUserJourney0001: actual=${taskResult}, expected=${expectedTask}`);
                expect(taskResult).assertEqual(expectedTask);
                await clickScrolledId('ConBtnBack');
                await waitId('TitleText');

                await clickId('NavException');
                await clickScrolledId('BtnVerifySrgb');
                const verifyResult: string = await waitTextContains('ErrorResult', 'SRGB Property Verification:');
                const srgbGamma: number = factsOf(colorSpaceManager.ColorSpace.SRGB).gamma;
                const gammaVerdict: string = verdict(srgbGamma, 2.2);
                await addLog(`testNavigationUserJourney0001: actual=${verifyResult}, expected SRGB property header`);
                expect(verifyResult).assertContain('SRGB Property Verification:');
                await addLog(`testNavigationUserJourney0001: actual=${verifyResult}, expected gamma ${srgbGamma}`);
                expect(verifyResult).assertContain(`Gamma: ${srgbGamma} (expect 2.2) [${gammaVerdict}]`);
                await addLog(`testNavigationUserJourney0001: actual=${verifyResult}, ` +
                  `expected=registered gamma verdict`);
                expect(verifyResult).assertContain(overallText(srgbGamma, 2.2));
                await clickScrolledId('ExcBtnBack');
                await waitId('TitleText');
                const finalTitle: string = await textOfId('TitleText');
                const finalSubtitle: string = await textOfId('SubtitleText');
                await addLog(`testNavigationUserJourney0001: actual=${finalTitle}, ` +
                  `expected=SendableColorSpace or 可共享色彩管理`);
                expect(matchesLocalizedText(finalTitle, 'SendableColorSpace', '可共享色彩管理')).assertTrue();
                await addLog(`testNavigationUserJourney0001: actual=${finalSubtitle}, ` +
                  `expected English or Chinese sample subtitle`);
                expect(matchesLocalizedText(finalSubtitle, 'Sendable Color Space Management Sample',
                  'Sendable 色域管理示例工程')).assertTrue();
            }, done);
        });

        // ==================== 系统返回行为（1 条） ====================

        /*
         * @tc.number: SUB_CS_NAV_FLOW_0200
         * @tc.name: testNavigationSystemBack0001
         * @tc.desc: Use the system back action to return from a sub-page to intact index content.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNavigationSystemBack0001', 0, async (done: Function) => {
            await runCase('testNavigationSystemBack0001', async (): Promise<void> => {
                await clickId('NavCustom');
                const pageTitle: string = await textOfId('CustomPageTitle');
                await pressBack();
                await waitId('TitleText');
                const indexTitle: string = await textOfId('TitleText');
                const subtitle: string = await textOfId('SubtitleText');
                const customButton: string = await textOfId('NavCustom');
                await addLog(`testNavigationSystemBack0001: actual=${pageTitle}, expected=Custom Color Space`);
                expect(pageTitle).assertEqual('Custom Color Space');
                await addLog(`testNavigationSystemBack0001: actual=${indexTitle}, ` +
                  `expected=SendableColorSpace or 可共享色彩管理`);
                expect(matchesLocalizedText(indexTitle, 'SendableColorSpace', '可共享色彩管理')).assertTrue();
                await addLog(`testNavigationSystemBack0001: actual=${subtitle}, ` +
                  `expected English or Chinese sample subtitle`);
                expect(matchesLocalizedText(subtitle, 'Sendable Color Space Management Sample',
                  'Sendable 色域管理示例工程')).assertTrue();
                await addLog(`testNavigationSystemBack0001: actual=${customButton}, ` +
                  `expected=Custom Color Space or 自定义色域`);
                expect(matchesLocalizedText(customButton, 'Custom Color Space', '自定义色域')).assertTrue();
            }, done);
        });
    });
}
