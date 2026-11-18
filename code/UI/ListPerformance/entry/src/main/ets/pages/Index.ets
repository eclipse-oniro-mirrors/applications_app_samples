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

import { router } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { RouteConstants } from '../utils/Constants';
import { DeviceInfoUtils } from '../utils/DeviceInfoUtils';

class DemoEntry {
  id: string;
  title: ResourceStr;
  description: ResourceStr;
  route: string;

  constructor(id: string, title: ResourceStr, description: ResourceStr, route: string) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.route = route;
  }
}

/** Index sample page. */
@Entry
@Component
struct Index {
  @State widthVp: number = 0;
  @State breakpoint: string = BreakpointUtils.SM;
  @State deviceInfoText: string = '';
  private lastBreakpoint: string = '';

  private demos: DemoEntry[] = [
    new DemoEntry('cardPlaceholder', $r('app.string.hub_placeholder_title'), $r('app.string.hub_placeholder_desc'),
      RouteConstants.PLACEHOLDER),
    new DemoEntry('cardPrefetch', $r('app.string.hub_prefetch_title'), $r('app.string.hub_prefetch_desc'),
      RouteConstants.PREFETCH)
  ];

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('Index');
    this.deviceInfoText = DeviceInfoUtils.screenInfo();
    Logger.event('Index', 'deviceInfo', this.deviceInfoText);
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('Index');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('Index');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('Index');
  }

  private openDemo(item: DemoEntry): void {
    Logger.event('Index', 'openDemo', item.route);
    router.pushUrl({ url: item.route }).catch((error: Error) => {
      Logger.error(`open demo failed: ${JSON.stringify(error)}`);
    });
  }

  // Compose the page layout and responsive controls.
  build() {
    Column() {
      Text($r('app.string.page_title'))
        .id('pageTitle')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .padding({
          left: BreakpointUtils.pagePadding(this.widthVp),
          right: BreakpointUtils.pagePadding(this.widthVp), top: 16 })

      Text(this.deviceInfoText)
        .id('deviceInfoText')
        .fontSize(11)
        .fontColor('#999999')
        .width('100%')
        .padding({
          left: BreakpointUtils.pagePadding(this.widthVp),
          right: BreakpointUtils.pagePadding(this.widthVp) })

      Row({ space: 8 }) {
        Text($r('app.string.breakpoint_label'))
          .fontSize(14)
          .fontColor('#666666')
        Text(BreakpointUtils.describe(this.widthVp))
          .id('breakpointText')
          .fontSize(14)
          .fontColor('#666666')
      }
      .width('100%')
      .padding({
          left: BreakpointUtils.pagePadding(this.widthVp),
          right: BreakpointUtils.pagePadding(this.widthVp), bottom: 8 })

      Grid() {
        ForEach(this.demos, (item: DemoEntry) => {
          GridItem() {
            Column({ space: 6 }) {
              Text(item.title)
                .fontSize(18)
                .fontWeight(FontWeight.Medium)
                .width('100%')
              Text(item.description)
                .fontSize(13)
                .fontColor('#666666')
                .width('100%')
            }
            .id(item.id)
            .padding(16)
            .width('100%')
            .backgroundColor('#F1F3F5')
            .borderRadius(12)
            .onClick(() => {
              this.openDemo(item);
            })
          }
        }, (item: DemoEntry) => item.id)
      }
      .columnsTemplate(BreakpointUtils.gridTemplate(this.widthVp))
      .columnsGap(12)
      .rowsGap(12)
      .layoutWeight(1)
      .width('100%')
      .padding({
        left: BreakpointUtils.contentPadding(this.widthVp),
        right: BreakpointUtils.contentPadding(this.widthVp),
        bottom: 16
      })
    }
    .width('100%')
    .height('100%')
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.widthVp = px2vp(Number(newArea.width));
      const nextBreakpoint = BreakpointUtils.resolve(this.widthVp);
      if (nextBreakpoint !== this.lastBreakpoint) {
        this.lastBreakpoint = nextBreakpoint;
        this.breakpoint = nextBreakpoint;
        Logger.event('Index', 'breakpointChanged', BreakpointUtils.describe(this.widthVp));
      }
    })
  }
}
