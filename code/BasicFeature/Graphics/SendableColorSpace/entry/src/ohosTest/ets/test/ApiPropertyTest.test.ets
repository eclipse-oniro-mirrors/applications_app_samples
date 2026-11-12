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
    startApp, runCase, addLog, textOfId, resetToIndex, navigateToConcurrency,
    clickScrolledId, waitTextContains, channelResultText
} from '../testkit/SharedDriver';

async function switchColorSpace(label: string): Promise<void> {
    await clickScrolledId(`BtnSwitch_${label}`);
    await waitTextContains('StatusInfo', `Switched to ${label}`);
}

async function readTaskPool(label: string): Promise<string> {
    await clickScrolledId('ConBtnTaskPoolRead');
    return waitTextContains('ConTaskPoolResult', `[TaskPool] name=${label}`);
}

async function readWorker(label: string): Promise<string> {
    await clickScrolledId('BtnWorkerRead');
    return waitTextContains('WorkerResult', `[Worker] name=${label}`);
}

export default function apiPropertyTest(): void {
    describe('ApiPropertyTest', () => {
        beforeAll(async () => {
            await addLog('ApiPropertyTest suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToConcurrency();
        });

        // ==================== TaskPool 标准色域属性补充（5 条） ====================

        /*
         * @tc.number: SUB_CS_API_0100
         * @tc.name: testApiDisplayP3TaskPool0001
         * @tc.desc: Verify TaskPool returns exact Display P3 properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testApiDisplayP3TaskPool0001', 0, async (done: Function) => {
            await runCase('testApiDisplayP3TaskPool0001', async (): Promise<void> => {
                await switchColorSpace('Display_P3');
                const status: string = await textOfId('StatusInfo');
                const result: string = await readTaskPool('Display_P3');
                const expected: string = channelResultText('TaskPool', 'Display_P3',
                  colorSpaceManager.ColorSpace.DISPLAY_P3);
                await addLog(`testApiDisplayP3TaskPool0001: actual=${status}, expected switched Display_P3`);
                expect(status).assertEqual('Switched to Display_P3 for concurrency tests');
                await addLog(`testApiDisplayP3TaskPool0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testApiDisplayP3TaskPool0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_API_0200
         * @tc.name: testApiBt2020HlgTaskPool0001
         * @tc.desc: Verify TaskPool returns exact BT2020 HLG properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testApiBt2020HlgTaskPool0001', 0, async (done: Function) => {
            await runCase('testApiBt2020HlgTaskPool0001', async (): Promise<void> => {
                await switchColorSpace('BT2020_HLG');
                const status: string = await textOfId('StatusInfo');
                const result: string = await readTaskPool('BT2020_HLG');
                const expected: string = channelResultText('TaskPool', 'BT2020_HLG',
                  colorSpaceManager.ColorSpace.BT2020_HLG);
                await addLog(`testApiBt2020HlgTaskPool0001: actual=${status}, expected switched BT2020_HLG`);
                expect(status).assertEqual('Switched to BT2020_HLG for concurrency tests');
                await addLog(`testApiBt2020HlgTaskPool0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testApiBt2020HlgTaskPool0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_API_0300
         * @tc.name: testApiBt709TaskPool0001
         * @tc.desc: Verify TaskPool returns exact BT709 properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testApiBt709TaskPool0001', 0, async (done: Function) => {
            await runCase('testApiBt709TaskPool0001', async (): Promise<void> => {
                await switchColorSpace('BT709');
                const status: string = await textOfId('StatusInfo');
                const result: string = await readTaskPool('BT709');
                const expected: string = channelResultText('TaskPool', 'BT709', colorSpaceManager.ColorSpace.BT709);
                await addLog(`testApiBt709TaskPool0001: actual=${status}, expected switched BT709`);
                expect(status).assertEqual('Switched to BT709 for concurrency tests');
                await addLog(`testApiBt709TaskPool0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testApiBt709TaskPool0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_API_0400
         * @tc.name: testApiAdobeRgbTaskPool0001
         * @tc.desc: Verify TaskPool returns exact Adobe RGB properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testApiAdobeRgbTaskPool0001', 0, async (done: Function) => {
            await runCase('testApiAdobeRgbTaskPool0001', async (): Promise<void> => {
                await switchColorSpace('Adobe_RGB_1998');
                const status: string = await textOfId('StatusInfo');
                const result: string = await readTaskPool('Adobe_RGB_1998');
                const expected: string =
                    channelResultText('TaskPool', 'Adobe_RGB_1998', colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
                await addLog(`testApiAdobeRgbTaskPool0001: actual=${status}, expected switched Adobe_RGB_1998`);
                expect(status).assertEqual('Switched to Adobe_RGB_1998 for concurrency tests');
                await addLog(`testApiAdobeRgbTaskPool0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testApiAdobeRgbTaskPool0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_API_0500
         * @tc.name: testApiLinearSrgbTaskPool0001
         * @tc.desc: Verify TaskPool preserves Linear SRGB gamma and white point.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testApiLinearSrgbTaskPool0001', 0, async (done: Function) => {
            await runCase('testApiLinearSrgbTaskPool0001', async (): Promise<void> => {
                await switchColorSpace('Linear_SRGB');
                const status: string = await textOfId('StatusInfo');
                const result: string = await readTaskPool('Linear_SRGB');
                const expected: string =
                    channelResultText('TaskPool', 'Linear_SRGB', colorSpaceManager.ColorSpace.LINEAR_SRGB);
                await addLog(`testApiLinearSrgbTaskPool0001: actual=${status}, expected switched Linear_SRGB`);
                expect(status).assertEqual('Switched to Linear_SRGB for concurrency tests');
                await addLog(`testApiLinearSrgbTaskPool0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testApiLinearSrgbTaskPool0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });

        // ==================== Worker 与跨通道属性验证（2 条） ====================

        /*
         * @tc.number: SUB_CS_API_0600
         * @tc.name: testApiDciP3Worker0001
         * @tc.desc: Verify Worker callback returns exact DCI P3 properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testApiDciP3Worker0001', 0, async (done: Function) => {
            await runCase('testApiDciP3Worker0001', async (): Promise<void> => {
                await switchColorSpace('DCI_P3');
                const status: string = await textOfId('StatusInfo');
                const result: string = await readWorker('DCI_P3');
                const expected: string = channelResultText('Worker', 'DCI_P3', colorSpaceManager.ColorSpace.DCI_P3);
                await addLog(`testApiDciP3Worker0001: actual=${status}, expected switched DCI_P3`);
                expect(status).assertEqual('Switched to DCI_P3 for concurrency tests');
                await addLog(`testApiDciP3Worker0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testApiDciP3Worker0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_API_0700
         * @tc.name: testApiBt2020PqChannels0001
         * @tc.desc: Verify BT2020 PQ properties agree between TaskPool and Worker.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testApiBt2020PqChannels0001', 0, async (done: Function) => {
            await runCase('testApiBt2020PqChannels0001', async (): Promise<void> => {
                await switchColorSpace('BT2020_PQ');
                const status: string = await textOfId('StatusInfo');
                const taskResult: string = await readTaskPool('BT2020_PQ');
                const workerResult: string = await readWorker('BT2020_PQ');
                const expectedTask: string = channelResultText('TaskPool', 'BT2020_PQ',
                  colorSpaceManager.ColorSpace.BT2020_PQ);
                const expectedWorker: string = channelResultText('Worker', 'BT2020_PQ',
                  colorSpaceManager.ColorSpace.BT2020_PQ);
                await addLog(`testApiBt2020PqChannels0001: actual=${status}, expected switched BT2020_PQ`);
                expect(status).assertEqual('Switched to BT2020_PQ for concurrency tests');
                await addLog(`testApiBt2020PqChannels0001: actual=${taskResult}, expected=${expectedTask}`);
                expect(taskResult).assertEqual(expectedTask);
                await addLog(`testApiBt2020PqChannels0001: actual=${workerResult}, expected=${expectedWorker}`);
                expect(workerResult).assertEqual(expectedWorker);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_API_0800
         * @tc.name: testApiDisplayP3Worker0001
         * @tc.desc: Verify Worker returns exact Display P3 properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testApiDisplayP3Worker0001', 0, async (done: Function) => {
            await runCase('testApiDisplayP3Worker0001', async (): Promise<void> => {
                await switchColorSpace('Display_P3');
                const status: string = await textOfId('StatusInfo');
                const result: string = await readWorker('Display_P3');
                const expected: string = channelResultText('Worker', 'Display_P3',
                  colorSpaceManager.ColorSpace.DISPLAY_P3);
                await addLog(`testApiDisplayP3Worker0001: actual=${status}, expected switched Display_P3`);
                expect(status).assertEqual('Switched to Display_P3 for concurrency tests');
                await addLog(`testApiDisplayP3Worker0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testApiDisplayP3Worker0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_API_0900
         * @tc.name: testApiAdobeRgbWorker0001
         * @tc.desc: Verify Worker returns exact Adobe RGB properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testApiAdobeRgbWorker0001', 0, async (done: Function) => {
            await runCase('testApiAdobeRgbWorker0001', async (): Promise<void> => {
                await switchColorSpace('Adobe_RGB_1998');
                const status: string = await textOfId('StatusInfo');
                const result: string = await readWorker('Adobe_RGB_1998');
                const expected: string =
                    channelResultText('Worker', 'Adobe_RGB_1998', colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
                await addLog(`testApiAdobeRgbWorker0001: actual=${status}, expected switched Adobe_RGB_1998`);
                expect(status).assertEqual('Switched to Adobe_RGB_1998 for concurrency tests');
                await addLog(`testApiAdobeRgbWorker0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testApiAdobeRgbWorker0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });
    });
}
