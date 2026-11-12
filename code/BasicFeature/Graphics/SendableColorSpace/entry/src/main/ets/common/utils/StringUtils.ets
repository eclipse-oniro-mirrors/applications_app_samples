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

/**
 * Text helpers backing the utility suites.
 *
 * Every member treats its arguments as read only and returns freshly built
 * values, so the suites never share mutable state between cases.
 */
export class StringUtils {
    /**
     * Reports whether the text holds no character at all.
     */
    static isEmpty(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'StringUtils.isEmpty length=%{public}d', text.length);
        return text.length === 0;
    }

    /**
     * Reports whether the text is empty or holds white space only.
     */
    static isBlank(text: string): boolean {
        hilog.info(DOMAIN, TAG, 'StringUtils.isBlank length=%{public}d', text.length);
        return text.trim().length === 0;
    }

    /**
     * Removes the white space around the text.
     */
    static trim(text: string): string {
        hilog.info(DOMAIN, TAG, 'StringUtils.trim length=%{public}d', text.length);
        return text.trim();
    }

    /**
     * Returns the text with every character upper cased.
     */
    static toUpper(text: string): string {
        hilog.info(DOMAIN, TAG, 'StringUtils.toUpper length=%{public}d', text.length);
        return text.toUpperCase();
    }

    /**
     * Returns the text with every character lower cased.
     */
    static toLower(text: string): string {
        hilog.info(DOMAIN, TAG, 'StringUtils.toLower length=%{public}d', text.length);
        return text.toLowerCase();
    }

    /**
     * Returns the text with the first character upper cased and the rest lower cased.
     */
    static capitalize(text: string): string {
        hilog.info(DOMAIN, TAG, 'StringUtils.capitalize length=%{public}d', text.length);
        if (text.length === 0) {
            return '';
        }
        return text.charAt(0).toUpperCase() + text.substring(1).toLowerCase();
    }

    /**
     * Returns the text with the character order reversed.
     */
    static reverse(text: string): string {
        hilog.info(DOMAIN, TAG, 'StringUtils.reverse length=%{public}d', text.length);
        let out: string = '';
        let index: number = text.length - 1;
        while (index >= 0) {
            out = out + text.charAt(index);
            index = index - 1;
        }
        return out;
    }

    /**
     * Returns the text repeated three times.
     */
    static repeat3(text: string): string {
        hilog.info(DOMAIN, TAG, 'StringUtils.repeat3 length=%{public}d', text.length);
        return text + text + text;
    }

    /**
     * Counts the non overlapping occurrences of the target text.
     */
    static countOf(text: string, target: string): number {
        hilog.info(DOMAIN, TAG, 'StringUtils.countOf target=%{public}s', target);
        if (target.length === 0) {
            return 0;
        }
        let total: number = 0;
        let index: number = 0;
        while (index <= text.length - target.length) {
            if (text.substring(index, index + target.length) === target) {
                total = total + 1;
                index = index + target.length;
            } else {
                index = index + 1;
            }
        }
        return total;
    }

    /**
     * Returns the first position of the target text, minus one when absent.
     */
    static indexOfValue(text: string, target: string): number {
        hilog.info(DOMAIN, TAG, 'StringUtils.indexOfValue target=%{public}s', target);
        return text.indexOf(target);
    }

    /**
     * Joins the characters with the requested separator.
     */
    static joinChars(chars: string[], separator: string): string {
        hilog.info(DOMAIN, TAG, 'StringUtils.joinChars count=%{public}d', chars.length);
        let out: string = '';
        let index: number = 0;
        while (index < chars.length) {
            if (index > 0) {
                out = out + separator;
            }
            out = out + chars[index];
            index = index + 1;
        }
        return out;
    }

    /**
     * Removes every occurrence of the target text.
     */
    static removeAll(text: string, target: string): string {
        hilog.info(DOMAIN, TAG, 'StringUtils.removeAll target=%{public}s', target);
        if (target.length === 0) {
            return text;
        }
        return text.split(target).join('');
    }

    /**
     * Splits the text and trims every produced part.
     */
    static splitTrim(text: string, separator: string): string[] {
        hilog.info(DOMAIN, TAG, 'StringUtils.splitTrim separator=%{public}s', separator);
        const parts: string[] = text.split(separator);
        const out: string[] = [];
        let index: number = 0;
        while (index < parts.length) {
            out.push(parts[index].trim());
            index = index + 1;
        }
        return out;
    }

    /**
     * Returns the requested window or empty text when the window is invalid.
     */
    static substringSafe(text: string, start: number, length: number): string {
        hilog.info(DOMAIN, TAG, 'StringUtils.substringSafe start=%{public}d length=%{public}d', start, length);
        if (start < 0 || length <= 0 || start >= text.length) {
            return '';
        }
        const end: number = Math.min(text.length, start + length);
        return text.substring(start, end);
    }
}
