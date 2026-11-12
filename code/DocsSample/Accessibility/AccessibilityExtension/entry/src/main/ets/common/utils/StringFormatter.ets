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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const ELLIPSIS: string = '...';
const BULLET: string = '• ';
const LABEL_PREFIX: string = 'Value: ';
const QUOTE: string = '"';
const OPEN_BRACKET: string = '[';
const CLOSE_BRACKET: string = ']';
const SPACE: string = ' ';
const DASH: string = '-';
const MASK_CHAR: string = '*';
const HEX_BASE: number = 16;
const HEX_PAD: string = '0';
const CHANNEL_MAX: number = 255;
const KILO: number = 1024;
const SECONDS_PER_MINUTE: number = 60;
const MINUTE_SUFFIX: string = 'm ';
const SECOND_SUFFIX: string = 's';
const BYTE_SUFFIX: string = ' B';
const KILO_SUFFIX: string = ' KB';
const ORDINAL_SPECIAL: number = 11;
const ORDINAL_SPECIAL_END: number = 13;

/**
 * Presentation helpers backing the ohosTest utility suites.
 *
 * Every member returns a ready to display string so that a suite can assert the
 * exact rendering without involving the UI tree.
 */
export class StringFormatter {
  /**
   * Truncates the text to the requested width and appends an ellipsis.
   */
  static ellipsis(input: string, maxWidth: number): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.ellipsis maxWidth=%{public}d', maxWidth);
    if (input.length <= maxWidth) {
      return input;
    }
    return input.substring(0, maxWidth) + ELLIPSIS;
  }

  /**
   * Prefixes the text with a bullet marker.
   */
  static bulletPrefix(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.bulletPrefix length=%{public}d', input.length);
    return BULLET + input;
  }

  /**
   * Upper cases the first letter of every space separated word.
   */
  static titleCase(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.titleCase length=%{public}d', input.length);
    const parts: string[] = input.split(SPACE);
    const out: string[] = [];
    let index: number = 0;
    while (index < parts.length) {
      const part: string = parts[index];
      if (part.length === 0) {
        out.push(part);
      } else {
        out.push(part.substring(0, 1).toUpperCase() + part.substring(1).toLowerCase());
      }
      index = index + 1;
    }
    return out.join(SPACE);
  }

  /**
   * Renders the value as a percentage text.
   */
  static toPercentText(value: number): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.toPercentText value=%{public}d', value);
    return value.toString() + '%';
  }

  /**
   * Renders the duration as minutes and seconds.
   */
  static durationText(seconds: number): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.durationText seconds=%{public}d', seconds);
    const total: number = Math.abs(Math.trunc(seconds));
    const minutes: number = Math.floor(total / SECONDS_PER_MINUTE);
    const rest: number = total % SECONDS_PER_MINUTE;
    return minutes.toString() + MINUTE_SUFFIX + rest.toString() + SECOND_SUFFIX;
  }

  /**
   * Renders the byte count as a whole kilobyte text.
   */
  static fileSizeText(bytes: number): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.fileSizeText bytes=%{public}d', bytes);
    const total: number = Math.abs(Math.trunc(bytes));
    if (total < KILO) {
      return total.toString() + BYTE_SUFFIX;
    }
    return Math.floor(total / KILO).toString() + KILO_SUFFIX;
  }

  /**
   * Renders the value as a two digit upper case hexadecimal byte.
   */
  static hexByte(value: number): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.hexByte value=%{public}d', value);
    let bounded: number = Math.trunc(value);
    if (bounded < 0) {
      bounded = 0;
    }
    if (bounded > CHANNEL_MAX) {
      bounded = CHANNEL_MAX;
    }
    const text: string = bounded.toString(HEX_BASE).toUpperCase();
    return text.length < 2 ? HEX_PAD + text : text;
  }

  /**
   * Pads the text with spaces so that it is centred inside the width.
   */
  static centerInWidth(input: string, width: number): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.centerInWidth width=%{public}d', width);
    const padding: number = width - input.length;
    if (padding <= 0) {
      return input;
    }
    const left: number = Math.floor(padding / 2);
    let out: string = '';
    let index: number = 0;
    while (index < left) {
      out = out + SPACE;
      index = index + 1;
    }
    out = out + input;
    index = left;
    while (index < padding) {
      out = out + SPACE;
      index = index + 1;
    }
    return out;
  }

  /**
   * Prefixes the text with the standard label marker.
   */
  static labeledValue(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.labeledValue length=%{public}d', input.length);
    return LABEL_PREFIX + input;
  }

  /**
   * Wraps the text in double quotes.
   */
  static quoted(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.quoted length=%{public}d', input.length);
    return QUOTE + input + QUOTE;
  }

  /**
   * Wraps the text in square brackets.
   */
  static wrapBrackets(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.wrapBrackets length=%{public}d', input.length);
    return OPEN_BRACKET + input + CLOSE_BRACKET;
  }

  /**
   * Masks every character except the first and the last one.
   */
  static maskMiddle(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.maskMiddle length=%{public}d', input.length);
    if (input.length <= 2) {
      return input;
    }
    let out: string = input.charAt(0);
    let index: number = 1;
    while (index < input.length - 1) {
      out = out + MASK_CHAR;
      index = index + 1;
    }
    return out + input.charAt(input.length - 1);
  }

  /**
   * Renders the value with an English ordinal suffix.
   */
  static ordinalText(value: number): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.ordinalText value=%{public}d', value);
    const total: number = Math.abs(Math.trunc(value));
    const rest: number = total % 100;
    if (rest >= ORDINAL_SPECIAL && rest <= ORDINAL_SPECIAL_END) {
      return total.toString() + 'th';
    }
    const last: number = total % 10;
    if (last === 1) {
      return total.toString() + 'st';
    }
    if (last === 2) {
      return total.toString() + 'nd';
    }
    if (last === 3) {
      return total.toString() + 'rd';
    }
    return total.toString() + 'th';
  }

  /**
   * Joins every character of the text with a dash.
   */
  static dashJoin(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringFormatter.dashJoin length=%{public}d', input.length);
    const parts: string[] = input.split('');
    return parts.join(DASH);
  }
}
