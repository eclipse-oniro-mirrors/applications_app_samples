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

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_SendableColorSpace]';
const ZERO: number = 0;
const ONE: number = 1;
const TWO: number = 2;
const THREE: number = 3;
const FOUR: number = 4;
const SIX: number = 6;
const HEX_RADIX: number = 16;
const BYTE_MAX: number = 255;
const BYTE_MIN: number = 0;
const DARK_LIMIT: number = 128;
const GRAY_TOLERANCE: number = 2;
const RED_WEIGHT: number = 0.299;
const GREEN_WEIGHT: number = 0.587;
const BLUE_WEIGHT: number = 0.114;
const HASH_MARK: string = '#';
const EMPTY_TEXT: string = '';
const HEX_BODY: RegExp = new RegExp('^[0-9A-F]+$');

/**
 * Colour literals helpers backing the utility suites.
 *
 * Every member normalises the literal first, so a short form and a long form
 * of the same colour always report the same channel value.
 */
export class ColorUtils {
    /**
     * Returns the red channel of the colour literal.
     */
    static hexToR(hex: string): number {
        hilog.info(DOMAIN, TAG, 'ColorUtils.hexToR length=%{public}d', hex.length);
        return Number.parseInt(ColorUtils.body(hex).substring(ZERO, TWO), HEX_RADIX);
    }

    /**
     * Returns the green channel of the colour literal.
     */
    static hexToG(hex: string): number {
        hilog.info(DOMAIN, TAG, 'ColorUtils.hexToG length=%{public}d', hex.length);
        return Number.parseInt(ColorUtils.body(hex).substring(TWO, FOUR), HEX_RADIX);
    }

    /**
     * Returns the blue channel of the colour literal.
     */
    static hexToB(hex: string): number {
        hilog.info(DOMAIN, TAG, 'ColorUtils.hexToB length=%{public}d', hex.length);
        return Number.parseInt(ColorUtils.body(hex).substring(FOUR, SIX), HEX_RADIX);
    }

    /**
     * Returns the sum of the three channels.
     */
    static channelSum(hex: string): number {
        hilog.info(DOMAIN, TAG, 'ColorUtils.channelSum length=%{public}d', hex.length);
        return ColorUtils.hexToR(hex) + ColorUtils.hexToG(hex) + ColorUtils.hexToB(hex);
    }

    /**
     * Returns the literal with the channels reduced by the requested amount.
     */
    static darkenBy(hex: string, amount: number): string {
        hilog.info(DOMAIN, TAG, 'ColorUtils.darkenBy amount=%{public}d', amount);
        return ColorUtils.build(
            ColorUtils.clampByte(ColorUtils.hexToR(hex) - amount),
            ColorUtils.clampByte(ColorUtils.hexToG(hex) - amount),
            ColorUtils.clampByte(ColorUtils.hexToB(hex) - amount));
    }

    /**
     * Returns the literal with the channels raised by the requested amount.
     */
    static lightenBy(hex: string, amount: number): string {
        hilog.info(DOMAIN, TAG, 'ColorUtils.lightenBy amount=%{public}d', amount);
        return ColorUtils.build(
            ColorUtils.clampByte(ColorUtils.hexToR(hex) + amount),
            ColorUtils.clampByte(ColorUtils.hexToG(hex) + amount),
            ColorUtils.clampByte(ColorUtils.hexToB(hex) + amount));
    }

    /**
     * Returns the euclidean distance between both colours in the channel cube.
     */
    static hexDistance(first: string, second: string): number {
        hilog.info(DOMAIN, TAG, 'ColorUtils.hexDistance first=%{public}s', first);
        const red: number = ColorUtils.hexToR(first) - ColorUtils.hexToR(second);
        const green: number = ColorUtils.hexToG(first) - ColorUtils.hexToG(second);
        const blue: number = ColorUtils.hexToB(first) - ColorUtils.hexToB(second);
        return Math.round(Math.sqrt(red * red + green * green + blue * blue));
    }

