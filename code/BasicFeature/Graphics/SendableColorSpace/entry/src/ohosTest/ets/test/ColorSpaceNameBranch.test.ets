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
import { colorSpaceManager, sendableColorSpaceManager } from '@kit.ArkGraphics2D';
import { addLog, runCase } from '../testkit/SharedDriver';
import { getColorSpaceNameStr } from '../../../main/ets/common/ColorSpaceData';

// Enum value paired with the name the API contract requires the helper to return for it.
interface NameExpectation {
    enumValue: colorSpaceManager.ColorSpace;
    apiName: string;
}

const STANDARD_NAMES: NameExpectation[] = [
    { enumValue: colorSpaceManager.ColorSpace.SRGB, apiName: 'SRGB' },
    { enumValue: colorSpaceManager.ColorSpace.DISPLAY_P3, apiName: 'Display_P3' },
    { enumValue: colorSpaceManager.ColorSpace.DCI_P3, apiName: 'DCI_P3' },
    { enumValue: colorSpaceManager.ColorSpace.BT2020_HLG, apiName: 'BT2020_HLG' },
    { enumValue: colorSpaceManager.ColorSpace.BT2020_PQ, apiName: 'BT2020_PQ' },
    { enumValue: colorSpaceManager.ColorSpace.BT709, apiName: 'BT709' },
    { enumValue: colorSpaceManager.ColorSpace.ADOBE_RGB_1998, apiName: 'Adobe_RGB_1998' },
    { enumValue: colorSpaceManager.ColorSpace.LINEAR_SRGB, apiName: 'Linear_SRGB' }
];

const EXTENDED_NAMES: NameExpectation[] = [
    { enumValue: colorSpaceManager.ColorSpace.BT601_EBU, apiName: 'BT601_EBU' },
    { enumValue: colorSpaceManager.ColorSpace.BT601_SMPTE_C, apiName: 'BT601_SMPTE_C' },
    { enumValue: colorSpaceManager.ColorSpace.P3_HLG, apiName: 'P3_HLG' },
    { enumValue: colorSpaceManager.ColorSpace.P3_PQ, apiName: 'P3_PQ' },
    { enumValue: colorSpaceManager.ColorSpace.LINEAR_BT2020, apiName: 'Linear_BT2020' },
    { enumValue: colorSpaceManager.ColorSpace.H_LOG, apiName: 'H_LOG' },
    { enumValue: colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB, apiName: 'Display_BT2020_SRGB' }
];

const LIMIT_NAMES: NameExpectation[] = [
    { enumValue: colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT, apiName: 'Adobe_RGB_1998_Limit' },
    { enumValue: colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT, apiName: 'Display_P3_Limit' },
    { enumValue: colorSpaceManager.ColorSpace.SRGB_LIMIT, apiName: 'SRGB_Limit' },
    { enumValue: colorSpaceManager.ColorSpace.BT709_LIMIT, apiName: 'BT709_Limit' },
    { enumValue: colorSpaceManager.ColorSpace.BT601_EBU_LIMIT, apiName: 'BT601_EBU_Limit' },
    { enumValue: colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT, apiName: 'BT601_SMPTE_C_Limit' },
    { enumValue: colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT, apiName: 'BT2020_HLG_Limit' },
    { enumValue: colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT, apiName: 'BT2020_PQ_Limit' },
    { enumValue: colorSpaceManager.ColorSpace.P3_HLG_LIMIT, apiName: 'P3_HLG_Limit' },
    { enumValue: colorSpaceManager.ColorSpace.P3_PQ_LIMIT, apiName: 'P3_PQ_Limit' },
    { enumValue: colorSpaceManager.ColorSpace.LINEAR_P3, apiName: 'Linear_P3' }
];

// Resolve one enum through the platform first, so the check follows the value the system really reports.
function resolveName(entry: NameExpectation): string {
    const manager: sendableColorSpaceManager.ColorSpaceManager = sendableColorSpaceManager.create(entry.enumValue);
    return getColorSpaceNameStr(manager.getColorSpaceName());
}

function countMatches(entries: NameExpectation[]): number {
    let matched: number = 0;
    for (let i = 0; i < entries.length; i++) {
        if (resolveName(entries[i]) === entries[i].apiName) {
            matched++;
        }
    }
    return matched;
}

