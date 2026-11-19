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

import { ColorSpaceInfo } from './ColorSpaceData';

// Chromaticity coordinates of one color space, as published in its specification.
export interface Primaries {
    redX: number;
    redY: number;
    greenX: number;
    greenY: number;
    blueX: number;
    blueY: number;
    whiteX: number;
    whiteY: number;
}

export interface XyzColor {
    x: number;
    y: number;
    z: number;
}

export interface LabColor {
    l: number;
    a: number;
    b: number;
}

// Channels are normalised to 0..1 so the same code serves 8 bit input and slider input.
export interface RgbUnit {
    r: number;
    g: number;
    b: number;
}

export interface ConversionResult {
    encoded: RgbUnit;
    clipped: RgbUnit;
    outOfGamut: boolean;
    xyz: XyzColor;
    lab: LabColor;
}

export interface AreaComparison {
    area: number;
    ratioToReference: number;
    containsReference: boolean;
}

// D65 is the reference white of the sRGB family, which every standard space in this sample derives from.
export const D65_X: number = 0.95047;
export const D65_Y: number = 1.0;
export const D65_Z: number = 1.08883;

const LAB_EPSILON: number = 0.008856;
const LAB_KAPPA: number = 903.3;
const LAB_CUBE_ROOT: number = 1.0 / 3.0;
const SRGB_LINEAR_LIMIT: number = 0.0031308;
const SRGB_ENCODED_LIMIT: number = 0.04045;
const SRGB_SLOPE: number = 12.92;
const SRGB_OFFSET: number = 0.055;
const SRGB_SCALE: number = 1.055;
const SRGB_EXPONENT: number = 2.4;
// Poseen weights keep the hue term of CIE94 from exploding on near neutral colors.
const CIE94_HUE_WEIGHT: number = 0.045;
// CIE2000 constants from the published formulation.
const CIE2000_POWER: number = 25.0;
const CIE2000_CHROMA_SCALE: number = 7.0;
const CIE2000_HUE_SHIFT: number = 30.0;
// The 63 below is the phase offset of the fourth cosine term in the published twist polynomial.
const CIE2000_SCALE: number = 63.0;
const DEGREES_PER_RADIAN: number = 180.0 / Math.PI;
const RADIANS_PER_DEGREE: number = Math.PI / 180.0;
const FULL_CIRCLE: number = 360.0;
const HALF_CIRCLE: number = 180.0;
const PERCEPTIBLE_LIMIT: number = 1.0;
const SLIGHT_LIMIT: number = 2.0;
const NOTICEABLE_LIMIT: number = 10.0;

// Convert the metadata table entry into the primitive form used by the math below.
export function primariesOf(info: ColorSpaceInfo): Primaries {
    const primaries: Primaries = {
        redX: info.redX, redY: info.redY,
        greenX: info.greenX, greenY: info.greenY,
        blueX: info.blueX, blueY: info.blueY,
        whiteX: info.whiteX, whiteY: info.whiteY
    };
    return primaries;
}

export function clip01(value: number): number {
    if (value < 0) {
        return 0;
    }
    if (value > 1) {
        return 1;
    }
    return value;
}

// Area of the triangle spanned by the three primaries in the CIE xy plane.
export function gamutArea(primaries: Primaries): number {
    const doubled: number = primaries.redX * (primaries.greenY - primaries.blueY) +
        primaries.greenX * (primaries.blueY - primaries.redY) +
        primaries.blueX * (primaries.redY - primaries.greenY);
    return 0.5 * Math.abs(doubled);
}

function crossProduct(ax: number, ay: number, bx: number, by: number, px: number, py: number): number {
    return (bx - ax) * (py - ay) - (by - ay) * (px - ax);
}

// A point is inside the triangle when it never falls on a single side of all three edges.
export function containsPoint(primaries: Primaries, x: number, y: number): boolean {
    if (gamutArea(primaries) < 1.0e-9) {
        return false;
    }
    const first: number = crossProduct(primaries.redX, primaries.redY, primaries.greenX, primaries.greenY, x, y);
    const second: number = crossProduct(primaries.greenX, primaries.greenY, primaries.blueX, primaries.blueY, x, y);
    const third: number = crossProduct(primaries.blueX, primaries.blueY, primaries.redX, primaries.redY, x, y);
    const hasNegative: boolean = first < 0 || second < 0 || third < 0;
    const hasPositive: boolean = first > 0 || second > 0 || third > 0;
    return !(hasNegative && hasPositive);
}

