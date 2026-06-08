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
import { NavDestination, $r } from '@kit.ArkUI';
// [Start ObjectLinkObjectType]
import { Button, Column, Component, Entry, ObjectLink, Observed, State, Text, TextAlign } from '@kit.ArkUI';

@Observed
class Book {
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}

@Component
struct BookCard {
  @ObjectLink book: Book;

  build() {
    Column() {
      Text(`BookCard: ${this.book.name}`) // 可以观察到name的变化
        .fontSize(20)
        .margin(10)
        .textAlign(TextAlign.Center)

      Button('change book.name')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.book.name = 'C++';
        })
    }
    .width('100%')
  }
}

@Entry
@Component
struct Index {
  @State book: Book = new Book('JS');

  build() {
    Column() {
      BookCard({ book: this.book })
    }
    .width('100%')
  }
}
// [End ObjectLinkObjectType]

@Builder
export function objectLinkObjectType(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.object_link_object_type_title'))
}