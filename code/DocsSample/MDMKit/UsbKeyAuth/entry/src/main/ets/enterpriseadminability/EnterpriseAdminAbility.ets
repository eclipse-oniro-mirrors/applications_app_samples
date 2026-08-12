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

// [Start import_usb_key]
import { securityManager } from '@kit.MDMKit';
import { userAuth } from '@kit.UserAuthenticationKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
// [End import_usb_key]
import { commonEventManager } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { EnterpriseAdminExtensionAbility } from '@kit.MDMKit';
import Logger from '../common/Logger';

const TAG = 'UsbKeyAuth';
// [Start want_and_account]
const wantTemp: Want = {
  bundleName: 'com.example.usbkeyauth',
  abilityName: 'EnterpriseAdminAbility'
};
// 开发者需替换为实际的账户ID
const accountId: number = 100;
// [End want_and_account]
// [Start plugin_info]
// pluginInfo 为企业自定义认证器的标识名称，由认证器提供方提供
const pluginInfo: string = 'com.example.usbkeyplugin';
// [End plugin_info]

enum UsbKeyEvent {
  EVENT_BIND = 'EVENT_BIND',
  EVENT_UNBIND = 'EVENT_UNBIND',
  EVENT_QUERY = 'EVENT_QUERY',
  EVENT_SET_POLICY = 'EVENT_SET_POLICY',
  EVENT_GET_POLICY = 'EVENT_GET_POLICY',
  EVENT_RESULT = 'EVENT_RESULT',
}

const STATUS_RESULT = 1;

