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
// [Start envconf_apppage]
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

import { Entry, Component, State } from '@kit.ArkUI'

const TAG: string = '[EnvAbilityPage7]';
const DOMAIN_NUMBER = 0xFF00;

@Entry
@Component
struct EnvAbilityPage7 {
  private context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private callbackId: int = 0; // 注册订阅系统环境变化的ID

  unsubscribeConfigurationUpdate() {
    let applicationContext = this.context.getApplicationContext();
    try {
      applicationContext.offEnvironment(this.callbackId);
    } catch (err) {
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      hilog.error(DOMAIN_NUMBER, TAG, `Failed to unregister applicationContext. Code is ${code}, message is ${message}`);
    }
  }

  // 页面展示
  build() {
    //...
  }
}
// [End envconf_apppage]