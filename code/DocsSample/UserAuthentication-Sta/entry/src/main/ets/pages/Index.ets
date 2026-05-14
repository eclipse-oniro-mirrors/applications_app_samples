'use static'
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

// 本页代码为标准实例，没有使用同步语法，不涉及测试，更多关于测试信息，详见readme。
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Tabs,
  TabContent,
  Button,
  ClickEvent,
  Resource,
  Context,
  UIContext,
  $r,
  FlexAlign,
  TextAlign,
  Blank,
  RowOptions,
  BarMode,
  Alignment
} from '@ohos.arkui.component'
import { State, Watch, AppStorage } from '@ohos.arkui.stateManagement'
import { BusinessError } from '@kit.BasicServicesKit';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { userAuth } from '@kit.UserAuthenticationKit';
import Logger from '../common/Logger';

// 用于获取资源字符串
function resourceToString(resource: Resource): string {
  let result: string = '';
  try {
    result = (AppStorage.get<Context>('pageContext') as Context)?.resourceManager.getStringSync(resource.id);
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    Logger.error(`getStringSync failed, code is ${err?.code}, message is ${err?.message}`);
  }
  if (result === '' || result === undefined) {
    return 'undefined';
  } else {
    return result;
  }
}

// 用于异步等待
function waiting(times: int): Promise<void> {
  // 返回一个 Promise，表示等待 times 毫秒
  return new Promise<void>((resolve, reject) => {
    try {
      setTimeout(() => {
        try {
          resolve(undefined);
        } catch (error) {
          reject(error as Error);
        }
      }, times);
    } catch (error) {
      reject(error as Error);
    }
  });
}

function getRandData(): Uint8Array | null {
  try {
    const rand = cryptoFramework.createRandom();
    const len: int = 16;
    let randData: Uint8Array | null = null;
    let retryCount = 0;
    while (retryCount < 3) {
      randData = rand?.generateRandomSync(len)?.data;
      if (randData) {
        break;
      }
      retryCount++;
    }
    return randData;
  } catch (error) {
    Logger.error(`getRandData error, code is ${error.code}, message is ${error.message}`);
    return null;
  }
}

enum PageIndex {
  QUERY_CAPABILITY = 0, // 能力查询页面的索引值
  EXAMPLE_TAB_1 = 1, // 实例1、2页面的索引值
  EXAMPLE_TAB_2 = 2, // 实例3、4页面的索引值
  EXAMPLE_TAB_3 = 3, // 取消页面的索引值
  PERCEIVE_ADJUST = 4, // 感知和调整认证过程页面的索引值
  EXAMPLE_TAB_4 = 5, // 自定义页面的索引值
  CREDENTIAL_QUERIES = 6, // 查询凭据页面的索引值
  SIMULATION_VALIDATION = 7, // 模拟认证页面的索引值
  AUTH_LOCK_STATE_QUERIES = 8, // 查询认证冻结状态页面的索引值
};

enum ResultIndex {
  WHETHER_SUPPORTED = 0, // 能力查询结果的索引值
  EXAMPLE_1 = 1, // 实例1结果的索引值
  EXAMPLE_2 = 2, // 实例2结果的索引值
  EXAMPLE_3 = 3, // 实例3结果的索引值
  EXAMPLE_4 = 4, // 实例4结果的索引值
  CANCEL = 5, // 实例5结果的索引值
  CUSTOMIZE = 6, // 实例6结果的索引值
  QUERY_CREDENTIALS = 7, // 能力查询结果的索引值
  PERCEIVE_ADJUST = 8 // 感知和调整认证过程的索引值
};

enum ResultMessage {
  PASSED = 'passed',
  FAILED = 'failed'
}

@Entry
@Component
struct Index {
  @State currentIndex: int = 0; // 最开始索引页面为第一页
  @State result: string[] = ['wait', 'wait', 'wait', 'wait', 'wait', 'wait', 'wait', 'wait', 'wait'];
  @State credentialDigest: string = '';
  @State whetherSupport: Resource = $r('app.string.waitQuery');
  @State credentialValue: string = '';
  @State authLockStateContent: string = '';
  SPACE_GAP: int = 5; // Row组件间隙

