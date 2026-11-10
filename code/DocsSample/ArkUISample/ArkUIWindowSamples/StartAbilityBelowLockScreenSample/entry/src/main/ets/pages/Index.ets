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

// [Start StartAbilityBelowLockScreen]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_StartAbilityBelowLockScreen]';

// 目标应用的bundleName和abilityName
const TARGET_BUNDLE_NAME: string = 'com.samples.belowlockscreentarget';
const TARGET_ABILITY_NAME: string = 'EntryAbility';

@Entry
@Component
struct Index {
  private context: common.UIAbilityContext = AppStorage.get('context') as common.UIAbilityContext;

  startTargetAbility(): void {
    if (!this.context) {
      hilog.error(DOMAIN, TAG, '%{public}s', 'Context is not available.');
      return;
    }
    hilog.info(DOMAIN, TAG, '%{public}s', 'Start to delay 5 seconds before startAbility.');
    // 设置延时函数，延时5秒钟后拉起目标应用，模拟响应事件拉起目标应用
    setTimeout(() => {
      const want: Want = {
        deviceId: '',
        bundleName: TARGET_BUNDLE_NAME,
        abilityName: TARGET_ABILITY_NAME,
        moduleName: 'entry'
      };
      try {
        this.context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            hilog.error(DOMAIN, TAG, 'Failed to startAbility. Code: %{public}s, message: %{public}s',
              `${err.code}`, `${err.message}`);
            return;
          }
          hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in starting target ability.');
        });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.error(DOMAIN, TAG, 'Failed to startAbility. Code: %{public}s, message: %{public}s',
          `${err.code}`, `${err.message}`);
      }
    }, 5000);
  }

  build() {
    Column() {
      Text($r('app.string.start_ability_text'))
        .id('startAbilityText')
        .fontSize(24)
      Button($r('app.string.start_ability_button'))
        .id('startAbilityButton')
        .fontSize(20)
        .onClick(() => {
          hilog.info(DOMAIN, TAG, '%{public}s', 'Click: Start ability below lock screen');
          this.startTargetAbility();
        })
        .margin({ top: 20 })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .height('100%')
    .width('100%')
  }
}
// [End StartAbilityBelowLockScreen]
