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

import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { BusinessError, request } from '@kit.BasicServicesKit';
import { logger } from '../utils/Logger';

const TAG: string = 'SpeedLimitDownload';

export class SpeedLimitDownload {
  // [Start speed_limit_download]
  async speedLimitDownload(url: string, fileName: string, callback: (progress: int, isSuccess: boolean) => void,
    context: common.UIAbilityContext): Promise<void> {
    // 获取应用文件路径
    // 请在组件内获取context，确保this.getUIContext().getHostContext()返回结果为UIAbilityContext
    let filesDir: string = context.cacheDir;

    let config: request.agent.Config = {
      action: request.agent.Action.DOWNLOAD,
      url: url,
      saveas: fileName,
      gauge: true,
      overwrite: true,
      network: request.agent.Network.WIFI,
      // 最低速度限制规则：
      // 1. 若任务速度持续低于设定值（如：16 * 1024 B/s）达到指定时长（如：10s），则任务失败
      // 2. 重置计时条件：
      // - 任一秒速度超过最低限速
      // - 任务暂停后恢复
      // - 任务停止后重启
      minSpeed: {
        speed: 16 * 1024,
        duration: 10
      },
      // 超时控制规则：
      // 1. 连接超时（connectionTimeout）：
      // - 单次连接建立耗时超过设定值（如：60s）则任务失败
      // - 多次连接时各次独立计时（不累积）
      // 2. 总超时（totalTimeout）：
      // - 任务总耗时（含连接+传输时间）超过设定值（如：120s）则失败
      // - 暂停期间不计时，恢复后累积计时
      // 3. 重置计时条件：任务失败或停止时重置计时
      timeout: {
        connectionTimeout: 60,
        totalTimeout: 120,
      }
    };
    try {
      let task: request.agent.Task = await request.agent.create(context, config);
      // 设置任务速度上限
      task.setMaxSpeed(10 * 1024 * 1024).then(() => {
        logger.info(TAG, `Succeeded in setting the max speed of the task. result: ${task.tid}`);
      }).catch((err: Error) => {
        logger.error(TAG, `Failed to set the max speed of the task, message=${err.message}`);
      });
      
      // 注册回调
      task.onProgress((progress: request.agent.Progress): void => {
        logger.info(TAG, `Request download status ${progress.state}, downloaded ${progress.processed}`);
      });
      task.onCompleted((progress: request.agent.Progress): void => {
        logger.info(TAG, `Request download completed`);
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
    } catch (err) {
      let error: Error = err;
      logger.error(TAG, `Failed to create a download task, message: ${error.message}`);
      callback(100, false);
    }
  }

  // [End speed_limit_download]
}

export const speedLimitDownload: SpeedLimitDownload = new SpeedLimitDownload();