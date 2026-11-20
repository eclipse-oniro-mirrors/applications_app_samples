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
 * @file entry/src/main/ets/model/RotateModel.ets
 * 文件职责：RotateModel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：RotateModel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

// 旋转信息
/**
 * RotateModel：类定义，承载本文件对应的逻辑与数据。
 */
// @Observed：可观察对象
/**
 * RotateModel：类定义，承载本文件对应的逻辑与数据。
 */
@Observed
export class RotateModel {
  // 当前旋转角度
  public currentRotate: number;

  // 最后的角度
  public lastRotate: number = 0;

  // 起步触发旋转的角度
  public startAngle:number = 20;

  /** 构造 RotateModel 实例。 */
  constructor(currentX: number = 0) {
    this.currentRotate = currentX;
  }

  // 重置
  /**
   * reset：执行 reset 相关逻辑。
   */
  reset(): void {
    this.currentRotate = 0;
    this.lastRotate = 0;
  }

  // 保存最后的数据
  /**
   * stash：执行 stash 相关逻辑。
   */
  stash(): void {
    // 一个完整的圆的角度是360度
    let angle = 360;
    this.lastRotate = this.currentRotate % angle;
  }

}