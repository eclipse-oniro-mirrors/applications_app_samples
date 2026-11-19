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
 * @file entry/src/main/ets/model/ScaleModel.ets
 * 文件职责：ScaleModel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ScaleModel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

// @Observed：可观察对象
/**
 * ScaleModel：类定义，承载本文件对应的逻辑与数据。
 */
// @Observed：可观察对象
/**
 * ScaleModel：类定义，承载本文件对应的逻辑与数据。
 */
@Observed
export class ScaleModel {
  /**
   * scaleValue: 本次缩放因子，用于控制图片的大小显示
   * lastValue：记录上次缩放完后的缩放因子
   * defaultMaxScaleValue：默认的最大放大值
   * defaultScaleValue：默认缩放值，1
   */
  // 本次缩放因子，用于控制图片的大小显示
  public scaleValue: number;

  // 记录上次缩放完后的缩放因子
  public lastValue: number;

  // 最大放大值
  public maxScaleValue: number;

  // 额外比例值
  public extraScaleValue: number;

  // 默认缩放值
  public readonly defaultScaleValue: number = 1;

  /** 构造 ScaleModel 实例。 */
  constructor(scaleValue: number = 1.0, lastValue: number = 1.0,
              maxScaleValue: number = 1.5, extraScaleValue: number = 0.2) {
    this.scaleValue = scaleValue;
    this.lastValue = lastValue;
    this.maxScaleValue = maxScaleValue;
    this.extraScaleValue = extraScaleValue;
  }

  /**
   * reset：执行 reset 相关逻辑。
   */
  reset(): void {
    this.scaleValue = this.defaultScaleValue;
    this.lastValue = this.scaleValue;
  }

  /**
   * stash：执行 stash 相关逻辑。
   */
  stash(): void {
    this.lastValue = this.scaleValue;
  }

  /**
   * toString：function toString() { [native code] }
   */
  toString(): string {
    return `[scaleValue: ${this.scaleValue} lastValue: ${this.lastValue}]`;
  }
}