// A degenerate gamut is a real input case: three primaries may be typed on one line.
export function isDegenerate(primaries: Primaries): boolean {
    return gamutArea(primaries) < 1.0e-6;
}

export function whitePointDistance(first: Primaries, second: Primaries): number {
    const dx: number = first.whiteX - second.whiteX;
    const dy: number = first.whiteY - second.whiteY;
    return Math.sqrt(dx * dx + dy * dy);
}

export function relativeArea(candidate: Primaries, reference: Primaries): AreaComparison {
    const candidateArea: number = gamutArea(candidate);
    const referenceArea: number = gamutArea(reference);
    const ratio: number = referenceArea > 0 ? candidateArea / referenceArea : Number.NaN;
    const result: AreaComparison = {
        area: candidateArea,
        ratioToReference: ratio,
        containsReference: containsPoint(candidate, reference.redX, reference.redY) &&
            containsPoint(candidate, reference.greenX, reference.greenY) &&
            containsPoint(candidate, reference.blueX, reference.blueY)
    };
    return result;
}

// CIE xy with Y pinned to 1, which is the convention used to recover the RGB to XYZ matrix.
export function xyToXyz(x: number, y: number): XyzColor {
    if (y <= 0) {
        const black: XyzColor = { x: 0, y: 0, z: 0 };
        return black;
    }
    const color: XyzColor = { x: x / y, y: 1, z: (1 - x - y) / y };
    return color;
}

export function invert3x3(matrix: number[]): number[] {
    const a: number = matrix[0];
    const b: number = matrix[1];
    const c: number = matrix[2];
    const d: number = matrix[3];
    const e: number = matrix[4];
    const f: number = matrix[5];
    const g: number = matrix[6];
    const h: number = matrix[7];
    const i: number = matrix[8];
    const determinant: number = a * (e * i - f * h) - b * (d * i - f * g) + c * (d * h - e * g);
    if (Math.abs(determinant) < 1.0e-12) {
        const zeros: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0];
        return zeros;
    }
    const scale: number = 1.0 / determinant;
    const inverse: number[] = [
        (e * i - f * h) * scale, (c * h - b * i) * scale, (b * f - c * e) * scale,
        (f * g - d * i) * scale, (a * i - c * g) * scale, (c * d - a * f) * scale,
        (d * h - e * g) * scale, (b * g - a * h) * scale, (a * e - b * d) * scale
    ];
    return inverse;
}

export function multiplyMatrix(matrix: number[], r: number, g: number, b: number): XyzColor {
    const color: XyzColor = {
        x: matrix[0] * r + matrix[1] * g + matrix[2] * b,
        y: matrix[3] * r + matrix[4] * g + matrix[5] * b,
        z: matrix[6] * r + matrix[7] * g + matrix[8] * b
    };
    return color;
}

// Row major 3x3 matrix that maps linear RGB of the given primaries onto XYZ.
export function rgbToXyzMatrix(primaries: Primaries): number[] {
    const redZ: number = (1 - primaries.redX - primaries.redY) / primaries.redY;
    const greenZ: number = (1 - primaries.greenX - primaries.greenY) / primaries.greenY;
    const blueZ: number = (1 - primaries.blueX - primaries.blueY) / primaries.blueY;
    const unscaled: number[] = [
        primaries.redX / primaries.redY, primaries.greenX / primaries.greenY, primaries.blueX / primaries.blueY,
        1, 1, 1,
        redZ, greenZ, blueZ
    ];
    const inverse: number[] = invert3x3(unscaled);
    const white: XyzColor = xyToXyz(primaries.whiteX, primaries.whiteY);
    const redScale: number = inverse[0] * white.x + inverse[1] * white.y + inverse[2] * white.z;
    const greenScale: number = inverse[3] * white.x + inverse[4] * white.y + inverse[5] * white.z;
    const blueScale: number = inverse[6] * white.x + inverse[7] * white.y + inverse[8] * white.z;
    const matrix: number[] = [
        unscaled[0] * redScale, unscaled[1] * greenScale, unscaled[2] * blueScale,
        unscaled[3] * redScale, unscaled[4] * greenScale, unscaled[5] * blueScale,
        unscaled[6] * redScale, unscaled[7] * greenScale, unscaled[8] * blueScale
    ];
    return matrix;
}

