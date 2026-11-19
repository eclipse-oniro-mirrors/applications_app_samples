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

/**
 * @file entry/src/main/ets/utils/Managers.ets
 * 文件职责：Managers 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：WindowSizeManager。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { display, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

/**
 * WindowSizeManager：类定义，承载本文件对应的逻辑与数据。
 */
class WindowSizeManager {
  private size: window.Size = { width: 0, height: 0 };

  /** 构造 Managers 实例。 */
  constructor() {
    // 模块在无窗口上下文（如测试进程）首次加载时 getLastWindow 可能失败，先以屏幕尺寸兜底，避免尺寸始终为 0
    try {
      const defaultDisplay: display.Display = display.getDefaultDisplaySync();
      this.size.width = px2vp(defaultDisplay.width);
      this.size.height = px2vp(defaultDisplay.height);
    } catch (error) {
      console.error(`[windowWidth]getDefaultDisplay failed: ${JSON.stringify(error)}`);
    }
    window.getLastWindow(getContext()).then((value: window.Window) => {
      const rect: window.Rect = value.getWindowProperties().windowRect;
      this.size.width = px2vp(rect.width);
      this.size.height = px2vp(rect.height);
      console.log(`[windowWidth]${this.size.width} [windowHeight]${this.size.height}`);
    }).catch((error: BusinessError) => {
      console.error(`[windowWidth]getLastWindow failed: ${error.code} ${error.message}`);
    })
  }

  /**
   * get：执行 get 相关逻辑。
   */
  get(): window.Size {
    return this.size;
  }
}

export const windowSizeManager: WindowSizeManager = new WindowSizeManager();