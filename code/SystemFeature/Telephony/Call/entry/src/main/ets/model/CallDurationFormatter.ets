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
 * @file entry/src/main/ets/model/CallDurationFormatter.ets
 * 文件职责：通话时长的展示格式化与计费分钟换算。
 * 主要声明：CallDurationFormatter。
 */

/**
 * CallDurationFormatter：把秒数转换为多种展示形态。
 */
export class CallDurationFormatter {
  /**
   * pad2：把 0 到 99 的整数补足两位。
   * @param value 数值。
   * @returns 两位文本。
   */
  static pad2(value: number): string {
    if (value < 10) {
      return '0' + value.toString();
    }
    return value.toString();
  }

  /**
   * format：秒数格式化为 mm:ss，超过一小时为 h:mm:ss。
   * @param seconds 秒数，负数按 0 处理。
   * @returns 时长文本。
   */
  static format(seconds: number): string {
    const safe: number = seconds < 0 ? 0 : Math.floor(seconds);
    const hours: number = Math.floor(safe / 3600);
    const minutes: number = Math.floor((safe % 3600) / 60);
    const rest: number = safe % 60;
    if (hours > 0) {
      return hours.toString() + ':' + CallDurationFormatter.pad2(minutes) + ':' + CallDurationFormatter.pad2(rest);
    }
    return CallDurationFormatter.pad2(minutes) + ':' + CallDurationFormatter.pad2(rest);
  }

  /**
   * formatWords：秒数格式化为英文短语。
   * @param seconds 秒数，负数按 0 处理。
   * @returns 形如 1 h 2 min 3 sec 的文本。
   */
  static formatWords(seconds: number): string {
    const safe: number = seconds < 0 ? 0 : Math.floor(seconds);
    const hours: number = Math.floor(safe / 3600);
    const minutes: number = Math.floor((safe % 3600) / 60);
    const rest: number = safe % 60;
    const parts: string[] = [];
    if (hours > 0) {
      parts.push(hours.toString() + ' h');
    }
    if (minutes > 0) {
      parts.push(minutes.toString() + ' min');
    }
    if (rest > 0) {
      parts.push(rest.toString() + ' sec');
    }
    if (parts.length === 0) {
      return '0 sec';
    }
    return parts.join(' ');
  }

  /**
   * billableMinutes：按每分钟计费向上取整。
   * @param seconds 秒数。
   * @returns 计费分钟数。
   */
  static billableMinutes(seconds: number): number {
    if (seconds <= 0) {
      return 0;
    }
    return Math.ceil(seconds / 60);
  }

  /**
   * percentOfHour：返回占整小时的百分比，保留两位小数。
   * @param seconds 秒数。
   * @returns 百分比数值。
   */
  static percentOfHour(seconds: number): number {
    if (seconds <= 0) {
      return 0;
    }
    const raw: number = seconds / 3600 * 100;
    return Math.round(raw * 100) / 100;
  }

  /**
   * summary：生成计时摘要。
   * @param seconds 秒数。
   * @returns 形如 01:05 (1 min 5 sec) 的文本。
   */
  static summary(seconds: number): string {
    return CallDurationFormatter.format(seconds) + ' (' + CallDurationFormatter.formatWords(seconds) + ')';
  }
}
