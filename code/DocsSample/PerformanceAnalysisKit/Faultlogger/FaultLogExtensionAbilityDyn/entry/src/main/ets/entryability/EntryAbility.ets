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

// [Start fault_log_extension_arkts_dyn_code_entryability]
import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hiAppEvent, hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
// [StartExclude fault_log_extension_arkts_dyn_code_entryability]

const DOMAIN = 0x0000;

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', 'Failed to set colorMode. Cause: %{public}s', JSON.stringify(err));
    }
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
// [EndExclude fault_log_extension_arkts_dyn_code_entryability]
    hiAppEvent.addWatcher ({
      // 开发者可以自定义观察者名称，系统会使用名称来标识不同的观察者
      name: 'EntryAbilityWatcherNormal',
      // 开发者可以订阅感兴趣的系统事件，此处是订阅了应用冻屏事件
      appEventFilters: [
        {
          domain: hiAppEvent.domain.OS,
          names: [hiAppEvent.event.APP_FREEZE]
        }
      ],
      // 故障发生后，正常重启执行观察者A处理事件回调
      onReceive: (domain: string, appEventGroups: Array<hiAppEvent.AppEventGroup>) => {
// [StartExclude fault_log_extension_arkts_dyn_code_entryability]
        hilog.info(0x0001, 'EntryAbility', `domain:${domain}, ${JSON.stringify(appEventGroups)}`);
// [EndExclude fault_log_extension_arkts_dyn_code_entryability]
      }
    });
    // 在onCreate函数中添加系统事件的订阅，观察者B
    hiAppEvent.addWatcher ({
      // 开发者可以自定义观察者名称，系统会使用名称来标识不同的观察者
      name: 'EntryAbilityWatcherExtension',
      // 开发者可以订阅感兴趣的系统事件，此处是订阅了应用冻屏事件
      appEventFilters: [
        {
          domain: hiAppEvent.domain.OS,
          names: [hiAppEvent.event.APP_FREEZE]
        }
      ],
      // 空实现，仅用于生成过滤规则，使故障事件在被处理前保留在应用沙箱内；
      // 若应用正常重启，观察者A已处理相同事件，观察者B通过空处理消耗从沙箱获取的事件，不对事件重复处理。
      onReceive: (domain: string, appEventGroups: Array<hiAppEvent.AppEventGroup>) => {
// [StartExclude fault_log_extension_arkts_dyn_code_entryability]
        hilog.info(0x0001, 'EntryAbility', `domain:${domain}, ${JSON.stringify(appEventGroups)}`);
// [EndExclude fault_log_extension_arkts_dyn_code_entryability]
      }
    });
// [StartExclude fault_log_extension_arkts_dyn_code_entryability]
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
// [EndExclude fault_log_extension_arkts_dyn_code_entryability]
// [End fault_log_extension_arkts_dyn_code_entryability]
