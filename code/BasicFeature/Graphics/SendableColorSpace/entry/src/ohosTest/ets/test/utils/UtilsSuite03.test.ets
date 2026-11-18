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
    ConversionResult, LabColor, Primaries, RgbUnit, XyzColor,
    deltaE76, deltaE94, deltaE2000, perceptibility, clip01,
    toByte, fromByte, toSignedByte, rgbSignedText, rgbText,
    byteToHex, labText, xyzText, convertRgb
} from '../../../../main/ets/common/ColorSpaceMath';

const SRGB_PRIMARIES: Primaries = {
    redX: 0.64, redY: 0.33, greenX: 0.30, greenY: 0.60, blueX: 0.15, blueY: 0.06,
    whiteX: 0.3127, whiteY: 0.3290
};
const P3_PRIMARIES: Primaries = {
    redX: 0.680, redY: 0.320, greenX: 0.265, greenY: 0.690, blueX: 0.150, blueY: 0.060,
    whiteX: 0.3127, whiteY: 0.3290
};
const NEUTRAL_LAB: LabColor = { l: 50, a: 0, b: 0 };
const CHROMATIC_LAB: LabColor = { l: 50, a: 30, b: 0 };
const BLUE_LAB: LabColor = { l: 50, a: 0, b: 40 };
const LIGHT_LAB: LabColor = { l: 60, a: 10, b: 0 };
const DARK_LAB: LabColor = { l: 30, a: -20, b: 30 };
const BYTE_VALUES: number[] = [0, 1, 64, 128, 200, 254, 255];