  /*
   * obtain-supported-authentication-capabilities.md
   * 以查询设备是否支持认证可信等级≥ATL3的FACE认证功能为例
   */
  // [Start obtain_supported_capabilities]
  obtainingSupported() {
    try {
      // 查询认证能力是否支持
      userAuth.getAvailableStatus(userAuth.UserAuthType.FACE, userAuth.AuthTrustLevel.ATL3);
      Logger.info('current auth trust level is supported.');
      return true;
    } catch (error) {
      Logger.error(`current auth trust level is not supported, code is ${error.code}, message is ${error.message}`);
      return false;
    }
  }

  // [End obtain_supported_capabilities]

  /*
   * start-authentication.md
   * 示例1：
   * 发起用户认证，采用认证可信等级≥ATL3的人脸 + 锁屏密码 + 指纹认证，获取认证结果
   * */
  // [Start authentication_example1]
  initiatingUserAuthentication1() {
    try {
      const randData = getRandData();
      if (!randData) {
        return;
      }
      // 设置认证参数
      const authParam: userAuth.AuthParam = {
        challenge: randData,
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3,
      };
      // 配置认证界面
      const widgetParam: userAuth.WidgetParam = {
        title: resourceToString($r('app.string.title')),
      };
      // 获取认证对象
      const userAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
      Logger.info('get userAuth instance successfully.');
      // 订阅认证结果
      userAuthInstance.onResult({
        onResult: (result: userAuth.UserAuthResult) => {
          try {
            Logger.info('userAuthInstance callback.');
            EAWorker.postToMain<void>((): void => {
              this.result[ResultIndex.EXAMPLE_1] =
                result.result == userAuth.UserAuthResultCode.SUCCESS ? ResultMessage.PASSED : ResultMessage.FAILED;
            });
            // 可在认证结束或其他业务需要场景，取消订阅认证结果。
            userAuthInstance.offResult();
          } catch (error) {
            Logger.error(`onResult failed, code: ${error.code}, Message: ${error.message}`);
          }
        }
      });
      // 启动认证
      userAuthInstance.start();
      Logger.info('auth start successfully.');
    } catch (error) {
      Logger.error(`auth failed, code is ${error.code}, message is ${error.message}`);
    }
  }

  // [End authentication_example1]

  /*
   * start-authentication.md
   * 示例2：
   * 发起用户认证，采用认证可信等级≥ATL3的人脸 + 锁屏密码 + 指纹认证 + 认证类型相关 + 复用设备解锁最大有效时长认证，获取认证结果
   * */
  // [Start authentication_example2]
  initiatingUserAuthentication2() {
    // 设置认证参数
    let reuseUnlockResult: userAuth.ReuseUnlockResult = {
      reuseMode: userAuth.ReuseMode.CALLER_IRRELEVANT_AUTH_TYPE_RELEVANT,
      reuseDuration: userAuth.MAX_ALLOWABLE_REUSE_DURATION,
    };
    try {
      const randData = getRandData();
      if (!randData) {
        return;
      }
      const authParam: userAuth.AuthParam = {
        challenge: randData,
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3,
        reuseUnlockResult: reuseUnlockResult,
      };
      // 配置认证界面
      const widgetParam: userAuth.WidgetParam = {
        title: resourceToString($r('app.string.title')),
      };
      // 获取认证对象
      const userAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
      Logger.info('get userAuth instance successfully.');
      // 订阅认证结果
      userAuthInstance.onResult({
        onResult: (result: userAuth.UserAuthResult) => {
          try {
            Logger.info('userAuthInstance callback.');
            EAWorker.postToMain<void>((): void => {
              this.result[ResultIndex.EXAMPLE_2] =
                result.result == userAuth.UserAuthResultCode.SUCCESS ? ResultMessage.PASSED : ResultMessage.FAILED;
            });
            // 可在认证结束或其他业务需要场景，取消订阅认证结果。
            userAuthInstance.offResult();
          } catch (error) {
            Logger.error(`onResult failed, code: ${error.code}, Message: ${error.message}`);
          }
        }
      });
      // 启动认证
      userAuthInstance.start();
      Logger.info('auth start successfully.');
    } catch (error) {
      Logger.error(`auth failed, code is ${error.code}, message is ${error.message}`);
    }
  }

  // [End authentication_example2]

