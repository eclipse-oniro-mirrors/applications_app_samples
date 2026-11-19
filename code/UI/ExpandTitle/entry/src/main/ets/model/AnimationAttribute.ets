/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/model/AnimationAttribute.ets
 * 文件职责：AnimationAttribute 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：AnimationAttribute。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * 动效属性
 *
 */
export class AnimationAttribute {
  // 标准标题栏高度
  private normalTitleHeightVar: number;

  // 扩展标题栏高度
  private expandTitleHeightVar: number;

  // 扩展后标题继续下拉阈值
  private continuePullThresholdVar: number;

  // 标题放缩系数
  private titleScaleVar: number;

  // 动画持续时间
  private animationDurationVar: number;

  /** 构造 AnimationAttribute 实例。 */
  constructor(normalTitleHeight: number, expandTitleHeight: number, continuePullThreshold: number,
    titleScale: number, animationDuration: number) {
    this.normalTitleHeightVar = normalTitleHeight;
    this.expandTitleHeightVar = expandTitleHeight;
    this.continuePullThresholdVar = continuePullThreshold;
    this.titleScaleVar = titleScale;
    this.animationDurationVar = animationDuration;
  }

  get normalTitleHeight(): number {
    return this.normalTitleHeightVar;
  }

  get expandTitleHeight(): number {
    return this.expandTitleHeightVar;
  }

  get continuePullThreshold(): number {
    return this.continuePullThresholdVar;
  }

  get titleScale(): number {
    return this.titleScaleVar;
  }

  get animationDuration(): number {
    return this.animationDurationVar;
  }
}