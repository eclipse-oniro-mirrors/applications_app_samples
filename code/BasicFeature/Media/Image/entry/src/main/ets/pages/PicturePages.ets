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
 * @file src/main/ets/pages/PicturePages.ets
 * 文件职责：PicturePages 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PicturePages。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { PictureOptions } from '@ohos/photomodify';

/**
 * PicturePages：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct PicturePages {
  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // PictureOptions：PictureOptions 自定义组件
      PictureOptions().id('picture_pages_picture_options_2');
    }.id('picture_pages_column_1')
  }
}