  /*
   * start-authentication.md
   * 示例3：
   * 发起用户认证，采用认证可信等级≥ATL3的人脸 + 锁屏密码 + 指纹认证 + 任意应用认证类型相关 + 复用任意应用最大有效时长认证，获取认证结果：
   * */
  // [Start authentication_example3]
  initiatingUserAuthentication3() {
    // 设置认证参数
    let reuseUnlockResult: userAuth.ReuseUnlockResult = {
      reuseMode: userAuth.ReuseMode.CALLER_IRRELEVANT_AUTH_TYPE_RELEVANT,
      reuseDuration: userAuth.MAX_ALLOWABLE_REUSE_DURATION,
    };
    try {
      const randData = getRandData();
      if (!randData) {
        return;
      }
      const authParam: userAuth.AuthParam = {
        challenge: randData,
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3,
        reuseUnlockResult: reuseUnlockResult,
      };
      // 配置认证界面
      const widgetParam: userAuth.WidgetParam = {
        title: resourceToString($r('app.string.title')),
      };
      // 获取认证对象
      const userAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
      Logger.info('get userAuth instance successfully.');
      // 订阅认证结果
      userAuthInstance.onResult({
        onResult: (result: userAuth.UserAuthResult) => {
          try {
            Logger.info('userAuthInstance callback.');
            EAWorker.postToMain<void>((): void => {
              this.result[ResultIndex.EXAMPLE_3] =
                result.result == userAuth.UserAuthResultCode.SUCCESS ? ResultMessage.PASSED : ResultMessage.FAILED;
            });
            // 可在认证结束或其他业务需要场景，取消订阅认证结果。
            userAuthInstance.offResult();
          } catch (error) {
            Logger.error(`onResult failed, code: ${error.code}, Message: ${error.message}`);
          }
        }
      });
      // 启动认证
      userAuthInstance.start();
      Logger.info('auth start successfully.');
    } catch (error) {
      Logger.error(`auth failed, code is ${error.code}, message is ${error.message}`);
    }
  }

  // [End authentication_example3]

  /*
   * start-authentication.md
   * 示例4：
   * 以模应用方式进行用户身份认证
   * */
  // [Start authentication_example4]
  initiatingUserAuthentication4() {
    // 设置认证参数
    try {
      const randData = getRandData();
      if (!randData) {
        return;
      }
      const authParam: userAuth.AuthParam = {
        challenge: randData,
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3,
      };
      // 配置认证界面
      const widgetParam: userAuth.WidgetParam = {
        title: resourceToString($r('app.string.title')),
        uiContext: this.getUIContext().getHostContext()
      };
      // 获取认证对象
      const userAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
      Logger.info('get userAuth instance successfully.');
      // 订阅认证结果
      userAuthInstance.onResult({
        onResult: (result: userAuth.UserAuthResult) => {
          try {
            Logger.info('userAuthInstance callback.');
            EAWorker.postToMain<void>((): void => {
              this.result[ResultIndex.EXAMPLE_4] =
                result.result == userAuth.UserAuthResultCode.SUCCESS ? ResultMessage.PASSED : ResultMessage.FAILED;
            });
            // 可在认证结束或其他业务需要场景，取消订阅认证结果。
            userAuthInstance.offResult();
          } catch (error) {
            Logger.error(`onResult failed, code: ${error.code}, Message: ${error.message}`);
          }
        }
      });
      // 启动认证
      userAuthInstance.start();
      Logger.info('auth start successfully.');
    } catch (error) {
      Logger.error(`auth failed, code is ${error.code}, message is ${error.message}`);
    }
  }

  // [End authentication_example4]

  // [Start cancel_authentication]
  handleAuthResultAndCanceling(userAuthInstance: userAuth.UserAuthInstance, exampleNumber: int) {
    // [StartExclude cancel_authentication]
    try {
      // userAuthInstance.on异常抛出层
      userAuthInstance.onResult({
        onResult: (result: userAuth.UserAuthResult) => {
          try {
            Logger.info('userAuthInstance callback.');
            EAWorker.postToMain<void>((): void => {
              this.result[exampleNumber] =
                result.result == userAuth.UserAuthResultCode.CANCELED ? ResultMessage.PASSED : ResultMessage.FAILED;
            });
            // 认证完成后取消订阅
            userAuthInstance.offResult();
          } catch (error) {
            Logger.error(`onResult failed, code: ${error.code}, Message: ${error.message}`);
          }
        }
      });
      // [EndExclude cancel_authentication]
      // 启动认证
      userAuthInstance.start();
      Logger.info('auth start successfully.');
      // [StartExclude cancel_authentication]
      // 使用等待函数模拟等待用户认证
      let DELAY_TIME: int = 3000; // 停止3秒
      waiting(DELAY_TIME).then(() => {
        // [EndExclude cancel_authentication]
        // 取消认证
        userAuthInstance.cancel();
        Logger.info('auth cancel successfully.');
        // [StartExclude cancel_authentication]
      });
    } catch (error) {
      Logger.error(`userAuthInstance.on failed, code: ${error.code}, Message: ${error.message}`);
    }
    // [EndExclude cancel_authentication]
  }

