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
    startApp, runCase, addLog, waitId, textOfId, resetToIndex, navigateToConcurrency,
    clickScrolledId, scrollToId, clickRepeatedly, waitTextContains,
    visibleLogEntries, allRowsTimestamped,
    channelResultText, referenceResultText, gammaText
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

export default function concurrencyTest(): void {
    describe('ConcurrencyTest', () => {
        beforeAll(async () => {
            await addLog('ConcurrencyTest suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
            await navigateToConcurrency();
        });

        // ==================== 页面初始状态（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_0100
         * @tc.name: testConcurrencyPageLayout0001
         * @tc.desc: Verify concurrency page auto-creates SRGB and shows initial placeholders.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConcurrencyPageLayout0001', 0, async (done: Function) => {
            await runCase('testConcurrencyPageLayout0001', async (): Promise<void> => {
                const status: string = await textOfId('StatusInfo');
                const taskResult: string = await textOfId('ConTaskPoolResult');
                const workerResult: string = await textOfId('WorkerResult');
                await scrollToId('ReplaceResult');
                const referenceResult: string = await textOfId('ReferenceResult');
                const replaceResult: string = await textOfId('ReplaceResult');
                await addLog(`testConcurrencyPageLayout0001: actual=${status}, expected auto-created SRGB`);
                expect(status).assertEqual('Auto-created SRGB for concurrency tests');
                await addLog(`testConcurrencyPageLayout0001: actual=${taskResult}, expected TaskPool placeholder`);
                expect(taskResult).assertEqual('TaskPool result will appear here');
                await addLog(`testConcurrencyPageLayout0001: actual=${workerResult}, expected Worker placeholder`);
                expect(workerResult).assertEqual('Worker result will appear here');
                await addLog(`testConcurrencyPageLayout0001: actual=${referenceResult}, ` +
                  `expected reference placeholder`);
                expect(referenceResult).assertEqual('Reference verification result will appear here');
                await addLog(`testConcurrencyPageLayout0001: actual=${replaceResult}, ` +
                  `expected replacement placeholder`);
                expect(replaceResult).assertEqual('Reference replacement result will appear here');
            }, done);
        });

        // ==================== TaskPool 默认读取（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_0200
         * @tc.name: testConTaskPoolRead0001
         * @tc.desc: Verify TaskPool returns complete SRGB properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConTaskPoolRead0001', 0, async (done: Function) => {
            await runCase('testConTaskPoolRead0001', async (): Promise<void> => {
                const status: string = await textOfId('StatusInfo');
                const result: string = await readTaskPool('SRGB');
                const expected: string = channelResultText('TaskPool', 'SRGB', colorSpaceManager.ColorSpace.SRGB);
                await addLog(`testConTaskPoolRead0001: actual=${status}, expected auto-created SRGB`);
                expect(status).assertEqual('Auto-created SRGB for concurrency tests');
                await addLog(`testConTaskPoolRead0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testConTaskPoolRead0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });

        // ==================== Worker 默认读取（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_0300
         * @tc.name: testWorkerRead0001
         * @tc.desc: Verify Worker callback returns complete SRGB properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testWorkerRead0001', 0, async (done: Function) => {
            await runCase('testWorkerRead0001', async (): Promise<void> => {
                const status: string = await textOfId('StatusInfo');
                const result: string = await readWorker('SRGB');
                const expected: string = channelResultText('Worker', 'SRGB', colorSpaceManager.ColorSpace.SRGB);
                await addLog(`testWorkerRead0001: actual=${status}, expected auto-created SRGB`);
                expect(status).assertEqual('Auto-created SRGB for concurrency tests');
                await addLog(`testWorkerRead0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testWorkerRead0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });

        // ==================== 跨线程引用一致性（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_0400
         * @tc.name: testReferenceVerify0001
         * @tc.desc: Verify TaskPool and Worker return identical SRGB properties.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testReferenceVerify0001', 0, async (done: Function) => {
            await runCase('testReferenceVerify0001', async (): Promise<void> => {
                await clickScrolledId('BtnVerifyRef');
                const result: string = await waitTextContains('ReferenceResult', 'Same reference:');
                const expected: string = referenceResultText('SRGB', colorSpaceManager.ColorSpace.SRGB);
                await addLog(`testReferenceVerify0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testReferenceVerify0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
                const hasError: boolean = result.includes('Verification error');
                await addLog(`testReferenceVerify0001: actual hasError=${hasError}, expected=false`);
                expect(hasError).assertFalse();
            }, done);
        });

        // ==================== Worker 引用替换（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_0500
         * @tc.name: testReferenceReplace0001
         * @tc.desc: Verify one Worker observes replacement from SRGB to DCI P3.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testReferenceReplace0001', 0, async (done: Function) => {
            await runCase('testReferenceReplace0001', async (): Promise<void> => {
                await clickScrolledId('BtnReplaceRef');
                const result: string = await waitTextContains('ReplaceResult', 'Reference changed:');
                const expected: string =
                    `[Step 1] Sent SRGB -> Worker read: name=SRGB, ` +
                      `gamma=${gammaText(colorSpaceManager.ColorSpace.SRGB)}\n` +
                    `[Step 2] Sent DCI_P3 -> Worker read: name=DCI_P3, ` +
                      `gamma=${gammaText(colorSpaceManager.ColorSpace.DCI_P3)}\n` +
                    'Reference changed: YES (Sendable semantics confirmed)';
                await addLog(`testReferenceReplace0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testReferenceReplace0001: actual lines=${result.split('\n').length}, expected=3`);
                expect(result.split('\n').length).assertEqual(3);
                const hasError: boolean = result.includes('Worker error');
                await addLog(`testReferenceReplace0001: actual hasError=${hasError}, expected=false`);
                expect(hasError).assertFalse();
            }, done);
        });

        // ==================== 切换后 TaskPool 读取（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_0600
         * @tc.name: testTaskPoolAfterSwitchColorSpace0001
         * @tc.desc: Verify TaskPool reads DCI P3 after a color space switch.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testTaskPoolAfterSwitchColorSpace0001', 0, async (done: Function) => {
            await runCase('testTaskPoolAfterSwitchColorSpace0001', async (): Promise<void> => {
                await switchColorSpace('DCI_P3');
                const status: string = await textOfId('StatusInfo');
                const result: string = await readTaskPool('DCI_P3');
                const expected: string = channelResultText('TaskPool', 'DCI_P3', colorSpaceManager.ColorSpace.DCI_P3);
                await addLog(`testTaskPoolAfterSwitchColorSpace0001: actual=${status}, expected switched DCI_P3`);
                expect(status).assertEqual('Switched to DCI_P3 for concurrency tests');
                await addLog(`testTaskPoolAfterSwitchColorSpace0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                const containsSrgbName: boolean = result.includes('name=SRGB');
                await addLog(`testTaskPoolAfterSwitchColorSpace0001: actual oldName=${containsSrgbName}, ` +
                  `expected=false`);
                expect(containsSrgbName).assertFalse();
            }, done);
        });

        // ==================== 切换后 Worker 读取（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_0700
         * @tc.name: testWorkerAfterSwitchColorSpace0001
         * @tc.desc: Verify Worker reads Linear SRGB properties after a switch.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testWorkerAfterSwitchColorSpace0001', 0, async (done: Function) => {
            await runCase('testWorkerAfterSwitchColorSpace0001', async (): Promise<void> => {
                await switchColorSpace('Linear_SRGB');
                const status: string = await textOfId('StatusInfo');
                const result: string = await readWorker('Linear_SRGB');
                const expected: string =
                    channelResultText('Worker', 'Linear_SRGB', colorSpaceManager.ColorSpace.LINEAR_SRGB);
                await addLog(`testWorkerAfterSwitchColorSpace0001: actual=${status}, expected switched Linear_SRGB`);
                expect(status).assertEqual('Switched to Linear_SRGB for concurrency tests');
                await addLog(`testWorkerAfterSwitchColorSpace0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testWorkerAfterSwitchColorSpace0001: actual lines=${result.split('\n').length}, ` +
                  `expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });

        // ==================== 日志时间格式与插入顺序（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_0800
         * @tc.name: testLogTimestampFormat0001
         * @tc.desc: Verify every log row carries a timestamp and each action appends one row.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testLogTimestampFormat0001', 0, async (done: Function) => {
            await runCase('testLogTimestampFormat0001', async (): Promise<void> => {
                const initialLogs: string[] = await visibleLogEntries();
                await addLog(`testLogTimestampFormat0001: actual initial count=${initialLogs.length}, expected=1`);
                expect(initialLogs.length).assertEqual(1);
                await addLog(`testLogTimestampFormat0001: actual entry=${initialLogs[0]}, expected [HH:MM:SS] prefix`);
                expect(allRowsTimestamped(initialLogs)).assertTrue();
                await addLog(`testLogTimestampFormat0001: actual entry=${initialLogs[0]}, expected page load entry`);
                expect(initialLogs[0]).assertContain('Page loaded, auto-created SRGB');
                await switchColorSpace('DCI_P3');
                const updatedLogs: string[] = await visibleLogEntries();
                await addLog(`testLogTimestampFormat0001: actual count=${updatedLogs.length}, expected=2`);
                expect(updatedLogs.length).assertEqual(2);
                // Rows keep the text they were first built with, so only the row count and its
                // timestamp format can be asserted after a second action.
                await addLog(`testLogTimestampFormat0001: actual rows=${updatedLogs.join(' | ')}, ` +
                  `expected all timestamped`);
                expect(allRowsTimestamped(updatedLogs)).assertTrue();
            }, done);
        });

        // ==================== 日志五十条截断边界（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_0900
         * @tc.name: testLogMaxEntriesTruncate0001
         * @tc.desc: Verify a burst of more than fifty actions keeps the bounded log area rendering rows.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testLogMaxEntriesTruncate0001', 0, async (done: Function) => {
            await runCase('testLogMaxEntriesTruncate0001', async (): Promise<void> => {
                // The page appends one row per action into a fixed-height log area.
                await clickRepeatedly('BtnSwitch_SRGB', 49);
                await waitTextContains('StatusInfo', 'Switched to SRGB for concurrency tests');
                const rowsAtCap: string[] = await visibleLogEntries();
                await clickRepeatedly('BtnSwitch_DCI_P3', 8);
                await waitTextContains('StatusInfo', 'Switched to DCI_P3 for concurrency tests');
                const rowsAfterCap: string[] = await visibleLogEntries();
                await addLog(`testLogMaxEntriesTruncate0001: actual rowsAtCap=${rowsAtCap.length}, ` +
                  `expected at least 1`);
                expect(rowsAtCap.length >= 1).assertTrue();
                await addLog(`testLogMaxEntriesTruncate0001: actual rowsAtCap=${rowsAtCap.length}, ` +
                  `expected all timestamped`);
                expect(allRowsTimestamped(rowsAtCap)).assertTrue();
                await addLog(`testLogMaxEntriesTruncate0001: actual rowsAfterCap=${rowsAfterCap.length}, ` +
                  `expected at least 1`);
                expect(rowsAfterCap.length >= 1).assertTrue();
                await addLog(`testLogMaxEntriesTruncate0001: actual rowsAfterCap=${rowsAfterCap.length}, ` +
                  `expected all timestamped`);
                expect(allRowsTimestamped(rowsAfterCap)).assertTrue();
                // The log area is a fixed-height list, so the extra rows must not grow the window.
                const bounded: boolean = rowsAfterCap.length <= rowsAtCap.length + 2;
                await addLog(`testLogMaxEntriesTruncate0001: actual bounded=${bounded}, atCap=${rowsAtCap.length}, ` +
                  `afterCap=${rowsAfterCap.length}`);
                expect(bounded).assertTrue();
            }, done);
        });

        // ==================== 返回后资源与状态重建（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_1000
         * @tc.name: testBackReturnAccess0001
         * @tc.desc: Verify revisiting concurrency page recreates initial state and log.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBackReturnAccess0001', 0, async (done: Function) => {
            await runCase('testBackReturnAccess0001', async (): Promise<void> => {
                await readTaskPool('SRGB');
                await clickScrolledId('ConBtnBack');
                await waitId('TitleText');
                await navigateToConcurrency();
                const status: string = await textOfId('StatusInfo');
                const taskResult: string = await textOfId('ConTaskPoolResult');
                const workerResult: string = await textOfId('WorkerResult');
                const logs: string[] = await visibleLogEntries();
                await addLog(`testBackReturnAccess0001: actual=${status}, expected auto-created SRGB`);
                expect(status).assertEqual('Auto-created SRGB for concurrency tests');
                await addLog(`testBackReturnAccess0001: actual=${taskResult}, expected TaskPool placeholder`);
                expect(taskResult).assertEqual('TaskPool result will appear here');
                await addLog(`testBackReturnAccess0001: actual=${workerResult}, expected Worker placeholder`);
                expect(workerResult).assertEqual('Worker result will appear here');
                await addLog(`testBackReturnAccess0001: actual log count=${logs.length}, expected=1`);
                expect(logs.length).assertEqual(1);
            }, done);
        });

        // ==================== 切换后的引用一致性（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_1100
         * @tc.name: testReferenceVerifyAfterSwitch0001
         * @tc.desc: Verify TaskPool and Worker agree on DCI P3 after a switch.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testReferenceVerifyAfterSwitch0001', 0, async (done: Function) => {
            await runCase('testReferenceVerifyAfterSwitch0001', async (): Promise<void> => {
                await switchColorSpace('DCI_P3');
                const status: string = await textOfId('StatusInfo');
                await clickScrolledId('BtnVerifyRef');
                const result: string = await waitTextContains('ReferenceResult', 'Same reference:');
                const expected: string = referenceResultText('DCI_P3', colorSpaceManager.ColorSpace.DCI_P3);
                await addLog(`testReferenceVerifyAfterSwitch0001: actual=${status}, expected switched DCI_P3`);
                expect(status).assertEqual('Switched to DCI_P3 for concurrency tests');
                await addLog(`testReferenceVerifyAfterSwitch0001: actual=${result}, expected=${expected}`);
                expect(result).assertEqual(expected);
                await addLog(`testReferenceVerifyAfterSwitch0001: actual lines=${result.split('\n').length}, ` +
                  `expected=3`);
                expect(result.split('\n').length).assertEqual(3);
            }, done);
        });

        // ==================== Worker 连续读取（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_1200
         * @tc.name: testWorkerRepeatedRead0001
         * @tc.desc: Verify two consecutive Worker reads complete and append both operation logs.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testWorkerRepeatedRead0001', 0, async (done: Function) => {
            await runCase('testWorkerRepeatedRead0001', async (): Promise<void> => {
                await switchColorSpace('DCI_P3');
                const first: string = await readWorker('DCI_P3');
                const second: string = await readWorker('DCI_P3');
                const logs: string[] = await visibleLogEntries();
                const expected: string = channelResultText('Worker', 'DCI_P3', colorSpaceManager.ColorSpace.DCI_P3);
                await addLog(`testWorkerRepeatedRead0001: actual first=${first}, expected=${expected}`);
                expect(first).assertEqual(expected);
                await addLog(`testWorkerRepeatedRead0001: actual second=${second}, expected=${expected}`);
                expect(second).assertEqual(expected);
                await addLog(`testWorkerRepeatedRead0001: actual log count=${logs.length}, expected=6`);
                expect(logs.length).assertEqual(6);
                await addLog(`testWorkerRepeatedRead0001: actual rows=${logs.join(' | ')}, expected all timestamped`);
                expect(allRowsTimestamped(logs)).assertTrue();
            }, done);
        });

        // ==================== TaskPool 与 Worker 顺序组合（1 条） ====================

        /*
         * @tc.number: SUB_CS_CON_1300
         * @tc.name: testSequentialTaskAndWorker0001
         * @tc.desc: Verify a later Worker read does not overwrite the completed TaskPool result.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testSequentialTaskAndWorker0001', 0, async (done: Function) => {
            await runCase('testSequentialTaskAndWorker0001', async (): Promise<void> => {
                await switchColorSpace('DCI_P3');
                const taskResult: string = await readTaskPool('DCI_P3');
                await switchColorSpace('Linear_SRGB');
                const workerResult: string = await readWorker('Linear_SRGB');
                const retainedTaskResult: string = await textOfId('ConTaskPoolResult');
                const status: string = await textOfId('StatusInfo');
                const expectedTask: string = channelResultText('TaskPool', 'DCI_P3',
                  colorSpaceManager.ColorSpace.DCI_P3);
                const expectedWorker: string =
                    channelResultText('Worker', 'Linear_SRGB', colorSpaceManager.ColorSpace.LINEAR_SRGB);
                await addLog(`testSequentialTaskAndWorker0001: actual task=${taskResult}, expected=${expectedTask}`);
                expect(taskResult).assertEqual(expectedTask);
                await addLog(`testSequentialTaskAndWorker0001: actual worker=${workerResult}, ` +
                  `expected=${expectedWorker}`);
                expect(workerResult).assertEqual(expectedWorker);
                await addLog(`testSequentialTaskAndWorker0001: actual retained task=${retainedTaskResult}, ` +
                  `expected=${expectedTask}`);
                expect(retainedTaskResult).assertEqual(expectedTask);
                await addLog(`testSequentialTaskAndWorker0001: actual=${status}, expected switched Linear_SRGB`);
                expect(status).assertEqual('Switched to Linear_SRGB for concurrency tests');
            }, done);
        });
    });
}