export default class EnterpriseAdminAbility extends EnterpriseAdminExtensionAbility {
  private subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
    events: [
      UsbKeyEvent.EVENT_BIND,
      UsbKeyEvent.EVENT_UNBIND,
      UsbKeyEvent.EVENT_QUERY,
      UsbKeyEvent.EVENT_SET_POLICY,
      UsbKeyEvent.EVENT_GET_POLICY,
    ],
  };

  onStart(): void {
    Logger.info('UsbKeyAuth EnterpriseAdminAbility onStart');
    this.createSubscriber();
  }

  private createSubscriber() {
    commonEventManager.createSubscriber(this.subscribeInfo, (error, data) => {
      if (error) {
        Logger.error(`createSubscriber failed: ${JSON.stringify(error)}`);
        return;
      }
      this.handleEvent(data.event);
    });
  }

  private handleEvent(event: string) {
    switch (event) {
      case UsbKeyEvent.EVENT_BIND:
        this.bindUsbKey();
        break;
      case UsbKeyEvent.EVENT_UNBIND:
        this.unbindUsbKey();
        break;
      case UsbKeyEvent.EVENT_QUERY:
        this.queryCredentials();
        break;
      case UsbKeyEvent.EVENT_SET_POLICY:
        this.setUnlockPolicyExample();
        break;
      case UsbKeyEvent.EVENT_GET_POLICY:
        this.getUnlockPolicyExample();
        break;
    }
  }

  // [Start request_auth_token]
  // 发起用户身份认证，返回 authToken
  private requestAuthToken(challenge: Uint8Array, title: string): Promise<Uint8Array> {
    return new Promise((resolve, reject) => {
      const authParam: userAuth.AuthParam = {
        challenge: challenge,
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4,
      };
      const widgetParam: userAuth.WidgetParam = { title };
      const instance = userAuth.getUserAuthInstance(authParam, widgetParam);
      instance.on('result', {
        onResult: (result: userAuth.UserAuthResult) => {
          instance.off('result');
          if (result.result === userAuth.ResultCode.RESULT_SUCCESS && result.token) {
            resolve(result.token);
          } else {
            reject(new Error(`Authentication failed, result code: ${result.result}`));
          }
        }
      });
      instance.start();
    });
  }
  // [End request_auth_token]

  // [Start bind_usb_key]
  private async bindUsbKey() {
    const MAX_RETRIES = 3;
    let retryCount = 0;

    while (retryCount < MAX_RETRIES) {
      try {
        // 第1步：打开会话，获取挑战值
        const challenge: Uint8Array = await securityManager.openSession(wantTemp, accountId);
        Logger.info('Succeeded in opening session.');

        // 第2步：发起用户身份认证，获取认证令牌
        const authToken: Uint8Array = await this.requestAuthToken(challenge, 'USB Key绑定身份验证');
        Logger.info('Authentication succeeded.');

        // 第3步：绑定USB Key凭据
        const addInfo: securityManager.AddCredentialInfo = { pluginInfo, authToken };
        securityManager.addUserExtCredential(wantTemp, addInfo);
        Logger.info('Succeeded in adding USB Key credential.');

        // 第4步：关闭会话
        securityManager.closeSession(wantTemp, accountId);
        Logger.info('USB Key binding completed.');

        // 可选：配置USB Key解锁模式（EXTENDED_AUTH_REQUIRED 表示USB Key+锁屏密码组合认证）
        securityManager.setUnlockPolicy(
          wantTemp,
          securityManager.UnlockPolicy.EXTENDED_AUTH_REQUIRED,
          accountId
        );
        Logger.info('Succeeded in setting unlock policy.');
        this.sendResult('USB Key binding succeeded.');
        return;
      } catch (err) {
        const error = err as BusinessError;
        // Session超期（9201050）或服务超时（9200016），可重试
        if ((error.code === 9201050 || error.code === 9200016) && retryCount < MAX_RETRIES - 1) {
          retryCount++;
          Logger.warn(`Operation failed with code ${error.code}, retrying... (${retryCount}/${MAX_RETRIES})`);
          await new Promise(resolve => setTimeout(resolve, 1500));
          continue;
        }
        Logger.error(`bindUsbKey failed. Code: ${error.code}, message: ${error.message}`);
        try {
          securityManager.closeSession(wantTemp, accountId);
        } catch (closeErr) {
          // 忽略关闭会话的错误
        }
        this.sendResult(`USB Key binding failed. Code: ${error.code}`);
        return;
      }
    }
  }
  // [End bind_usb_key]

  // [Start unbind_usb_key]
  private async unbindUsbKey() {
    const MAX_RETRIES = 3;
    let retryCount = 0;

    // 第1步：查询已绑定的USB Key凭据
    const credentials: securityManager.UserExtCredentialInfo[] =
      await securityManager.getUserExtCredential(wantTemp, accountId);
    if (credentials.length === 0) {
      Logger.info('No USB Key credential found.');
      this.sendResult('No USB Key credential found.');
      return;
    }
    const targetCredentialId: Uint8Array = credentials[0].credentialId;

    while (retryCount < MAX_RETRIES) {
      try {
        // 第2步：打开会话，获取挑战值
        const challenge: Uint8Array = await securityManager.openSession(wantTemp, accountId);
        Logger.info('Succeeded in opening session.');

        // 第3步：发起用户身份认证，获取认证令牌
        const authToken: Uint8Array = await this.requestAuthToken(challenge, 'USB Key解绑身份验证');
        Logger.info('Authentication succeeded.');

        // 第4步：解绑USB Key凭据
        const removeInfo: securityManager.RemoveCredentialInfo = {
          credentialId: targetCredentialId,
          authToken: authToken,
        };
        securityManager.removeUserExtCredential(wantTemp, removeInfo);
        Logger.info('Succeeded in removing USB Key credential.');

        securityManager.closeSession(wantTemp, accountId);
        Logger.info('USB Key unbinding completed.');

        // 可选：重置解锁模式为系统默认
        securityManager.setUnlockPolicy(
          wantTemp,
          securityManager.UnlockPolicy.DEFAULT,
          accountId
        );
        Logger.info('Succeeded in resetting unlock policy.');
        this.sendResult('USB Key unbinding succeeded.');
        return;
      } catch (err) {
        const error = err as BusinessError;
        // Session超期（9201050）或服务超时（9200016），可重试
        if ((error.code === 9201050 || error.code === 9200016) && retryCount < MAX_RETRIES - 1) {
          retryCount++;
          Logger.warn(`Operation failed with code ${error.code}, retrying... (${retryCount}/${MAX_RETRIES})`);
          await new Promise(resolve => setTimeout(resolve, 1500));
          continue;
        }
        Logger.error(`unbindUsbKey failed. Code: ${error.code}, message: ${error.message}`);
        try {
          securityManager.closeSession(wantTemp, accountId);
        } catch (closeErr) {
          // 忽略关闭会话的错误
        }
        this.sendResult(`USB Key unbinding failed. Code: ${error.code}`);
        return;
      }
    }
  }
  // [End unbind_usb_key]

  // [Start query_credentials]
  private queryCredentials() {
    securityManager.getUserExtCredential(wantTemp, accountId).then(
      (credentials: securityManager.UserExtCredentialInfo[]) => {
        Logger.info(`Found ${credentials.length} USB Key credential(s).`);
        credentials.forEach((cred, index) => {
          Logger.info(`Credential ${index}: pluginInfo=${cred.pluginInfo}`);
        });
        this.sendResult(`Found ${credentials.length} USB Key credential(s).`);
      }
    ).catch((err: BusinessError) => {
      Logger.error(`Failed to get credentials. Code: ${err.code}, message: ${err.message}`);
      this.sendResult(`Failed to get credentials. Code: ${err.code}`);
    });
  }
  // [End query_credentials]

  // [Start set_unlock_policy]
  private setUnlockPolicyExample() {
    // 设置解锁策略：仅使用USB Key解锁，无需锁屏密码
    try {
      securityManager.setUnlockPolicy(wantTemp, securityManager.UnlockPolicy.EXTENDED_AUTH_ONLY, accountId);
      Logger.info('Succeeded in setting unlock policy to EXTENDED_AUTH_ONLY.');
      this.sendResult('Set unlock policy succeeded.');
    } catch (err) {
      const error = err as BusinessError;
      Logger.error(`Failed to set unlock policy. Code: ${error.code}, message: ${error.message}`);
      this.sendResult(`Failed to set unlock policy. Code: ${error.code}`);
    }
  }
  // [End set_unlock_policy]

  // [Start get_unlock_policy]
  private getUnlockPolicyExample() {
    try {
      const policy = securityManager.getUnlockPolicy(wantTemp, accountId);
      switch (policy) {
        case securityManager.UnlockPolicy.DEFAULT:
          Logger.info('Current unlock policy: DEFAULT (system default).');
          break;
        case securityManager.UnlockPolicy.EXTENDED_AUTH_ONLY:
          Logger.info('Current unlock policy: EXTENDED_AUTH_ONLY (USB Key only).');
          break;
        case securityManager.UnlockPolicy.EXTENDED_AUTH_REQUIRED:
          Logger.info('Current unlock policy: EXTENDED_AUTH_REQUIRED (USB Key + password).');
          break;
        default:
          Logger.info(`Unknown unlock policy: ${policy}`);
      }
      this.sendResult(`Current unlock policy: ${policy}`);
    } catch (err) {
      const error = err as BusinessError;
      Logger.error(`Failed to get unlock policy. Code: ${error.code}, message: ${error.message}`);
      this.sendResult(`Failed to get unlock policy. Code: ${error.code}`);
    }
  }
  // [End get_unlock_policy]

  private sendResult(result: string) {
    commonEventManager.publish(UsbKeyEvent.EVENT_RESULT, {
      code: STATUS_RESULT,
      data: result
    }, (err: BusinessError) => {
      if (err) {
        Logger.error(`Publish failed: ${JSON.stringify(err)}`);
      }
    });
  }

  onAdminEnabled() {
    Logger.info('onAdminEnabled');
    this.sendResult('Admin activated.');
  }

  onAdminDisabled() {
    Logger.info('onAdminDisabled');
    this.sendResult('Admin deactivated.');
  }

  onAppStart(bundleName: string): void {
    Logger.info(`onAppStart bundleName: ${bundleName}`);
  }
}
