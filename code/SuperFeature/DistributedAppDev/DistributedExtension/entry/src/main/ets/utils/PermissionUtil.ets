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
 * 两个用户授权权限的查询与申请：
 * linkEnhance 的 Server / Connection 方法要 ohos.permission.DISTRIBUTED_DATASYNC，
 * proxyChannelManager 的通道方法要 ohos.permission.ACCESS_BLUETOOTH，
 * 都是 user_grant，必须在调用前拿到授权，否则只会收到 201。
 * 页面展示的授权文案存于 string.json，不再写中文字面量。
 */

import { abilityAccessCtrl, bundleManager, common, Permissions } from '@kit.AbilityKit';
import { BLUETOOTH_PERMISSION, DATASYNC_PERMISSION } from '../common/AppConstants';
import { Logger } from './Logger';
import { codeOfThrown, messageOfThrown } from './ErrorUtil';
import { text, text1, text2, text3 } from '../common/StringResource';

const SOURCE: string = 'PermissionUtil';

export class PermissionOutcome {
  public name: string;
  public granted: boolean;
  public code: number;
  public message: string;

  constructor(name: string, granted: boolean, code: number, message: string) {
    this.name = name;
    this.granted = granted;
    this.code = code;
    this.message = message;
  }

  describe(): string {
    const short = this.name.replace('ohos.permission.', '');
    if (this.granted) {
      return text1('perm_describe_granted', short);
    }
    return text3('perm_describe_denied', short, `${this.code}`, this.message);
  }
}

/** 同步查询授权状态：不弹窗，适合在页面 aboutToAppear 时先判断一次 */
export function checkPermission(permission: string): PermissionOutcome {
  try {
    const info = bundleManager.getBundleInfoForSelfSync(
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
    const tokenId: number = info.appInfo.accessTokenId;
    const manager = abilityAccessCtrl.createAtManager();
    const status: abilityAccessCtrl.GrantStatus =
      manager.checkAccessTokenSync(tokenId, permission as Permissions);
    const granted = status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
    const message = granted ? text('perm_granted') : text('perm_not_granted');
    Logger.info(SOURCE, 'checkAccessTokenSync', `${permission} granted=${granted}`);
    return new PermissionOutcome(permission, granted, 0, message);
  } catch (err) {
    const code = codeOfThrown(err);
    const message = text2('perm_check_failed', `${code}`, messageOfThrown(err));
    Logger.error(SOURCE, 'checkAccessTokenSync', message);
    return new PermissionOutcome(permission, false, code, message);
  }
}

/** 两个权限的汇总文案，首页与两个 demo 页共用 */
export function describePermissions(): string {
  const datasync = checkPermission(DATASYNC_PERMISSION);
  const bluetooth = checkPermission(BLUETOOTH_PERMISSION);
  return text2('perm_pair', datasync.describe(), bluetooth.describe());
}

/** 拉起系统授权弹窗：一次申请两个权限，返回值按 requestPermissionsFromUser 的顺序给出 */
export async function requestPermissions(context: common.UIAbilityContext): Promise<string> {
  const list: Permissions[] = [DATASYNC_PERMISSION as Permissions, BLUETOOTH_PERMISSION as Permissions];
  try {
    const manager = abilityAccessCtrl.createAtManager();
    const result = await manager.requestPermissionsFromUser(context, list);
    const results: number[] = result.authResults;
    const parts: string[] = [];
    for (let i = 0; i < list.length; i++) {
      const granted = i < results.length && results[i] === 0;
      const shortName = list[i].replace('ohos.permission.', '');
      const state = granted ? text('perm_granted') : text1('perm_reject', `${i < results.length ? results[i] : -1}`);
      parts.push(text2('perm_item', shortName, state));
    }
    const message = parts.join(text('perm_separator'));
    Logger.info(SOURCE, 'requestPermissionsFromUser', message);
    return message;
  } catch (err) {
    const code = codeOfThrown(err);
    const message = text2('perm_request_failed', `${code}`, messageOfThrown(err));
    Logger.error(SOURCE, 'requestPermissionsFromUser', message);
    return message;
  }
}
