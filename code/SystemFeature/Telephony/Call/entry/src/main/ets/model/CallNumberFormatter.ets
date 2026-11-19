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

/**
 * @file entry/src/main/ets/model/CallNumberFormatter.ets
 * 文件职责：电话号码的展示格式化、分隔符归一与脱敏工具。
 * 主要声明：CallNumberFormatter。
 * 约定：全部方法为纯函数，不依赖设备能力，便于本地单元测试与 UI 复用。
 */

/**
 * CallNumberFormatter：把纯数字号码按展示习惯分组，并支持掩码与去分隔符。
 */
export class CallNumberFormatter {
  /**
   * sanitize：去掉空格、短横线、点号与括号，仅保留前导加号和数字。
   * @param text 原始输入文本。
   * @returns 归一化后的号码文本。
   */
  static sanitize(text: string): string {
    const trimmed: string = text.trim();
    const hasPlus: boolean = trimmed.startsWith('+');
    let digits: string = '';
    for (let index = 0; index < trimmed.length; index++) {
      const ch: string = trimmed.charAt(index);
      if (ch >= '0' && ch <= '9') {
        digits += ch;
      }
    }
    return hasPlus ? '+' + digits : digits;
  }

  /**
   * group：按给定分组宽度把数字串切成可读文本。
   * @param digits 纯数字串。
   * @param widths 分组宽度数组，最后一段允许不足。
   * @param separator 分组之间的分隔符。
   * @returns 分组后的文本，输入不是纯数字时原样返回。
   */
  static group(digits: string, widths: number[], separator: string): string {
    let total: number = 0;
    for (let index = 0; index < widths.length; index++) {
      total += widths[index];
    }
    if (digits.length !== total) {
      return digits;
    }
    const parts: string[] = [];
    let offset: number = 0;
    for (let index = 0; index < widths.length; index++) {
      parts.push(digits.substring(offset, offset + widths[index]));
      offset += widths[index];
    }
    return parts.join(separator);
  }

  /**
   * formatNational：按国内常见习惯分组，11 位为 3-4-4，10 位为 3-3-4，8 位为 4-4。
   * @param text 输入号码，可包含分隔符或前导加号。
   * @returns 以空格分组的展示文本。
   */
  static formatNational(text: string): string {
    const clean: string = CallNumberFormatter.sanitize(text);
    const hasPlus: boolean = clean.startsWith('+');
    const digits: string = hasPlus ? clean.substring(1) : clean;
    const prefix: string = hasPlus ? '+' : '';
    if (digits.length === 11) {
      return prefix + CallNumberFormatter.group(digits, [3, 4, 4], ' ');
    }
    if (digits.length === 10) {
      return prefix + CallNumberFormatter.group(digits, [3, 3, 4], ' ');
    }
    if (digits.length === 8) {
      return prefix + CallNumberFormatter.group(digits, [4, 4], ' ');
    }
    return clean;
  }

  /**
   * formatDashes：使用短横线作为分组分隔符。
   * @param text 输入号码。
   * @returns 以短横线分组的展示文本。
   */
  static formatDashes(text: string): string {
    const clean: string = CallNumberFormatter.sanitize(text);
    const hasPlus: boolean = clean.startsWith('+');
    const digits: string = hasPlus ? clean.substring(1) : clean;
    const prefix: string = hasPlus ? '+' : '';
    if (digits.length === 11) {
      return prefix + CallNumberFormatter.group(digits, [3, 4, 4], '-');
    }
    if (digits.length === 10) {
      return prefix + CallNumberFormatter.group(digits, [3, 3, 4], '-');
    }
    return clean;
  }

  /**
   * formatDots：使用点号作为分组分隔符。
   * @param text 输入号码。
   * @returns 以点号分组的展示文本。
   */
  static formatDots(text: string): string {
    const clean: string = CallNumberFormatter.sanitize(text);
    const hasPlus: boolean = clean.startsWith('+');
    const digits: string = hasPlus ? clean.substring(1) : clean;
    const prefix: string = hasPlus ? '+' : '';
    if (digits.length === 11) {
      return prefix + CallNumberFormatter.group(digits, [3, 4, 4], '.');
    }
    if (digits.length === 10) {
      return prefix + CallNumberFormatter.group(digits, [3, 3, 4], '.');
    }
    return clean;
  }

  /**
   * maskMiddle：保留前若干位与后若干位，中间用星号替换。
   * @param text 输入号码。
   * @param keepPrefix 头部保留位数。
   * @param keepSuffix 尾部保留位数。
   * @returns 脱敏后的号码；保留位数之和不少于长度时原样返回。
   */
  static maskMiddle(text: string, keepPrefix: number, keepSuffix: number): string {
    const clean: string = CallNumberFormatter.sanitize(text);
    if (keepPrefix < 0 || keepSuffix < 0) {
      return clean;
    }
    if (keepPrefix + keepSuffix >= clean.length) {
      return clean;
    }
    const head: string = clean.substring(0, keepPrefix);
    const tail: string = clean.substring(clean.length - keepSuffix);
    let stars: string = '';
    const middle: number = clean.length - keepPrefix - keepSuffix;
    for (let index = 0; index < middle; index++) {
      stars += '*';
    }
    return head + stars + tail;
  }

  /**
   * compact：仅保留数字与前导加号，用于比较与存储。
   * @param text 输入号码。
   * @returns 压缩后的号码文本。
   */
  static compact(text: string): string {
    return CallNumberFormatter.sanitize(text);
  }

  /**
   * digitCount：统计号码中的数字个数，忽略前导加号。
   * @param text 输入号码。
   * @returns 数字位数。
   */
  static digitCount(text: string): number {
    const clean: string = CallNumberFormatter.sanitize(text);
    return clean.startsWith('+') ? clean.length - 1 : clean.length;
  }

  /**
   * sameNumber：忽略分隔符比较两个号码是否一致。
   * @param left 左侧号码。
   * @param right 右侧号码。
   * @returns 归一化后是否相同。
   */
  static sameNumber(left: string, right: string): boolean {
    return CallNumberFormatter.sanitize(left) === CallNumberFormatter.sanitize(right);
  }
}
