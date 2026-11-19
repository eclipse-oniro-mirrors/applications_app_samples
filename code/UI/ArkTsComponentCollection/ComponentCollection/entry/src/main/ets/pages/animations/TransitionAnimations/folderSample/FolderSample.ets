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
 * @file entry/src/main/ets/pages/animations/TransitionAnimations/folderSample/FolderSample.ets
 * 文件职责：FolderSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：FolderSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';
import Folder from './Folder';

/**
 * FolderSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct FolderSample {
  // @StorageProp windowHeight：与 AppStorage 单向绑定
  @StorageProp('windowHeight') windowHeight: number = 720;

  // @State isOpen：组件内部状态
  @State isOpen: boolean = false;

  // @State widthSize：组件内部状态
  @State widthSize: number = 80;

  // @State heightSize：组件内部状态
  @State heightSize: number = 80;

  // @State translateY：组件内部状态
  @State translateY: number = 0;

  /**
   * click：执行 click 相关逻辑。
   */
  click() {
    if (!this.isOpen) {
      this.widthSize = 280;
      this.heightSize = 280;
      this.translateY = this.windowHeight * 0.1;
    } else {
      this.widthSize = 80;
      this.heightSize = 80;
      this.translateY = 0;
    }
    animateTo({ duration: 500 }, () => {
      this.isOpen = !this.isOpen;
    });
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.Folder_expansion') }).id('folder_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：内边距、宽度、高度、backgroundImageSize
      Column() {
        // Folder：Folder 自定义组件
        // 关键属性：点击事件回调、click
        // 交互：可点击交互
        Folder({ isOpen: $isOpen })
          .id('folderComponent')
          .onClick(() => {
            this.click();
          })
          .width(this.widthSize)
          .height(this.heightSize)
          .translate({ y: this.translateY })
          .animation({
            duration: 500,
            curve: Curve.Linear,
            playMode: PlayMode.Normal
          })
      }.id('folder_sample_column_3')
      .padding(20)
      .width('100%')
      .height('100%')
      .backgroundImageSize({
        height: '100%'
      })
      .backgroundImage($r('app.media.img_test_2'))
      .backdropBlur(this.isOpen ? 10 : 0)
      .onClick(() => {
        if (this.isOpen) {
          this.click();
        }
      })
    }.id('folder_sample_column_1')
    .width('100%')
    .height('100%')
  }
}