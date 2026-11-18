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
import {
    ColorSpaceInfo,
    STANDARD_COLOR_SPACES,
    EXTENDED_COLOR_SPACES,
    LIMIT_COLOR_SPACES,
    getAllColorSpaces
} from '../common/ColorSpaceData';
import { Primaries, AreaComparison, primariesOf, relativeArea } from '../common/ColorSpaceMath';

const TAG = '[ColorSpaceReport]';
const BTN_H = 38;
const TOP_COUNT = 3;

// One line of the report, kept as a value object so sorting never touches the metadata table.
interface ReportRow {
    label: string;
    area: number;
    ratio: number;
    covers: boolean;
}

@Entry
@Component
struct ColorSpaceReport {
    @State rows: string[] = [];
    @State countInfo: string = '';
    @State summaryInfo: string = '';
    @State topInfo: string = '';
    @State filterName: string = 'All';
    @State descending: boolean = true;
    private reference: Primaries = primariesOf(STANDARD_COLOR_SPACES[0]);

    aboutToAppear(): void {
        Logger.info(TAG, 'aboutToAppear');
        this.generate();
    }

    goBack(): void {
        router.back();
    }

    sourceOf(filterName: string): ColorSpaceInfo[] {
        if (filterName === 'Standard') {
            return STANDARD_COLOR_SPACES;
        }
        if (filterName === 'Extended') {
            return EXTENDED_COLOR_SPACES;
        }
        if (filterName === 'Limit') {
            return LIMIT_COLOR_SPACES;
        }
        return getAllColorSpaces();
    }

    // Build the row values for the current filter, then sort them by gamut area.
    buildRows(source: ColorSpaceInfo[]): ReportRow[] {
        let values: ReportRow[] = [];
        for (let i = 0; i < source.length; i++) {
            let comparison: AreaComparison = relativeArea(primariesOf(source[i]), this.reference);
            let row: ReportRow = {
                label: source[i].label,
                area: comparison.area,
                ratio: comparison.ratioToReference,
                covers: comparison.containsReference
            };
            values.push(row);
        }
        values.sort((first: ReportRow, second: ReportRow) => {
            if (first.area !== second.area) {
                if (this.descending) {
                    return second.area - first.area;
                }
                return first.area - second.area;
            }
            // Several spaces share identical primaries, so the label keeps every ordering stable.
            if (first.label < second.label) {
                return -1;
            }
            return first.label > second.label ? 1 : 0;
        });
        return values;
    }

    generate(): void {
        let source: ColorSpaceInfo[] = this.sourceOf(this.filterName);
        let values: ReportRow[] = this.buildRows(source);
        let lines: string[] = [];
        let total: number = 0;
        let widest: ReportRow = values[0];
        let narrowest: ReportRow = values[0];
        for (let i = 0; i < values.length; i++) {
            let row: ReportRow = values[i];
            total += row.area;
            lines.push(`${i + 1} ${row.label} area=${row.area.toFixed(4)} ratio=${row.ratio.toFixed(3)} ` +
                `covers=${row.covers ? 'YES' : 'NO'}`);
            if (row.area > widest.area) {
                widest = row;
            }
            if (row.area < narrowest.area) {
                narrowest = row;
            }
        }
        let topLabels: string = '';
        for (let i = 0; i < values.length && i < TOP_COUNT; i++) {
            topLabels = i === 0 ? values[i].label : `${topLabels},${values[i].label}`;
        }
        this.rows = lines;
        this.countInfo = `Rows:${values.length} Filter:${this.filterName}`;
        this.summaryInfo = `Widest:${widest.label}(${widest.area.toFixed(4)}) ` +
            `Narrowest:${narrowest.label}(${narrowest.area.toFixed(4)}) Total:${total.toFixed(4)}`;
        this.topInfo = `Top:${topLabels}`;
        Logger.info(TAG, `${this.countInfo} ${this.summaryInfo}`);
    }

    selectFilter(filterName: string): void {
        this.filterName = filterName;
        this.descending = true;
        this.generate();
        Logger.info(TAG, `Filter changed to ${filterName}`);
    }

