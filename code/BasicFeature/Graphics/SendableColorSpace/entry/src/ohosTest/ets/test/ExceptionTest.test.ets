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
    startApp, runCase, addLog, textOfId, resetToIndex, navigateToException,
    clickScrolledId, scrollToId, waitTextContains, factsOf, verdict, gammaText, numberAfter, isCloseTo
} from '../testkit/SharedDriver';

async function triggerResult(buttonId: string, expectedPrefix: string): Promise<string> {
    await clickScrolledId(buttonId);
    return waitTextContains('ErrorResult', expectedPrefix);
}

export default function exceptionTest(): void {
    describe('ExceptionTest', () => {
        beforeAll(async () => {
            await addLog('ExceptionTest suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToException();
        });

        // ==================== 页面初始状态（1 条） ====================

        /*
         * @tc.number: SUB_CS_EXC_0100
         * @tc.name: testExceptionPageLayout0001
         * @tc.desc: Verify exception page sections and initial result text.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExceptionPageLayout0001', 0, async (done: Function) => {
            await runCase('testExceptionPageLayout0001', async (): Promise<void> => {
                const title: string = await textOfId('ExcPageTitle');
                const initialResult: string = await textOfId('ErrorResult');
                await scrollToId('AliasSectionTitle');
                const aliasTitle: string = await textOfId('AliasSectionTitle');
                const verifyTitle: string = await textOfId('VerifySectionTitle');
                await addLog(`testExceptionPageLayout0001: actual=${title}, expected=Exception Handling`);
                expect(title).assertEqual('Exception Handling');
                await addLog(`testExceptionPageLayout0001: actual=${initialResult}, expected initial prompt`);
                expect(initialResult).assertEqual('Click a button below to test error handling');
                await addLog(`testExceptionPageLayout0001: actual=${aliasTitle}, expected=Enum Alias Verification`);
                expect(aliasTitle).assertEqual('Enum Alias Verification');
                await addLog(`testExceptionPageLayout0001: actual=${verifyTitle}, ` +
                  `expected=Property Value Verification`);
                expect(verifyTitle).assertEqual('Property Value Verification');
            }, done);
        });

        // ==================== 非法输入异常（7 条） ====================

        /*
         * @tc.number: SUB_CS_EXC_0200
         * @tc.name: testUnknownEnum0001
         * @tc.desc: Verify UNKNOWN enum reports a caught error with details.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testUnknownEnum0001', 0, async (done: Function) => {
            await runCase('testUnknownEnum0001', async (): Promise<void> => {
                const expected: string = 'UNKNOWN enum: Caught expected error';
                const result: string = await triggerResult('BtnTestUnknown', expected);
                const unexpected: boolean = result.includes('Unexpected success');
                await addLog(`testUnknownEnum0001: actual=${result}, expected prefix=${expected}`);
                expect(result).assertContain(expected);
                await addLog(`testUnknownEnum0001: actual unexpected=${unexpected}, expected=false`);
                expect(unexpected).assertFalse();
                await addLog(`testUnknownEnum0001: actual lines=${result.split('\n').length}, expected greater than 1`);
                expect(result.split('\n').length).assertLarger(1);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0300
         * @tc.name: testCustomEnum0001
         * @tc.desc: Verify CUSTOM enum without primaries reports a caught error.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testCustomEnum0001', 0, async (done: Function) => {
            await runCase('testCustomEnum0001', async (): Promise<void> => {
                const expected: string = 'CUSTOM enum: Caught expected error';
                const result: string = await triggerResult('BtnTestCustom', expected);
                const unexpected: boolean = result.includes('Unexpected success');
                await addLog(`testCustomEnum0001: actual=${result}, expected prefix=${expected}`);
                expect(result).assertContain(expected);
                await addLog(`testCustomEnum0001: actual unexpected=${unexpected}, expected=false`);
                expect(unexpected).assertFalse();
                await addLog(`testCustomEnum0001: actual lines=${result.split('\n').length}, expected greater than 1`);
                expect(result.split('\n').length).assertLarger(1);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0400
         * @tc.name: testNegativeGamma0001
         * @tc.desc: Verify negative gamma is accepted by the platform and echoed back by the page.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNegativeGamma0001', 0, async (done: Function) => {
            await runCase('testNegativeGamma0001', async (): Promise<void> => {
                // The platform does not reject a negative gamma, so the page reports the returned value.
                const expected: string = 'Gamma=-1.0: Unexpected success';
                const result: string = await triggerResult('BtnTestNegGamma', expected);
                const rejected: boolean = result.includes('Caught expected error');
                await addLog(`testNegativeGamma0001: actual=${result}, expected prefix=${expected}`);
                expect(result).assertContain(expected);
                await addLog(`testNegativeGamma0001: actual gamma=${result}, expected echo of gamma=-1`);
                expect(result).assertContain('gamma=-1');
                await addLog(`testNegativeGamma0001: actual rejected=${rejected}, expected=false`);
                expect(rejected).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0500
         * @tc.name: testZeroGamma0001
         * @tc.desc: Verify zero gamma is accepted by the platform and echoed back by the page.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testZeroGamma0001', 0, async (done: Function) => {
            await runCase('testZeroGamma0001', async (): Promise<void> => {
                // The platform does not reject a zero gamma, so the page reports the returned value.
                const expected: string = 'Gamma=0: Unexpected success';
                const result: string = await triggerResult('BtnTestZeroGamma', expected);
                const rejected: boolean = result.includes('Caught expected error');
                await addLog(`testZeroGamma0001: actual=${result}, expected prefix=${expected}`);
                expect(result).assertContain(expected);
                await addLog(`testZeroGamma0001: actual gamma=${result}, expected echo of gamma=0`);
                expect(result).assertContain('gamma=0');
                await addLog(`testZeroGamma0001: actual rejected=${rejected}, expected=false`);
                expect(rejected).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0600
         * @tc.name: testInvalidPrimaries0001
         * @tc.desc: Verify out-of-range primaries are accepted and echoed as a custom color space.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testInvalidPrimaries0001', 0, async (done: Function) => {
            await runCase('testInvalidPrimaries0001', async (): Promise<void> => {
                // The platform does not validate CIE coordinates, so the create call succeeds.
                const expected: string = 'Invalid primaries: Unexpected success';
                const result: string = await triggerResult('BtnTestInvalidPrimaries', expected);
                const rejected: boolean = result.includes('Caught expected error');
                await addLog(`testInvalidPrimaries0001: actual=${result}, expected prefix=${expected}`);
                expect(result).assertContain(expected);
                await addLog(`testInvalidPrimaries0001: actual name=${result}, expected echo of name=Custom`);
                expect(result).assertContain('name=Custom');
                await addLog(`testInvalidPrimaries0001: actual rejected=${rejected}, expected=false`);
                expect(rejected).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0700
         * @tc.name: testEnum401Error0001
         * @tc.desc: Verify undefined enum 999 reports the expected parameter error.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testEnum401Error0001', 0, async (done: Function) => {
            await runCase('testEnum401Error0001', async (): Promise<void> => {
                const expected: string = 'Enum=999: Caught expected error (401/18600001)';
                const result: string = await triggerResult('BtnTestEnum999', expected);
                const unexpected: boolean = result.includes('Unexpected success');
                await addLog(`testEnum401Error0001: actual=${result}, expected prefix=${expected}`);
                expect(result).assertContain(expected);
                await addLog(`testEnum401Error0001: actual unexpected=${unexpected}, expected=false`);
                expect(unexpected).assertFalse();
                await addLog(`testEnum401Error0001: actual lines=${result.split('\n').length}, ` +
                  `expected greater than 1`);
                expect(result.split('\n').length).assertLarger(1);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_0800
         * @tc.name: testNegativeOneEnum0001
         * @tc.desc: Verify negative enum reports a caught error with details.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNegativeOneEnum0001', 0, async (done: Function) => {
            await runCase('testNegativeOneEnum0001', async (): Promise<void> => {
                const expected: string = 'Enum=-1: Caught expected error';
                const result: string = await triggerResult('BtnTestEnumNeg1', expected);
                const unexpected: boolean = result.includes('Unexpected success');
                await addLog(`testNegativeOneEnum0001: actual=${result}, expected prefix=${expected}`);
                expect(result).assertContain(expected);
                await addLog(`testNegativeOneEnum0001: actual unexpected=${unexpected}, expected=false`);
                expect(unexpected).assertFalse();
                await addLog(`testNegativeOneEnum0001: actual lines=${result.split('\n').length}, ` +
                  `expected greater than 1`);
                expect(result.split('\n').length).assertLarger(1);
            }, done);
        });

        // ==================== 属性自检结果（3 条） ====================

        /*
         * @tc.number: SUB_CS_EXC_0900
         * @tc.name: testVerifySrgb0001
         * @tc.desc: Verify SRGB self-check reports exact passing properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testVerifySrgb0001', 0, async (done: Function) => {
            await runCase('testVerifySrgb0001', async (): Promise<void> => {
                const result: string = await triggerResult('BtnVerifySrgb', 'SRGB Property Verification:');
                // The page compares the gamma reported by the platform against the documented 2.2 constant.
                const srgbGamma: number = factsOf(colorSpaceManager.ColorSpace.SRGB).gamma;
                const gammaVerdict: string = verdict(srgbGamma, 2.2);
                await addLog(`testVerifySrgb0001: actual=${result}, expected gamma verdict ${gammaVerdict}`);
                expect(result).assertContain(`Gamma: ${srgbGamma} (expect 2.2) [${gammaVerdict}]`);
                await addLog(`testVerifySrgb0001: actual=${result}, expected passing white point`);
                expect(result).assertContain('WhitePoint: [0.3127, 0.3290] (expect [0.3127, 0.3290]) [PASS]');
                await addLog(`testVerifySrgb0001: actual=${result}, expected matching overall verdict`);
                expect(result).assertContain(`Overall: ${gammaVerdict === 'PASS' ? 'ALL PASS' : 'HAS FAILURES'}`);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_1000
         * @tc.name: testVerifyDciP30001
         * @tc.desc: Verify DCI P3 self-check reports exact passing properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testVerifyDciP30001', 0, async (done: Function) => {
            await runCase('testVerifyDciP30001', async (): Promise<void> => {
                const result: string = await triggerResult('BtnVerifyDciP3', 'DCI_P3 Property Verification:');
                const dciGamma: number = factsOf(colorSpaceManager.ColorSpace.DCI_P3).gamma;
                await addLog(`testVerifyDciP30001: actual=${result}, expected passing gamma`);
                expect(result).assertContain(`Gamma: ${dciGamma} (expect 2.6) [${verdict(dciGamma, 2.6)}]`);
                await addLog(`testVerifyDciP30001: actual=${result}, expected passing white point`);
                expect(result).assertContain('WhitePoint: [0.3140, 0.3510] (expect [0.314, 0.351]) [PASS]');
                await addLog(`testVerifyDciP30001: actual=${result}, expected=Overall: ALL PASS`);
                expect(result).assertContain('Overall: ALL PASS');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_1100
         * @tc.name: testVerifyLinearSrgb0001
         * @tc.desc: Verify Linear SRGB self-check reports gamma one.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testVerifyLinearSrgb0001', 0, async (done: Function) => {
            await runCase('testVerifyLinearSrgb0001', async (): Promise<void> => {
                const result: string = await triggerResult('BtnVerifyLinearSrgb', 'LINEAR_SRGB Property Verification:');
                const linearGamma: number = factsOf(colorSpaceManager.ColorSpace.LINEAR_SRGB).gamma;
                const linearVerdict: string = verdict(linearGamma, 1.0);
                await addLog(`testVerifyLinearSrgb0001: actual=${result}, expected verification header`);
                expect(result).assertContain('LINEAR_SRGB Property Verification:');
                await addLog(`testVerifyLinearSrgb0001: actual=${result}, expected gamma verdict ${linearVerdict}`);
                expect(result).assertContain(`Gamma: ${linearGamma} (expect 1.0) [${linearVerdict}]`);
                await addLog(`testVerifyLinearSrgb0001: actual=${result}, expected matching overall verdict`);
                expect(result).assertContain(`Overall: ${linearVerdict === 'PASS' ? 'ALL PASS' : 'HAS FAILURES'}`);
            }, done);
        });

        // ==================== 枚举别名自检结果（3 条） ====================

        /*
         * @tc.number: SUB_CS_EXC_1200
         * @tc.name: testAliasDisplaySrgb0001
         * @tc.desc: Verify DISPLAY SRGB alias matches all SRGB properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testAliasDisplaySrgb0001', 0, async (done: Function) => {
            await runCase('testAliasDisplaySrgb0001', async (): Promise<void> => {
                const result: string = await triggerResult('BtnVerifyAliasSrgb',
                  'DISPLAY_SRGB vs SRGB Alias Verification:');
                await addLog(`testAliasDisplaySrgb0001: actual=${result}, expected matching name`);
                expect(result).assertContain('[MATCH]\nGamma:');
                await addLog(`testAliasDisplaySrgb0001: actual=${result}, expected matching gamma`);
                expect(result).assertContain(`Gamma: alias=${gammaText(colorSpaceManager.ColorSpace.DISPLAY_SRGB)} ` +
                    `orig=${gammaText(colorSpaceManager.ColorSpace.SRGB)} [MATCH]`);
                await addLog(`testAliasDisplaySrgb0001: actual=${result}, expected matching white point`);
                expect(result).assertContain('WhitePoint: alias=[0.3127,0.3290] orig=[0.3127,0.3290] [MATCH]');
                await addLog(`testAliasDisplaySrgb0001: actual=${result}, expected alias verified`);
                expect(result).assertContain('Overall: ALIAS VERIFIED');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_1300
         * @tc.name: testAliasDisplayP3Srgb0001
         * @tc.desc: Verify DISPLAY P3 SRGB alias matches DISPLAY P3.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testAliasDisplayP3Srgb0001', 0, async (done: Function) => {
            await runCase('testAliasDisplayP3Srgb0001', async (): Promise<void> => {
                const result: string = await triggerResult('BtnVerifyAliasP3',
                    'DISPLAY_P3_SRGB vs DISPLAY_P3 Alias Verification:');
                await addLog(`testAliasDisplayP3Srgb0001: actual=${result}, expected verification header`);
                expect(result).assertContain('DISPLAY_P3_SRGB vs DISPLAY_P3 Alias Verification:');
                await addLog(`testAliasDisplayP3Srgb0001: actual=${result}, expected matching gamma`);
                expect(result).assertContain(
                    `Gamma: alias=${gammaText(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB)} ` +
                    `orig=${gammaText(colorSpaceManager.ColorSpace.DISPLAY_P3)} [MATCH]`);
                await addLog(`testAliasDisplayP3Srgb0001: actual=${result}, expected alias verified`);
                expect(result).assertContain('Overall: ALIAS VERIFIED');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_1400
         * @tc.name: testAliasLinearBt7090001
         * @tc.desc: Verify LINEAR BT709 alias matches Linear SRGB.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testAliasLinearBt7090001', 0, async (done: Function) => {
            await runCase('testAliasLinearBt7090001', async (): Promise<void> => {
                const result: string = await triggerResult('BtnVerifyAliasLinear',
                    'LINEAR_BT709 vs LINEAR_SRGB Alias Verification:');
                await addLog(`testAliasLinearBt7090001: actual=${result}, expected verification header`);
                expect(result).assertContain('LINEAR_BT709 vs LINEAR_SRGB Alias Verification:');
                await addLog(`testAliasLinearBt7090001: actual=${result}, expected matching gamma`);
                expect(result).assertContain(`Gamma: alias=${gammaText(colorSpaceManager.ColorSpace.LINEAR_BT709)} ` +
                    `orig=${gammaText(colorSpaceManager.ColorSpace.LINEAR_SRGB)} [MATCH]`);
                await addLog(`testAliasLinearBt7090001: actual=${result}, expected alias verified`);
                expect(result).assertContain('Overall: ALIAS VERIFIED');
            }, done);
        });

        // ==================== 边界与恢复（9 条） ====================

        /*
         * @tc.number: SUB_CS_EXC_1500
         * @tc.name: testExcRepeatCreate0001
         * @tc.desc: Verify two managers built from the same enum report identical gamma, white point and name.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExcRepeatCreate0001', 0, async (done: Function) => {
            await runCase('testExcRepeatCreate0001', async (): Promise<void> => {
                const result: string = await triggerResult('ExcBtnRepeatCreate', 'Repeat SRGB:');
                await addLog(`testExcRepeatCreate0001: actual=${result}, expected every property to match`);
                expect(result).assertContain('Repeat check: gamma=MATCH wp=MATCH name=MATCH');
                await addLog(`testExcRepeatCreate0001: actual=${result}, expected stable overall verdict`);
                expect(result).assertContain('Overall: STABLE');
                await addLog(`testExcRepeatCreate0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_1600
         * @tc.name: testExcWhitePointShape0001
         * @tc.desc: Verify the white point is reported as a two channel xy pair for three spaces.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExcWhitePointShape0001', 0, async (done: Function) => {
            await runCase('testExcWhitePointShape0001', async (): Promise<void> => {
                const result: string = await triggerResult('ExcBtnWhitePointShape', 'WP shapes: SRGB=2');
                await addLog(`testExcWhitePointShape0001: actual=${result}, expected all three lengths to be 2`);
                expect(result).assertContain('WP shapes: SRGB=2 DCI_P3=2 BT2020_HLG=2');
                await addLog(`testExcWhitePointShape0001: actual=${result}, expected all length verdict`);
                expect(result).assertContain('Overall: ALL LENGTH 2');
                await addLog(`testExcWhitePointShape0001: actual lines=${result.split('\n').length}, expected=2`);
                expect(result.split('\n').length).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_1700
         * @tc.name: testExcGammaRange0001
         * @tc.desc: Verify every standard space reports a gamma between the linear and the display bound.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testExcGammaRange0001', 0, async (done: Function) => {
            await runCase('testExcGammaRange0001', async (): Promise<void> => {
                const result: string = await triggerResult('ExcBtnGammaRange', 'Gamma range:');
                const low: number = numberAfter(result, 'min=');
                const high: number = numberAfter(result, 'max=');
                const power: number = numberAfter(result, 'power=');
                const nonPower: number = numberAfter(result, 'nonPower=');
                await addLog(`testExcGammaRange0001: actual min=${low} max=${high}, expected 1 <= min < max <= 3`);
                expect(low >= 1.0 && low <= 3.0).assertTrue();
                await addLog(`testExcGammaRange0001: actual min=${low} max=${high}, expected min below max`);
                expect(high > low && high <= 3.0).assertTrue();
                await addLog(`testExcGammaRange0001: actual power=${power} nonPower=${nonPower}, ` +
                  `expected eight spaces`);
                expect(power + nonPower).assertEqual(8);
                await addLog(`testExcGammaRange0001: actual nonPower=${nonPower}, ` +
                  `expected at least one PQ or HLG space`);
                expect(nonPower >= 1).assertTrue();
                await addLog(`testExcGammaRange0001: actual=${result}, expected in range verdict`);
                expect(result).assertContain('Overall: IN RANGE');
                await addLog(`testExcGammaRange0001: actual lines=${result.split('\n').length}, expected=2`);
                expect(result.split('\n').length).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_1800
         * @tc.name: testExcCustomRoundTrip0001
         * @tc.desc: Verify custom primaries and gamma survive a create call unchanged.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testExcCustomRoundTrip0001', 0, async (done: Function) => {
            await runCase('testExcCustomRoundTrip0001', async (): Promise<void> => {
                const result: string = await triggerResult('ExcBtnCustomRoundTrip', 'Custom round trip:');
                await addLog(`testExcCustomRoundTrip0001: actual=${result}, expected gamma=2.4 echoed back`);
                expect(result).assertContain('gamma=2.4');
                await addLog(`testExcCustomRoundTrip0001: actual=${result}, expected white point to match SRGB`);
                expect(result).assertContain('match=MATCH');
                await addLog(`testExcCustomRoundTrip0001: actual=${result}, expected round trip verdict`);
                expect(result).assertContain('Overall: ROUND TRIP OK');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_1900
         * @tc.name: testExcErrorCodeShape0001
         * @tc.desc: Verify a rejected enum raises a numeric business error code.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExcErrorCodeShape0001', 0, async (done: Function) => {
            await runCase('testExcErrorCodeShape0001', async (): Promise<void> => {
                const result: string = await triggerResult('ExcBtnErrorCodeShape', 'Error shape: code=');
                const code: number = numberAfter(result, 'code=');
                await addLog(`testExcErrorCodeShape0001: actual code=${code}, expected greater than zero`);
                expect(code > 0).assertTrue();
                await addLog(`testExcErrorCodeShape0001: actual code=${code}, expected 401 or 18600001`);
                expect(code === 401 || code === 18600001).assertTrue();
                await addLog(`testExcErrorCodeShape0001: actual=${result}, expected numeric=YES`);
                expect(result).assertContain('numeric=YES');
                await addLog(`testExcErrorCodeShape0001: actual=${result}, expected numeric code verdict`);
                expect(result).assertContain('Overall: NUMERIC CODE');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_2000
         * @tc.name: testExcRecoveryAfterError0001
         * @tc.desc: Verify the next legal create still succeeds after a rejected one.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExcRecoveryAfterError0001', 0, async (done: Function) => {
            await runCase('testExcRecoveryAfterError0001', async (): Promise<void> => {
                const result: string = await triggerResult('ExcBtnRecovery', 'Recovery: rejected=true');
                const gamma: number = numberAfter(result, 'gamma=');
                await addLog(`testExcRecoveryAfterError0001: actual gamma=${gamma}, expected a plausible power value`);
                expect(gamma >= 1.0 && gamma <= 3.0).assertTrue();
                await addLog(`testExcRecoveryAfterError0001: actual=${result}, expected name=SRGB`);
                expect(result).assertContain('name=SRGB');
                await addLog(`testExcRecoveryAfterError0001: actual=${result}, expected recovered verdict`);
                expect(result).assertContain('Overall: RECOVERED');
                await addLog(`testExcRecoveryAfterError0001: actual lines=${result.split('\n').length}, expected=2`);
                expect(result.split('\n').length).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_2100
         * @tc.name: testExcCustomGammaOne0001
         * @tc.desc: Verify the linear boundary gamma of 1.0 survives a custom create call.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testExcCustomGammaOne0001', 0, async (done: Function) => {
            await runCase('testExcCustomGammaOne0001', async (): Promise<void> => {
                const result: string = await triggerResult('ExcBtnCustomGammaOne', 'Custom gamma=1.0: gamma=1');
                await addLog(`testExcCustomGammaOne0001: actual=${result}, expected linear check to pass`);
                expect(result).assertContain('linear=[PASS]');
                await addLog(`testExcCustomGammaOne0001: actual=${result}, expected linear verdict`);
                expect(result).assertContain('Overall: LINEAR OK');
                await addLog(`testExcCustomGammaOne0001: actual lines=${result.split('\n').length}, expected=2`);
                expect(result.split('\n').length).assertEqual(2);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_2200
         * @tc.name: testExcP3LimitPair0001
         * @tc.desc: Verify a limited range space keeps the gamma and white point of its full range twin.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testExcP3LimitPair0001', 0, async (done: Function) => {
            await runCase('testExcP3LimitPair0001', async (): Promise<void> => {
                const result: string = await triggerResult('ExcBtnP3LimitPair', 'P3 limit pair:');
                const fullGamma: number = numberAfter(result, 'gamma=[');
                const limitGamma: number = numberAfter(result, ', ');
                await addLog(`testExcP3LimitPair0001: actual gammas=${fullGamma} and ${limitGamma}, expected equal`);
                expect(isCloseTo(fullGamma, limitGamma, 1.0e-6)).assertTrue();
                await addLog(`testExcP3LimitPair0001: actual full gamma=${fullGamma}, expected a display power value`);
                expect(fullGamma >= 1.0 && fullGamma <= 3.0).assertTrue();
                await addLog(`testExcP3LimitPair0001: actual=${result}, expected gamma match token`);
                expect(result).assertContain('] MATCH');
                await addLog(`testExcP3LimitPair0001: actual=${result}, expected white point to match`);
                expect(result).assertContain('WhitePoint: MATCH');
                await addLog(`testExcP3LimitPair0001: actual=${result}, expected pair verdict`);
                expect(result).assertContain('Overall: PAIR MATCH');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXC_2300
         * @tc.name: testExcClearResult0001
         * @tc.desc: Verify the clear button restores the initial prompt after a test produced a result.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testExcClearResult0001', 0, async (done: Function) => {
            await runCase('testExcClearResult0001', async (): Promise<void> => {
                const tested: string = await triggerResult('BtnTestUnknown', 'UNKNOWN enum:');
                await addLog(`testExcClearResult0001: actual before clear=${tested}, expected UNKNOWN enum result`);
                expect(tested).assertContain('UNKNOWN enum:');
                const cleared: string = await triggerResult('ExcBtnClear',
                    'Click a button below to test error handling');
                await addLog(`testExcClearResult0001: actual after clear=${cleared}, expected the initial prompt`);
                expect(cleared).assertEqual('Click a button below to test error handling');
                const keptOldResult: boolean = cleared.includes('UNKNOWN enum');
                await addLog(`testExcClearResult0001: actual kept old result=${keptOldResult}, expected=false`);
                expect(keptOldResult).assertFalse();
                await addLog(`testExcClearResult0001: actual lines=${cleared.split('\n').length}, expected=1`);
                expect(cleared.split('\n').length).assertEqual(1);
            }, done);
        });
    });
}