// The sRGB transfer function is piecewise linear near black, which a plain power curve cannot reproduce.
export function srgbToLinear(value: number): number {
    const clipped: number = clip01(value);
    if (clipped <= SRGB_ENCODED_LIMIT) {
        return clipped / SRGB_SLOPE;
    }
    return Math.pow((clipped + SRGB_OFFSET) / SRGB_SCALE, SRGB_EXPONENT);
}

export function linearToSrgb(value: number): number {
    const clipped: number = clip01(value);
    if (clipped <= SRGB_LINEAR_LIMIT) {
        return clipped * SRGB_SLOPE;
    }
    return SRGB_SCALE * Math.pow(clipped, 1.0 / SRGB_EXPONENT) - SRGB_OFFSET;
}

// gamma is the exponent of the encoded value, so a 2.2 display needs a 1/2.2 power to decode.
export function applyGamma(value: number, gamma: number): number {
    if (gamma <= 0) {
        return clip01(value);
    }
    return Math.pow(clip01(value), 1.0 / gamma);
}

export function removeGamma(value: number, gamma: number): number {
    if (gamma <= 0) {
        return clip01(value);
    }
    return Math.pow(clip01(value), gamma);
}

export function rgbToXyz(color: RgbUnit, gamma: number, primaries: Primaries): XyzColor {
    const linear: RgbUnit = {
        r: removeGamma(color.r, gamma),
        g: removeGamma(color.g, gamma),
        b: removeGamma(color.b, gamma)
    };
    const matrix: number[] = rgbToXyzMatrix(primaries);
    return multiplyMatrix(matrix, linear.r, linear.g, linear.b);
}

function labForward(value: number): number {
    if (value > LAB_EPSILON) {
        return Math.pow(value, LAB_CUBE_ROOT);
    }
    return (LAB_KAPPA * value + 16.0) / 116.0;
}

function labInverse(value: number): number {
    const cubed: number = value * value * value;
    if (cubed > LAB_EPSILON) {
        return cubed;
    }
    return (116.0 * value - 16.0) / LAB_KAPPA;
}

export function xyzToLab(color: XyzColor): LabColor {
    const fx: number = labForward(color.x / D65_X);
    const fy: number = labForward(color.y / D65_Y);
    const fz: number = labForward(color.z / D65_Z);
    const lab: LabColor = { l: 116.0 * fy - 16.0, a: 500.0 * (fx - fy), b: 200.0 * (fy - fz) };
    return lab;
}

export function labToXyz(color: LabColor): XyzColor {
    const fy: number = (color.l + 16.0) / 116.0;
    const fx: number = fy + color.a / 500.0;
    const fz: number = fy - color.b / 200.0;
    const xyz: XyzColor = {
        x: D65_X * labInverse(fx),
        y: D65_Y * labInverse(fy),
        z: D65_Z * labInverse(fz)
    };
    return xyz;
}

export function deltaE76(first: LabColor, second: LabColor): number {
    const dl: number = first.l - second.l;
    const da: number = first.a - second.a;
    const db: number = first.b - second.b;
    return Math.sqrt(dl * dl + da * da + db * db);
}

export function deltaE94(first: LabColor, second: LabColor): number {
    const deltaL: number = first.l - second.l;
    const chromaFirst: number = Math.sqrt(first.a * first.a + first.b * first.b);
    const chromaSecond: number = Math.sqrt(second.a * second.a + second.b * second.b);
    const deltaC: number = chromaFirst - chromaSecond;
    const deltaA: number = first.a - second.a;
    const deltaB: number = first.b - second.b;
    const deltaHSquared: number = deltaA * deltaA + deltaB * deltaB - deltaC * deltaC;
    const deltaH: number = deltaHSquared > 0 ? Math.sqrt(deltaHSquared) : 0;
    const hueScale: number = 1.0 + CIE94_HUE_WEIGHT * chromaFirst;
    const value: number = deltaL * deltaL + deltaC * deltaC + (deltaH * deltaH) / (hueScale * hueScale);
    return Math.sqrt(value);
}

function hueAngle(a: number, b: number): number {
    if (Math.abs(a) < 1.0e-12 && Math.abs(b) < 1.0e-12) {
        return 0;
    }
    const degrees: number = Math.atan2(b, a) * DEGREES_PER_RADIAN;
    return degrees < 0 ? degrees + FULL_CIRCLE : degrees;
}

