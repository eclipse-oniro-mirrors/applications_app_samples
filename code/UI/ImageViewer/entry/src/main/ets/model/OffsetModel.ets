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
 * @file entry/src/main/ets/model/OffsetModel.ets
 * 文件职责：OffsetModel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：OffsetModel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

// @Observed：可观察对象
/**
 * OffsetModel：类定义，承载本文件对应的逻辑与数据。
 */
// @Observed：可观察对象
/**
 * OffsetModel：类定义，承载本文件对应的逻辑与数据。
 */
@Observed
export class OffsetModel {
  // 当前移动偏移量 X
  public currentX: number;

  // 当前移动偏移量 Y
  public currentY: number;

  // 最后的偏移量 X
  public lastX: number = 0;

  // 最后的偏移量 Y
  public lastY: number = 0;

  /** 构造 OffsetModel 实例。 */
  constructor(currentX: number = 0, currentY: number = 0) {
    this.currentX = currentX;
    this.currentY = currentY;
  }

  /**
   * reset：执行 reset 相关逻辑。
   */
  reset(): void {
    this.currentX = 0;
    this.currentY = 0;
    this.lastX = 0;
    this.lastY = 0;
  }

  /**
   * stash：执行 stash 相关逻辑。
   */
  stash(): void {
    this.lastX = this.currentX;
    this.lastY = this.currentY;
  }

  /**
   * toString：function toString() { [native code] }
   */
  toString(): string {
    return `[currentX: ${this.currentX} currentY: ${this.currentY} lastX: ${this.lastX} lastY: ${this.lastY}]`;
  }
}