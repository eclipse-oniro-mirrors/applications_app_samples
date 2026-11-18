/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/canvasAndGraphicDrawing/canvasSample/CanvasSample.ets
 * 文件职责：CanvasSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CanvasSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';

@Extend(Column) function cardStyle() {
  .backgroundColor($r('app.color.white'))
  .borderRadius(16)
  .width('100%')
  .padding(12)
}

/**
 * CanvasSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct CanvasSample {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色、高度
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.canvas_title') }).id('canvas_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：内边距
      Column() {
        // Column：垂直布局容器
        // 关键属性：cardStyle、高度、内边距
        Column() {
          // Canvas：画布
          // 关键属性：背景色、onReady、fillRect
          Canvas(this.context).id('canvas_sample_canvas_5')
            .backgroundColor('#ff9750d6')
            .onReady(() => {
              this.context.fillRect(40, 30, 100, 100)
            })
            .onAppear(() => {
              this.context.fillStyle = '#fc57cbcb'
              this.context.lineWidth = 50
              this.context.strokeStyle = '#ff00ff'
            })
            .size({ width: 300, height: 200 })
        }.id('canvas_sample_column_4').cardStyle()
        .height('35%')
      }.id('canvas_sample_column_3').padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
    }.id('canvas_sample_column_1')
    .backgroundColor($r('app.color.background_light_gray'))
    .height('100%')
  }
}