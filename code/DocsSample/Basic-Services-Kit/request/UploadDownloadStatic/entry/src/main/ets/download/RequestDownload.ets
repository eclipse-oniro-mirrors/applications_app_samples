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

import { logger } from '../utils/Logger';
import { BusinessError, request } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';

const TAG: string = 'RequestDownload';

export class RequestDownload {
  // [Start request_download_file]
  async requestDownloadFile(url: string, fileName: string, callback: (progress: int, isSuccess: boolean) => void,
    context: common.UIAbilityContext): Promise<void> {
    // 获取应用文件路径
    // 请在组件内获取context，确保this.getUIContext().getHostContext()返回结果为UIAbilityContext
    let filesDir: string = context.cacheDir;
    let filePath: string = filesDir + '/' + fileName;
    this.clearExistFile(filePath);
    try {
      let downloadTask: request.DownloadTask = await request.downloadFile(context, {
        url: url,
        filePath: filePath,
      });
      downloadTask.onProgress((receivedSize: Long, totalSize: Long): void => {
        let progress: int = totalSize > 0 ? Long.toInt(receivedSize * 100 / totalSize) : 0;
        logger.info(TAG, `download progress=${progress}%`);
      });
      downloadTask.onComplete(() => {
        // 获取文件状态信息，其中包含大小
        let fileStat = fileIo.statSync(filePath);
        let fileSize: Long = fileStat.size;
        logger.info(TAG, `download complete, file= ${url}, size=${fileSize}, progress = 100%`);
        callback(100, true);
      });
      downloadTask.onFail((err: int): void => {
        logger.error(TAG, `download failed, err=${err}`);
        callback(100, false);
      });
    } catch (error) {
      let err: Error = error;
      logger.error(TAG, `downloadFile catch error, message=${err.message}`);
      callback(100, false);
    }
  }

  // [End request_download_file]

  // [Start download_agent_task]
  async requestAgentDownload(url: string, fileName: string, callback: (progress: int, isSuccess: boolean) => void,
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
    };
    try {
      let task: request.agent.Task = await request.agent.create(context, config);
      
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
    } catch (error) {
      let err: Error = error;
      logger.error(TAG, `download agent task catch error, message=${err.message}`);
      callback(100, false);
    }
  }

  // [End download_agent_task]

  clearExistFile(path: string): void {
    try {
      let exist: boolean = fileIo.accessSync(path);
      if (exist) {
        fileIo.unlinkSync(path);
      }
    } catch (error) {
      let err: Error = error;
      logger.error(TAG, `clearExistFile error, message=${err.message}`);
    }
  }
}

export const requestDownload: RequestDownload = new RequestDownload();