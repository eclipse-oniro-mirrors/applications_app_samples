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

import { describe, expect, it } from '@ohos/hypium';
import { addLog, isCloseTo, runCase } from '../../testkit/SharedDriver';
import {
    AreaComparison, Primaries, XyzColor,
    gamutArea, whitePointDistance, relativeArea, containsPoint,
    multiplyMatrix, invert3x3, rgbToXyzMatrix, rgbToXyz, D65_X, D65_Y, D65_Z
} from '../../../../main/ets/common/ColorSpaceMath';

const SRGB_PRIMARIES: Primaries = {
    redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60, blueX: 0.15, blueY: 0.06,
    whiteX: 0.3127, whiteY: 0.3290
};
const BT2020_PRIMARIES: Primaries = {
    redX: 0.708, redY: 0.292, greenX: 0.170, greenY: 0.797, blueX: 0.131, blueY: 0.046,
    whiteX: 0.3127, whiteY: 0.3290
};
// Same primaries as Display P3, but the DCI white point sits away from D65.
const DCI_PRIMARIES: Primaries = {
    redX: 0.680, redY: 0.320, greenX: 0.265, greenY: 0.690, blueX: 0.150, blueY: 0.060,
    whiteX: 0.314, whiteY: 0.351
};
const CUSTOM_WHITE_PRIMARIES: Primaries = {
    redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60, blueX: 0.15, blueY: 0.06,
    whiteX: 0.3300, whiteY: 0.3300
};
// Three primaries typed on one line, which is the degenerate case typed by hand on the custom page.
const FOLDED_PRIMARIES: Primaries = {
    redX: 0, redY: 0, greenX: 0.4, greenY: 0.4, blueX: 0.8, blueY: 0.8,
    whiteX: 0.3127, whiteY: 0.3290
};
const SWAPPED_SRGB: Primaries = {
    redX: 0.30, redY: 0.60, greenX: 0.64, greenY: 0.33, blueX: 0.15, blueY: 0.06,
    whiteX: 0.3127, whiteY: 0.3290
};
const REVERSED_SRGB: Primaries = {
    redX: 0.15, redY: 0.06, greenX: 0.30, greenY: 0.60, blueX: 0.64, blueY: 0.33,
    whiteX: 0.3127, whiteY: 0.3290
};
const IDENTITY_MATRIX: number[] = [1, 0, 0, 0, 1, 0, 0, 0, 1];
const ROW_MAJOR_MATRIX: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];

