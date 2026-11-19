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
 * @file casesfeature/immersive/src/main/ets/dialog/ImmersiveDialog.ets
 * 文件职责：ImmersiveDialog 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ImmersiveDialog。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { window } from '@kit.ArkUI';
import { Comment } from '../components/Comment';

/**
 * 底部弹框沉浸式适配
 * 1、设置弹框尾部元素对导航条避让
 */
/**
 * ImmersiveDialog：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@CustomDialog
export struct ImmersiveDialog {
  customController: CustomDialogController;

  // @State bottomHeight：组件内部状态
  @State bottomHeight: number = 0;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear(): void {
    window.getLastWindow(getContext(), (err, data) => {
      const avoidAreaBottom = data.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
      this.bottomHeight = avoidAreaBottom.bottomRect.height;
    })
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Comment：Comment 自定义组件
    // 关键属性：高度、背景色
    // Comment：Comment 自定义组件
    // 关键属性：高度、背景色
    Comment({ close: () => {
      this.customController.close();
    }}).id('immersive_dialog_comment_1')
      .height('60%')
      .backgroundColor(Color.White)
  }
}