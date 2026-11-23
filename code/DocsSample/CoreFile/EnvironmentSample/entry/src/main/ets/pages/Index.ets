/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { abilityAccessCtrl, common, Permissions, PermissionRequestResult } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Environment } from '@kit.CoreFileKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { importDownloadFiles, writeDownloadMessage } from '../model/DownloadFiles';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Environment]';
const permissions: Permissions[] = ['ohos.permission.READ_WRITE_DOWNLOAD_DIRECTORY'];

// [Start get_user_dir_example]
function getUserDirExample(): boolean {
  try {
    const downloadPath: string = Environment.getUserDownloadDir();
    const documentsPath: string = Environment.getUserDocumentDir();
    hilog.info(DOMAIN, TAG, 'User directories obtained, download=%{private}s documents=%{private}s',
      downloadPath, documentsPath);
    return true;
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'Directory lookup failed, code=%{public}d message=%{private}s',
      err.code ?? 0, err.message);
    return false;
  }
}
// [End get_user_dir_example]

// [Start read_user_download_dir_example]
function readUserDownloadDirExample(context: common.UIAbilityContext): boolean {
  try {
    const downloadPath: string = Environment.getUserDownloadDir();
    const fileList: string[] = importDownloadFiles(downloadPath, context.filesDir);
    hilog.info(DOMAIN, TAG, 'Download import successful, sandbox entries=%{public}d', fileList.length);
    return true;
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'Download import failed, code=%{public}d message=%{private}s',
      err.code ?? 0, err.message);
    return false;
  }
}
// [End read_user_download_dir_example]

// [Start write_user_download_dir_example]
function writeUserDownloadDirExample(): boolean {
  try {
    const downloadPath: string = Environment.getUserDownloadDir();
    writeDownloadMessage(downloadPath, 'write a message');
    hilog.info(DOMAIN, TAG, 'Download write successful');
    return true;
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    hilog.error(DOMAIN, TAG, 'Download write failed, code=%{public}d message=%{private}s',
      err.code ?? 0, err.message);
    return false;
  }
}
// [End write_user_download_dir_example]

function reqPermissionsFromUser(permissions: Permissions[], context: common.UIAbilityContext): void {
  const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  atManager.requestPermissionsFromUser(context, permissions).then((data: PermissionRequestResult): void => {
    const granted: boolean = data.authResults.every((status: number): boolean => status === 0);
    if (granted) {
      hilog.info(DOMAIN, TAG, 'Download directory permission granted');
    } else {
      hilog.warn(DOMAIN, TAG, 'Download directory permission denied');
    }
  }).catch((err: BusinessError): void => {
    hilog.error(DOMAIN, TAG, 'Permission request failed, code=%{public}d message=%{private}s', err.code, err.message);
  });
}

@Entry
@Component
struct Index {
  @State message: string = '';

  aboutToAppear(): void {
    const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
    reqPermissionsFromUser(permissions, context);
  }

  build(): void {
    Column() {
      TextArea({
        text: this.message,
        placeholder: '',
      })
        .id('operationResult')
        .width('100%')
        .height('50%')

      Row() {
        Button($r('app.string.getUserDirExample'))
          .onClick((): void => {
            const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
            const result: Resource = getUserDirExample() ?
              $r('app.string.public_dirs_success') : $r('app.string.public_dirs_failed');
            this.message += `${context.resourceManager.getStringSync(result.id)}\n`;
          })
      }

      Row() {
        Button($r('app.string.readUserDownloadDirExample'))
          .onClick((): void => {
            const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
            const result: Resource = readUserDownloadDirExample(context) ?
              $r('app.string.download_import_success') : $r('app.string.download_import_failed');
            this.message += `${context.resourceManager.getStringSync(result.id)}\n`;
          })
      }

      Row() {
        Button($r('app.string.writeUserDownloadDirExample'))
          .onClick((): void => {
            const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
            const result: Resource = writeUserDownloadDirExample() ?
              $r('app.string.download_write_success') : $r('app.string.download_write_failed');
            this.message += `${context.resourceManager.getStringSync(result.id)}\n`;
          })
      }
    }

  }
}