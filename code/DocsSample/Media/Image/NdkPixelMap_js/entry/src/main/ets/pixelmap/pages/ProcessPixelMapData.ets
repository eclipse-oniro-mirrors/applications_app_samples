/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

// [Start ndk_pixelmap_js_pixelmap_operation]
import testNapi from 'libentry.so';
import { image } from '@kit.ImageKit';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct ProcessPixelMapData {
  @State _pixelMap: image.PixelMap | undefined = undefined;

  build() {
    Row() {
      Column() {
        Button($r('app.string.Go_Back'))
          .onClick(() => {
            router.back();
          })
        Button($r('app.string.PixelMap'))
          .width(100)
          .height(100)
          .onClick(() => {
            this._pixelMap = testNapi.createPixelMapTest();
            testNapi.transform(this._pixelMap);
          });
        Image(this._pixelMap)
          .width(500)
          .height(500)
          .objectFit(ImageFit.Cover)
          .border({ width: 1, color: Color.Blue })
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End ndk_pixelmap_js_pixelmap_operation]