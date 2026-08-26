/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
 * @file EntryAbility.ets
 * @brief 后台加载任务示例的主Ability入口
 *
 * 本文件演示了如何使用 @kit.BackgroundTasksKit 中的 backgroundLoader 模块：
 * 1. 通过 callee 监听 backgroundLoader.ON_START 和 backgroundLoader.ON_STOP 事件
 * 2. 在 ON_START 回调中处理后台加载任务启动逻辑
 * 3. 在 ON_STOP 回调中处理后台加载任务停止逻辑
 *
 * 同时定义了 TestCases 类，封装了以下API的调用示例：
 * - registerTask: 注册后台加载任务
 * - unregisterTask: 注销后台加载任务
 * - finishTask: 完成后台加载任务
 * - getTaskInfo: 查询后台加载任务信息
 */

import { AbilityConstant, ConfigurationConstant, Context, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { rpc } from '@kit.IPCKit'
import { backgroundLoader } from '@kit.BackgroundTasksKit'
import { BusinessError } from '@kit.BasicServicesKit'

const DOMAIN = 0x0000;

let appContext: Context | null = null

/**
 * MyMessageAble 自定义Parcelable对象
 * 用于在callee回调中进行IPC数据序列化与反序列化
 */
class MyMessageAble implements rpc.Parcelable {
  name: string
  str: string
  num: number = 1

  constructor(name:string, str: string) {
    this.name = name;
    this.str = str;
  }

  marshalling(messageSequence: rpc.MessageSequence) {
    messageSequence.writeString(this.str);
    console.info(`MyMessageAble marshalling num[${this.num}] str[${this.str}]`);
    return true;
  }

  unmarshalling(messageSequence: rpc.MessageSequence) {
    this.str = messageSequence.readString();
    console.info(`MyMessageAble marshalling num[${this.num}] str[${this.str}]`);
    return true;
  }
}

/**
 * funCallBack 后台加载任务启动回调
 * 当backgroundLoader触发ON_START事件时调用，执行后台加载任务逻辑
 *
 * @param pdata 从调用方传递的MessageSequence数据
 * @returns 返回MyMessageAble对象，包含任务运行状态信息
 */
function funCallBack(pdata: rpc.MessageSequence): rpc.Parcelable {
  hilog.info(DOMAIN, 'testTag', 'Task started [backgroundLoader.ON_START callback]');
  return new MyMessageAble('test1', 'Running...');
}

/**
 * onStopCallBack 后台加载任务停止回调
 * 当backgroundLoader触发ON_STOP事件时调用，处理任务停止逻辑
 * 读取MessageSequence中的taskId、abilityName、stopCode和message信息
 *
 * @param pdata 从调用方传递的MessageSequence数据，包含taskId、abilityName、stopCode、message
 * @returns 返回MyMessageAble对象，包含停止原因信息
 */
function onStopCallBack(pdata: rpc.MessageSequence): rpc.Parcelable {
  hilog.info(DOMAIN, 'testTag', 'Task stopped');
  const taskId: number = pdata.readInt();
  const abilityName: string = pdata.readString();
  const stopCode: number = pdata.readInt();
  const message: string = pdata.readString();
  hilog.info(DOMAIN, 'testTag', 'onStopCallBack: taskId=%{public}d, stopCode=%{public}d, message=%{public}s',
    taskId, stopCode, message);
  return new MyMessageAble('onStop', message);
}

/**
 * EntryAbility 主Ability
 * 在onCreate生命周期中注册backgroundLoader的ON_START和ON_STOP callee监听
 */
export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', 'Failed to set colorMode. Cause: %{public}s', JSON.stringify(err));
    }
    // [Start backgroundLoader_register_callee]
    try {
      // 注册ON_START回调，当后台加载任务启动时触发funCallBack
      this.callee.on(backgroundLoader.ON_START, funCallBack);
      // 注册ON_STOP回调，当后台加载任务停止时触发onStopCallBack
      this.callee.on(backgroundLoader.ON_STOP, onStopCallBack);
    } catch (error) {
      console.error(`Callee.on catch error, error.code: ${error.code}, error.message: ${error.message}`);
    }
    // [End backgroundLoader_register_callee]
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}

/**
 * TestCases 测试用例封装类
 * 封装了backgroundLoader模块的核心API调用，供UI界面调用
 */
