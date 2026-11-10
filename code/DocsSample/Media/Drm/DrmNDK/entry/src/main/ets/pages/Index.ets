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

import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';
import drmSample from 'libdrmsample.so';

const DRM_SOLUTION_NAME = 'com.clearplay.drm';
const MIME_TYPE = 'video/mp4';

function getString(rm: resourceManager.ResourceManager, resId: number, ...args: Array<string | number>): string {
  try {
    return rm.getStringSync(resId, ...args);
  } catch (err) {
    const e = err as BusinessError;
    console.error(`getStringSync failed, code: ${e.code}, message: ${e.message}`);
    return '';
  }
}

@Entry
@Component
struct Index {
  @State result: string | Resource = $r('app.string.result_hint', DRM_SOLUTION_NAME);

  getResourceManager(): resourceManager.ResourceManager {
    return this.getUIContext().getHostContext()!.resourceManager;
  }

  build() {
    Column() {
      Text($r('app.string.page_title'))
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 16, bottom: 8 })

      Scroll() {
        Column() {
          Text($r('app.string.c_api_section_title'))
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .width('90%')
            .margin({ top: 8, bottom: 4 })

          Button($r('app.string.c_query_if_supported'))
            .id('CIsSupportedBtn')
            .width('80%')
            .margin(4)
            .onClick(() => {
              const supported = drmSample.isSupported(DRM_SOLUTION_NAME);
              this.result = getString(this.getResourceManager(),
                $r('app.string.oh_is_supported_result').id, `${supported}`);
            })

          Button($r('app.string.c_query_supported_list'))
            .id('CGetMediaKeySystemsBtn')
            .width('80%')
            .margin(4)
            .onClick(() => {
              this.result = drmSample.getMediaKeySystems();
            })

          Button($r('app.string.c_query_support_level'))
            .id('CIsSupported3Btn')
            .width('80%')
            .margin(4)
            .onClick(() => {
              this.result = drmSample.isSupported3(DRM_SOLUTION_NAME, MIME_TYPE);
            })

          Button($r('app.string.c_media_key_system_flow'))
            .id('CMediaKeySystemFlowBtn')
            .width('80%')
            .margin(4)
            .onClick(() => {
              this.result = drmSample.mediaKeySystemFlow(DRM_SOLUTION_NAME);
            })

          Button($r('app.string.c_media_key_session_flow'))
            .id('CMediaKeySessionFlowBtn')
            .width('80%')
            .margin(4)
            .onClick(() => {
              this.result = drmSample.mediaKeySessionFlow(DRM_SOLUTION_NAME, MIME_TYPE);
            })

          Text($r('app.string.result_section_title'))
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .width('90%')
            .margin({ top: 12, bottom: 4 })

          Text(this.result)
            .id('ResultText')
            .fontSize(13)
            .width('90%')
            .padding(12)
            .backgroundColor($r('app.color.result_background'))
            .borderRadius(8)
            .margin({ bottom: 16 })
        }
        .width('100%')
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}
