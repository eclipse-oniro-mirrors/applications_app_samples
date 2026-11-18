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
 * @file casesfeature/calendarswitch/src/main/ets/customcalendar/model/OffscreenCanvas.ets
 * 文件职责：OffscreenCanvas 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：OffscreenCanvas。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * 离屏画布类
 */
export class OffscreenCanvas {
  public settings: RenderingContextSettings = new RenderingContextSettings(true);
  public context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  // OffscreenCanvasRenderingContext2D入参分别是离屏画布的宽度，离屏画布的高度，用来配置OffscreenCanvasRenderingContext2D对象的参数
  public offContext: OffscreenCanvasRenderingContext2D =
    new OffscreenCanvasRenderingContext2D(200, 200, this.settings);
  public year: number;
  public month: number;

  /** 构造 OffscreenCanvas 实例。 */
  constructor(year: number, month: number) {
    this.year = year;
    this.month = month;
  }
}