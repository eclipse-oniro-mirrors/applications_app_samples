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

import { BasicPrefetcher, router } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { ListConstants } from '../utils/Constants';
import { getSharedPrefetcher, ListRowData, PrefetchDataSource } from '../utils/ListDataSources';
import { ListDataUtils } from '../utils/ListDataUtils';
import { PlaceholderRegistry } from '../utils/PlaceholderRegistry';
import { PrefetchUtils } from '../utils/PrefetchUtils';

/** PrefetchList sample page. */
@Entry
@Component
struct PrefetchListDemo {
  @State status: string = ListDataUtils.formatPrefetch(0, 20, ListConstants.TOTAL);
  private registry: PlaceholderRegistry = new PlaceholderRegistry(ListConstants.TOTAL);
  private source: PrefetchDataSource = new PrefetchDataSource(ListConstants.TOTAL, this.registry,
    (prefetched: number, loaded: number, total: number) => {
      this.status = ListDataUtils.formatPrefetch(prefetched, loaded, total);
    });
  private prefetcher: BasicPrefetcher = getSharedPrefetcher();

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('PrefetchListDemo');
    this.prefetcher.setDataSource(this.source);
    this.source.loadNext();
    this.status = ListDataUtils.formatPrefetch(0, this.source.loadedCount(), ListConstants.TOTAL);
    Logger.event('PrefetchListDemo', 'initialLoad', this.status);
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('PrefetchListDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('PrefetchListDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('PrefetchListDemo');
  }

  private clearStats(): void {
    this.source.clearStats();
    Logger.event('PrefetchListDemo', 'clearStats');
  }

  @Builder
  rowBuilder(row: ListRowData) {
    Column({ space: 4 }) {
      Text(row.title)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .width('100%')
      Text(row.subtitle)
        .fontSize(12)
        .fontColor(row.loaded ? '#666666' : '#BBBBBB')
        .width('100%')
    }
    .width('100%')
    .height(68)
    .padding(12)
    .backgroundColor(row.loaded ? '#FFFFFF' : '#F7F8FA')
    .borderRadius(10)
  }

  // Compose the page layout and responsive controls.
  build() {
    Column({ space: 10 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('prefetchBack')
          .onClick(() => {
            Logger.event('PrefetchListDemo', 'back');
            router.back();
          })
        Text($r('app.string.prefetch_title'))
          .id('prefetchPageTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)

      Text($r('app.string.prefetch_hint'))
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')
        .padding({ left: 12, right: 12 })

      Row({ space: 10 }) {
        Button($r('app.string.prefetch_one'))
          .id('prefetchNext')
          .onClick(() => {
            this.source.prefetchNext();
          })
        Button($r('app.string.prefetch_clear'))
          .id('prefetchClear')
          .onClick(() => {
            this.clearStats();
          })
      }

      Text(this.status)
        .id('prefetchStatus')
        .fontSize(14)

      List({ space: 8 }) {
        LazyForEach(this.source, (row: ListRowData) => {
          ListItem() {
            this.rowBuilder(row)
          }
        }, (row: ListRowData) => `${row.id}-${row.loaded}`)
      }
      .id('prefetchList')
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 12, right: 12 })
      .cachedCount(6)
      .onScrollIndex((start: number, end: number) => {
        const indices = start > 0 ? PrefetchUtils.nextIndices(end, 3, ListConstants.TOTAL) : [];
        for (let i = 0; i < indices.length; i++) {
          this.source.prefetch(indices[i]);
        }
        Logger.event('PrefetchListDemo', 'visibleArea',
          `${PrefetchUtils.formatWindow(start, end, indices.length)}`);
      })
    }
    .width('100%')
    .height('100%')
    .padding({ bottom: 12 })
  }
}
