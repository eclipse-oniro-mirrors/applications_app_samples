/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export default class DateTimeUtil {
  getTime(): string {
    const currentDateTime = new Date();
    return this.concatTime(currentDateTime.getHours(), currentDateTime.getMinutes(), currentDateTime.getSeconds());
  }

  getDate(): string {
    const currentDateTime = new Date();
    return this.concatDate(currentDateTime.getFullYear(), currentDateTime.getMonth() + 1, currentDateTime.getDate());
  }

  fill(value: number): string {
    return `${value > 9 ? '' : '0'}${value}`;
  }

  concatDate(year: number, month: number, date: number): string {
    return `${year}${month}${date}`;
  }

  concatTime(hour: number, minute: number, second: number): string {
    return `${this.fill(hour)}${this.fill(minute)}${this.fill(second)}`;
  }
}

export function getShownTimer(ms: number): string {
  const totalSeconds: number = Math.round(ms / 1000);
  const seconds: number = totalSeconds % 60;
  const minutes: number = (totalSeconds - seconds) / 60;
  const secondText: string | number = seconds >= 0 && seconds < 10 ? `0${seconds}` : seconds;
  const minuteText: string | number = minutes >= 0 && minutes < 10 ? `0${minutes}` : minutes;
  return `${minuteText}:${secondText}`;
}

export function dateTime(t: number): string {
  const minutes: number = Math.floor(t / 60) % 60;
  const minuteText: string | number = minutes < 10 ? `0${minutes}` : minutes;
  const seconds: number = t % 60;
  const secondText: string | number = seconds < 10 ? `0${seconds}` : seconds;
  return `${minuteText}:${secondText}`;
}
