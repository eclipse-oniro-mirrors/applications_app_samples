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
import {
    runCase,
    addLog,
    isCloseTo,
    numberAfter,
    resetToIndex,
    navigateToReport,
    clickId,
    textOfId,
    existsId
} from '../testkit/SharedDriver';

const INDEX_TITLE_ID = 'TitleText';
const REPORT_PAGE_TITLE_ID = 'ReportPageTitle';
const ALL_ROWS = 26;
const STANDARD_ROWS = 8;
const EXTENDED_ROWS = 7;
const LIMIT_ROWS = 11;
// Sum of the gamut areas of all 26 entries, each area rounded only at print time.
const TOTAL_AREA = 3.9959;

export default function colorSpaceReportTest(): void {
    describe('ColorSpaceReportTest', () => {

        /*
         * @tc.number: SUB_CS_REPORT_0001
         * @tc.name: testReportNavigate0001
         * @tc.desc: Verify the report opens with every space listed and the widest gamut named.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testReportNavigate0001', 0, async (done: Function) => {
            await runCase('testReportNavigate0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToReport();
                const title: string = await textOfId(REPORT_PAGE_TITLE_ID);
                await addLog(`testReportNavigate0001: actual title=${title}, expected=Color Space Report`);
                expect(title).assertEqual('Color Space Report');
                const count: string = await textOfId('ReportCountText');
                await addLog(`testReportNavigate0001: actual count=${count}, expected=Rows:26 Filter:All`);
                expect(count).assertEqual('Rows:26 Filter:All');
                const summary: string = await textOfId('ReportSummaryText');
                await addLog(`testReportNavigate0001: actual summary=${summary}, expected widest BT2020_HLG`);
                expect(summary.includes('Widest:BT2020_HLG(0.2119)')).assertTrue();
                const top: string = await textOfId('ReportTopText');
                await addLog(`testReportNavigate0001: actual top=${top}, expected three widest labels`);
                expect(top).assertEqual('Top:BT2020_HLG,BT2020_HLG_Limit,BT2020_PQ');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_REPORT_0002
         * @tc.name: testReportDefaultOrder0001
         * @tc.desc: Verify the first row of the default ordering is the widest gamut with its ratio and cover flag.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testReportDefaultOrder0001', 0, async (done: Function) => {
            await runCase('testReportDefaultOrder0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToReport();
                const firstRow: string = await textOfId('ReportRow0');
                await addLog(`testReportDefaultOrder0001: actual first row=${firstRow}, expected BT2020_HLG`);
                expect(firstRow.startsWith('1 BT2020_HLG ')).assertTrue();
                await addLog(`testReportDefaultOrder0001: actual first row=${firstRow}, expected area=0.2119`);
                expect(firstRow.includes('area=0.2119')).assertTrue();
                await addLog(`testReportDefaultOrder0001: actual first row=${firstRow}, expected ratio=1.891`);
                expect(firstRow.includes('ratio=1.891')).assertTrue();
                await addLog(`testReportDefaultOrder0001: actual first row=${firstRow}, expected covers=YES`);
                expect(firstRow.includes('covers=YES')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_REPORT_0003
         * @tc.name: testReportAscending0001
         * @tc.desc: Verify the sort button reverses the order so the narrowest gamut leads the list.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testReportAscending0001', 0, async (done: Function) => {
            await runCase('testReportAscending0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToReport();
                await clickId('ReportBtnSort');
                const label: string = await textOfId('ReportBtnSort');
                await addLog(`testReportAscending0001: actual sort button=${label}, expected=Narrow first`);
                expect(label).assertEqual('Narrow first');
                const firstRow: string = await textOfId('ReportRow0');
                await addLog(`testReportAscending0001: actual first row=${firstRow}, expected BT601_SMPTE_C`);
                expect(firstRow.startsWith('1 BT601_SMPTE_C ')).assertTrue();
                await addLog(`testReportAscending0001: actual first row=${firstRow}, expected area=0.1038`);
                expect(firstRow.includes('area=0.1038')).assertTrue();
                await addLog(`testReportAscending0001: actual first row=${firstRow}, expected ratio=0.926`);
                expect(firstRow.includes('ratio=0.926')).assertTrue();
                await addLog(`testReportAscending0001: actual first row=${firstRow}, expected covers=NO`);
                expect(firstRow.includes('covers=NO')).assertTrue();
                const count: string = await textOfId('ReportCountText');
                await addLog(`testReportAscending0001: actual count=${count}, expected all 26 rows kept`);
                expect(count).assertEqual('Rows:26 Filter:All');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_REPORT_0004
         * @tc.name: testReportStandardOnly0001
         * @tc.desc: Verify the standard filter keeps only the eight full range standard spaces.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testReportStandardOnly0001', 0, async (done: Function) => {
            await runCase('testReportStandardOnly0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToReport();
                await clickId('ReportFilterStandard');
                const count: string = await textOfId('ReportCountText');
                await addLog(`testReportStandardOnly0001: actual count=${count}, expected=Rows:8 Filter:Standard`);
                expect(count).assertEqual('Rows:8 Filter:Standard');
                const summary: string = await textOfId('ReportSummaryText');
                await addLog(`testReportStandardOnly0001: actual summary=${summary}, expected widest BT2020_HLG`);
                expect(summary.includes('Widest:BT2020_HLG(0.2119)')).assertTrue();
                // The narrowest standard space is one of the three sRGB derived entries, which share the 0.1121 area.
                const narrowest: string = summary.substring(summary.indexOf('Narrowest:'));
                await addLog(`testReportStandardOnly0001: actual narrowest=${narrowest}, expected area 0.1121`);
                expect(narrowest.includes('(0.1121)')).assertTrue();
                const firstRow: string = await textOfId('ReportRow0');
                await addLog(`testReportStandardOnly0001: actual first row=${firstRow}, expected eight row report`);
                expect(firstRow.startsWith('1 ')).assertTrue();
                await addLog(`testReportStandardOnly0001: actual first row=${firstRow}, expected area=0.2119`);
                expect(firstRow.includes('area=0.2119')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_REPORT_0005
         * @tc.name: testReportExtendedOnly0001
         * @tc.desc: Verify the extended filter reports seven rows and names its own widest entry.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testReportExtendedOnly0001', 0, async (done: Function) => {
            await runCase('testReportExtendedOnly0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToReport();
                await clickId('ReportFilterExtended');
                const count: string = await textOfId('ReportCountText');
                await addLog(`testReportExtendedOnly0001: actual count=${count}, expected=Rows:7 Filter:Extended`);
                expect(count).assertEqual('Rows:7 Filter:Extended');
                const summary: string = await textOfId('ReportSummaryText');
                await addLog(`testReportExtendedOnly0001: actual summary=${summary}, expected widest Display_BT2020`);
                expect(summary.includes('Widest:Display_BT2020(0.2119)')).assertTrue();
                await addLog(`testReportExtendedOnly0001: actual summary=${summary}, expected narrowest SMPTE_C`);
                expect(summary.includes('Narrowest:BT601_SMPTE_C(0.1038)')).assertTrue();
                const top: string = await textOfId('ReportTopText');
                await addLog(`testReportExtendedOnly0001: actual top=${top}, expected three BT2020 labels`);
                expect(top).assertEqual('Top:Display_BT2020,H_LOG,Linear_BT2020');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_REPORT_0006
         * @tc.name: testReportLimitOnly0001
         * @tc.desc: Verify the limit filter reports the eleven limited range spaces and their extremes.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testReportLimitOnly0001', 0, async (done: Function) => {
            await runCase('testReportLimitOnly0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToReport();
                await clickId('ReportFilterLimit');
                const count: string = await textOfId('ReportCountText');
                await addLog(`testReportLimitOnly0001: actual count=${count}, expected=Rows:11 Filter:Limit`);
                expect(count).assertEqual('Rows:11 Filter:Limit');
                const summary: string = await textOfId('ReportSummaryText');
                await addLog(`testReportLimitOnly0001: actual summary=${summary}, expected widest BT2020_HLG_Limit`);
                expect(summary.includes('Widest:BT2020_HLG_Limit(0.2119)')).assertTrue();
                await addLog(`testReportLimitOnly0001: actual summary=${summary}, expected narrowest SMPTE_Limit`);
                expect(summary.includes('Narrowest:BT601_SMPTE_Limit(0.1038)')).assertTrue();
                const firstRow: string = await textOfId('ReportRow0');
                await addLog(`testReportLimitOnly0001: actual first row=${firstRow}, expected widest limit entry`);
                expect(firstRow.startsWith('1 BT2020_HLG_Limit ')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_REPORT_0007
         * @tc.name: testReportReset0001
         * @tc.desc: Verify reset returns to every space and the total area of the whole catalogue.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testReportReset0001', 0, async (done: Function) => {
            await runCase('testReportReset0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToReport();
                await clickId('ReportFilterLimit');
                const filtered: string = await textOfId('ReportCountText');
                await addLog(`testReportReset0001: actual count after limit filter=${filtered}, expected 11 rows`);
                expect(filtered).assertEqual('Rows:11 Filter:Limit');
                await clickId('ReportBtnReset');
                const count: string = await textOfId('ReportCountText');
                await addLog(`testReportReset0001: actual count after reset=${count}, expected=Rows:26 Filter:All`);
                expect(count).assertEqual('Rows:26 Filter:All');
                const summary: string = await textOfId('ReportSummaryText');
                const total: number = numberAfter(summary, 'Total:');
                await addLog(`testReportReset0001: actual total=${total}, expected=${TOTAL_AREA}`);
                expect(isCloseTo(total, TOTAL_AREA, 0.001)).assertTrue();
                await addLog(`testReportReset0001: actual summary=${summary}, expected narrowest SMPTE_C`);
                expect(summary.includes('Narrowest:BT601_SMPTE_C(0.1038)')).assertTrue();
                const label: string = await textOfId('ReportBtnSort');
                await addLog(`testReportReset0001: actual sort button=${label}, expected=Wide first`);
                expect(label).assertEqual('Wide first');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_REPORT_0008
         * @tc.name: testReportBack0001
         * @tc.desc: Verify the back button returns to the index page and keeps the report entry available.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testReportBack0001', 0, async (done: Function) => {
            await runCase('testReportBack0001', async (): Promise<void> => {
                await resetToIndex();
                await navigateToReport();
                await clickId('ReportBtnBack');
                const indexVisible: boolean = await existsId(INDEX_TITLE_ID);
                await addLog(`testReportBack0001: actual index title visible=${indexVisible}, expected=true`);
                expect(indexVisible).assertTrue();
                const reportGone: boolean = await existsId(REPORT_PAGE_TITLE_ID);
                await addLog(`testReportBack0001: actual report title visible=${reportGone}, expected=false`);
                expect(reportGone).assertFalse();
                const entryVisible: boolean = await existsId('NavReport');
                await addLog(`testReportBack0001: actual report entry visible=${entryVisible}, expected=true`);
                expect(entryVisible).assertTrue();
            }, done);
        });
    });
}
