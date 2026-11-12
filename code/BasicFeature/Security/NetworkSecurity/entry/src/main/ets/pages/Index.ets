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

import { MainPage } from '../networksecurity/MainPage';

/**
 * Entry page of the sample that hosts the main navigation container.
 */
@Entry
@ComponentV2
struct Index {
  /**
   * Build the root column that fills the window and embeds MainPage.
   */
  build() {
    Column() {
      // Host the main page as the only child of the entry page.
      MainPage()
    }
    .id('id_index_page')
    .width('100%')
    .height('100%')
  }
}
