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
 * ACCESS_BLUETOOTH 权限申请与校验。
 * HFP 的所有接口都声明了 201（Permission denied），属于 user_grant 权限，
 * 必须在调用 Profile 接口前完成申请，否则只能拿到错误码而不是真实状态。
 *
 * 页面展示文本取自 string.json（经 StringResource 解析），日志一律使用英文，
 * 两者分离避免同一段文案既当界面文案又当排查线索。
 */

import { abilityAccessCtrl, bundleManager, common, Permissions } from '@kit.AbilityKit';
import { text } from '../common/StringResource';
import { BLUETOOTH_PERMISSION } from '../common/AppConstants';
import { ProbeStatus, classifyErrorCode } from '../model/ProfileState';
import { Logger } from './Logger';
import { codeOfThrown, messageOfThrown } from './ErrorUtil';

const SOURCE: string = 'PermissionUtil';
const PERMISSION_LIST: Permissions[] = [BLUETOOTH_PERMISSION as Permissions];

export class PermissionOutcome {
  granted: boolean;
  status: ProbeStatus;
  code: number;
  message: string;

  constructor(granted: boolean, status: ProbeStatus, code: number, message: string) {
    this.granted = granted;
    this.status = status;
    this.code = code;
    this.message = message;
  }

  describe(): string {
    return this.granted ? text('perm_granted') : text('perm_denied_code', this.code, this.message);
  }
}

/** 同步查询授权状态：不弹窗，适合在页面 aboutToAppear 时先判断一次 */
export function checkBluetoothPermission(): PermissionOutcome {
  try {
    const info = bundleManager.getBundleInfoForSelfSync(
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
    const tokenId: number = info.appInfo.accessTokenId;
    const manager = abilityAccessCtrl.createAtManager();
    const status: abilityAccessCtrl.GrantStatus =
      manager.checkAccessTokenSync(tokenId, BLUETOOTH_PERMISSION as Permissions);
    const granted = status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
    Logger.info(SOURCE, 'checkAccessTokenSync', granted ? 'access token granted' : 'access token not granted');
    const message = granted ? text('perm_access_granted') : text('perm_access_denied');
    return new PermissionOutcome(granted, granted ? ProbeStatus.READY : ProbeStatus.PERMISSION_DENIED,
      0, message);
  } catch (err) {
    const code = codeOfThrown(err);
    Logger.error(SOURCE, 'checkAccessTokenSync', `failed, code=${code}, detail=${messageOfThrown(err)}`);
    const message = text('err_action_failed_code', 'checkAccessTokenSync', code, messageOfThrown(err));
    return new PermissionOutcome(false, classifyErrorCode(code), code, message);
  }
}

/** 拉起系统授权弹窗：对应 requestPermissionsFromUser(context, ['ohos.permission.ACCESS_BLUETOOTH']) */
export async function requestBluetoothPermission(context: common.UIAbilityContext): Promise<PermissionOutcome> {
  try {
    const manager = abilityAccessCtrl.createAtManager();
    const result = await manager.requestPermissionsFromUser(context, PERMISSION_LIST);
    const results: number[] = result.authResults;
    const granted = results.length > 0 && results[0] === 0;
    Logger.info(SOURCE, 'requestPermissionsFromUser',
      granted ? 'user granted ACCESS_BLUETOOTH' : 'user denied ACCESS_BLUETOOTH');
    const message = granted ? text('perm_user_granted') : text('perm_user_denied');
    return new PermissionOutcome(granted, granted ? ProbeStatus.READY : ProbeStatus.PERMISSION_DENIED,
      0, message);
  } catch (err) {
    const code = codeOfThrown(err);
    Logger.error(SOURCE, 'requestPermissionsFromUser',
      `failed, code=${code}, detail=${messageOfThrown(err)}`);
    const message = text('err_action_failed_code', 'requestPermissionsFromUser', code, messageOfThrown(err));
    return new PermissionOutcome(false, classifyErrorCode(code), code, message);
  }
}
