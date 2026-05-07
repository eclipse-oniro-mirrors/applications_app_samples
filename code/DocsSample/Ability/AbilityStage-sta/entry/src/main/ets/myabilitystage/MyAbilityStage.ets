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

// [Start myAbility_start]
import { AbilityStage, Configuration, AbilityConstant } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    console.info('AbilityStage onCreate');
  }

  onConfigurationUpdated(config: Configuration): void {
    console.info(`envCallback onConfigurationUpdated success: ${JSON.stringify(config)}`);
    let language = config.language; //应用程序的当前语言
    let colorMode = config.colorMode; //深浅色模式
    let direction = config.direction; //屏幕方向
    let fontSizeScale = config.fontSizeScale; //字体大小缩放比例
    let fontWeightScale = config.fontWeightScale; //字体粗细缩放比例
  }

  onMemoryLevel(level: AbilityConstant.MemoryLevel): void {
    console.info(`onMemoryLevel level: ${level}`);
  }

  onLaunchFromHyperSnap(): void {
    console.info('Launched from Hyper Snap, reinitializing resources...');
    // 在此添加从快照恢复时的初始化逻辑
  }

  onAboutToCreateAbility(): void {
    console.info('About to create first ability, preparing...');
    // 在此添加创建第一个Ability前的准备工作
  }

  onDestroy(): void {
    // 通过onDestroy()方法，可以监听到Ability的销毁事件。
    console.info('AbilityStage onDestroy');
  }
}
// [End myAbility_start]