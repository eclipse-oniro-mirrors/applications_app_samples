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

// [Start UploadFilesCamera]
import { $rawfile, Callback, Column, Component, Entry, UIContext, Web } from '@ohos.arkui.component';
import webview from '@ohos.web.webview';
import cameraPicker from '@ohos.multimedia.cameraPicker';
import camera from '@ohos.multimedia.camera';
import { BusinessError } from '@ohos.base';

async function openCamera(callback: Callback<string>, uiContext: UIContext) {
  try {
    let pickerProfile: cameraPicker.PickerProfile = {
      cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK
    };
    let pickerResult: cameraPicker.PickerResult = await cameraPicker.pick(uiContext.getHostContext()!,
      [cameraPicker.PickerMediaType.PHOTO, cameraPicker.PickerMediaType.VIDEO], pickerProfile);
    callback(pickerResult.resultUri);
  } catch (error) {
    let err = error as BusinessError;
    console.error(`the pick call failed. error code: ${err.code}`);
  }
}

@Entry
@Component
struct Index {
  webviewController: webview.WebviewController = new webview.WebviewController(undefined);

  build() {
    Column() {
      Web({ src: $rawfile("webCamera.html"), controller: this.webviewController })
        .onShowFileSelector((event) => {
          //开发者可以通过event.fileSelector.getAcceptType()和event.fileSelector.isCapture()判断文件类型，并有选择地做出筛选以拉起不同的文件选择器
          openCamera((result) => {
            if (event) {
              console.info('Title is ' + event.fileSelector.getTitle());
              console.info('Mode is ' + event.fileSelector.getMode());
              console.info('Accept types are ' + event.fileSelector.getAcceptType());
              console.info('Capture is ' + event.fileSelector.isCapture());
              event.result.handleFileList([result]);
            }
          }, this.getUIContext())
          return true;
        })
    }
    .height('100%')
    .width('100%')
  }
}
// [End UploadFilesCamera]