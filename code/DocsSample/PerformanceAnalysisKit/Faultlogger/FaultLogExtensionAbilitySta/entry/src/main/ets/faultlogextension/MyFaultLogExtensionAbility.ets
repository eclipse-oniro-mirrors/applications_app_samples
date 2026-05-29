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

// [Start fault_log_extension_arkts_sta_code_ability]
// 导入需要继承的类FaultLogExtensionAbility
import { FaultLogExtensionAbility, hilog, hiAppEvent } from '@kit.PerformanceAnalysisKit';

export default class MyFaultLogExtensionAbility extends FaultLogExtensionAbility {
  // 重写onConnect函数
  onConnect() : void {
    hilog.info(0x0000, 'testTag', `FaultLogExtensionAbility onConnect`);
  }

  // 重写onDisconnect函数
  onDisconnect() : void {
    hilog.info(0x0000, 'testTag', `FaultLogExtensionAbility onDisconnect`);
  }

  // 重写onFaultReportReady函数
  onFaultReportReady() : void {
    hilog.info(0x0000, 'testTag', `FaultLogExtensionAbility onFaultReportReady`);
    hiAppEvent.addWatcher({
      // 观察者名称，保持与主进程事件观察者B一致
      name: "EntryAbilityWatcherExtension",
      // 开发者可以订阅感兴趣的系统事件，此处是订阅了应用冻屏事件
      appEventFilters: [
        {
          domain: hiAppEvent.domain.OS,
          names: [hiAppEvent.event.APP_FREEZE]
        }
      ],
      // 开发者可以自行实现订阅回调函数，以便对订阅获取到的事件数据进行自定义处理
      onReceive: (domain: string, appEventGroups: Array<hiAppEvent.AppEventGroup>) => {
        hilog.info(0x0000, 'testTag', `HiAppEvent onReceive: domain=${domain}`);
        for (const eventGroup of appEventGroups) {
          // 开发者可以根据事件集合中的事件名称区分不同的系统事件
          hilog.info(0x0000, 'testTag', `HiAppEvent eventName=${eventGroup.name}`);
          for (const eventInfo of eventGroup.appEventInfos) {
            // 开发者可以对事件集合中的事件数据进行自定义处理，此处是将事件数据打印在日志中
            hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.domain=${eventInfo.domain}`);
            hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.name=${eventInfo.name}`);
            hilog.info(0x0000, 'testTag', `HiAppEvent eventInfo.eventType=${eventInfo.eventType}`);
          }
        }
      }
    });
  }
}
// [End fault_log_extension_arkts_sta_code_ability]
