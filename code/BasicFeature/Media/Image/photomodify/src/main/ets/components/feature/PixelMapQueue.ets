/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file src/main/ets/components/feature/PixelMapQueue.ets
 * 文件职责：PixelMapQueue 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PixelMapQueue。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

export default class PixelMapQueue {
  private items: PixelMap[] = [];

  /** 构造 PixelMapQueue 实例。 */
  constructor() {
    this.items = [];
  }

  /**
   * push：执行 push 相关逻辑。
   */
  push(pm: PixelMap): void {
    this.items.push(pm);
  }

  /**
   * pop：执行 pop 相关逻辑。
   */
  pop(): PixelMap | undefined {
    return this.items.pop();
  }
}