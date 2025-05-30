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

import DataShareResultSet from '@ohos.data.DataShareResultSet';
import { BookModel, getBooksFromResultSet } from '../../feature/BookModel';
import DateShareHelper from '../../feature/DataShareHelper';
import Logger from '../../util/Logger';

const TAG: string = 'UpdateData';

@CustomDialog
export struct UpdateDataDialog {
  @Link books: Array<BookModel>;
  private book: BookModel = new BookModel();
  controller?: CustomDialogController;

  build() {
    Column() {
      Text($r('app.string.book_name'))
        .fontWeight(FontWeight.Bold)
        .fontSize(22)
        .margin({ top: 20 })
        .fontColor(Color.Black)
      TextInput({ placeholder: 'input name', text: this.book.name })
        .id('bookNameInput')
        .type(InputType.Normal)
        .placeholderColor(Color.Gray)
        .fontSize(19)
        .margin({ top: 10, left: 12, right: 12 })
        .onChange((value: string) => {
          this.book.name = value;
        })

      Text($r('app.string.book_intro'))
        .fontWeight(FontWeight.Bold)
        .fontSize(22)
        .fontColor(Color.Black)
        .margin({ top: 20 })
      TextInput({ placeholder: 'input introduction', text: this.book.introduction })
        .id('bookNameIntro')
        .type(InputType.Normal)
        .placeholderColor(Color.Gray)
        .fontSize(20)
        .margin({ left: 12, right: 12, top: 10 })
        .onChange((value: string) => {
          this.book.introduction = value;
        })

      Blank()

      Row() {
        Text($r('app.string.no'))
          .fontSize(21)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            this.controller?.close()
          })
        Text($r('app.string.ok'))
          .fontSize(21)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            this.update();
          })
      }
      .width('100%')
    }
    .width('100%')
    .height(300)
  }

  async update() {
    Logger.info(TAG, 'updateBook start');
    let data: Promise<DataShareResultSet> = await DateShareHelper.updateBook(this.book);
    this.books = getBooksFromResultSet(data);
    this.controller?.close();
  }
}