export default function utilsSuite03(): void {
    describe('UtilsSuite03', () => {

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0001
         * @tc.name: testNumberUtils0001
         * @tc.desc: Verify the Euclidean difference is symmetric, zero for one color and obeys the triangle inequality.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testNumberUtils0001', 0, async (done: Function) => {
            await runCase('testNumberUtils0001', async (): Promise<void> => {
                const forward: number = deltaE76(NEUTRAL_LAB, LIGHT_LAB);
                const backward: number = deltaE76(LIGHT_LAB, NEUTRAL_LAB);
                await addLog(`testNumberUtils0001: forward=${forward}, backward=${backward}`);
                expect(backward).assertEqual(forward);
                const direct: number = deltaE76(NEUTRAL_LAB, DARK_LAB);
                const detour: number = forward + deltaE76(LIGHT_LAB, DARK_LAB);
                await addLog(`testNumberUtils0001: direct=${direct}, detour=${detour}`);
                expect(direct <= detour).assertTrue();
                await addLog(`testNumberUtils0001: identity=${deltaE76(NEUTRAL_LAB, NEUTRAL_LAB)}, expected=0`);
                expect(deltaE76(NEUTRAL_LAB, NEUTRAL_LAB)).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0002
         * @tc.name: testNumberUtils0002
         * @tc.desc: Verify the CIE94 difference weights the hue term with the first color chroma and is therefore
         * asymmetric.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0002', 0, async (done: Function) => {
            await runCase('testNumberUtils0002', async (): Promise<void> => {
                const forward: number = deltaE94(CHROMATIC_LAB, BLUE_LAB);
                const backward: number = deltaE94(BLUE_LAB, CHROMATIC_LAB);
                await addLog(`testNumberUtils0002: forward=${forward}, backward=${backward}`);
                expect(forward > backward).assertTrue();
                await addLog(`testNumberUtils0002: gap=${forward - backward}, expected>2`);
                expect(forward - backward > 2).assertTrue();
                await addLog(`testNumberUtils0002: forward=${forward}, ` +
                  `below CIE76=${deltaE76(CHROMATIC_LAB, BLUE_LAB)}`);
                expect(forward < deltaE76(CHROMATIC_LAB, BLUE_LAB)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0003
         * @tc.name: testNumberUtils0003
         * @tc.desc: Verify a pure lightness difference stays symmetric and keeps the full Euclidean magnitude under
         * CIE94.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0003', 0, async (done: Function) => {
            await runCase('testNumberUtils0003', async (): Promise<void> => {
                const light: LabColor = { l: 60, a: 0, b: 0 };
                const dark: LabColor = { l: 50, a: 0, b: 0 };
                const forward: number = deltaE94(light, dark);
                await addLog(`testNumberUtils0003: forward=${forward}, expected=10`);
                expect(isCloseTo(forward, 10, 1.0e-9)).assertTrue();
                const backward: number = deltaE94(dark, light);
                await addLog(`testNumberUtils0003: backward=${backward}, forward=${forward}`);
                expect(backward).assertEqual(forward);
                await addLog(`testNumberUtils0003: euclidean=${deltaE76(light, dark)}, expected=${forward}`);
                expect(isCloseTo(deltaE76(light, dark), forward, 1.0e-9)).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0004
         * @tc.name: testNumberUtils0004
         * @tc.desc: Verify the CIE2000 difference is zero for one color and keeps the triangle inequality between three
         * colors.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0004', 0, async (done: Function) => {
            await runCase('testNumberUtils0004', async (): Promise<void> => {
                const direct: number = deltaE2000(NEUTRAL_LAB, LIGHT_LAB);
                const detour: number = deltaE2000(NEUTRAL_LAB, DARK_LAB) + deltaE2000(LIGHT_LAB, DARK_LAB);
                await addLog(`testNumberUtils0004: direct=${direct}, detour=${detour}`);
                expect(direct <= detour).assertTrue();
                await addLog(`testNumberUtils0004: direct positive=${direct > 0}, expected=true`);
                expect(direct > 0).assertTrue();
                await addLog(`testNumberUtils0004: identity=${deltaE2000(DARK_LAB, DARK_LAB)}, expected=0`);
                expect(deltaE2000(DARK_LAB, DARK_LAB)).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0005
         * @tc.name: testNumberUtils0005
         * @tc.desc: Verify two colors straddling the zero degree hue axis stay symmetric and nearly identical.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0005', 0, async (done: Function) => {
            await runCase('testNumberUtils0005', async (): Promise<void> => {
                const below: LabColor = { l: 50, a: 10, b: -0.0001 };
                const above: LabColor = { l: 50, a: 10, b: 0.0001 };
                const forward: number = deltaE2000(below, above);
                const backward: number = deltaE2000(above, below);
                await addLog(`testNumberUtils0005: forward=${forward}, backward=${backward}`);
                expect(isCloseTo(forward, backward, 1.0e-9)).assertTrue();
                await addLog(`testNumberUtils0005: forward=${forward}, expected<0.001`);
                expect(forward < 0.001).assertTrue();
                await addLog(`testNumberUtils0005: forward positive=${forward > 0}, expected=true`);
                expect(forward > 0).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0006
         * @tc.name: testNumberUtils0006
         * @tc.desc: Verify a ten unit lightness step shrinks slightly under the CIE2000 lightness scale.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0006', 0, async (done: Function) => {
            await runCase('testNumberUtils0006', async (): Promise<void> => {
                const lighter: LabColor = { l: 60, a: 0, b: 0 };
                const value: number = deltaE2000(NEUTRAL_LAB, lighter);
                await addLog(`testNumberUtils0006: value=${value}, expected=9.471`);
                expect(isCloseTo(value, 9.471, 0.01)).assertTrue();
                await addLog(`testNumberUtils0006: below ten=${value < 10}, expected=true`);
                expect(value < 10).assertTrue();
                await addLog(`testNumberUtils0006: above nine=${value > 9}, expected=true`);
                expect(value > 9).assertTrue();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0007
         * @tc.name: testNumberUtils0007
         * @tc.desc: Verify the perceptibility bands switch exactly on the published thresholds.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testNumberUtils0007', 0, async (done: Function) => {
            await runCase('testNumberUtils0007', async (): Promise<void> => {
                await addLog(`testNumberUtils0007: 0.9999=${perceptibility(0.9999)}, expected=Imperceptible`);
                expect(perceptibility(0.9999)).assertEqual('Imperceptible');
                await addLog(`testNumberUtils0007: 1.0=${perceptibility(1.0)}, expected=Slight`);
                expect(perceptibility(1.0)).assertEqual('Slight');
                await addLog(`testNumberUtils0007: 2.0=${perceptibility(2.0)}, expected=Noticeable`);
                expect(perceptibility(2.0)).assertEqual('Noticeable');
                await addLog(`testNumberUtils0007: 10.0=${perceptibility(10.0)}, expected=Obvious`);
                expect(perceptibility(10.0)).assertEqual('Obvious');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0008
         * @tc.name: testNumberUtils0008
         * @tc.desc: Verify the lower edge of every perceptibility band and the overflow above the last threshold.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0008', 0, async (done: Function) => {
            await runCase('testNumberUtils0008', async (): Promise<void> => {
                await addLog(`testNumberUtils0008: 0=${perceptibility(0)}, expected=Imperceptible`);
                expect(perceptibility(0)).assertEqual('Imperceptible');
                await addLog(`testNumberUtils0008: 1.9999=${perceptibility(1.9999)}, expected=Slight`);
                expect(perceptibility(1.9999)).assertEqual('Slight');
                await addLog(`testNumberUtils0008: 9.9999=${perceptibility(9.9999)}, expected=Noticeable`);
                expect(perceptibility(9.9999)).assertEqual('Noticeable');
                await addLog(`testNumberUtils0008: 1e9=${perceptibility(1.0e9)}, expected=Obvious`);
                expect(perceptibility(1.0e9)).assertEqual('Obvious');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0009
         * @tc.name: testNumberUtils0009
         * @tc.desc: Verify the clip helper keeps NaN untouched and saturates both infinities and negative zero.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0009', 0, async (done: Function) => {
            await runCase('testNumberUtils0009', async (): Promise<void> => {
                await addLog(`testNumberUtils0009: NaN=${clip01(Number.NaN)}, expected=NaN`);
                expect(String(clip01(Number.NaN))).assertEqual('NaN');
                await addLog(`testNumberUtils0009: +Infinity=${clip01(Number.POSITIVE_INFINITY)}, expected=1`);
                expect(clip01(Number.POSITIVE_INFINITY)).assertEqual(1);
                await addLog(`testNumberUtils0009: -Infinity=${clip01(Number.NEGATIVE_INFINITY)}, expected=0`);
                expect(clip01(Number.NEGATIVE_INFINITY)).assertEqual(0);
                await addLog(`testNumberUtils0009: negative zero=${clip01(-0)}, expected=0`);
                expect(clip01(-0)).assertEqual(0);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0010
         * @tc.name: testNumberUtils0010
         * @tc.desc: Verify the byte decoder maps the whole integer range inside the unit interval.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testNumberUtils0010', 0, async (done: Function) => {
            await runCase('testNumberUtils0010', async (): Promise<void> => {
                await addLog(`testNumberUtils0010: fromByte(0)=${fromByte(0)}, expected=0`);
                expect(fromByte(0)).assertEqual(0);
                await addLog(`testNumberUtils0010: fromByte(127.5)=${fromByte(127.5)}, expected=0.5`);
                expect(fromByte(127.5)).assertEqual(0.5);
                await addLog(`testNumberUtils0010: fromByte(256)=${fromByte(256)}, expected=1`);
                expect(fromByte(256)).assertEqual(1);
                await addLog(`testNumberUtils0010: fromByte(1000000)=${fromByte(1000000)}, expected=1`);
                expect(fromByte(1000000)).assertEqual(1);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0011
         * @tc.name: testNumberUtils0011
         * @tc.desc: Verify every integer byte survives a decode and encode round trip unchanged.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0011', 0, async (done: Function) => {
            await runCase('testNumberUtils0011', async (): Promise<void> => {
                let matched: number = 0;
                for (let index = 0; index < BYTE_VALUES.length; index++) {
                    if (toByte(fromByte(BYTE_VALUES[index])) === BYTE_VALUES[index]) {
                        matched++;
                    }
                }
                await addLog(`testNumberUtils0011: matched=${matched}, expected=${BYTE_VALUES.length}`);
                expect(matched).assertEqual(BYTE_VALUES.length);
                await addLog(`testNumberUtils0011: round trip 128=${toByte(fromByte(128))}, expected=128`);
                expect(toByte(fromByte(128))).assertEqual(128);
                await addLog(`testNumberUtils0011: round trip 255=${toByte(fromByte(255))}, expected=255`);
                expect(toByte(fromByte(255))).assertEqual(255);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0012
         * @tc.name: testNumberUtils0012
         * @tc.desc: Verify the byte encoder rounds at the half step and saturates the last bucket.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0012', 0, async (done: Function) => {
            await runCase('testNumberUtils0012', async (): Promise<void> => {
                await addLog(`testNumberUtils0012: toByte(0.0019)=${toByte(0.0019)}, expected=0`);
                expect(toByte(0.0019)).assertEqual(0);
                await addLog(`testNumberUtils0012: toByte(0.002)=${toByte(0.002)}, expected=1`);
                expect(toByte(0.002)).assertEqual(1);
                await addLog(`testNumberUtils0012: toByte(0.998)=${toByte(0.998)}, expected=254`);
                expect(toByte(0.998)).assertEqual(254);
                await addLog(`testNumberUtils0012: toByte(0.9999)=${toByte(0.9999)}, expected=255`);
                expect(toByte(0.9999)).assertEqual(255);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0013
         * @tc.name: testNumberUtils0013
         * @tc.desc: Verify the signed byte helper keeps the sign and the overflow of out of gamut channels.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testNumberUtils0013', 0, async (done: Function) => {
            await runCase('testNumberUtils0013', async (): Promise<void> => {
                await addLog(`testNumberUtils0013: -0.5=${toSignedByte(-0.5)}, expected=-127`);
                expect(toSignedByte(-0.5)).assertEqual(-127);
                await addLog(`testNumberUtils0013: 0.5=${toSignedByte(0.5)}, expected=128`);
                expect(toSignedByte(0.5)).assertEqual(128);
                await addLog(`testNumberUtils0013: 1.5=${toSignedByte(1.5)}, expected=383`);
                expect(toSignedByte(1.5)).assertEqual(383);
                await addLog(`testNumberUtils0013: -1.5=${toSignedByte(-1.5)}, expected=-382`);
                expect(toSignedByte(-1.5)).assertEqual(-382);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0014
         * @tc.name: testNumberUtils0014
         * @tc.desc: Verify the signed text keeps the overflow while the clipped text stops at the byte edges.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 0
         */
        it('testNumberUtils0014', 0, async (done: Function) => {
            await runCase('testNumberUtils0014', async (): Promise<void> => {
                const overflow: RgbUnit = { r: -0.5, g: 0.5, b: 1.5 };
                await addLog(`testNumberUtils0014: signed=${rgbSignedText(overflow)}, expected=(-127, 128, 383)`);
                expect(rgbSignedText(overflow)).assertEqual('(-127, 128, 383)');
                await addLog(`testNumberUtils0014: clipped=${rgbText(overflow)}, expected=(0, 128, 255)`);
                expect(rgbText(overflow)).assertEqual('(0, 128, 255)');
                const black: RgbUnit = { r: 0, g: 0, b: 0 };
                await addLog(`testNumberUtils0014: black signed=${rgbSignedText(black)}, expected=(0, 0, 0)`);
                expect(rgbSignedText(black)).assertEqual('(0, 0, 0)');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0015
         * @tc.name: testNumberUtils0015
         * @tc.desc: Verify the hex helper pads single digit channels and keeps lower case letters.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0015', 0, async (done: Function) => {
            await runCase('testNumberUtils0015', async (): Promise<void> => {
                const low: RgbUnit = { r: 0.04, g: 0.08, b: 0.12 };
                await addLog(`testNumberUtils0015: low=${byteToHex(low)}, expected=#0a141f`);
                expect(byteToHex(low)).assertEqual('#0a141f');
                const middle: RgbUnit = { r: 0.5, g: 0.5, b: 0.5 };
                await addLog(`testNumberUtils0015: middle=${byteToHex(middle)}, expected=#808080`);
                expect(byteToHex(middle)).assertEqual('#808080');
                const black: RgbUnit = { r: 0, g: 0, b: 0 };
                await addLog(`testNumberUtils0015: black=${byteToHex(black)}, expected=#000000`);
                expect(byteToHex(black)).assertEqual('#000000');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0016
         * @tc.name: testNumberUtils0016
         * @tc.desc: Verify the Lab and XYZ text helpers print two and four decimals with explicit signs.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0016', 0, async (done: Function) => {
            await runCase('testNumberUtils0016', async (): Promise<void> => {
                const lab: LabColor = { l: 50, a: -1.5, b: 2.25 };
                await addLog(`testNumberUtils0016: lab=${labText(lab)}, expected=L=50.00 a=-1.50 b=2.25`);
                expect(labText(lab)).assertEqual('L=50.00 a=-1.50 b=2.25');
                const xyz: XyzColor = { x: 0.95047, y: 1, z: 1.08883 };
                await addLog(`testNumberUtils0016: xyz=${xyzText(xyz)}, expected=X=0.9505 Y=1.0000 Z=1.0888`);
                expect(xyzText(xyz)).assertEqual('X=0.9505 Y=1.0000 Z=1.0888');
                const origin: LabColor = { l: 0, a: 0, b: 0 };
                await addLog(`testNumberUtils0016: origin=${labText(origin)}, expected=L=0.00 a=0.00 b=0.00`);
                expect(labText(origin)).assertEqual('L=0.00 a=0.00 b=0.00');
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0017
         * @tc.name: testNumberUtils0017
         * @tc.desc: Verify black and white survive a cross space conversion without entering the out of gamut branch.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0017', 0, async (done: Function) => {
            await runCase('testNumberUtils0017', async (): Promise<void> => {
                const black: RgbUnit = { r: 0, g: 0, b: 0 };
                const blackResult: ConversionResult = convertRgb(SRGB_PRIMARIES, 2.2, P3_PRIMARIES, 2.2, black);
                const blackSum: number = blackResult.encoded.r + blackResult.encoded.g + blackResult.encoded.b;
                await addLog(`testNumberUtils0017: black encoded sum=${blackSum}, expected=0`);
                expect(blackSum).assertEqual(0);
                await addLog(`testNumberUtils0017: black lightness=${blackResult.lab.l}, expected=0`);
                expect(blackResult.lab.l).assertEqual(0);
                const white: RgbUnit = { r: 1, g: 1, b: 1 };
                const whiteResult: ConversionResult = convertRgb(SRGB_PRIMARIES, 2.2, P3_PRIMARIES, 2.2, white);
                await addLog(`testNumberUtils0017: white clipped red=${whiteResult.clipped.r}, expected=1`);
                expect(isCloseTo(whiteResult.clipped.r, 1, 1.0e-6)).assertTrue();
                await addLog(`testNumberUtils0017: white out of gamut=${whiteResult.outOfGamut}, expected=false`);
                expect(whiteResult.outOfGamut).assertFalse();
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0018
         * @tc.name: testNumberUtils0018
         * @tc.desc: Verify converting an encoded value into a linear space returns the decoded channel without
         * overflow.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0018', 0, async (done: Function) => {
            await runCase('testNumberUtils0018', async (): Promise<void> => {
                const middle: RgbUnit = { r: 0.5, g: 0.5, b: 0.5 };
                const result: ConversionResult = convertRgb(SRGB_PRIMARIES, 2.2, SRGB_PRIMARIES, 1.0, middle);
                await addLog(`testNumberUtils0018: encoded red=${result.encoded.r}, expected=0.2175`);
                expect(isCloseTo(result.encoded.r, 0.2175, 0.001)).assertTrue();
                await addLog(`testNumberUtils0018: encoded red below a quarter=${result.encoded.r < 0.25}, ` +
                  `expected=true`);
                expect(result.encoded.r < 0.25).assertTrue();
                await addLog(`testNumberUtils0018: clipped red=${result.clipped.r}, encoded red=${result.encoded.r}`);
                expect(result.clipped.r).assertEqual(result.encoded.r);
            }, done);
        });

        /*
         * @tc.number: SUB_CS_UTIL_NUM_0019
         * @tc.name: testNumberUtils0019
         * @tc.desc: Verify a conversion through a wider intermediate space returns the original channel triple.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level Level 1
         */
        it('testNumberUtils0019', 0, async (done: Function) => {
            await runCase('testNumberUtils0019', async (): Promise<void> => {
                const source: RgbUnit = { r: 0.2, g: 0.4, b: 0.6 };
                const forward: ConversionResult = convertRgb(SRGB_PRIMARIES, 2.2, P3_PRIMARIES, 2.2, source);
                const backward: ConversionResult =
                    convertRgb(P3_PRIMARIES, 2.2, SRGB_PRIMARIES, 2.2, forward.encoded);
                await addLog(`testNumberUtils0019: red back=${backward.encoded.r}, expected=0.2`);
                expect(isCloseTo(backward.encoded.r, 0.2, 1.0e-6)).assertTrue();
                await addLog(`testNumberUtils0019: green back=${backward.encoded.g}, expected=0.4`);
                expect(isCloseTo(backward.encoded.g, 0.4, 1.0e-6)).assertTrue();
                await addLog(`testNumberUtils0019: blue back=${backward.encoded.b}, expected=0.6`);
                expect(isCloseTo(backward.encoded.b, 0.6, 1.0e-6)).assertTrue();
            }, done);
        });
    });
}