    /**
     * Returns the literal with every channel complemented.
     */
    static invert(hex: string): string {
        hilog.info(DOMAIN, TAG, 'ColorUtils.invert length=%{public}d', hex.length);
        return ColorUtils.build(
            BYTE_MAX - ColorUtils.hexToR(hex),
            BYTE_MAX - ColorUtils.hexToG(hex),
            BYTE_MAX - ColorUtils.hexToB(hex));
    }

    /**
     * Reports whether the colour is on the dark side of the brightness limit.
     */
    static isDark(hex: string): boolean {
        hilog.info(DOMAIN, TAG, 'ColorUtils.isDark length=%{public}d', hex.length);
        return ColorUtils.luminance(hex) < DARK_LIMIT;
    }

    /**
     * Reports whether the three channels stay inside the grey tolerance.
     */
    static isGray(hex: string): boolean {
        hilog.info(DOMAIN, TAG, 'ColorUtils.isGray length=%{public}d', hex.length);
        const red: number = ColorUtils.hexToR(hex);
        const green: number = ColorUtils.hexToG(hex);
        const blue: number = ColorUtils.hexToB(hex);
        return Math.abs(red - green) <= GRAY_TOLERANCE && Math.abs(green - blue) <= GRAY_TOLERANCE;
    }

    /**
     * Reports whether the literal is a pound prefixed six or three digit colour.
     */
    static isValidHex(hex: string): boolean {
        hilog.info(DOMAIN, TAG, 'ColorUtils.isValidHex length=%{public}d', hex.length);
        const text: string = hex.trim();
        if (text.length === ZERO || text.charAt(ZERO) !== HASH_MARK) {
            return false;
        }
        const body: string = text.substring(ONE).toUpperCase();
        if (body.length !== THREE && body.length !== SIX) {
            return false;
        }
        return HEX_BODY.test(body);
    }

    /**
     * Returns the perceived brightness of the colour.
     */
    static luminance(hex: string): number {
        hilog.info(DOMAIN, TAG, 'ColorUtils.luminance length=%{public}d', hex.length);
        const red: number = ColorUtils.hexToR(hex);
        const green: number = ColorUtils.hexToG(hex);
        const blue: number = ColorUtils.hexToB(hex);
        return Math.round(RED_WEIGHT * red + GREEN_WEIGHT * green + BLUE_WEIGHT * blue);
    }

    /**
     * Returns the literal as an upper cased pound prefixed six digit colour.
     */
    static normalizeHex(hex: string): string {
        hilog.info(DOMAIN, TAG, 'ColorUtils.normalizeHex length=%{public}d', hex.length);
        return HASH_MARK + ColorUtils.body(hex);
    }

    /**
     * Returns the literal as a pound prefixed alpha red green blue text.
     */
    static toArgb(hex: string, alpha: number): string {
        hilog.info(DOMAIN, TAG, 'ColorUtils.toArgb alpha=%{public}d', alpha);
        const safe: number = ColorUtils.clampByte(alpha);
        return HASH_MARK + ColorUtils.twoDigits(safe) + ColorUtils.body(hex);
    }

    private static body(hex: string): string {
        let text: string = hex.trim();
        if (text.length > ZERO && text.charAt(ZERO) === HASH_MARK) {
            text = text.substring(ONE);
        }
        text = text.toUpperCase();
        if (text.length === THREE) {
            text = text.charAt(ZERO) + text.charAt(ZERO) + text.charAt(ONE) + text.charAt(ONE) + text.charAt(TWO) +
                text.charAt(TWO);
        }
        if (text === EMPTY_TEXT) {
            return '000000';
        }
        return text;
    }

    private static build(red: number, green: number, blue: number): string {
        return HASH_MARK + ColorUtils.twoDigits(red) + ColorUtils.twoDigits(green) + ColorUtils.twoDigits(blue);
    }

    private static twoDigits(value: number): string {
        let text: string = value.toString(HEX_RADIX).toUpperCase();
        while (text.length < TWO) {
            text = '0' + text;
        }
        return text;
    }

    private static clampByte(value: number): number {
        if (value < BYTE_MIN) {
            return BYTE_MIN;
        }
        if (value > BYTE_MAX) {
            return BYTE_MAX;
        }
        return value;
    }
}
