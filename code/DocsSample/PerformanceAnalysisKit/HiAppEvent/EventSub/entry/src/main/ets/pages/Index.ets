/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// [Start Native_CrashEvent_Log_Header]
import { fileIo } from '@kit.CoreFileKit';
// [End Native_CrashEvent_Log_Header]
// [Start CrashConfig_Policy_Header]
// [Start EventSub_Header]
import { BusinessError } from '@kit.BasicServicesKit';
// [Start PssLeakEvent_Header]
// [Start MainThreadJankEvent_Header]
import { hiAppEvent, hilog } from '@kit.PerformanceAnalysisKit';
// [End EventSub_Header]
// [End CrashConfig_Policy_Header]
// [Start EventSub_Index_Capi_Header]
import testNapi from 'libentry.so';
// [End EventSub_Index_Capi_Header]
// [End PssLeakEvent_Header]
// [End MainThreadJankEvent_Header]
// [Start ArkWeb_Fling_Jank_Header]
import { ArkWebPage } from './ArkWebPage';
// [End ArkWeb_Fling_Jank_Header]
@Entry
@Component
struct Index {
  @State leakedArray: string[][] = [];
  // [Start AppKillEvent_Button]
  @State message: string = 'Start To Leak';
  // [End AppKillEvent_Button]

  // [Start ArkWeb_Fling_Jank_Nav]
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack();
  @Builder
  PageMap(name: string) {
    if (name === 'ArkWebPage') {
      ArkWebPage();
    }
  }
  // [End ArkWeb_Fling_Jank_Nav]

  configCrashPolicy() {
    // [Start CrashConfig_Policy]
    let policy: hiAppEvent.EventPolicy = {
      appCrashPolicy: {
        pageSwitchLogEnable: true, // 启用页面切换日志。从API version 24开始支持该参数
        extendPcLrPrinting: true, // 使能扩展打印pc和lr寄存器附近的内存值。从API版本26.0.0开始支持该参数
        logFileCutoffSzBytes: 102400, // 截断崩溃日志到100KB。从API版本26.0.0开始支持该参数
        simplifyVmaPrinting: true, // 使能精简打印maps。从API版本26.0.0开始支持该参数
        collectMinidump: true // native崩溃场景，使能minidump。从API版本26.0.0开始支持该参数
        publishOnNextLaunch: true // 使能固定在重启后收到事件回调。从API版本26.1.0开始支持该参数
      }
    };
    hiAppEvent.configEventPolicy(policy).then(() => {
      hilog.info(0x0000, 'hiAppEvent', `Set crash config policy successfully.`);
    }).catch((err: BusinessError) => {
      hilog.error(0x0000, 'hiAppEvent', `Failed to set crash config policy. code: ${err.code}, message: ${err.message}`);
    });
    // [End CrashConfig_Policy]
  }

