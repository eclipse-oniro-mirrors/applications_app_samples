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

// [Start print_native_ts_init]
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import { Context } from '@kit.AbilityKit';

class HiLog {
  static info(...args: string[]): void {
    hilog.info(0x0, 'print c/c++ ', '%{public}s', `${args.join(' ')}`);
  }
}
// [End print_native_ts_init]

@Entry
@Component
struct Index {
  // [Start print_native_ts_lifecycle]
  // 页面展示到屏幕时，初始化打印服务
  aboutToAppear(): void {
    testNapi.nativeInit();
  }
  // 页面离开屏幕时
  aboutToDisappear(): void {
    testNapi.nativeRelease();
  }
  // [End print_native_ts_lifecycle]
  build() {
    Row() {
      Column() {
        // [Start print_native_ts_startprint]
        Button('OH_Print_StartPrintByNative')
          .onClick(() => {
            HiLog.info("OH_Print_StartPrintByNative onClick");
            let ctx: Context | undefined = this.getUIContext().getHostContext();
            let ret: boolean = testNapi.nativeStartPrintByNative(ctx);
            HiLog.info(`nativeStartPrintByNative ret: ${JSON.stringify(ret)}`);
          })
        // [End print_native_ts_startprint]
        // [Start print_native_ts_startjob]
        Button('OH_Print_StartPrintJob')
          .onClick(() => {
            HiLog.info('OH_Print_StartPrintJob onClick');
            let ret: boolean = testNapi.nativeStartPrintJob();
            HiLog.info(`OH_Print_StartPrintJob ret: ${JSON.stringify(ret)}`);
          })
        // [End print_native_ts_startjob]
      }
      .width('100%')
    }
    .height('100%')
  }
}
