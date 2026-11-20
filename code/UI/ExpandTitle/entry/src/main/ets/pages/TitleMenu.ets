/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/TitleMenu.ets
 * 文件职责：TitleMenu 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：titleMenu、TitleMenu。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { promptAction } from '@kit.ArkUI';

/**
 * titleMenu：函数定义，承载本文件对应的逻辑与数据。
 */
@Builder
export function titleMenu(): void {
  // TitleMenu：TitleMenu 自定义组件
  /**
   * TitleMenu：执行 TitleMenu 相关逻辑。
   */
  TitleMenu().id('title_menu_title_menu_1');
}

/**
 * 菜单栏
 *
 */
/**
 * TitleMenu：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
struct TitleMenu {
  // toast弹窗时长
  private toastDuration: number = 2000;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：高度
    Row() {
      // Image：图片
      // 关键属性：宽度、高度、点击事件回调、showToast
      // 交互：可点击交互
      Image($r('app.media.expanded_title_is_public_add'))
        .width($r('app.string.expanded_title_menu_pic_layout'))
        .height($r('app.string.expanded_title_menu_pic_layout'))
        .id('menuAddImage')
        .onClick(() => {
          promptAction.showToast({
            message: $r('app.string.expanded_title_toast_hint_message'),
            duration: this.toastDuration
          });
        })
      // Image：图片
      // 关键属性：宽度、高度、外边距、点击事件回调、showToast
      // 交互：可点击交互
      Image($r('app.media.expanded_title_ic_public_more'))
        .width($r('app.string.expanded_title_menu_pic_layout'))
        .height($r('app.string.expanded_title_menu_pic_layout'))
        .margin({ left: $r('app.string.expanded_title_layout_8') })
        .id('menuMoreImage')
        .onClick(() => {
          promptAction.showToast({
            message: $r('app.string.expanded_title_toast_hint_message'),
            duration: this.toastDuration
          });
        })
    }.id('title_menu_row_2')
    .height($r('app.string.expanded_title_layout_100_percent'))
  }
}