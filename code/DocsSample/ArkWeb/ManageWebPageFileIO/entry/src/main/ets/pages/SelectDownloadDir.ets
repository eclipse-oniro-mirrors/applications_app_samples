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

// [Start select_download_dir]
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { picker, fileUri } from  '@kit.CoreFileKit';
@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();

  build() {
    Column() {
      Button('setDownloadDelegate')
        .onClick(() => {
          try {
            this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
              console.info('will start a download.');
              // 使用DocumentViewPicker()获取当前示例的默认下载目录，将该目录设置为下载目录
              getDownloadPathFromPicker().then((downloadPath) => {
                webDownloadItem.start(downloadPath + '/' + webDownloadItem.getSuggestedFileName());
              });

            })
            this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
              // 下载任务的唯一标识。
              console.info('download update guid: ' + webDownloadItem.getGuid());
              // 下载的进度。
              console.info('download update percent complete: ' + webDownloadItem.getPercentComplete());
              // 当前的下载速度。
              console.info('download update speed: ' + webDownloadItem.getCurrentSpeed())
            })
            this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.error('download failed guid: ' + webDownloadItem.getGuid());
              // 下载任务失败的错误码。
              console.error('download failed last error code: ' + webDownloadItem.getLastErrorCode());
            })
            this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.info('download finish guid: ' + webDownloadItem.getGuid());
            })
            this.controller.setDownloadDelegate(this.delegate);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: $rawfile('index.html'), controller: this.controller })
    }
  }

}
function getDownloadPathFromPicker(): Promise<string> {
  return new Promise<string>(resolve => {
    try {
      const documentSaveOptions = new picker.DocumentSaveOptions();
      documentSaveOptions.pickerMode = picker.DocumentPickerMode.DOWNLOAD
      const documentPicker = new picker.DocumentViewPicker();
      documentPicker.save(documentSaveOptions).then(async (documentSaveResult: Array<string>) => {
        if (documentSaveResult.length <= 0) {
          resolve('');
          return;
        }
        const uriString = documentSaveResult[0];
        if (!uriString) {
          resolve('');
          return;
        }
        const uri = new fileUri.FileUri(uriString);
        resolve(uri.path);
      }).catch((err: BusinessError) => {
        console.error(`ErrorCode: ${err.code},  Message: ${err.message}`);
        resolve('');
      });
    } catch (error) {
      resolve('');
    }
  })
}
// [End select_download_dir]