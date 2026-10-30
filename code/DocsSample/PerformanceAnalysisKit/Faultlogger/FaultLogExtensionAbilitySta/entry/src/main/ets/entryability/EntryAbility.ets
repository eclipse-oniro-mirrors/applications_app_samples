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

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
// [Start fault_log_extension_arkts_sta_code_entryability]
import { hiAppEvent } from '@kit.PerformanceAnalysisKit';
// [StartExclude fault_log_extension_arkts_sta_code_entryability]

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onCreate');
// [EndExclude fault_log_extension_arkts_sta_code_entryability]
    hiAppEvent.addWatcher({
      // 开发者可以自定义观察者名称，系统会使用名称来标识不同的观察者
      name: "EntryAbilityWatcherNormal",
      // 开发者可以订阅感兴趣的系统事件，此处是订阅了应用冻屏事件
      appEventFilters: [
        {
          domain: hiAppEvent.domain.OS,
          names: [hiAppEvent.event.APP_FREEZE]
        }
      ],
      // 故障发生后，正常重启执行观察者A处理事件回调
      onReceive: (domain: string, appEventGroups: Array<hiAppEvent.AppEventGroup>) => {
// [StartExclude fault_log_extension_arkts_sta_code_entryability]
        hilog.info(0x0001, "EntryAbility", `domain:${domain}, ${JSON.stringify(appEventGroups)}`);
// [EndExclude fault_log_extension_arkts_sta_code_entryability]
      }
    })

    // 在onCreate函数中添加系统事件的订阅，观察者B
    hiAppEvent.addWatcher({
      // 开发者可以自定义观察者名称，系统会使用名称来标识不同的观察者
      name: "EntryAbilityWatcherExtension",
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
// [StartExclude fault_log_extension_arkts_sta_code_entryability]
        hilog.info(0x0001, "EntryAbility", `domain:${domain}, ${JSON.stringify(appEventGroups)}`);
// [EndExclude fault_log_extension_arkts_sta_code_entryability]
      }
    })
// [StartExclude fault_log_extension_arkts_sta_code_entryability]
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag', 'loadContent entering');
        if (err && err.code) {
          hilog.info(0x0000, 'testTag', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag', 'loadContent ok');
      });
    } catch (e) {
      hilog.info(0x0000, 'testTag', 'loadContent catch error：-----------' + e.message);
    }
  }
}
// [EndExclude fault_log_extension_arkts_sta_code_entryability]
// [End fault_log_extension_arkts_sta_code_entryability]