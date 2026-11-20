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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/floatingSample/FloatingWindowComponent.ets
 * 文件职责：FloatingWindowComponent 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：FloatingWindowComponent。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * FloatingWindowComponent：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export default struct FloatingWindowComponent {
  private res: Resource = $r('app.media.ic_call_green');
  private tips?: Resource = $r('app.string.Tips_call');

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色、圆角、阴影、主轴对齐
    Column() {
      // Image：图片
      // 关键属性：objectFit、宽度、高度
      Image(this.res).id('floating_window_component_image_2')
        .objectFit(ImageFit.Contain)
        .width('40%')
        .height('40%')

      // Text：文本
      // 关键属性：字号、字体颜色、字重、字体
      Text(this.tips).id('floating_window_component_text_3')
        .fontSize(12)
        .fontColor($r('app.color.background_green'))
        .fontWeight(FontWeight.Regular)
        .fontFamily($r('app.string.Font_family_regular'))
    }.id('floating_window_component_column_1')
    .width(80)
    .height(80)
    .backgroundColor($r('app.color.white'))
    .borderRadius(16)
    .shadow({ radius: 15, color: $r('app.color.btn_border_color') })
    .justifyContent(FlexAlign.SpaceAround)
  }
}