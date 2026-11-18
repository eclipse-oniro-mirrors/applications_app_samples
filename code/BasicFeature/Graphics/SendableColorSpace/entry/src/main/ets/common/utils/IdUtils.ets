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
const FOUR: number = 4;
const TEN: number = 10;
const DASH: string = '-';
const EMPTY_TEXT: string = '';
const ID_PREFIX: string = 'ID-';
const SHORT_LENGTH: number = 4;
const COUNTER_WIDTH: number = 4;
const DIGITS_ONLY: RegExp = new RegExp('^[0-9]+$');
const VALID_SHAPE: RegExp = new RegExp('^[A-Za-z0-9_-]+$');

/**
 * Identifier helpers backing the utility suites.
 *
 * Every member rebuilds the text instead of editing it in place, and a literal
 * without a dash is reported through the documented empty fallback.
 */
export class IdUtils {
    /**
     * Returns the prefix and the index joined with a dash.
     */
    static composeId(prefix: string, index: number): string {
        hilog.info(DOMAIN, TAG, 'IdUtils.composeId index=%{public}d', index);
        return prefix + DASH + index;
    }

    /**
     * Returns the index rendered as a zero padded counter.
     */
    static counterId(index: number): string {
        hilog.info(DOMAIN, TAG, 'IdUtils.counterId index=%{public}d', index);
        return ID_PREFIX + IdUtils.pad(index, COUNTER_WIDTH);
    }

    /**
     * Returns the literal padded with a leading zero up to eight characters.
     */
    static expandId(id: string): string {
        hilog.info(DOMAIN, TAG, 'IdUtils.expandId length=%{public}d', id.length);
        if (id.length >= 8) {
            return id.substring(ZERO, 8);
        }
        return IdUtils.padText(id, 8);
    }

    /**
     * Returns the literal padded with leading zeros up to the requested width.
     */
    static formatId(id: string, width: number): string {
        hilog.info(DOMAIN, TAG, 'IdUtils.formatId width=%{public}d', width);
        return IdUtils.padText(id, width);
    }

    /**
     * Reports whether the literal holds a dash.
     */
    static hasDash(id: string): boolean {
        hilog.info(DOMAIN, TAG, 'IdUtils.hasDash length=%{public}d', id.length);
        return id.indexOf(DASH) >= ZERO;
    }

    /**
     * Returns the sum of the character codes of the literal.
     */
    static hashId(id: string): number {
        hilog.info(DOMAIN, TAG, 'IdUtils.hashId length=%{public}d', id.length);
        let total: number = ZERO;
        let index: number = ZERO;
        while (index < id.length) {
            total = total + id.charCodeAt(index);
            index = index + 1;
        }
        return total;
    }

    /**
     * Returns the character count of the literal.
     */
    static idLength(id: string): number {
        hilog.info(DOMAIN, TAG, 'IdUtils.idLength length=%{public}d', id.length);
        return id.length;
    }

    /**
     * Reports whether the tail after the last dash holds digits only.
     */
    static isNumericSuffix(id: string): boolean {
        hilog.info(DOMAIN, TAG, 'IdUtils.isNumericSuffix length=%{public}d', id.length);
        const tail: string = IdUtils.parseSuffix(id);
        if (tail === EMPTY_TEXT) {
            return false;
        }
        return DIGITS_ONLY.test(tail);
    }

    /**
     * Reports whether the literal is a usable identifier.
     */
    static isValidId(id: string): boolean {
        hilog.info(DOMAIN, TAG, 'IdUtils.isValidId length=%{public}d', id.length);
        if (id.length === ZERO) {
            return false;
        }
        return VALID_SHAPE.test(id);
    }

    /**
     * Returns the literal with the numeric tail raised by one.
     */
    static nextId(id: string): string {
        hilog.info(DOMAIN, TAG, 'IdUtils.nextId length=%{public}d', id.length);
        if (!IdUtils.isNumericSuffix(id)) {
            return id + DASH + ONE;
        }
        const cut: number = id.lastIndexOf(DASH);
        const head: string = id.substring(ZERO, cut + ONE);
        const tail: number = Number.parseInt(id.substring(cut + ONE), TEN) + ONE;
        return head + tail;
    }

    /**
     * Returns the literal trimmed and lower cased.
     */
    static normalizeId(id: string): string {
        hilog.info(DOMAIN, TAG, 'IdUtils.normalizeId length=%{public}d', id.length);
        return id.trim().toLowerCase();
    }

    /**
     * Returns the text before the first dash, empty when absent.
     */
    static parsePrefix(id: string): string {
        hilog.info(DOMAIN, TAG, 'IdUtils.parsePrefix length=%{public}d', id.length);
        const cut: number = id.indexOf(DASH);
        if (cut < ZERO) {
            return EMPTY_TEXT;
        }
        return id.substring(ZERO, cut);
    }

    /**
     * Returns the text after the last dash, empty when absent.
     */
    static parseSuffix(id: string): string {
        hilog.info(DOMAIN, TAG, 'IdUtils.parseSuffix length=%{public}d', id.length);
        const cut: number = id.lastIndexOf(DASH);
        if (cut < ZERO) {
            return EMPTY_TEXT;
        }
        return id.substring(cut + ONE);
    }

    /**
     * Returns the first four characters of the literal.
     */
    static shortId(id: string): string {
        hilog.info(DOMAIN, TAG, 'IdUtils.shortId length=%{public}d', id.length);
        if (id.length <= SHORT_LENGTH) {
            return id;
        }
        return id.substring(ZERO, SHORT_LENGTH);
    }

    /**
     * Returns the dash count of the literal.
     */
    static dashCount(id: string): number {
        hilog.info(DOMAIN, TAG, 'IdUtils.dashCount length=%{public}d', id.length);
        let total: number = ZERO;
        let index: number = ZERO;
        while (index < id.length) {
            if (id.charAt(index) === DASH) {
                total = total + 1;
            }
            index = index + 1;
        }
        return total;
    }

    /**
     * Returns the literal rebuilt from the parsed prefix and suffix.
     */
    static rebuildId(id: string): string {
        hilog.info(DOMAIN, TAG, 'IdUtils.rebuildId length=%{public}d', id.length);
        const prefix: string = IdUtils.parsePrefix(id);
        const suffix: string = IdUtils.parseSuffix(id);
        if (prefix === EMPTY_TEXT && suffix === EMPTY_TEXT) {
            return id;
        }
        return prefix + DASH + suffix;
    }

    private static pad(value: number, width: number): string {
        let text: string = value.toString();
        while (text.length < width) {
            text = '0' + text;
        }
        return text;
    }

    private static padText(text: string, width: number): string {
        let out: string = text;
        while (out.length < width) {
            out = '0' + out;
        }
        return out;
    }
}
