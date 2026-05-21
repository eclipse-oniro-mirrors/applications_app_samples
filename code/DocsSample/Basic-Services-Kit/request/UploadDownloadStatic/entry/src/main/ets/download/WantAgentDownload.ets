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

import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import wantAgent, { WantAgent } from '@ohos.app.ability.wantAgent';
import { request } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';
import { logger } from '../utils/Logger';

const TAG: string = 'WantAgentDownload';

export class WantAgentDownload {
  // [Start want_agent_download]
  async wantAgentDownload(url: string, fileName: string, callback: (progress: int, isSuccess: boolean) => void,
    context: common.UIAbilityContext): Promise<void> {
    // 请在组件内获取context，确保this.getUIContext().getHostContext()返回结果为UIAbilityContext

    // 创建wantAgentInfo对象，用于定义点击通知后要执行的操作
    let wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          deviceId: '',
          bundleName: 'com.samples.uploaddownloadstatic', // 替换为实际应用的包名
          abilityName: 'EntryAbility', // 替换为实际的ability名称
          action: '',
          entities: [],
          uri: '',
          parameters: {} // 可以传递自定义参数
        }
      ],
      actionType: wantAgent.OperationType.START_ABILITY,
      requestCode: 0,
      actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
    };

    // 获取WantAgent实例
    let wantAgentInstance: WantAgent;
    try {
      wantAgentInstance = await wantAgent.getWantAgent(wantAgentInfo);
    } catch (error) {
      let err: Error = error;
      logger.error(TAG, `Failed to get WantAgent, message: ${err.message}`);
      callback(100, false);
      return;
    }

    let filesDir: string = context.cacheDir;
    // 创建下载任务配置，包含wantAgent参数
    let config: request.agent.Config = {
      action: request.agent.Action.DOWNLOAD,
      url: url, // 替换为实际的下载地址
      title: '下载任务通知标题',
      description: '下载任务通知描述',
      mode: request.agent.Mode.BACKGROUND,
      overwrite: true,
      method: 'GET',
      saveas: fileName,
      network: request.agent.Network.ANY,
      gauge: true,
      notification: {
        visibility: request.agent.VISIBILITY_COMPLETION | request.agent.VISIBILITY_PROGRESS,
        wantAgent: wantAgentInstance,
      }
    };

    // 创建并启动下载任务
    try {
      let task: request.agent.Task = await request.agent.create(context, config);
      
      // 注册回调
      task.onProgress((progress: request.agent.Progress): void => {
        logger.info(TAG, `Request download status ${progress.state}, downloaded ${progress.processed}`);
      });
      task.onCompleted((progress: request.agent.Progress): void => {
        logger.info(TAG, `Request download completed, ${JSON.stringify(progress)}`);
        let filePath: string = filesDir + '/' + fileName;
        let fileStat = fileIo.statSync(filePath);
        let fileSize: Long = fileStat.size;
        logger.info(TAG, `download complete, file= ${url}, size=${fileSize}, progress = 100%`);
        callback(100, true);
        request.agent.remove(task.tid);
      });
      task.onFailed((progress: request.agent.Progress): void => {
        logger.error(TAG, `Request download failed, ${JSON.stringify(progress)}`);
        callback(100, false);
        request.agent.remove(task.tid);
      });
      
      // 启动任务
      await task.start();
    } catch (error) {
      let err: Error = error;
      logger.error(TAG, `Failed to operate a download task, message: ${err.message}`);
      callback(100, false);
    }
  }

  // [End want_agent_download]
}

export const wantAgentDownload: WantAgentDownload = new WantAgentDownload();