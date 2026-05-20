"use static"
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

// [Start ability_app_service_five]
import { AppServiceExtensionAbility, Want } from '@kit.AbilityKit';
import { bundleManager } from '@kit.AbilityKit';
import rpc from '@ohos.rpc';
import { osAccount, BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[MyAppServiceExtAbility]';
const DOMAIN_NUMBER: int = 0xFF00;

class Stub extends rpc.RemoteObject {
  public constructor(des: string) {
    super(des);
  }

  private validAppIdentifier: string = 'your_valid_app_identifier_here';

  onRemoteMessageRequest(
    code: int,
    data: rpc.MessageSequence,
    reply: rpc.MessageSequence,
    options: rpc.MessageOption): boolean | Promise<boolean> {
    this.verifyClientIdentity().then((isValid: boolean) => {
      if (isValid) {
        hilog.info(DOMAIN_NUMBER, TAG, 'Client authentication PASSED');
      } else {
        hilog.error(DOMAIN_NUMBER, TAG, 'Client authentication FAILED');
      }
    }).catch((err) => {
      hilog.error(DOMAIN_NUMBER, TAG, `Authentication error: ${err.code}, ${err.message}`);
    });
    return true;
  }

  private async verifyClientIdentity(): Promise<boolean> {
    try {
      const callerUid: int = rpc.IPCSkeleton.getCallingUid();
      hilog.info(DOMAIN_NUMBER, TAG, `Caller UID: ${callerUid}`);

      const userId: int = await this.getUserIdByUid(callerUid);
      hilog.info(DOMAIN_NUMBER, TAG, `User ID: ${userId}`);

      const bundleName: string = await bundleManager.getBundleNameByUid(callerUid);
      hilog.info(DOMAIN_NUMBER, TAG, `Bundle Name: ${bundleName}`);

      const bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfo(bundleName, bundleFlags, userId);

      if (bundleInfo.signatureInfo && bundleInfo.signatureInfo!.appIdentifier) {
        const appIdentifier: string = bundleInfo.signatureInfo!.appIdentifier;
        hilog.info(DOMAIN_NUMBER, TAG, `App Identifier: ${appIdentifier}`);
        return appIdentifier === this.validAppIdentifier;
      }
      return false;
    } catch (err) {
      if (err instanceof Error) {
        hilog.error(DOMAIN_NUMBER, TAG, `Verification failed: ${err.message}`);
      } else {
        hilog.error(DOMAIN_NUMBER, TAG, `Verification failed: ${String(err)}`);
      }
      return false;
    }
  }

  private async getUserIdByUid(uid: int): Promise<int> {
    try {
      const accountManager = osAccount.getAccountManager();
      const userId: int = await accountManager.getOsAccountLocalIdForUid(uid);
      return userId;
    } catch (err) {
      if (err instanceof Error) {
        hilog.error(DOMAIN_NUMBER, TAG, `Get userId failed: ${err.message}`);
        throw err;
      } else {
        const error = new Error(String(err));
        hilog.error(DOMAIN_NUMBER, TAG, `Get userId failed: ${error.message}`);
        throw error;
      }
    }
  }
}

export default class MyAppServiceExtAbility extends AppServiceExtensionAbility {
  onConnect(want: Want): rpc.RemoteObject {
    return new Stub('test');
  }
  // 其他生命周期
}
// [End ability_app_service_five]