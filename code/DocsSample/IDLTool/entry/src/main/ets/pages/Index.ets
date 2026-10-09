/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import IdlTestImp from '../IIdlTestServiceTs/IdlTestImp';
// [Start idl_ts_client]
import { Want, common } from '@kit.AbilityKit';
import IdlTestServiceProxy from '../IIdlTestServiceTs/idl_test_service_proxy';
import { hilog } from '@kit.PerformanceAnalysisKit';
const DOMAIN = 0x0000;
const TAG = 'IdlClient';

function callbackTestIntTransaction(result: number, ret: number): void {
  if (result === 0 && ret === 124) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'case 1 success');
  }
}

function callbackTestStringTransaction(result: number): void {
  if (result === 0) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'case 2 success');
  }
}

function callbackTestMapTransaction(result: number): void {
  if (result === 0) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'case 3 success');
  }
}

function callbackTestArrayTransaction(result: number, ret: number): void {
  if (result === 0 && ret === 124) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'case 4 success');
  }
}

let onAbilityConnectDone: common.ConnectOptions = {
  onConnect: (elementName, proxy) => {
    let testProxy: IdlTestServiceProxy = new IdlTestServiceProxy(proxy);
    let testMap: Map<number, number> = new Map();
    testMap.set(1, 2);
    testProxy.testIntTransaction(123, callbackTestIntTransaction);
    testProxy.testStringTransaction('hello', callbackTestStringTransaction);
    testProxy.testMapTransaction(testMap, callbackTestMapTransaction);
    testProxy.testArrayTransaction(['1', '2'], callbackTestArrayTransaction);
  },
  onDisconnect: (elementName) => {
    hilog.info(DOMAIN, TAG, '%{public}s', 'onDisconnectService onDisconnect');
  },
  onFailed: (code) => {
    hilog.error(DOMAIN, TAG, '%{public}s', 'onDisconnectService onFailed');
  }
};

// [StartExclude idl_ts_client]
@Entry
@Component
struct Index {
  @State message: Resource = $r('app.string.app_title');
  @State intResult: string = '';
  @State stringResult: string = '';
  @State mapResult: string = '';
  @State arrayResult: string = '';
  private testProxy: IdlTestServiceProxy | null = null;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
// [EndExclude idl_ts_client]
connectAbility(): void {
  let want: Want = {
    bundleName: 'com.example.idltool',
    abilityName: 'com.example.idltool.ServiceAbility'
  };
  let connectionId = -1;
  connectionId = this.context.connectServiceExtensionAbility(want, onAbilityConnectDone);
}
// [End idl_ts_client]

  aboutToAppear(): void {
    let remoteObject = new IdlTestImp('IdlTestService');
    this.testProxy = new IdlTestServiceProxy(remoteObject);
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 30 })

      Button('TestIntTransaction')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          if (this.testProxy != null) {
            this.testProxy.testIntTransaction(123, (result: number, ret: number) => {
              hilog.info(DOMAIN, TAG, 'testIntTransaction result: %{public}d, ret: %{public}d', result, ret);
              if (result === 0) {
                this.context.resourceManager.getStringValue($r('app.string.result_success_with_value'))
                  .then((value: string) => {
                    this.intResult = value.replace('%s', ret.toString());
                  });
              } else {
                this.context.resourceManager.getStringValue($r('app.string.result_failed_with_code'))
                  .then((value: string) => {
                    this.intResult = value.replace('%s', result.toString());
                  });
              }
            });
          }
        })

      Text(this.intResult)
        .fontSize(16)
        .fontColor('#007DFF')
        .margin({ bottom: 20 })

      Button('TestStringTransaction')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          if (this.testProxy != null) {
            this.testProxy.testStringTransaction('hello', (result: number) => {
              hilog.info(DOMAIN, TAG, 'testStringTransaction result: %{public}d', result);
              if (result === 0) {
                this.context.resourceManager.getStringValue($r('app.string.result_success'))
                  .then((value: string) => {
                    this.stringResult = value;
                  });
              } else {
                this.context.resourceManager.getStringValue($r('app.string.result_failed_with_code'))
                  .then((value: string) => {
                    this.stringResult = value.replace('%s', result.toString());
                  });
              }
            });
          }
        })

      Text(this.stringResult)
        .fontSize(16)
        .fontColor('#007DFF')
        .margin({ bottom: 20 })

      Button('TestMapTransaction')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          if (this.testProxy != null) {
            let testMap: Map<number, number> = new Map();
            testMap.set(1, 2);
            this.testProxy.testMapTransaction(testMap, (result: number) => {
              hilog.info(DOMAIN, TAG, 'testMapTransaction result: %{public}d', result);
              if (result === 0) {
                this.context.resourceManager.getStringValue($r('app.string.result_success'))
                  .then((value: string) => {
                    this.mapResult = value;
                  });
              } else {
                this.context.resourceManager.getStringValue($r('app.string.result_failed_with_code'))
                  .then((value: string) => {
                    this.mapResult = value.replace('%s', result.toString());
                  });
              }
            });
          }
        })

      Text(this.mapResult)
        .fontSize(16)
        .fontColor('#007DFF')
        .margin({ bottom: 20 })

      Button('TestArrayTransaction')
        .width('80%')
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          if (this.testProxy != null) {
            this.testProxy.testArrayTransaction(['1', '2'], (result: number, ret: number) => {
              hilog.info(DOMAIN, TAG, 'testArrayTransaction result: %{public}d, ret: %{public}d', result, ret);
              if (result === 0) {
                this.context.resourceManager.getStringValue($r('app.string.result_success_with_value'))
                  .then((value: string) => {
                    this.arrayResult = value.replace('%s', ret.toString());
                  });
              } else {
                this.context.resourceManager.getStringValue($r('app.string.result_failed_with_code'))
                  .then((value: string) => {
                    this.arrayResult = value.replace('%s', result.toString());
                  });
              }
            });
          }
        })

      Text(this.arrayResult)
        .fontSize(16)
        .fontColor('#007DFF')
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
