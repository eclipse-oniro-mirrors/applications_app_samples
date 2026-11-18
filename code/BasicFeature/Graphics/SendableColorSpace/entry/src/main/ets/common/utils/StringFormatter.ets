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
const TEN: number = 10;
const HUNDRED: number = 100;
const SIXTY: number = 60;
const KILO: number = 1024;
const HEX_RADIX: number = 16;
const TWO_HEX_DIGITS: number = 2;
const THOUSAND: number = 1000;
const TITLE_SEPARATOR: string = ' ';

/**
 * Display helpers backing the utility suites.
 *
 * Every member returns a fresh text value and never mutates its arguments, so
 * the same case can be replayed without leaking a previous result.
 */
export class StringFormatter {
    /**
     * Returns the text with a bullet marker in front.
     */
    static bulletPrefix(text: string): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.bulletPrefix length=%{public}d', text.length);
        return '• ' + text;
    }

    /**
     * Returns the text padded with spaces up to the requested width.
     */
    static centerInWidth(text: string, width: number): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.centerInWidth width=%{public}d', width);
        if (text.length >= width) {
            return text;
        }
        const total: number = width - text.length;
        const left: number = Math.floor(total / TWO);
        const right: number = total - left;
        return StringFormatter.spaces(left) + text + StringFormatter.spaces(right);
    }

    /**
     * Joins the parts with a dash.
     */
    static dashJoin(parts: string[]): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.dashJoin count=%{public}d', parts.length);
        let out: string = '';
        let index: number = ZERO;
        while (index < parts.length) {
            if (index > ZERO) {
                out = out + '-';
            }
            out = out + parts[index];
            index = index + 1;
        }
        return out;
    }

    /**
     * Renders a second count as hours, minutes and seconds.
     */
    static durationText(seconds: number): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.durationText seconds=%{public}d', seconds);
        const safe: number = seconds < ZERO ? ZERO : seconds;
        const hours: number = Math.floor(safe / 3600);
        const minutes: number = Math.floor((safe % 3600) / SIXTY);
        const rest: number = safe % SIXTY;
        if (hours > ZERO) {
            return hours.toString() + 'h ' + StringFormatter.pad(minutes, TWO) + 'm ' + StringFormatter.pad(rest, TWO) +
                's';
        }
        return StringFormatter.pad(minutes, TWO) + 'm ' + StringFormatter.pad(rest, TWO) + 's';
    }

    /**
     * Truncates the text and appends an ellipsis when it exceeds the limit.
     */
    static ellipsis(text: string, limit: number): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.ellipsis limit=%{public}d', limit);
        if (limit <= ZERO || text.length <= limit) {
            return text;
        }
        return text.substring(ZERO, limit) + '...';
    }

    /**
     * Renders a byte count with its unit.
     */
    static fileSizeText(bytes: number): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.fileSizeText bytes=%{public}d', bytes);
        const safe: number = bytes < ZERO ? ZERO : bytes;
        if (safe < KILO) {
            return safe.toString() + ' B';
        }
        if (safe < KILO * KILO) {
            return (safe / KILO).toFixed(ONE) + ' KB';
        }
        return (safe / (KILO * KILO)).toFixed(ONE) + ' MB';
    }

    /**
     * Renders a byte as an upper cased two digit hexadecimal text.
     */
    static hexByte(value: number): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.hexByte value=%{public}d', value);
        let safe: number = Math.trunc(value);
        if (safe < ZERO) {
            safe = ZERO;
        }
        if (safe > 255) {
            safe = 255;
        }
        let text: string = safe.toString(HEX_RADIX).toUpperCase();
        while (text.length < TWO_HEX_DIGITS) {
            text = '0' + text;
        }
        return text;
    }

    /**
     * Renders the value after a label.
     */
    static labeledValue(label: string, value: string): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.labeledValue label=%{public}s', label);
        return label + ': ' + value;
    }

    /**
     * Masks the middle characters of the text.
     */
    static maskMiddle(text: string, keep: number): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.maskMiddle keep=%{public}d', keep);
        if (keep <= ZERO) {
            return '****';
        }
        if (text.length <= keep * TWO) {
            return text;
        }
        return text.substring(ZERO, keep) + '****' + text.substring(text.length - keep);
    }

    /**
     * Renders the position with its ordinal suffix.
     */
    static ordinalText(position: number): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.ordinalText position=%{public}d', position);
        const rest: number = Math.abs(position) % HUNDRED;
        if (rest >= 11 && rest <= 13) {
            return position.toString() + 'th';
        }
        const last: number = Math.abs(position) % TEN;
        if (last === ONE) {
            return position.toString() + 'st';
        }
        if (last === TWO) {
            return position.toString() + 'nd';
        }
        if (last === THREE) {
            return position.toString() + 'rd';
        }
        return position.toString() + 'th';
    }

    /**
     * Wraps the text in double quotes.
     */
    static quoted(text: string): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.quoted length=%{public}d', text.length);
        return '"' + text + '"';
    }

    /**
     * Upper cases the first letter of every space separated word.
     */
    static titleCase(text: string): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.titleCase length=%{public}d', text.length);
        const parts: string[] = text.split(TITLE_SEPARATOR);
        let out: string = '';
        let index: number = ZERO;
        while (index < parts.length) {
            if (index > ZERO) {
                out = out + TITLE_SEPARATOR;
            }
            const part: string = parts[index];
            if (part.length > ZERO) {
                out = out + part.charAt(ZERO).toUpperCase() + part.substring(ONE).toLowerCase();
            }
            index = index + 1;
        }
        return out;
    }

    /**
     * Renders a ratio as a percentage text with a single decimal place.
     */
    static toPercentText(ratio: number): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.toPercentText value=%{public}d', ratio);
        return (ratio * HUNDRED).toFixed(ONE) + '%';
    }

    /**
     * Wraps the text in round brackets.
     */
    static wrapBrackets(text: string): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.wrapBrackets length=%{public}d', text.length);
        return '(' + text + ')';
    }

    /**
     * Renders a millisecond count as a second text.
     */
    static millisToSecondText(millis: number): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.millisToSecondText millis=%{public}d', millis);
        return (millis / THOUSAND).toFixed(ONE) + ' s';
    }

    /**
     * Repeats the text with the requested separator between the copies.
     */
    static repeatWith(text: string, times: number, separator: string): string {
        hilog.info(DOMAIN, TAG, 'StringFormatter.repeatWith times=%{public}d', times);
        let out: string = '';
        let index: number = ZERO;
        while (index < times) {
            if (index > ZERO) {
                out = out + separator;
            }
            out = out + text;
            index = index + 1;
        }
        return out;
    }

    private static pad(value: number, width: number): string {
        let text: string = value.toString();
        while (text.length < width) {
            text = '0' + text;
        }
        return text;
    }

    private static spaces(count: number): string {
        let out: string = '';
        let index: number = ZERO;
        while (index < count) {
            out = out + ' ';
            index = index + 1;
        }
        return out;
    }
}
