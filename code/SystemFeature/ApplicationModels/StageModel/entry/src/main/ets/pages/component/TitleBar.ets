/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import router from '@ohos.router'
import DataShareResultSet from '@ohos.data.DataShareResultSet'
import DataShareHelper from '../../feature/DataShareHelper'
import { BookModel, getBooksFromResultSet } from '../../feature/BookModel'

@Component
export struct TitleBar {
  @Link books: Array<BookModel>;

  build() {
    Row() {
      Image($r('app.media.back'))
        .id('btnBack')
        .width(32)
        .height(32)
        .margin({ right: 40 })
        .onClick(() => {
          router.back()
        })

      Text($r('app.string.title'))
        .fontSize(16)

      Image($r('app.media.add'))
        .id('btnAdd')
        .width(40)
        .height(40)
        .margin({ left: 30 })
        .onClick(() => {
          this.add()
        })
    }
    .height('8%')
    .width('100%')
    .padding({ left: 15, right: 15 })
    .justifyContent(FlexAlign.Center)
  }

  async add() {
    let data: Promise<DataShareResultSet> = await DataShareHelper.insert();
    this.books = getBooksFromResultSet(data);
  }
}