    toggleOrder(): void {
        this.descending = !this.descending;
        this.generate();
        Logger.info(TAG, `Order changed, descending=${this.descending}`);
    }

    resetAll(): void {
        this.filterName = 'All';
        this.descending = true;
        this.generate();
        Logger.info(TAG, 'Reset report to all spaces sorted by area');
    }

    build() {
        Scroll() {
            Column({ space: 8 }) {
                Row() {
                    Button('< Back')
                        .id('ReportBtnBack')
                        .fontSize(14)
                        .height(36)
                        .onClick(() => {
                            this.goBack();
                        })
                    Text('Color Space Report')
                        .id('ReportPageTitle')
                        .fontSize(18)
                        .fontWeight(FontWeight.Bold)
                        .margin({ left: 12 })
                }
                .width('100%')
                .margin({ top: 12 })
                .padding({ left: 12, right: 12 })

                Text(this.countInfo)
                    .id('ReportCountText')
                    .fontSize(12)
                    .fontColor('#666666')

                Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
                    Button('All')
                        .id('ReportFilterAll')
                        .fontSize(11)
                        .height(30)
                        .margin(2)
                        .backgroundColor(this.filterName === 'All' ? '#4285F4' : '#E8E8E8')
                        .fontColor(this.filterName === 'All' ? '#FFFFFF' : '#333333')
                        .onClick(() => {
                            this.selectFilter('All');
                        })
                    Button('Standard')
                        .id('ReportFilterStandard')
                        .fontSize(11)
                        .height(30)
                        .margin(2)
                        .backgroundColor(this.filterName === 'Standard' ? '#4285F4' : '#E8E8E8')
                        .fontColor(this.filterName === 'Standard' ? '#FFFFFF' : '#333333')
                        .onClick(() => {
                            this.selectFilter('Standard');
                        })
                    Button('Extended')
                        .id('ReportFilterExtended')
                        .fontSize(11)
                        .height(30)
                        .margin(2)
                        .backgroundColor(this.filterName === 'Extended' ? '#4285F4' : '#E8E8E8')
                        .fontColor(this.filterName === 'Extended' ? '#FFFFFF' : '#333333')
                        .onClick(() => {
                            this.selectFilter('Extended');
                        })
                    Button('Limit')
                        .id('ReportFilterLimit')
                        .fontSize(11)
                        .height(30)
                        .margin(2)
                        .backgroundColor(this.filterName === 'Limit' ? '#4285F4' : '#E8E8E8')
                        .fontColor(this.filterName === 'Limit' ? '#FFFFFF' : '#333333')
                        .onClick(() => {
                            this.selectFilter('Limit');
                        })
                }
                .id('ReportFilterList')
                .width('95%')

                Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                    Button('Regenerate')
                        .id('ReportBtnGenerate')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.generate();
                        })
                    Button(this.descending ? 'Wide first' : 'Narrow first')
                        .id('ReportBtnSort')
                        .width('34%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.toggleOrder();
                        })
                    Button('Reset')
                        .id('ReportBtnReset')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.resetAll();
                        })
                }
                .width('95%')

                Text(this.summaryInfo)
                    .id('ReportSummaryText')
                    .width('92%')
                    .fontSize(11)
                    .fontColor('#333333')
                    .backgroundColor('#F5F5F5')
                    .padding(8)
                    .borderRadius(8)

                Text(this.topInfo)
                    .id('ReportTopText')
                    .width('92%')
                    .fontSize(11)
                    .fontColor('#333333')
                    .backgroundColor('#F0F8FF')
                    .padding(8)
                    .borderRadius(8)

                List({ space: 2 }) {
                    ForEach(this.rows, (row: string, index: number) => {
                        ListItem() {
                            Text(row)
                                .id(`ReportRow${index}`)
                                .fontSize(9)
                                .fontColor('#333333')
                                .width('100%')
                        }
                    }, (row: string, index: number) => `${index}-${row}`)
                }
                .id('ReportList')
                .width('92%')
                .height(320)
                .backgroundColor('#FAFAFA')
                .borderRadius(8)
                .padding(8)
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
