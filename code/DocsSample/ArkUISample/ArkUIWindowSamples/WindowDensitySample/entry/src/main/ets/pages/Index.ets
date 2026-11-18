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

// [Start window_density_cross_screen_index]
// [Start window_density_query_density_info]
// Index.ets
// 示例应用的主页面
import { window } from '@kit.ArkUI';
// [StartExclude window_density_cross_screen_index]
// [StartExclude window_density_query_density_info]
import { router } from '@kit.ArkUI';
// [EndExclude window_density_cross_screen_index]
// [EndExclude window_density_query_density_info]

@Entry
@Component
struct Index {
  @State displayId: number = 0;
  @State systemDensity: number = 1.0;
  @State defaultDensity: number = 1.0;
  @State customDensity: number = 1.0;
  private mainWindow: window.Window | null = null;

  aboutToAppear(): void {
    let windowStage = AppStorage.get<window.WindowStage>('windowStage');
    if (!windowStage) {
      return;
    }
    this.mainWindow = windowStage.getMainWindowSync();
    // 查询初始的窗口所在屏幕ID和density信息
    this.queryDensityInfo();
    // [StartExclude window_density_query_density_info]
    try {
      // 监听窗口跨屏移动事件，窗口移动到新屏幕后重新查询density信息
      this.mainWindow.on('displayIdChange', (data: number) => {
        console.info('Window displayId changed, displayId=' + JSON.stringify(data));
        this.queryDensityInfo();
      });
      // 监听本窗口所处屏幕的系统显示大小缩放系数变化事件
      this.mainWindow.on('systemDensityChange', (data: number) => {
        console.info('System density changed, density=' + JSON.stringify(data));
        this.systemDensity = data;
      });
    } catch (exception) {
      console.error(`Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
    }
    // [EndExclude window_density_query_density_info]
  }

  // [StartExclude window_density_cross_screen_index]
  // [StartExclude window_density_query_density_info]
  onPageShow(): void {
    // 页面重新显示时刷新density信息，例如从设置策略页面返回后
    this.queryDensityInfo();
  }

  // [EndExclude window_density_cross_screen_index]
  // [EndExclude window_density_query_density_info]
  // [StartExclude window_density_query_density_info]
  aboutToDisappear(): void {
    // 两个off()分别捕获异常，其中一个注销失败不影响另一个执行
    try {
      this.mainWindow?.off('displayIdChange');
    } catch (exception) {
      console.error(`Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
    }
    try {
      this.mainWindow?.off('systemDensityChange');
    } catch (exception) {
      console.error(`Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
    }
  }

  // [EndExclude window_density_query_density_info]
  // 查询当前窗口所在屏幕的屏幕ID和density信息
  queryDensityInfo(): void {
    if (!this.mainWindow) {
      return;
    }
    try {
      this.displayId = this.mainWindow.getWindowProperties().displayId!;
      let densityInfo = this.mainWindow.getWindowDensityInfo();
      this.systemDensity = densityInfo.systemDensity;
      this.defaultDensity = densityInfo.defaultDensity;
      this.customDensity = densityInfo.customDensity;
    } catch (exception) {
      console.error(`Failed to obtain the window densityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
    }
  }

  build() {
    Column({ space: 20 }) {
      Text(`窗口所在屏幕ID：${this.displayId}`)
        .fontSize(20)
      Text(`系统显示大小缩放系数：${this.systemDensity}`)
        .fontSize(20)
      Text(`系统默认显示大小缩放系数：${this.defaultDensity}`)
        .fontSize(20)
      Text(`自定义显示大小缩放系数：${this.customDensity}`)
        .fontSize(20)
      // [StartExclude window_density_cross_screen_index]
      // [StartExclude window_density_query_density_info]
      Button('设置窗口Density跟随策略')
        .fontSize(16)
        .margin({ top: 8 })
        .onClick(() => {
          router.pushUrl({ url: 'pages/DensityStrategy' });
        })
      // [EndExclude window_density_cross_screen_index]
      // [EndExclude window_density_query_density_info]
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
// [End window_density_query_density_info]
// [End window_density_cross_screen_index]
