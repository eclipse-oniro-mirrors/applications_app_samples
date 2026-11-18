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
    startApp, runCase, addLog, resetToIndex, navigateToException, clickScrolledId, waitTextContains,
    factsOf, overallText
} from '../testkit/SharedDriver';

async function triggerResult(buttonId: string, expectedPrefix: string): Promise<string> {
    await clickScrolledId(buttonId);
    return waitTextContains('ErrorResult', expectedPrefix);
}

export default function exceptionButtonTest(): void {
    describe('ExceptionButtonTest', () => {
        beforeAll(async () => {
            await addLog('ExceptionButtonTest suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToException();
        });

        /*
         * @tc.number: SUB_CS_EXCB_0100
         * @tc.name: testExceptionButtonSequence0001
         * @tc.desc: Verify each consecutive exception replaces the previous result.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testExceptionButtonSequence0001', 0, async (done: Function) => {
            await runCase('testExceptionButtonSequence0001', async (): Promise<void> => {
                const unknownResult: string = await triggerResult('BtnTestUnknown', 'UNKNOWN enum:');
                const invalidResult: string = await triggerResult('BtnTestInvalidPrimaries', 'Invalid primaries:');
                const customResult: string = await triggerResult('BtnTestCustom', 'CUSTOM enum:');
                await addLog(`testExceptionButtonSequence0001: actual=${unknownResult}, expected UNKNOWN error`);
                expect(unknownResult).assertContain('UNKNOWN enum: Caught expected error');
                await addLog(`testExceptionButtonSequence0001: actual=${invalidResult}, expected platform acceptance`);
                expect(invalidResult).assertContain('Invalid primaries: Unexpected success');
                await addLog(`testExceptionButtonSequence0001: actual=${invalidResult}, ` +
                  `expected the custom name is echoed`);
                expect(invalidResult).assertContain('name=Custom');
                await addLog(`testExceptionButtonSequence0001: actual=${customResult}, expected CUSTOM error`);
                expect(customResult).assertContain('CUSTOM enum: Caught expected error');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_EXCB_0200
         * @tc.name: testExceptionButtonRecovery0001
         * @tc.desc: Verify a valid property check recovers after an enum error.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testExceptionButtonRecovery0001', 0, async (done: Function) => {
            await runCase('testExceptionButtonRecovery0001', async (): Promise<void> => {
                const errorResult: string = await triggerResult('BtnTestEnum999', 'Enum=999:');
                const recoveryResult: string = await triggerResult('BtnVerifySrgb', 'SRGB Property Verification:');
                const oldErrorRemains: boolean = recoveryResult.includes('Enum=999');
                await addLog(`testExceptionButtonRecovery0001: actual=${errorResult}, expected enum error`);
                expect(errorResult).assertContain('Enum=999: Caught expected error (401/18600001)');
                const expectedOverall: string = overallText(factsOf(colorSpaceManager.ColorSpace.SRGB).gamma, 2.2);
                await addLog(`testExceptionButtonRecovery0001: actual=${recoveryResult}, expected=${expectedOverall}`);
                expect(recoveryResult).assertContain(expectedOverall);
                await addLog(`testExceptionButtonRecovery0001: actual oldError=${oldErrorRemains}, expected=false`);
                expect(oldErrorRemains).assertFalse();
            }, done);
        });
    });
}