  build() {
    Navigation(this.navPathStack) {
      Row() {
        Column() {
          // [Start AppEvent_Crash_Button]
          Button('WatchAppCrash ArkTS&C++')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              // 在按钮点击函数中构造一个crash场景，触发崩溃事件
              let result: object = JSON.parse('');
            })
          // [End AppEvent_Crash_Button]
          // [Start AppEvent_Click_ArkTS_Button]
          Button('writeEvent ArkTS')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              // 在按钮点击函数中进行事件打点，以记录按钮点击事件
              let eventParams: Record<string, number> = { 'clickTime': 100 };
              let eventInfo: hiAppEvent.AppEventInfo = {
                // 事件领域定义
                domain: 'button',
                // 事件名称定义
                name: 'click',
                // 事件类型定义
                eventType: hiAppEvent.EventType.BEHAVIOR,
                // 事件参数定义
                params: eventParams,
              };
              hiAppEvent.write(eventInfo).then(() => {
                hilog.info(0x0000, 'testTag', `AppEvents writeEvent ArkTS success`);
              }).catch((err: BusinessError) => {
                hilog.error(0x0000, 'testTag',
                  `AppEvents HiAppEvent err.code: ${err.code}, err.message: ${err.message}`);
              });
            })
          // [End AppEvent_Click_ArkTS_Button]
          // [Start JsError_CrashEvent_Button]
          Button('JsError')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              // 在按钮点击函数中构造一个crash场景，触发应用崩溃事件
              JSON.parse('');
            })
          // [End JsError_CrashEvent_Button]
          // [Start Native_CrashEvent_Button]
          Button('NativeCrash')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              // 在按钮点击函数中构造一个crash场景，触发应用崩溃事件
              testNapi.testNullptr();
            })
          // [End Native_CrashEvent_Button]
          // [Start Native_CrashEvent_Log]
          Button('MergeLogNativeCrash')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              // 模拟创建 applog，假设应用包名为 com.samples.eventsub
              let filePath: string = "/data/storage/el2/log/com.samples.eventsub_CppCrash_AppMerge.log";
              let file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
              let str: string = "only test for merge app log!";

              let writeLen = fileIo.writeSync(file.fd, str);
              console.info("hiappevent write data to file succeed and size is:" + writeLen);
              fileIo.closeSync(file);

              // 在按钮点击函数中构造一个crash场景，触发应用崩溃事件
              testNapi.testNullptr();
            })
          // [End Native_CrashEvent_Log]
          Button('ConfigCrashPolicy')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              this.configCrashPolicy();
            })
          // [Start PssLeakEventTS_Button]
          // [Start PssLeakEvent_Button]
          Button('pss leak')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              // 设置一个简单的资源泄漏场景
              hilog.info(0x0000, 'testTag', 'click pss leak button');
              testNapi.leakMB(3072);
            })
          // [End PssLeakEvent_Button]
          Button('js leak')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              for (let i = 0; i < 10000; i++) {
                this.leakedArray.push(new Array(500000).fill(1));
              }
            })
          // [End PssLeakEventTS_Button]
          // [Start AppKillEvent_Button]
          Button(this.message)
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              if (this.message != 'Leaking') {
                this.message = 'Leaking';
                hilog.info(0x0000, 'testTag', 'Start leaking');
                testNapi.leak();
              }
            })
          // [End AppKillEvent_Button]
          // [Start TimeOutEvent_Button]
          Button($r('app.string.TimeOut_Button'))
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              let t = Date.now();
              while (Date.now() - t <= 350) {
              }
            })
          // [End TimeOutEvent_Button]
        }
        .width('50%')

        Column() {
          // [Start AppEvent_CPP_Button]
          Button('writeEvent C++')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              testNapi.writeAppEvent();
            })
          // [End AppEvent_CPP_Button]
          // [Start FreezeEvent_Button]
          Button($r('app.string.Freeze_Button'))
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              setTimeout(() => {
                while (true) {
                }
              }, 1000)
            })
          // [End FreezeEvent_Button]
          // [Start AsanEvent_Button]
          Button('address-sanitizer')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              testNapi.addressSanitizerTest();
            })
          // [End AsanEvent_Button]
          // [Start hicollie_timer_ndk_Button]
          // 添加点击事件，触发TestHiCollieTimerNdk方法。
          Button('TestHiCollieTimerNdk')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              testNapi.TestHiCollieTimerNdk();
            })
          // [End hicollie_timer_ndk_Button]
          // [Start ArkWeb_Fling_Jank_ArkTs_Button]
          // 按钮跳转到易出现滑动丢帧的web场景，触发ArkWeb抛滑丢帧事件。
          Button('ArkWebFlingJank ArkTs')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'ArkWebPage' });
            })
          // [End ArkWeb_Fling_Jank_ArkTs_Button]
          // [Start hicollie_set_timer_Button]
          // 添加点击事件，触发HiCollieTestTimerNdk方法。
          Button('HiCollieTestTimerNdk')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              testNapi.HiCollieTestTimerNdk();
            })
          // [End hicollie_set_timer_Button]
          // [Start MainThreadJank_Button]
          // 添加点击事件，触发MAIN_THREAD_JANK。
          Button('timeOut350')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              let t = Date.now();
              while (Date.now() - t <= 350) {}
            })
          // [End MainThreadJank_Button]
          // [Start MainThreadJank_Set_Event_Config]
          Button("customSample", { stateEffect:true, type: ButtonType.Capsule})
            .width('75%')
            .height(50)
            .margin(15)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick(() => {
              // 在按钮点击函数中进行事件打点，以记录按钮点击事件
              let params: Record<string, hiAppEvent.ParamType> = {
                // 事件类型定义， 0-默认值，1-只采样栈 2-只收集trace
                "log_type": "1",
                // 超时时间 & 采样间隔
                "sample_interval": "100",
                // 忽略启动开始时间
                "ignore_startup_time": "11",
                // 采样次数
                "sample_count": "21",
                // 事件上报次数定义
                "report_times_per_app": "3"
              };
              hiAppEvent.setEventConfig(hiAppEvent.event.MAIN_THREAD_JANK, params).then(() => {
                hilog.info(0x0000, 'testTag', `HiAppEvent success to set event params.`)
              }).catch((err: BusinessError) => {
                hilog.error(0x0000, 'testTag', `HiAppEvent err.code: ${err.code}, err.message: ${err.message}`)
              });
            })
          // [End MainThreadJank_Set_Event_Config]
          // [Start MainThreadJank_Timeout_150_Button]
          // 添加点击事件，触发MAIN_THREAD_JANK。
          Button('timeOut150')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              let t = Date.now();
              while (Date.now() - t <= 150) {}
            })
          // [End MainThreadJank_Timeout_150_Button]
          // [Start MainThreadJank_Timeout_500_Button]
          // 添加点击事件，触发MAIN_THREAD_JANK。
          Button('timeOut500')
            .type(ButtonType.Capsule)
            .margin({
              top: 20
            })
            .backgroundColor('#0D9FFB')
            .width('80%')
            .height('5%')
            .onClick(() => {
              let t = Date.now();
              while (Date.now() - t <= 500) {}
            })
          // [End MainThreadJank_Timeout_500_Button]
        }
        .width('50%')
      }
      .height('100%')
    }
    .navDestination(this.PageMap)
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}