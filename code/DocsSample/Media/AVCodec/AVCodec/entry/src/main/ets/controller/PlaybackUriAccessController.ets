/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { common } from '@kit.AbilityKit';
import { dataSharePredicates } from '@kit.ArkData';
import { fileShare } from '@kit.CoreFileKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import Logger from '../common/utils/Logger';

const TAG: string = 'PlaybackUriAccessController';
const DOCUMENT_URI_PREFIX: string = 'file://docs/';
const MEDIA_URI_PREFIX: string = 'file://media/';

export class PlaybackUriAccessController {
  static async persistDocumentUri(uri: string): Promise<boolean> {
    if (!uri.startsWith(DOCUMENT_URI_PREFIX)) {
      return true;
    }
    if (!canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization')) {
      return false;
    }
    try {
      await fileShare.persistPermission([{
        uri,
        operationMode: fileShare.OperationMode.READ_MODE
      }]);
      return true;
    } catch (error) {
      Logger.warn(TAG, 'Persist document access failed: ' + String(error));
      return false;
    }
  }

  static async prepare(uri: string, context: common.Context | undefined): Promise<void> {
    if (uri.startsWith(MEDIA_URI_PREFIX)) {
      await PlaybackUriAccessController.prepareMediaUri(uri, context);
      return;
    }
    if (uri.startsWith(DOCUMENT_URI_PREFIX)) {
      await PlaybackUriAccessController.activateDocumentUri(uri);
    }
  }

  private static async prepareMediaUri(uri: string, context: common.Context | undefined): Promise<void> {
    if (context === undefined) {
      Logger.warn(TAG, 'Media access context is unavailable; trying the selected URI directly');
      return;
    }
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined = undefined;
    try {
      const accessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.URI, uri);
      fetchResult = await accessHelper.getAssets({
        fetchColumns: [photoAccessHelper.PhotoKeys.URI],
        predicates
      });
      const asset = await fetchResult.getFirstObject();
      if (asset === undefined || asset === null) {
        Logger.warn(TAG, 'PhotoAccessHelper did not return the selected asset; trying the URI directly');
      }
    } catch (error) {
      Logger.warn(TAG, 'PhotoAccessHelper lookup failed; trying the selected URI directly: ' + String(error));
    } finally {
      if (fetchResult !== undefined) {
        try {
          fetchResult.close();
        } catch (error) {
          Logger.warn(TAG, 'Close PhotoAccessHelper result failed: ' + String(error));
        }
      }
    }
  }

  private static async activateDocumentUri(uri: string): Promise<void> {
    if (!canIUse('SystemCapability.FileManagement.AppFileService.FolderAuthorization')) {
      return;
    }
    const policies: fileShare.PolicyInfo[] = [{
      uri,
      operationMode: fileShare.OperationMode.READ_MODE
    }];
    try {
      const persisted = await fileShare.checkPersistentPermission(policies);
      if (persisted.length > 0 && persisted[0]) {
        await fileShare.activatePermission(policies);
      }
    } catch (error) {
      Logger.warn(TAG, 'Restore document access failed: ' + String(error));
    }
  }
}
