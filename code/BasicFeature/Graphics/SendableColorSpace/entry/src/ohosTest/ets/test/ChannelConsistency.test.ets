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
    startApp, runCase, addLog, resetToIndex, navigateToConcurrency, clickScrolledId, textOfId,
    waitTextContains, channelResultText, referenceResultText
} from '../testkit/SharedDriver';
import { STANDARD_COLOR_SPACES, ColorSpaceInfo, getColorSpaceNameStr } from '../../../main/ets/common/ColorSpaceData';

// The name the system reports for an enum value, which is what the worker and task pool channels return too.
function platformName(info: ColorSpaceInfo): string {
    const manager: sendableColorSpaceManager.ColorSpaceManager = sendableColorSpaceManager.create(info.enumValue);
    return getColorSpaceNameStr(manager.getColorSpaceName());
}

// Read the selected color space through the task pool button and return the rendered block.
async function readViaTaskPool(testName: string, info: ColorSpaceInfo): Promise<string> {
    await addLog(`${testName}: switch to ${info.label}`);
    await clickScrolledId(`BtnSwitch_${info.label}`);
    await addLog(`${testName}: read via task pool`);
    await clickScrolledId('ConBtnTaskPoolRead');
    return await waitTextContains('ConTaskPoolResult', '[TaskPool] gamma=');
}

// Read the selected color space through the worker button and return the rendered block.
async function readViaWorker(testName: string, info: ColorSpaceInfo): Promise<string> {
    await addLog(`${testName}: switch to ${info.label}`);
    await clickScrolledId(`BtnSwitch_${info.label}`);
    await addLog(`${testName}: read via worker`);
    await clickScrolledId('BtnWorkerRead');
    return await waitTextContains('WorkerResult', '[Worker] gamma=');
}

