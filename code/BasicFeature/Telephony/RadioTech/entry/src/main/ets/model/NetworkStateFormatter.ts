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

export interface NetworkStateSnapshot {
  longOperatorName: string;
  shortOperatorName: string;
  plmnNumeric: string;
  isRoaming: boolean;
  regState: number;
  nsaState: number;
  isCaActive: boolean;
  isEmergency: boolean;
}

export class NetworkStateFormatter {
  public static readonly NOT_AVAILABLE: string = 'not available';
  public static readonly UNKNOWN: string = 'unknown';
  public static readonly REG_STATE_NAMES: string[] =
    ['no service', 'in service', 'emergency call only', 'power off'];
  public static readonly NSA_STATE_NAMES: string[] =
    ['unknown', 'not support', 'no detect', 'connected detect', 'idle detect', 'dual connected', 'sa attached'];
  public static readonly PLMN_PATTERN: RegExp = new RegExp('^[0-9]{5,6}$');

  public static formatOperator(value: string): string {
    if (value === undefined || value === null) {
      return NetworkStateFormatter.NOT_AVAILABLE;
    }
    const trimmed: string = value.trim();
    if (trimmed.length === 0) {
      return NetworkStateFormatter.NOT_AVAILABLE;
    }
    return trimmed;
  }

  public static formatPlmn(value: string): string {
    if (value === undefined || value === null) {
      return NetworkStateFormatter.NOT_AVAILABLE;
    }
    const trimmed: string = value.trim();
    if (!NetworkStateFormatter.PLMN_PATTERN.test(trimmed)) {
      return NetworkStateFormatter.NOT_AVAILABLE;
    }
    return trimmed;
  }

  public static formatRegState(value: number): string {
    if (!Number.isInteger(value) || value < 0 || value >= NetworkStateFormatter.REG_STATE_NAMES.length) {
      return NetworkStateFormatter.UNKNOWN;
    }
    return NetworkStateFormatter.REG_STATE_NAMES[value];
  }

  public static formatNsaState(value: number): string {
    if (!Number.isInteger(value) || value < 0 || value >= NetworkStateFormatter.NSA_STATE_NAMES.length) {
      return NetworkStateFormatter.UNKNOWN;
    }
    return NetworkStateFormatter.NSA_STATE_NAMES[value];
  }

  public static formatBoolean(value: boolean): string {
    return value ? 'true' : 'false';
  }

  public static format(state: NetworkStateSnapshot): string {
    const lines: string[] = [];
    lines.push(`longOperatorName:${NetworkStateFormatter.formatOperator(state.longOperatorName)}`);
    lines.push(`shortOperatorName:${NetworkStateFormatter.formatOperator(state.shortOperatorName)}`);
    lines.push(`plmnNumeric:${NetworkStateFormatter.formatPlmn(state.plmnNumeric)}`);
    lines.push(`isRoaming:${NetworkStateFormatter.formatBoolean(state.isRoaming)}`);
    lines.push(`regState:${NetworkStateFormatter.formatRegState(state.regState)}`);
    lines.push(`nsaState:${NetworkStateFormatter.formatNsaState(state.nsaState)}`);
    lines.push(`isCaActive:${NetworkStateFormatter.formatBoolean(state.isCaActive)}`);
    lines.push(`isEmergency:${NetworkStateFormatter.formatBoolean(state.isEmergency)}`);
    return lines.join('\n');
  }
}