export default function utilsSuite02(): void {
    describe('UtilsSuite02', () => {

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0001
         * @tc.name: testGamutUtils0001
         * @tc.desc: Verify the white point distance is zero for a shared white point and matches the DCI offset
         * otherwise.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testGamutUtils0001', 0, async (done: Function) => {
            await runCase('testGamutUtils0001', async (): Promise<void> => {
                const same: number = whitePointDistance(SRGB_PRIMARIES, BT2020_PRIMARIES);
                await addLog(`testGamutUtils0001: shared white point distance=${same}, expected=0`);
                expect(same).assertEqual(0);
                const dci: number = whitePointDistance(SRGB_PRIMARIES, DCI_PRIMARIES);
                await addLog(`testGamutUtils0001: DCI distance=${dci}, expected=0.02204`);
                expect(isCloseTo(dci, 0.02204, 1.0e-4)).assertTrue();
                await addLog(`testGamutUtils0001: DCI distance positive=${dci > 0}, expected=true`);
                expect(dci > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0002
         * @tc.name: testGamutUtils0002
         * @tc.desc: Verify the white point distance is symmetric and obeys the triangle inequality.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGamutUtils0002', 0, async (done: Function) => {
            await runCase('testGamutUtils0002', async (): Promise<void> => {
                const forward: number = whitePointDistance(SRGB_PRIMARIES, DCI_PRIMARIES);
                const backward: number = whitePointDistance(DCI_PRIMARIES, SRGB_PRIMARIES);
                await addLog(`testGamutUtils0002: forward=${forward}, backward=${backward}`);
                expect(backward).assertEqual(forward);
                const firstLeg: number = whitePointDistance(SRGB_PRIMARIES, CUSTOM_WHITE_PRIMARIES);
                const secondLeg: number = whitePointDistance(DCI_PRIMARIES, CUSTOM_WHITE_PRIMARIES);
                await addLog(`testGamutUtils0002: firstLeg=${firstLeg}, secondLeg=${secondLeg}`);
                expect(firstLeg <= forward + secondLeg).assertTrue();
                const custom: number = whitePointDistance(CUSTOM_WHITE_PRIMARIES, SRGB_PRIMARIES);
                await addLog(`testGamutUtils0002: custom distance=${custom}, expected>0`);
                expect(custom > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0003
         * @tc.name: testGamutUtils0003
         * @tc.desc: Verify comparing a gamut against itself reports a unit ratio and keeps its own reference.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testGamutUtils0003', 0, async (done: Function) => {
            await runCase('testGamutUtils0003', async (): Promise<void> => {
                const comparison: AreaComparison = relativeArea(SRGB_PRIMARIES, SRGB_PRIMARIES);
                await addLog(`testGamutUtils0003: ratio=${comparison.ratioToReference}, expected=1`);
                expect(comparison.ratioToReference).assertEqual(1);
                await addLog(`testGamutUtils0003: area=${comparison.area}, expected=${gamutArea(SRGB_PRIMARIES)}`);
                expect(comparison.area).assertEqual(gamutArea(SRGB_PRIMARIES));
                await addLog(`testGamutUtils0003: contains reference=${comparison.containsReference}, expected=true`);
                expect(comparison.containsReference).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0004
         * @tc.name: testGamutUtils0004
         * @tc.desc: Verify a reference gamut with zero area produces an undefined ratio instead of infinity.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGamutUtils0004', 0, async (done: Function) => {
            await runCase('testGamutUtils0004', async (): Promise<void> => {
                const comparison: AreaComparison = relativeArea(SRGB_PRIMARIES, FOLDED_PRIMARIES);
                await addLog(`testGamutUtils0004: ratio=${comparison.ratioToReference}, expected=NaN`);
                expect(String(comparison.ratioToReference)).assertEqual('NaN');
                await addLog(`testGamutUtils0004: contains reference=${comparison.containsReference}, expected=false`);
                expect(comparison.containsReference).assertFalse();
                await addLog(`testGamutUtils0004: candidate area=${comparison.area}, expected=0.11205`);
                expect(isCloseTo(comparison.area, 0.11205, 0.0005)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0005
         * @tc.name: testGamutUtils0005
         * @tc.desc: Verify the BT.2020 gamut reports a wider ratio and contains the sRGB reference triangle.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testGamutUtils0005', 0, async (done: Function) => {
            await runCase('testGamutUtils0005', async (): Promise<void> => {
                const comparison: AreaComparison = relativeArea(BT2020_PRIMARIES, SRGB_PRIMARIES);
                await addLog(`testGamutUtils0005: ratio=${comparison.ratioToReference}, expected=1.891`);
                expect(isCloseTo(comparison.ratioToReference, 1.891, 0.01)).assertTrue();
                await addLog(`testGamutUtils0005: contains reference=${comparison.containsReference}, expected=true`);
                expect(comparison.containsReference).assertTrue();
                await addLog(`testGamutUtils0005: area=${comparison.area}, expected=0.2119`);
                expect(isCloseTo(comparison.area, 0.2119, 0.0005)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0006
         * @tc.name: testGamutUtils0006
         * @tc.desc: Verify a folded candidate gamut reports zero area, zero ratio and cannot hold the reference.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGamutUtils0006', 0, async (done: Function) => {
            await runCase('testGamutUtils0006', async (): Promise<void> => {
                const comparison: AreaComparison = relativeArea(FOLDED_PRIMARIES, SRGB_PRIMARIES);
                await addLog(`testGamutUtils0006: area=${comparison.area}, expected=0`);
                expect(comparison.area).assertEqual(0);
                await addLog(`testGamutUtils0006: ratio=${comparison.ratioToReference}, expected=0`);
                expect(comparison.ratioToReference).assertEqual(0);
                await addLog(`testGamutUtils0006: contains reference=${comparison.containsReference}, expected=false`);
                expect(comparison.containsReference).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0007
         * @tc.name: testGamutUtils0007
         * @tc.desc: Verify the identity matrix leaves every channel triple untouched, including the zero vector.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testGamutUtils0007', 0, async (done: Function) => {
            await runCase('testGamutUtils0007', async (): Promise<void> => {
                const red: XyzColor = multiplyMatrix(IDENTITY_MATRIX, 1, 0, 0);
                await addLog(`testGamutUtils0007: red x=${red.x}, expected=1`);
                expect(red.x).assertEqual(1);
                await addLog(`testGamutUtils0007: red y=${red.y}, expected=0`);
                expect(red.y).assertEqual(0);
                await addLog(`testGamutUtils0007: red z=${red.z}, expected=0`);
                expect(red.z).assertEqual(0);
                const mixed: XyzColor = multiplyMatrix(IDENTITY_MATRIX, 0.25, 0.5, 0.75);
                await addLog(`testGamutUtils0007: mixed x=${mixed.x}, expected=0.25`);
                expect(mixed.x).assertEqual(0.25);
                await addLog(`testGamutUtils0007: mixed y=${mixed.y}, expected=0.5`);
                expect(mixed.y).assertEqual(0.5);
                await addLog(`testGamutUtils0007: mixed z=${mixed.z}, expected=0.75`);
                expect(mixed.z).assertEqual(0.75);
                const zero: XyzColor = multiplyMatrix(IDENTITY_MATRIX, 0, 0, 0);
                await addLog(`testGamutUtils0007: zero sum=${zero.x + zero.y + zero.z}, expected=0`);
                expect(zero.x + zero.y + zero.z).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0008
         * @tc.name: testGamutUtils0008
         * @tc.desc: Verify the matrix helper reads its coefficients in row major order.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testGamutUtils0008', 0, async (done: Function) => {
            await runCase('testGamutUtils0008', async (): Promise<void> => {
                const first: XyzColor = multiplyMatrix(ROW_MAJOR_MATRIX, 1, 0, 0);
                await addLog(`testGamutUtils0008: first x=${first.x}, expected=1`);
                expect(first.x).assertEqual(1);
                await addLog(`testGamutUtils0008: first y=${first.y}, expected=4`);
                expect(first.y).assertEqual(4);
                await addLog(`testGamutUtils0008: first z=${first.z}, expected=7`);
                expect(first.z).assertEqual(7);
                const second: XyzColor = multiplyMatrix(ROW_MAJOR_MATRIX, 0, 1, 0);
                await addLog(`testGamutUtils0008: second x=${second.x}, expected=2`);
                expect(second.x).assertEqual(2);
                await addLog(`testGamutUtils0008: second y=${second.y}, expected=5`);
                expect(second.y).assertEqual(5);
                await addLog(`testGamutUtils0008: second z=${second.z}, expected=8`);
                expect(second.z).assertEqual(8);
                const third: XyzColor = multiplyMatrix(ROW_MAJOR_MATRIX, 0, 0, 1);
                await addLog(`testGamutUtils0008: third x=${third.x}, expected=3`);
                expect(third.x).assertEqual(3);
                await addLog(`testGamutUtils0008: third y=${third.y}, expected=6`);
                expect(third.y).assertEqual(6);
                await addLog(`testGamutUtils0008: third z=${third.z}, expected=9`);
                expect(third.z).assertEqual(9);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0009
         * @tc.name: testGamutUtils0009
         * @tc.desc: Verify the inverted RGB to XYZ matrix maps every column back onto the unit basis.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGamutUtils0009', 0, async (done: Function) => {
            await runCase('testGamutUtils0009', async (): Promise<void> => {
                const forward: number[] = rgbToXyzMatrix(SRGB_PRIMARIES);
                const backward: number[] = invert3x3(forward);
                const firstColumn: XyzColor = multiplyMatrix(backward, forward[0], forward[3], forward[6]);
                await addLog(`testGamutUtils0009: first x=${firstColumn.x}, expected=1`);
                expect(isCloseTo(firstColumn.x, 1, 1.0e-9)).assertTrue();
                await addLog(`testGamutUtils0009: first y=${firstColumn.y}, expected=0`);
                expect(Math.abs(firstColumn.y) < 1.0e-9).assertTrue();
                await addLog(`testGamutUtils0009: first z=${firstColumn.z}, expected=0`);
                expect(Math.abs(firstColumn.z) < 1.0e-9).assertTrue();
                const secondColumn: XyzColor = multiplyMatrix(backward, forward[1], forward[4], forward[7]);
                await addLog(`testGamutUtils0009: second x=${secondColumn.x}, expected=0`);
                expect(Math.abs(secondColumn.x) < 1.0e-9).assertTrue();
                await addLog(`testGamutUtils0009: second y=${secondColumn.y}, expected=1`);
                expect(isCloseTo(secondColumn.y, 1, 1.0e-9)).assertTrue();
                await addLog(`testGamutUtils0009: second z=${secondColumn.z}, expected=0`);
                expect(Math.abs(secondColumn.z) < 1.0e-9).assertTrue();
                const thirdColumn: XyzColor = multiplyMatrix(backward, forward[2], forward[5], forward[8]);
                await addLog(`testGamutUtils0009: third x=${thirdColumn.x}, expected=0`);
                expect(Math.abs(thirdColumn.x) < 1.0e-9).assertTrue();
                await addLog(`testGamutUtils0009: third z=${thirdColumn.z}, expected=1`);
                expect(isCloseTo(thirdColumn.z, 1, 1.0e-9)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0010
         * @tc.name: testGamutUtils0010
         * @tc.desc: Verify the encoded white triple converts onto the D65 reference triple.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testGamutUtils0010', 0, async (done: Function) => {
            await runCase('testGamutUtils0010', async (): Promise<void> => {
                const white: XyzColor = rgbToXyz({ r: 1, g: 1, b: 1 }, 2.2, SRGB_PRIMARIES);
                await addLog(`testGamutUtils0010: x=${white.x}, expected=${D65_X}`);
                expect(isCloseTo(white.x, D65_X, 1.0e-3)).assertTrue();
                await addLog(`testGamutUtils0010: y=${white.y}, expected=${D65_Y}`);
                expect(isCloseTo(white.y, D65_Y, 1.0e-3)).assertTrue();
                await addLog(`testGamutUtils0010: z=${white.z}, expected=${D65_Z}`);
                expect(isCloseTo(white.z, D65_Z, 1.0e-3)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0011
         * @tc.name: testGamutUtils0011
         * @tc.desc: Verify a non positive gamma is treated as the identity transfer and black stays at the origin.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGamutUtils0011', 0, async (done: Function) => {
            await runCase('testGamutUtils0011', async (): Promise<void> => {
                const withZeroGamma: XyzColor = rgbToXyz({ r: 0.5, g: 0.5, b: 0.5 }, 0, SRGB_PRIMARIES);
                const withUnitGamma: XyzColor = rgbToXyz({ r: 0.5, g: 0.5, b: 0.5 }, 1, SRGB_PRIMARIES);
                await addLog(`testGamutUtils0011: zero gamma x=${withZeroGamma.x}, unit gamma x=${withUnitGamma.x}`);
                expect(isCloseTo(withZeroGamma.x, withUnitGamma.x, 1.0e-12)).assertTrue();
                await addLog(`testGamutUtils0011: zero gamma z=${withZeroGamma.z}, expected=${withUnitGamma.z}`);
                expect(isCloseTo(withZeroGamma.z, withUnitGamma.z, 1.0e-12)).assertTrue();
                const black: XyzColor = rgbToXyz({ r: 0, g: 0, b: 0 }, 2.2, SRGB_PRIMARIES);
                await addLog(`testGamutUtils0011: black sum=${black.x + black.y + black.z}, expected=0`);
                expect(black.x + black.y + black.z).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0012
         * @tc.name: testGamutUtils0012
         * @tc.desc: Verify the triangle membership test keeps every primary on the inside and rejects a far corner.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGamutUtils0012', 0, async (done: Function) => {
            await runCase('testGamutUtils0012', async (): Promise<void> => {
                const redInside: boolean = containsPoint(SRGB_PRIMARIES, SRGB_PRIMARIES.redX, SRGB_PRIMARIES.redY);
                await addLog(`testGamutUtils0012: red primary inside=${redInside}, expected=true`);
                expect(redInside).assertTrue();
                const greenInside: boolean =
                    containsPoint(SRGB_PRIMARIES, SRGB_PRIMARIES.greenX, SRGB_PRIMARIES.greenY);
                await addLog(`testGamutUtils0012: green primary inside=${greenInside}, expected=true`);
                expect(greenInside).assertTrue();
                const blueInside: boolean = containsPoint(SRGB_PRIMARIES, SRGB_PRIMARIES.blueX, SRGB_PRIMARIES.blueY);
                await addLog(`testGamutUtils0012: blue primary inside=${blueInside}, expected=true`);
                expect(blueInside).assertTrue();
                const corner: boolean = containsPoint(SRGB_PRIMARIES, 0.9, 0.9);
                await addLog(`testGamutUtils0012: far corner inside=${corner}, expected=false`);
                expect(corner).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_GEO_0013
         * @tc.name: testGamutUtils0013
         * @tc.desc: Verify the triangle area does not depend on the order the primaries are listed in.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGamutUtils0013', 0, async (done: Function) => {
            await runCase('testGamutUtils0013', async (): Promise<void> => {
                const original: number = gamutArea(SRGB_PRIMARIES);
                const swapped: number = gamutArea(SWAPPED_SRGB);
                await addLog(`testGamutUtils0013: original=${original}, swapped=${swapped}`);
                expect(isCloseTo(swapped, original, 1.0e-12)).assertTrue();
                const reversed: number = gamutArea(REVERSED_SRGB);
                await addLog(`testGamutUtils0013: reversed=${reversed}, original=${original}`);
                expect(isCloseTo(reversed, original, 1.0e-12)).assertTrue();
                await addLog(`testGamutUtils0013: area positive=${original > 0}, expected=true`);
                expect(original > 0).assertTrue();
            }, done);
        });
    });
}
