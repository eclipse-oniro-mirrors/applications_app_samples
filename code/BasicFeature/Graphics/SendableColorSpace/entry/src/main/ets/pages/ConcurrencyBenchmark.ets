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

import { colorSpaceManager, sendableColorSpaceManager } from '@kit.ArkGraphics2D';
import { collections, taskpool, worker, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import { router } from '@kit.ArkUI';
import Logger from '../utils/Logger';
import { STANDARD_COLOR_SPACES, getColorSpaceNameStr } from '../common/ColorSpaceData';
import { ColorSpaceResult } from '../sendable/ColorSpaceResult';
import { BenchmarkResult } from '../sendable/BenchmarkResult';

const TAG = '[ConcurrencyBenchmark]';
const BTN_H = 40;
const ITERATIONS = 200;
const READS_PER_SAMPLE = 3;

// Same read loop the task pool executes, so the local baseline measures identical work.
function measureReads(manager: sendableColorSpaceManager.ColorSpaceManager, iterations: number,
    readsPerSample: number): BenchmarkResult {
    let name: string = '';
    let whitePointX: number = 0;
    let whitePointY: number = 0;
    let gamma: number = 0;
    let start: number = Date.now();
    for (let i = 0; i < iterations; i++) {
        for (let read = 0; read < readsPerSample; read++) {
            let whitePoint: collections.Array<number> = manager.getWhitePoint();
            gamma = manager.getGamma();
            if (whitePoint.length >= 2) {
                whitePointX = whitePoint[0];
                whitePointY = whitePoint[1];
            }
        }
        name = getColorSpaceNameStr(manager.getColorSpaceName());
    }
    let elapsed: number = Date.now() - start;
    return new BenchmarkResult(elapsed, iterations, name, whitePointX, whitePointY, gamma);
}

@Concurrent
function measureReadsInTask(manager: sendableColorSpaceManager.ColorSpaceManager, iterations: number,
    readsPerSample: number): BenchmarkResult {
    let name: string = '';
    let whitePointX: number = 0;
    let whitePointY: number = 0;
    let gamma: number = 0;
    let start: number = Date.now();
    for (let i = 0; i < iterations; i++) {
        for (let read = 0; read < readsPerSample; read++) {
            let whitePoint: collections.Array<number> = manager.getWhitePoint();
            gamma = manager.getGamma();
            if (whitePoint.length >= 2) {
                whitePointX = whitePoint[0];
                whitePointY = whitePoint[1];
            }
        }
        name = getColorSpaceNameStr(manager.getColorSpaceName());
    }
    let elapsed: number = Date.now() - start;
    return new BenchmarkResult(elapsed, iterations, name, whitePointX, whitePointY, gamma);
}

@Entry
@Component
struct ConcurrencyBenchmark {
    @State iterations: number = ITERATIONS;
    @State statusInfo: string = 'Status:Ready';
    @State localInfo: string = '';
    @State taskPoolInfo: string = '';
    @State workerInfo: string = '';
    @State summaryInfo: string = 'Fastest:none Total:0';
    private localElapsed: number = -1;
    private taskPoolElapsed: number = -1;
    private workerElapsed: number = -1;
    private currentColorSpace: sendableColorSpaceManager.ColorSpaceManager | null = null;
    private colorSpaceWorker: worker.ThreadWorker | null = null;

    aboutToAppear(): void {
        Logger.info(TAG, 'aboutToAppear');
        let cs: sendableColorSpaceManager.ColorSpaceManager =
            sendableColorSpaceManager.create(STANDARD_COLOR_SPACES[0].enumValue);
        this.currentColorSpace = cs;
        this.statusInfo = 'Status:Ready';
    }

    aboutToDisappear(): void {
        if (this.colorSpaceWorker !== null) {
            this.colorSpaceWorker.terminate();
            this.colorSpaceWorker = null;
        }
    }

    goBack(): void {
        router.back();
    }

    formatResult(channel: string, result: BenchmarkResult): string {
        return `${channel}:elapsed=${result.elapsedMs} samples=${result.samples} ` +
            `name=${result.name} gamma=${result.gamma}`;
    }

    // The fastest channel is the one whose batch finished in the shortest wall time.
    refreshSummary(): void {
        let fastest: string = 'none';
        let best: number = Number.MAX_VALUE;
        if (this.localElapsed >= 0 && this.localElapsed < best) {
            best = this.localElapsed;
            fastest = 'Local';
        }
        if (this.taskPoolElapsed >= 0 && this.taskPoolElapsed < best) {
            best = this.taskPoolElapsed;
            fastest = 'TaskPool';
        }
        if (this.workerElapsed >= 0 && this.workerElapsed < best) {
            best = this.workerElapsed;
            fastest = 'Worker';
        }
        let total: number = 0;
        if (this.localElapsed >= 0) {
            total += this.localElapsed;
        }
        if (this.taskPoolElapsed >= 0) {
            total += this.taskPoolElapsed;
        }
        if (this.workerElapsed >= 0) {
            total += this.workerElapsed;
        }
        this.summaryInfo = `Fastest:${fastest} Total:${total}`;
    }

    runLocal(): void {
        if (this.currentColorSpace === null) {
            this.localInfo = 'Local:error=no color space';
            return;
        }
        let result: BenchmarkResult = measureReads(this.currentColorSpace, this.iterations, READS_PER_SAMPLE);
        this.localElapsed = result.elapsedMs;
        this.localInfo = this.formatResult('Local', result);
        this.refreshSummary();
        Logger.info(TAG, this.localInfo);
    }

    async runTaskPool(): Promise<void> {
        if (this.currentColorSpace === null) {
            this.taskPoolInfo = 'TaskPool:error=no color space';
            return;
        }
        let task: taskpool.Task = new taskpool.Task(measureReadsInTask, this.currentColorSpace, this.iterations,
            READS_PER_SAMPLE);
        let start: number = Date.now();
        try {
            let output: Object = await taskpool.execute(task);
            let result: BenchmarkResult = output as BenchmarkResult;
            let roundTrip: number = Date.now() - start;
            this.taskPoolElapsed = result.elapsedMs;
            this.taskPoolInfo = this.formatResult('TaskPool', result) + ` roundTrip=${roundTrip}`;
            this.refreshSummary();
            Logger.info(TAG, this.taskPoolInfo);
        } catch (error) {
            this.taskPoolInfo = `TaskPool:error=${String(error)}`;
            Logger.error(TAG, this.taskPoolInfo);
        }
    }

    // One message per sample, so the reported time includes the serialisation cost.
    roundTrip(): Promise<ColorSpaceResult> {
        return new Promise<ColorSpaceResult>((resolve: Function, reject: Function) => {
            let current: worker.ThreadWorker | null = this.colorSpaceWorker;
            if (current === null || this.currentColorSpace === null) {
                reject(new Error('Worker is not ready'));
                return;
            }
            current.onmessage = (e: MessageEvents) => {
                resolve(e.data as ColorSpaceResult);
            };
            current.onerror = (e: ErrorEvent) => {
                reject(new Error(e.message));
            };
            current.postMessageWithSharedSendable(this.currentColorSpace);
        });
    }

    async runWorker(): Promise<void> {
        if (this.currentColorSpace === null) {
            this.workerInfo = 'Worker:error=no color space';
            return;
        }
        if (this.colorSpaceWorker !== null) {
            this.colorSpaceWorker.terminate();
            this.colorSpaceWorker = null;
        }
        this.colorSpaceWorker = new worker.ThreadWorker('entry/ets/workers/ColorSpaceWorker.ets');
        let name: string = '';
        let gamma: number = 0;
        let samples: number = 0;
        let start: number = Date.now();
        try {
            for (let i = 0; i < this.iterations; i++) {
                let result: ColorSpaceResult = await this.roundTrip();
                name = result.name;
                gamma = result.gamma;
                samples++;
            }
            let elapsed: number = Date.now() - start;
            this.workerElapsed = elapsed;
            this.workerInfo = `Worker:elapsed=${elapsed} roundTrips=${samples} name=${name} gamma=${gamma}`;
            this.refreshSummary();
            Logger.info(TAG, this.workerInfo);
        } catch (error) {
            this.workerInfo = `Worker:error=${String(error)}`;
            Logger.error(TAG, this.workerInfo);
        }
    }

    async runAll(): Promise<void> {
        this.statusInfo = 'Status:Running';
        this.localElapsed = -1;
        this.taskPoolElapsed = -1;
        this.workerElapsed = -1;
        this.runLocal();
        await this.runTaskPool();
        await this.runWorker();
        this.refreshSummary();
        this.statusInfo = 'Status:Done';
        Logger.info(TAG, `All channels finished: ${this.summaryInfo}`);
    }

    resetAll(): void {
        this.localElapsed = -1;
        this.taskPoolElapsed = -1;
        this.workerElapsed = -1;
        this.localInfo = '';
        this.taskPoolInfo = '';
        this.workerInfo = '';
        this.summaryInfo = 'Fastest:none Total:0';
        this.statusInfo = 'Status:Ready';
        Logger.info(TAG, 'Reset benchmark results');
    }

    build() {
        Scroll() {
            Column({ space: 8 }) {
                Row() {
                    Button('< Back')
                        .id('BenchBtnBack')
                        .fontSize(14)
                        .height(36)
                        .onClick(() => {
                            this.goBack();
                        })
                    Text('Concurrency Benchmark')
                        .id('BenchPageTitle')
                        .fontSize(18)
                        .fontWeight(FontWeight.Bold)
                        .margin({ left: 12 })
                }
                .width('100%')
                .margin({ top: 12 })
                .padding({ left: 12, right: 12 })

                Text(`Iterations:${this.iterations}`)
                    .id('BenchIterText')
                    .fontSize(12)
                    .fontColor('#666666')

                Text('Each sample reads the white point and the gamma three times.')
                    .fontSize(11)
                    .fontColor('#999999')

                Text(this.statusInfo)
                    .id('BenchStatusText')
                    .fontSize(13)
                    .fontWeight(FontWeight.Medium)
                    .fontColor('#333333')
                    .backgroundColor('#F5F5F5')
                    .padding(8)
                    .borderRadius(8)
                    .textAlign(TextAlign.Center)
                    .width('90%')

                Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                    Button('Local')
                        .id('BenchBtnRunLocal')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.runLocal();
                        })
                    Button('TaskPool')
                        .id('BenchBtnRunTaskPool')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.statusInfo = 'Status:Running';
                            this.runTaskPool().then(() => {
                                this.statusInfo = 'Status:Done';
                            });
                        })
                    Button('Worker')
                        .id('BenchBtnRunWorker')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.statusInfo = 'Status:Running';
                            this.runWorker().then(() => {
                                this.statusInfo = 'Status:Done';
                            });
                        })
                }
                .width('95%')

                Button('Run All Channels')
                    .id('BenchBtnRunAll')
                    .width('80%')
                    .height(BTN_H)
                    .fontSize(14)
                    .onClick(() => {
                        this.runAll();
                    })

                Button('Reset')
                    .id('BenchBtnReset')
                    .width('50%')
                    .height(36)
                    .fontSize(13)
                    .backgroundColor('#F5F5F5')
                    .fontColor('#333333')
                    .onClick(() => {
                        this.resetAll();
                    })

                Text(this.localInfo)
                    .id('BenchLocalText')
                    .width('90%')
                    .fontSize(11)
                    .fontColor('#333333')
                    .backgroundColor('#F5F5F5')
                    .padding(8)
                    .borderRadius(8)

                Text(this.taskPoolInfo)
                    .id('BenchTaskPoolText')
                    .width('90%')
                    .fontSize(11)
                    .fontColor('#333333')
                    .backgroundColor('#F0F8FF')
                    .padding(8)
                    .borderRadius(8)

                Text(this.workerInfo)
                    .id('BenchWorkerText')
                    .width('90%')
                    .fontSize(11)
                    .fontColor('#333333')
                    .backgroundColor('#F0F8FF')
                    .padding(8)
                    .borderRadius(8)

                Text(this.summaryInfo)
                    .id('BenchSummaryText')
                    .width('90%')
                    .fontSize(12)
                    .fontWeight(FontWeight.Medium)
                    .fontColor('#333333')
                    .backgroundColor('#FFF8E1')
                    .padding(10)
                    .borderRadius(8)
                    .textAlign(TextAlign.Center)
                    .margin({ bottom: 24 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Center)
        }
        .width('100%')
        .height('100%')
        .scrollBar(BarState.Auto)
    }
}
