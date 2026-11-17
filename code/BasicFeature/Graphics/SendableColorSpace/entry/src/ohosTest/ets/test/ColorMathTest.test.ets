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
import { runCase, addLog, isCloseTo } from '../testkit/SharedDriver';
import { ColorSpaceInfo, getAllColorSpaces } from '../../../main/ets/common/ColorSpaceData';
import {
    Primaries, RgbUnit, XyzColor, LabColor, ConversionResult, AreaComparison,
    primariesOf, clip01, gamutArea, containsPoint, isDegenerate, whitePointDistance, relativeArea,
    xyToXyz, invert3x3, multiplyMatrix, rgbToXyzMatrix, rgbToXyz,
    srgbToLinear, linearToSrgb, applyGamma, removeGamma,
    xyzToLab, labToXyz, deltaE76, deltaE94, deltaE2000, perceptibility,
    convertRgb, toByte, fromByte, rgbText, labText, xyzText, areaText, byteToHex,
    D65_X, D65_Y, D65_Z
} from '../../../main/ets/common/ColorSpaceMath';

const SRGB_PRIMARIES: Primaries = {
    redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60, blueX: 0.15, blueY: 0.06,
    whiteX: 0.3127, whiteY: 0.3290
};
const P3_PRIMARIES: Primaries = {
    redX: 0.680, redY: 0.320, greenX: 0.265, greenY: 0.690, blueX: 0.150, blueY: 0.060,
    whiteX: 0.3127, whiteY: 0.3290
};
const BT2020_PRIMARIES: Primaries = {
    redX: 0.708, redY: 0.292, greenX: 0.170, greenY: 0.797, blueX: 0.131, blueY: 0.046,
    whiteX: 0.3127, whiteY: 0.3290
};