export class TestCases {
  /**
   * registerTask 注册后台加载任务
   * 调用backgroundLoader.registerTask接口注册指定abilityName和taskId的后台加载任务
   *
   * @param abilityname 目标Ability名称
   * @param taskId 任务ID
   * @returns Promise<string> 返回"Success"表示注册成功，返回错误信息表示注册失败
   */
  async registerTask(abilityname: string, taskId: number): Promise<string> {
    hilog.info(DOMAIN, 'testTag', 'registerTask: abilityName=%{public}s, taskId=%{public}d', abilityname, taskId);
    // [Start backgroundLoader_registerTask]
    const taskInfo: backgroundLoader.TaskInfo = {
      abilityname: abilityname,
      taskId: taskId
    };
    try {
      backgroundLoader.registerTask(taskInfo);
      hilog.info(DOMAIN, 'testTag', 'registerTask successes');
      return 'Success';
    } catch (err) {
      const errMsg = JSON.stringify(err);
      hilog.error(DOMAIN, 'testTag', 'registerTask failed: %{public}s', errMsg);
      return `Failed: ${(err as BusinessError).message ?? errMsg}`;
    }
    // [End backgroundLoader_registerTask]
  }

  /**
   * unregisterTask 注销后台加载任务
   * 调用backgroundLoader.unregisterTask接口注销指定abilityName和taskId的后台加载任务
   *
   * @param abilityname 目标Ability名称
   * @param taskId 任务ID
   * @returns Promise<string> 返回"Success"表示注销成功，返回错误信息表示注销失败
   */
  async unregisterTask(abilityname: string, taskId: number): Promise<string> {
    hilog.info(DOMAIN, 'testTag', 'unregisterTask: abilityName=%{public}s, taskId=%{public}d', abilityname, taskId);
    // [Start backgroundLoader_unregisterTask]
    const taskInfo: backgroundLoader.TaskInfo = {
      abilityname: abilityname,
      taskId: taskId
    };
    try {
      backgroundLoader.unregisterTask(taskInfo);
      hilog.info(DOMAIN, 'testTag', 'unregisterTask successes');
      return 'Success';
    } catch (err) {
      const errMsg = JSON.stringify(err);
      hilog.error(DOMAIN, 'testTag', 'unregisterTask failed: %{public}s', errMsg);
      return `Failed: ${(err as BusinessError).message ?? errMsg}`;
    }
    // [End backgroundLoader_unregisterTask]
  }

  /**
   * finishTask 完成后台加载任务
   * 调用backgroundLoader.finishTask接口完成指定abilityName和taskId的后台加载任务
   *
   * @param abilityname 目标Ability名称
   * @param taskId 任务ID
   * @returns Promise<string> 返回"Success"表示完成成功，返回错误信息表示完成失败
   */
  async finishTask(abilityname: string, taskId: number): Promise<string> {
    hilog.info(DOMAIN, 'testTag', 'finishTask: abilityName=%{public}s, taskId=%{public}d', abilityname, taskId);
    // [Start backgroundLoader_finishTask]
    const taskInfo: backgroundLoader.TaskInfo = {
      abilityname: abilityname,
      taskId: taskId
    };
    try {
      backgroundLoader.finishTask(taskInfo);
      hilog.info(DOMAIN, 'testTag', 'finishTask successes');
      return 'Success';
    } catch (err) {
      const errMsg = JSON.stringify(err);
      hilog.error(DOMAIN, 'testTag', 'finishTask failed: %{public}s', errMsg);
      return `Failed: ${(err as BusinessError).message ?? errMsg}`;
    }
    // [End backgroundLoader_finishTask]
  }

  /**
   * getTaskInfo 查询后台加载任务信息
   * 调用backgroundLoader.getTaskInfo接口查询指定taskId的后台加载任务信息
   *
   * @param taskId 任务ID
   * @returns Promise<string> 返回任务信息字符串（taskId和abilityName），失败时返回错误信息
   */
  async getTaskInfo(taskId: number): Promise<string> {
    hilog.info(DOMAIN, 'testTag', 'getTaskInfo: taskId=%{public}d', taskId);
    // [Start backgroundLoader_getTaskInfo]
    try {
      const taskInfoData = backgroundLoader.getTaskInfo(taskId);
      const result = `taskId=${taskInfoData.taskId}, abilityName=${taskInfoData.abilityName}`;
      hilog.info(DOMAIN, 'testTag', 'getTaskInfo result: %{public}s', result);
      return result;
    } catch (err) {
      const errMsg = JSON.stringify(err);
      hilog.error(DOMAIN, 'testTag', 'getTaskInfo failed: %{public}s', errMsg);
      return `Failed: ${(err as BusinessError).message ?? errMsg}`;
    }
    // [End backgroundLoader_getTaskInfo]
  }
}

export const testCases: TestCases = new TestCases();
