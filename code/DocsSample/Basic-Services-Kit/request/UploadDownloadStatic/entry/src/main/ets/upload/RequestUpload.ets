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

import { BusinessError, request } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { urlUtils } from '../utils/UrlUtils';
import { fileIo } from '@kit.CoreFileKit';
import { logger } from '../utils/Logger';

const TAG: string = 'RequestUpload';

export class Upload {
  // [Start request_upload_file]
  async requestUploadFile(fileName: string, callback: (progress: int, isSuccess: boolean) => void,
    context: common.UIAbilityContext): Promise<void> {
    // 获取应用文件路径
    // 请在组件内获取context，确保this.getUIContext().getHostContext()返回结果为UIAbilityContext
    let url: string = await urlUtils.getUrl(context);
    let cacheDir: string = context.cacheDir;

    // 新建一个本地应用文件
    try {
      let file = fileIo.openSync(cacheDir + '/test.txt', fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      fileIo.writeSync(file.fd, 'upload file test');
      fileIo.closeSync(file);
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      logger.error(TAG, `Invoke uploadFile failed, code=${err.code}, message=${err.message}`);
    }

    // 上传任务配置项
    let files: request.File[] = [
      // uri前缀internal://cache 对应cacheDir目录
      {
        filename: fileName,
        name: 'test',
        uri: 'internal://cache/' + fileName,
        type: 'txt'
      }
    ];
    let data: request.RequestData[] = [{ name: 'name', value: 'value' }];
    let uploadConfig: request.UploadConfig = {
      url: url,
      header: {
        'key1': 'value1',
        'key2': 'value2'
      },
      method: 'POST',
      files: files,
      data: data
    };

    // 将本地应用文件上传至网络服务器
    try {
      let uploadTask: request.UploadTask = await request.uploadFile(context, uploadConfig);
      uploadTask.onProgress((uploadedSize: Long, totalSize: Long): void => {
        let progress: int = totalSize > 0 ? Long.toInt(uploadedSize * 100 / totalSize) : 0;
        logger.info(TAG, `upload progress=${progress}%`);
      });
      uploadTask.onComplete((taskStates: request.TaskState[]): void => {
        for (let i: int = 0; i < taskStates.length; i++) {
          logger.info(TAG, `upload complete taskState: ${JSON.stringify(taskStates[i])}`);
        }
        callback(100, true);
      });
      uploadTask.onFail((taskStates: request.TaskState[]): void => {
        logger.error(TAG, `upload failed taskState: ${JSON.stringify(taskStates)}`);
        callback(100, false);
      });
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      logger.error(TAG, `Invoke uploadFile failed, code=${err.code}, message=${err.message}`);
      callback(100, false);
    }
  }

  // [End request_upload_file]

  // [Start upload_agent_task]
  async requestAgentUpload(fileName: string, callback: (progress: int, isSucceed: boolean) => void,
    context: common.UIAbilityContext): Promise<void> {
    // 获取应用文件路径
    // 请在组件内获取context，确保this.getUIContext().getHostContext()返回结果为UIAbilityContext
    let url: string = await urlUtils.getUrl(context);
    let cacheDir: string = context.cacheDir;

    let attachments: request.agent.FormItem[] = [{
      name: 'test',
      value: [
        {
          filename: fileName,
          path: cacheDir + '/' + fileName,
        },
      ]
    }];
    let config: request.agent.Config = {
      action: request.agent.Action.UPLOAD,
      url: url,
      mode: request.agent.Mode.FOREGROUND,
      overwrite: true,
      method: 'POST',
      headers: {
        'key1': 'value1',
        'key2': 'value2'
      },
      data: attachments
    };
    try {
      let task: request.agent.Task = await request.agent.create(context, config);
      
      // 注册回调
      task.onProgress((progress: request.agent.Progress): void => {
        logger.info(TAG, `Request upload status ${progress.state}, uploaded ${progress.processed}`);
      });
      task.onCompleted((progress: request.agent.Progress): void => {
        logger.info(TAG, `Request upload completed`);
        callback(100, true);
        request.agent.remove(task.tid);
      });
      task.onFailed((progress: request.agent.Progress): void => {
        logger.error(TAG, `Request upload failed, ${JSON.stringify(progress)}`);
        callback(100, false);
        request.agent.remove(task.tid);
      });
      
      // 启动任务
      await task.start();
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      logger.error(TAG, `Failed to start the upload task, code=${err.code}, message=${err.message}`);
      callback(100, false);
    }
  }

  // [End upload_agent_task]
}

export const requestUpload: Upload = new Upload();