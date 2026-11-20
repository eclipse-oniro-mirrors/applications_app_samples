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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/folderSample/FolderItem.ets
 * 文件职责：FolderItem 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：FolderItem。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import prompt from '@system.prompt';

/**
 * FolderItem：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export default struct FolderItem {
  // @Link isOpen：与父组件双向绑定的状态
  @Link isOpen: boolean;
  private img: Resource | null = null;
  private name: string | null = null;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Stack：层叠布局容器
    Stack() {
      if (!this.isOpen) {
        // Image：图片
        // 关键属性：宽度、高度、圆角、geometryTransition、转场动画
        Image(this.img).id('folder_item_image_2')
          .width('80%')
          .height('80%')
          .borderRadius(3)
          .geometryTransition(`shareIcon${this.name}`)
          .transition({ type: TransitionType.All, opacity: 0 })
      }

      if (this.isOpen) {
        // Column：垂直布局容器
        // 关键属性：点击事件回调、showToast
        // 交互：可点击交互
        Column() {
          // Image：图片
          // 关键属性：宽度、高度、圆角
          Image(this.img).id('folder_item_image_4')
            .width('80%')
            .height('80%')
            .borderRadius(10)
          // Text：文本
          // 关键属性：外边距
          Text(`APP ${this.name}`).id('folder_item_text_5')
            .margin({ top: 3 })
        }.id('folder_item_column_3')
        .onClick(() => {
          prompt.showToast({
            message: `click APP ${this.name}`,
            duration: 1000,
          });
        })
        .geometryTransition(`shareIcon${this.name}`)
        .transition({ type: TransitionType.All, opacity: 0 })
      }
    }.id('folder_item_stack_1')
  }
}