export default function colorMathTest(): void {
    describe('ColorMathTest', () => {

        // ==================== 色域面积（4 条） ====================

        /*
         * @tc.number: SUB_CS_MATH_0001
         * @tc.name: testGamutArea0001
         * @tc.desc: Verify the sRGB triangle area matches the published chromaticity area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testGamutArea0001', 0, async (done: Function) => {
            await runCase('testGamutArea0001', async (): Promise<void> => {
                const area: number = gamutArea(SRGB_PRIMARIES);
                await addLog(`testGamutArea0001: actual area=${area}, expected=0.11205`);
                expect(isCloseTo(area, 0.11205, 0.0005)).assertTrue();
                await addLog(`testGamutArea0001: actual positive=${area > 0}, expected=true`);
                expect(area > 0).assertTrue();
                await addLog(`testGamutArea0001: actual text=${areaText(SRGB_PRIMARIES)}, expected=Area=0.1121`);
                expect(areaText(SRGB_PRIMARIES)).assertEqual('Area=0.1121');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0002
         * @tc.name: testGamutArea0002
         * @tc.desc: Verify the Display P3 triangle area matches the published value.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testGamutArea0002', 0, async (done: Function) => {
            await runCase('testGamutArea0002', async (): Promise<void> => {
                const area: number = gamutArea(P3_PRIMARIES);
                await addLog(`testGamutArea0002: actual area=${area}, expected=0.1520`);
                expect(isCloseTo(area, 0.1520, 0.0005)).assertTrue();
                await addLog(`testGamutArea0002: actual greater than sRGB=${area > gamutArea(SRGB_PRIMARIES)}`);
                expect(area > gamutArea(SRGB_PRIMARIES)).assertTrue();
                await addLog(`testGamutArea0002: actual ratio to sRGB=${area / gamutArea(SRGB_PRIMARIES)}`);
                expect(area / gamutArea(SRGB_PRIMARIES) > 1.3).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0003
         * @tc.name: testGamutArea0003
         * @tc.desc: Verify the BT.2020 triangle is the widest of the three reference spaces.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testGamutArea0003', 0, async (done: Function) => {
            await runCase('testGamutArea0003', async (): Promise<void> => {
                const area: number = gamutArea(BT2020_PRIMARIES);
                await addLog(`testGamutArea0003: actual area=${area}, expected=0.2119`);
                expect(isCloseTo(area, 0.2119, 0.0005)).assertTrue();
                await addLog(`testGamutArea0003: actual widest=${area > gamutArea(P3_PRIMARIES)}`);
                expect(area > gamutArea(P3_PRIMARIES)).assertTrue();
                await addLog(`testGamutArea0003: actual ratio to P3=${area / gamutArea(P3_PRIMARIES)}`);
                expect(area / gamutArea(P3_PRIMARIES) > 1.35).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0004
         * @tc.name: testGamutArea0004
         * @tc.desc: Verify the area ordering of the three reference spaces is strictly increasing.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGamutArea0004', 0, async (done: Function) => {
            await runCase('testGamutArea0004', async (): Promise<void> => {
                const srgb: number = gamutArea(SRGB_PRIMARIES);
                const p3: number = gamutArea(P3_PRIMARIES);
                const bt2020: number = gamutArea(BT2020_PRIMARIES);
                await addLog(`testGamutArea0004: sRGB=${srgb} P3=${p3} BT2020=${bt2020}`);
                expect(srgb < p3).assertTrue();
                await addLog(`testGamutArea0004: actual P3 greater than sRGB=${p3 > srgb}`);
                expect(p3 < bt2020).assertTrue();
                await addLog(`testGamutArea0004: actual BT2020 greater than P3=${bt2020 > p3}`);
                expect(srgb < bt2020).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0005
         * @tc.name: testDegenerateGamut0001
         * @tc.desc: Verify collinear primaries produce a zero area and are reported as degenerate.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDegenerateGamut0001', 0, async (done: Function) => {
            await runCase('testDegenerateGamut0001', async (): Promise<void> => {
                const collinear: Primaries = {
                    redX: 0.3, redY: 0.3, greenX: 0.4, greenY: 0.4, blueX: 0.5, blueY: 0.5,
                    whiteX: 0.3127, whiteY: 0.3290
                };
                const area: number = gamutArea(collinear);
                await addLog(`testDegenerateGamut0001: actual area=${area}, expected=0`);
                expect(isCloseTo(area, 0, 1.0e-9)).assertTrue();
                await addLog(`testDegenerateGamut0001: actual degenerate=${isDegenerate(collinear)}, expected=true`);
                expect(isDegenerate(collinear)).assertTrue();
                await addLog(`testDegenerateGamut0001: actual healthy=${isDegenerate(SRGB_PRIMARIES)}, expected=false`);
                expect(isDegenerate(SRGB_PRIMARIES)).assertFalse();
            }, done);
        });

        // ==================== 三角包含判定（3 条） ====================

        /*
         * @tc.number: SUB_CS_MATH_0006
         * @tc.name: testContainsPoint0001
         * @tc.desc: Verify the white point of each reference space lies inside its own triangle.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testContainsPoint0001', 0, async (done: Function) => {
            await runCase('testContainsPoint0001', async (): Promise<void> => {
                const srgb: boolean = containsPoint(SRGB_PRIMARIES, SRGB_PRIMARIES.whiteX, SRGB_PRIMARIES.whiteY);
                await addLog(`testContainsPoint0001: actual sRGB white inside=${srgb}, expected=true`);
                expect(srgb).assertTrue();
                await addLog('testContainsPoint0001: actual P3 white inside P3, expected=true');
                expect(containsPoint(P3_PRIMARIES, P3_PRIMARIES.whiteX, P3_PRIMARIES.whiteY)).assertTrue();
                await addLog('testContainsPoint0001: actual BT2020 white inside BT2020, expected=true');
                expect(containsPoint(BT2020_PRIMARIES, BT2020_PRIMARIES.whiteX, BT2020_PRIMARIES.whiteY))
                    .assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0007
         * @tc.name: testContainsPoint0002
         * @tc.desc: Verify a recursive gamut contains the primaries of the narrower space.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testContainsPoint0002', 0, async (done: Function) => {
            await runCase('testContainsPoint0002', async (): Promise<void> => {
                const redInside: boolean = containsPoint(P3_PRIMARIES, SRGB_PRIMARIES.redX, SRGB_PRIMARIES.redY);
                await addLog(`testContainsPoint0002: actual sRGB red inside P3=${redInside}, expected=true`);
                expect(redInside).assertTrue();
                await addLog('testContainsPoint0002: actual sRGB green inside P3, expected=true');
                expect(containsPoint(P3_PRIMARIES, SRGB_PRIMARIES.greenX, SRGB_PRIMARIES.greenY)).assertTrue();
                await addLog('testContainsPoint0002: actual BT2020 red outside sRGB, expected=false');
                expect(containsPoint(SRGB_PRIMARIES, BT2020_PRIMARIES.redX, BT2020_PRIMARIES.redY)).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0008
         * @tc.name: testContainsPoint0003
         * @tc.desc: Verify points outside the visible locus and degenerate triangles are rejected.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testContainsPoint0003', 0, async (done: Function) => {
            await runCase('testContainsPoint0003', async (): Promise<void> => {
                await addLog('testContainsPoint0003: actual (0.05, 0.95) inside sRGB, expected=false');
                expect(containsPoint(SRGB_PRIMARIES, 0.05, 0.95)).assertFalse();
                await addLog('testContainsPoint0003: actual (0.9, 0.05) inside sRGB, expected=false');
                expect(containsPoint(SRGB_PRIMARIES, 0.9, 0.05)).assertFalse();
                const collinear: Primaries = {
                    redX: 0.2, redY: 0.2, greenX: 0.3, greenY: 0.3, blueX: 0.4, blueY: 0.4,
                    whiteX: 0.3127, whiteY: 0.3290
                };
                await addLog('testContainsPoint0003: actual degenerate contains white, expected=false');
                expect(containsPoint(collinear, 0.3127, 0.3290)).assertFalse();
            }, done);
        });

        // ==================== xy 与 XYZ（2 条） ====================

        /*
         * @tc.number: SUB_CS_MATH_0009
         * @tc.name: testXyToXyz0001
         * @tc.desc: Verify the D65 white point maps onto the reference XYZ triple.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testXyToXyz0001', 0, async (done: Function) => {
            await runCase('testXyToXyz0001', async (): Promise<void> => {
                const white: XyzColor = xyToXyz(0.3127, 0.3290);
                await addLog(`testXyToXyz0001: actual X=${white.x}, expected=${D65_X}`);
                expect(isCloseTo(white.x, D65_X, 0.001)).assertTrue();
                await addLog(`testXyToXyz0001: actual Y=${white.y}, expected=1`);
                expect(isCloseTo(white.y, D65_Y, 0.001)).assertTrue();
                await addLog(`testXyToXyz0001: actual Z=${white.z}, expected=${D65_Z}`);
                expect(isCloseTo(white.z, D65_Z, 0.001)).assertTrue();
                await addLog(`testXyToXyz0001: actual text=${xyzText(white)}`);
                expect(xyzText(white).startsWith('X=0.9505')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0010
         * @tc.name: testXyToXyz0002
         * @tc.desc: Verify a zero luminance coordinate collapses to black instead of dividing by zero.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testXyToXyz0002', 0, async (done: Function) => {
            await runCase('testXyToXyz0002', async (): Promise<void> => {
                const black: XyzColor = xyToXyz(0.3, 0);
                await addLog(`testXyToXyz0002: actual X=${black.x}, expected=0`);
                expect(black.x).assertEqual(0);
                await addLog(`testXyToXyz0002: actual Y=${black.y}, expected=0`);
                expect(black.y).assertEqual(0);
                await addLog(`testXyToXyz0002: actual Z=${black.z}, expected=0`);
                expect(black.z).assertEqual(0);
                await addLog(`testXyToXyz0002: actual finite=${Number.isFinite(black.x)}, expected=true`);
                expect(Number.isFinite(black.x)).assertTrue();
            }, done);
        });

        // ==================== 矩阵运算（4 条） ====================

        /*
         * @tc.number: SUB_CS_MATH_0011
         * @tc.name: testMatrixInverse0001
         * @tc.desc: Verify the inverse of the identity matrix is the identity matrix.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testMatrixInverse0001', 0, async (done: Function) => {
            await runCase('testMatrixInverse0001', async (): Promise<void> => {
                const identity: number[] = [1, 0, 0, 0, 1, 0, 0, 0, 1];
                const inverse: number[] = invert3x3(identity);
                await addLog(`testMatrixInverse0001: actual[0]=${inverse[0]}, expected=1`);
                expect(inverse[0]).assertEqual(1);
                await addLog(`testMatrixInverse0001: actual[4]=${inverse[4]}, expected=1`);
                expect(inverse[4]).assertEqual(1);
                await addLog(`testMatrixInverse0001: actual[8]=${inverse[8]}, expected=1`);
                expect(inverse[8]).assertEqual(1);
                await addLog(`testMatrixInverse0001: actual[1]=${inverse[1]}, expected=0`);
                expect(inverse[1]).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0012
         * @tc.name: testMatrixInverse0002
         * @tc.desc: Verify a singular matrix returns the zero matrix instead of infinite values.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testMatrixInverse0002', 0, async (done: Function) => {
            await runCase('testMatrixInverse0002', async (): Promise<void> => {
                const singular: number[] = [1, 2, 3, 2, 4, 6, 7, 8, 9];
                const inverse: number[] = invert3x3(singular);
                let zeroCount: number = 0;
                for (let i = 0; i < inverse.length; i++) {
                    if (inverse[i] === 0) {
                        zeroCount++;
                    }
                }
                await addLog(`testMatrixInverse0002: actual zero entries=${zeroCount}, expected=9`);
                expect(zeroCount).assertEqual(9);
                await addLog(`testMatrixInverse0002: actual length=${inverse.length}, expected=9`);
                expect(inverse.length).assertEqual(9);
                await addLog(`testMatrixInverse0002: actual finite=${Number.isFinite(inverse[0])}, expected=true`);
                expect(Number.isFinite(inverse[0])).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0013
         * @tc.name: testRgbMatrix0001
         * @tc.desc: Verify the sRGB to XYZ matrix matches the published coefficients.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testRgbMatrix0001', 0, async (done: Function) => {
            await runCase('testRgbMatrix0001', async (): Promise<void> => {
                const matrix: number[] = rgbToXyzMatrix(SRGB_PRIMARIES);
                await addLog(`testRgbMatrix0001: actual m00=${matrix[0]}, expected=0.4124`);
                expect(isCloseTo(matrix[0], 0.4124, 0.001)).assertTrue();
                await addLog(`testRgbMatrix0001: actual m01=${matrix[1]}, expected=0.3576`);
                expect(isCloseTo(matrix[1], 0.3576, 0.001)).assertTrue();
                await addLog(`testRgbMatrix0001: actual m11=${matrix[4]}, expected=0.7152`);
                expect(isCloseTo(matrix[4], 0.7152, 0.001)).assertTrue();
                await addLog(`testRgbMatrix0001: actual m22=${matrix[8]}, expected=0.9505`);
                expect(isCloseTo(matrix[8], 0.9505, 0.001)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0014
         * @tc.name: testRgbMatrix0002
         * @tc.desc: Verify the matrix column sums reproduce the reference white XYZ.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testRgbMatrix0002', 0, async (done: Function) => {
            await runCase('testRgbMatrix0002', async (): Promise<void> => {
                const matrix: number[] = rgbToXyzMatrix(SRGB_PRIMARIES);
                const white: XyzColor = multiplyMatrix(matrix, 1, 1, 1);
                await addLog(`testRgbMatrix0002: actual white X=${white.x}, expected=${D65_X}`);
                expect(isCloseTo(white.x, D65_X, 0.002)).assertTrue();
                await addLog(`testRgbMatrix0002: actual white Y=${white.y}, expected=1`);
                expect(isCloseTo(white.y, D65_Y, 0.002)).assertTrue();
                await addLog(`testRgbMatrix0002: actual white Z=${white.z}, expected=${D65_Z}`);
                expect(isCloseTo(white.z, D65_Z, 0.004)).assertTrue();
            }, done);
        });

        // ==================== 传输函数（4 条） ====================

        /*
         * @tc.number: SUB_CS_MATH_0015
         * @tc.name: testSrgbTransfer0001
         * @tc.desc: Verify the sRGB piecewise transfer function at its knee point.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSrgbTransfer0001', 0, async (done: Function) => {
            await runCase('testSrgbTransfer0001', async (): Promise<void> => {
                const linear: number = srgbToLinear(0.04045);
                await addLog(`testSrgbTransfer0001: actual linear=${linear}, expected=0.0031308`);
                expect(isCloseTo(linear, 0.0031308, 1.0e-6)).assertTrue();
                await addLog('testSrgbTransfer0001: actual encoded back, expected=0.04045');
                expect(isCloseTo(linearToSrgb(linear), 0.04045, 1.0e-5)).assertTrue();
                await addLog(`testSrgbTransfer0001: actual black=${srgbToLinear(0)}, expected=0`);
                expect(srgbToLinear(0)).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0016
         * @tc.name: testSrgbTransfer0002
         * @tc.desc: Verify encoded and linear values round trip across the whole range.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testSrgbTransfer0002', 0, async (done: Function) => {
            await runCase('testSrgbTransfer0002', async (): Promise<void> => {
                let worstError: number = 0;
                for (let step = 0; step <= 10; step++) {
                    const encoded: number = step / 10;
                    const roundTrip: number = linearToSrgb(srgbToLinear(encoded));
                    const difference: number = Math.abs(roundTrip - encoded);
                    if (difference > worstError) {
                        worstError = difference;
                    }
                }
                await addLog(`testSrgbTransfer0002: actual worst error=${worstError}, expected<0.001`);
                expect(worstError < 0.001).assertTrue();
                await addLog(`testSrgbTransfer0002: actual full white=${linearToSrgb(1)}, expected=1`);
                expect(isCloseTo(linearToSrgb(1), 1, 1.0e-6)).assertTrue();
                await addLog(`testSrgbTransfer0002: actual mid grey=${linearToSrgb(0.2140)}, expected=0.5`);
                expect(isCloseTo(linearToSrgb(0.2140), 0.5, 0.002)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0017
         * @tc.name: testGammaRoundTrip0001
         * @tc.desc: Verify the generic gamma helpers invert each other and brighten the encoded value.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testGammaRoundTrip0001', 0, async (done: Function) => {
            await runCase('testGammaRoundTrip0001', async (): Promise<void> => {
                const encoded: number = applyGamma(0.25, 2.2);
                await addLog(`testGammaRoundTrip0001: actual encoded=${encoded}, expected=0.5326`);
                expect(isCloseTo(encoded, 0.5326, 0.001)).assertTrue();
                await addLog(`testGammaRoundTrip0001: actual decoded=${removeGamma(encoded, 2.2)}, expected=0.25`);
                expect(isCloseTo(removeGamma(encoded, 2.2), 0.25, 1.0e-6)).assertTrue();
                await addLog(`testGammaRoundTrip0001: actual gamma 1 keeps value=${applyGamma(0.4, 1)}, expected=0.4`);
                expect(isCloseTo(applyGamma(0.4, 1), 0.4, 1.0e-9)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0018
         * @tc.name: testGammaRoundTrip0002
         * @tc.desc: Verify invalid gamma values fall back to clipping instead of producing NaN.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testGammaRoundTrip0002', 0, async (done: Function) => {
            await runCase('testGammaRoundTrip0002', async (): Promise<void> => {
                await addLog('testGammaRoundTrip0002: actual zero gamma, expected=clip of input');
                expect(applyGamma(0.6, 0)).assertEqual(0.6);
                await addLog('testGammaRoundTrip0002: actual negative gamma, expected=clip of input');
                expect(applyGamma(0.6, -1)).assertEqual(0.6);
                await addLog('testGammaRoundTrip0002: actual over one input, expected=1');
                expect(applyGamma(1.4, 2.2)).assertEqual(1);
                await addLog('testGammaRoundTrip0002: actual below zero input, expected=0');
                expect(removeGamma(-0.2, 2.2)).assertEqual(0);
            }, done);
        });

        // ==================== Lab 转换（4 条） ====================

        /*
         * @tc.number: SUB_CS_MATH_0019
         * @tc.name: testXyzToLab0001
         * @tc.desc: Verify the reference white maps to the top of the Lab lightness axis.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testXyzToLab0001', 0, async (done: Function) => {
            await runCase('testXyzToLab0001', async (): Promise<void> => {
                const white: LabColor = xyzToLab(xyToXyz(0.3127, 0.3290));
                await addLog(`testXyzToLab0001: actual L=${white.l}, expected=100`);
                expect(isCloseTo(white.l, 100, 0.2)).assertTrue();
                await addLog(`testXyzToLab0001: actual a=${white.a}, expected=0`);
                expect(isCloseTo(white.a, 0, 0.2)).assertTrue();
                await addLog(`testXyzToLab0001: actual b=${white.b}, expected=0`);
                expect(isCloseTo(white.b, 0, 0.2)).assertTrue();
                await addLog(`testXyzToLab0001: actual text=${labText(white)}`);
                expect(labText(white).startsWith('L=100.00')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0020
         * @tc.name: testXyzToLab0002
         * @tc.desc: Verify black maps to the origin of the Lab space.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testXyzToLab0002', 0, async (done: Function) => {
            await runCase('testXyzToLab0002', async (): Promise<void> => {
                const black: LabColor = xyzToLab({ x: 0, y: 0, z: 0 });
                await addLog(`testXyzToLab0002: actual L=${black.l}, expected=0`);
                expect(isCloseTo(black.l, 0, 0.001)).assertTrue();
                await addLog(`testXyzToLab0002: actual a=${black.a}, expected=0`);
                expect(isCloseTo(black.a, 0, 0.001)).assertTrue();
                await addLog(`testXyzToLab0002: actual b=${black.b}, expected=0`);
                expect(isCloseTo(black.b, 0, 0.001)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0021
         * @tc.name: testXyzToLab0003
         * @tc.desc: Verify pure sRGB red converts to the published Lab triple.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testXyzToLab0003', 0, async (done: Function) => {
            await runCase('testXyzToLab0003', async (): Promise<void> => {
                const red: RgbUnit = { r: 1, g: 0, b: 0 };
                const xyz: XyzColor = rgbToXyz(red, 1.0, SRGB_PRIMARIES);
                const lab: LabColor = xyzToLab(xyz);
                await addLog(`testXyzToLab0003: actual L=${lab.l}, expected=53.24`);
                expect(isCloseTo(lab.l, 53.24, 0.5)).assertTrue();
                await addLog(`testXyzToLab0003: actual a=${lab.a}, expected=80.09`);
                expect(isCloseTo(lab.a, 80.09, 0.6)).assertTrue();
                await addLog(`testXyzToLab0003: actual b=${lab.b}, expected=67.20`);
                expect(isCloseTo(lab.b, 67.20, 0.6)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0022
         * @tc.name: testLabToXyz0001
         * @tc.desc: Verify Lab to XYZ inverts the forward conversion.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testLabToXyz0001', 0, async (done: Function) => {
            await runCase('testLabToXyz0001', async (): Promise<void> => {
                const source: XyzColor = { x: 0.4, y: 0.3, z: 0.2 };
                const roundTrip: XyzColor = labToXyz(xyzToLab(source));
                await addLog(`testLabToXyz0001: actual X=${roundTrip.x}, expected=${source.x}`);
                expect(isCloseTo(roundTrip.x, source.x, 1.0e-6)).assertTrue();
                await addLog(`testLabToXyz0001: actual Y=${roundTrip.y}, expected=${source.y}`);
                expect(isCloseTo(roundTrip.y, source.y, 1.0e-6)).assertTrue();
                await addLog(`testLabToXyz0001: actual Z=${roundTrip.z}, expected=${source.z}`);
                expect(isCloseTo(roundTrip.z, source.z, 1.0e-6)).assertTrue();
            }, done);
        });

        // ==================== 色差（4 条） ====================

        /*
         * @tc.number: SUB_CS_MATH_0023
         * @tc.name: testDeltaE760001
         * @tc.desc: Verify the Euclidean difference is zero for identical colors.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDeltaE760001', 0, async (done: Function) => {
            await runCase('testDeltaE760001', async (): Promise<void> => {
                const color: LabColor = { l: 53.24, a: 80.09, b: 67.20 };
                await addLog('testDeltaE760001: actual self difference, expected=0');
                expect(isCloseTo(deltaE76(color, color), 0, 1.0e-9)).assertTrue();
                await addLog('testDeltaE760001: actual symmetric difference, expected=0');
                expect(isCloseTo(deltaE76(color, { l: 50, a: 0, b: 0 }),
                    deltaE76({ l: 50, a: 0, b: 0 }, color), 1.0e-9)).assertTrue();
                await addLog('testDeltaE760001: actual positive distance, expected>0');
                expect(deltaE76(color, { l: 50, a: 0, b: 0 }) > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0024
         * @tc.name: testDeltaE760002
         * @tc.desc: Verify the distance between red and green exceeds the red to black distance.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDeltaE760002', 0, async (done: Function) => {
            await runCase('testDeltaE760002', async (): Promise<void> => {
                const red: LabColor = xyzToLab(rgbToXyz({ r: 1, g: 0, b: 0 }, 1.0, SRGB_PRIMARIES));
                const green: LabColor = xyzToLab(rgbToXyz({ r: 0, g: 1, b: 0 }, 1.0, SRGB_PRIMARIES));
                const black: LabColor = { l: 0, a: 0, b: 0 };
                const redGreen: number = deltaE76(red, green);
                await addLog(`testDeltaE760002: actual red to green=${redGreen}, expected>150`);
                expect(redGreen > 150).assertTrue();
                await addLog(`testDeltaE760002: actual red to black=${deltaE76(red, black)}, expected<120`);
                expect(deltaE76(red, black) < 120).assertTrue();
                await addLog('testDeltaE760002: actual red to green above red to black, expected=true');
                expect(redGreen > deltaE76(red, black)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0025
         * @tc.name: testDeltaE940001
         * @tc.desc: Verify the CIE94 difference is zero for identical colors and positive otherwise.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testDeltaE940001', 0, async (done: Function) => {
            await runCase('testDeltaE940001', async (): Promise<void> => {
                const color: LabColor = { l: 60, a: 30, b: -20 };
                await addLog('testDeltaE940001: actual self difference, expected=0');
                expect(isCloseTo(deltaE94(color, color), 0, 1.0e-9)).assertTrue();
                await addLog('testDeltaE940001: actual positive distance, expected>0');
                expect(deltaE94(color, { l: 60, a: 31, b: -20 }) > 0).assertTrue();
                await addLog('testDeltaE940001: actual never above CIE76 for small steps, expected=true');
                expect(deltaE94(color, { l: 60, a: 31, b: -20 }) <= deltaE76(color, { l: 60, a: 31, b: -20 }))
                    .assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0026
         * @tc.name: testDeltaE20000001
         * @tc.desc: Verify the CIE2000 difference reproduces a published reference pair.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testDeltaE20000001', 0, async (done: Function) => {
            await runCase('testDeltaE20000001', async (): Promise<void> => {
                const first: LabColor = { l: 50, a: 2.6772, b: -79.7751 };
                const second: LabColor = { l: 50, a: 0, b: -82.7485 };
                const difference: number = deltaE2000(first, second);
                await addLog(`testDeltaE20000001: actual difference=${difference}, expected=2.0425`);
                expect(isCloseTo(difference, 2.0425, 0.01)).assertTrue();
                await addLog('testDeltaE20000001: actual self difference, expected=0');
                expect(isCloseTo(deltaE2000(first, first), 0, 1.0e-9)).assertTrue();
                await addLog(`testDeltaE20000001: actual text prefix=${difference.toFixed(4)}`);
                expect(difference.toFixed(4).startsWith('2.04')).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0027
         * @tc.name: testDeltaE20000002
         * @tc.desc: Verify the CIE2000 difference is symmetric when the arguments are swapped.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testDeltaE20000002', 0, async (done: Function) => {
            await runCase('testDeltaE20000002', async (): Promise<void> => {
                const first: LabColor = { l: 68, a: 22, b: 41 };
                const second: LabColor = { l: 71, a: 12, b: 39 };
                const forward: number = deltaE2000(first, second);
                const backward: number = deltaE2000(second, first);
                await addLog(`testDeltaE20000002: forward=${forward} backward=${backward}`);
                expect(isCloseTo(forward, backward, 1.0e-6)).assertTrue();
                await addLog(`testDeltaE20000002: actual value=${forward}, expected>0`);
                expect(forward > 0).assertTrue();
                await addLog('testDeltaE20000002: actual below CIE76, expected=true');
                expect(forward < deltaE76(first, second)).assertTrue();
            }, done);
        });

        // ==================== 空间转换（3 条） ====================

        /*
         * @tc.number: SUB_CS_MATH_0028
         * @tc.name: testConvertIdentity0001
         * @tc.desc: Verify converting a space onto itself leaves the color unchanged.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvertIdentity0001', 0, async (done: Function) => {
            await runCase('testConvertIdentity0001', async (): Promise<void> => {
                const source: RgbUnit = { r: 0.5, g: 0.5, b: 0.5 };
                const result: ConversionResult = convertRgb(SRGB_PRIMARIES, 2.2, SRGB_PRIMARIES, 2.2, source);
                await addLog(`testConvertIdentity0001: actual red=${result.encoded.r}, expected=0.5`);
                expect(isCloseTo(result.encoded.r, 0.5, 1.0e-6)).assertTrue();
                await addLog(`testConvertIdentity0001: actual green=${result.encoded.g}, expected=0.5`);
                expect(isCloseTo(result.encoded.g, 0.5, 1.0e-6)).assertTrue();
                await addLog(`testConvertIdentity0001: actual blue=${result.encoded.b}, expected=0.5`);
                expect(isCloseTo(result.encoded.b, 0.5, 1.0e-6)).assertTrue();
                await addLog(`testConvertIdentity0001: actual out of gamut=${result.outOfGamut}, expected=false`);
                expect(result.outOfGamut).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0029
         * @tc.name: testConvertOutOfGamut0001
         * @tc.desc: Verify a BT.2020 primary falls outside the sRGB gamut and gets clipped.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvertOutOfGamut0001', 0, async (done: Function) => {
            await runCase('testConvertOutOfGamut0001', async (): Promise<void> => {
                const bt2020Red: RgbUnit = { r: 1, g: 0, b: 0 };
                const result: ConversionResult = convertRgb(BT2020_PRIMARIES, 2.2, SRGB_PRIMARIES, 2.2, bt2020Red);
                await addLog(`testConvertOutOfGamut0001: actual out of gamut=${result.outOfGamut}, expected=true`);
                expect(result.outOfGamut).assertTrue();
                await addLog(`testConvertOutOfGamut0001: actual red=${result.encoded.r}, expected>1`);
                expect(result.encoded.r > 1).assertTrue();
                await addLog(`testConvertOutOfGamut0001: actual clipped red=${result.clipped.r}, expected=1`);
                expect(result.clipped.r).assertEqual(1);
                await addLog(`testConvertOutOfGamut0001: actual hex=${byteToHex(result.clipped)}, expected=#ff0000`);
                expect(byteToHex(result.clipped)).assertEqual('#ff0000');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0030
         * @tc.name: testConvertWithinGamut0001
         * @tc.desc: Verify an sRGB primary stays inside Display P3 with a smaller red coordinate.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testConvertWithinGamut0001', 0, async (done: Function) => {
            await runCase('testConvertWithinGamut0001', async (): Promise<void> => {
                const srgbRed: RgbUnit = { r: 1, g: 0, b: 0 };
                const result: ConversionResult = convertRgb(SRGB_PRIMARIES, 2.2, P3_PRIMARIES, 2.2, srgbRed);
                await addLog(`testConvertWithinGamut0001: actual out of gamut=${result.outOfGamut}, expected=false`);
                expect(result.outOfGamut).assertFalse();
                await addLog(`testConvertWithinGamut0001: actual red=${result.encoded.r}, expected<1`);
                expect(result.encoded.r < 1).assertTrue();
                await addLog(`testConvertWithinGamut0001: actual red=${result.encoded.r}, expected>0.85`);
                expect(result.encoded.r > 0.85).assertTrue();
                await addLog('testConvertWithinGamut0001: actual clipped equals encoded, expected=true');
                expect(isCloseTo(result.clipped.g, result.encoded.g, 1.0e-9)).assertTrue();
            }, done);
        });

        // ==================== 可察觉度与相对面积（2 条） ====================

        /*
         * @tc.number: SUB_CS_MATH_0031
         * @tc.name: testPerceptibility0001
         * @tc.desc: Verify the four difference bands used by the pages.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testPerceptibility0001', 0, async (done: Function) => {
            await runCase('testPerceptibility0001', async (): Promise<void> => {
                await addLog('testPerceptibility0001: actual 0.5, expected=Imperceptible');
                expect(perceptibility(0.5)).assertEqual('Imperceptible');
                await addLog('testPerceptibility0001: actual 1.5, expected=Slight');
                expect(perceptibility(1.5)).assertEqual('Slight');
                await addLog('testPerceptibility0001: actual 5, expected=Noticeable');
                expect(perceptibility(5)).assertEqual('Noticeable');
                await addLog('testPerceptibility0001: actual 20, expected=Obvious');
                expect(perceptibility(20)).assertEqual('Obvious');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0032
         * @tc.name: testRelativeArea0001
         * @tc.desc: Verify sRGB covers about three quarters of the Display P3 area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testRelativeArea0001', 0, async (done: Function) => {
            await runCase('testRelativeArea0001', async (): Promise<void> => {
                const comparison: AreaComparison = relativeArea(SRGB_PRIMARIES, P3_PRIMARIES);
                await addLog(`testRelativeArea0001: actual ratio=${comparison.ratioToReference}, expected=0.737`);
                expect(isCloseTo(comparison.ratioToReference, 0.737, 0.01)).assertTrue();
                await addLog(`testRelativeArea0001: actual contains P3=${comparison.containsReference}, ` +
                  `expected=false`);
                expect(comparison.containsReference).assertFalse();
                await addLog('testRelativeArea0001: actual P3 contains sRGB, expected=true');
                expect(relativeArea(P3_PRIMARIES, SRGB_PRIMARIES).containsReference).assertTrue();
                await addLog(`testRelativeArea0001: actual ratio above one=${relativeArea(P3_PRIMARIES, SRGB_PRIMARIES)
                    .ratioToReference > 1}`);
                expect(relativeArea(P3_PRIMARIES, SRGB_PRIMARIES).ratioToReference > 1).assertTrue();
            }, done);
        });

        // ==================== 全部 26 个空间的数学一致性（2 条） ====================

        /*
         * @tc.number: SUB_CS_MATH_0033
         * @tc.name: testAllSpacesArea0001
         * @tc.desc: Verify every configured color space has a usable and non degenerate triangle.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testAllSpacesArea0001', 0, async (done: Function) => {
            await runCase('testAllSpacesArea0001', async (): Promise<void> => {
                const all: ColorSpaceInfo[] = getAllColorSpaces();
                let degenerate: number = 0;
                let smallest: number = 1;
                for (let i = 0; i < all.length; i++) {
                    const primaries: Primaries = primariesOf(all[i]);
                    const area: number = gamutArea(primaries);
                    if (isDegenerate(primaries)) {
                        degenerate++;
                    }
                    if (area < smallest) {
                        smallest = area;
                    }
                }
                await addLog(`testAllSpacesArea0001: actual entries=${all.length}, expected=26`);
                expect(all.length).assertEqual(26);
                await addLog(`testAllSpacesArea0001: actual degenerate spaces=${degenerate}, expected=0`);
                expect(degenerate).assertEqual(0);
                await addLog(`testAllSpacesArea0001: actual smallest area=${smallest}, expected>0.05`);
                expect(smallest > 0.05).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0034
         * @tc.name: testAllSpacesWhitePoint0001
         * @tc.desc: Verify the declared white point of every space lies inside its own triangle.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testAllSpacesWhitePoint0001', 0, async (done: Function) => {
            await runCase('testAllSpacesWhitePoint0001', async (): Promise<void> => {
                const all: ColorSpaceInfo[] = getAllColorSpaces();
                let inside: number = 0;
                let farFromD65: number = 0;
                const reference: Primaries = primariesOf(all[0]);
                for (let i = 0; i < all.length; i++) {
                    const primaries: Primaries = primariesOf(all[i]);
                    if (containsPoint(primaries, primaries.whiteX, primaries.whiteY)) {
                        inside++;
                    }
                    if (whitePointDistance(primaries, reference) > 0.02) {
                        farFromD65++;
                    }
                }
                await addLog(`testAllSpacesWhitePoint0001: actual inside=${inside}, expected=26`);
                expect(inside).assertEqual(26);
                await addLog(`testAllSpacesWhitePoint0001: actual far from D65=${farFromD65}, expected=1`);
                expect(farFromD65).assertEqual(1);
                await addLog('testAllSpacesWhitePoint0001: actual DCI_P3 distance, expected>0');
                expect(whitePointDistance(primariesOf(all[2]), reference) > 0).assertTrue();
            }, done);
        });

        // ==================== 显示辅助（3 条） ====================

        /*
         * @tc.number: SUB_CS_MATH_0035
         * @tc.name: testByteRoundTrip0001
         * @tc.desc: Verify the 8 bit helpers clamp and round as the pages expect.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testByteRoundTrip0001', 0, async (done: Function) => {
            await runCase('testByteRoundTrip0001', async (): Promise<void> => {
                await addLog(`testByteRoundTrip0001: actual toByte(0.5)=${toByte(0.5)}, expected=128`);
                expect(toByte(0.5)).assertEqual(128);
                await addLog(`testByteRoundTrip0001: actual toByte(1.7)=${toByte(1.7)}, expected=255`);
                expect(toByte(1.7)).assertEqual(255);
                await addLog(`testByteRoundTrip0001: actual toByte(-0.3)=${toByte(-0.3)}, expected=0`);
                expect(toByte(-0.3)).assertEqual(0);
                await addLog(`testByteRoundTrip0001: actual fromByte(255)=${fromByte(255)}, expected=1`);
                expect(fromByte(255)).assertEqual(1);
                await addLog(`testByteRoundTrip0001: actual fromByte(-4)=${fromByte(-4)}, expected=0`);
                expect(fromByte(-4)).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0036
         * @tc.name: testHexText0001
         * @tc.desc: Verify the hex and text helpers used by the preview blocks.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testHexText0001', 0, async (done: Function) => {
            await runCase('testHexText0001', async (): Promise<void> => {
                await addLog('testHexText0001: actual black hex, expected=#000000');
                expect(byteToHex({ r: 0, g: 0, b: 0 })).assertEqual('#000000');
                await addLog('testHexText0001: actual white hex, expected=#ffffff');
                expect(byteToHex({ r: 1, g: 1, b: 1 })).assertEqual('#ffffff');
                await addLog('testHexText0001: actual mixed hex, expected=#ff8000');
                expect(byteToHex({ r: 1, g: 0.5, b: 0 })).assertEqual('#ff8000');
                await addLog('testHexText0001: actual rgb text, expected=(255, 128, 0)');
                expect(rgbText({ r: 1, g: 0.5, b: 0 })).assertEqual('(255, 128, 0)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_MATH_0037
         * @tc.name: testPrimariesOf0001
         * @tc.desc: Verify the adapter copies every coordinate of the metadata entry.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testPrimariesOf0001', 0, async (done: Function) => {
            await runCase('testPrimariesOf0001', async (): Promise<void> => {
                const all: ColorSpaceInfo[] = getAllColorSpaces();
                const primaries: Primaries = primariesOf(all[0]);
                await addLog(`testPrimariesOf0001: actual redX=${primaries.redX}, expected=${all[0].redX}`);
                expect(primaries.redX).assertEqual(all[0].redX);
                await addLog(`testPrimariesOf0001: actual whiteY=${primaries.whiteY}, expected=${all[0].whiteY}`);
                expect(primaries.whiteY).assertEqual(all[0].whiteY);
                await addLog(`testPrimariesOf0001: actual blueY=${primaries.blueY}, expected=${all[0].blueY}`);
                expect(primaries.blueY).assertEqual(all[0].blueY);
            }, done);
        });
    });
}
