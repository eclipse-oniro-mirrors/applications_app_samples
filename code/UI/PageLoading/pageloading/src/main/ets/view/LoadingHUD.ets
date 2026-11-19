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
 * @file pageloading/src/main/ets/view/LoadingHUD.ets
 * 文件职责：LoadingHUD 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：LoadingHUD。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import lottie from '@ohos/lottie';

/**
 * HUD全称Heads-Up Display（抬头显示）
 */

/**
 * LoadingHUD：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct LoadingHUD {
  // @Link nowProgress：与父组件双向绑定的状态
  @Link nowProgress: number;
  private politeChickyController: CanvasRenderingContext2D =
    new CanvasRenderingContext2D(); // CanvasRenderingContext2D对象
  private politeChicky: string = 'pageLoading'; // 动画名称
  private politeChickyPath: string = 'common/lottie/pageLoading.json'; // hap包内动画资源文件路径，仅支持json格式
  private gradientColor: LinearGradient = new LinearGradient([{ color: Color.Yellow, offset: 0.5 },
    { color: Color.Orange, offset: 1.0 }])

  /**
   * 加载动画
   * @param autoplay 控制动画是否自动播放参数
   */
  initAnimation() {
    // TODO:知识点:lottie.loadAnimation将json数据生成动画
    lottie.loadAnimation({
      container: this.politeChickyController,
      renderer: 'canvas',
      loop: true,
      autoplay: true,
      name: this.politeChicky,
      path: this.politeChickyPath,
    })
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色、主轴对齐
    Column() {
      // Stack：层叠布局容器
      // 关键属性：高度
      Stack() {
        // Canvas：画布
        // 关键属性：宽度、高度、圆角、onReady
        Canvas(this.politeChickyController)
          .id('loadingCanvas')
          .width($r('app.integer.lottie_view_canvas_size'))
          .height($r('app.integer.lottie_view_canvas_size'))
          .borderRadius($r('app.string.page_loading_corner_radius_default_m'))
          .onReady(() => {
            // TODO:知识点:必须要Canvas组件初始化之后才能执行lottie.loadAnimation方法去加载动画。
            this.initAnimation();
          })
        // Row：水平布局容器
        // 关键属性：宽度、外边距、高度
        Row() {
          // Progress：进度条
          // 关键属性：样式、color
          Progress({ value: this.nowProgress, total: 100, type: ProgressType.Linear }).id('loading_hud_progress_3')
            .style({ strokeWidth: 10, enableSmoothEffect: true })
            .color(this.gradientColor)
        }.id('loading_hud_row_2')
        .width('60%')
        .margin({ top: $r('app.integer.lottie_view_canvas_height') })
      }.id('loading_hud_stack_1').height($r('app.integer.lottie_view_canvas_size'))

      // Text：文本
      // 关键属性：字号、字体颜色
      Text(`当前已加载${this.nowProgress}%`)
        .id('loadingProgressText')
        .fontSize($r('app.integer.page_loading_progress_font_size'))
        .fontColor(Color.White)
    }
    .id('loadingHUD')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_loading_progress_background'))
    .justifyContent(FlexAlign.Center)
  }
}