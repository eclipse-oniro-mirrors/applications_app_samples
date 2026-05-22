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
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { bundleManager, common } from '@kit.AbilityKit';
import abilityAccessCtrl, { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { logger } from '../../utils/Logger';

const TAG: string = 'MediaDownload';

export class MediaDownload {
  // [Start media_user_file_download]
  async mediaFileAgentTask(url: string, callback: (progress: int, isSuccess: boolean) => void,
    context: common.UIAbilityContext): Promise<void> {
    let bundleFlags: int = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
    // 获取应用程序的accessTokenID。
    let tokenID: int = 0;
    try {
      let data: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
      logger.info(TAG, `Request getBundleInfoForSelf successfully. Data: ${JSON.stringify(data)}`);
      let appInfo: bundleManager.ApplicationInfo = data.appInfo!;
      tokenID = appInfo.accessTokenId.toInt();
    } catch (err) {
      let error: Error = err;
      logger.error(TAG, `GetBundleInfoForSelf failed: ${error.message}`);
    }

    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    let grant: boolean = true;
    // 校验应用是否授予权限。使用Promise异步回调。
    try {
      let data: abilityAccessCtrl.GrantStatus = await atManager.checkAccessToken(tokenID, 'ohos.permission.WRITE_IMAGEVIDEO');
      logger.info(TAG, `Request checkAccessToken success, data->${JSON.stringify(data)}`);
      if (data != abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
        grant = false;
      }
    } catch (err) {
      let error: Error = err;
      logger.error(TAG, `CheckAccessToken fail, message=${error.message}`);
    }

    if (!grant) {
      // 用于UIAbility拉起弹框请求用户授权。使用callback异步回调。
      try {
        let data: PermissionRequestResult = await atManager.requestPermissionsFromUser(context, ['ohos.permission.WRITE_IMAGEVIDEO']);
        logger.info(TAG, `Request grant: ${JSON.stringify(data)}`);
        logger.info(TAG, `Request grant permissions: ${data.permissions}`);
        logger.info(TAG, `Request grant authResults: ${data.authResults}`);
        logger.info(TAG, `Request grant dialogShownResults: ${data.dialogShownResults}`);
      } catch (err) {
        let error: Error = err;
        logger.error(TAG, `Grant error, message=${error.message}`);
      }
    }

    try {
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      let extension: string = 'jpg';
      let options: photoAccessHelper.CreateOptions = {
        title: 'media'
      };
      // 获取相册管理模块的实例，用于访问和修改相册中的媒体文件。
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      if (phAccessHelper == null) {
        logger.error(TAG, 'getPhotoAccessHelper failed, phAccessHelper is null');
        callback(100, false);
        return;
      }
      // 指定文件类型、后缀和创建选项，创建图片或视频资源，以Promise方式返回结果。
      let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
      logger.info(TAG, `Request createAsset uri ${uri}`);

      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: url,
        // saveas字段是PhotoAccessHelper保存的文件的uri
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
          logger.info(TAG, `Request download status ${progress.state}, downloaded ${progress.processed}`);
        });
        task.onCompleted((progress: request.agent.Progress): void => {
          logger.info(TAG, `Request download completed, ${JSON.stringify(progress)}`);
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
        logger.error(TAG, `Failed to operate a download task, message=${error.message}`);
        callback(100, false);
      }
    } catch (error) {
      let err: Error = error;
      logger.error(TAG, `Failed to create a media download task, message=${err.message}`);
      callback(100, false);
    }
  }

  // [End media_user_file_download]
}

export const mediaDownload: MediaDownload = new MediaDownload();