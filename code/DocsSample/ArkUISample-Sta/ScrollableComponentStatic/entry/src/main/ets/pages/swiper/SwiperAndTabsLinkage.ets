'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ComponentCard } from '../../common/Card';
import { common } from '@kit.AbilityKit';

import {
  Column,
  Component,
  ForEach,
  $r,
  Padding,
  IDataSource,
  Entry,
  DataChangeListener,
  SwiperController,
  TabsController,
  Text,
  Divider,
  ColumnOptions,
  Tabs,
  BarMode,
  LazyForEach,
  TextAlign,
  TabsOptions,
  BarPosition,
  TabContent,
  State,
  NavDestination,
  Swiper
} from '@kit.ArkUI';

// [Start swiper_tabs_linkage]
// xxx.ets
export class MyDataSource implements IDataSource<string> { // IDataSource强制要求声明<T>类型
  private listeners: Array<DataChangeListener> = [];
  private originDataArray: Array<string> = [];

  constructor(values: Array<string>) {
    this.originDataArray = values;
  }

  public totalCount(): int {
    return this.originDataArray.length;
  }

  public getData(index: int): string {
    return this.originDataArray[index];
  }

  notifyDataChange(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    });
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }
}

// 如需作为页面入口，请取消@Entry的注释并删除export关键字
@Entry
@Component
export struct SwiperAndTabsLinkage {
  @State fontColor: string = '#182431';
  @State selectedFontColor: string = '#007DFF';
  @State currentIndex: number = 0;
  private list: string[] = [];
  private tabsController: TabsController = new TabsController();
  private swiperController: SwiperController = new SwiperController();
  private swiperData: MyDataSource = new MyDataSource([]);
  private context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;

  aboutToAppear(): void {
    for (let i = 0; i <= 9; i++) {
      this.list.push(i.toString());
    }
    this.swiperData = new MyDataSource(this.list);
  }

  @Builder
  tabBuilder(index: number, name: string): void {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 });
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0);
    }.width('20%')
  };

  build(): void {
    // [StartExclude swiper_tabs_linkage]
    NavDestination() {
      Column({ space: 12 } as ColumnOptions) {
        ComponentCard({ title: $r('app.string.SwiperAndTabsLinkage_title') }) {
          // [EndExclude swiper_tabs_linkage]
          Column() {
            Tabs({ barPosition: BarPosition.Start, controller: this.tabsController } as TabsOptions) {
              ForEach(this.list, (value: string, index: int) => {
                // 请在resources\base\element\string.json文件中配置name为'swiper_text1' ，value为非空字符串的资源
                TabContent().tabBar(this.tabBuilder(index,
                  this.context.resourceManager.getStringByNameSync('swiper_text1') + this.list[index]));
              });
            }
            .onTabBarClick((index: int) => {
              this.currentIndex = index;
              this.swiperController.changeIndex(index, true);
            })
            .barMode(BarMode.Scrollable)
            .backgroundColor('#F1F3F5')
            .height(56)
            .width('100%')

            Swiper(this.swiperController) {
              LazyForEach(this.swiperData, (item: string) => {
                Text(item.toString())
                  .onAppear(() => {
                    console.info('onAppear ' + item.toString());
                  })
                  .onDisAppear(() => {
                    console.info('onDisAppear ' + item.toString());
                  })
                  .width('100%')
                  .height('40%')
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30);
              }, (item: string) => item);
            }
            .loop(false)
            .onSelected((index: int) => {
              console.info('onSelected:' + index);
              this.currentIndex = index;
              this.tabsController.changeIndex(index);
            })
          }

          // [StartExclude swiper_tabs_linkage]
        }
      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 } as Padding)
    }
    .backgroundColor('#f1f2f3')
    .title($r('app.string.SwiperAndTabsLinkage_title'));

    // [EndExclude swiper_tabs_linkage]
  }
}

// [End swiper_tabs_linkage]