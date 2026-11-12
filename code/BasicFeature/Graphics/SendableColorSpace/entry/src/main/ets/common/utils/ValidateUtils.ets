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
const FOUR: number = 4;
const TEN: number = 10;
const ALPHA: RegExp = new RegExp('^[A-Za-z]+$');
const ALPHANUMERIC: RegExp = new RegExp('^[A-Za-z0-9]+$');
const DIGITS: RegExp = new RegExp('^[0-9]+$');
const EMAIL_LOOSE: RegExp = new RegExp('^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+[.][A-Za-z]{2,}$');
const HEX_BYTE: RegExp = new RegExp('^[0-9A-Fa-f]{2}$');
const HEX_COLOR: RegExp = new RegExp('^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{3})$');
const LOWER_CAMEL: RegExp = new RegExp('^[a-z][A-Za-z0-9]*$');
const NUMERIC: RegExp = new RegExp('^-?[0-9]+([.][0-9]+)?$');
const PHONE_CN: RegExp = new RegExp('^1[3-9][0-9]{9}$');
const UPPER_SNAKE: RegExp = new RegExp('^[A-Z][A-Z0-9]*(_[A-Z0-9]+)*$');
const URL_HTTP: RegExp = new RegExp('^https?://\\S+$');

/**
 * Pattern helpers backing the utility suites.
 *
 * The patterns are compiled once at module load and are stateless, so no case
 * can leak a last index into the next one.
 */
export class ValidateUtils {
    /**
     * Reports whether the text holds letters only.
     */
    static isAlpha(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isAlpha length=%{public}d', text.length);
        return ALPHA.test(text);
    }

    /**
     * Reports whether the text holds letters and digits only.
     */
    static isAlphanumeric(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isAlphanumeric length=%{public}d', text.length);
        return ALPHANUMERIC.test(text);
    }

    /**
     * Reports whether the text spells a boolean literal.
     */
    static isBooleanString(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isBooleanString length=%{public}d', text.length);
        const lowered: string = text.toLowerCase();
        return lowered === 'true' || lowered === 'false';
    }

    /**
     * Reports whether the text holds digits only.
     */
    static isDigits(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isDigits length=%{public}d', text.length);
        return DIGITS.test(text);
    }

    /**
     * Reports whether the text looks like a mail address.
     */
    static isEmailLoose(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isEmailLoose length=%{public}d', text.length);
        return EMAIL_LOOSE.test(text);
    }

    /**
     * Reports whether the text is a two digit hexadecimal byte.
     */
    static isHexByte(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isHexByte length=%{public}d', text.length);
        return HEX_BYTE.test(text);
    }

    /**
     * Reports whether the text is a pound prefixed colour literal.
     */
    static isHexColor(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isHexColor length=%{public}d', text.length);
        return HEX_COLOR.test(text);
    }

    /**
     * Reports whether the text is four dotted decimals inside the byte range.
     */
    static isIpv4(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isIpv4 length=%{public}d', text.length);
        const parts: string[] = text.split('.');
        if (parts.length !== FOUR) {
            return false;
        }
        let index: number = ZERO;
        while (index < parts.length) {
            if (!DIGITS.test(parts[index])) {
                return false;
            }
            const part: number = Number.parseInt(parts[index], TEN);
            if (part < ZERO || part > 255) {
                return false;
            }
            index = index + 1;
        }
        return true;
    }

    /**
     * Reports whether the text starts lower case and stays alphanumeric.
     */
    static isLowerCamel(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isLowerCamel length=%{public}d', text.length);
        return LOWER_CAMEL.test(text);
    }

    /**
     * Reports whether the text is a decimal number with an optional sign.
     */
    static isNumericString(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isNumericString length=%{public}d', text.length);
        return NUMERIC.test(text);
    }

    /**
     * Reports whether the text is a mainland mobile number.
     */
    static isPhoneCn(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isPhoneCn length=%{public}d', text.length);
        return PHONE_CN.test(text);
    }

    /**
     * Reports whether the text is an upper snake identifier.
     */
    static isUpperSnake(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isUpperSnake length=%{public}d', text.length);
        return UPPER_SNAKE.test(text);
    }

    /**
     * Reports whether the text is a plain http or https address.
     */
    static isUrlHttp(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isUrlHttp length=%{public}d', text.length);
        return URL_HTTP.test(text);
    }

    /**
     * Reports whether the text length sits inside the closed interval.
     */
    static lengthBetween(text: string, min: number, max: number): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.lengthBetween min=%{public}d max=%{public}d', min, max);
        return text.length >= min && text.length <= max;
    }

    /**
     * Reports whether the text holds no character.
     */
    static isEmptyText(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isEmptyText length=%{public}d', text.length);
        return text.length === ZERO;
    }

    /**
     * Reports whether the text starts at the requested prefix.
     */
    static startsWithText(text: string, prefix: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.startsWithText prefix=%{public}s', prefix);
        if (prefix.length > text.length) {
            return false;
        }
        return text.substring(ZERO, prefix.length) === prefix;
    }

    /**
     * Reports whether the value is a single digit.
     */
    static isSingleDigit(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'ValidateUtils.isSingleDigit length=%{public}d', text.length);
        return text.length === ONE && DIGITS.test(text);
    }
}
