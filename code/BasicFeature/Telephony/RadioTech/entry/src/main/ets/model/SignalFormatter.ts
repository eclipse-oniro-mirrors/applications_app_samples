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

export interface SignalSnapshot {
  signalType: number;
  signalLevel: number;
  dBm: number;
}

export class SignalFormatter {
  public static readonly NOT_AVAILABLE: string = 'not available';
  public static readonly TYPE_NAMES: string[] = ['unknown', 'gsm', 'cdma', 'wcdma', 'tdscdma', 'lte', 'nr'];
  public static readonly LEVEL_NAMES: string[] = ['none', 'poor', 'moderate', 'good', 'great'];

  public static typeName(value: number): string {
    if (!Number.isInteger(value) || value < 0 || value >= SignalFormatter.TYPE_NAMES.length) {
      return SignalFormatter.TYPE_NAMES[0];
    }
    return SignalFormatter.TYPE_NAMES[value];
  }

  public static levelName(value: number): string {
    if (!Number.isInteger(value) || value < 0 || value >= SignalFormatter.LEVEL_NAMES.length) {
      return SignalFormatter.LEVEL_NAMES[0];
    }
    return SignalFormatter.LEVEL_NAMES[value];
  }

  public static formatSignal(signal: SignalSnapshot): string {
    return `${SignalFormatter.typeName(signal.signalType)}/${SignalFormatter.levelName(signal.signalLevel)}/` +
      `${signal.dBm}`;
  }

  public static formatList(list: SignalSnapshot[]): string {
    if (list.length === 0) {
      return SignalFormatter.NOT_AVAILABLE;
    }
    const parts: string[] = [];
    for (let index: number = 0; index < list.length; index++) {
      parts.push(SignalFormatter.formatSignal(list[index]));
    }
    return parts.join('; ');
  }

  public static count(list: SignalSnapshot[]): number {
    return list.length;
  }

  public static bestLevel(list: SignalSnapshot[]): number {
    let best: number = -1;
    for (let index: number = 0; index < list.length; index++) {
      const level: number = list[index].signalLevel;
      if (Number.isInteger(level) && level >= 0 && level < SignalFormatter.LEVEL_NAMES.length && level > best) {
        best = level;
      }
    }
    return best;
  }

  public static totalDbm(list: SignalSnapshot[]): number {
    let total: number = 0;
    for (let index: number = 0; index < list.length; index++) {
      total += list[index].dBm;
    }
    return total;
  }

  public static hasType(list: SignalSnapshot[], signalType: number): boolean {
    for (let index: number = 0; index < list.length; index++) {
      if (list[index].signalType === signalType) {
        return true;
      }
    }
    return false;
  }
}
