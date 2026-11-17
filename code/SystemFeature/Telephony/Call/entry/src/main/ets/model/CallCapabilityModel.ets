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
 * @file entry/src/main/ets/model/CallCapabilityModel.ets
 * 文件职责：拨号能力判定与不同 SDK 版本的能力清单。
 * 主要声明：CallCapabilityModel。
 */

import { DialValidator } from './DialValidator';
import { ValidationResult } from './DialValidator';

/**
 * CallCapabilityModel：把权限、SIM 与输入合法性组合成可拨号结论。
 */
export class CallCapabilityModel {
  public static readonly OK: string = 'OK';
  public static readonly NO_PERMISSION: string = 'NO_PERMISSION';
  public static readonly NO_SIM: string = 'NO_SIM';
  public static readonly INVALID_NUMBER: string = 'INVALID_NUMBER';

  /**
   * canDial：判断当前条件下能否拨号。
   * @param input 输入号码。
   * @param hasPermission 是否已授予拨号权限。
   * @param hasSim 是否插卡。
   * @returns 结论常量。
   */
  static canDial(input: string, hasPermission: boolean, hasSim: boolean): string {
    const result: ValidationResult = DialValidator.validate(input);
    if (!result.ok) {
      return CallCapabilityModel.INVALID_NUMBER;
    }
    if (!hasPermission) {
      return CallCapabilityModel.NO_PERMISSION;
    }
    if (!hasSim) {
      return CallCapabilityModel.NO_SIM;
    }
    return CallCapabilityModel.OK;
  }

  /**
   * describe：把结论转换为可展示说明。
   * @param status 结论。
   * @returns 说明文本。
   */
  static describe(status: string): string {
    if (status === CallCapabilityModel.OK) {
      return 'ready to place the call';
    }
    if (status === CallCapabilityModel.NO_PERMISSION) {
      return 'place call permission is not granted';
    }
    if (status === CallCapabilityModel.NO_SIM) {
      return 'no sim card detected';
    }
    if (status === CallCapabilityModel.INVALID_NUMBER) {
      return 'phone number is invalid';
    }
    return 'unknown status';
  }

  /**
   * requiresPermission：返回动作所需的权限名。
   * @param action 动作，如 dial、state、format。
   * @returns 权限名，无需权限返回空串。
   */
  static requiresPermission(action: string): string {
    if (action === 'dial') {
      return 'ohos.permission.PLACE_CALL';
    }
    if (action === 'state') {
      return '';
    }
    if (action === 'format') {
      return '';
    }
    if (action === 'emergency') {
      return '';
    }
    return '';
  }

  /**
   * featuresForSdk：返回该 SDK 版本支持的通话能力。
   * @param sdk 主版本号。
   * @returns 能力名称数组。
   */
  static featuresForSdk(sdk: number): string[] {
    const base: string[] = ['dial', 'hasCall', 'getCallState', 'formatPhoneNumber'];
    if (sdk >= 9) {
      base.push('isEmergencyPhoneNumber');
    }
    if (sdk >= 10) {
      base.push('formatPhoneNumberToE164');
    }
    if (sdk >= 11) {
      base.push('hasVoiceCapability');
    }
    if (sdk >= 12) {
      base.push('getCallStateSync');
    }
    return base;
  }
}
