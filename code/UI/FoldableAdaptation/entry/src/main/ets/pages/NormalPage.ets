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
 * @file entry/src/main/ets/pages/NormalPage.ets
 * 文件职责：NormalPage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：NormalPage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * NormalPage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct NormalPage {
  private imageSrc: ResourceStr = '';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度
    // Column：垂直布局容器
    // 关键属性：高度、宽度
    Column() {
      // Text：文本
      Text($r('app.string.normal_page'))
        .id('NormalPageTitle')
      // Image：图片
      // 关键属性：宽度、高度
      // Image：图片
      // 关键属性：宽度、高度
      Image(this.imageSrc)
        .id('NormalPageImage')
        .width($r('app.string.size_percent_100'))
    }.id('normal_page_column_1').height($r('app.string.size_percent_100'))
    .width($r('app.string.size_percent_100'))
  }
}