  /*
   * cancel-authentication.md
   * 发起认证可信等级≥ATL3的人脸+锁屏密码认证后，取消认证请求
   * */
  cancelingUserAuthentication() {
    try {
      const randData = getRandData();
      if (!randData) {
        return;
      }
      // 设置认证参数
      const authParam: userAuth.AuthParam = {
        challenge: randData,
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3,
      };
      // 配置认证界面
      const widgetParam: userAuth.WidgetParam = {
        title: resourceToString($r('app.string.title')),
      };
      // 获取认证对象
      const userAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
      Logger.info('get userAuth instance successfully.');
      this.handleAuthResultAndCanceling(userAuthInstance, ResultIndex.CANCEL);
    } catch (error) {
      Logger.error(`auth failed, code is ${error.code}, message is ${error.message}`);
    }
  }

  // [End cancel_authentication]

  /*
   * perceive-adjust-authentication-process.md
   * 感知和调整认证过程
   * */
  // [Start perceive-adjust-authentication-process]
  perceiveAndAdjustAuthentication() {
    try {
      const randData = getRandData();
      if (!randData) {
        return;
      }
      // 设置认证参数
      const authParam: userAuth.AuthParam = {
        challenge: randData,
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3,
        skipLockedBiometricAuth: true
      };
      // 配置认证界面
      const widgetParam: userAuth.WidgetParam = {
        title: resourceToString($r('app.string.title')),
      };
      // 获取认证对象
      const userAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
      Logger.info('get userAuth instance successfully.');
      // 订阅认证过程中的提示信息。
      userAuthInstance.onAuthTip((authTipInfo: userAuth.AuthTipInfo) => {
        try {
          Logger.info('userAuthInstance callback.');
          EAWorker.postToMain<void>((): void => {
            this.result[ResultIndex.PERCEIVE_ADJUST] =
              `tipType: ${authTipInfo.tipType}, tipCode: ${authTipInfo.tipCode}`;
          });
        } catch (error) {
          Logger.error(`onResult failed, code: ${error.code}, Message: ${error.message}`);
        }
      });
      // 开始认证
      userAuthInstance.start();
    } catch (error) {
      Logger.error(`auth failed, code is ${error.code}, message is ${error.message}`);
    }
  }

  // [End perceive-adjust-authentication-process]

  // [Start custom_authentication]
  handleCustomAuthResult(userAuthInstance: userAuth.UserAuthInstance, exampleNumber: int) {
    // [StartExclude custom_authentication]
    try {
      // [EndExclude custom_authentication]
      userAuthInstance.onResult({
        onResult: (result: userAuth.UserAuthResult) => {
          // [StartExclude custom_authentication]
          EAWorker.postToMain<void>((): void => {
            this.result[exampleNumber] =
              (result.result == userAuth.UserAuthResultCode.CANCELED_FROM_WIDGET ||
                result.result == userAuth.UserAuthResultCode.NOT_ENROLLED) ? ResultMessage.PASSED :
                ResultMessage.FAILED;
          });
          try {
            // [EndExclude custom_authentication]
            Logger.info('userAuthInstance callback');
            if (result.result == userAuth.UserAuthResultCode.CANCELED_FROM_WIDGET ||
              result.result == userAuth.UserAuthResultCode.NOT_ENROLLED) {
              // 请开发者自行完成拉起自定义认证界面的实现
              // [StartExclude custom_authentication]
              EAWorker.postToMain<void>((): void => {
                this.getUIContext().getPromptAction().showToast({
                  message: resourceToString($r('app.string.dialogOfCustom')), // 显示文本
                  duration: 3000, // 显示时长3000ms
                  bottom: 300     // 距离底部的距离300vp
                });
              });
              // [EndExclude custom_authentication]
            }
            // [StartExclude custom_authentication]
            userAuthInstance.offResult(); // 认证完成后取消订阅
          } catch (error) {
            Logger.error(`onResult failed, code: ${error.code}, Message: ${error.message}`);
          }
          // [EndExclude custom_authentication]
        }
      });
      // 启动认证
      userAuthInstance.start();
      Logger.info('auth start successfully.');
      // [StartExclude custom_authentication]
    } catch (error) {
      Logger.error(`userAuthInstance.on failed, code: ${error.code}, Message: ${error.message}`);
    }
    // [EndExclude custom_authentication]
  }

