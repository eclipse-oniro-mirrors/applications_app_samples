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

import { describe, it, expect } from '@ohos/hypium';
import { colorSpaceManager } from '@kit.ArkGraphics2D';
import {
    runCase,
    addLog,
    isCloseTo,
    numberAfter,
    factsOf,
    resetToIndex,
    navigateToBenchmark,
    clickId,
    textOfId,
    textOrEmpty,
    existsId,
    waitTextContains,
    waitId
} from '../testkit/SharedDriver';

const INDEX_TITLE_ID = 'TitleText';
const BENCH_PAGE_TITLE_ID = 'BenchPageTitle';
const BENCH_TIMEOUT = 60000;

export default function concurrencyBenchmarkTest(): void {
    describe('ConcurrencyBenchmarkTest', () => {

        /*
         * @tc.number: SUB_CS_BENCH_0001
         * @tc.name: testBenchNavigate0001
         * @tc.desc: Verify the benchmark page opens idle with the documented iteration count.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testBenchNavigate0001', 0, async (done: Function) => {
            await runCase('testBenchNavigate0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToBenchmark();
                const title: string = await textOfId(BENCH_PAGE_TITLE_ID);
                await addLog(`testBenchNavigate0001: actual title=${title}, expected=Concurrency Benchmark`);
                expect(title).assertEqual('Concurrency Benchmark');
                const iterations: string = await textOfId('BenchIterText');
                await addLog(`testBenchNavigate0001: actual iterations=${iterations}, expected=Iterations:200`);
                expect(iterations).assertEqual('Iterations:200');
                const status: string = await textOfId('BenchStatusText');
                await addLog(`testBenchNavigate0001: actual status=${status}, expected=Status:Ready`);
                expect(status).assertEqual('Status:Ready');
                const summary: string = await textOfId('BenchSummaryText');
                await addLog(`testBenchNavigate0001: actual summary=${summary}, expected=Fastest:none Total:0`);
                expect(summary).assertEqual('Fastest:none Total:0');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_BENCH_0002
         * @tc.name: testBenchLocal0001
         * @tc.desc: Verify the local channel reports the configured sample count and the sRGB name.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testBenchLocal0001', 0, async (done: Function) => {
            await runCase('testBenchLocal0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToBenchmark();
                await clickId('BenchBtnRunLocal');
                const local: string = await waitTextContains('BenchLocalText', 'samples=200');
                await addLog(`testBenchLocal0001: actual local line=${local}, expected to contain samples=200`);
                expect(local.includes('samples=200')).assertTrue();
                await addLog(`testBenchLocal0001: actual local line=${local}, expected to contain name=SRGB`);
                expect(local.includes('name=SRGB')).assertTrue();
                const elapsed: number = numberAfter(local, 'elapsed=');
                await addLog(`testBenchLocal0001: actual elapsed=${elapsed}, expected>=0`);
                expect(elapsed >= 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_BENCH_0003
         * @tc.name: testBenchTaskPool0001
         * @tc.desc: Verify the task pool channel returns the same color space facts as the local run.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testBenchTaskPool0001', 0, async (done: Function) => {
            await runCase('testBenchTaskPool0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToBenchmark();
                await clickId('BenchBtnRunTaskPool');
                await waitTextContains('BenchStatusText', 'Done', BENCH_TIMEOUT);
                const taskPool: string = await textOfId('BenchTaskPoolText');
                // The platform reports the sRGB gamma as a float32, so the expectation comes from the same source.
                const expectedGamma: number = factsOf(colorSpaceManager.ColorSpace.SRGB).gamma;
                await addLog(`testBenchTaskPool0001: actual task pool line=${taskPool}, expected samples=200`);
                expect(taskPool.includes('samples=200')).assertTrue();
                await addLog(`testBenchTaskPool0001: actual task pool line=${taskPool}, expected name=SRGB`);
                expect(taskPool.includes('name=SRGB')).assertTrue();
                await addLog(`testBenchTaskPool0001: actual gamma=${numberAfter(taskPool, 'gamma=')}, ` +
                    `expected=${expectedGamma}`);
                expect(isCloseTo(numberAfter(taskPool, 'gamma='), expectedGamma, 0.0001)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_BENCH_0004
         * @tc.name: testBenchWorker0001
         * @tc.desc: Verify the worker channel completes the configured number of round trips.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testBenchWorker0001', 0, async (done: Function) => {
            await runCase('testBenchWorker0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToBenchmark();
                await clickId('BenchBtnRunWorker');
                await waitTextContains('BenchStatusText', 'Done', BENCH_TIMEOUT);
                const workerInfo: string = await textOfId('BenchWorkerText');
                await addLog(`testBenchWorker0001: actual worker line=${workerInfo}, expected roundTrips=200`);
                expect(workerInfo.includes('roundTrips=200')).assertTrue();
                await addLog(`testBenchWorker0001: actual worker line=${workerInfo}, expected name=SRGB`);
                expect(workerInfo.includes('name=SRGB')).assertTrue();
                const elapsed: number = numberAfter(workerInfo, 'elapsed=');
                await addLog(`testBenchWorker0001: actual elapsed=${elapsed}, expected>=0`);
                expect(elapsed >= 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_BENCH_0005
         * @tc.name: testBenchRunAll0001
         * @tc.desc: Verify running every channel fills all three reports and a summary line.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBenchRunAll0001', 0, async (done: Function) => {
            await runCase('testBenchRunAll0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToBenchmark();
                await clickId('BenchBtnRunAll');
                await waitTextContains('BenchStatusText', 'Done', BENCH_TIMEOUT);
                const local: string = await textOfId('BenchLocalText');
                await addLog(`testBenchRunAll0001: actual local line=${local}, expected samples=200`);
                expect(local.includes('samples=200')).assertTrue();
                const taskPool: string = await textOfId('BenchTaskPoolText');
                await addLog(`testBenchRunAll0001: actual task pool line=${taskPool}, expected samples=200`);
                expect(taskPool.includes('samples=200')).assertTrue();
                const workerInfo: string = await textOfId('BenchWorkerText');
                await addLog(`testBenchRunAll0001: actual worker line=${workerInfo}, expected roundTrips=200`);
                expect(workerInfo.includes('roundTrips=200')).assertTrue();
                const summary: string = await textOfId('BenchSummaryText');
                await addLog(`testBenchRunAll0001: actual summary=${summary}, expected Fastest and Total tokens`);
                expect(summary.startsWith('Fastest:') && summary.includes(' Total:')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_BENCH_0006
         * @tc.name: testBenchSummary0001
         * @tc.desc: Verify the summary names the fastest channel and totals the three elapsed times.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testBenchSummary0001', 0, async (done: Function) => {
            await runCase('testBenchSummary0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToBenchmark();
                await clickId('BenchBtnRunAll');
                await waitTextContains('BenchStatusText', 'Done', BENCH_TIMEOUT);
                const localMs: number = numberAfter(await textOfId('BenchLocalText'), 'elapsed=');
                const taskPoolMs: number = numberAfter(await textOfId('BenchTaskPoolText'), 'elapsed=');
                const workerMs: number = numberAfter(await textOfId('BenchWorkerText'), 'elapsed=');
                let fastest: string = 'Local';
                let best: number = localMs;
                if (taskPoolMs < best) {
                    best = taskPoolMs;
                    fastest = 'TaskPool';
                }
                if (workerMs < best) {
                    best = workerMs;
                    fastest = 'Worker';
                }
                const summary: string = await textOfId('BenchSummaryText');
                const expected: string = `Fastest:${fastest} Total:${localMs + taskPoolMs + workerMs}`;
                await addLog(`testBenchSummary0001: actual summary=${summary}, expected=${expected}`);
                expect(summary).assertEqual(expected);
                await addLog(`testBenchSummary0001: actual fastest=${fastest}, expected one of the three channels`);
                expect(fastest === 'Local' || fastest === 'TaskPool' || fastest === 'Worker').assertTrue();
                await addLog(`testBenchSummary0001: actual fastest elapsed=${best}, expected>=0`);
                expect(best >= 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_BENCH_0007
         * @tc.name: testBenchRepeatable0001
         * @tc.desc: Verify the local channel can be measured twice without losing the sample count.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBenchRepeatable0001', 0, async (done: Function) => {
            await runCase('testBenchRepeatable0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToBenchmark();
                await clickId('BenchBtnRunLocal');
                const first: string = await waitTextContains('BenchLocalText', 'samples=200');
                await clickId('BenchBtnRunLocal');
                const second: string = await textOfId('BenchLocalText');
                await addLog(`testBenchRepeatable0001: first=${first} second=${second}, expected both valid`);
                expect(second.includes('samples=200')).assertTrue();
                await addLog(`testBenchRepeatable0001: actual first elapsed=${numberAfter(first, 'elapsed=')}, ` +
                  `expected>=0`);
                expect(numberAfter(first, 'elapsed=') >= 0).assertTrue();
                await addLog(`testBenchRepeatable0001: actual second elapsed=${numberAfter(second, 'elapsed=')}, ` +
                    'expected>=0');
                expect(numberAfter(second, 'elapsed=') >= 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_BENCH_0008
         * @tc.name: testBenchGammaConsistency0001
         * @tc.desc: Verify all three channels report the same gamma for the same color space.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testBenchGammaConsistency0001', 0, async (done: Function) => {
            await runCase('testBenchGammaConsistency0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToBenchmark();
                await clickId('BenchBtnRunAll');
                await waitTextContains('BenchStatusText', 'Done', BENCH_TIMEOUT);
                const localGamma: number = numberAfter(await textOfId('BenchLocalText'), 'gamma=');
                const taskPoolGamma: number = numberAfter(await textOfId('BenchTaskPoolText'), 'gamma=');
                const workerGamma: number = numberAfter(await textOfId('BenchWorkerText'), 'gamma=');
                await addLog(`testBenchGammaConsistency0001: local=${localGamma} taskPool=${taskPoolGamma}`);
                expect(isCloseTo(localGamma, taskPoolGamma, 0.0001)).assertTrue();
                await addLog(`testBenchGammaConsistency0001: local=${localGamma} worker=${workerGamma}`);
                expect(isCloseTo(localGamma, workerGamma, 0.0001)).assertTrue();
                // The platform reports the sRGB gamma as a float32 value, so the reference is read from it directly.
                const expectedGamma: number = factsOf(colorSpaceManager.ColorSpace.SRGB).gamma;
                await addLog(`testBenchGammaConsistency0001: actual gamma=${localGamma}, expected=${expectedGamma}`);
                expect(isCloseTo(localGamma, expectedGamma, 0.0001)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_BENCH_0009
         * @tc.name: testBenchReset0001
         * @tc.desc: Verify reset clears the channel reports and restores the idle status.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBenchReset0001', 0, async (done: Function) => {
            await runCase('testBenchReset0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToBenchmark();
                await clickId('BenchBtnRunLocal');
                await waitTextContains('BenchLocalText', 'samples=200');
                await clickId('BenchBtnReset');
                const status: string = await textOfId('BenchStatusText');
                await addLog(`testBenchReset0001: actual status=${status}, expected=Status:Ready`);
                expect(status).assertEqual('Status:Ready');
                const summary: string = await textOfId('BenchSummaryText');
                await addLog(`testBenchReset0001: actual summary=${summary}, expected=Fastest:none Total:0`);
                expect(summary).assertEqual('Fastest:none Total:0');
                const local: string = await textOrEmpty('BenchLocalText');
                await addLog(`testBenchReset0001: actual local line length=${local.length}, expected=0`);
                expect(local).assertEqual('');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_BENCH_0010
         * @tc.name: testBenchBack0001
         * @tc.desc: Verify the benchmark page back button returns to the index.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testBenchBack0001', 0, async (done: Function) => {
            await runCase('testBenchBack0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToBenchmark();
                await clickId('BenchBtnBack');
                await waitId(INDEX_TITLE_ID);
                await addLog('testBenchBack0001: actual index visible=true, expected=true');
                expect(await existsId(INDEX_TITLE_ID)).assertTrue();
                await addLog('testBenchBack0001: actual page title gone=true, expected=true');
                expect(await existsId(BENCH_PAGE_TITLE_ID)).assertFalse();
                await addLog('testBenchBack0001: actual index button visible=true, expected=true');
                expect(await existsId('NavBenchmark')).assertTrue();
            }, done);
        });
    });
}
