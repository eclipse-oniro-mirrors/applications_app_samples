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

import {
  $r,
  Builder,
  Button,
  Color,
  Column,
  Component,
  Entry,
  FlexAlign,
  ForEach,
  Image,
  ImageFit,
  Margin,
  Padding,
  RelativeContainer,
  Row,
  Stack,
  Text,
  TextInput
} from '@ohos.arkui.component';
import { Observed, State } from '@ohos.arkui.stateManagement';

const LAYOUT_WEIGHT: number = 1; // 自动分配剩余空间
const LIST_LENGTH: number = 5;
const MAX_LINE: number = 1;
const SEARCH_INPUT_ID: string = 'searchInput'; // 搜索框ID

// 列表结构对象
@Observed
export class ListConstruction {
  public id: number; // 唯一id
  public title: string; // 列表标题
  public content: string; // 列表内容

  constructor(id: number, title: string, content: string) {
    this.id = id;
    this.title = title;
    this.content = content;
  }
}

@Entry
@Component
export struct SearchSwiperComponent {
  @State listData: Array<ListConstruction> = new Array<ListConstruction>();
  // 搜索框内容
  @State textData: string = '';

  aboutToAppear(): void {
    // 构造list数据
    for (let index = 0; index < LIST_LENGTH; index++) {
      const temDate: ListConstruction =
        new ListConstruction((index + 1), `新闻标题${index + 1}`, `新闻内容${index + 1}`);
      this.listData.push(temDate);
    }
  }

  build() {
    Column() {
      Row() {
        Stack() {
          TextInput()
            .onChange((data) => {
              this.textData = data;
            })
            .id(SEARCH_INPUT_ID)
            .maxLines(MAX_LINE)
            .width('100%')
            .height(40)
        }
        .layoutWeight(LAYOUT_WEIGHT)
        .height(100)

        Button('搜索')
          .width(60)
          .margin({ left: 10 } as Margin)
          .height(40)
          .fontSize(14)
      }
      .padding({ left: 30, right: 30 } as Padding)

      Column() {
        this.NewsItemView(this.listData[0]);
      }.padding({ left: 30, right: 30 } as Padding)

      Column() {
        this.NewsItemView(this.listData[1]);
      }.padding({ left: 30, right: 30 } as Padding)

      Column() {
        this.NewsItemView(this.listData[2]);
      }.padding({ left: 30, right: 30 } as Padding)

      Column() {
        this.NewsItemView(this.listData[3]);
      }.padding({ left: 30, right: 30 } as Padding)

      Column() {
        this.NewsItemView(this.listData[4]);
      }.padding({ left: 30, right: 30 } as Padding)
    }.width('100%').height('100%')
  }

  // 新闻list布局样式
  @Builder
  NewsItemView(listData: ListConstruction) {
    RelativeContainer() {
      Row() {
        Image($r('app.media.strawberry'))
          .objectFit(ImageFit.Contain)
          .width('40%')
          .height('90%')
          .backgroundColor('#F1F3F5')
          .borderRadius(10)
          .id('image')
        Column() {
          Text(listData.title)
            .fontSize(15)
            .fontColor(Color.Black)
            .id('videoName')
            .margin({ left: 10 } as Margin)

          Text(listData.content)
            .fontSize(13)
            .fontColor(Color.Gray)
            .id('authorName')
            .margin({ left: 10, top: 25 } as Margin)
        }
      }
    }
    .width('100%')
    .height(100)
  }
}