  /*
   * apply-custom-authentication.md
   * 当前示例仅展示如何配置界面、选择切换到自定义认证界面，具体拉起的页面及对应页面的实现，请开发者自行实现
   * */
  applyingCustomAuthentication() {
    try {
      const randData = getRandData();
      if (!randData) {
        return;
      }
      const authParam: userAuth.AuthParam = {
        challenge: randData,
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3,
      };
      // 配置自定义认证，需设置导航键文本
      const widgetParam: userAuth.WidgetParam = {
        title: resourceToString($r('app.string.title')),
        navigationButtonText: resourceToString($r('app.string.navigationButtonText'))
      };
      // 获取认证对象
      const userAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
      Logger.info('get userAuth instance successfully.');
      // 订阅认证结果
      this.handleCustomAuthResult(userAuthInstance, ResultIndex.CUSTOMIZE);
    } catch (error) {
      Logger.error(`auth failed, code is ${error.code}, message is ${error.message}`);
    }
  }

  // [End custom_authentication]

  /*
   * obtain-enrolled-state-capabilities.md
   * 以查询用户人脸注册凭据的状态为例
   * */
  // [Start obtain_enrolled_capabilities]
  obtainingEnrolledCredentialInformation() {
    try {
      let enrolledState = userAuth.getEnrolledState(userAuth.UserAuthType.PIN);
      Logger.info('get current enrolled state successfully.');
      return enrolledState.credentialDigest;
    } catch (error) {
      Logger.error(`get current enrolled state failed, code is ${error.code}, message is ${error.message}`);
      return false;
    }
  }

  // [End obtain_enrolled_capabilities]

  /*
   * obtain-auth-lock-state-capabilities.md
   * 以查询用户PIN码认证类型的认证冻结状态为例
   * */
  // [Start obtain_auth_lock_state_capabilities]
  async obtainingAuthLockState(): Promise<string> {
    try {
      Logger.info(`get auth lock state start`);
      const authLockState: userAuth.AuthLockState = await userAuth.getAuthLockState(userAuth.UserAuthType.PIN);
      if (authLockState.lockoutDuration === userAuth.PERMANENT_LOCKOUT_DURATION) {
        Logger.info('the authentication of given authType is permanent locked.');
      }
      const authLockStateContent: string = JSON.stringify(authLockState);
      Logger.info('get auth lock state successfully.');
      return authLockStateContent;
    } catch (error) {
      const errorMessage: string =
        `get auth lock state failed, err code is : ${error.code}, err message is : ${error.message}`;
      Logger.error(errorMessage);
      return errorMessage;
    }
  }

  // [End obtain_auth_lock_state_capabilities]
  comprehensiveFeatures() {
    // let reuseUnlockResult: userAuth.ReuseUnlockResult = {
    //   reuseMode: userAuth.ReuseMode.AUTH_TYPE_RELEVANT,
    //   reuseDuration: userAuth.MAX_ALLOWABLE_REUSE_DURATION,
    // };
    try {
      const randData = getRandData();
      if (!randData) {
        return;
      }
      const authParam: userAuth.AuthParam = {
        challenge: randData,
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3,
        // reuseUnlockResult: reuseUnlockResult
      };
      // 配置自定义认证，需设置导航键文本
      const widgetParam: userAuth.WidgetParam = {
        title: resourceToString($r('app.string.title')),
        navigationButtonText: resourceToString($r('app.string.navigationButtonText')),
        // 该参数仅在单指纹、单人脸场景下支持，该密码并非系统密码，而是应用自己设置的密码
      };
      // 获取认证对象
      const userAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
      Logger.info('get userAuth instance successfully.');
      // 订阅认证结果
      this.handleCustomAuthResult(userAuthInstance, ResultIndex.CUSTOMIZE);
    } catch (error) {
      Logger.error(`auth failed, code is ${error.code}, message is ${error.message}`);
    }
  }

