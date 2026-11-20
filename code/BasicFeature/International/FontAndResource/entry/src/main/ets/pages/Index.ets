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

// Import the main page that hosts both demo tabs.
import { MainPage } from '../fontresource/MainPage';

// The root entry page that fills the window with the main page.
@Entry
@ComponentV2
struct Index {
  // Builds the full screen column hosting the main page.
  build() {
    // Stack the main page inside a full sized column.
    Column() {
      // Render the main page as the only child.
      MainPage()
    }
    // Attach the page level test id.
    .id('id_index_page')
    // Stretch the column across the window width.
    .width('100%')
    // Stretch the column across the window height.
    .height('100%')
  }
}
