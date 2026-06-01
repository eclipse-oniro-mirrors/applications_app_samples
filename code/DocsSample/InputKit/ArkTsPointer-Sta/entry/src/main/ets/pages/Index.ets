'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
// 静态模式：使用 @ohos 静态接口替代 @kit 动态接口
import pointer from '@ohos.multimodalInput.pointer';
import window from '@ohos.window';
import hilog from '@ohos.hilog';
import { BusinessError, Callback, AsyncCallback } from '@ohos.base';

// 静态模式：显式导入 ArkUI 装饰器、组件和枚举
import { Entry, Component, Column, Text, RelativeContainer,
  WordBreak, FontWeight, TextAlign, HorizontalAlign } from '@ohos.arkui.component';

// 日志域标识，用于 hilog 日志系统标识输出域
const DOMAIN: int = 0x0000;
// 日志标签，用于筛选和识别日志来源
const TAG: string = 'Pointer';

@Entry
@Component
struct Index {
  // 隐藏鼠标光标
  // 使用 async/await 替代回调风格的 setPointerVisible(false, callback)
  async hidePointer(): Promise<void> {
    try {
      await pointer.setPointerVisible(false);
      hilog.info(DOMAIN, TAG, 'Set pointer visible success.');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      const errorCode: int = err.code;
      const errorMessage: string = err.message;
      hilog.error(DOMAIN, TAG, `The mouse pointer hide attributes is failed. code: %{public}d, message: %{public}s`,
        errorCode, errorMessage);
    }
  }

  // 显示鼠标光标
  // 使用 async/await 替代回调风格的 setPointerVisible(true, callback)
  async showPointer(): Promise<void> {
    try {
      await pointer.setPointerVisible(true);
      hilog.info(DOMAIN, TAG, 'Set pointer visible success.');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      const errorCode: int = err.code;
      const errorMessage: string = err.message;
      hilog.error(DOMAIN, TAG, `Set pointer visible failed. code: %{public}d, message: %{public}s`,
        errorCode, errorMessage);
    }
  }

  // 获取顶层窗口的 ID
  // 使用 async/await 替代回调风格的 window.getLastWindow(ctx, callback)
  async getTopWindowId(): Promise<int> {
    const ctx = this.getUIContext().getHostContext();
    if (ctx === undefined) {
      hilog.info(DOMAIN, TAG, 'Failed to get host context');
      return -1;
    }
    const windowClass: window.Window = await window.getLastWindow(ctx);
    const windowId: int = windowClass.getWindowProperties().id;
    if (windowId < 0) {
      hilog.info(DOMAIN, TAG, 'Invalid windowId');
      return -1;
    }
    return windowId;
  }

  // 设置鼠标光标样式为取色器样式
  // 使用 async/await 替代 Promise.then() 链式调用
  async setColorSuckerPointerStyle(): Promise<void> {
    try {
      const windowId: int = await this.getTopWindowId();
      if (windowId < 0) {
        return;
      }
      // 设置鼠标光标样式为取色器样式
      await pointer.setPointerStyle(windowId, pointer.PointerStyle.COLOR_SUCKER);
      hilog.info(DOMAIN, TAG, 'Successfully set mouse pointer style');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, `Failed to set the pointer style, code: %{public}d, message: %{public}s`,
        err.code, err.message);
    }
  }

  // 设置鼠标光标样式为默认样式
  // 使用 async/await 替代 Promise.then() 链式调用
  async setDefaultPointerStyle(): Promise<void> {
    try {
      const windowId: int = await this.getTopWindowId();
      if (windowId < 0) {
        return;
      }
      // 设置鼠标光标样式为默认样式
      await pointer.setPointerStyle(windowId, pointer.PointerStyle.DEFAULT);
      hilog.info(DOMAIN, TAG, 'Successfully set mouse pointer style');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, `Failed to set the pointer style, code: %{public}d, message: %{public}s`,
        err.code, err.message);
    }
  }

  build() {
    RelativeContainer() {
      Column() {
        // [Start pointer_visible]
        // 点击隐藏鼠标光标
        Text("Click to hide pointer")
          .onClick(() => {
            this.hidePointer();
          })
          // [StartExclude pointer_visible]
          .height('auto')
          .width('100%')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .fontColor('#0A59F7')
          .textAlign(TextAlign.Start)
          .margin({ top: 8, bottom: 8 })
          .lineHeight(20)
          .wordBreak(WordBreak.BREAK_ALL)
          .maxLines(2)
          .backgroundColor('#F7F9FC')
          .borderRadius(4)
          .padding(8)
        // [EndExclude pointer_visible]

        // 点击显示鼠标光标
        Text("Click to display pointer")
          .onClick(() => {
            this.showPointer();
          })
          // [StartExclude pointer_visible]
          .height('auto')
          .width('100%')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .fontColor('#0A59F7')
          .textAlign(TextAlign.Start)
          .margin({ top: 8, bottom: 8 })
          .lineHeight(20)
          .wordBreak(WordBreak.BREAK_ALL)
          .maxLines(2)
          .backgroundColor('#F7F9FC')
          .borderRadius(4)
          .padding(8)
        // [EndExclude pointer_visible]
        // [End pointer_visible]

        // [Start pointer_style]
        // 点击设置鼠标光标样式为取色器样式
        Text(`Click to set the mouse pointer style to the color picker style`)
          .onClick(() => {
            this.setColorSuckerPointerStyle();
          })
          // [StartExclude pointer_style]
          .height('auto')
          .width('100%')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .fontColor('#0A59F7')
          .textAlign(TextAlign.Start)
          .margin({ top: 8, bottom: 8 })
          .lineHeight(20)
          .wordBreak(WordBreak.BREAK_ALL)
          .maxLines(2)
          .backgroundColor('#F7F9FC')
          .borderRadius(4)
          .padding(8)
          .wordBreak(WordBreak.NORMAL)
        // [EndExclude pointer_style]

        // 点击设置鼠标光标样式为默认样式
        Text(`Click to set the mouse pointer style to default style`)
          .onClick(() => {
            this.setDefaultPointerStyle();
          })
          // [End pointer_style]
          .height('auto')
          .width('100%')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .fontColor('#0A59F7')
          .textAlign(TextAlign.Start)
          .margin({ top: 8, bottom: 8 })
          .lineHeight(20)
          .wordBreak(WordBreak.BREAK_ALL)
          .maxLines(2)
          .backgroundColor('#F7F9FC')
          .borderRadius(4)
          .padding(8)
          .wordBreak(WordBreak.NORMAL)
      }
      .height('100%')
      .width('80%')
      .alignItems(HorizontalAlign.Center)
      .position({ left: '10%', right: '10%' })
      .margin({ bottom: 200 })
    }
  }
}
