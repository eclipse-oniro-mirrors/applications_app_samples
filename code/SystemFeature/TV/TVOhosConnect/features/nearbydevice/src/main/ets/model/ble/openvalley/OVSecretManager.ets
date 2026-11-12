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
import { common } from '@kit.AbilityKit';
import { platform } from 'library_communication/Index';
import { LoginReq, LoginRes } from './network/LoginModel';
import { GlobalStore } from './util/GlobalStore';
import { BytesUtils, PRODUCT_ID, RESPONSE_CODE_OK, UIUtils } from 'library_communication';
import { NetworkApi } from './network/NetworkApi';
import { Logger } from '@ohos/common';
import { ProductConfigCredentialReq, ProductConfigCredentialRes } from './network/ProductConfigCredentialModel';
import { SecretKeyAndSign, SignConfig } from './entity/SecretKeyAndSign';
import { GlobalContext } from './util/GlobalContext';

const TAG: string = 'OVSecretManager';

export default class OVSecretManager {
  public static username: string = '';
  public static password: string = '';
  public static tenantId: string = '';

  private static loadCredentials(): void {
    try {
      const context = GlobalContext.get().getObject('context') as common.Context;
      const resourceManager = context.resourceManager;
      OVSecretManager.username = resourceManager.getStringSync($r('app.string.ov_account_username'));
      OVSecretManager.password = resourceManager.getStringSync($r('app.string.ov_account_password'));
      OVSecretManager.tenantId = resourceManager.getStringSync($r('app.string.ov_account_tenant_id'));
    } catch (error) {
      Logger.error(TAG, 'load credentials failed');
    }
  }

  /**
   * 通过登录，初始化密钥配置
   */
  public static secretInit() {
    OVSecretManager.loadCredentials();
    let secretKeyAndSign = GlobalStore.getInstance().getSecretKeyAndSign();
    if (secretKeyAndSign) {
      let privateKey = secretKeyAndSign.priKeyStr;
      let publicKey = secretKeyAndSign.pubKeyStr;
      if (privateKey && publicKey) {
        platform.getISecretInterface().getRSASecret().initKeyPair(privateKey, publicKey);
      }
      Logger.debug(TAG, 'Secret key cache loaded');
    } else {
      //如果没有缓存，重新登录
      BytesUtils.md5(OVSecretManager.password).then((pwd: string) => {
        Logger.debug(TAG, 'Secret service login started');
        OVSecretManager.login(OVSecretManager.username, pwd, OVSecretManager.tenantId);
      }).catch((error: Error) => {
        Logger.error(TAG, 'Secret service password preparation failed: ' + error.message);
      });
    }
  }

  public static login(username: string, password: string, tenantId: string) {
    let loginReq = new LoginReq(username, password, tenantId);
    GlobalStore.getInstance().saveTenantId(OVSecretManager.tenantId);
    NetworkApi.getInstance().login(loginReq).then((loginRes: LoginRes) => {
      if (RESPONSE_CODE_OK === loginRes.code) {
        Logger.debug(TAG, 'Secret service login succeeded');
        OVSecretManager.productConfigCredential();
      } else {
        Logger.debug(TAG, 'login err msg : ' + loginRes.msg);
        UIUtils.showToast(loginRes.msg);
      }
    }).catch((error: Error) => {
      Logger.error(TAG, 'Secret service login failed: ' + error.message);
    });
  }

  //请求密钥配置
  public static async productConfigCredential() {

    try {
      await platform.getISecretInterface().getRSASecret().genKeyPair();
      let priKeyStr = platform.getISecretInterface().getRSASecret().getPrivateKeyStr();
      let pubKeyStr = platform.getISecretInterface().getRSASecret().getPublicKeyStr();

      Logger.debug(TAG, 'Key pair generated');

      let req = new ProductConfigCredentialReq(PRODUCT_ID, pubKeyStr);
      let productConfigCredentialRes: ProductConfigCredentialRes =
        await NetworkApi.getInstance().productConfigCredential(req);
      if (productConfigCredentialRes.code && RESPONSE_CODE_OK === productConfigCredentialRes.code.code) {
        GlobalStore.getInstance().saveAccount(OVSecretManager.username);
        if (productConfigCredentialRes.result) {
          let secretKeyAndSign: SecretKeyAndSign = new SecretKeyAndSign();
          secretKeyAndSign.priKeyStr = priKeyStr;
          secretKeyAndSign.pubKeyStr = pubKeyStr;
          let signConfig: SignConfig = new SignConfig();
          signConfig.sign = productConfigCredentialRes.result.sign;
          signConfig.signInfoVO = productConfigCredentialRes.result.signInfoVO;
          secretKeyAndSign.signConfig = signConfig;
          GlobalStore.getInstance().saveSecretKeyAndSign(secretKeyAndSign);
          Logger.debug(TAG, 'Secret key configuration saved');
        }
      } else if (productConfigCredentialRes.code) {
        UIUtils.showToast(productConfigCredentialRes.code.msg);
      }
    } catch (error) {
      Logger.error(TAG, 'Secret key configuration failed');
    }
  }
};
