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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/folderSample/Folder.ets
 * 文件职责：Folder 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Folder。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import FolderItem from './FolderItem';

/**
 * Folder：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export default struct Folder {
  // @State images：组件内部状态
  @State images: Array<Resource> = new Array<Resource>($r('app.media.img_test_1'), $r('app.media.img_test_2'), $r('app.media.img_test_3'));

  // @Link isOpen：与父组件双向绑定的状态
  @Link isOpen: boolean;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // Grid：网格容器
      // 关键属性：columnsTemplate、rowsTemplate、行间距、内边距、圆角、背景色
      Grid() {
        ForEach(this.images, (image: Resource, i: number) => {
          ForEach(this.images, (image: Resource, index: number) => {
            // GridItem：网格项
            // 关键属性：function toString() { [native code] }
            GridItem() {
              // FolderItem：FolderItem 自定义组件
              FolderItem({ isOpen: $isOpen, img: image, name: `${(index + 1) + i * this.images.length}` })
                .id('folder_folder_item_4')
            }.id('folder_grid_item_3')
          }, (image: Resource, index: number) => index.toString())
        }, (image: Resource, index: number) => index.toString())
      }.id('folder_grid_2')
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      .rowsGap(this.isOpen ? 3 : 0)
      .rowsGap(this.isOpen ? 9 : 0)
      .padding(this.isOpen ? 12 : 6)
      .borderRadius(10)
      .backgroundColor('#99ffffff')
    }.id('folder_column_1')
  }
}