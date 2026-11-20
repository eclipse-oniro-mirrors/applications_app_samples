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

import { abilityAccessCtrl, bundleManager, common, Permissions, PermissionRequestResult } from '@kit.AbilityKit';
import { CapabilityCheck, PermissionState } from '../model/VCardTypes';
import { VCardConstants } from '../common/VCardConstants';
import { Logger } from '../utils/Logger';

const READ_PERMISSION: Permissions = 'ohos.permission.READ_CONTACTS';
const WRITE_PERMISSION: Permissions = 'ohos.permission.WRITE_CONTACTS';
const INVALID_TOKEN_ID: number = -1;
const PERMISSION_COUNT: number = 2;

export class PermissionService {
  static checkCapability(): CapabilityCheck[] {
    const info: bundleManager.BundleInfo | undefined = PermissionService.querySelfBundle();
    const declared: string[] = PermissionService.readDeclared(info);
    const syscap: boolean = canIUse(VCardConstants.VCARD_SYSCAP);
    const checks: CapabilityCheck[] = [];
    checks.push(new CapabilityCheck('syscap', $r('app.string.vc_check_syscap_name'), syscap,
      syscap ? $r('app.string.vc_check_syscap_ok') : $r('app.string.vc_check_syscap_no')));
    checks.push(new CapabilityCheck('read', $r('app.string.vc_check_read_name'),
      declared.indexOf(VCardConstants.READ_CONTACTS) >= 0, $r('app.string.vc_check_read_desc')));
    checks.push(new CapabilityCheck('write', $r('app.string.vc_check_write_name'),
      declared.indexOf(VCardConstants.WRITE_CONTACTS) >= 0, $r('app.string.vc_check_write_desc')));
    return checks;
  }

  static async getPermissionStates(context: common.Context): Promise<PermissionState[]> {
    const info: bundleManager.BundleInfo | undefined = PermissionService.querySelfBundle();
    const declared: string[] = PermissionService.readDeclared(info);
    const tokenId: number = info !== undefined ? info.appInfo.accessTokenId : INVALID_TOKEN_ID;
    const states: PermissionState[] = [];
    states.push(PermissionService.buildState(VCardConstants.READ_CONTACTS, READ_PERMISSION, declared, tokenId));
    states.push(PermissionService.buildState(VCardConstants.WRITE_CONTACTS, WRITE_PERMISSION, declared, tokenId));
    return states;
  }

  static async requestPermissions(context: common.Context): Promise<boolean> {
    try {
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const result: PermissionRequestResult =
        await atManager.requestPermissionsFromUser(context, [READ_PERMISSION, WRITE_PERMISSION]);
      const authResults: number[] = result.authResults;
      if (authResults.length < PERMISSION_COUNT) {
        return false;
      }
      return authResults[0] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED &&
        authResults[1] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
    } catch (error) {
      const message: string = error instanceof Error ? error.message : '';
      Logger.error('[PermissionService] requestPermissionsFromUser failed: ' + message);
      return false;
    }
  }

  static async hasAllPermissions(context: common.Context): Promise<boolean> {
    const states: PermissionState[] = await PermissionService.getPermissionStates(context);
    return states.length === PERMISSION_COUNT && states[0].granted && states[1].granted;
  }

  private static querySelfBundle(): bundleManager.BundleInfo | undefined {
    try {
      return bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
    } catch (error) {
      const message: string = error instanceof Error ? error.message : '';
      Logger.error('[PermissionService] getBundleInfoForSelfSync failed: ' + message);
      return undefined;
    }
  }

  private static readDeclared(info: bundleManager.BundleInfo | undefined): string[] {
    const names: string[] = [];
    if (info === undefined) {
      return names;
    }
    const details: Array<bundleManager.ReqPermissionDetail> | undefined = info.reqPermissionDetails;
    if (details === undefined) {
      return names;
    }
    for (const detail of details) {
      names.push(detail.name);
    }
    return names;
  }

  private static buildState(name: string, permission: Permissions, declared: string[],
    tokenId: number): PermissionState {
    const state: PermissionState = new PermissionState();
    state.name = name;
    state.declared = declared.indexOf(name) >= 0;
    state.granted = PermissionService.isGranted(tokenId, permission);
    return state;
  }

  private static isGranted(tokenId: number, permission: Permissions): boolean {
    try {
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      return atManager.checkAccessTokenSync(tokenId, permission) ===
        abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
    } catch (error) {
      return false;
    }
  }
}
