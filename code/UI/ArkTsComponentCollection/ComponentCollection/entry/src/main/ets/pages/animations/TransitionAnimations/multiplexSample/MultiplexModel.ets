/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/multiplexSample/MultiplexModel.ets
 * 文件职责：MultiplexModel 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MultiplexModel。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

export class MultiplexModel {
  private id: string;
  private img: Resource;

  /** 构造 MultiplexModel 实例。 */
  constructor(id: string, img: Resource) {
    this.id = id;
    this.img = img;
  }

  /**
   * getId：执行 getId 相关逻辑。
   */
  getId():string {
    return this.id;
  }

  /**
   * getImg：执行 getImg 相关逻辑。
   */
  getImg():Resource {
    return this.img;
  }
}