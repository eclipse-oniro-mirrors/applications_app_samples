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
// [Start MainThreadJankConfig_Header]
// [Start AppfreezeConfig_Header]
import { BusinessError } from '@kit.BasicServicesKit';
// [Start PssLeakEvent_Header]
// [Start MainThreadJankEvent_Header]
import { hiAppEvent, hilog } from '@kit.PerformanceAnalysisKit';
// [End MainThreadJankEvent_Header]
// [End EventSub_Header]
// [End CrashConfig_Policy_Header]
// [End MainThreadJankConfig_Header]
// [End AppfreezeConfig_Header]
// [Start EventSub_Index_Capi_Header]
import testNapi from 'libentry.so';
// [End EventSub_Index_Capi_Header]
// [End PssLeakEvent_Header]
// [Start ArkWeb_Fling_Jank_Header]
import { ArkWebPage } from './ArkWebPage';
// [End ArkWeb_Fling_Jank_Header]
@Entry
@Component
struct Index {
  @State leakedArray: string[][] = [];
  // [Start AppKillEvent_ArkTS_State]
  @State message: string = 'Start To Leak';
  // [End AppKillEvent_ArkTS_State]

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
        collectMinidump: true, // native崩溃场景，使能minidump。从API版本26.0.0开始支持该参数
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

