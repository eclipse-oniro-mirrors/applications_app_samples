'use static'
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

// [Start entry1_preload_render_index1_static]
// Index.ets
import { Entry, Component, Column, Button, ClickEvent } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Button('Jump to web page').onClick(() => {
        this.getUIContext().getRouter().pushUrl({ url: 'pages/Index2' }).catch((error) => {
          console.error('pushUrl error, ' + error);
        })
      }).width('100%').height('100%')
    }
  }
}

// [End entry1_preload_render_index1_static]