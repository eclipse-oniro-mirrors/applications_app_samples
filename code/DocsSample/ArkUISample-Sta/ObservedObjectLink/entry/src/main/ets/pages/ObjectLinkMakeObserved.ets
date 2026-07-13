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
// [Start ObjectLinkMakeObserved]
import { Button, Column, Component, Entry, ObjectLink, Observed, State, Text, TextAlign, UIUtils } from '@kit.ArkUI';

interface Book {
  name: string;
}

interface Bag {
  book: Book;
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
        .onClick((e) => {
          this.book.name = 'C++';
        })
    }
    .width('100%')
  }
}

@Entry
@Component
struct Index {
  @State bag: Bag = { book: UIUtils.makeObserved({ name: 'JS' } as Book) } as Bag;

  build() {
    Column() {
      Text(`Index: ${this.bag.book.name}`) // 可以观察到name的变化
        .fontSize(20)
        .margin(10)
        .textAlign(TextAlign.Center)

      Button('change bag.book.name')
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.bag.book.name = 'TS';
        })

      BookCard({ book: this.bag.book })
    }
    .width('100%')
  }
}
// [End ObjectLinkMakeObserved]

@Builder
export function objectLinkMakeObserved(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.object_link_make_observed_title'))
}