  SetAppfreezeConfig() {
    // [Start SetAppfreeze_Config]
    let policy: hiAppEvent.EventPolicy = {
        'appFreezePolicy' : {
            'pageSwitchLogEnable': true // 启用页面切换日志
        }
    };
    hiAppEvent.configEventPolicy(policy).then(() => {
        hilog.info(0x0000, 'testTag', `Set appfreeze config policy successfully.`);
    }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'testTag', `Failed to set appfreeze config policy. code: ${err.code}, message: ${err.message}`);
    });
    // [End SetAppfreeze_Config]
  }

  SetMainThreadConfigType0() {
    // [Start SetMainThreadJank_Type0_Config]
    let params: Record<string, hiAppEvent.ParamType> = {
      'log_type': '0'
    };
    hiAppEvent.setEventConfig(hiAppEvent.event.MAIN_THREAD_JANK, params).then(() => {
      hilog.info(0x0000, 'hiAppEvent', `Setting default value successfully.`);
    }).catch((err: BusinessError) => {
      hilog.error(0x0000, 'hiAppEvent', `Failed to set default value. Code: ${err.code}, message: ${err.message}`);
    });
    // [End SetMainThreadJank_Type0_Config]
  }

  SetMainThreadConfigType1() {
    // [Start SetMainThreadJank_Type1_Config]
    let params: Record<string, hiAppEvent.ParamType> = {
      'log_type': '1',
      'sample_interval': '100',
      'ignore_startup_time': '11',
      'sample_count': '21',
      'report_times_per_app': '3'
    };
    hiAppEvent.setEventConfig(hiAppEvent.event.MAIN_THREAD_JANK, params).then(() => {
      hilog.info(0x0000, 'hiAppEvent', `Successfully set sampling stack parameters.`);
    }).catch((err: BusinessError) => {
      hilog.error(0x0000, 'hiAppEvent', `Failed to set sample stack value. Code: ${err.code}, message: ${err.message}`);
    });
    // [End SetMainThreadJank_Type1_Config]
  }

  SetMainThreadConfigType2() {
    // [Start SetMainThreadJank_Type2_Config]
    let params: Record<string, hiAppEvent.ParamType> = {
      'log_type': '2'
    };
    hiAppEvent.setEventConfig(hiAppEvent.event.MAIN_THREAD_JANK, params).then(() => {
      hilog.info(0x0000, 'hiAppEvent', `Set to only collect trace successfully.`);
    }).catch((err: BusinessError) => {
      hilog.error(0x0000, 'hiAppEvent', `Failed to set only collect trace. Code: ${err.code}, message: ${err.message}`);
    });
    // [End SetMainThreadJank_Type2_Config]
  }

  MainThreadPolicyType0() {
    // [Start MainThreadJank_Type0_Policy]
    let policy: hiAppEvent.EventPolicy = {
      'mainThreadJankPolicy' : {
        'logType': 0, // 采集日志类型
        'autoStopSampling': true // 超时结束，停止采集堆栈
      }
    };
    hiAppEvent.configEventPolicy(policy).then(() => {
      hilog.info(0x0000, 'hiAppEvent', `Setting default value successfully.`);
    }).catch((err: BusinessError) => {
      hilog.error(0x0000, 'hiAppEvent', `Failed to set default value. Code: ${err.code}, message: ${err.message}`);
    });
    // [End MainThreadJank_Type0_Policy]
  }

  MainThreadPolicyType1() {
    // [Start MainThreadJank_Type1_Policy]
    let policy: hiAppEvent.EventPolicy = {
      'mainThreadJankPolicy' : {
        'logType': 1, // 采集日志类型
        'sampleInterval': 70, // 触发检测的阈值，采集堆栈间隔
        'ignoreStartupTime': 11, // 应用启动期间忽略主线程超时检测的时间
        'sampleCount': 20, // 主线程超时采样次数
        'reportTimesPerApp': 3, // 主线程超时采样上报次数
        'autoStopSampling': true // 超时结束，停止采集堆栈
      }
    };
    hiAppEvent.configEventPolicy(policy).then(() => {
      hilog.info(0x0000, 'hiAppEvent', `Successfully set sampling stack parameters.`);
    }).catch((err: BusinessError) => {
      hilog.error(0x0000, 'hiAppEvent', `Failed to set sample stack value. Code: ${err.code}, message: ${err.message}`);
    });
    // [End MainThreadJank_Type1_Policy]
  }

  MainThreadPolicyType2() {
    // [Start MainThreadJank_Type2_Policy]
    let policy: hiAppEvent.EventPolicy = {
      'mainThreadJankPolicy' : {
        'logType': 2 // 采集日志类型
      }
    };
    hiAppEvent.configEventPolicy(policy).then(() => {
      hilog.info(0x0000, 'hiAppEvent', `Set to only collect trace successfully.`);
    }).catch((err: BusinessError) => {
      hilog.error(0x0000, 'hiAppEvent', `Failed to set only collect trace. Code: ${err.code}, message: ${err.message}`);
    });
    // [End MainThreadJank_Type2_Policy]
  }

  build() {
    Navigation(this.navPathStack) {
      Scroll() {
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
                  'log_type': '1',
                  // 超时时间 & 采样间隔
                  'sample_interval': '100',
                  // 忽略启动开始时间
                  'ignore_startup_time': '11',
                  // 采样次数
                  'sample_count': '21',
                  // 事件上报次数定义
                  'report_times_per_app': '3'
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
            // [Start AppfreezeEvent_Button]
            Button('AppFreeze')
              .type(ButtonType.Capsule)
              .margin({
                top: 20
              })
              .backgroundColor('#0D9FFB')
              .width('80%')
              .height('5%')
              .onClick(() => {
                // 在按钮点击函数中构造一个freeze场景，触发应用冻屏事件
                setTimeout(() => {
                  let t = Date.now();
                  while (Date.now() - t <= 15000) {}
                }, 5000);
              })
            // [End AppfreezeEvent_Button]
            Button('SetAppfreezeConfig')
              .type(ButtonType.Capsule)
              .margin({
                top: 20
              })
              .backgroundColor('#0D9FFB')
              .width('80%')
              .height('5%')
              .onClick(() => {
                this.SetAppfreezeConfig();
              })
            // [Start AppFreezeWarning_Button]
            Button("appFreezeWarning")
              .type(ButtonType.Capsule)
              .margin({
                top: 20
              })
              .backgroundColor('#0D9FFB')
              .width('80%')
              .height('5%')
              .onClick(() => {
                // 在按钮点击函数中构造一个appFreezeWarning场景，触发应用冻屏告警事件
                const t = Date.now();
                while (Date.now() - t <= 6500) {}
              })
            // [End AppFreezeWarning_Button]
            Button('SetMainThreadConfig_Type_0')
              .type(ButtonType.Capsule)
              .margin({
                top: 20
              })
              .backgroundColor('#0D9FFB')
              .width('80%')
              .height('5%')
              .onClick(() => {
                this.SetMainThreadConfigType0();
              })
            Button('SetMainThreadConfig_Type_1')
              .type(ButtonType.Capsule)
              .margin({
                top: 20
              })
              .backgroundColor('#0D9FFB')
              .width('80%')
              .height('5%')
              .onClick(() => {
                this.SetMainThreadConfigType1();
              })
            Button('SetMainThreadConfig_Type_2')
              .type(ButtonType.Capsule)
              .margin({
                top: 20
              })
              .backgroundColor('#0D9FFB')
              .width('80%')
              .height('5%')
              .onClick(() => {
                this.SetMainThreadConfigType2();
              })
            Button('MainThreadPolicy_Type_0')
              .type(ButtonType.Capsule)
              .margin({
                top: 20
              })
              .backgroundColor('#0D9FFB')
              .width('80%')
              .height('5%')
              .onClick(() => {
                this.MainThreadPolicyType0();
              })
            Button('MainThreadPolicy_Type_1')
              .type(ButtonType.Capsule)
              .margin({
                top: 20
              })
              .backgroundColor('#0D9FFB')
              .width('80%')
              .height('5%')
              .onClick(() => {
                this.MainThreadPolicyType1();
              })
            Button('MainThreadPolicy_Type_2')
              .type(ButtonType.Capsule)
              .margin({
                top: 20
              })
              .backgroundColor('#0D9FFB')
              .width('80%')
              .height('5%')
              .onClick(() => {
                this.MainThreadPolicyType2();
              })
          }
          .width('50%')
        }
      }
      .scrollBar(BarState.Auto)
      .width('100%')
      .height('100%')
    }
    .navDestination(this.PageMap)
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}