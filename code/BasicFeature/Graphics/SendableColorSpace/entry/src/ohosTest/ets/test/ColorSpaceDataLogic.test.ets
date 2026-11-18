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
import { runCase, addLog } from '../testkit/SharedDriver';
import {
    STANDARD_COLOR_SPACES, EXTENDED_COLOR_SPACES, LIMIT_COLOR_SPACES,
    getAllColorSpaces, getColorSpaceNameStr, findColorSpaceInfo, ColorSpaceInfo
} from '../../../main/ets/common/ColorSpaceData';
import { ColorSpaceResult } from '../../../main/ets/sendable/ColorSpaceResult';

export default function colorSpaceDataLogicTest(): void {
    describe('ColorSpaceDataLogicTest', () => {

        // ==================== 数据数量与合并顺序（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_0100
         * @tc.name: testDataStructure0001
         * @tc.desc: Verify color space counts and merged group boundaries.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDataStructure0001', 0, async (done: Function) => {
            await runCase('testDataStructure0001', async (): Promise<void> => {
                const all: ColorSpaceInfo[] = getAllColorSpaces();
                await addLog(`testDataStructure0001: actual standard count=${STANDARD_COLOR_SPACES.length}, ` +
                  `expected=8`);
                expect(STANDARD_COLOR_SPACES.length).assertEqual(8);
                await addLog(`testDataStructure0001: actual extended count=${EXTENDED_COLOR_SPACES.length}, ` +
                  `expected=7`);
                expect(EXTENDED_COLOR_SPACES.length).assertEqual(7);
                await addLog(`testDataStructure0001: actual limit count=${LIMIT_COLOR_SPACES.length}, expected=11`);
                expect(LIMIT_COLOR_SPACES.length).assertEqual(11);
                await addLog(`testDataStructure0001: actual merged count=${all.length}, expected=26`);
                expect(all.length).assertEqual(26);
                await addLog(`testDataStructure0001: actual first=${all[0].label}, expected=SRGB`);
                expect(all[0].label).assertEqual('SRGB');
                await addLog(`testDataStructure0001: actual extended first=${all[8].label}, expected=BT601_EBU`);
                expect(all[8].label).assertEqual('BT601_EBU');
                await addLog(`testDataStructure0001: actual limit first=${all[15].label}, expected=Adobe_RGB_Limit`);
                expect(all[15].label).assertEqual('Adobe_RGB_Limit');
                await addLog(`testDataStructure0001: actual last=${all[25].label}, expected=Linear_P3`);
                expect(all[25].label).assertEqual('Linear_P3');
            }, done);
        });

        // ==================== 全量名称精确映射（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_0200
         * @tc.name: testNameMapping0001
         * @tc.desc: Verify exact API names for all color space entries.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testNameMapping0001', 0, async (done: Function) => {
            await runCase('testNameMapping0001', async (): Promise<void> => {
                const all: ColorSpaceInfo[] = getAllColorSpaces();
                const expectedNames: string[] = [
                    'SRGB', 'Display_P3', 'DCI_P3', 'BT2020_HLG', 'BT2020_PQ', 'BT709',
                    'Adobe_RGB_1998', 'Linear_SRGB', 'BT601_EBU', 'BT601_SMPTE_C', 'P3_HLG',
                    'P3_PQ', 'Linear_BT2020', 'H_LOG', 'Display_BT2020_SRGB', 'Adobe_RGB_1998_Limit',
                    'Display_P3_Limit', 'SRGB_Limit', 'BT709_Limit', 'BT601_EBU_Limit',
                    'BT601_SMPTE_C_Limit', 'BT2020_HLG_Limit', 'BT2020_PQ_Limit', 'P3_HLG_Limit',
                    'P3_PQ_Limit', 'Linear_P3'
                ];
                let matchedNames: number = 0;
                let unknownNames: number = 0;
                for (let i = 0; i < all.length; i++) {
                    const actual: string = getColorSpaceNameStr(all[i].enumValue);
                    await addLog(`testNameMapping0001: entry=${all[i].label}, actual=${actual}, ` +
                      `expected=${expectedNames[i]}`);
                    expect(actual).assertEqual(expectedNames[i]);
                    if (actual === expectedNames[i]) {
                        matchedNames++;
                    }
                    if (actual.includes('Unknown')) {
                        unknownNames++;
                    }
                }
                await addLog(`testNameMapping0001: actual matched=${matchedNames}, expected=26`);
                expect(matchedNames).assertEqual(26);
                await addLog(`testNameMapping0001: actual unknown=${unknownNames}, expected=0`);
                expect(unknownNames).assertEqual(0);
                await addLog(`testNameMapping0001: actual expected count=${expectedNames.length}, expected=26`);
                expect(expectedNames.length).assertEqual(26);
            }, done);
        });

        // ==================== 查找覆盖与空结果（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_0300
         * @tc.name: testFindColorSpaceInfo0001
         * @tc.desc: Verify every configured enum is found and unsupported enums return null.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testFindColorSpaceInfo0001', 0, async (done: Function) => {
            await runCase('testFindColorSpaceInfo0001', async (): Promise<void> => {
                const all: ColorSpaceInfo[] = getAllColorSpaces();
                let foundCount: number = 0;
                let mismatchCount: number = 0;
                for (let i = 0; i < all.length; i++) {
                    const found: ColorSpaceInfo | null = findColorSpaceInfo(all[i].enumValue);
                    if (found !== null) {
                        foundCount++;
                        if (found.label !== all[i].label || found.gamma !== all[i].gamma) {
                            mismatchCount++;
                        }
                    } else {
                        mismatchCount++;
                    }
                }
                const unknownResult: ColorSpaceInfo | null =
                    findColorSpaceInfo(colorSpaceManager.ColorSpace.UNKNOWN);
                const customResult: ColorSpaceInfo | null =
                    findColorSpaceInfo(colorSpaceManager.ColorSpace.CUSTOM);
                await addLog(`testFindColorSpaceInfo0001: actual found=${foundCount}, expected=26`);
                expect(foundCount).assertEqual(26);
                await addLog(`testFindColorSpaceInfo0001: actual mismatches=${mismatchCount}, expected=0`);
                expect(mismatchCount).assertEqual(0);
                await addLog('testFindColorSpaceInfo0001: actual UNKNOWN lookup, expected=null');
                expect(unknownResult).assertNull();
                await addLog('testFindColorSpaceInfo0001: actual CUSTOM lookup, expected=null');
                expect(customResult).assertNull();
            }, done);
        });

        // ==================== 枚举别名（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_0400
         * @tc.name: testAliasEnumValues0001
         * @tc.desc: Verify enum aliases match their canonical color spaces.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testAliasEnumValues0001', 0, async (done: Function) => {
            await runCase('testAliasEnumValues0001', async (): Promise<void> => {
                await addLog('testAliasEnumValues0001: actual DISPLAY_SRGB, expected=SRGB');
                expect(colorSpaceManager.ColorSpace.DISPLAY_SRGB).assertEqual(colorSpaceManager.ColorSpace.SRGB);
                await addLog('testAliasEnumValues0001: actual DISPLAY_P3_SRGB, expected=DISPLAY_P3');
                expect(colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB)
                    .assertEqual(colorSpaceManager.ColorSpace.DISPLAY_P3);
                await addLog('testAliasEnumValues0001: actual DISPLAY_P3_HLG, expected=P3_HLG');
                expect(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG).assertEqual(colorSpaceManager.ColorSpace.P3_HLG);
                await addLog('testAliasEnumValues0001: actual DISPLAY_P3_PQ, expected=P3_PQ');
                expect(colorSpaceManager.ColorSpace.DISPLAY_P3_PQ).assertEqual(colorSpaceManager.ColorSpace.P3_PQ);
                await addLog('testAliasEnumValues0001: actual LINEAR_BT709, expected=LINEAR_SRGB');
                expect(colorSpaceManager.ColorSpace.LINEAR_BT709).assertEqual(colorSpaceManager.ColorSpace.LINEAR_SRGB);
            }, done);
        });

        // ==================== 全量坐标与 Gamma 范围（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_0500
         * @tc.name: testChromaticityRange0001
         * @tc.desc: Verify every coordinate and gamma stays in its valid range.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testChromaticityRange0001', 0, async (done: Function) => {
            await runCase('testChromaticityRange0001', async (): Promise<void> => {
                const all: ColorSpaceInfo[] = getAllColorSpaces();
                let invalidCoordinates: number = 0;
                let invalidGammas: number = 0;
                for (let i = 0; i < all.length; i++) {
                    const info: ColorSpaceInfo = all[i];
                    const coordinates: number[] = [
                        info.redX, info.redY, info.greenX, info.greenY,
                        info.blueX, info.blueY, info.whiteX, info.whiteY
                    ];
                    for (let j = 0; j < coordinates.length; j++) {
                        if (coordinates[j] < 0 || coordinates[j] > 1) {
                            invalidCoordinates++;
                        }
                    }
                    if (info.gamma <= 0 || info.gamma > 10) {
                        invalidGammas++;
                    }
                }
                await addLog(`testChromaticityRange0001: actual entries=${all.length}, expected=26`);
                expect(all.length).assertEqual(26);
                await addLog(`testChromaticityRange0001: actual invalid coordinates=${invalidCoordinates}, expected=0`);
                expect(invalidCoordinates).assertEqual(0);
                await addLog(`testChromaticityRange0001: actual invalid gammas=${invalidGammas}, expected=0`);
                expect(invalidGammas).assertEqual(0);
            }, done);
        });

        // ==================== 代表色域精确数据（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_0600
         * @tc.name: testStandardExactValues0001
         * @tc.desc: Verify exact SRGB primaries and DCI P3 white point and gamma.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testStandardExactValues0001', 0, async (done: Function) => {
            await runCase('testStandardExactValues0001', async (): Promise<void> => {
                const srgb: ColorSpaceInfo | null = findColorSpaceInfo(colorSpaceManager.ColorSpace.SRGB);
                const dci: ColorSpaceInfo | null = findColorSpaceInfo(colorSpaceManager.ColorSpace.DCI_P3);
                await addLog('testStandardExactValues0001: actual SRGB lookup, expected non-null');
                expect(srgb !== null).assertTrue();
                if (srgb !== null) {
                    await addLog(`testStandardExactValues0001: actual SRGB redX=${srgb.redX}, expected=0.64`);
                    expect(srgb.redX).assertEqual(0.64);
                    await addLog(`testStandardExactValues0001: actual SRGB redY=${srgb.redY}, expected=0.33`);
                    expect(srgb.redY).assertEqual(0.33);
                    await addLog(`testStandardExactValues0001: actual SRGB whiteX=${srgb.whiteX}, expected=0.3127`);
                    expect(srgb.whiteX).assertEqual(0.3127);
                    await addLog(`testStandardExactValues0001: actual SRGB whiteY=${srgb.whiteY}, expected=0.3290`);
                    expect(srgb.whiteY).assertEqual(0.3290);
                    await addLog(`testStandardExactValues0001: actual SRGB gamma=${srgb.gamma}, expected=2.2`);
                    expect(srgb.gamma).assertEqual(2.2);
                }
                await addLog('testStandardExactValues0001: actual DCI_P3 lookup, expected non-null');
                expect(dci !== null).assertTrue();
                if (dci !== null) {
                    await addLog(`testStandardExactValues0001: actual DCI whiteX=${dci.whiteX}, expected=0.314`);
                    expect(dci.whiteX).assertEqual(0.314);
                    await addLog(`testStandardExactValues0001: actual DCI whiteY=${dci.whiteY}, expected=0.351`);
                    expect(dci.whiteY).assertEqual(0.351);
                    await addLog(`testStandardExactValues0001: actual DCI gamma=${dci.gamma}, expected=2.6`);
                    expect(dci.gamma).assertEqual(2.6);
                }
            }, done);
        });

        // ==================== 线性色域 Gamma（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_0700
         * @tc.name: testLinearGammaValues0001
         * @tc.desc: Verify all linear color space entries use gamma one.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testLinearGammaValues0001', 0, async (done: Function) => {
            await runCase('testLinearGammaValues0001', async (): Promise<void> => {
                const linearSrgb: ColorSpaceInfo | null =
                    findColorSpaceInfo(colorSpaceManager.ColorSpace.LINEAR_SRGB);
                const linearBt2020: ColorSpaceInfo | null =
                    findColorSpaceInfo(colorSpaceManager.ColorSpace.LINEAR_BT2020);
                const linearP3: ColorSpaceInfo | null =
                    findColorSpaceInfo(colorSpaceManager.ColorSpace.LINEAR_P3);
                await addLog(`testLinearGammaValues0001: actual Linear_SRGB found=${linearSrgb !== null}, ` +
                  `expected=true`);
                expect(linearSrgb !== null).assertTrue();
                await addLog(`testLinearGammaValues0001: actual Linear_BT2020 found=${linearBt2020 !== null}, ` +
                  `expected=true`);
                expect(linearBt2020 !== null).assertTrue();
                await addLog(`testLinearGammaValues0001: actual Linear_P3 found=${linearP3 !== null}, expected=true`);
                expect(linearP3 !== null).assertTrue();
                if (linearSrgb !== null && linearBt2020 !== null && linearP3 !== null) {
                    await addLog(`testLinearGammaValues0001: actual Linear_SRGB gamma=${linearSrgb.gamma}, expected=1`);
                    expect(linearSrgb.gamma).assertEqual(1);
                    await addLog(`testLinearGammaValues0001: actual Linear_BT2020 gamma=${linearBt2020.gamma}, ` +
                      `expected=1`);
                    expect(linearBt2020.gamma).assertEqual(1);
                    await addLog(`testLinearGammaValues0001: actual Linear_P3 gamma=${linearP3.gamma}, expected=1`);
                    expect(linearP3.gamma).assertEqual(1);
                    const linearP3Name: string = getColorSpaceNameStr(linearP3.enumValue);
                    await addLog(`testLinearGammaValues0001: actual Linear_P3 name=${linearP3Name}, ` +
                      `expected=Linear_P3`);
                    expect(linearP3Name).assertEqual('Linear_P3');
                }
            }, done);
        });

        // ==================== Sendable 数据模型（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_0800
         * @tc.name: testSendableResultFields0001
         * @tc.desc: Verify ColorSpaceResult construction preserves every property.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSendableResultFields0001', 0, async (done: Function) => {
            await runCase('testSendableResultFields0001', async (): Promise<void> => {
                const result: ColorSpaceResult = new ColorSpaceResult('DCI_P3', 0.314, 0.351, 2.6);
                await addLog(`testSendableResultFields0001: actual name=${result.name}, expected=DCI_P3`);
                expect(result.name).assertEqual('DCI_P3');
                await addLog(`testSendableResultFields0001: actual whitePointX=${result.whitePointX}, expected=0.314`);
                expect(result.whitePointX).assertEqual(0.314);
                await addLog(`testSendableResultFields0001: actual whitePointY=${result.whitePointY}, expected=0.351`);
                expect(result.whitePointY).assertEqual(0.351);
                await addLog(`testSendableResultFields0001: actual gamma=${result.gamma}, expected=2.6`);
                expect(result.gamma).assertEqual(2.6);
            }, done);
        });

        // ==================== 特殊名称映射与回退（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_0900
         * @tc.name: testSpecialNameMapping0001
         * @tc.desc: Verify custom, unknown and invalid enums use exact name mappings.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testSpecialNameMapping0001', 0, async (done: Function) => {
            await runCase('testSpecialNameMapping0001', async (): Promise<void> => {
                const customName: string = getColorSpaceNameStr(colorSpaceManager.ColorSpace.CUSTOM);
                const unknownName: string = getColorSpaceNameStr(colorSpaceManager.ColorSpace.UNKNOWN);
                const invalidEnum: colorSpaceManager.ColorSpace = -1 as colorSpaceManager.ColorSpace;
                const invalidName: string = getColorSpaceNameStr(invalidEnum);
                const expectedUnknown: string = `Unknown(${colorSpaceManager.ColorSpace.UNKNOWN})`;
                await addLog(`testSpecialNameMapping0001: actual=${customName}, expected=Custom`);
                expect(customName).assertEqual('Custom');
                await addLog(`testSpecialNameMapping0001: actual=${unknownName}, expected=${expectedUnknown}`);
                expect(unknownName).assertEqual(expectedUnknown);
                await addLog(`testSpecialNameMapping0001: actual=${invalidName}, expected=Unknown(-1)`);
                expect(invalidName).assertEqual('Unknown(-1)');
            }, done);
        });

        // ==================== 合并数组隔离性（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_1000
         * @tc.name: testAllColorSpacesIndependentArray0001
         * @tc.desc: Verify mutating a merged result does not alter later results or source groups.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testAllColorSpacesIndependentArray0001', 0, async (done: Function) => {
            await runCase('testAllColorSpacesIndependentArray0001', async (): Promise<void> => {
                const first: ColorSpaceInfo[] = getAllColorSpaces();
                const second: ColorSpaceInfo[] = getAllColorSpaces();
                first.splice(0, 1);
                const arraysDiffer: boolean = first !== second;
                await addLog(`testAllColorSpacesIndependentArray0001: actual arraysDiffer=${arraysDiffer}, ` +
                  `expected=true`);
                expect(arraysDiffer).assertTrue();
                await addLog(`testAllColorSpacesIndependentArray0001: actual mutated count=${first.length}, ` +
                  `expected=25`);
                expect(first.length).assertEqual(25);
                await addLog(`testAllColorSpacesIndependentArray0001: actual later count=${second.length}, ` +
                  `expected=26`);
                expect(second.length).assertEqual(26);
                await addLog(`testAllColorSpacesIndependentArray0001: actual source ` +
                  `count=${STANDARD_COLOR_SPACES.length}, expected=8`);
                expect(STANDARD_COLOR_SPACES.length).assertEqual(8);
                await addLog(`testAllColorSpacesIndependentArray0001: actual later first=${second[0].label}, ` +
                  `expected=SRGB`);
                expect(second[0].label).assertEqual('SRGB');
            }, done);
        });

        // ==================== 扩展色域精确坐标（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_1100
         * @tc.name: testExtendedExactPrimaries0001
         * @tc.desc: Verify BT601 SMPTE C uses its exact primary coordinates.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testExtendedExactPrimaries0001', 0, async (done: Function) => {
            await runCase('testExtendedExactPrimaries0001', async (): Promise<void> => {
                const info: ColorSpaceInfo = EXTENDED_COLOR_SPACES[1];
                await addLog(`testExtendedExactPrimaries0001: actual label=${info.label}, expected=BT601_SMPTE_C`);
                expect(info.label).assertEqual('BT601_SMPTE_C');
                await addLog(`testExtendedExactPrimaries0001: actual red=(${info.redX},${info.redY}), ` +
                  `expected=(0.63,0.34)`);
                expect(info.redX).assertEqual(0.63);
                await addLog(`testExtendedExactPrimaries0001: actual greenY=${info.greenY}, expected=0.595`);
                expect(info.greenY).assertEqual(0.595);
                await addLog(`testExtendedExactPrimaries0001: actual blue=(${info.blueX},${info.blueY}), ` +
                  `expected blueY=0.07`);
                expect(info.blueY).assertEqual(0.07);
                await addLog(`testExtendedExactPrimaries0001: actual whiteX=${info.whiteX}, expected=0.3127`);
                expect(info.whiteX).assertEqual(0.3127);
            }, done);
        });

        // ==================== LIMIT 规范几何（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_1200
         * @tc.name: testLimitCanonicalGeometry0001
         * @tc.desc: Verify SRGB Limit shares SRGB geometry while retaining a distinct enum.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testLimitCanonicalGeometry0001', 0, async (done: Function) => {
            await runCase('testLimitCanonicalGeometry0001', async (): Promise<void> => {
                const canonical: ColorSpaceInfo = STANDARD_COLOR_SPACES[0];
                const limit: ColorSpaceInfo = LIMIT_COLOR_SPACES[2];
                const enumDiffers: boolean = limit.enumValue !== canonical.enumValue;
                await addLog(`testLimitCanonicalGeometry0001: actual label=${limit.label}, expected=SRGB_Limit`);
                expect(limit.label).assertEqual('SRGB_Limit');
                await addLog(`testLimitCanonicalGeometry0001: actual redX=${limit.redX}, expected=${canonical.redX}`);
                expect(limit.redX).assertEqual(canonical.redX);
                await addLog(`testLimitCanonicalGeometry0001: actual greenY=${limit.greenY}, ` +
                  `expected=${canonical.greenY}`);
                expect(limit.greenY).assertEqual(canonical.greenY);
                await addLog(`testLimitCanonicalGeometry0001: actual whiteY=${limit.whiteY}, ` +
                  `expected=${canonical.whiteY}`);
                expect(limit.whiteY).assertEqual(canonical.whiteY);
                await addLog(`testLimitCanonicalGeometry0001: actual enumDiffers=${enumDiffers}, expected=true`);
                expect(enumDiffers).assertTrue();
            }, done);
        });

        // ==================== 别名查找规范条目（1 条） ====================

        /*
         * @tc.number: SUB_CS_DATA_1300
         * @tc.name: testAliasLookupCanonicalEntry0001
         * @tc.desc: Verify enum aliases resolve to their canonical configured entries.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testAliasLookupCanonicalEntry0001', 0, async (done: Function) => {
            await runCase('testAliasLookupCanonicalEntry0001', async (): Promise<void> => {
                const srgb: ColorSpaceInfo | null = findColorSpaceInfo(colorSpaceManager.ColorSpace.DISPLAY_SRGB);
                const p3Hlg: ColorSpaceInfo | null = findColorSpaceInfo(colorSpaceManager.ColorSpace.DISPLAY_P3_HLG);
                const linear: ColorSpaceInfo | null = findColorSpaceInfo(colorSpaceManager.ColorSpace.LINEAR_BT709);
                await addLog(`testAliasLookupCanonicalEntry0001: actual SRGB alias found=${srgb !== null}, ` +
                  `expected=true`);
                expect(srgb !== null).assertTrue();
                await addLog(`testAliasLookupCanonicalEntry0001: actual P3 HLG alias found=${p3Hlg !== null}, ` +
                  `expected=true`);
                expect(p3Hlg !== null).assertTrue();
                await addLog(`testAliasLookupCanonicalEntry0001: actual linear alias found=${linear !== null}, ` +
                  `expected=true`);
                expect(linear !== null).assertTrue();
                if (srgb !== null && p3Hlg !== null && linear !== null) {
                    await addLog(`testAliasLookupCanonicalEntry0001: actual SRGB entry=${srgb.label}, expected=SRGB`);
                    expect(srgb.label).assertEqual('SRGB');
                    await addLog(`testAliasLookupCanonicalEntry0001: actual P3 HLG entry=${p3Hlg.label}, ` +
                      `expected=P3_HLG`);
                    expect(p3Hlg.label).assertEqual('P3_HLG');
                    await addLog(`testAliasLookupCanonicalEntry0001: actual linear entry=${linear.label}, ` +
                      `expected=Linear_SRGB`);
                    expect(linear.label).assertEqual('Linear_SRGB');
                }
            }, done);
        });
    });
}
