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
import inputDevice from '@ohos.multimodalInput.inputDevice';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

// 静态模式：显式导入 ArkUI 装饰器、组件和枚举
import { Entry, Component, Builder, Column, Text, RelativeContainer,
  WordBreak, FontWeight, TextAlign, HorizontalAlign } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

// 日志域标识，用于 hilog 日志系统标识输出域
const DOMAIN: int = 0x0000;
// 日志标签，用于筛选和识别日志来源
const TAG: string = 'InputDevice';

@Entry
@Component
struct Index {
  // 物理键盘是否已连接的状态标志，用于驱动 UI 刷新
  @State isPhysicalKeyboardExist: boolean = false;
  // 提示信息文本，展示操作结果给用户
  @State message: string = "Click to obtain the device list and monitor device hot-plug events";
  // 存储已连接的物理键盘设备 ID 与键盘类型的映射关系
  // key: 设备ID (int), value: 键盘类型 (KeyboardType)
  keyboards: Map<int, inputDevice.KeyboardType> = new Map<int, inputDevice.KeyboardType>();

  // [StartExclude input_device]
  // 结果展示区域构建器
  // 显示当前物理键盘的连接状态，状态变化时自动刷新 UI
  @Builder
  ResultDisplay() {
    Column() {
      Text(`The current physical keyboard connection status is: ${this.isPhysicalKeyboardExist}`)
        .fontSize(14)
        .width('100%')
        .wordBreak(WordBreak.NORMAL)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .padding(12)
    }
    .width('100%')
    .backgroundColor('#F5F5F5')
    .borderRadius(8)
    .margin({ top: 20, bottom: 20 })
    .padding(0)
  }

  // 组件即将销毁时的生命周期回调
  // 取消设备变化事件监听，防止回调悬挂导致内存泄漏
  aboutToDisappear(): void {
    inputDevice.offChange();
  }

  // [EndExclude  input_device]

  // 查询当前所有输入设备，筛选出已连接的字母键盘（物理键盘）
  // 使用 async/await 替代 Promise.then() 链式调用，使异步流程结构清晰、可读性强
  async checkExistingKeyboards(): Promise<void> {
    // 获取所有输入设备的 ID 列表，静态接口返回 Array<int>
    const deviceList: int[] = await inputDevice.getDeviceList();
    // 遍历每个设备，检查其键盘类型
    for (let i = 0; i < deviceList.length; i++) {
      const deviceId: int = deviceList[i];
      const keyboardType: inputDevice.KeyboardType = await inputDevice.getKeyboardType(deviceId);
      // 判断是否为字母键盘（即物理键盘）
      if (keyboardType === inputDevice.KeyboardType.ALPHABETIC_KEYBOARD) {
        // 发现已连接的物理键盘，更新连接状态并记录设备信息
        this.isPhysicalKeyboardExist = true;
        this.keyboards.set(deviceId, keyboardType);
      }
    }
  }

  // 处理单个设备的热插拔变化事件
  // @param data - 设备变化事件数据（DeviceListener），包含设备 ID 和变化类型（add/remove）
  // 使用 async/await 替代嵌套的 Promise.then() 调用
  async handleDeviceChange(data: inputDevice.DeviceListener): Promise<void> {
    const deviceId: int = data.deviceId;
    const changeType: inputDevice.ChangedType = data.type;

    // 记录设备变化事件日志
    hilog.info(DOMAIN, TAG, `Device event info: %{public}s`, JSON.stringify(data));

    // 获取变化设备的键盘类型
    const keyboardType: inputDevice.KeyboardType = await inputDevice.getKeyboardType(deviceId);
    hilog.info(DOMAIN, TAG, 'The keyboard type is: %{public}d', keyboardType);

    // 处理设备插入事件：物理键盘插入时更新状态
    if (keyboardType === inputDevice.KeyboardType.ALPHABETIC_KEYBOARD && changeType === 'add') {
      this.isPhysicalKeyboardExist = true;
      this.keyboards.set(deviceId, keyboardType);
    }

    // 处理设备拔出事件：已知物理键盘拔出时清除状态
    if (this.keyboards.get(deviceId) === inputDevice.KeyboardType.ALPHABETIC_KEYBOARD &&
      changeType === 'remove') {
      this.isPhysicalKeyboardExist = false;
      this.keyboards.delete(deviceId);
    }
  }

  // 注册设备热插拔监听器
  // 当有输入设备发生变化（插入或拔出）时，触发回调处理
  // 静态接口使用 onChange 替代 on("change", ...)
  setupDeviceListener(): void {
    inputDevice.onChange((data: inputDevice.DeviceListener) => {
      this.handleDeviceChange(data);
    });
  }

  // 点击事件总入口：先查询已有设备，再启动热插拔监听
  // 使用 async/await + try/catch 替代嵌套的 Promise.then() 和 catch()
  // 错误处理使用 BusinessError 静态类型，替代 JSON.stringify 动态序列化
  async onButtonClick(): Promise<void> {
    try {
      // 步骤1：获取设备列表，检查是否已有物理键盘连接
      await this.checkExistingKeyboards();
      // 步骤2：注册设备热插拔监听
      this.setupDeviceListener();
      this.message = "Device monitoring enabled successfully";
    } catch (error) {
      // 使用 BusinessError 静态类型替代 JSON.stringify(error, ["code", "message"]) 动态解析
      const err: BusinessError = error as BusinessError;
      const errorCode: int = err.code;
      const errorMessage: string = err.message;
      hilog.error(DOMAIN, TAG, `Execute failed, error code: %{public}d, message: %{public}s`,
        errorCode, errorMessage);
      this.message = `Failed to enable device monitoring. Click to retry. Error code: ${errorCode}, message: ${errorMessage}`;
    }
  }

  build() {
    RelativeContainer() {
      Column() {
        // [StartExclude input_device]
        // 物理键盘连接状态展示区域
        this.ResultDisplay()
        // [EndExclude  input_device]

        // 可点击的提示文本，点击后触发设备查询和监听注册
        Text(this.message)
          .onClick(() => {
            this.onButtonClick();
          })
          // [StartExclude input_device]
          .height('auto')
          .width('100%')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .fontColor('#0A59F7')
          .textAlign(TextAlign.Center)
          .margin({ top: 8, bottom: 8 })
          .lineHeight(20)
          .wordBreak(WordBreak.NORMAL)
          .maxLines(2)
          .backgroundColor('#F7F9FC')
          .borderRadius(4)
          .padding(8)
        // [EndExclude  input_device]
      }
      // [StartExclude input_device]
      .height('100%')
      .width('80%')
      .alignItems(HorizontalAlign.Center)
      .position({ left: '10%', right: '10%' })
      .margin({ bottom: 200 })

      // [EndExclude  input_device]
    }
  }
}
