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
// [Start AppEvent_Crash_Click_ArkTS_Header]
import { hiAppEvent } from '@kit.PerformanceAnalysisKit';
import { RecordData } from '@ohos.base';
// [End AppEvent_Crash_Click_ArkTS_Header]

// [Start AppEvent_Declare_C_Function]
class RegisterC {
  native registerWatcherCrash(): void;
  native registerWatcherClick(): void;
}
// [End AppEvent_Declare_C_Function]

// [Start ExternalLogManager]
// 定义ExternalLogManager实现
class MyLogManager extends hiAppEvent.ExternalLogManager {
  // 定义删除文件函数
  deleteFiles (files: string[]): void {
    for (const file of files) {
      try {
        fs.unlinkSync(file);
        hilog.info(0x0000, 'testTag', `[MyLogManager] 已删除: ${file}`);
      } catch (e) {
        hilog.info(0x0000, 'testTag', `[MyLogManager] 删除失败: ${file}, error: ${e}`);
      }
    }
  }

  override onCapacityReached(container: hiAppEvent.ExternalLogContainer): void {
    hilog.info(0x0000, 'testTag', `[MyLogManager] 容量达到阈值，日志数量: ${container.getLogNumber()}`);

    // 获取所有日志文件路径
    let allFiles: Set<string> = container.getAllLogFiles();
    hilog.info(0x0000, 'testTag', `[MyLogManager] 所有日志文件: ${Array.from(allFiles)}`);

    // 获取所有日志详情
    let allLogs: Set<hiAppEvent.ExternalLogWrapper> = container.getAllLogs();
    for (const log of Array.from(allLogs)) {
      hilog.info(0x0000, 'testTag', `[MyLogManager] 文件: ${log.getFilePath()}, ` +
        `时间: ${log.getGenerationTime()}, ` +
        `大小: ${log.getSizeInKb()}KB, ` +
        `事件: ${log.getSysEvent()}`);
    }

    // 按事件类型过滤的日志
    let files: Set<string> = container.getLogFilesOfSysEvent('APP_CRASH');
    hilog.info(0x0000, 'testTag', `[MyLogManager] APP_CRASH 日志: ${Array.from(files)}`);

    // 按时间过滤日志，获取5分钟前生成的日志
    let timePoint: long = Date.now() - 5 * 60 * 1000;
    files = container.getLogFilesGeneratedBefore(timePoint);
    hilog.info(0x0000, 'testTag', `[MyLogManager] 5分钟前的日志: ${Array.from(files)}`);

    // 按时间过滤，获取5分钟内生成的日志
    files = container.getLogFilesGeneratedAfter(timePoint);
    hilog.info(0x0000, 'testTag', `[MyLogManager] 5分钟内的日志: ${Array.from(files)}`);

    // 按大小过滤，获取大于100KB的日志
    files = container.getLogFilesLargerThan(100);
    hilog.info(0x0000, 'testTag', `[MyLogManager] 大于100KB的日志: ${Array.from(files)}`);

    // 按大小过滤，获取小于100KB的日志
    files = container.getLogFilesSmallerThan(100);
    hilog.info(0x0000, 'testTag', `[MyLogManager] 小于100KB的日志: ${Array.from(files)}`);

    // 获取最早生成的3个日志文件，并删除
    files = container.getFirstGeneratedLogFiles(3);
    hilog.info(0x0000, 'testTag', `[MyLogManager] 最早的3个日志: ${Array.from(files)}`);
    deleteFiles(Array.from(files));
  }
}
// [End ExternalLogManager]

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onCreate');
    // [Start RegisterExternalLogManager]
    // 注册external_log日志文件管理者
    let myLogManager = new MyLogManager();
    try {
      hiAppEvent.registerExternalLogManager(myLogManager);
      hilog.info(0x0000, 'testTag', '[MyLogManager] ExternalLogManager 注册成功');
    } catch (e) {
      hilog.info(0x0000, 'testTag', `[MyLogManager] 注册失败: ${e.code}, ${e.message}`);
    }

    // 检查是否已注册
    let registered: boolean = hiAppEvent.isExternalLogManagerRegistered();
    hilog.info(0x0000, 'testTag', `[MyLogManager] 已注册: ${registered}`);
    ```
    // [End RegisterExternalLogManager]

    // [Start AppEvent_Crash_ArkTS_Add_Watcher]
    hiAppEvent.addWatcher({
      // 开发者可以自定义观察者名称，系统会使用名称来标识不同的观察者
      name: 'AppCrashWatcher',
      // 订阅过滤条件，这里是订阅了系统事件中的崩溃事件
      appEventFilters: [
        {
          domain: hiAppEvent.domain.OS,
          names: [hiAppEvent.event.APP_CRASH]
        }
      ],
      // 实现onReceive回调，监听到事件后实时回调
      onReceive: (domain: string, appEventGroups: Array<hiAppEvent.AppEventGroup>) => {
        hilog.info(0x0000, 'testTag', 'AppEvents HiAppEvent success to read event with onReceive callback from ArkTS');
        hilog.info(0x0000, 'testTag', `domain=${domain}`);
        for (const eventGroup of appEventGroups) {
          hilog.info(0x0000, 'testTag', `AppEvents HiAppEvent eventName=${eventGroup.name}`);
          for (const eventInfo of eventGroup.appEventInfos) {
            const params: Record<string, RecordData> = eventInfo.params as Record<string, RecordData>;
            // 开发者可以获取到崩溃事件发生的时间戳
            hilog.info(0x0000, 'testTag', `AppEvents HiAppEvent eventInfo.params.time=${params['time'] as double}`);
            // 开发者可以获取到崩溃应用的包名
            hilog.info(0x0000, 'testTag', `AppEvents HiAppEvent eventInfo.params.bundle_name=${params['bundle_name'] as string}`);
            // 开发者可以获取到崩溃事件发生时的故障日志文件
            hilog.info(0x0000, 'testTag', `AppEvents HiAppEvent eventInfo.params.external_log=${params['external_log'] as Array<string>}`);
          }
        }
      }
    });
    // [End AppEvent_Crash_ArkTS_Add_Watcher]
    // [Start AppEvent_Click_ArkTS_Add_Watcher]
    hiAppEvent.addWatcher({
      // 开发者可以自定义观察者名称，系统会使用名称来标识不同的观察者
      name: 'ButtonClickWatcher',
      // 开发者可以订阅感兴趣的应用事件，此处是订阅了按钮事件
      appEventFilters: [{ domain: 'button' }],
      // 开发者可以设置订阅回调触发的条件，此处是设置为事件打点数量满足1个
      triggerCondition: { row: 1 },
      // 开发者可以自行实现订阅回调函数，以便对订阅获取到的事件打点数据进行自定义处理
      onTrigger: (curRow: int, curSize: int, holder: hiAppEvent.AppEventPackageHolder) => {
        // 如果返回的holder对象为null，表示订阅过程发生异常。因此，在记录错误日志后直接返回
        if (holder == null) {
          hilog.error(0x0000, 'testTag', 'AppEvents HiAppEvent holder is null');
          return;
        }
        hilog.info(0x0000, 'testTag', 'AppEvents HiAppEvent success to read event with onTrigger callback from ArkTS');
        hilog.info(0x0000, 'testTag', `AppEvents HiAppEvent onTrigger: curRow=%{public}d, curSize=%{public}d`, curRow, curSize);
        let eventPkg: hiAppEvent.AppEventPackage | null = null;
        // 根据设置阈值大小（默认为1条事件）去获取订阅事件包，直到将订阅数据全部取出
        // 返回的事件包对象为null，表示当前订阅数据已被全部取出，此次订阅回调触发结束
        while ((eventPkg = holder.takeNext()) !== null) {
          // 开发者可以对事件包中的事件打点数据进行自定义处理，此处是将事件打点数据打印在日志中
          if (eventPkg !== null) {
            hilog.info(0x0000, 'testTag', `AppEvents HiAppEvent eventPkg.packageId=%{public}d`, eventPkg.packageId);
            hilog.info(0x0000, 'testTag', `AppEvents HiAppEvent eventPkg.row=%{public}d`, eventPkg.row);
            hilog.info(0x0000, 'testTag', `AppEvents HiAppEvent eventPkg.size=%{public}d`, eventPkg.size);
            for (const eventInfo of eventPkg.data) {
              hilog.info(0x0000, 'testTag', `AppEvents HiAppEvent eventPkg.info=%{public}s`, eventInfo);
            }
          }
        }
      }
    });
    // [End AppEvent_Click_ArkTS_Add_Watcher]

    // [Start AppEvent_Call_Capi_Function]
    // 在onCreate()函数中添加C API接口调用
    try {
      loadLibrary("entry")
    } catch (e) {
      hilog.error(0x0000, 'HiAppEvent', 'loadFailed when onCreate', e.message);
    }
    let testAni = new RegisterC();
    // 启动时，注册崩溃事件观察者
    testAni.registerWatcherCrash();
    // 启动时，注册按钮点击事件观察者
    testAni.registerWatcherClick();
    // [End AppEvent_Call_Capi_Function]
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
