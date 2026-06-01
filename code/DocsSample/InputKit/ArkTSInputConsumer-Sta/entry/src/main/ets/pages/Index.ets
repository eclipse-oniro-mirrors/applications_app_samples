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
import inputConsumer from '@ohos.multimodalInput.inputConsumer';
import { KeyEvent } from '@ohos.multimodalInput.keyEvent';
import { KeyCode } from '@ohos.multimodalInput.keyCode';
import hilog from '@ohos.hilog';
import { BusinessError, Callback } from '@ohos.base';

// 静态模式：显式导入 ArkUI 装饰器、组件和枚举
import { Entry, Component, Builder, Column, Row, Button, Text,
  FlexAlign } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

// 日志域标识，用于 hilog 日志系统标识输出域
const DOMAIN: int = 0x0000;
// 日志标签，用于筛选和识别日志来源
const TAG: string = 'InputConsumer';

@Entry
@Component
struct TestDemo14 {
  // 状态文本，用于在界面上显示按键监听状态信息
  @State text: string = "Default monitoring for Volume Up and Down keys has been added."
  // 音量上键按下事件的回调函数，初始化为空实现
  private volumeUpCallBackFunc: Callback<KeyEvent> = (): void => {
  }
  // 音量下键按下事件的回调函数，初始化为空实现
  private volumeDownCallBackFunc: Callback<KeyEvent> = (): void => {
  }
  // 音量上键消费配置：按下行为、不重复上报
  options1: inputConsumer.KeyPressedConfig = {
    key: KeyCode.KEYCODE_VOLUME_UP,
    action: 1,
    isRepeat: false,
  }
  // 音量下键消费配置：按下行为、不重复上报
  options2: inputConsumer.KeyPressedConfig = {
    key: KeyCode.KEYCODE_VOLUME_DOWN,
    action: 1,
    isRepeat: false,
  }

  // 组件即将出现时的生命周期回调
  // 注册音量上键和音量下键的监听事件
  aboutToAppear(): void {
    try {
      // 定义音量上键按下事件的回调函数
      this.volumeUpCallBackFunc = (event: KeyEvent): void => {
        this.getUIContext().getPromptAction().showToast({ message: 'Volume Up key pressed' });
      }

      // 定义音量下键按下事件的回调函数
      this.volumeDownCallBackFunc = (event: KeyEvent): void => {
        this.getUIContext().getPromptAction().showToast({ message: 'Volume Down key pressed' });
      }

      // 注册音量上键监听，静态接口使用 onKeyPressed 替代 on('keyPressed', ...)
      inputConsumer.onKeyPressed(this.options1, this.volumeUpCallBackFunc);
      // 注册音量下键监听
      inputConsumer.onKeyPressed(this.options2, this.volumeDownCallBackFunc);
    } catch (error) {
      // 使用 BusinessError 静态类型替代 JSON.stringify 动态序列化
      const err: BusinessError = error as BusinessError;
      const errorCode: int = err.code;
      const errorMessage: string = err.message;
      hilog.error(DOMAIN, TAG, `Subscribe execute failed, error code: %{public}d, message: %{public}s`,
        errorCode, errorMessage);
    }
  }

  // 组件即将销毁时取消按键监听，防止内存泄漏
  aboutToDisappear(): void {
    inputConsumer.offKeyPressed();
  }

  // 添加音量上键监听的点击事件处理
  // 使用 BusinessError 静态类型替代 JSON.stringify 动态序列化
  addVolumeUpMonitor(): void {
    try {
      inputConsumer.onKeyPressed(this.options1, this.volumeUpCallBackFunc);
      this.getUIContext().getPromptAction().showToast({ message: 'Successfully added monitoring for Volume Up key!' });
      this.text = "Monitoring for Volume Up key has been added.";
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      const errorCode: int = err.code;
      const errorMessage: string = err.message;
      hilog.error(DOMAIN, TAG, `Add volume up monitor failed, error code: %{public}d, message: %{public}s`,
        errorCode, errorMessage);
      this.getUIContext().getPromptAction().showToast({ message: 'Failed to add monitoring for Volume Up key!' });
      this.text = `Failed to add monitoring for Volume Up key: code ${errorCode}, ${errorMessage}`;
    }
  }

  // 移除音量上键监听的点击事件处理
  removeVolumeUpMonitor(): void {
    try {
      inputConsumer.offKeyPressed();
      this.getUIContext().getPromptAction().showToast({ message: 'Successfully removed monitoring for Volume Up key!' });
      this.text = "Monitoring for Volume Up key has been removed.";
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      const errorCode: int = err.code;
      const errorMessage: string = err.message;
      hilog.error(DOMAIN, TAG, `Remove volume up monitor failed, error code: %{public}d, message: %{public}s`,
        errorCode, errorMessage);
      this.getUIContext().getPromptAction().showToast({ message: 'Failed to remove monitoring for Volume Up key!' });
      this.text = `Failed to remove monitoring for Volume Up key: code ${errorCode}, ${errorMessage}`;
    }
  }

  // 添加音量下键监听的点击事件处理
  addVolumeDownMonitor(): void {
    try {
      inputConsumer.onKeyPressed(this.options2, this.volumeDownCallBackFunc);
      this.getUIContext().getPromptAction().showToast({ message: 'Successfully added monitoring for Volume Down key!' });
      this.text = "Monitoring for Volume Down key has been added.";
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      const errorCode: int = err.code;
      const errorMessage: string = err.message;
      hilog.error(DOMAIN, TAG, `Add volume down monitor failed, error code: %{public}d, message: %{public}s`,
        errorCode, errorMessage);
      this.getUIContext().getPromptAction().showToast({ message: 'Failed to add monitoring for Volume Down key!' });
      this.text = `Failed to add monitoring for Volume Down key: code ${errorCode}, ${errorMessage}`;
    }
  }

  // 移除音量下键监听的点击事件处理
  removeVolumeDownMonitor(): void {
    try {
      inputConsumer.offKeyPressed();
      this.getUIContext().getPromptAction().showToast({ message: 'Successfully removed monitoring for Volume Down key!' });
      this.text = "Monitoring for Volume Down key has been removed.";
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      const errorCode: int = err.code;
      const errorMessage: string = err.message;
      hilog.error(DOMAIN, TAG, `Remove volume down monitor failed, error code: %{public}d, message: %{public}s`,
        errorCode, errorMessage);
      this.getUIContext().getPromptAction().showToast({ message: 'Failed to remove monitoring for Volume Down key!' });
      this.text = `Failed to remove monitoring for Volume Down key: code ${errorCode}, ${errorMessage}`;
    }
  }

  build() {
    Column() {
      // 添加音量上键监听按钮
      Row() {
        Button('Add monitoring for Volume Up key')
          .onClick(() => {
            this.addVolumeUpMonitor();
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 20, bottom: 50 })

      // 移除音量上键监听按钮
      Row() {
        Button('Remove monitoring for Volume Up key')
          .onClick(() => {
            this.removeVolumeUpMonitor();
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 20, bottom: 50 })

      // 添加音量下键监听按钮
      Row() {
        Button('Add monitoring for Volume Down key')
          .onClick(() => {
            this.addVolumeDownMonitor();
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 20, bottom: 50 })

      // 移除音量下键监听按钮
      Row() {
        Button('Remove monitoring for Volume Down key')
          .onClick(() => {
            this.removeVolumeDownMonitor();
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 20, bottom: 50 })

      // 状态文本展示区域
      Row() {
        Text(this.text)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
