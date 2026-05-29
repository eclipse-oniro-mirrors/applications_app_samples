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

import { ComponentAppear, ComponentDisappear, Component, State, Text, Color, TextAlign, IDataSource, DataChangeListener, Entry, Column, SwiperController, Swiper, ForEach, Row, Button } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Component
export struct SwiperPage {
  @State name: string = 'SwiperPage';
  // SwiperPage创建实例后，执行build函数之前回调aboutToAppear
  aboutToAppear(): void {
    hilog.info(0x0000, 'testTag', 'SwiperPage aboutToAppear %{public}s', this.name);
  }
  // SwiperPage析构销毁之前回调aboutToDisappear
  aboutToDisappear(): void {
    hilog.info(0x0000, 'testTag', 'SwiperPage aboutToDisappear %{public}s', this.name);
  }
  // 组件生命周期ComponentAppear，在SwiperPage创建实例后，执行build函数之前回调myAppear
  @ComponentAppear
  myAppear(): void {
    hilog.info(0x0000, 'testTag', 'SwiperPage myAppear %{public}s', this.name);
  }
  // 组件生命周期ComponentDisappear，在SwiperPage析构销毁之前回调myDisappear
  @ComponentDisappear
  myDisappear(): void {
    hilog.info(0x0000, 'testTag', 'SwiperPage myDisappear %{public}s', this.name);
  }

  build(): void {
    Text(this.name.toString())
      .width('90%')
      .height(160)
      .fontColor(Color.Black)
      .backgroundColor(0xAFEEEE)
      .textAlign(TextAlign.Center)
      .fontSize(30)
  }
}

// 用于Swiper里数据迭代的数据源
export class MyDataSource implements IDataSource<string> {
  list: string[] = [];
  constructor(list: string[]) {
    this.list = list;
  }
  totalCount(): int {
    return this.list.length;
  }
  getData(index: int): string {
    return this.list[index];
  }
  registerDataChangeListener(listener: DataChangeListener): void {}
  unregisterDataChangeListener(listener: DataChangeListener): void {}
}

@Entry
@Component
export struct SwiperExample {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])
  private list: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11']; // 创建12个SwiperPage
  @State selectedTabIndex: int = 0;
  // 组件生命周期ComponentAppear，在SwiperExample创建实例后，执行build函数之前回调myAppear
  // myAppear实现this.data初始化
  @ComponentAppear
  myAppear(): void {
    this.data = new MyDataSource(this.list);
  }

  build(): void {
    Column() {
      Swiper(this.swiperController) {
        ForEach(this.data.list, (item: string) => {
          SwiperPage({
            name: item
          })
        })
      }
      .index(this.selectedTabIndex)
      .autoPlay(false)
      .disableSwipe(true)
      .indicator(false)
      .width('100%')
      .cachedCount(2) // 以当前节点为基础，往前缓存两个节点，往后缓存两个节点
      .onChange((index) => {
        this.selectedTabIndex = index;
      })
      Row() {
        Button('showNext')
          .onClick(() => {
            // 切换到下一个SwiperPage
            this.swiperController.showNext();
          })
        Button('showPrevious')
          .onClick(() => {
            // 切换到上一个SwiperPage
            this.swiperController.showPrevious();
          })
      }
      .margin(5)
    }
    .width('100%')
    .margin({ top: 5 })
  }
}
