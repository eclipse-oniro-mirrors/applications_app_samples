/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/touchable/pages/SetTouchableAreas.ets
 * 文件职责：SetTouchableAreas 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SetTouchableAreas。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { window } from '@kit.ArkUI';
import logger from '../../utils/Logger';
import promptAction from '@ohos.promptAction';

/**
 * SetTouchableAreas：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SetTouchableAreas {
  private onButtonClick: Callback<string> = (msg: string) => {
    promptAction.showToast({
      message: `click ${msg}`,
      duration: 2000,
      bottom: 100
    })
  };

  /**
   * onPageShow：页面进入前台时回调。
   */
  onPageShow(): void {
    this.setTouchableAreas();
  }

  /**
   * onPageHide：页面退到后台时回调。
   */
  onPageHide(): void {
    this.clearTouchableAreas();
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：主轴对齐、交叉轴对齐、宽度、高度、背景色
    Column() {
      // Text：文本
      // 关键属性：宽度、高度、背景色、文本对齐、点击事件回调、onButtonClick
      // 交互：可点击交互
      Text($r("app.string.area1"))
        .width('100%')
        .height('25%')
        .backgroundColor($r("app.color.light_gray"))
        .textAlign(TextAlign.Center)
        .id('area1')
        .onClick(async () => this.onButtonClick(await getContext(this)
          .resourceManager
          .getStringValue($r("app.string.area1"))))
      // Text：文本
      // 关键属性：宽度、高度、背景色、文本对齐、点击事件回调、onButtonClick
      // 交互：可点击交互
      Text($r("app.string.area2"))
        .width('100%')
        .height('25%')
        .backgroundColor($r("app.color.blue"))
        .textAlign(TextAlign.Center)
        .id('area2')
        .onClick(async () => this.onButtonClick(await getContext(this)
          .resourceManager
          .getStringValue($r("app.string.area2"))))
      // Text：文本
      // 关键属性：宽度、高度、背景色、文本对齐、点击事件回调、onButtonClick
      // 交互：可点击交互
      Text($r("app.string.area3"))
        .width('100%')
        .height('25%')
        .backgroundColor($r("app.color.red"))
        .textAlign(TextAlign.Center)
        .id('area3')
        .onClick(async () => this.onButtonClick(await getContext(this)
          .resourceManager
          .getStringValue($r("app.string.area3"))))
      // Text：文本
      // 关键属性：宽度、高度、背景色、文本对齐、点击事件回调、onButtonClick
      // 交互：可点击交互
      Text($r("app.string.area4"))
        .width('100%')
        .height('25%')
        .backgroundColor($r("app.color.green"))
        .textAlign(TextAlign.Center)
        .id('area4')
        .onClick(async () => this.onButtonClick(await getContext(this)
          .resourceManager
          .getStringValue($r("app.string.area4"))))
    }.id('set_touchable_areas_column_1')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.light_gray'))
  }

  /**
   * clearTouchableAreas：执行 clearTouchableAreas 相关逻辑。
   */
  async clearTouchableAreas(): Promise<void> {
    const parentWindow: window.Window = await window.getLastWindow(getContext(this));
    try {
      await parentWindow.setTouchableAreas([]);
    } catch (e) {
      logger.error(`clearTouchableAreas error,Caused: ${JSON.stringify(e)}`);
    }
  }

  /**
   * setTouchableAreas：执行 setTouchableAreas 相关逻辑。
   */
  async setTouchableAreas(): Promise<void> {
    const parentWindow: window.Window = await window.getLastWindow(getContext(this));
    const windowWidth: window.WindowProperties = parentWindow.getWindowProperties();
    const rect: window.Rect = windowWidth.windowRect;
    try {
      await parentWindow.setTouchableAreas([
        { top: rect.top, left: rect.left, width: rect.width, height: rect.height / 4 },
        { top: rect.top + rect.height * 3 / 4, left: rect.left, width: rect.width, height: rect.height / 4 },
      ]);
    } catch (e) {
      logger.error(`setTouchableAreas error,Caused: ${JSON.stringify(e)}`);
    }
  }
}
