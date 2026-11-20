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

import { router } from '@kit.ArkUI';
import Logger from '../utils/Logger';

const TAG = '[Sample_SendableColorSpace]';

@Entry
@Component
struct Index {
    onNavigate(targetUrl: string): void {
        router.pushUrl({ url: targetUrl }, router.RouterMode.Standard, (err) => {
            if (err) {
                Logger.error(TAG, `Navigation failed: code=${err.code}, message=${err.message}`);
                return;
            }
            Logger.info(TAG, `Navigated to ${targetUrl}`);
        });
    }

    build() {
        Scroll() {
            Column({ space: 16 }) {
                Text($r('app.string.page_title'))
                    .id('TitleText')
                    .fontSize(24)
                    .fontWeight(FontWeight.Bold)
                    .margin({ top: 60 })

                Text($r('app.string.page_subtitle'))
                    .id('SubtitleText')
                    .fontSize(14)
                    .fontColor('#666666')
                    .margin({ top: -8 })

                Button($r('app.string.nav_standard'))
                    .id('NavStandard')
                    .width('60%')
                    .height(48)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .onClick(() => {
                        this.onNavigate('pages/StandardColorSpace');
                    })

                Button($r('app.string.nav_custom'))
                    .id('NavCustom')
                    .width('60%')
                    .height(48)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .onClick(() => {
                        this.onNavigate('pages/CustomColorSpace');
                    })

                Button($r('app.string.nav_concurrency'))
                    .id('NavConcurrency')
                    .width('60%')
                    .height(48)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .onClick(() => {
                        this.onNavigate('pages/Concurrency');
                    })

                Button($r('app.string.nav_exception'))
                    .id('NavException')
                    .width('60%')
                    .height(48)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .onClick(() => {
                        this.onNavigate('pages/ExceptionTest');
                    })

                Button($r('app.string.nav_chromaticity'))
                    .id('NavChromaticity')
                    .width('60%')
                    .height(48)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .onClick(() => {
                        this.onNavigate('pages/ChromaticityDiagram');
                    })

                Button($r('app.string.nav_difference'))
                    .id('NavDifference')
                    .width('60%')
                    .height(48)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .onClick(() => {
                        this.onNavigate('pages/ColorDifference');
                    })

                Button($r('app.string.nav_conversion'))
                    .id('NavConversion')
                    .width('60%')
                    .height(48)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .onClick(() => {
                        this.onNavigate('pages/ColorConversion');
                    })

                Button($r('app.string.nav_benchmark'))
                    .id('NavBenchmark')
                    .width('60%')
                    .height(48)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .onClick(() => {
                        this.onNavigate('pages/ConcurrencyBenchmark');
                    })

                Button($r('app.string.nav_report'))
                    .id('NavReport')
                    .width('60%')
                    .height(48)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .onClick(() => {
                        this.onNavigate('pages/ColorSpaceReport');
                    })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Center)
            .padding({ bottom: 24 })
        }
        .width('100%')
        .height('100%')
        .scrollBar(BarState.Auto)
    }
}