// CIE2000 is the recommended difference metric and the only one that stays symmetric around the hue circle.
export function deltaE2000(first: LabColor, second: LabColor): number {
    const chromaFirst: number = Math.sqrt(first.a * first.a + first.b * first.b);
    const chromaSecond: number = Math.sqrt(second.a * second.a + second.b * second.b);
    const meanChroma: number = (chromaFirst + chromaSecond) / 2.0;
    const meanChromaPower: number = Math.pow(meanChroma, CIE2000_CHROMA_SCALE);
    const powerReference: number = Math.pow(CIE2000_POWER, CIE2000_CHROMA_SCALE);
    const scaleDenominator: number = meanChromaPower + powerReference;
    const chromaScale: number = 1.0 + 0.5 * (1.0 -
        Math.sqrt(scaleDenominator === 0 ? 0 : meanChromaPower / scaleDenominator));
    // The published ``a'`` already carries the 1 + G factor, so the scale is applied as is.
    const scaledAFirst: number = chromaScale * first.a;
    const scaledASecond: number = chromaScale * second.a;
    const scaledChromaFirst: number = Math.sqrt(scaledAFirst * scaledAFirst + first.b * first.b);
    const scaledChromaSecond: number = Math.sqrt(scaledASecond * scaledASecond + second.b * second.b);
    const hueFirst: number = hueAngle(scaledAFirst, first.b);
    const hueSecond: number = hueAngle(scaledASecond, second.b);
    const chromaProduct: number = scaledChromaFirst * scaledChromaSecond;
    const deltaL: number = second.l - first.l;
    const deltaC: number = scaledChromaSecond - scaledChromaFirst;
    let deltaHueDegrees: number = 0;
    if (chromaProduct !== 0) {
        const rawDelta: number = hueSecond - hueFirst;
        if (Math.abs(rawDelta) <= HALF_CIRCLE) {
            deltaHueDegrees = rawDelta;
        } else if (rawDelta > HALF_CIRCLE) {
            deltaHueDegrees = rawDelta - FULL_CIRCLE;
        } else {
            deltaHueDegrees = rawDelta + FULL_CIRCLE;
        }
    }
    const deltaH: number = 2.0 * Math.sqrt(chromaProduct) *
        Math.sin((deltaHueDegrees * RADIANS_PER_DEGREE) / 2.0);
    const meanL: number = (first.l + second.l) / 2.0;
    const meanScaledChroma: number = (scaledChromaFirst + scaledChromaSecond) / 2.0;
    let meanHue: number = hueFirst + hueSecond;
    if (chromaProduct !== 0) {
        const rawDifference: number = Math.abs(hueFirst - hueSecond);
        if (rawDifference <= HALF_CIRCLE) {
            meanHue = (hueFirst + hueSecond) / 2.0;
        } else if (hueFirst + hueSecond < FULL_CIRCLE) {
            meanHue = (hueFirst + hueSecond + FULL_CIRCLE) / 2.0;
        } else {
            meanHue = (hueFirst + hueSecond - FULL_CIRCLE) / 2.0;
        }
    }
    const meanHueRadians: number = meanHue * RADIANS_PER_DEGREE;
    const twist: number = 1.0 - 0.17 * Math.cos(meanHueRadians - CIE2000_HUE_SHIFT * RADIANS_PER_DEGREE) +
        0.24 * Math.cos(2.0 * meanHueRadians) +
        0.32 * Math.cos(3.0 * meanHueRadians + 6.0 * RADIANS_PER_DEGREE) -
        0.20 * Math.cos(4.0 * meanHueRadians - CIE2000_SCALE * RADIANS_PER_DEGREE);
    const hueOffset: number = (meanHue - 275.0) / CIE2000_POWER;
    const rotationAngle: number = CIE2000_HUE_SHIFT * Math.exp(-(hueOffset * hueOffset));
    const rotationTerm: number = 2.0 * Math.sqrt(meanChromaPower / (meanChromaPower + powerReference));
    const lightnessOffset: number = meanL - 50.0;
    const lightnessScale: number = 1.0 + 0.015 * lightnessOffset * lightnessOffset /
        Math.sqrt(20.0 + lightnessOffset * lightnessOffset);
    const chromaScaleFactor: number = 1.0 + 0.045 * meanScaledChroma;
    const hueScaleFactor: number = 1.0 + 0.015 * meanScaledChroma * twist;
    const rotation: number = -Math.sin(2.0 * rotationAngle * RADIANS_PER_DEGREE) * rotationTerm;
    const scaledL: number = deltaL / lightnessScale;
    const scaledC: number = deltaC / chromaScaleFactor;
    const scaledH: number = deltaH / hueScaleFactor;
    const total: number = scaledL * scaledL + scaledC * scaledC + scaledH * scaledH +
        rotation * scaledC * scaledH;
    return Math.sqrt(Math.max(0, total));
}

