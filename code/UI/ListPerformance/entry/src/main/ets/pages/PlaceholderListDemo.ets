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
import { ListConstants } from '../utils/Constants';
import { ListDataSource, ListRowData } from '../utils/ListDataSources';
import { ListDataUtils } from '../utils/ListDataUtils';
import { PlaceholderRegistry } from '../utils/PlaceholderRegistry';

/** PlaceholderList sample page. */
@Entry
@Component
struct PlaceholderListDemo {
  @State status: string = ListDataUtils.formatPlaceholder(0, ListConstants.TOTAL);
  private registry: PlaceholderRegistry = new PlaceholderRegistry(ListConstants.TOTAL);
  private source: ListDataSource = new ListDataSource(ListConstants.TOTAL, this.registry);

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('PlaceholderListDemo');
    const loaded = this.source.loadNext();
    this.status = ListDataUtils.formatPlaceholder(loaded, ListConstants.TOTAL);
    Logger.event('PlaceholderListDemo', 'initialLoad', this.status);
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('PlaceholderListDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('PlaceholderListDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('PlaceholderListDemo');
  }

  // Load the next data batch and refresh the list.
  private loadMore(): void {
    const loaded = this.source.loadNext();
    this.status = ListDataUtils.formatPlaceholder(loaded, ListConstants.TOTAL);
    Logger.event('PlaceholderListDemo', 'loadMore', this.status);
  }

  // Restore the demo state to its initial value.
  private resetList(): void {
    this.source.reset();
    this.status = ListDataUtils.formatPlaceholder(0, ListConstants.TOTAL);
    Logger.event('PlaceholderListDemo', 'reset', this.status);
  }

  @Builder
  rowBuilder(row: ListRowData) {
    if (row.loaded) {
      Column({ space: 4 }) {
        Text(row.title)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .width('100%')
        Text(row.subtitle)
          .fontSize(12)
          .fontColor('#666666')
          .width('100%')
      }
      .width('100%')
      .height(68)
      .padding(12)
      .backgroundColor('#FFFFFF')
      .borderRadius(10)
    } else {
      Row({ space: 10 }) {
        Column()
          .width(36)
          .height(36)
          .backgroundColor('#E6E8EB')
          .borderRadius(8)
        Column({ space: 6 }) {
          Row()
            .width('70%')
            .height(12)
            .backgroundColor('#E6E8EB')
            .borderRadius(6)
          Row()
            .width('45%')
            .height(10)
            .backgroundColor('#EEF0F2')
            .borderRadius(5)
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        Text($r('app.string.placeholder_row'))
          .fontSize(11)
          .fontColor('#999999')
      }
      .width('100%')
      .height(68)
      .padding(12)
      .backgroundColor('#F7F8FA')
      .borderRadius(10)
    }
  }

  // Compose the page layout and responsive controls.
  build() {
    Column({ space: 10 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('placeholderBack')
          .onClick(() => {
            Logger.event('PlaceholderListDemo', 'back');
            router.back();
          })
        Text($r('app.string.placeholder_title'))
          .id('placeholderPageTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)

      Text($r('app.string.placeholder_hint'))
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')
        .padding({ left: 12, right: 12 })

      Row({ space: 10 }) {
        Button($r('app.string.load_more'))
          .id('loadMore')
          .onClick(() => {
            this.loadMore();
          })
        Button($r('app.string.reset'))
          .id('resetList')
          .onClick(() => {
            this.resetList();
          })
      }

      Text(this.status)
        .id('placeholderStatus')
        .fontSize(14)

      List({ space: 8 }) {
        LazyForEach(this.source, (row: ListRowData) => {
          ListItem() {
            this.rowBuilder(row)
          }
        }, (row: ListRowData) => `${row.id}-${row.loaded}`)
      }
      .id('placeholderList')
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 12, right: 12 })
      .cachedCount(6)
    }
    .width('100%')
    .height('100%')
    .padding({ bottom: 12 })
  }
}
