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

import { router, TabTitleBar, TabTitleBarMenuItem, TabTitleBarTabItem } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';

/** TabTitleBar sample page. */
@Entry
@Component
struct TabTitleBarDemo {
  @State menuCount: number = 0;
  @State widthVp: number = 0;
  private tabs: TabTitleBarTabItem[] = [
    { title: $r('app.string.tab_one') },
    { title: $r('app.string.tab_two') },
    { title: $r('app.string.tab_three') }
  ];
  private menus: TabTitleBarMenuItem[] = [
    {
      value: $r('sys.media.ohos_ic_public_share'),
      label: 'Share',
      isEnabled: true,
      action: () => {
        this.menuCount++;
        Logger.event('TabTitleBarDemo', 'menu', `${this.menuCount}`);
      }
    }
  ];

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('TabTitleBarDemo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('TabTitleBarDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('TabTitleBarDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('TabTitleBarDemo');
  }

  @Builder
  tabContentBuilder() {
    Column({ space: 8 }) {
      Text($r('app.string.tab_content_one'))
        .id('tabContent0')
        .fontSize(20)
        .fontWeight(FontWeight.Medium)
      Text('Overview of the current project')
        .fontSize(13)
        .fontColor('#666666')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)

    Column({ space: 8 }) {
      Text($r('app.string.tab_content_two'))
        .id('tabContent1')
        .fontSize(20)
        .fontWeight(FontWeight.Medium)
      Text('Detailed metrics and history')
        .fontSize(13)
        .fontColor('#666666')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)

    Column({ space: 8 }) {
      Text($r('app.string.tab_content_three'))
        .id('tabContent2')
        .fontSize(20)
        .fontWeight(FontWeight.Medium)
      Text('Project and notification settings')
        .fontSize(13)
        .fontColor('#666666')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  // Compose the page layout and responsive controls.
  build() {
    Column({ space: 12 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('tabBack')
          .onClick(() => {
            Logger.event('TabTitleBarDemo', 'back');
            router.back();
          })
        Text($r('app.string.tab_title'))
          .id('tabPageTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding({
        left: BreakpointUtils.pagePadding(this.widthVp),
        right: BreakpointUtils.pagePadding(this.widthVp),
        top: 12,
        bottom: 12
      })

      Column() {
        TabTitleBar({
          tabItems: this.tabs,
          menuItems: this.menus,
          swiperContent: this.tabContentBuilder
        })
      }
      .id('tabTitleBar')
      .width('100%')
      .layoutWeight(1)

      Text(`menu=${this.menuCount}`)
        .id('tabMenuCount')
        .fontSize(12)
        .fontColor('#666666')
        .padding({ bottom: 12 })
    }
    .width('100%')
    .height('100%')
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.widthVp = px2vp(Number(newArea.width));
    })
  }
}
