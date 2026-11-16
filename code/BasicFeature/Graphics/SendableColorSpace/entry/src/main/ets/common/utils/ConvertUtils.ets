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
const DIGIT_BASE: number = 10;
const HEX_BASE: number = 16;

/**
 * Text and number conversion helpers backing the utility suites.
 *
 * Every member is total: an unparsable input yields the documented fallback
 * instead of throwing, so a suite case never needs a try block.
 */
export class ConvertUtils {
    /**
     * Returns the code unit of the first character, minus one for empty text.
     */
    static charCodeOfFirstChar(text: string): number {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.charCodeOfFirstChar length=%{public}d', text.length);
        if (text.length === ZERO) {
            return -ONE;
        }
        return text.charCodeAt(ZERO);
    }

    /**
     * Parses a comma separated list into numbers, skipping unparsable items.
     */
    static csvToNumbers(text: string): number[] {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.csvToNumbers length=%{public}d', text.length);
        const out: number[] = [];
        const parts: string[] = text.split(',');
        let index: number = ZERO;
        while (index < parts.length) {
            const parsed: number = Number.parseFloat(parts[index]);
            if (!Number.isNaN(parsed)) {
                out.push(parsed);
            }
            index = index + 1;
        }
        return out;
    }

    /**
     * Parses a hexadecimal text into a number, zero when unparsable.
     */
    static hexToDec(text: string): number {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.hexToDec length=%{public}d', text.length);
        const parsed: number = Number.parseInt(text, HEX_BASE);
        if (Number.isNaN(parsed)) {
            return ZERO;
        }
        return parsed;
    }

    /**
     * Renders the numbers as a comma separated list.
     */
    static numbersToCsv(values: number[]): string {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.numbersToCsv count=%{public}d', values.length);
        let out: string = '';
        let index: number = ZERO;
        while (index < values.length) {
            if (index > ZERO) {
                out = out + ',';
            }
            out = out + values[index];
            index = index + 1;
        }
        return out;
    }

    /**
     * Renders the number as an on or off text.
     */
    static numberToBoolStr(value: number): string {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.numberToBoolStr value=%{public}d', value);
        if (value === ZERO) {
            return 'off';
        }
        return 'on';
    }

    /**
     * Renders the sign of the number as a short text.
     */
    static numberToSign(value: number): string {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.numberToSign value=%{public}d', value);
        if (value < ZERO) {
            return 'negative';
        }
        if (value > ZERO) {
            return 'positive';
        }
        return 'zero';
    }

    /**
     * Returns the leading decimal digits, empty text when none is present.
     */
    static numericPrefix(text: string): string {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.numericPrefix length=%{public}d', text.length);
        let out: string = '';
        let index: number = ZERO;
        while (index < text.length) {
            const code: number = text.charCodeAt(index);
            if (code < 48 || code > 57) {
                index = text.length;
            } else {
                out = out + text.charAt(index);
                index = index + 1;
            }
        }
        return out;
    }

    /**
     * Parses a percentage text into a ratio, zero when unparsable.
     */
    static percentStrToNumber(text: string): number {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.percentStrToNumber length=%{public}d', text.length);
        const trimmed: string = text.trim();
        if (trimmed.length === ZERO) {
            return ZERO;
        }
        let body: string = trimmed;
        if (body.charAt(body.length - 1) === '%') {
            body = body.substring(0, body.length - 1);
        }
        const parsed: number = Number.parseFloat(body);
        if (Number.isNaN(parsed)) {
            return ZERO;
        }
        return parsed / 100;
    }

    /**
     * Removes every decimal digit from the text.
     */
    static stripDigits(text: string): string {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.stripDigits length=%{public}d', text.length);
        let out: string = '';
        let index: number = ZERO;
        while (index < text.length) {
            const code: number = text.charCodeAt(index);
            if (code < 48 || code > 57) {
                out = out + text.charAt(index);
            }
            index = index + 1;
        }
        return out;
    }

    /**
     * Removes every space from the text.
     */
    static stripSpaces(text: string): string {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.stripSpaces length=%{public}d', text.length);
        let out: string = '';
        let index: number = ZERO;
        while (index < text.length) {
            if (text.charAt(index) !== ' ') {
                out = out + text.charAt(index);
            }
            index = index + 1;
        }
        return out;
    }

    /**
     * Parses a boolean text, false for any other spelling.
     */
    static strToBool(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.strToBool length=%{public}d', text.length);
        return text.trim().toLowerCase() === 'true';
    }

    /**
     * Parses a decimal text into a number, zero when unparsable.
     */
    static strToNumber(text: string): number {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.strToNumber length=%{public}d', text.length);
        const parsed: number = Number.parseFloat(text.trim());
        if (Number.isNaN(parsed)) {
            return ZERO;
        }
        return parsed;
    }

    /**
     * Returns the code units of every character.
     */
    static toAsciiCodes(text: string): number[] {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.toAsciiCodes length=%{public}d', text.length);
        const out: number[] = [];
        let index: number = ZERO;
        while (index < text.length) {
            out.push(text.charCodeAt(index));
            index = index + 1;
        }
        return out;
    }

    /**
     * Returns every character as a single entry array.
     */
    static toCharArray(text: string): string[] {
        hilog.info(DOMAIN, TAG, 'ConvertUtils.toCharArray length=%{public}d', text.length);
        const out: string[] = [];
        let index: number = ZERO;
        while (index < text.length) {
            out.push(text.charAt(index));
            index = index + 1;
        }
        return out;
    }
}