export default function channelConsistencyTest(): void {
    describe('ChannelConsistency', () => {
        beforeAll(async () => {
            await addLog('ChannelConsistency suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToConcurrency();
        });

        // ==================== TaskPool channel over the eight standard color spaces ====================

        /*
         * @tc.number: SUB_CS_CHAN_0101
         * @tc.name: testTaskPoolChannel0001
         * @tc.desc: Switch to SRGB, read it through the task pool and compare every field with the platform.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testTaskPoolChannel0001', 0, async (done: Function) => {
            await runCase('testTaskPoolChannel0001', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[0];
                const shown: string = await readViaTaskPool('testTaskPoolChannel0001', info);
                const status: string = await textOfId('StatusInfo');
                const expected: string = channelResultText('TaskPool', platformName(info), info.enumValue);
                await addLog(`testTaskPoolChannel0001: actual status=${status}, expected switch to ${info.label}`);
                expect(status).assertEqual(`Switched to ${info.label} for concurrency tests`);
                await addLog(`testTaskPoolChannel0001: actual=${shown}, expected=${expected}`);
                expect(shown).assertEqual(expected);
                await addLog(`testTaskPoolChannel0001: the task pool reported the platform name ${platformName(info)}`);
                expect(shown.includes(`name=${platformName(info)}`)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHAN_0102
         * @tc.name: testTaskPoolChannel0002
         * @tc.desc: Switch to Display_P3, read it through the task pool and compare every field with the platform.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testTaskPoolChannel0002', 0, async (done: Function) => {
            await runCase('testTaskPoolChannel0002', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[1];
                const shown: string = await readViaTaskPool('testTaskPoolChannel0002', info);
                const status: string = await textOfId('StatusInfo');
                const expected: string = channelResultText('TaskPool', platformName(info), info.enumValue);
                await addLog(`testTaskPoolChannel0002: actual status=${status}, expected switch to ${info.label}`);
                expect(status).assertEqual(`Switched to ${info.label} for concurrency tests`);
                await addLog(`testTaskPoolChannel0002: actual=${shown}, expected=${expected}`);
                expect(shown).assertEqual(expected);
                await addLog(`testTaskPoolChannel0002: the task pool kept the D65 white point of ${info.label}`);
                expect(shown.includes('whitePoint=[0.3127, 0.3290]')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHAN_0103
         * @tc.name: testTaskPoolChannel0003
         * @tc.desc: Switch to DCI_P3, read it through the task pool and check the DCI white point is kept.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testTaskPoolChannel0003', 0, async (done: Function) => {
            await runCase('testTaskPoolChannel0003', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[2];
                const shown: string = await readViaTaskPool('testTaskPoolChannel0003', info);
                const status: string = await textOfId('StatusInfo');
                const expected: string = channelResultText('TaskPool', platformName(info), info.enumValue);
                await addLog(`testTaskPoolChannel0003: actual status=${status}, expected switch to ${info.label}`);
                expect(status).assertEqual(`Switched to ${info.label} for concurrency tests`);
                await addLog(`testTaskPoolChannel0003: actual=${shown}, expected=${expected}`);
                expect(shown).assertEqual(expected);
                await addLog(`testTaskPoolChannel0003: the DCI white point survived the transfer`);
                expect(shown.includes('whitePoint=[0.3140, 0.3510]')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHAN_0104
         * @tc.name: testTaskPoolChannel0004
         * @tc.desc: Switch to BT2020_HLG, read it through the task pool and compare every field with the platform.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testTaskPoolChannel0004', 0, async (done: Function) => {
            await runCase('testTaskPoolChannel0004', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[3];
                const shown: string = await readViaTaskPool('testTaskPoolChannel0004', info);
                const status: string = await textOfId('StatusInfo');
                const expected: string = channelResultText('TaskPool', platformName(info), info.enumValue);
                await addLog(`testTaskPoolChannel0004: actual status=${status}, expected switch to ${info.label}`);
                expect(status).assertEqual(`Switched to ${info.label} for concurrency tests`);
                await addLog(`testTaskPoolChannel0004: actual=${shown}, expected=${expected}`);
                expect(shown).assertEqual(expected);
                await addLog(`testTaskPoolChannel0004: three documented lines were rendered`);
                expect(shown.split('\n').length).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHAN_0105
         * @tc.name: testTaskPoolChannel0005
         * @tc.desc: Switch to BT2020_PQ, read it through the task pool and compare every field with the platform.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testTaskPoolChannel0005', 0, async (done: Function) => {
            await runCase('testTaskPoolChannel0005', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[4];
                const shown: string = await readViaTaskPool('testTaskPoolChannel0005', info);
                const status: string = await textOfId('StatusInfo');
                const expected: string = channelResultText('TaskPool', platformName(info), info.enumValue);
                await addLog(`testTaskPoolChannel0005: actual status=${status}, expected switch to ${info.label}`);
                expect(status).assertEqual(`Switched to ${info.label} for concurrency tests`);
                await addLog(`testTaskPoolChannel0005: actual=${shown}, expected=${expected}`);
                expect(shown).assertEqual(expected);
                await addLog(`testTaskPoolChannel0005: the task pool reported the platform name ${platformName(info)}`);
                expect(shown.includes(`name=${platformName(info)}`)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHAN_0106
         * @tc.name: testTaskPoolChannel0006
         * @tc.desc: Switch to BT709, read it through the task pool and compare every field with the platform.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testTaskPoolChannel0006', 0, async (done: Function) => {
            await runCase('testTaskPoolChannel0006', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[5];
                const shown: string = await readViaTaskPool('testTaskPoolChannel0006', info);
                const status: string = await textOfId('StatusInfo');
                const expected: string = channelResultText('TaskPool', platformName(info), info.enumValue);
                await addLog(`testTaskPoolChannel0006: actual status=${status}, expected switch to ${info.label}`);
                expect(status).assertEqual(`Switched to ${info.label} for concurrency tests`);
                await addLog(`testTaskPoolChannel0006: actual=${shown}, expected=${expected}`);
                expect(shown).assertEqual(expected);
                await addLog(`testTaskPoolChannel0006: the transfer did not change the white point`);
                expect(shown.includes('whitePoint=[0.3127, 0.3290]')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHAN_0107
         * @tc.name: testTaskPoolChannel0007
         * @tc.desc: Switch to Adobe_RGB_1998, read it through the task pool and compare every field with the platform.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testTaskPoolChannel0007', 0, async (done: Function) => {
            await runCase('testTaskPoolChannel0007', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[6];
                const shown: string = await readViaTaskPool('testTaskPoolChannel0007', info);
                const status: string = await textOfId('StatusInfo');
                const expected: string = channelResultText('TaskPool', platformName(info), info.enumValue);
                await addLog(`testTaskPoolChannel0007: actual status=${status}, expected switch to ${info.label}`);
                expect(status).assertEqual(`Switched to ${info.label} for concurrency tests`);
                await addLog(`testTaskPoolChannel0007: actual=${shown}, expected=${expected}`);
                expect(shown).assertEqual(expected);
                await addLog(`testTaskPoolChannel0007: the task pool reported the platform name ${platformName(info)}`);
                expect(shown.includes(`name=${platformName(info)}`)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHAN_0108
         * @tc.name: testTaskPoolChannel0008
         * @tc.desc: Switch to Linear_SRGB, read it through the task pool and check the linear gamma survives.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testTaskPoolChannel0008', 0, async (done: Function) => {
            await runCase('testTaskPoolChannel0008', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[7];
                const shown: string = await readViaTaskPool('testTaskPoolChannel0008', info);
                const status: string = await textOfId('StatusInfo');
                const expected: string = channelResultText('TaskPool', platformName(info), info.enumValue);
                await addLog(`testTaskPoolChannel0008: actual status=${status}, expected switch to ${info.label}`);
                expect(status).assertEqual(`Switched to ${info.label} for concurrency tests`);
                await addLog(`testTaskPoolChannel0008: actual=${shown}, expected=${expected}`);
                expect(shown).assertEqual(expected);
                await addLog(`testTaskPoolChannel0008: the linear gamma 1 survived the transfer`);
                expect(shown.includes('[TaskPool] gamma=1')).assertTrue();
            }, done);
        });

        // ==================== Worker channel and reference semantics ====================

        /*
         * @tc.number: SUB_CS_CHAN_0201
         * @tc.name: testWorkerChannel0001
         * @tc.desc: Read SRGB through the worker and check both channels agree on the same reference.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testWorkerChannel0001', 0, async (done: Function) => {
            await runCase('testWorkerChannel0001', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[0];
                const workerShown: string = await readViaWorker('testWorkerChannel0001', info);
                const expectedWorker: string = channelResultText('Worker', platformName(info), info.enumValue);
                await addLog(`testWorkerChannel0001: actual=${workerShown}, expected=${expectedWorker}`);
                expect(workerShown).assertEqual(expectedWorker);
                await clickScrolledId('BtnVerifyRef');
                const verified: string = await waitTextContains('ReferenceResult', 'Same reference:');
                const expectedRef: string = referenceResultText(platformName(info), info.enumValue);
                await addLog(`testWorkerChannel0001: actual=${verified}, expected=${expectedRef}`);
                expect(verified).assertEqual(expectedRef);
                await addLog(`testWorkerChannel0001: both channels saw the same reference`);
                expect(verified.includes('Same reference: YES')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHAN_0202
         * @tc.name: testWorkerChannel0002
         * @tc.desc: Read DCI_P3 through the worker and check the DCI white point reaches the worker unchanged.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testWorkerChannel0002', 0, async (done: Function) => {
            await runCase('testWorkerChannel0002', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[2];
                const workerShown: string = await readViaWorker('testWorkerChannel0002', info);
                const expectedWorker: string = channelResultText('Worker', platformName(info), info.enumValue);
                await addLog(`testWorkerChannel0002: actual=${workerShown}, expected=${expectedWorker}`);
                expect(workerShown).assertEqual(expectedWorker);
                await addLog(`testWorkerChannel0002: the worker saw the DCI white point`);
                expect(workerShown.includes('whitePoint=[0.3140, 0.3510]')).assertTrue();
                await clickScrolledId('BtnVerifyRef');
                const verified: string = await waitTextContains('ReferenceResult', 'Same reference:');
                await addLog(`testWorkerChannel0002: actual=${verified}, expected a confirmed reference`);
                expect(verified.includes('Same reference: YES')).assertTrue();
                await addLog(`testWorkerChannel0002: the verification reported the platform name ` +
                  `${platformName(info)}`);
                expect(verified.includes(`name=${platformName(info)}`)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHAN_0203
         * @tc.name: testWorkerChannel0003
         * @tc.desc: Read BT2020_HLG through the worker and check both channels agree on the same reference.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testWorkerChannel0003', 0, async (done: Function) => {
            await runCase('testWorkerChannel0003', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[3];
                const workerShown: string = await readViaWorker('testWorkerChannel0003', info);
                const expectedWorker: string = channelResultText('Worker', platformName(info), info.enumValue);
                await addLog(`testWorkerChannel0003: actual=${workerShown}, expected=${expectedWorker}`);
                expect(workerShown).assertEqual(expectedWorker);
                await clickScrolledId('BtnVerifyRef');
                const verified: string = await waitTextContains('ReferenceResult', 'Same reference:');
                const expectedRef: string = referenceResultText(platformName(info), info.enumValue);
                await addLog(`testWorkerChannel0003: actual=${verified}, expected=${expectedRef}`);
                expect(verified).assertEqual(expectedRef);
                await addLog(`testWorkerChannel0003: three documented lines were rendered`);
                expect(verified.split('\n').length).assertEqual(3);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_CHAN_0204
         * @tc.name: testWorkerChannel0004
         * @tc.desc: Read Linear_SRGB through the worker and check the linear gamma is preserved.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testWorkerChannel0004', 0, async (done: Function) => {
            await runCase('testWorkerChannel0004', async (): Promise<void> => {
                const info: ColorSpaceInfo = STANDARD_COLOR_SPACES[7];
                const workerShown: string = await readViaWorker('testWorkerChannel0004', info);
                const expectedWorker: string = channelResultText('Worker', platformName(info), info.enumValue);
                await addLog(`testWorkerChannel0004: actual=${workerShown}, expected=${expectedWorker}`);
                expect(workerShown).assertEqual(expectedWorker);
                await addLog(`testWorkerChannel0004: the worker saw the linear gamma 1`);
                expect(workerShown.includes('[Worker] gamma=1')).assertTrue();
                await clickScrolledId('BtnVerifyRef');
                const verified: string = await waitTextContains('ReferenceResult', 'Same reference:');
                await addLog(`testWorkerChannel0004: actual=${verified}, expected a confirmed reference`);
                expect(verified.includes('Same reference: YES')).assertTrue();
                await addLog(`testWorkerChannel0004: the linear gamma line is part of the verification`);
                expect(verified.includes('gamma=1')).assertTrue();
            }, done);
        });
    });
}