export function perceptibility(deltaE: number): string {
    if (deltaE < PERCEPTIBLE_LIMIT) {
        return 'Imperceptible';
    }
    if (deltaE < SLIGHT_LIMIT) {
        return 'Slight';
    }
    if (deltaE < NOTICEABLE_LIMIT) {
        return 'Noticeable';
    }
    return 'Obvious';
}

// Out of gamut channels must keep their sign and their overflow, otherwise the clipped copy carries no new information.
function encodeSigned(value: number, gamma: number): number {
    if (gamma <= 0) {
        return value;
    }
    const magnitude: number = Math.pow(Math.abs(value), 1.0 / gamma);
    return value < 0 ? -magnitude : magnitude;
}

// Linear RGB of the source space is carried through XYZ into the destination space.
export function convertRgb(source: Primaries, sourceGamma: number, destination: Primaries,
    destinationGamma: number, color: RgbUnit): ConversionResult {
    const linear: RgbUnit = {
        r: removeGamma(color.r, sourceGamma),
        g: removeGamma(color.g, sourceGamma),
        b: removeGamma(color.b, sourceGamma)
    };
    const sourceMatrix: number[] = rgbToXyzMatrix(source);
    const xyz: XyzColor = multiplyMatrix(sourceMatrix, linear.r, linear.g, linear.b);
    const destinationInverse: number[] = invert3x3(rgbToXyzMatrix(destination));
    const target: XyzColor = multiplyMatrix(destinationInverse, xyz.x, xyz.y, xyz.z);
    const outOfGamut: boolean = target.x < -1.0e-9 || target.x > 1.0 + 1.0e-9 ||
        target.y < -1.0e-9 || target.y > 1.0 + 1.0e-9 ||
        target.z < -1.0e-9 || target.z > 1.0 + 1.0e-9;
    const encoded: RgbUnit = {
        r: encodeSigned(target.x, destinationGamma),
        g: encodeSigned(target.y, destinationGamma),
        b: encodeSigned(target.z, destinationGamma)
    };
    const clipped: RgbUnit = {
        r: clip01(encoded.r),
        g: clip01(encoded.g),
        b: clip01(encoded.b)
    };
    const result: ConversionResult = {
        encoded: encoded,
        clipped: clipped,
        outOfGamut: outOfGamut,
        xyz: xyz,
        lab: xyzToLab(xyz)
    };
    return result;
}

// The same conversion expressed in 8 bit channels, which is what the pages display.
export function toByte(unit: number): number {
    return Math.round(clip01(unit) * 255);
}

export function fromByte(value: number): number {
    if (value < 0) {
        return 0;
    }
    if (value > 255) {
        return 1;
    }
    return value / 255.0;
}

export function rgbText(color: RgbUnit): string {
    return `(${toByte(color.r)}, ${toByte(color.g)}, ${toByte(color.b)})`;
}

// The encoded channel keeps its overflow and its sign, so it can be compared against the clipped copy.
export function toSignedByte(unit: number): number {
    return Math.round(unit * 255);
}

export function rgbSignedText(color: RgbUnit): string {
    return `(${toSignedByte(color.r)}, ${toSignedByte(color.g)}, ${toSignedByte(color.b)})`;
}

export function labText(color: LabColor): string {
    return `L=${color.l.toFixed(2)} a=${color.a.toFixed(2)} b=${color.b.toFixed(2)}`;
}

export function xyzText(color: XyzColor): string {
    return `X=${color.x.toFixed(4)} Y=${color.y.toFixed(4)} Z=${color.z.toFixed(4)}`;
}

export function areaText(primaries: Primaries): string {
    return `Area=${gamutArea(primaries).toFixed(4)}`;
}

export function byteToHex(color: RgbUnit): string {
    const red: string = toByte(color.r).toString(16).padStart(2, '0');
    const green: string = toByte(color.g).toString(16).padStart(2, '0');
    const blue: string = toByte(color.b).toString(16).padStart(2, '0');
    return `#${red}${green}${blue}`;
}
