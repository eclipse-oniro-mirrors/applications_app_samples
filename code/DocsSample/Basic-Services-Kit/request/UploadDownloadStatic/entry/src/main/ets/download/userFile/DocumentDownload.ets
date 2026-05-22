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
import picker from '@ohos.file.picker';
import { common } from '@kit.AbilityKit';
import { logger } from '../../utils/Logger';

const TAG: string = 'DocumentDownload';

export class DocumentDownload {
  // [Start doc_user_file_download]
  async docFileAgentTask(url: string, fileName: string, callback: (progress: int, isSuccess: boolean) => void,
    context: common.UIAbilityContext): Promise<void> {
    // 创建文件管理器选项实例。
    try {
      const documentSaveOptions: picker.DocumentSaveOptions = {
        newFileNames: [fileName],
        fileSuffixChoices: ['文档|.txt', '.pdf']
      };
      let uri: string = '';
      // 请在组件内获取context，确保this.getUIContext().getHostContext()返回结果为UIAbilityContext
      const documentViewPicker = new picker.DocumentViewPicker(context);
      let documentSaveResult: string[] = await documentViewPicker.save(documentSaveOptions);
      uri = documentSaveResult[0];
      logger.info(TAG, `DocumentViewPicker.save to file succeed and uri is ${uri}`);
      
      if (uri != '') {
        let config: request.agent.Config = {
          action: request.agent.Action.DOWNLOAD,
          url: url,
          // saveas字段是DocumentViewPicker保存的文件的uri
          saveas: uri,
          gauge: true,
          // overwrite字段必须为true
          overwrite: true,
          network: request.agent.Network.WIFI,
          // mode字段必须为request.agent.Mode.FOREGROUND
          mode: request.agent.Mode.FOREGROUND,
        };
        try {
          let task: request.agent.Task = await request.agent.create(context, config);
          
          // 注册回调
          task.onProgress((progress: request.agent.Progress): void => {
            logger.info(TAG, `download status ${progress.state}, downloaded ${progress.processed}`);
          });
          task.onCompleted((progress: request.agent.Progress): void => {
            logger.info(TAG, `download completed ${JSON.stringify(progress)}`);
            callback(100, true);
            request.agent.remove(task.tid);
          });
          task.onFailed((progress: request.agent.Progress): void => {
            logger.error(TAG, `download failed ${JSON.stringify(progress)}`);
            callback(100, false);
            request.agent.remove(task.tid);
          });
          
          // 启动任务
          await task.start();
        } catch (error) {
          let err: Error = error;
          logger.error(TAG, `Failed to create a download task, message=${err.message}`);
          callback(100, false);
        }
      }
    } catch (error) {
      let err: Error = error;
      logger.error(TAG, `Failed to create a documentSaveOptions, message=${err.message}`);
      callback(100, false);
      return;
    }
  }

  // [End doc_user_file_download]
}

export const documentDownload: DocumentDownload = new DocumentDownload();