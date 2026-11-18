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
import {
    startApp, runCase, addLog, waitId, clickId, textOfId, resetToIndex, matchesLocalizedText
} from '../testkit/SharedDriver';

export default function indexPageTest(): void {
    describe('IndexPageTest', () => {
        beforeAll(async () => {
            await addLog('IndexPageTest suite started');
            await startApp();
        });

        beforeEach(async () => {
            await resetToIndex();
        });

        // ==================== 首页资源文案（1 条） ====================

        /*
         * @tc.number: SUB_CS_INDEX_0100
         * @tc.name: testIndexPageContent0001
         * @tc.desc: Verify index title, subtitle and nine navigation labels.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testIndexPageContent0001', 0, async (done: Function) => {
            await runCase('testIndexPageContent0001', async (): Promise<void> => {
                await waitId('TitleText');
                const title: string = await textOfId('TitleText');
                const subtitle: string = await textOfId('SubtitleText');
                const standard: string = await textOfId('NavStandard');
                const custom: string = await textOfId('NavCustom');
                const concurrency: string = await textOfId('NavConcurrency');
                const exception: string = await textOfId('NavException');
                const chromaticity: string = await textOfId('NavChromaticity');
                const difference: string = await textOfId('NavDifference');
                const conversion: string = await textOfId('NavConversion');
                const benchmark: string = await textOfId('NavBenchmark');
                const report: string = await textOfId('NavReport');
                await addLog(`testIndexPageContent0001: actual=${title}, expected=SendableColorSpace or 可共享色彩管理`);
                expect(matchesLocalizedText(title, 'SendableColorSpace', '可共享色彩管理')).assertTrue();
                await addLog(`testIndexPageContent0001: actual=${subtitle}, ` +
                  `expected English or Chinese sample subtitle`);
                expect(matchesLocalizedText(subtitle, 'Sendable Color Space Management Sample',
                  'Sendable 色域管理示例工程')).assertTrue();
                await addLog(`testIndexPageContent0001: actual=${standard}, expected=Standard Color Spaces or 标准色域`);
                expect(matchesLocalizedText(standard, 'Standard Color Spaces', '标准色域')).assertTrue();
                await addLog(`testIndexPageContent0001: actual=${custom}, expected=Custom Color Space or 自定义色域`);
                expect(matchesLocalizedText(custom, 'Custom Color Space', '自定义色域')).assertTrue();
                await addLog(`testIndexPageContent0001: actual=${concurrency}, expected=Concurrency Scenarios or 并发场景`);
                expect(matchesLocalizedText(concurrency, 'Concurrency Scenarios', '并发场景')).assertTrue();
                await addLog(`testIndexPageContent0001: actual=${exception}, expected=Exception Handling or 异常处理`);
                expect(matchesLocalizedText(exception, 'Exception Handling', '异常处理')).assertTrue();
                await addLog(`testIndexPageContent0001: actual=${chromaticity}, expected=Chromaticity Diagram or 色度图`);
                expect(matchesLocalizedText(chromaticity, 'Chromaticity Diagram', '色度图')).assertTrue();
                await addLog(`testIndexPageContent0001: actual=${difference}, expected=Color Difference or 色差计算`);
                expect(matchesLocalizedText(difference, 'Color Difference', '色差计算')).assertTrue();
                await addLog(`testIndexPageContent0001: actual=${conversion}, expected=Color Conversion or 色彩转换`);
                expect(matchesLocalizedText(conversion, 'Color Conversion', '色彩转换')).assertTrue();
                await addLog(`testIndexPageContent0001: actual=${benchmark}, expected=Concurrency Benchmark or 并发基准`);
                expect(matchesLocalizedText(benchmark, 'Concurrency Benchmark', '并发基准')).assertTrue();
                await addLog(`testIndexPageContent0001: actual=${report}, expected=Color Space Report or 色域报告`);
                expect(matchesLocalizedText(report, 'Color Space Report', '色域报告')).assertTrue();
            }, done);
        });

        // ==================== 四个首页入口（4 条） ====================

        /*
         * @tc.number: SUB_CS_INDEX_0200
         * @tc.name: testIndexNavigateStandard0001
         * @tc.desc: Open the standard page from index and return to the unchanged index title.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testIndexNavigateStandard0001', 0, async (done: Function) => {
            await runCase('testIndexNavigateStandard0001', async (): Promise<void> => {
                const source: string = await textOfId('NavStandard');
                await clickId('NavStandard');
                const target: string = await textOfId('StdPageTitle');
                await clickId('StdBtnBack');
                await waitId('TitleText');
                const returned: string = await textOfId('TitleText');
                await addLog(`testIndexNavigateStandard0001: actual=${source}, expected=Standard Color Spaces or 标准色域`);
                expect(matchesLocalizedText(source, 'Standard Color Spaces', '标准色域')).assertTrue();
                await addLog(`testIndexNavigateStandard0001: actual=${target}, expected=Standard Color Spaces`);
                expect(target).assertEqual('Standard Color Spaces');
                await addLog(`testIndexNavigateStandard0001: actual=${returned}, ` +
                  `expected=SendableColorSpace or 可共享色彩管理`);
                expect(matchesLocalizedText(returned, 'SendableColorSpace', '可共享色彩管理')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INDEX_0300
         * @tc.name: testIndexNavigateCustom0001
         * @tc.desc: Open the custom page from index and return to the unchanged index title.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testIndexNavigateCustom0001', 0, async (done: Function) => {
            await runCase('testIndexNavigateCustom0001', async (): Promise<void> => {
                const source: string = await textOfId('NavCustom');
                await clickId('NavCustom');
                const target: string = await textOfId('CustomPageTitle');
                await clickId('CustomBtnBack');
                await waitId('TitleText');
                const returned: string = await textOfId('TitleText');
                await addLog(`testIndexNavigateCustom0001: actual=${source}, expected=Custom Color Space or 自定义色域`);
                expect(matchesLocalizedText(source, 'Custom Color Space', '自定义色域')).assertTrue();
                await addLog(`testIndexNavigateCustom0001: actual=${target}, expected=Custom Color Space`);
                expect(target).assertEqual('Custom Color Space');
                await addLog(`testIndexNavigateCustom0001: actual=${returned}, expected=SendableColorSpace or 可共享色彩管理`);
                expect(matchesLocalizedText(returned, 'SendableColorSpace', '可共享色彩管理')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INDEX_0400
         * @tc.name: testIndexNavigateConcurrency0001
         * @tc.desc: Open the concurrency page from index and return to the unchanged index title.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testIndexNavigateConcurrency0001', 0, async (done: Function) => {
            await runCase('testIndexNavigateConcurrency0001', async (): Promise<void> => {
                const source: string = await textOfId('NavConcurrency');
                await clickId('NavConcurrency');
                const target: string = await textOfId('ConPageTitle');
                await clickId('ConBtnBack');
                await waitId('TitleText');
                const returned: string = await textOfId('TitleText');
                await addLog(`testIndexNavigateConcurrency0001: actual=${source}, ` +
                  `expected=Concurrency Scenarios or 并发场景`);
                expect(matchesLocalizedText(source, 'Concurrency Scenarios', '并发场景')).assertTrue();
                await addLog(`testIndexNavigateConcurrency0001: actual=${target}, expected=Concurrency Scenarios`);
                expect(target).assertEqual('Concurrency Scenarios');
                await addLog(`testIndexNavigateConcurrency0001: actual=${returned}, ` +
                  `expected=SendableColorSpace or 可共享色彩管理`);
                expect(matchesLocalizedText(returned, 'SendableColorSpace', '可共享色彩管理')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_INDEX_0500
         * @tc.name: testIndexNavigateException0001
         * @tc.desc: Open the exception page from index and return to the unchanged index title.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testIndexNavigateException0001', 0, async (done: Function) => {
            await runCase('testIndexNavigateException0001', async (): Promise<void> => {
                const source: string = await textOfId('NavException');
                await clickId('NavException');
                const target: string = await textOfId('ExcPageTitle');
                await clickId('ExcBtnBack');
                await waitId('TitleText');
                const returned: string = await textOfId('TitleText');
                await addLog(`testIndexNavigateException0001: actual=${source}, expected=Exception Handling or 异常处理`);
                expect(matchesLocalizedText(source, 'Exception Handling', '异常处理')).assertTrue();
                await addLog(`testIndexNavigateException0001: actual=${target}, expected=Exception Handling`);
                expect(target).assertEqual('Exception Handling');
                await addLog(`testIndexNavigateException0001: actual=${returned}, ` +
                  `expected=SendableColorSpace or 可共享色彩管理`);
                expect(matchesLocalizedText(returned, 'SendableColorSpace', '可共享色彩管理')).assertTrue();
            }, done);
        });
    });
}
