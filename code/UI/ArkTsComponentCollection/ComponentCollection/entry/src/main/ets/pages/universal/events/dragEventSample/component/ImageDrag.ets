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
 * @file entry/src/main/ets/pages/universal/events/dragEventSample/component/ImageDrag.ets
 * 文件职责：ImageDrag 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ImageDrag。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * ImageDrag：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ImageDrag {
  // @State visible：组件内部状态
  @State visible: boolean = true

  // 自定义拖拽过程中显示的内容
  @Builder pixelMapBuilder() {
    // Image：图片
    // 关键属性：宽度、aspectRatio
    Image($r('app.media.icon')).id('image_drag_image_1')
      .width(48)
      .aspectRatio(1)
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色、主轴对齐
    Column() {
      // Image：图片
      // 关键属性：宽度、aspectRatio、可见性、draggable、onDragStart
      Image($r('app.media.icon'))
        .id('image')
        .width(48)
        .aspectRatio(1)
        .visibility(this.visible ? Visibility.Visible : Visibility.Hidden)
        .draggable(true)
        .onDragStart(() => {
          this.visible = false
          return this.pixelMapBuilder
        })
        .onDragEnd(() => {
          this.visible = true
        })
    }.id('image_drag_column_2')
    .width(400)
    .height(80)
    .backgroundColor(0xF9CF93)
    .justifyContent(FlexAlign.Center)
  }
}