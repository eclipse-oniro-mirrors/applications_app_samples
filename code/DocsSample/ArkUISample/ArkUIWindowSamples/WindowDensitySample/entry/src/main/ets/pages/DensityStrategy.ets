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

// [Start window_density_set_density_strategy]
// DensityStrategy.ets
// 示例应用的Density跟随策略设置页面
import { window } from '@kit.ArkUI';
// [StartExclude window_density_set_density_strategy]
import { router } from '@kit.ArkUI';
// [EndExclude window_density_set_density_strategy]

@Entry
@Component
struct DensityStrategy {
  @State isDefaultDensityEnabled: boolean = false;
  @State strategyText: string = '当前density跟随策略：系统density策略';

  // 通过开关切换默认density策略：开启后窗口使用所在屏幕的系统默认显示大小缩放系数，不跟随用户设置的显示大小变化重新布局
  private updateDefaultDensityEnabled(value: boolean): void {
    let windowStage = AppStorage.get<window.WindowStage>('windowStage');
    if (!windowStage) {
      return;
    }
    try {
      windowStage.setDefaultDensityEnabled(value);
      console.info('Succeeded in setting default density enabled.');
    } catch (exception) {
      console.error(`Failed to set default density enabled. Cause code: ${exception.code}, message: ${exception.message}`);
    }
    this.strategyText = value ? '当前density跟随策略：默认density策略' : '当前density跟随策略：系统density策略';
  }

  // 设置自定义density策略：窗口使用固定的自定义显示大小缩放系数，跨屏移动后保持不变
  private setCustomDensityStrategy(): void {
    let windowStage = AppStorage.get<window.WindowStage>('windowStage');
    if (!windowStage) {
      return;
    }
    // 例如应用内将界面缩放设置为2.0倍
    windowStage.setCustomDensity(2.0);
    // 传入-1.0表示窗口使用系统显示大小缩放系数
    // windowStage.setCustomDensity(-1.0);
    // 从API version 20开始，支持设置已创建的子窗和系统窗口立即跟随主窗重新布局
    // windowStage.setCustomDensity(2.0, true);
    this.isDefaultDensityEnabled = false;
    this.strategyText = '当前density跟随策略：自定义density策略（2.0）';
  }

  build() {
    Column({ space: 20 }) {
      Text(this.strategyText)
        .id('strategyText')
        .fontSize(16)
        .fontColor(Color.Gray)
      Row({ space: 8 }) {
        Text('默认density策略')
          .fontSize(16)
        Toggle({ type: ToggleType.Switch, isOn: this.isDefaultDensityEnabled })
          .id('defaultDensitySwitch')
          .onChange((value: boolean) => {
            this.isDefaultDensityEnabled = value;
            this.updateDefaultDensityEnabled(value);
          })
      }
      Button('自定义density策略(2.0)')
        .id('customDensityButton')
        .fontSize(16)
        .width('80%')
        .margin({ top: 8 })
        .onClick(() => {
          this.setCustomDensityStrategy();
        })
      // [StartExclude window_density_set_density_strategy]
      Button('返回主页面')
        .fontSize(16)
        .margin({ top: 8 })
        .onClick(() => {
          router.back();
        })
      // [EndExclude window_density_set_density_strategy]
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
// [End window_density_set_density_strategy]