function collectMismatches(entries: NameExpectation[]): string {
    let details: string = '';
    for (let i = 0; i < entries.length; i++) {
        const actual: string = resolveName(entries[i]);
        if (actual !== entries[i].apiName) {
            details = details + entries[i].apiName + '=>' + actual + '; ';
        }
    }
    return details;
}

export default function colorSpaceNameBranchTest(): void {
    describe('ColorSpaceNameBranch', () => {

        /*
         * @tc.number: SUB_CS_NAME_0101
         * @tc.name: testStandardNameBranch0001
         * @tc.desc: Check every standard range branch resolves to the documented API name.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testStandardNameBranch0001', 0, async (done: Function) => {
            await runCase('testStandardNameBranch0001', async (): Promise<void> => {
                const matched: number = countMatches(STANDARD_NAMES);
                const mismatches: string = collectMismatches(STANDARD_NAMES);
                await addLog(`testStandardNameBranch0001: matched=${matched}, expected=${STANDARD_NAMES.length}`);
                expect(matched).assertEqual(STANDARD_NAMES.length);
                await addLog(`testStandardNameBranch0001: mismatches=${mismatches}, expected empty`);
                expect(mismatches).assertEqual('');
                await addLog(`testStandardNameBranch0001: table covers the 8 standard entries`);
                expect(STANDARD_NAMES.length).assertEqual(8);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_NAME_0102
         * @tc.name: testExtendedNameBranch0001
         * @tc.desc: Check every extended range branch resolves to the documented API name.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testExtendedNameBranch0001', 0, async (done: Function) => {
            await runCase('testExtendedNameBranch0001', async (): Promise<void> => {
                const matched: number = countMatches(EXTENDED_NAMES);
                const mismatches: string = collectMismatches(EXTENDED_NAMES);
                await addLog(`testExtendedNameBranch0001: matched=${matched}, expected=${EXTENDED_NAMES.length}`);
                expect(matched).assertEqual(EXTENDED_NAMES.length);
                await addLog(`testExtendedNameBranch0001: mismatches=${mismatches}, expected empty`);
                expect(mismatches).assertEqual('');
                await addLog(`testExtendedNameBranch0001: table covers the 7 extended entries`);
                expect(EXTENDED_NAMES.length).assertEqual(7);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_NAME_0103
         * @tc.name: testLimitNameBranch0001
         * @tc.desc: Check every limit range branch resolves to the documented API name.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testLimitNameBranch0001', 0, async (done: Function) => {
            await runCase('testLimitNameBranch0001', async (): Promise<void> => {
                const matched: number = countMatches(LIMIT_NAMES);
                const mismatches: string = collectMismatches(LIMIT_NAMES);
                await addLog(`testLimitNameBranch0001: matched=${matched}, expected=${LIMIT_NAMES.length}`);
                expect(matched).assertEqual(LIMIT_NAMES.length);
                await addLog(`testLimitNameBranch0001: mismatches=${mismatches}, expected empty`);
                expect(mismatches).assertEqual('');
                await addLog(`testLimitNameBranch0001: table covers the 11 limit entries`);
                expect(LIMIT_NAMES.length).assertEqual(11);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_NAME_0104
         * @tc.name: testFallbackNameBranch0001
         * @tc.desc: Check the custom branch returns its name and an unmapped enum falls back to the numeric form.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testFallbackNameBranch0001', 0, async (done: Function) => {
            await runCase('testFallbackNameBranch0001', async (): Promise<void> => {
                const customName: string = getColorSpaceNameStr(colorSpaceManager.ColorSpace.CUSTOM);
                const unknownName: string = getColorSpaceNameStr(colorSpaceManager.ColorSpace.UNKNOWN);
                const srgbName: string = getColorSpaceNameStr(colorSpaceManager.ColorSpace.SRGB);
                const unknownExpected: string = `Unknown(${String(colorSpaceManager.ColorSpace.UNKNOWN)})`;
                await addLog(`testFallbackNameBranch0001: actual custom=${customName}, expected=Custom`);
                expect(customName).assertEqual('Custom');
                await addLog(`testFallbackNameBranch0001: actual unknown=${unknownName}, expected=${unknownExpected}`);
                expect(unknownName).assertEqual(unknownExpected);
                await addLog(`testFallbackNameBranch0001: actual srgb=${srgbName}, expected SRGB is not the fallback`);
                expect(srgbName === unknownExpected).assertFalse();
            }, done);
        });
    });
}