  @Builder
  tabBuilder(title: Resource, targetIndex: int, tabId: string) {
    Column() {
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? $r('app.color.tab_selected_color') :
          $r('app.color.tab_not_selected_color'))
        .fontSize($r('app.float.size_13'))
    }
    .width('100%')
    .height($r('app.float.size_50'))
    .justifyContent(FlexAlign.Center)
    .id(tabId)
  }

  build() {
    Column() {
      Tabs() {
        TabContent() {
          Column() {
            Text($r('app.string.whetherSupported'))
              .width('70%')
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.size_20'))
            Button($r('app.string.query'))
              .onClick(() => {
                if (this.obtainingSupported()) {
                  this.result[ResultIndex.WHETHER_SUPPORTED] = 'Support';
                } else {
                  this.result[ResultIndex.WHETHER_SUPPORTED] = 'Not Support';
                }
              })
            Text(this.result[ResultIndex.WHETHER_SUPPORTED])
              .fontSize($r('app.float.size_40'))
              .textAlign(TextAlign.Center)
          }
        }.tabBar(() => {
          this.tabBuilder($r('app.string.queryCapability'), PageIndex.QUERY_CAPABILITY,
            'queryCapability')
        })

        TabContent() {
          Column() {
            Text($r('app.string.descriptionContent1'))
              .width('70%')
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.size_20'))
            Button($r('app.string.example1'))
              .onClick(() => {
                this.initiatingUserAuthentication1();
              })
            Text(this.result[ResultIndex.EXAMPLE_1])
              .fontSize($r('app.float.size_40'))
              .textAlign(TextAlign.Center)
            Blank()
              .height('5%')
            Text($r('app.string.descriptionContent2'))
              .width('70%')
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.size_20'))
            Button($r('app.string.example2'))
              .onClick(() => {
                this.initiatingUserAuthentication2();
              })
            Text(this.result[ResultIndex.EXAMPLE_2])
              .fontSize($r('app.float.size_40'))
              .textAlign(TextAlign.Center)
          }
        }.tabBar(() => {
          this.tabBuilder($r('app.string.exampleTab1'), PageIndex.EXAMPLE_TAB_1, 'exampleTab1')
        })

        TabContent() {
          Column() {
            Text($r('app.string.descriptionContent3'))
              .width('70%')
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.size_20'))
            Button($r('app.string.example3'))
              .onClick(() => {
                this.initiatingUserAuthentication3();
              })
            Text(this.result[ResultIndex.EXAMPLE_3])
              .fontSize($r('app.float.size_40'))
              .textAlign(TextAlign.Center)
            Blank()
              .height('5%')
            Text($r('app.string.descriptionContent4'))
              .width('70%')
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.size_20'))
            Button($r('app.string.example4'))
              .onClick(() => {
                this.initiatingUserAuthentication4();
              })
            Text(this.result[ResultIndex.EXAMPLE_4])
              .fontSize($r('app.float.size_40'))
              .textAlign(TextAlign.Center)
          }
        }.tabBar(() => {
          this.tabBuilder($r('app.string.exampleTab2'), PageIndex.EXAMPLE_TAB_2, 'exampleTab2')
        })

        TabContent() {
          Column() {
            Text($r('app.string.descriptionContent5'))
              .width('70%')
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.size_20'))
            Button($r('app.string.example5'))
              .onClick(() => {
                this.cancelingUserAuthentication();
              })
            Text(this.result[ResultIndex.CANCEL])
              .fontSize($r('app.float.size_40'))
              .textAlign(TextAlign.Center)
          }
        }.tabBar(() => {
          this.tabBuilder($r('app.string.exampleTab3'), PageIndex.EXAMPLE_TAB_3, 'exampleTab3')
        })

        TabContent() {
          Column() {
            Text($r('app.string.descriptionContent7'))
              .width('70%')
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.size_20'))
            Button($r('app.string.example6'))
              .onClick(() => {
                this.perceiveAndAdjustAuthentication();
              })
            Text(this.result[ResultIndex.PERCEIVE_ADJUST])
              .fontSize($r('app.float.size_40'))
              .textAlign(TextAlign.Center)
          }
        }.tabBar(() => {
          this.tabBuilder($r('app.string.exampleTab5'), PageIndex.PERCEIVE_ADJUST, 'exampleTab5')
        })

        TabContent() {
          Column() {
            Text($r('app.string.descriptionContent6'))
              .width('70%')
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.size_20'))
            Button($r('app.string.example6'))
              .onClick(() => {
                this.applyingCustomAuthentication();
              })
            Text(this.result[ResultIndex.CUSTOMIZE])
              .fontSize($r('app.float.size_40'))
              .textAlign(TextAlign.Center)
          }
        }.tabBar(() => {
          this.tabBuilder($r('app.string.exampleTab4'), PageIndex.EXAMPLE_TAB_4, 'exampleTab4')
        })

        TabContent() {
          Column() {
            Text($r('app.string.queryCredentials'))
              .width('70%')
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.size_20'))
            Button($r('app.string.query'))
              .onClick(() => {
                if (this.obtainingEnrolledCredentialInformation()) {
                  this.credentialDigest = 'credentialDigest is ' + this.obtainingEnrolledCredentialInformation();
                } else {
                  this.credentialDigest = 'Error';
                }
              })
            Text(this.credentialDigest)
              .fontSize($r('app.float.size_40'))
              .textAlign(TextAlign.Center)
          }
        }.tabBar(() => {
          this.tabBuilder($r('app.string.credentialQueries'), PageIndex.CREDENTIAL_QUERIES,
            'credentialQueries')
        })

        TabContent() {
          Column() {
            Button($r('app.string.refreshSupported'))
              .onClick(() => {
                if (this.obtainingSupported()) {
                  this.whetherSupport = $r('app.string.queryPass');
                } else {
                  this.whetherSupport = $r('app.string.queryError');
                }
              })
              .margin($r('app.float.size_10'))
            Text(this.whetherSupport)
              .fontSize($r('app.float.size_20'))
              .textAlign(TextAlign.Center)
            Blank()
              .height('10%')
            Row({ space: this.SPACE_GAP } as RowOptions) {
              Button($r('app.string.customLogin'))
                .onClick(() => {
                  this.comprehensiveFeatures();
                })
              Button($r('app.string.simpleLogin'))
                .onClick(() => {
                  this.initiatingUserAuthentication1();
                })
            }
            .margin($r('app.float.size_10'))

            Blank()
              .height('10%')
            Text($r('app.string.credentialDescription'))
              .width('80%')
              .fontSize($r('app.float.size_20'))
              .textAlign(TextAlign.Center)
            Button($r('app.string.refreshTheCredentials'))
              .onClick(() => {
                try {
                  let enrolledState = userAuth.getEnrolledState(userAuth.UserAuthType.PIN);
                  Logger.info('get current enrolled state successfully.');
                  this.credentialValue = enrolledState.credentialDigest + '';
                } catch (error) {
                  const err: BusinessError = error as BusinessError;
                  Logger.error(`get current enrolled state failed, code is ${err?.code}, message is ${err?.message}`);
                }
              })
              .margin($r('app.float.size_10'))
            Text(this.credentialValue)
              .fontSize($r('app.float.size_20'))
              .textAlign(TextAlign.Center)
          }
        }
        .tabBar(() => {
          this.tabBuilder($r('app.string.simulationValidation'), PageIndex.SIMULATION_VALIDATION,
            'simulationValidation')
        })

        TabContent() {
          Column() {
            Text($r('app.string.queryAuthLockState'))
              .width('70%')
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.size_20'))
            Button($r('app.string.query'))
              .onClick(() => {
                this.obtainingAuthLockState().then((result: string) => {
                  this.authLockStateContent = result;
                })
              })
            Text(this.authLockStateContent)
              .fontSize($r('app.float.size_40'))
              .textAlign(TextAlign.Center)
          }
        }.tabBar(() => {
          this.tabBuilder($r('app.string.queryAuthLockStateTitle'), PageIndex.AUTH_LOCK_STATE_QUERIES,
            'queryAuthLockState')
        })
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barWidth('90%')
      .barHeight('10%')
      .onChange((index: int) => {
        this.currentIndex = index;
      })
      .width('100%')
      .height('100%')
      .scrollable(true)
    }.height('100%')
  }
}
