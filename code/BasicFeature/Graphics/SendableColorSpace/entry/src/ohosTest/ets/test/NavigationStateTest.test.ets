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
    navigateToStandard, navigateToException, clickScrolledId, waitTextContains, textOrEmpty,
    standardInfoText, standardTaskPoolText
} from '../testkit/SharedDriver';

export default function navigationStateTest(): void {
    describe('NavigationStateTest', () => {
        beforeAll(async () => {
            await addLog('NavigationStateTest suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
        });

        // ==================== 标准页重进状态重置（1 条） ====================

        /*
         * @tc.number: SUB_CS_NAV_STATE_0100
         * @tc.name: testNavigationStandardReset0001
         * @tc.desc: Verify revisiting standard page clears creation, TaskPool and comparison results.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNavigationStandardReset0001', 0, async (done: Function) => {
            await runCase('testNavigationStandardReset0001', async (): Promise<void> => {
                await navigateToStandard();
                await clickId('Btn_SRGB');
                const createdInfo: string = await waitTextContains('StdColorSpaceInfo', 'Type: SRGB');
                await clickScrolledId('StdBtnTaskPoolRead');
                const taskResult: string = await waitTextContains('StdTaskPoolResult', '[TaskPool] name=SRGB');
                await clickScrolledId('CmpBtn_SRGB');
                await clickScrolledId('BtnDrawCompare');
                const compareResult: string = await waitTextContains('StdCompareResult', 'Comparing: SRGB');
                const expectedInfo: string =
                    standardInfoText('SRGB', 'SRGB', colorSpaceManager.ColorSpace.SRGB);
                const expectedTask: string =
                    standardTaskPoolText('SRGB', colorSpaceManager.ColorSpace.SRGB);
                await addLog(`testNavigationStandardReset0001: actual=${createdInfo}, expected=${expectedInfo}`);
                expect(createdInfo).assertEqual(expectedInfo);
                await addLog(`testNavigationStandardReset0001: actual=${taskResult}, expected=${expectedTask}`);
                expect(taskResult).assertEqual(expectedTask);
                await addLog(`testNavigationStandardReset0001: actual=${compareResult}, expected=Comparing: SRGB`);
                expect(compareResult).assertEqual('Comparing: SRGB');

                await clickScrolledId('StdBtnBack');
                await waitId('TitleText');
                await navigateToStandard();
                // A cleared result has no text, and UiTest does not report an empty Text as visible.
                const resetInfo: string = await textOrEmpty('StdColorSpaceInfo');
                const resetTask: string = await textOrEmpty('StdTaskPoolResult');
                const resetCompare: string = await textOrEmpty('StdCompareResult');
                await addLog(`testNavigationStandardReset0001: actual=${resetInfo}, expected empty revisited info`);
                expect(resetInfo).assertEqual('');
                await addLog(`testNavigationStandardReset0001: actual=${resetTask}, ` +
                  `expected empty revisited TaskPool result`);
                expect(resetTask).assertEqual('');
                await addLog(`testNavigationStandardReset0001: actual=${resetCompare}, ` +
                  `expected empty comparison result`);
                expect(resetCompare).assertEqual('');
            }, done);
        });

        // ==================== 异常页重进状态重置（1 条） ====================

        /*
         * @tc.number: SUB_CS_NAV_STATE_0200
         * @tc.name: testNavigationExceptionReset0001
         * @tc.desc: Verify revisiting exception page replaces an old error with the initial prompt.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNavigationExceptionReset0001', 0, async (done: Function) => {
            await runCase('testNavigationExceptionReset0001', async (): Promise<void> => {
                await navigateToException();
                const expectedError: string = 'UNKNOWN enum: Caught expected error';
                await clickScrolledId('BtnTestUnknown');
                const errorResult: string = await waitTextContains('ErrorResult', expectedError);
                const unexpected: boolean = errorResult.includes('Unexpected success');
                await addLog(`testNavigationExceptionReset0001: actual=${errorResult}, ` +
                  `expected prefix=${expectedError}`);
                expect(errorResult).assertContain(expectedError);
                await addLog(`testNavigationExceptionReset0001: actual unexpected=${unexpected}, expected=false`);
                expect(unexpected).assertFalse();
                await addLog(`testNavigationExceptionReset0001: actual lines=${errorResult.split('\n').length}, ` +
                  `expected greater than 1`);
                expect(errorResult.split('\n').length).assertLarger(1);

                await clickScrolledId('ExcBtnBack');
                await waitId('TitleText');
                await navigateToException();
                const pageTitle: string = await textOfId('ExcPageTitle');
                const resetResult: string = await textOfId('ErrorResult');
                const oldErrorPresent: boolean = resetResult.includes(expectedError);
                await addLog(`testNavigationExceptionReset0001: actual=${pageTitle}, expected=Exception Handling`);
                expect(pageTitle).assertEqual('Exception Handling');
                await addLog(`testNavigationExceptionReset0001: actual=${resetResult}, expected initial prompt`);
                expect(resetResult).assertEqual('Click a button below to test error handling');
                await addLog(`testNavigationExceptionReset0001: actual oldErrorPresent=${oldErrorPresent}, ` +
                  `expected=false`);
                expect(oldErrorPresent).assertFalse();
            }, done);
        });
    });
}
