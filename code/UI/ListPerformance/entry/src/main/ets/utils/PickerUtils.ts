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

/** Provides Picker Utils helpers for the sample. */
export class PickerUtils {
  static pad2(value: number): string {
    return value < 10 ? `0${value}` : `${value}`;
  }

  static formatDate(date: Date): string {
    return `${date.getFullYear()}-${PickerUtils.pad2(date.getMonth() + 1)}-${PickerUtils.pad2(date.getDate())}`;
  }

  static formatDateParts(year?: number, month?: number, day?: number): string {
    const y = year === undefined ? 0 : year;
    const m = month === undefined ? 0 : month + 1;
    const d = day === undefined ? 0 : day;
    return `${y}-${PickerUtils.pad2(m)}-${PickerUtils.pad2(d)}`;
  }

  static formatTimeParts(hour?: number, minute?: number, second?: number): string {
    const h = hour === undefined ? 0 : hour;
    const mi = minute === undefined ? 0 : minute;
    const s = second === undefined ? 0 : second;
    return `${PickerUtils.pad2(h)}:${PickerUtils.pad2(mi)}:${PickerUtils.pad2(s)}`;
  }

  static formatDateRange(start: Date, end: Date): string {
    return `${PickerUtils.formatDate(start)} ~ ${PickerUtils.formatDate(end)}`;
  }

  static isWithinRange(date: Date, start: Date, end: Date): boolean {
    const time = date.getTime();
    return time >= start.getTime() && time <= end.getTime();
  }

  static clampDate(date: Date, start: Date, end: Date): Date {
    if (date.getTime() < start.getTime()) {
      return start;
    }
    if (date.getTime() > end.getTime()) {
      return end;
    }
    return date;
  }

  static describeConfig(lunar: boolean, loop: boolean, military: boolean, seconds: boolean): string {
    return `lunar=${lunar}, loop=${loop}, military=${military}, seconds=${seconds}`;
  }

  static clampIndex(index: number, length: number): number {
    if (length <= 0) {
      return 0;
    }
    if (index < 0) {
      return 0;
    }
    if (index >= length) {
      return length - 1;
    }
    return index;
  }

  static describeSelection(label: string, value: string): string {
    return `${label}: ${value}`;
  }
}
