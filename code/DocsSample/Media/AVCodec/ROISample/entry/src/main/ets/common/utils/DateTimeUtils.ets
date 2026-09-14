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

export default class DateTimeUtil {
  // Retrieve the HHmmss format string for the current time.
  getTime(): string {
    const DATETIME = new Date();
    return this.concatTime(DATETIME.getHours(), DATETIME.getMinutes(), DATETIME.getSeconds());
  }

  // Retrieve the YYYYMMDD format string of the current date.
  getDate(): string {
    const DATETIME = new Date();
    return this.concatDate(DATETIME.getFullYear(), DATETIME.getMonth() + 1, DATETIME.getDate());
  }

  // Zero padding for numbers, add 0 before less than 10.
  fill(value: number): string {
    return (value > 9 ? '' : '0') + value;
  }

  // Splicing date strings (with zero padding for month and day).
  concatDate(year: number, month: number, date: number): string {
    return `${year}${this.fill(month)}${this.fill(date)}`;
  }

  // Splicing time string (zero padding per character).
  concatTime(hour: number, minute: number, second: number): string {
    return `${this.fill(hour)}${this.fill(minute)}${this.fill(second)}`;
  }
}

// Convert milliseconds to MM: SS format.
export function getShownTimer(ms: number): string {
  let seconds: number = Math.round(ms / 1000);
  let sec: number = seconds % 60;
  let min: number = (seconds - sec) / 60;
  let secStr = (sec >= 0 && sec < 10) ? ('0' + sec) : sec;
  let minStr = (min >= 0 && min < 10) ? ('0' + min) : min;
  return (minStr + ':' + secStr);
}

// Convert seconds to MM: SS format.
export function dateTime(t: number): string {
  let minute: number = Math.floor(t / 60) % 60;
  let m = minute < 10 ? '0' + minute : minute;
  let second: number = t % 60;
  let s = second < 10 ? '0' + second : second;
  return m + ':' + s;
}